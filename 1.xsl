<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
        <xsl:template name="name">
            <h2>PLANT DETAILS</h2>
        </xsl:template>
    <xsl:template match="/">
        <xsl:call-template name="name"/>
        <html>
            <table border="1">
            <body>
                <tr color="Orange">
                    <th>COMMON</th>
                    <th>BOTANICAL</th>
                    <th>ZONE</th>
                </tr>
                <xsl:apply-templates/>
            </body>
            </table>
        </html>
    </xsl:template>
    <xsl:template match="//PLANT">
        <tr>
        <xsl:apply-templates select="COMMON"/>
        <xsl:apply-templates select="BOTANICAL"/>
        <xsl:apply-templates select="ZONE"/>
        </tr>
    </xsl:template>
    <xsl:template match="//PLANT" priority="2">
        <tr color="yellow">
            <xsl:apply-templates select="COMMON"/>
            <xsl:apply-templates select="BOTANICAL"/>
            <xsl:apply-templates select="ZONE [starts-with(.,'3')]" mode="Highlight"/>
            <xsl:apply-templates select="ZONE [starts-with(.,'4')]" mode="Normal"/>
            
        </tr>
    </xsl:template>
    
    <xsl:template match="//PLANT" priority="3">
        <tr color="blue">
            <xsl:apply-templates select="COMMON"/>
            <xsl:apply-templates select="BOTANICAL"/>
            <xsl:apply-templates select="ZONE [starts-with(.,'3')]" mode="Highlight"/>
            <xsl:apply-templates select="ZONE [starts-with(.,'4')]" mode="Normal"/>
            
        </tr>
    </xsl:template>
    
    <xsl:template match="COMMON">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    <xsl:template match="BOTANICAL">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    <xsl:template match="ZONE" mode="Highlight">
        <td color="yellow"><xsl:value-of select="."/>- Mode REF</td>
    </xsl:template>
    <xsl:template match="ZONE" mode="Normal">
        <td color="green"><xsl:value-of select="."/> - Mode REF</td>
    </xsl:template>
</xsl:stylesheet>