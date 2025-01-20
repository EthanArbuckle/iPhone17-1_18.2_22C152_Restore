@interface WXListLevelOverride
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXListLevelOverride

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v15 = 0;
  v9 = [v8 WXMainNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "startOverride");

  v11 = [v8 WXMainNamespace];
  LODWORD(v10) = CXOptionalLongAttribute(v10, v11, (xmlChar *)"val", &v15);

  if (v10) {
    [v7 setStartNumber:v15];
  }
  v12 = [v8 WXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "lvl");

  if (v13)
  {
    v14 = [v7 mutableListLevel];
    +[WXListLevel readFrom:v13 to:v14 state:v8];
  }
}

@end