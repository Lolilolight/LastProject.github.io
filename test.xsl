<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template match="/">
    <HTML>
      <BODY>
        Test
        <xsl:apply-templates/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
