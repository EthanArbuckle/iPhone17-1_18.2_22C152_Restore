@interface ODXDrawing
+ (id)readDrawingRelationshipIdFromDataNode:(_xmlNode *)a3 state:(id)a4;
+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5;
@end

@implementation ODXDrawing

+ (id)readDrawingRelationshipIdFromDataNode:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [v5 ODXDiagramNamespace];
  Child = (_xmlNode *)OCXFindChild(a3, v6, "extLst");

  if (Child)
  {
    v8 = [v5 officeArtState];
    v9 = [v8 OAXMainNamespace];
    Child = (_xmlNode *)OCXFindChild(Child, v9, "ext");

    if (Child)
    {
      while (1)
      {
        v10 = CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
        v11 = v10;
        if (v10)
        {
          id v12 = v10;
          if (!strcmp((const char *)[v12 UTF8String], "http://schemas.microsoft.com/office/drawing/2008/diagram"))
          {
            v13 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/drawing/2008/diagram"];
            v14 = (_xmlNode *)OCXFindChild(Child, v13, "dataModelExt");

            if (v14) {
              break;
            }
          }
        }
        v15 = [v5 officeArtState];
        v16 = [v15 OAXMainNamespace];
        Child = OCXFindNextChild(Child, v16, (xmlChar *)"ext");

        if (!Child) {
          goto LABEL_7;
        }
      }
      CXDefaultStringAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"relId", 0);
      Child = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:

  return Child;
}

+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  v8 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/drawing/2008/diagram"];
  if (CXNodeHasName(a3, v8, (xmlChar *)"drawing"))
  {
    uint64_t v9 = OCXFindChild(a3, v8, "spTree");
    if (v9)
    {
      v10 = [v7 officeArtState];
      v11 = +[OAXDrawable readDrawablesFromXmlNode:v9 inNamespace:v8 drawingState:v10];

      [v12 setEquivalentDrawables:v11];
    }
  }
}

@end