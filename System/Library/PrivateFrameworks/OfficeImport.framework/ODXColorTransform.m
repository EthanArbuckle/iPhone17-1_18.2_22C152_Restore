@interface ODXColorTransform
+ (void)readNode:(_xmlNode *)a3 transform:(id)a4 state:(id)a5;
@end

@implementation ODXColorTransform

+ (void)readNode:(_xmlNode *)a3 transform:(id)a4 state:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  v8 = [v7 ODXDiagramNamespace];
  BOOL HasName = CXNodeHasName(a3, v8, (xmlChar *)"colorsDef");

  if (!HasName) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Not a diagram color transform node"];
  }
  v10 = [v7 ODXDiagramNamespace];
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "styleLbl");

  while (1)
  {
    v12 = [v7 ODXDiagramNamespace];
    BOOL v13 = CXNodeHasName(v11, v12, (xmlChar *)"styleLbl");

    if (!v13) {
      break;
    }
    v14 = objc_alloc_init(ODDColorTransformStyleLabel);
    +[ODXColorTransformStyleLabel readNode:v11 label:v14 state:v7];
    v15 = objc_msgSend([NSString alloc], "tc_initFromXmlNode:ns:attributeName:", v11, 0, "name");
    if (!v15) {
      [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Missing style label name"];
    }
    [v16 setLabel:v14 forName:v15];
    v11 = OCXNextSibling(v11);
  }
}

@end