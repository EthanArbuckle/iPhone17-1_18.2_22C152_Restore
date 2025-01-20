@interface CHXDataValue
+ (id)chdDataValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4;
+ (id)chdNumberValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4;
+ (id)chdStringValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation CHXDataValue

+ (id)chdNumberValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [v6 drawingState];
  v8 = [v7 OAXChartNamespace];
  v9 = +[EXString readStringWithAsciiCodeFromXmlStringElement:OCXFindRequiredChild(a3, v8, (xmlChar *)"v")];

  v10 = (EDValue *)[v9 doubleValue];
  EDValue::makeWithNumber(v10, v11, (uint64_t)&v14);
  v12 = [a1 chdDataValueFromXmlDataValueElement:a3 state:v6];
  [v12 setValue:&v14];
  EDValue::~EDValue(&v14);

  return v12;
}

+ (id)chdDataValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  id v6 = +[CHDDataValue dataValue];
  objc_msgSend(v6, "setIndex:", (int)CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx"));
  id v13 = 0;
  BOOL v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v13);
  id v8 = v13;
  if (v7)
  {
    v9 = +[EDString edStringWithString:v8];
    v10 = +[EDContentFormat contentFormatWithFormatString:v9];

    double v11 = [v5 resources];
    [v6 setContentFormatWithResources:v10 resources:v11];
  }
  return v6;
}

+ (id)chdStringValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 drawingState];
  id v8 = [v7 OAXChartNamespace];
  v9 = +[EXString readStringWithAsciiCodeFromXmlStringElement:OCXFindRequiredChild(a3, v8, (xmlChar *)"v")];

  EDValue::makeWithNSString(v9, (uint64_t)&v12);
  v10 = [a1 chdDataValueFromXmlDataValueElement:a3 state:v6];
  [v10 setValue:&v12];
  EDValue::~EDValue(&v12);

  return v10;
}

@end