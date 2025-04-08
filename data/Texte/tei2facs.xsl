<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//pb"/>
    </xsl:template>
    
    <xsl:template match="pb">
        <xsl:value-of select="./data(@facs)"/>
    </xsl:template>
    
    <xsl:template match="text()"/>
    
</xsl:stylesheet>