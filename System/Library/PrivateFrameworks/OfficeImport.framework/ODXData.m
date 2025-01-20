@interface ODXData
+ (id)readModelIdentifierFromNode:(_xmlNode *)a3 attributeName:(const char *)a4;
+ (id)readPointFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5;
+ (id)readPointListFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5;
+ (int)readConnectionTypeFromNode:(_xmlNode *)a3;
+ (int)readPointTypeFromNode:(_xmlNode *)a3;
+ (void)associatePresentationsInIdMap:(id)a3;
+ (void)readConnectionFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5;
+ (void)readConnectionListFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5;
+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5;
@end

@implementation ODXData

+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  v9 = [v8 ODXDiagramNamespace];
  BOOL HasName = CXNodeHasName(a3, v9, (xmlChar *)"dataModel");

  if (!HasName) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Not a diagram data node"];
  }
  v11 = objc_alloc_init(OITSUNoCopyDictionary);
  v12 = [v8 ODXDiagramNamespace];
  v13 = OCXFirstChild(a3, v12, (xmlChar *)"ptLst");

  v14 = [a1 readPointListFromNode:v13 pointIdMap:v11 state:v8];
  [v18 setDocumentPoint:v14];
  v15 = OCXNextSibling(v13);
  v16 = [v8 ODXDiagramNamespace];
  BOOL v17 = CXNodeHasName(v15, v16, (xmlChar *)"cxnLst");

  if (v17) {
    [a1 readConnectionListFromNode:v15 pointIdMap:v11 state:v8];
  }
  [a1 associatePresentationsInIdMap:v11];
}

+ (id)readPointListFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = OCXFirstChild(a3);
  v11 = 0;
  while (v10)
  {
    if (v10->type == XML_ELEMENT_NODE)
    {
      v12 = [v9 ODXDiagramNamespace];
      BOOL HasName = CXNodeHasName(v10, v12, (xmlChar *)"pt");

      if (HasName)
      {
        if (v11)
        {
          id v14 = (id)[a1 readPointFromNode:v10 pointIdMap:v8 state:v9];
        }
        else
        {
          v11 = [a1 readPointFromNode:v10 pointIdMap:v8 state:v9];
        }
      }
      else
      {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Found non-point node"];
      }
    }
    v10 = OCXNextSibling(v10);
  }
  if (!v11) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"No document point"];
  }

  return v11;
}

+ (id)readPointFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v34 = a4;
  id v8 = a5;
  uint64_t v9 = [a1 readPointTypeFromNode:a3];
  v10 = off_264D60580;
  switch((int)v9)
  {
    case 0:
    case 2:
      goto LABEL_6;
    case 1:
      v13 = objc_alloc_init(ODDNodePoint);
      v11 = v13;
      goto LABEL_7;
    case 3:
    case 5:
      v10 = off_264D60590;
      goto LABEL_6;
    case 4:
      v10 = off_264D60588;
LABEL_6:
      v11 = 0;
      v13 = (ODDNodePoint *)objc_alloc_init(*v10);
LABEL_7:
      v12 = v13;
      break;
    default:
      v11 = 0;
      v12 = 0;
      [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Unknown diagram node type"];
      break;
  }
  [(ODDNodePoint *)v12 setType:v9];
  id v14 = [v8 officeArtState];
  uint64_t v32 = [(ODDPoint *)v12 shapeProperties];
  v15 = OCXFirstChild(a3);
  v16 = [v8 ODXDiagramNamespace];
  BOOL HasName = CXNodeHasName(v15, v16, (xmlChar *)"prSet");

  if (HasName)
  {
    id v18 = [(ODDPoint *)v12 propertySet];
    +[ODXPointPropertySet readNode:v15 toSet:v18];

    v15 = OCXNextSibling(v15);
  }
  objc_msgSend(v8, "ODXDiagramNamespace", v32);
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  BOOL v20 = CXNodeHasName(v15, v19, (xmlChar *)"spPr");

  if (v20)
  {
    +[OAXGraphic readPropertiesFromXmlNode:v15 graphicProperties:v33 drawingState:v14];
    v15 = OCXNextSibling(v15);
  }
  v21 = [v8 ODXDiagramNamespace];
  BOOL v22 = CXNodeHasName(v15, v21, (xmlChar *)"style");

  if (v22)
  {
    v23 = objc_alloc_init(OADShapeStyle);
    +[OAXShapeStyle readFromNode:v15 shapeStyle:v23 drawingState:v14];
    v24 = [v14 styleMatrix];
    [(OADShapeStyle *)v23 applyToGraphicProperties:v33 styleMatrix:v24];

    v15 = OCXNextSibling(v15);
    v25 = v23;
  }
  else
  {
    v25 = 0;
  }
  v26 = [v8 ODXDiagramNamespace];
  BOOL v27 = CXNodeHasName(v15, v26, (xmlChar *)"t");

  if (v27)
  {
    v28 = objc_alloc_init(OADTextBody);
    [(ODDPoint *)v12 setText:v28];
    +[OAXTextBody readTextBodyFromXmlNode:v15 textBody:v28 drawingState:v14];
    if (v25) {
      [(OADShapeStyle *)v25 applyToTextBody:v28];
    }
  }
  v29 = [a1 readModelIdentifierFromNode:a3 attributeName:"modelId"];
  if (!v29) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Didn't find required model identifier"];
  }
  v30 = [v34 objectForKey:v29];

  if (v30) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Already a point for the identifier"];
  }
  [v34 setObject:v12 forUncopiedKey:v29];

  return v11;
}

