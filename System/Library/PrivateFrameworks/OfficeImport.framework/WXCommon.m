@interface WXCommon
+ (TCEnumerationMap)customNumberFormatEnumMap;
+ (TCEnumerationMap)heightTypeEnumMap;
+ (TCEnumerationMap)justifyEnumMap;
+ (TCEnumerationMap)numberFormatEnumMap;
+ (TCEnumerationMap)strictJustifyEnumMap;
+ (TCEnumerationMap)strictTextDirectionEnumMap;
+ (TCEnumerationMap)tableWidthTypeEnumMap;
+ (TCEnumerationMap)textDirectionEnumMap;
+ (void)initialize;
@end

@implementation WXCommon

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [TCTaggedMessage alloc];
    v3 = TCBundle();
    v4 = [v3 localizedStringForKey:@"The XML document isn\\U2019t in Word format." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v5 = [(TCTaggedMessage *)v2 initWithMessageText:v4];
    v6 = (void *)WXBadFormat;
    WXBadFormat = v5;

    v7 = [TCTaggedMessage alloc];
    v8 = TCBundle();
    v9 = [v8 localizedStringForKey:@"Equations authored with Microsoft Office were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v10 = [(TCTaggedMessage *)v7 initWithMessageText:v9];
    v11 = (void *)WXMathMLNotSupported;
    WXMathMLNotSupported = v10;

    v12 = [TCTaggedMessage alloc];
    v13 = TCBundle();
    v14 = [v13 localizedStringForKey:@"Form components aren\\U2019t supported and were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v15 = [(TCTaggedMessage *)v12 initWithMessageText:v14];
    v16 = (void *)WXFormsNotSupported;
    WXFormsNotSupported = v15;

    v17 = [TCTaggedMessage alloc];
    v18 = TCBundle();
    v19 = [v18 localizedStringForKey:@"Some tracked changes had no associated time stamp. The current date/time was used instead." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v20 = [(TCTaggedMessage *)v17 initWithMessageText:v19];
    v21 = (void *)WXFoundMissingCTDate;
    WXFoundMissingCTDate = v20;

    v22 = [[CXNamespace alloc] initWithUri:"urn:schemas-microsoft-com:office:word"];
    v23 = (void *)WXVmlNamespace;
    WXVmlNamespace = (uint64_t)v22;

    v24 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/word/2006/wordml"];
    v25 = (void *)WXWord2006Namespace;
    WXWord2006Namespace = (uint64_t)v24;

    v26 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/word/2010/wordml"];
    v27 = (void *)WXWord2010Namespace;
    WXWord2010Namespace = (uint64_t)v26;

    v28 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/word/2012/wordml"];
    v29 = (void *)WXWord2012Namespace;
    WXWord2012Namespace = (uint64_t)v28;

    v30 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/word/2012/wordprocessingDrawing"];
    v31 = (void *)WXWord2012DrawingNamespace;
    WXWord2012DrawingNamespace = (uint64_t)v30;

    v32 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/bibliography"];
    v33 = (void *)WXOOBibliographyNamespace;
    WXOOBibliographyNamespace = (uint64_t)v32;

    v34 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/officeDocument/2006/relationships"];
    v35 = (void *)WXRelationshipNamespace;
    WXRelationshipNamespace = (uint64_t)v34;

    v36 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/word/2010/wordprocessingShape"];
    v37 = (void *)WXShapeNamespace;
    WXShapeNamespace = (uint64_t)v36;

    v38 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"];
    v39 = (void *)WXGroupNamespace;
    WXGroupNamespace = (uint64_t)v38;
  }
}

+ (TCEnumerationMap)textDirectionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_32, 0, &dword_238A75000);
  }
  if (+[WXCommon textDirectionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon textDirectionEnumMap]::onceToken, &__block_literal_global_82);
  }
  v2 = (void *)+[WXCommon textDirectionEnumMap]::sTextDirectionEnumMap;
  return (TCEnumerationMap *)v2;
}

