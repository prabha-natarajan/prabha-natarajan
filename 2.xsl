<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="name">
        <h1>CD Collection</h1>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="/">
        <xsl:call-template name="name"></xsl:call-template>
    </xsl:template>
    
    <xsl:template match="cd">
        <p>
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="artist"/>
            <xsl:apply-templates select="country" mode="red"/>
            
        </p>
    </xsl:template>
    
   <xsl:template match="country" mode="red">
        <div style="color:red">
            <xsl:value-of select="."/>
                    </div>
    </xsl:template>
    
    <xsl:template match="country" mode="blue">
        <h2 style="color:blue">
            <xsl:value-of select="."/>
                    </h2>
    </xsl:template>
    <xsl:template match="title">
        <xsl:value-of select="."/>  
    </xsl:template>

    <xsl:template match="artist">
        <xsl:value-of select="."/>  
    </xsl:template>
    
    <xsl:template match="country">
        <xsl:value-of select="."/>  
    </xsl:template>
</xsl:stylesheet>