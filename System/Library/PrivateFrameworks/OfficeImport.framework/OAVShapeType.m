@interface OAVShapeType
+ (id)readFromShapeType:(_xmlNode *)a3 state:(id)a4;
@end

@implementation OAVShapeType

+ (id)readFromShapeType:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  objc_msgSend(v5, "setShapeType:forId:", (unsigned __int16)CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"spt"), v6);

  return 0;
}

@end