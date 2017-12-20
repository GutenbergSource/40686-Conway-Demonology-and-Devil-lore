<!DOCTYPE xsl:stylesheet [

    <!ENTITY ndash "&#x2013;">
    <!ENTITY mdash "&#x2014;">
    <!ENTITY euml "&#x00EB;">
    <!ENTITY aacute "&#x00E1;">
    <!ENTITY tdotb "&#x1E6D;">

]>
<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="urn:stylesheet-functions"
    exclude-result-prefixes="f xs"
    version="2.0">


<xsl:include href="merge-documents.xsl"/>


<xsl:variable name="volume1" select="f:import-document('Volume 1/Processed/Demonology1.xml', 'v1', 'v2')"/>
<xsl:variable name="volume2" select="f:import-document('Volume 2/Processed/Demonology2.xml', 'v2', 'v1')"/>


<xsl:template match="/">
    <TEI.2 lang="en">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title>Demonology and Devil-lore</title>
                <author>Moncure Daniel Conway (1832&ndash;1907)</author>
                <respStmt><resp>Transcription</resp><name>Jeroen Hellingman</name></respStmt>
            </titleStmt>
            <publicationStmt>
                <publisher>Project Gutenberg</publisher>
                <pubPlace>Urbana, Illinois, USA.</pubPlace>
                <idno type="LCCN">16489728</idno>
                <idno type="OLW">OL8522799W</idno>
                <idno type="OCLC">2604099</idno>
                <idno type="PGclearance">20101129134158conway</idno>
                <idno type="epub-id">urn:uuid:fab75cf1-f7a9-4208-9949-b231c2a2fc38</idno>
                <idno type="PGSrc">40686-Conway-Demonology-and-Devil-lore</idno>
                <idno type="PGnum">40686</idno>
                <date>2012-09-06</date>

                <xsl:apply-templates select="$volume1//teiHeader/fileDesc/publicationStmt/availability"/>

            </publicationStmt>
            <sourceDesc>
                <bibl>
                <author>Moncure Daniel Conway</author>
                <title>Demonology and Devil-lore</title>
                <date>1879</date>
                </bibl>
            </sourceDesc>
        </fileDesc>

        <xsl:apply-templates select="$volume1//teiHeader/encodingDesc"/>
        <xsl:apply-templates select="$volume1//teiHeader/profileDesc"/>

        <revisionDesc>
            <list type="simple">
                <item>2012-08-31 started.</item>
            </list>
        </revisionDesc>
    </teiHeader>
    <text rend="stylesheet(style/classic.css)">
        <front id="frontmatter">
            <div1 id="cover" type="Cover">
                <p>
                    <figure id="cover-image" rend="image(images/new-cover.jpg)">
                        <figDesc>Newly Designed Front Cover.</figDesc>
                    </figure>
                </p>
            </div1>

            <xsl:apply-templates select="$volume1//front/div1[@id='v1titlepage']"/>
            <xsl:apply-templates select="$volume1//front/titlePage"/>
            <xsl:apply-templates select="$volume1//front/div1[@id='v1copyright' or @id='v1preface']"/>

            <div1 id="toc" type="Contents">
                <head>Contents</head>

                <div2 type="Contents">
                    <head>Volume I.</head>
                    <xsl:apply-templates select="$volume1//front/div1[@id='v1toc']/*[not(self::head)]"/>
                </div2>
                <div2 type="Contents">
                    <head>Volume II.</head>
                    <xsl:apply-templates select="$volume2//front/div1[@id='v2toc']/*[not(self::head)]"/>
                </div2>
            </div1>

            <div1 id="loi" type="Contents">
                <head>List of Illustrations</head>

                <div2 type="Contents">
                    <head>Volume I.</head>
                    <xsl:apply-templates select="$volume1//front/div1[@id='v1loi']/*[not(self::head)]"/>
                </div2>
                <div2 type="Contents">
                    <head>Volume II.</head>
                    <xsl:apply-templates select="$volume2//front/div1[@id='v2loi']/*[not(self::head)]"/>
                </div2>
            </div1>
        </front>
        <body>
            <xsl:apply-templates select="$volume1//body/div0"/>
            <xsl:apply-templates select="$volume2//body/div0"/>
        </body>
        <back id="backmatter">
            <xsl:apply-templates select="$volume1//back/div1"/>
            <xsl:apply-templates select="$volume2//back/div1"/>

            <div1 id="gentoc">
                <divGen id="genToc" type="toc"/>
            </div1>

            <divGen type="Colophon"/>
        </back>
    </text>
    </TEI.2>
</xsl:template>


<xsl:template match="ab[@id='v1volumetitle']"/>


<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
</xsl:template>


</xsl:transform>
