@interface GQHTextStyle
+ (BOOL)getDefaultLineHeight:(__CFString *)a3 fontSize:(float)a4 defLineHeight:(int *)a5;
+ (BOOL)platformGetDefaultLineHeight:(__CTFont *)a3 fontSize:(float)a4 defLineHeight:(int *)a5;
+ (__CFString)platformCreateCssFontFamilyStringFromFontName:(__CFString *)a3;
+ (const)name;
+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5;
+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5 isSpan:(BOOL)a6;
+ (void)platformGetTraitsFromFont:(__CTFont *)a3 hasBold:(BOOL *)a4 hasItalic:(BOOL *)a5;
+ (void)reduceFontSizeForSuperscriptedText:(id)a3 style:(id)a4 state:(id)a5;
@end

@implementation GQHTextStyle

+ (void)platformGetTraitsFromFont:(__CTFont *)a3 hasBold:(BOOL *)a4 hasItalic:(BOOL *)a5
{
  *a4 = 0;
  *a5 = 0;
  __int16 SymbolicTraits = CTFontGetSymbolicTraits(a3);
  if ((SymbolicTraits & 0xC61) == 1) {
    *a5 = 1;
  }
  if ((SymbolicTraits & 0xC62) == 2) {
    *a4 = 1;
  }
}

+ (__CFString)platformCreateCssFontFamilyStringFromFontName:(__CFString *)a3
{
  v5 = CTFontCreateWithName(a3, 0.0, 0);
  if (!v5) {
    return 0;
  }
  v6 = v5;
  v7 = (__CFString *)CTFontCopyFullName(v5);
  v8 = (__CFString *)CTFontCopyFamilyName(v6);
  __int16 v12 = 0;
  [a1 platformGetTraitsFromFont:v6 hasBold:(char *)&v12 + 1 hasItalic:&v12];
  v9 = objc_opt_new();
  if ([(__CFString *)v7 length]
    && ([(__CFString *)v7 isEqualToString:a3] & 1) == 0)
  {
    [v9 addObject:v7];
  }
  if (!(HIBYTE(v12) | v12)) {
    [v9 addObject:a3];
  }
  if ([(__CFString *)v8 length]
    && [(__CFString *)v7 length]
    && ([(__CFString *)v8 isEqualToString:v7] & 1) == 0
    && (![(__CFString *)v8 isEqualToString:a3] || v12))
  {
    [v9 addObject:v8];
  }
  v10 = (__CFString *)[v9 componentsJoinedByString:@","];

  CFRelease(v6);
  return v10;
}

+ (BOOL)platformGetDefaultLineHeight:(__CTFont *)a3 fontSize:(float)a4 defLineHeight:(int *)a5
{
  if (a3) {
    BOOL v5 = a5 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    TSWPDefaultLineHeightForFont();
    *(float *)&double v8 = v8;
    *a5 = llroundf(*(float *)&v8);
  }
  return v6;
}

+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5
{
}

+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5 isSpan:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v47 = 0;
  unsigned int v46 = 0;
  char v11 = 0;
  if ([a3 overridesObjectProperty:1 value:&v47])
  {
    id v12 = [a1 platformCreateCssFontFamilyStringFromFontName:v47];
    if (v12) {
      [a4 addAttribute:off_9CE70 value:v12];
    }
    LODWORD(v45) = -1082130432;
    if (([a3 hasValueForFloatProperty:2 value:&v45] & 1) == 0) {
      objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForFloatProperty:value:", 2, &v45);
    }
    LODWORD(v13) = v45;
    if (*(float *)&v45 == -1.0) {
      goto LABEL_12;
    }
    unsigned int v14 = objc_msgSend(a5, "textScale", v13);
    float v16 = *(float *)&v45;
    if (v14)
    {
      float v16 = floorf((float)(*(float *)&v45 * (float)[a5 textScale]) / 100.0);
      *(float *)&id v45 = v16;
    }
    if (v16 <= -1.0
      || (*(float *)&double v15 = v16,
          ![a1 getDefaultLineHeight:v47 fontSize:&v46 defLineHeight:v15]))
    {
LABEL_12:
      char v11 = 0;
    }
    else
    {
      [a4 addAttribute:off_9CEA8 pxValue:v46];
      char v11 = 1;
    }
  }
  if (v6) {
    +[GQHTextSpan handleTextBackgroundForStyle:a3 destStyle:a4 state:a5];
  }
  id v45 = 0;
  if ([a3 overridesObjectProperty:3 value:&v45] && v45)
  {
    unsigned __int8 v17 = [a5 coloredBackground];
    id v18 = v45;
    if ((v17 & 1) == 0)
    {
      [v45 redComponent];
      float v20 = 1.0 - v19;
      [v45 greenComponent];
      float v22 = 1.0 - v21;
      [v45 blueComponent];
      *(float *)&double v23 = 1.0 - v23;
      if (sqrtf((float)((float)(v22 * v22) + (float)(v20 * v20)) + (float)(*(float *)&v23 * *(float *)&v23)) >= 0.1)
      {
        id v18 = v45;
      }
      else
      {
        id v18 = +[GQDColor blackColor];
        id v45 = v18;
      }
    }
    id v24 = [a5 getColorString:v18];
    [a4 addAttribute:off_9CE58 value:v24];
  }
  char v44 = 0;
  if ([a3 overridesBoolProperty:4 value:&v44])
  {
    if (v44) {
      v25 = &off_9CFB0;
    }
    else {
      v25 = &off_9D038;
    }
    [a4 addAttribute:off_9CE90 value:*v25];
  }
  if ([a3 overridesBoolProperty:5 value:&v44])
  {
    if (v44) {
      v26 = &off_9CFF0;
    }
    else {
      v26 = &off_9D038;
    }
    [a4 addAttribute:off_9CE80 value:*v26];
  }
  if ([a5 implicitStyle] != a3)
  {
    float v42 = 0.0;
    int v43 = 0;
    unsigned int v27 = objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForIntProperty:value:", 11, &v43);
    unsigned __int8 v28 = objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForIntProperty:value:", 7, &v42);
    unsigned __int8 v29 = [a3 hasValueForIntProperty:11 value:&v43];
    if (([a3 hasValueForIntProperty:7 value:&v42] & 1) != 0
      || (v29 & 1) != 0
      || (v28 & 1) != 0
      || v27)
    {
      if (v43)
      {
        if (v42 != 0.0)
        {
          CFStringRef v30 = CFStringCreateWithFormat(0, 0, @"%@ %@", off_9D018, off_9D088);
          [a4 addAttribute:off_9CF48 value:v30];
          CFRelease(v30);
          goto LABEL_45;
        }
        v31 = off_9CF48;
        v32 = &off_9D018;
      }
      else
      {
        v31 = off_9CF48;
        if (v42 == 0.0) {
          v32 = &off_9D028;
        }
        else {
          v32 = &off_9D088;
        }
      }
      [a4 addAttribute:v31 value:*v32];
    }
  }
