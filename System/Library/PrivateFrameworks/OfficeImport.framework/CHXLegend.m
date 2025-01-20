@interface CHXLegend
+ (id)chdLegendEntryFromXmlLegendEntryElement:(_xmlNode *)a3 defaultFont:(id)a4 state:(id)a5;
+ (id)chdLegendFromXmlLegendElement:(_xmlNode *)a3 state:(id)a4;
+ (int)chdLegendPositionFromXmlLegendPositionElement:(_xmlNode *)a3;
+ (void)setDefaultLegendBounds:(id)a3 legendPosition:(int)a4;
@end

@implementation CHXLegend

+ (id)chdLegendFromXmlLegendElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [CHDLegend alloc];
  v8 = [v6 resources];
  v9 = [(CHDLegend *)v7 initWithResources:v8];

  v10 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:v10 element:a3 state:v6];
  v11 = [v6 autoStyling];
  [v11 resolveLegendGraphicProperties:v10];

  [(CHDLegend *)v9 setGraphicProperties:v10];
  v12 = [v6 drawingState];
  v13 = [v12 OAXChartNamespace];
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "overlay");

  if (v14) {
    [(CHDLegend *)v9 setIsOverlay:CXRequiredBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")];
  }
  v15 = [v6 drawingState];
  v16 = [v15 OAXChartNamespace];
  uint64_t v17 = OCXFindChild(a3, v16, "legendPos");

  -[CHDLegend setLegendPosition:](v9, "setLegendPosition:", [a1 chdLegendPositionFromXmlLegendPositionElement:v17]);
  v18 = [v6 drawingState];
  v19 = [v18 OAXChartNamespace];
  uint64_t v20 = OCXFindChild(a3, v19, "txPr");

  if (v20)
  {
    v21 = objc_alloc_init(OADTextBody);
    v22 = [v6 drawingState];
    +[OAXTextBody readTextBodyFromXmlNode:v20 textBody:v21 drawingState:v22];

    v23 = +[CHXFont edFontWithOadTextBody:v21 state:v6];
    [(CHDLegend *)v9 setFont:v23];
    if ([(OADTextBody *)v21 paragraphCount])
    {
      v24 = [(OADTextBody *)v21 firstParagraphEffects];
      v25 = +[OAXEffect updateIncomingEffects:v24];

      [(CHDLegend *)v9 setLabelEffects:v25];
    }
  }
  else
  {
    v23 = 0;
  }
  for (i = OCXFirstChildNamed(a3, (xmlChar *)"legendEntry"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"legendEntry"))
  {
    v27 = [(CHDLegend *)v9 legendEntries];
    v28 = [a1 chdLegendEntryFromXmlLegendEntryElement:i defaultFont:v23 state:v6];
    [v27 addObject:v28];
  }
  return v9;
}

+ (int)chdLegendPositionFromXmlLegendPositionElement:(_xmlNode *)a3
{
  if (a3)
  {
    v3 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    if ([v3 isEqualToString:@"b"])
    {
      int v4 = 1;
    }
    else if ([v3 isEqualToString:@"tr"])
    {
      int v4 = 5;
    }
    else
    {
      if (([v3 isEqualToString:@"l"] & 1) == 0)
      {
        if (([v3 isEqualToString:@"r"] & 1) == 0)
        {
          if ([v3 isEqualToString:@"t"])
          {
            int v4 = 4;
            goto LABEL_14;
          }
          +[TCMessageException raise:TCInvalidFileFormatMessage];
        }
        int v4 = 3;
        goto LABEL_14;
      }
      int v4 = 2;
    }
LABEL_14:

    return v4;
  }
  return 3;
}

+ (void)setDefaultLegendBounds:(id)a3 legendPosition:(int)a4
{
  id v10 = a3;
  v5 = (double *)MEMORY[0x263F001A8];
  id v6 = (double *)(MEMORY[0x263F001A8] + 16);
  v7 = (double *)(MEMORY[0x263F001A8] + 8);
  v8 = (double *)((char *)&unk_238EDF240 + 8 * a4 - 8);
  if ((a4 - 1) > 4)
  {
    v8 = (double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    v5 = (double *)((char *)&unk_238EDF1C8 + 8 * a4 - 8);
    v7 = (double *)((char *)&unk_238EDF1F0 + 8 * a4 - 8);
    id v6 = (double *)((char *)&unk_238EDF218 + 8 * a4 - 8);
  }
  v9 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", *v5 / 4000.0, *v7 / 4000.0, *v6 / 4000.0, *v8 / 4000.0);
  [v10 setOrientedBounds:v9];
}

+ (id)chdLegendEntryFromXmlLegendEntryElement:(_xmlNode *)a3 defaultFont:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [CHDLegendEntry alloc];
  id v10 = [v8 resources];
  v11 = [(CHDLegendEntry *)v9 initWithResources:v10];

  v12 = [v8 drawingState];
  v13 = [v12 OAXChartNamespace];
  v14 = OCXFindRequiredChild(a3, v13, (xmlChar *)"idx");

  [(CHDLegendEntry *)v11 setEntryIndex:CXRequiredUnsignedLongAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")];
  v15 = [v8 drawingState];
  v16 = [v15 OAXChartNamespace];
  uint64_t v17 = OCXFindChild(a3, v16, "txPr");

  if (v17
    && (+[CHXFont edFontFromXmlTextPropertiesElement:v17 state:v8], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(CHDLegendEntry *)v11 setFont:v18];
  }
  else
  {
    if (v7) {
      [(CHDLegendEntry *)v11 setFont:v7];
    }
    v18 = 0;
  }

  return v11;
}

@end