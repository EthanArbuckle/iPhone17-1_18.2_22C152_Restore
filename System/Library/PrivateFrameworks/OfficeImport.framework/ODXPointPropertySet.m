@interface ODXPointPropertySet
+ (void)readNode:(_xmlNode *)a3 toSet:(id)a4;
@end

@implementation ODXPointPropertySet

+ (void)readNode:(_xmlNode *)a3 toSet:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend([NSString alloc], "tc_initFromXmlNode:ns:attributeName:", a3, 0, "loTypeId");
  [v5 setLayoutTypeId:v6];
  v7 = objc_msgSend([NSString alloc], "tc_initFromXmlNode:ns:attributeName:", a3, 0, "presName");
  [v5 setPresentationName:v7];
  v8 = objc_msgSend([NSString alloc], "tc_initFromXmlNode:ns:attributeName:", a3, 0, "presStyleLbl");
  [v5 setPresentationStyleLabel:v8];
  uint64_t v12 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presStyleIdx", &v12)) {
    [v5 setPresentationStyleIndex:v12];
  }
  uint64_t v11 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presStyleCnt", &v11)) {
    [v5 setPresentationStyleCount:v11];
  }
  v9 = +[ODXData readModelIdentifierFromNode:a3 attributeName:"presAssocID"];
  [v5 setPresentationAssociatedId:v9];

  BOOL v10 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"custFlipVert", &v10)) {
    [v5 setCustomVerticalFlip:v10];
  }
}

@end