LABEL_45:
  int v43 = 0;
  if ([a3 overridesIntProperty:6 value:&v43])
  {
    int v33 = v43 - 1;
    if ((v43 - 1) > 2)
    {
      v35 = &off_9D028;
      v34 = &off_9CF40;
    }
    else
    {
      v34 = off_80858[v33];
      v35 = off_80870[v33];
    }
    [a4 addAttribute:*v34 value:*v35];
  }
  float v42 = 0.0;
  if ([a3 overridesFloatProperty:2 value:&v42])
  {
    unsigned int v36 = [a5 textScale];
    float v37 = v42;
    if (v36)
    {
      float v37 = floorf((float)(v42 * (float)[a5 textScale]) / 100.0);
      float v42 = v37;
    }
    [a4 addAttribute:off_9CE78 intValue:llroundf(v37)];
    uint64_t v47 = 0;
    if (([a3 hasValueForObjectProperty:1 value:&v47] & 1) == 0) {
      objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForObjectProperty:value:", 1, &v47);
    }
    if (v47)
    {
      if ((v11 & 1) != 0
        || (*(float *)&double v38 = v42, objc_msgSend(a1, "getDefaultLineHeight:fontSize:defLineHeight:", v38)))
      {
        objc_msgSend(a4, "addAttribute:pxValue:", off_9CEA8);
      }
    }
  }
  if ([a3 hasValueForIntProperty:21 value:&v43])
  {
    if (v43 == 2)
    {
      v39 = off_9CF58;
      v40 = &off_9D068;
    }
    else
    {
      if (v43 != 1) {
        return;
      }
      v39 = off_9CF58;
      v40 = &off_9D070;
    }
    [a4 addAttribute:v39 value:*v40];
    +[GQHTextStyle reduceFontSizeForSuperscriptedText:a3 style:a4 state:a5];
  }
  else if ([a3 hasValueForIntProperty:20 value:&v43])
  {
    if (v43 < 1) {
      v41 = &off_9D068;
    }
    else {
      v41 = &off_9D070;
    }
    [a4 addAttribute:off_9CF58 value:*v41];
  }
}

+ (const)name
{
  return "s";
}

+ (BOOL)getDefaultLineHeight:(__CFString *)a3 fontSize:(float)a4 defLineHeight:(int *)a5
{
  CTFontRef v8 = CTFontCreateWithName(a3, a4, 0);
  if (v8)
  {
    CTFontRef v10 = v8;
    *(float *)&double v9 = a4;
    unsigned __int8 v11 = [a1 platformGetDefaultLineHeight:v8 fontSize:a5 defLineHeight:v9];
    CFRelease(v10);
    LOBYTE(v8) = v11;
  }
  return (char)v8;
}

+ (void)reduceFontSizeForSuperscriptedText:(id)a3 style:(id)a4 state:(id)a5
{
  float v8 = 0.0;
  if (([a3 overridesFloatProperty:2 value:&v8] & 1) != 0
    || objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForFloatProperty:value:", 2, &v8))
  {
    float v7 = v8 * 0.7;
    [a4 addAttribute:off_9CE78 intValue:(int)(float)(uint64_t)llroundf(v7)];
  }
}

@end