+ (int)readPointTypeFromNode:(_xmlNode *)a3
{
  NoNsProp = xmlGetNoNsProp(a3, (const xmlChar *)"type");
  if (!NoNsProp) {
    return 2;
  }
  v4 = NoNsProp;
  if (xmlStrEqual(NoNsProp, (const xmlChar *)"node"))
  {
    int v5 = 2;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"asst"))
  {
    int v5 = 0;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"doc"))
  {
    int v5 = 1;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"pres"))
  {
    int v5 = 4;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"parTrans"))
  {
    int v5 = 3;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"sibTrans"))
  {
    int v5 = 5;
  }
  else
  {
    if (!xmlStrEqual(v4, (const xmlChar *)"unknown")) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"ODXException", @"Unknown diagram node type: %s", v4);
    }
    int v5 = 6;
  }
  ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v4);
  return v5;
}

+ (id)readModelIdentifierFromNode:(_xmlNode *)a3 attributeName:(const char *)a4
{
  v4 = objc_msgSend([NSString alloc], "tc_initFromXmlNode:ns:attributeName:", a3, 0, a4);
  int v5 = v4;
  if (v4)
  {
    if ([v4 length] == 38
      && [v5 characterAtIndex:0] == 123
      && [v5 characterAtIndex:37] == 125)
    {
      objc_msgSend(v5, "substringWithRange:", 1, 36);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = CFUUIDCreateFromString(0, v6);
      if (!v7) {
        [MEMORY[0x263EFF940] raise:@"ODXException", @"Couldn't parse uuid: %@", v5 format];
      }
    }
    else
    {
      v6 = [MEMORY[0x263F08B08] scannerWithString:v5];
      unsigned int v9 = 0;
      if ([(__CFString *)v6 scanInt:&v9]
        && [(__CFString *)v6 isAtEnd])
      {
        v7 = [NSNumber numberWithInt:v9];
      }
      else
      {
        [MEMORY[0x263EFF940] raise:@"ODXException", @"Couldn't parse int: %@", v5 format];
        v7 = 0;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)readConnectionListFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      v10 = [v8 ODXDiagramNamespace];
      BOOL HasName = CXNodeHasName(i, v10, (xmlChar *)"cxn");

      if (HasName) {
        [a1 readConnectionFromNode:i pointIdMap:v12 state:v8];
      }
      else {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Found non-connection node"];
      }
    }
  }
}

+ (void)readConnectionFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v18 = a4;
  v7 = [a1 readModelIdentifierFromNode:a3 attributeName:"srcId"];
  id v8 = [v18 objectForKey:v7];
  if (!v8) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Missing connection source"];
  }
  unsigned int v9 = [a1 readModelIdentifierFromNode:a3 attributeName:"destId"];
  v10 = [v18 objectForKey:v9];
  if (!v10) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Missing connection destination"];
  }
  unsigned int v11 = CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"srcOrd");
  CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"destOrd");
  int v12 = [a1 readConnectionTypeFromNode:a3];
  if (v12)
  {
    if (v12 == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Bad classes for presentation-of connection"];
      }
      [v8 addPresentation:v10 order:v11];
    }
    else if (v12 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Bad classes for presentation-parent-of connection"];
      }
      [v8 addChild:v10 order:v11];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Bad classes for parent-of connection"];
    }
    id v13 = v10;
    [v8 addChild:v13 order:v11];
    id v14 = [a1 readModelIdentifierFromNode:a3 attributeName:"parTransId"];
    if (v14)
    {
      v15 = [v18 objectForKey:v14];
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        [v13 setParentTransition:v15];
      }
      else {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Missing connection parent transition"];
      }
    }
    v16 = [a1 readModelIdentifierFromNode:a3 attributeName:"sibTransId"];
    if (v16)
    {
      BOOL v17 = [v18 objectForKey:v16];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        [v13 setSiblingTransition:v17];
      }
      else {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Missing connection sibling transition"];
      }
    }
  }
}

+ (int)readConnectionTypeFromNode:(_xmlNode *)a3
{
  NoNsProp = xmlGetNoNsProp(a3, (const xmlChar *)"type");
  if (NoNsProp)
  {
    v4 = NoNsProp;
    if (!xmlStrEqual(NoNsProp, (const xmlChar *)"parOf"))
    {
      if (xmlStrEqual(v4, (const xmlChar *)"presOf"))
      {
        int v5 = 1;
        goto LABEL_9;
      }
      if (xmlStrEqual(v4, (const xmlChar *)"presParOf"))
      {
        int v5 = 2;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"ODXException", @"Unknown diagram node type: %s", v4);
    }
    int v5 = 0;
LABEL_9:
    ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v4);
    return v5;
  }
  return 0;
}

+ (void)associatePresentationsInIdMap:(id)a3
{
  id v10 = a3;
  v3 = [v10 objectEnumerator];
  while (1)
  {
    v4 = [v3 nextObject];
    int v5 = v4;
    if (!v4) {
      break;
    }
    if ([v4 type] == 4)
    {
      v6 = [v5 propertySet];
      v7 = [v6 presentationAssociatedId];

      if (v7)
      {
        id v8 = [v10 objectForKey:v7];
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            id v9 = v5;
            [v8 addAssociatedPresentation:v9];
          }
        }
      }
    }
  }
}

@end