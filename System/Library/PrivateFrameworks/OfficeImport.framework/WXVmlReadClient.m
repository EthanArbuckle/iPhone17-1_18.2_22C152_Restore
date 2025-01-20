@interface WXVmlReadClient
+ (BOOL)floating:(id)a3;
+ (double)wrapDistanceBottom:(id)a3;
+ (double)wrapDistanceLeft:(id)a3;
+ (double)wrapDistanceRight:(id)a3;
+ (double)wrapDistanceTop:(id)a3;
+ (int)horizontalPosition:(id)a3;
+ (int)relativeHorizontalPosition:(id)a3;
+ (int)relativeVerticalPosition:(id)a3;
+ (int)verticalPosition:(id)a3;
+ (int)vmlSupportLevel;
+ (int)zIndex:(id)a3;
+ (void)copyFromDrawable:(id)a3 toContent:(id)a4;
+ (void)initialize;
+ (void)readClientDataFromGroup:(_xmlNode *)a3 toGroup:(id)a4 state:(id)a5;
+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5;
+ (void)readFromDrawable:(_xmlNode *)a3 toContent:(id)a4;
+ (void)readTextWrappingFromParent:(_xmlNode *)a3 toAnchor:(id)a4;
@end

@implementation WXVmlReadClient

+ (void)initialize
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_46, 0, &dword_238A75000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_96_0, 0, &dword_238A75000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_106_0, 0, &dword_238A75000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_131_0, 0, &dword_238A75000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_138_0, 0, &dword_238A75000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_148_0, 0, &dword_238A75000);
  }
  if (!sTextWrappingModeEnumMap)
  {
    v3 = [[TCEnumerationMap alloc] initWithStructs:&WXCreateEnumMaps(void)::sTextWrappingModeStructs count:5 caseSensitive:1];
    v4 = (void *)sTextWrappingModeEnumMap;
    sTextWrappingModeEnumMap = (uint64_t)v3;

    v5 = [[TCEnumerationMap alloc] initWithStructs:&WXCreateEnumMaps(void)::sTextWrappingSideStructs count:4 caseSensitive:1];
    v6 = (void *)sTextWrappingSideEnumMap;
    sTextWrappingSideEnumMap = (uint64_t)v5;

    v7 = [[TCEnumerationMap alloc] initWithStructs:&WXCreateEnumMaps(void)::sHorizontalPositionStructs count:6 caseSensitive:1];
    v8 = (void *)sHorizontalPositionEnumMap;
    sHorizontalPositionEnumMap = (uint64_t)v7;

    v9 = [[TCEnumerationMap alloc] initWithStructs:&WXCreateEnumMaps(void)::sRelativeHorizontalPositionStructs count:8 caseSensitive:1];
    v10 = (void *)sRelativeHorizontalPositionEnumMap;
    sRelativeHorizontalPositionEnumMap = (uint64_t)v9;

    v11 = [[TCEnumerationMap alloc] initWithStructs:&WXCreateEnumMaps(void)::sVerticalPositionStructs count:6 caseSensitive:1];
    v12 = (void *)sVerticalPositionEnumMap;
    sVerticalPositionEnumMap = (uint64_t)v11;

    v13 = [[TCEnumerationMap alloc] initWithStructs:&WXCreateEnumMaps(void)::sRelativeVerticalPositionStructs count:8 caseSensitive:1];
    v14 = (void *)sRelativeVerticalPositionEnumMap;
    sRelativeVerticalPositionEnumMap = (uint64_t)v13;
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___WXVmlReadClient;
  objc_msgSendSuper2(&v15, sel_initialize);
}

+ (void)copyFromDrawable:(id)a3 toContent:(id)a4
{
  id v8 = a4;
  v5 = [a3 drawableProperties];
  v6 = [v5 orientedBounds];

  v7 = [v8 anchor];
  [v6 bounds];
  objc_msgSend(v7, "setBounds:");
}