void __32__WXCommon_textDirectionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon textDirectionEnumMap]::sTextDirectionEnumStructs count:6 caseSensitive:1];
  v1 = (void *)+[WXCommon textDirectionEnumMap]::sTextDirectionEnumMap;
  +[WXCommon textDirectionEnumMap]::sTextDirectionEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)strictTextDirectionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_104_0, 0, &dword_238A75000);
  }
  if (+[WXCommon strictTextDirectionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon strictTextDirectionEnumMap]::onceToken, &__block_literal_global_106);
  }
  v2 = (void *)+[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumMap;
  return (TCEnumerationMap *)v2;
}

void __38__WXCommon_strictTextDirectionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumStructs count:6 caseSensitive:1];
  v1 = (void *)+[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumMap;
  +[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)justifyEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_137_0, 0, &dword_238A75000);
  }
  if (+[WXCommon justifyEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon justifyEnumMap]::onceToken, &__block_literal_global_139);
  }
  v2 = (void *)+[WXCommon justifyEnumMap]::sJustifyEnumMap;
  return (TCEnumerationMap *)v2;
}

void __26__WXCommon_justifyEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon justifyEnumMap]::sJustifyEnumStructs count:10 caseSensitive:1];
  v1 = (void *)+[WXCommon justifyEnumMap]::sJustifyEnumMap;
  +[WXCommon justifyEnumMap]::sJustifyEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)strictJustifyEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_146_0, 0, &dword_238A75000);
  }
  if (+[WXCommon strictJustifyEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon strictJustifyEnumMap]::onceToken, &__block_literal_global_148);
  }
  v2 = (void *)+[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumMap;
  return (TCEnumerationMap *)v2;
}

void __32__WXCommon_strictJustifyEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumStructs count:10 caseSensitive:1];
  v1 = (void *)+[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumMap;
  +[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)tableWidthTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_161_0, 0, &dword_238A75000);
  }
  if (+[WXCommon tableWidthTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon tableWidthTypeEnumMap]::onceToken, &__block_literal_global_163);
  }
  v2 = (void *)+[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumMap;
  return (TCEnumerationMap *)v2;
}

void __33__WXCommon_tableWidthTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumStructs count:4 caseSensitive:1];
  v1 = (void *)+[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumMap;
  +[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)heightTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_170_0, 0, &dword_238A75000);
  }
  if (+[WXCommon heightTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon heightTypeEnumMap]::onceToken, &__block_literal_global_172);
  }
  v2 = (void *)+[WXCommon heightTypeEnumMap]::sHeightTypeEnumMap;
  return (TCEnumerationMap *)v2;
}

void __29__WXCommon_heightTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon heightTypeEnumMap]::sHeightTypeEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXCommon heightTypeEnumMap]::sHeightTypeEnumMap;
  +[WXCommon heightTypeEnumMap]::sHeightTypeEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)numberFormatEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_350_0, 0, &dword_238A75000);
  }
  if (+[WXCommon numberFormatEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon numberFormatEnumMap]::onceToken, &__block_literal_global_352);
  }
  v2 = (void *)+[WXCommon numberFormatEnumMap]::sNumberFormatEnumMap;
  return (TCEnumerationMap *)v2;
}

void __31__WXCommon_numberFormatEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon numberFormatEnumMap]::sNumberFormatEnumStructs count:59 caseSensitive:1];
  v1 = (void *)+[WXCommon numberFormatEnumMap]::sNumberFormatEnumMap;
  +[WXCommon numberFormatEnumMap]::sNumberFormatEnumMap = (uint64_t)v0;
}

+ (TCEnumerationMap)customNumberFormatEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_539_0, 0, &dword_238A75000);
  }
  if (+[WXCommon customNumberFormatEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXCommon customNumberFormatEnumMap]::onceToken, &__block_literal_global_541);
  }
  v2 = (void *)+[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumMap;
  return (TCEnumerationMap *)v2;
}

void __37__WXCommon_customNumberFormatEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumStructs count:63 caseSensitive:1];
  v1 = (void *)+[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumMap;
  +[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumMap = (uint64_t)v0;
}

@end