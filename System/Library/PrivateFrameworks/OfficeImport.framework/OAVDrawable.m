@interface OAVDrawable
+ (CGRect)readCoordBounds:(_xmlNode *)a3;
+ (_xmlDoc)vmlDocumentFromPart:(id)a3;
+ (id)readDrawableFromNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5;
+ (id)readDrawablesFromParent:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5;
+ (void)readFromDrawable:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5;
@end

@implementation OAVDrawable

+ (id)readDrawablesFromParent:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      v12 = [a1 readDrawableFromNode:i inNamespace:v8 state:v9];
      if (v12) {
        [v10 addObject:v12];
      }
    }
  }

  return v10;
}

+ (id)readDrawableFromNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (xmlStrEqual(a3->name, (const xmlChar *)"shape")
    || xmlStrEqual(a3->name, (const xmlChar *)"line")
    || xmlStrEqual(a3->name, (const xmlChar *)"polyline")
    || xmlStrEqual(a3->name, (const xmlChar *)"rect")
    || xmlStrEqual(a3->name, (const xmlChar *)"roundrect")
    || xmlStrEqual(a3->name, (const xmlChar *)"oval"))
  {
    uint64_t v9 = +[OAVShape readFromShape:a3 inNamespace:v7 state:v8];
LABEL_8:
    v10 = (void *)v9;
    goto LABEL_9;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"shapetype"))
  {
    uint64_t v9 = +[OAVShapeType readFromShapeType:a3 state:v8];
    goto LABEL_8;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"group"))
  {
    uint64_t v9 = +[OAVGroup readFromGroup:a3 inNamespace:v7 state:v8];
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (void)readFromDrawable:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", 0);
  v10 = CXDefaultStringAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"spid", 0);
  v42 = v10;
  if ([v9 length])
  {
    [v8 setDrawable:v7 forVmlShapeId:v9];
    objc_msgSend(v7, "setId:", objc_msgSend(v8, "officeArtShapeIdWithVmlShapeId:", v9));
  }
  if ([v10 length])
  {
    [v8 setDrawable:v7 forVmlShapeId:v10];
    if (![v9 length]) {
      objc_msgSend(v7, "setId:", objc_msgSend(v8, "officeArtShapeIdWithVmlShapeId:", v10));
    }
  }
  if (![v9 length]) {
    [v10 length];
  }
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style");
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = OAVReadComposite(v41);
  v12 = objc_alloc_init(OADOrientedBounds);
  v13 = [v7 drawableProperties];
  [v13 setOrientedBounds:v12];

  v14 = [v11 objectForKey:@"rotation"];
  v15 = v14;
  if (v14)
  {
    *(float *)&double v16 = OAVReadAngle(v14);
    [(OADOrientedBounds *)v12 setRotation:v16];
  }
  v17 = [v11 objectForKey:@"flip"];
  if ([v17 isEqualToString:@"x"])
  {
    [(OADOrientedBounds *)v12 setFlipX:1];
    goto LABEL_16;
  }
  if (([v17 isEqualToString:@"y"] & 1) == 0)
  {
    if (![v17 isEqualToString:@"x y"]) {
      goto LABEL_16;
    }
    [(OADOrientedBounds *)v12 setFlipX:1];
  }
  [(OADOrientedBounds *)v12 setFlipY:1];
LABEL_16:
  v40 = [v11 objectForKey:@"visibility"];
  if ([v40 isEqualToString:@"hidden"]) {
    [v7 setHidden:1];
  }
  int v18 = xmlStrEqual(a3->parent->name, (const xmlChar *)"group");
  name = a3->name;
  if (v18)
  {
    if (xmlStrEqual(name, (const xmlChar *)"line"))
    {
      uint64_t v44 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"from");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadIntPair(v20, (int *)&v44 + 1, (int *)&v44);
      uint64_t v43 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"to");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadIntPair(v21, (int *)&v43 + 1, (int *)&v43);
      -[OADOrientedBounds setBounds:](v12, "setBounds:", (double)SHIDWORD(v44), (double)(int)v44, (double)(HIDWORD(v43) - HIDWORD(v44)), (double)((int)v43 - (int)v44));
LABEL_23:

      goto LABEL_24;
    }
    if (!xmlStrEqual(a3->name, (const xmlChar *)"polyline"))
    {
      v24 = [v11 objectForKey:@"left"];
      int v38 = [v24 intValue];

      v25 = [v11 objectForKey:@"top"];
      int v37 = [v25 intValue];

      v26 = [v11 objectForKey:@"width"];
      int v36 = [v26 intValue];

      v27 = [v11 objectForKey:@"height"];
      LODWORD(v25) = [v27 intValue];

      -[OADOrientedBounds setBounds:](v12, "setBounds:", (double)v38, (double)v37, (double)v36, (double)(int)v25);
    }
  }
  else
  {
    if (xmlStrEqual(name, (const xmlChar *)"line"))
    {
      uint64_t v44 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"from");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadLengthPair(v20, (float *)&v44 + 1, (float *)&v44);
      uint64_t v43 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"to");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadLengthPair(v21, (float *)&v43 + 1, (float *)&v43);
      -[OADOrientedBounds setBounds:](v12, "setBounds:", *((float *)&v44 + 1), *(float *)&v44, (float)(*((float *)&v43 + 1) - *((float *)&v44 + 1)), (float)(*(float *)&v43 - *(float *)&v44));
      goto LABEL_23;
    }
    if (!xmlStrEqual(a3->name, (const xmlChar *)"polyline"))
    {
      v28 = [v11 objectForKey:@"margin-left"];
      if (!v28)
      {
        v28 = [v11 objectForKey:@"left"];
      }
      float v29 = OAVReadLength(v28);
      v30 = [v11 objectForKey:@"margin-top"];
      if (!v30)
      {
        v30 = [v11 objectForKey:@"top"];
      }
      v39 = v30;
      float v31 = OAVReadLength(v30);
      v32 = [v11 objectForKey:@"width"];
      float v33 = OAVReadLength(v32);

      v34 = [v11 objectForKey:@"height"];
      float v35 = OAVReadLength(v34);

      -[OADOrientedBounds setBounds:](v12, "setBounds:", v29, v31, v33, v35);
    }
  }
LABEL_24:
  v22 = +[OAVHyperlink readFromDrawable:a3 state:v8];
  v23 = [v7 drawableProperties];
  [v23 setClickHyperlink:v22];
}

+ (_xmlDoc)vmlDocumentFromPart:(id)a3
{
  v3 = [a3 data];
  v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithData:v3 encoding:4];
  if ([v4 rangeOfString:@"<br/>"] == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"<br>", @"<br/>", 2, 0, objc_msgSend(v4, "length"));
  }
  Doc = xmlReadDoc((const xmlChar *)objc_msgSend(v4, "tc_xmlString"), 0, 0, 97);

  return Doc;
}

+ (CGRect)readCoordBounds:(_xmlNode *)a3
{
  *(void *)double v16 = 0;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"coordorigin", 0);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadIntPair(v4, &v16[1], v16);
  int v14 = 1000;
  int v15 = 1000;
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"coordsize");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadIntPair(v5, &v15, &v14);
  double v6 = (double)v16[1];
  double v7 = (double)v16[0];
  double v8 = (double)v15;
  double v9 = (double)v14;

  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

@end