<xsl:stylesheet version="1.0"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="tei"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:key name="ALL" use="1" 
    match="tei:elementSpec|tei:macroSpec|tei:classSpec|tei:moduleSpec"/>
  <xsl:template match="/">
    <TEI xmlns="http://www.tei-c.org/ns/1.0">
      <xsl:apply-templates select="tei:TEI/tei:teiHeader"/>
      <xsl:apply-templates select="key('ALL',1)"/>
    </TEI>
  </xsl:template>
  
  <xsl:template match="@*|text()|comment()|processing-instruction()">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  
  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates 
	  select="*|@*|processing-instruction()|comment()|text()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>