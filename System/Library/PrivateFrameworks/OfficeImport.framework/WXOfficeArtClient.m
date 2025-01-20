@interface WXOfficeArtClient
- (_xmlNode)genericNonVisualPropertiesNodeForDrawableNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5;
- (id)readClientDrawableFromXmlNode:(_xmlNode *)a3 state:(id)a4;
- (id)readGraphicData:(_xmlNode *)a3 state:(id)a4;
- (void)readBlipExtWithURI:(id)a3 fromNode:(_xmlNode *)a4 toDrawable:(id)a5 state:(id)a6;
- (void)readClientDataFromNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5;
@end

@implementation WXOfficeArtClient

- (void)readClientDataFromNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7 = a4;
  v8 = [a5 oavState];
  v9 = [v8 wxReadState];
  v10 = objc_alloc_init(WDAContent);
  [v7 setClientData:v10];
  -[WDAContent setTextType:](v10, "setTextType:", [v9 currentOfficeArtTextType]);
  v11 = [v9 WXShapeNamespace];
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "txbx");

  if (v12)
  {
    v13 = +[WXTextBox readFrom:v12 parent:v10 state:v8];
    if (!v13) {
      goto LABEL_21;
    }
    v14 = [v9 document];
    [(WDAContent *)v10 setTextBox:v13 document:v14];

    [(WDAContent *)v10 setDrawable:v7];
    uint64_t v53 = -1;
    if (!CXOptionalLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", &v53)) {
      goto LABEL_21;
    }
    [(WDATextBox *)v13 setFlowSequence:&unk_26EC811D0];
    v15 = [NSNumber numberWithLong:v53];
    [(WDATextBox *)v13 setFlowId:v15];

    [(WDATextBox *)v13 setNextTextBoxId:0xFFFFFFFFLL];
    v16 = [(WDATextBox *)v13 flowId];
    [v9 setTextBox:v13 forFlowId:v16];
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v17 = [v9 WXShapeNamespace];
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "linkedTxbx");

  if (v18)
  {
    v13 = objc_alloc_init(WDATextBox);
    [(WDATextBox *)v13 setParent:v10];
    [(WDAContent *)v10 setDrawable:v7];
    v19 = [v9 document];
    [(WDAContent *)v10 setTextBox:v13 document:v19];

    uint64_t v52 = -1;
    uint64_t v53 = -1;
    if (CXOptionalLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", &v53)
      && CXOptionalLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"seq", &v52))
    {
      v20 = [NSNumber numberWithLong:v52];
      [(WDATextBox *)v13 setFlowSequence:v20];

      v21 = [NSNumber numberWithLong:v53];
      [(WDATextBox *)v13 setFlowId:v21];
    }
    v22 = [(WDATextBox *)v13 flowId];
    v16 = [v9 textBoxForFlowId:v22];

    if (![(WDAContent *)v10 hasText])
    {
      v23 = [v9 drawingState];
      int v24 = [v23 isInsideGroup];
      int v25 = v16 ? v24 : 0;

      if (v25 == 1)
      {
        v26 = [v7 drawableProperties];
        v51 = [v26 orientedBounds];

        v27 = [v16 parent];
        v28 = [v27 drawable];
        v29 = [v28 drawableProperties];
        v30 = [v29 orientedBounds];

        objc_opt_class();
        v31 = [v9 drawingState];
        v32 = [v31 peekGroup];

        if (v30)
        {
          if (v51)
          {
            [v51 bounds];
            CGFloat v34 = v33;
            CGFloat v36 = v35;
            double v38 = v37;
            double v40 = v39;
            [v30 bounds];
            v57.origin.double x = v41;
            v57.origin.double y = v42;
            double v44 = v43;
            double v46 = v45;
            v54.origin.double x = v34;
            v54.origin.double y = v36;
            v54.size.double width = v38;
            v54.size.double height = v40;
            v57.size.double width = v44;
            v57.size.double height = v46;
            CGRect v55 = CGRectUnion(v54, v57);
            double x = v55.origin.x;
            double y = v55.origin.y;
            double width = v55.size.width;
            double height = v55.size.height;
            [v32 logicalBounds];
            v58.origin.double x = x;
            v58.origin.double y = y;
            v58.size.double width = width;
            v58.size.double height = height;
            if (CGRectContainsRect(v56, v58) && width * height < v44 * v46 + v38 * v40 + v44 * v46 + v38 * v40) {
              objc_msgSend(v30, "setBounds:", x, y, width, height);
            }
          }
        }
      }
    }
    goto LABEL_20;
  }
LABEL_22:
}

