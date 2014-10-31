<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:import href="menu.xsl"/>
    <xsl:import href="footer.xsl"/>
    <xsl:import href="projects-state.xsl"/>


    <xsl:output method="html" />

    <xsl:variable name="file"><xsl:value-of select="/page/src"/></xsl:variable>

    <xsl:variable name="lang" >
        <xsl:choose>
            <xsl:when test="/page/lang">
                <xsl:value-of select="/page/lang"/>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:value-of select="'en'" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:template match="/page/src">
        <xsl:for-each select="document(concat( $file, '/index.xml') )">
            <xsl:apply-templates select="/page/content"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="/page/menu" />
    <xsl:template match="/page/lang" />

    <xsl:template match="/page/content">
        <HTML>
            <HEAD>
                <LINK rel="stylesheet" type="text/css" href="/css/structure.css"/>
                <TITLE>Last Project</TITLE>
                <LINK rel="icon" type="image/png" href="img/banniere_LE_crush.png" />
            </HEAD>
            <BODY>

                <DIV id="hide-header"></DIV>
                <DIV id="menu-div"><xsl:call-template name="menu"/></DIV>
                <DIV id="content-zone">
                    <DIV id="content"><xsl:apply-templates/></DIV>
                </DIV>
                <FOOTER>
                    <xsl:call-template name="footer"/>
                </FOOTER>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="html">
        <xsl:copy-of select="." disable-output-escaping="yes" />
    </xsl:template>

    <xsl:template match="import-module">
        <xsl:variable name="module-name">
            <xsl:value-of select="current()"/>
        </xsl:variable>
        ?<xsl:value-of select="$module-name" />?
        <xsl:call-template name="$module-name" />
    </xsl:template>

</xsl:stylesheet>
