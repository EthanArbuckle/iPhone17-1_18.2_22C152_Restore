@interface ODXShape
+ (void)readAdjustmentListNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5;
+ (void)readNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5;
+ (void)readTypeFromNode:(_xmlNode *)a3 toShape:(id)a4;
@end

@implementation ODXShape

+ (void)readNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  [a1 readTypeFromNode:a3 toShape:v12];
  v9 = OCXFirstChild(a3);
  v10 = [v8 ODXDiagramNamespace];
  BOOL HasName = CXNodeHasName(v9, v10, (xmlChar *)"adjLst");

  if (HasName) {
    [a1 readAdjustmentListNode:v9 toShape:v12 state:v8];
  }
}

+ (void)readTypeFromNode:(_xmlNode *)a3 toShape:(id)a4
{
  id v9 = a4;
  v5 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  v6 = v5;
  if (v5 && ([v5 isEqualToString:@"none"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"conn"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = +[OAXGeometry shapeTypeForString:v6];
      if (v8 == -130883970) {
        [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Invalid layout shape type."];
      }
      [v9 setPresetType:v8];
      uint64_t v7 = 2;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v9 setType:v7];
}

+ (void)readAdjustmentListNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  uint64_t v8 = OCXFirstChild(a3);
  while (1)
  {
    id v9 = [v7 ODXDiagramNamespace];
    BOOL HasName = CXNodeHasName(v8, v9, (xmlChar *)"adj");

    if (!HasName) {
      break;
    }
    v11 = objc_alloc_init(ODDShapeAdjustment);
    [v12 addAdjustment:v11];
    if (CXRequiredUnsignedLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx")) {
      -[ODDShapeAdjustment setIndex:](v11, "setIndex:");
    }
    else {
      [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Missing required index attribute."];
    }
    [(ODDShapeAdjustment *)v11 setValue:CXRequiredDoubleAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"val")];
    uint64_t v8 = OCXNextSibling(v8);
  }
  if (v8) {
    [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Unexpected adjustment node child."];
  }
}

@end