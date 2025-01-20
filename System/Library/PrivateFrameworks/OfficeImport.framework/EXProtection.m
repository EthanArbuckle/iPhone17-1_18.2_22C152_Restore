@interface EXProtection
+ (id)edProtectionFromXmlElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXProtection

+ (id)edProtectionFromXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  BOOL v11 = 0;
  BOOL v10 = 1;
  if (a3)
  {
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hidden", &v11);
    v6 = [v5 EXSpreadsheetMLNamespace];
    uint64_t v7 = OCXFindChild(a3, v6, "Locked");

    if (v7) {
      BOOL v10 = 0;
    }
    else {
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"locked", &v10);
    }
  }
  v8 = +[EDProtection protectionWithHidden:locked:](EDProtection, "protectionWithHidden:locked:", v11);

  return v8;
}

@end