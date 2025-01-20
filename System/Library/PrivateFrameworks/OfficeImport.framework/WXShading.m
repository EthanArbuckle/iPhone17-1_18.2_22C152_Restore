@interface WXShading
+ (id)getColorFromCString:(const char *)a3;
+ (id)getColorFromString:(id)a3;
+ (id)getStringFromColor:(id)a3;
+ (id)shadingStylesEnumMap;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXShading

+ (id)getColorFromString:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "getColorFromCString:", objc_msgSend(v4, "UTF8String"));

  return v5;
}

+ (id)getColorFromCString:(const char *)a3
{
  if (!a3 || !strcmp(a3, "auto"))
  {
    id v4 = +[OITSUColor clearColor];
  }
  else
  {
    uint64_t v7 = 0;
    int v6 = 0;
    if (sscanf(a3, "%02x%02x%02x", (char *)&v7 + 4, &v7, &v6) == 3)
    {
      id v4 = +[OITSUColor colorWithCalibratedRed:(double)SHIDWORD(v7) / 255.0 green:(double)(int)v7 / 255.0 blue:(double)v6 / 255.0 alpha:1.0];
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

+ (id)shadingStylesEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_41, 0, &dword_238A75000);
  }
  if (+[WXShading shadingStylesEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXShading shadingStylesEnumMap]::onceToken, &__block_literal_global_91);
  }
  v2 = (void *)+[WXShading shadingStylesEnumMap]::sShadingStylesEnumMap;
  return v2;
}

void __33__WXShading_shadingStylesEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXShading shadingStylesEnumMap]::sShadingStylesEnumStructs count:38 caseSensitive:1];
  v1 = (void *)+[WXShading shadingStylesEnumMap]::sShadingStylesEnumMap;
  +[WXShading shadingStylesEnumMap]::sShadingStylesEnumMap = (uint64_t)v0;
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v24 = 0;
  v10 = [a1 shadingStylesEnumMap];
  readEnumProperty<WDShadingStyle>(a3, (const xmlChar *)"val", v10, &v24);

  uint64_t v11 = v24;
  if (v24 == -130883970)
  {
    uint64_t v11 = 0;
    unsigned int v24 = 0;
  }
  [v8 setStyle:v11];
  v12 = [v9 WXMainNamespace];
  v13 = CXDefaultStringAttribute(a3, v12, (xmlChar *)"color", 0);

  v14 = +[WXShading getColorFromString:v13];
  v15 = +[OITSUColor clearColor];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
    uint64_t v17 = +[WDShading autoForegroundColor];

    v14 = (void *)v17;
  }
  [v8 setForeground:v14];
  v18 = [v9 WXMainNamespace];
  v19 = CXDefaultStringAttribute(a3, v18, (xmlChar *)"fill", 0);

  v20 = +[WXShading getColorFromString:v19];
  v21 = +[OITSUColor clearColor];
  int v22 = [v20 isEqual:v21];

  if (v22)
  {
    uint64_t v23 = +[WDShading autoBackgroundColor];

    v20 = (void *)v23;
  }
  [v8 setBackground:v20];
}

+ (id)getStringFromColor:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = +[WDShading autoBackgroundColor];
  v5 = v3;
  if (v4 == v3) {
    goto LABEL_7;
  }
  id v6 = +[WDShading autoForegroundColor];
  if (v6 == v3)
  {

    v5 = v4;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v7 = +[OITSUColor clearColor];
  char v8 = [v3 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    [v3 redComponent];
    double v10 = v9;
    [v3 greenComponent];
    double v12 = v11;
    [v3 blueComponent];
    objc_msgSend(NSString, "stringWithFormat:", @"%02x%02x%02x", (int)(v10 * 255.0), (int)(v12 * 255.0), (int)(v13 * 255.0));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_8:
  v14 = @"auto";
LABEL_9:

  return v14;
}

@end