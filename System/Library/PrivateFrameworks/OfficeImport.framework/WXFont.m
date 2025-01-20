@interface WXFont
+ (id)characterSetEnumMap;
+ (id)fontFamilyEnumMap;
+ (id)fontPitchEnumMap;
+ (id)isoCharacterSetEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXFont

+ (id)fontFamilyEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_35, 0, &dword_238A75000);
  }
  if (+[WXFont fontFamilyEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXFont fontFamilyEnumMap]::onceToken, &__block_literal_global_85);
  }
  v2 = (void *)+[WXFont fontFamilyEnumMap]::sFontFamilyEnumMap;
  return v2;
}

void __27__WXFont_fontFamilyEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXFont fontFamilyEnumMap]::sFontFamilyEnumStructs count:6];
  v1 = (void *)+[WXFont fontFamilyEnumMap]::sFontFamilyEnumMap;
  +[WXFont fontFamilyEnumMap]::sFontFamilyEnumMap = (uint64_t)v0;
}

+ (id)characterSetEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_83_1, 0, &dword_238A75000);
  }
  if (+[WXFont characterSetEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXFont characterSetEnumMap]::onceToken, &__block_literal_global_85_1);
  }
  v2 = (void *)+[WXFont characterSetEnumMap]::sCharacterSetEnumMap;
  return v2;
}

void __29__WXFont_characterSetEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXFont characterSetEnumMap]::sCharacterSetEnumStructs count:22];
  v1 = (void *)+[WXFont characterSetEnumMap]::sCharacterSetEnumMap;
  +[WXFont characterSetEnumMap]::sCharacterSetEnumMap = (uint64_t)v0;
}

+ (id)isoCharacterSetEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_137_1, 0, &dword_238A75000);
  }
  if (+[WXFont isoCharacterSetEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXFont isoCharacterSetEnumMap]::onceToken, &__block_literal_global_139_0);
  }
  v2 = (void *)+[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumMap;
  return v2;
}

void __32__WXFont_isoCharacterSetEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumStructs count:18];
  v1 = (void *)+[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumMap;
  +[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumMap = (uint64_t)v0;
}

+ (id)fontPitchEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_149_0, 0, &dword_238A75000);
  }
  if (+[WXFont fontPitchEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXFont fontPitchEnumMap]::onceToken, &__block_literal_global_151_0);
  }
  v2 = (void *)+[WXFont fontPitchEnumMap]::sFontPitchEnumMap;
  return v2;
}

void __26__WXFont_fontPitchEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXFont fontPitchEnumMap]::sFontPitchEnumStructs count:3];
  v1 = (void *)+[WXFont fontPitchEnumMap]::sFontPitchEnumMap;
  +[WXFont fontPitchEnumMap]::sFontPitchEnumMap = (uint64_t)v0;
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 WXMainNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "altName");

  if (v10)
  {
    v11 = [v8 WXMainNamespace];
    id v35 = 0;
    BOOL v12 = CXOptionalStringAttribute(v10, v11, (xmlChar *)"val", &v35);
    id v26 = v35;

    if (v12)
    {
      [v26 componentsSeparatedByString:@","];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v32;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
            v18 = objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet", v26);
            v19 = [v17 stringByTrimmingCharactersInSet:v18];

            if ([v19 length]) {
              [v7 addAlternateName:v19];
            }

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v14);
      }
    }
  }
  unsigned int v30 = 0;
  v20 = objc_msgSend(a1, "fontFamilyEnumMap", v26);
  readEnumProperty<WDFontFamily>(a3, "family", (const xmlChar *)"val", v20, &v30, v8);

  [v7 setFontFamily:v30];
  unsigned int v29 = 0;
  v21 = [a1 characterSetEnumMap];
  char v22 = readEnumProperty<WDCharacterSet>(a3, "charset", (const xmlChar *)"val", v21, &v29, v8);

  if ((v22 & 1) != 0
    || ([a1 isoCharacterSetEnumMap],
        v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = readEnumProperty<WDCharacterSet>(a3, "charset", (const xmlChar *)"characterSet", v23, &v29, v8),
        v23,
        v24))
  {
    [v7 setCharacterSet:v29];
  }
  unsigned int v28 = 0;
  v25 = [a1 fontPitchEnumMap];
  readEnumProperty<WDFontPitch>(a3, "pitch", (const xmlChar *)"val", v25, &v28, v8);

  [v7 setPitch:v28];
}

@end