+ (int)horizontalPosition:(id)a3
{
  id v3 = a3;
  if (v3) {
    int v4 = [(id)sHorizontalPositionEnumMap valueForString:v3];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

+ (int)relativeHorizontalPosition:(id)a3
{
  id v3 = a3;
  if (v3) {
    int v4 = [(id)sRelativeHorizontalPositionEnumMap valueForString:v3];
  }
  else {
    int v4 = 2;
  }

  return v4;
}

+ (int)verticalPosition:(id)a3
{
  id v3 = a3;
  if (v3) {
    int v4 = [(id)sVerticalPositionEnumMap valueForString:v3];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

+ (int)relativeVerticalPosition:(id)a3
{
  id v3 = a3;
  if (v3) {
    int v4 = [(id)sRelativeVerticalPositionEnumMap valueForString:v3];
  }
  else {
    int v4 = 2;
  }

  return v4;
}

+ (double)wrapDistanceLeft:(id)a3
{
  id v3 = (NSString *)a3;
  int v4 = v3;
  if (v3) {
    double v5 = OAVReadLength(v3);
  }
  else {
    double v5 = 9.0;
  }

  return v5;
}

+ (double)wrapDistanceTop:(id)a3
{
  id v3 = (NSString *)a3;
  int v4 = v3;
  if (v3) {
    double v5 = OAVReadLength(v3);
  }
  else {
    double v5 = 0.0;
  }

  return v5;
}

+ (double)wrapDistanceRight:(id)a3
{
  id v3 = (NSString *)a3;
  int v4 = v3;
  if (v3) {
    double v5 = OAVReadLength(v3);
  }
  else {
    double v5 = 9.0;
  }

  return v5;
}

+ (double)wrapDistanceBottom:(id)a3
{
  id v3 = (NSString *)a3;
  int v4 = v3;
  if (v3) {
    double v5 = OAVReadLength(v3);
  }
  else {
    double v5 = 0.0;
  }

  return v5;
}

+ (BOOL)floating:(id)a3
{
  return [a3 isEqualToString:@"absolute"];
}

+ (int)zIndex:(id)a3
{
  return [a3 intValue];
}

+ (void)readFromDrawable:(_xmlNode *)a3 toContent:(id)a4
{
  id v23 = a4;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = OAVReadComposite(v6);
  id v8 = [v7 objectForKey:@"position"];
  char v9 = [a1 floating:v8];

  if (v9)
  {
    v10 = [v23 createAnchor];
    v11 = [v7 objectForKey:@"mso-position-horizontal"];
    objc_msgSend(v10, "setHorizontalPosition:", objc_msgSend(a1, "horizontalPosition:", v11));

    v12 = [v7 objectForKey:@"mso-position-horizontal-relative"];
    objc_msgSend(v10, "setRelativeHorizontalPosition:", objc_msgSend(a1, "relativeHorizontalPosition:", v12));

    v13 = [v7 objectForKey:@"mso-position-vertical"];
    objc_msgSend(v10, "setVerticalPosition:", objc_msgSend(a1, "verticalPosition:", v13));

    v14 = [v7 objectForKey:@"mso-position-vertical-relative"];
    objc_msgSend(v10, "setRelativeVerticalPosition:", objc_msgSend(a1, "relativeVerticalPosition:", v14));

    objc_super v15 = [v7 objectForKey:@"mso-wrap-distance-left"];
    [a1 wrapDistanceLeft:v15];
    objc_msgSend(v10, "setWrapDistanceLeft:");

    v16 = [v7 objectForKey:@"mso-wrap-distance-top"];
    [a1 wrapDistanceTop:v16];
    objc_msgSend(v10, "setWrapDistanceTop:");

    v17 = [v7 objectForKey:@"mso-wrap-distance-right"];
    [a1 wrapDistanceRight:v17];
    objc_msgSend(v10, "setWrapDistanceRight:");

    v18 = [v7 objectForKey:@"mso-wrap-distance-bottom"];
    [a1 wrapDistanceBottom:v18];
    objc_msgSend(v10, "setWrapDistanceBottom:");

    v19 = [v23 drawable];
    v20 = [v19 drawableProperties];
    v21 = [v20 orientedBounds];
    [v21 bounds];
    objc_msgSend(v10, "setBounds:");

    v22 = [v7 objectForKey:@"z-index"];
    objc_msgSend(v10, "setZIndex:", (int)objc_msgSend(a1, "zIndex:", v22));

    [a1 readTextWrappingFromParent:a3 toAnchor:v10];
  }
}

+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5
{
  id v39 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = [v39 textBody];
    v10 = [v9 properties];

    if ([v10 hasTextWarp])
    {
      v11 = [v10 textWarp];
      BOOL v12 = v11 != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
    [v10 setIsUpright:!v12];
  }
  v13 = objc_alloc_init(WDAContent);
  [(WDAContent *)v13 setDrawable:v39];
  [v39 setClientData:v13];
  v14 = [v8 wxReadState];
  -[WDAContent setTextType:](v13, "setTextType:", [v14 currentOfficeArtTextType]);

  if (CXDefaultBoolAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"hr", 0))
  {
    float v15 = (double)CXDefaultLongAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"hrpct", 1000)
        / 1000.0;
    if (v15 != 0.0)
    {
      v16 = [v39 graphicProperties];
      v17 = [v16 orientedBounds];
      [v17 bounds];
      double v19 = v18;
      v20 = [v8 wxReadState];
      v21 = [v20 document];
      v22 = [v21 lastSection];

      if ([v22 isPageWidthOverridden]) {
        double v23 = (float)[v22 pageWidth] / 20.0;
      }
      else {
        double v23 = 612.0;
      }
      if ([v22 isLeftMarginOverridden]) {
        double v24 = (float)[v22 leftMargin] / 20.0;
      }
      else {
        double v24 = 72.0;
      }
      if ([v22 isRightMarginOverridden]) {
        double v25 = (float)[v22 rightMargin] / 20.0;
      }
      else {
        double v25 = 72.0;
      }
      if ([v22 isColumnCountOverridden]) {
        int v26 = [v22 columnCount];
      }
      else {
        int v26 = 1;
      }
      int v27 = [v22 isColumnSpaceOverridden];
      float v28 = 0.0;
      if (v27) {
        float v28 = (float)objc_msgSend(v22, "columnSpace", 0.0) / 20.0;
      }
      float v29 = v19;
      float v30 = v23;
      float v31 = v24;
      float v32 = v25;
      v33 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, 0.0, (float)((float)((float)((float)(v30 - (float)(v31 + v32)) - (float)((float)(v26 - 1) * v28)) / (float)v26) * v15), v29);

      [v16 setOrientedBounds:v33];
    }
  }
  [a1 readFromDrawable:a3 toContent:v13];
  uint64_t v34 = OCXFindChild(a3, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
  if (v34)
  {
    v35 = +[WXTextBox readFrom:v34 parent:v13 state:v8];
    v36 = [v8 wxReadState];
    v37 = [v36 document];
    [(WDAContent *)v13 setTextBox:v35 document:v37];

    uint64_t v38 = [v35 nextTextBoxId];
    if (v38 == [v39 id]) {
      [v35 setNextTextBoxId:0];
    }
  }
}

+ (void)readClientDataFromGroup:(_xmlNode *)a3 toGroup:(id)a4 state:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  char v9 = objc_alloc_init(WDAContent);
  [(WDAContent *)v9 setDrawable:v11];
  [v11 setClientData:v9];
  v10 = [v8 wxReadState];
  -[WDAContent setTextType:](v9, "setTextType:", [v10 currentOfficeArtTextType]);

  [a1 readFromDrawable:a3 toContent:v9];
}

+ (int)vmlSupportLevel
{
  return 1;
}

+ (void)readTextWrappingFromParent:(_xmlNode *)a3 toAnchor:(id)a4
{
  id v5 = a4;
  v6 = (const xmlNode *)OCXFindChild(a3, (CXNamespace *)WXVmlNamespace, "wrap");
  v7 = v6;
  unsigned int v8 = 0;
  int v9 = 3;
  if (v6)
  {
    readEnumProperty<WDATextWrappingMode>(v6, (const xmlChar *)"type", (void *)sTextWrappingModeEnumMap, &v9);
    readEnumProperty<WDATextWrappingModeType>(v7, (const xmlChar *)"side", (void *)sTextWrappingSideEnumMap, &v8);
  }
  objc_msgSend(v5, "setTextWrappingMode:");
  [v5 setTextWrappingModeType:v8];
}

@end