- (id)readClientDrawableFromXmlNode:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  v6 = [v5 documentState];
  if (xmlStrEqual(a3->name, (const xmlChar *)"wsp"))
  {
    id v7 = [v6 WXShapeNamespace];
    int v8 = [v7 containsNode:a3];

    if (v8)
    {
      v9 = [v6 WXShapeNamespace];
      uint64_t v10 = +[OAXShape readFromXmlNode:a3 inNamespace:v9 drawingState:v5];
LABEL_10:
      v15 = (void *)v10;

      goto LABEL_12;
    }
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"pic"))
  {
    v11 = [v5 OAXPictureNamespace];
    int v12 = [v11 containsNode:a3];

    if (v12)
    {
      v9 = [v5 OAXPictureNamespace];
      uint64_t v10 = +[OAXPicture readFromXmlNode:a3 inNamespace:v9 drawingState:v5];
      goto LABEL_10;
    }
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"grpSp"))
  {
    v13 = [v6 WXGroupNamespace];
    int v14 = [v13 containsNode:a3];

    if (v14)
    {
      v9 = [v6 WXGroupNamespace];
      uint64_t v10 = +[OAXGroup readFromXmlNode:a3 inNamespace:v9 drawingState:v5];
      goto LABEL_10;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (_xmlNode)genericNonVisualPropertiesNodeForDrawableNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7 = a5;
  int v8 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)a4, "cNvPr");
  if (!v8)
  {
    parent = a3->parent->parent->parent;
    uint64_t v10 = [v7 documentState];
    v11 = [v10 WXDrawingNamespace];
    int v8 = (_xmlNode *)OCXFindChild(parent, v11, "docPr");
  }
  return v8;
}

- (id)readGraphicData:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  v6 = [v5 documentState];
  id v7 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri");
  int v8 = (const unsigned __int8 *)objc_msgSend(v7, "tc_xmlString");
  v9 = [v6 WXShapeNamespace];
  LODWORD(v8) = CXXmlStrEqualToNsUriOrFallbackNsUri(v8, v9);

  if (v8)
  {
    uint64_t v10 = [v6 WXShapeNamespace];
    v11 = (void *)OCXFindChild(a3, v10, "wsp");

    if (!v11) {
      goto LABEL_9;
    }
    int v12 = [v6 WXShapeNamespace];
    uint64_t v13 = +[OAXShape readFromXmlNode:v11 inNamespace:v12 drawingState:v5];
LABEL_7:
    v11 = (void *)v13;

    goto LABEL_9;
  }
  int v14 = (const unsigned __int8 *)objc_msgSend(v7, "tc_xmlString");
  v15 = [v6 WXGroupNamespace];
  LODWORD(v14) = CXXmlStrEqualToNsUriOrFallbackNsUri(v14, v15);

  if (v14)
  {
    v16 = [v6 WXGroupNamespace];
    v11 = (void *)OCXFindChild(a3, v16, "wgp");

    if (!v11) {
      goto LABEL_9;
    }
    int v12 = [v6 WXGroupNamespace];
    uint64_t v13 = +[OAXGroup readFromXmlNode:v11 inNamespace:v12 drawingState:v5];
    goto LABEL_7;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (void)readBlipExtWithURI:(id)a3 fromNode:(_xmlNode *)a4 toDrawable:(id)a5 state:(id)a6
{
  id v24 = a5;
  if ([a3 isEqualToString:@"{C809E66F-F1BF-436E-b5F7-EEA9579F0CBA}"])
  {
    int v8 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)WXWord2012DrawingNamespace, "webVideoPr");
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = TSUDynamicCast(v9, (uint64_t)v24);
    v11 = (void *)v10;
    if (v8) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      uint64_t v13 = CXDefaultStringAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"embeddedHtml", 0);
      if ([v13 length])
      {
        int v14 = [v13 stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];

        xmlDocPtr Doc = xmlReadDoc((const xmlChar *)objc_msgSend(v14, "tc_xmlString"), 0, 0, 1);
        v16 = CXGetRootElement(Doc);
        v17 = CXFirstChildNamed(v16, (xmlChar *)"embed");
        v18 = CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"src", 0);
        uint64_t v19 = CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"flashVars", 0);
        v20 = (void *)v19;
        if (v18 && v19)
        {
          uint64_t v21 = [NSString stringWithFormat:@"%@&amp;%@", v18, v19];

          v18 = (void *)v21;
        }
        xmlFreeDoc(Doc);
        if (v18)
        {
          v22 = [NSURL URLWithString:v18];
          v23 = objc_alloc_init(OADLinkedMediaFile);
          [(OADLinkedMediaFile *)v23 setUrl:v22];
          [(OADLinkedMediaFile *)v23 setIsExternal:1];
          [v11 setMovie:v23];
        }
      }
      else
      {
        int v14 = v13;
      }
    }
  }
}

@end