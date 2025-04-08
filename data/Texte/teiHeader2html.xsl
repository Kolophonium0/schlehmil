<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="TEI">
        <html>
           <head>
               <style>
                   .deletion{
                    text-decoration: strike-through;
                   }
                   .addition{
                    color: green;
                   }
                   .person{
                    color: blue;
                   }
                   .place{
                   color: blue;
                   }
                   .textPart{
                    margin-top: 2rem;
                    border-top: 1px solid black;
                    padding-left: 0.5rem;
                    background-color: light-grey;
                   }
                   h2.chaptertitle{
                    font-size: 1.5rem;
                    padding-top: 0.5rem;
                    color: green;
                   }
                   .front{
                    background-color: ligt-blue;
                   }
                   h1.objTitle{
                    font-size: 2em;
                    text-decoration: bold;
                    padding-top: 4em;
                   }
                   .titlePage{
                    min-height: 50vh;
                    min-width: 80vw;
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                    gap: 2em;
                   }
                   .byline{
                    font-size: 1.7em;
                    color: gray;
                   }
                   p{
                   text-indent: 0.5em;
                   }
               </style>
           </head>
            <body>
                <div class="content">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="titlePage">
        <div class="titlePage">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="titlePart[@type='main']">
        <h1 class="objTitle">
           <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="byline">
        <div class="byline">
            <xsl:apply-templates/>
        </div>    
    </xsl:template>
    
    <xsl:template match="front">
        <div class="textPart front">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div[type='chapter']">
        <div class="textPart">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="persName">
        <span class="person" data-register="person" data-register-id="{@key}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="placeName">
        <span class="place" data-register="place" data-register-id="{@key}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="pb">
        <div class="page">
            <xsl:text>//</xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="subst">
        <span class="substitution">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="del">
        <strike>
            <xsl:apply-templates/>
        </strike>
    </xsl:template>
    
    <xsl:template match="add">
        <span class="addition">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="head">
        <h2 class="chaptertitle">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>