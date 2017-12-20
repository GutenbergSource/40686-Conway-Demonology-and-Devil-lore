<!DOCTYPE xsl:stylesheet>

<xsl:transform
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="urn:stylesheet-functions"
    exclude-result-prefixes="f xs"
    version="2.0">


<xsl:function name="f:import-document">
    <xsl:param name="location" as="xs:string"/>
    <xsl:param name="prefix" as="xs:string"/>
    <xsl:param name="keepPrefix" as="xs:string"/>

    <xsl:apply-templates select="document($location)" mode="import-document">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="keepPrefix" select="$keepPrefix"/>
    </xsl:apply-templates>
</xsl:function>


<xsl:function name="f:combine-id">
    <xsl:param name="id" as="xs:string"/>
    <xsl:param name="prefix" as="xs:string"/>
    <xsl:param name="keepPrefix" as="xs:string"/>

    <xsl:choose>
        <xsl:when test="starts-with($id, $keepPrefix)">
            <xsl:value-of select="$id"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="concat($prefix, $id)"/>
        </xsl:otherwise>
     </xsl:choose>
</xsl:function>


<xsl:template match="@id" mode="import-document">
    <xsl:param name="prefix" as="xs:string"/>
    <xsl:param name="keepPrefix" as="xs:string"/>

    <xsl:attribute name="id">
        <xsl:value-of select="f:combine-id(., $prefix, $keepPrefix)"/>
    </xsl:attribute>
</xsl:template>


<xsl:template match="@target" mode="import-document">
    <xsl:param name="prefix" as="xs:string"/>
    <xsl:param name="keepPrefix" as="xs:string"/>

    <xsl:attribute name="target">
        <xsl:value-of select="f:combine-id(., $prefix, $keepPrefix)"/>
    </xsl:attribute>
</xsl:template>


<xsl:template match="node()|@*" mode="import-document">
    <xsl:param name="prefix" as="xs:string"/>
    <xsl:param name="keepPrefix" as="xs:string"/>

    <xsl:copy>
        <xsl:apply-templates select="node()|@*" mode="import-document">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="keepPrefix" select="$keepPrefix"/>
        </xsl:apply-templates>
    </xsl:copy>
</xsl:template>


</xsl:transform>
