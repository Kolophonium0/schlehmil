<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="TEI">
        <div class="register">
            <div class="registerHeader">
                <xsl:apply-templates select="teiHeader"/>
            </div>
            <ul>
                <xsl:apply-templates select="./text"/>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="title"/>

    <xsl:template match="publicationStmt/p">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="sourceDesc/p">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="person">
        <li id="{@xml:id}">
            <h3 class="_h3">
                <xsl:value-of select="./persName[@type = 'reg']"/>
            </h3>
            <xsl:apply-templates select="./idno"/>
            <div class="entry">
                <span class="label">
                    <xsl:text>Art: </xsl:text>
                </span>
                <span>
                    <xsl:value-of select="@role"/>
                </span>
            </div>
            <xsl:choose ><xsl:when test="./persName[@type='alt']"><div class="entry"><span class="label">
                <xsl:text>Alternative Schreibungen: </xsl:text>
            </span>
            <ul>
                <xsl:for-each select=".//persName[@type = 'alt']">
                    <li>
                        <xsl:apply-templates select="."/>
                    </li>
                </xsl:for-each>
            </ul></div></xsl:when>
            <xsl:otherwise/>
            </xsl:choose>
        </li>
    </xsl:template>
    
    <xsl:template match="place">
        <li id="{@xml:id}">
            <h3 class="_h3">
                <xsl:value-of select="./placeName[@type = 'reg']"/>
            </h3>
            <xsl:apply-templates select="./idno"/>
            <xsl:choose ><xsl:when test="./placeName[@type='alt']"><div class="entry"><span class="label">
                <xsl:text>Alternative Schreibungen: </xsl:text>
            </span>
                <ul>
                    <xsl:for-each select=".//placeName[@type = 'alt']">
                        <li>
                            <xsl:apply-templates select="."/>
                        </li>
                    </xsl:for-each>
                </ul></div></xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </li>
    </xsl:template>
    
    <xsl:template match="item">
        <li id="{@xml:id}">
            <h3 class="_h3">
                <xsl:value-of select="./label[@type = 'reg']"/>
            </h3>
            <xsl:apply-templates select="desc"/>
        </li>
    </xsl:template>
    
    <xsl:template match="roleName">
        <xsl:text> / </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="desc">
        <div class="desc"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="ref">
        <a href="{@target}"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" height="1em" width="1em"><g id="external-link"><path d="M18,20.75H6A2.75,2.75,0,0,1,3.25,18V6A2.75,2.75,0,0,1,6,3.25h6a.75.75,0,0,1,0,1.5H6A1.25,1.25,0,0,0,4.75,6V18A1.25,1.25,0,0,0,6,19.25H18A1.25,1.25,0,0,0,19.25,18V12a.75.75,0,0,1,1.5,0v6A2.75,2.75,0,0,1,18,20.75Z"/><path d="M20,8.75A.76.76,0,0,1,19.25,8V4.75H16a.75.75,0,0,1,0-1.5h4a.76.76,0,0,1,.75.75V8A.76.76,0,0,1,20,8.75Z"/><path d="M13.5,11.25A.74.74,0,0,1,13,11,.75.75,0,0,1,13,10l6.5-6.5a.75.75,0,1,1,1.06,1.06L14,11A.74.74,0,0,1,13.5,11.25Z"/></g></svg></a>
    </xsl:template>
    
    <xsl:template match="idno">
        <div class="links">
            <a href="{./text()}">
                <xsl:apply-templates/>
            </a>
        </div>
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
