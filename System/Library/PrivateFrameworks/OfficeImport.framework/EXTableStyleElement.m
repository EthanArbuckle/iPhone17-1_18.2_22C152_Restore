@interface EXTableStyleElement
+ (id)edTableStyleElementFromXmlTableStyleElement:(_xmlNode *)a3 state:(id)a4;
+ (int)edStyleTableTypeFromXmlStyleTableType:(id)a3;
@end

@implementation EXTableStyleElement

+ (id)edTableStyleElementFromXmlTableStyleElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [EDTableStyleElement alloc];
    v8 = [v6 resources];
    v9 = [(EDTableStyleElement *)v7 initWithResources:v8];

    id v16 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v16);
    id v10 = v16;
    -[EDTableStyleElement setType:](v9, "setType:", [a1 edStyleTableTypeFromXmlStyleTableType:v10]);
    unint64_t v15 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"size", &v15)) {
      [(EDTableStyleElement *)v9 setBandSize:v15];
    }
    uint64_t v14 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dxfId", &v14))
    {
      int v11 = [v6 isPredefinedDxfsBeingRead];
      uint64_t v12 = v14;
      if (v11) {
        uint64_t v12 = --v14;
      }
      [(EDTableStyleElement *)v9 setDifferentialStyleWithIndex:v12];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)edStyleTableTypeFromXmlStyleTableType:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_58;
  }
  if (([v3 isEqualToString:@"wholeTable"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"headerRow"])
    {
      int v5 = 2;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"totalRow"])
    {
      int v5 = 3;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstColumn"])
    {
      int v5 = 4;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"lastColumn"])
    {
      int v5 = 5;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstRowStripe"])
    {
      int v5 = 6;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"secondRowStripe"])
    {
      int v5 = 7;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstColumnStripe"])
    {
      int v5 = 8;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"secondColumnStripe"])
    {
      int v5 = 9;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstHeaderCell"])
    {
      int v5 = 10;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"lastHeaderCell"])
    {
      int v5 = 11;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstTotalCell"])
    {
      int v5 = 12;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"lastTotalCell"])
    {
      int v5 = 13;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstSubtotalColumn"])
    {
      int v5 = 15;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"secondSubtotalColumn"])
    {
      int v5 = 16;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"thirdSubtotalColumn"])
    {
      int v5 = 17;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstSubtotalRow"])
    {
      int v5 = 18;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"secondSubtotalRow"])
    {
      int v5 = 19;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"thirdSubtotalRow"])
    {
      int v5 = 20;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"blankRow"])
    {
      int v5 = 21;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstColumnSubheading"])
    {
      int v5 = 22;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"secondColumnSubheading"])
    {
      int v5 = 23;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"thirdColumnSubheading"])
    {
      int v5 = 24;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"firstRowSubheading"])
    {
      int v5 = 25;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"secondRowSubheading"])
    {
      int v5 = 26;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"thirdRowSubheading"])
    {
      int v5 = 27;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"pageFieldLabels"])
    {
      int v5 = 28;
      goto LABEL_59;
    }
    if ([v4 isEqualToString:@"pageFieldValues"])
    {
      int v5 = 29;
      goto LABEL_59;
    }
LABEL_58:
    int v5 = 0;
    goto LABEL_59;
  }
  int v5 = 1;
LABEL_59:

  return v5;
}

@end