@interface OAXDrawable
+ (id)readDrawableFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5;
+ (id)readDrawablesFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5;
+ (void)readNonVisualPropertiesFromDrawableXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 visualNodeName:(const char *)a5 toDrawable:(id)a6 drawingState:(id)a7;
@end

@implementation OAXDrawable

+ (void)readNonVisualPropertiesFromDrawableXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 visualNodeName:(const char *)a5 toDrawable:(id)a6 drawingState:(id)a7
{
  v11 = (CXNamespace *)a4;
  id v12 = a6;
  id v13 = a7;
  v43 = v12;
  v14 = (_xmlNode *)OCXFindChild(a3, v11, a5);
  if (v14)
  {
    v15 = (_xmlNode *)OCXFindChild(v14, v11, "cNvPr");
  }
  else
  {
    v16 = [v13 client];
    v15 = (_xmlNode *)[v16 genericNonVisualPropertiesNodeForDrawableNode:a3 inNamespace:v11 state:v13];
  }
  objc_msgSend(v12, "setHidden:", CXDefaultBoolAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"hidden", 0));
  id v45 = 0;
  BOOL v17 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"title", &v45);
  id v18 = v45;
  v42 = v18;
  if (v17)
  {
    id v19 = v18;
    v20 = [v12 drawableProperties];
    [v20 setAltTitle:v19];
  }
  id v44 = 0;
  BOOL v21 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"name", &v44);
  id v22 = v44;
  v41 = v22;
  if (v21)
  {
    id v23 = v22;
    v24 = [v12 drawableProperties];
    [v24 setAltDescription:v23];
  }
  v25 = CXRequiredUnsignedLongAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  v26 = [v13 drawableForShapeId:v25];

  if (v26) {
    v25 = (_xmlAttr *)+[OADDrawable generateOADDrawableId:v12];
  }
  [v12 setId:v25];
  v27 = [v13 OAXMainNamespace];
  uint64_t v28 = OCXFindChild(v15, v27, "hlinkClick");

  if (v28)
  {
    v29 = +[OAXHyperlink readHyperlink:v28 state:v13];
    v30 = [v12 drawableProperties];
    [v30 setClickHyperlink:v29];
  }
  v31 = [v13 OAXMainNamespace];
  uint64_t v32 = OCXFindChild(v15, v31, "hlinkHover");

  if (v32)
  {
    v33 = +[OAXHyperlink readHyperlink:v32 state:v13];
    v34 = [v12 drawableProperties];
    [v34 setHoverHyperlink:v33];
  }
  v35 = [v13 OAXMainNamespace];
  v36 = (_xmlNode *)OCXFindChild(v15, v35, "extLst");

  if (v36)
  {
    v37 = OCXFirstChildNamed(v36, (xmlChar *)"ext");
    while (v37)
    {
      v38 = CXDefaultStringAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
      if ([v38 isEqualToString:@"{63B3BB69-23CF-44E3-9099-C40C66FF867C}"])
      {
        v39 = OCXFirstChildNamed(v37, (xmlChar *)"compatExt");
        if (v39)
        {
          v40 = CXDefaultStringAttribute(v39, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid", 0);
          if ([v40 length])
          {
            [v13 setVmlShapeId:v40 forDrawableId:v25];

            break;
          }
        }
      }
      v37 = OCXNextSiblingNamed(v36, (xmlChar *)"ext");
    }
  }
}

+ (id)readDrawablesFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF980] array];
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE) {
      continue;
    }
    id v12 = [a1 readDrawableFromXmlNode:i inNamespace:v8 drawingState:v9];
    if (!v12)
    {
      id v13 = OCXReplaceChoiceWithFallback(i);
      if (!v13)
      {
        id v12 = 0;
        goto LABEL_6;
      }
      [a1 readDrawableFromXmlNode:v13 inNamespace:v8 drawingState:v9];
      id v12 = i = v13;
      if (!v12) {
        goto LABEL_6;
      }
    }
    [v10 addObject:v12];
LABEL_6:
  }
  return v10;
}

+ (id)readDrawableFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (![v7 containsNode:a3]) {
    goto LABEL_13;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"sp"))
  {
    id v9 = off_264D60578;
    goto LABEL_12;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"cxnSp"))
  {
    id v9 = off_264D60558;
    goto LABEL_12;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"pic"))
  {
    id v9 = off_264D60570;
    goto LABEL_12;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"graphicFrame"))
  {
    id v9 = off_264D60560;
    goto LABEL_12;
  }
  if (!xmlStrEqual(a3->name, (const xmlChar *)"grpSp"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"contentPart"))
    {
      v29 = [v8 packagePart];
      v30 = [v8 OCXReadRequiredRelationshipForNode:a3 packagePart:v29];
      v31 = [v30 targetLocation];
      uint64_t v32 = [v31 relativeString];

      +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", OAUnsupportedMediaType, v32);
    }
LABEL_13:
    v11 = [v8 client];
    v10 = [v11 readClientDrawableFromXmlNode:a3 state:v8];

    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  id v9 = off_264D60568;
LABEL_12:
  v10 = [(__objc2_class *)*v9 readFromXmlNode:a3 inNamespace:v7 drawingState:v8];
  if (!v10) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v12 = [v10 id];
  id v13 = [v8 vmlShapeIdForDrawableId:v12];
  if (v13)
  {
    v14 = [v8 oavState];
    v15 = [v14 drawableForVmlShapeId:v13];

    if (v15)
    {
      v16 = [v8 oavState];
      [v16 addDualDrawable:v15];

      [v15 setId:v12];
      BOOL v17 = [v10 drawableProperties];
      id v18 = [v17 orientedBounds];
      id v19 = [v15 drawableProperties];
      [v19 setOrientedBounds:v18];

      v20 = [v10 drawableProperties];
      BOOL v21 = [v20 clickHyperlink];
      id v22 = [v15 drawableProperties];
      [v22 setClickHyperlink:v21];

      id v23 = [v10 drawableProperties];
      v24 = [v23 hoverHyperlink];
      v25 = [v15 drawableProperties];
      [v25 setHoverHyperlink:v24];

      v26 = [v10 clientData];
      [v15 setClientData:v26];

      id v27 = v15;
      v10 = v27;
    }
  }
  [v8 setDrawable:v10 forShapeId:v12];

LABEL_19:
  return v10;
}

@end