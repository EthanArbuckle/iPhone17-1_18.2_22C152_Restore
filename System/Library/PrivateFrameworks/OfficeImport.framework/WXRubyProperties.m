@interface WXRubyProperties
+ (id)rubyAlignmentEnumMap;
+ (int)rubyAlignmentFromString:(id)a3;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXRubyProperties

+ (id)rubyAlignmentEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_48, 0, &dword_238A75000);
  }
  if (+[WXRubyProperties rubyAlignmentEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXRubyProperties rubyAlignmentEnumMap]::onceToken, &__block_literal_global_97);
  }
  v2 = (void *)+[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentEnumMap;
  return v2;
}

void __40__WXRubyProperties_rubyAlignmentEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentStructs count:6 caseSensitive:1];
  v1 = (void *)+[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentEnumMap;
  +[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentEnumMap = (uint64_t)v0;
}

+ (int)rubyAlignmentFromString:(id)a3
{
  id v4 = a3;
  v5 = [a1 rubyAlignmentEnumMap];
  uint64_t v6 = [v5 valueForString:v4];

  if (v6 == -130883970) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"rubyAlign"))
    {
      v10 = [v8 WXMainNamespace];
      id v21 = 0;
      CXOptionalStringAttribute(i, v10, (xmlChar *)"val", &v21);
      v11 = (NSString *)v21;

      if (v11)
      {
        if ([(NSString *)v11 length]) {
          objc_msgSend(v7, "setAlignment:", +[WXRubyProperties rubyAlignmentFromString:](WXRubyProperties, "rubyAlignmentFromString:", v11));
        }
      }
LABEL_7:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"hps"))
    {
      uint64_t v20 = 0;
      v12 = [v8 WXMainNamespace];
      BOOL v13 = CXOptionalLongAttribute(i, v12, (xmlChar *)"val", &v20, 15);

      if (v13) {
        [v7 setPhoneticGuideFontSize:(unsigned __int16)v20];
      }
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"hpsRaise"))
    {
      uint64_t v20 = 0;
      v14 = [v8 WXMainNamespace];
      BOOL v15 = CXOptionalLongAttribute(i, v14, (xmlChar *)"val", &v20, 15);

      if (v15) {
        [v7 setDistanceBetween:(unsigned __int16)v20];
      }
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"hpsBaseText"))
    {
      uint64_t v20 = 0;
      v16 = [v8 WXMainNamespace];
      BOOL v17 = CXOptionalLongAttribute(i, v16, (xmlChar *)"val", &v20, 15);

      if (v17) {
        [v7 setBaseFontSize:(unsigned __int16)v20];
      }
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"lid"))
    {
      v18 = [v8 WXMainNamespace];
      id v19 = 0;
      CXOptionalStringAttribute(i, v18, (xmlChar *)"val", &v19);
      v11 = (NSString *)v19;

      if (v11 && [(NSString *)v11 length]) {
        [v7 setPhoneticGuideLanguage:OCDLanguageFromOfficeString(v11)];
      }
      goto LABEL_7;
    }
  }
}

@end