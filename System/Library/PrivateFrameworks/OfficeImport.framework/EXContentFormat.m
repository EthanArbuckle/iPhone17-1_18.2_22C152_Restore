@interface EXContentFormat
+ (id)edContentFormatFromXmlContentFormatElement:(_xmlNode *)a3;
@end

@implementation EXContentFormat

+ (id)edContentFormatFromXmlContentFormatElement:(_xmlNode *)a3
{
  if (a3)
  {
    unint64_t v9 = 0;
    v4 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", &v9))
    {
      id v8 = 0;
      CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v8);
      id v5 = v8;
      v6 = +[EDString edStringWithString:v5];
      v4 = +[EDContentFormat contentFormatWithFormatString:v6 formatId:v9];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end