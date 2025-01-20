@interface UIFont(MTUIFonts)
+ (CTFontRef)mtui_lightTimeFontOfSize:()MTUIFonts;
+ (CTFontRef)mtui_thinTimeFontOfSize:()MTUIFonts;
+ (double)mtui_defaultTimeDesignatorFontSize;
+ (double)mtui_defaultTimeFontSize;
+ (id)mtui_defaultTimeDesignatorFont;
+ (id)mtui_lightTimeFont;
+ (id)mtui_thinTimeFont;
- (id)mtui_fontByAddingAttributes:()MTUIFonts;
- (uint64_t)mtui_fontByAddingTimeFontAttributes;
@end

@implementation UIFont(MTUIFonts)

+ (id)mtui_defaultTimeDesignatorFont
{
  v1 = (void *)MEMORY[0x263F1C658];
  objc_msgSend(a1, "mtui_defaultTimeDesignatorFontSize");
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");
  v3 = objc_msgSend(v2, "mtui_fontByAddingAttributes:", 2);

  return v3;
}

- (id)mtui_fontByAddingAttributes:()MTUIFonts
{
  v22[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    char v4 = a3;
    v5 = [a1 fontDescriptor];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = NSNumber;
    [a1 pointSize];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F03AF8]];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    v10 = (void *)MEMORY[0x263F1D220];
    v11 = (uint64_t *)MEMORY[0x263F1D218];
    if (v4)
    {
      uint64_t v12 = *MEMORY[0x263F1D218];
      v21[0] = *MEMORY[0x263F1D220];
      v21[1] = v12;
      v22[0] = &unk_26E929EE8;
      v22[1] = &unk_26E929F00;
      v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      [v9 addObject:v13];
    }
    if ((v4 & 2) != 0)
    {
      uint64_t v14 = *v11;
      v19[0] = *v10;
      v19[1] = v14;
      v20[0] = &unk_26E929F18;
      v20[1] = &unk_26E929F30;
      v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      [v9 addObject:v15];
    }
    [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x263F1D1E8]];
    v16 = [v5 fontDescriptorByAddingAttributes:v6];

    id v17 = [MEMORY[0x263F1C658] fontWithDescriptor:v16 size:0.0];
  }
  else
  {
    id v17 = a1;
  }

  return v17;
}

+ (double)mtui_defaultTimeDesignatorFontSize
{
  return 37.0;
}

+ (id)mtui_thinTimeFont
{
  objc_msgSend(a1, "mtui_defaultTimeFontSize");
  v2 = objc_msgSend(a1, "mtui_thinTimeFontOfSize:");
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();

  return CopyOfSystemUIFontWithGrade;
}

+ (CTFontRef)mtui_thinTimeFontOfSize:()MTUIFonts
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, a1, 0);

  return UIFontForLanguage;
}

+ (double)mtui_defaultTimeFontSize
{
  return 60.0;
}

+ (CTFontRef)mtui_lightTimeFontOfSize:()MTUIFonts
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMiniEmphasizedSystemFontType|0x60, a1, 0);

  return UIFontForLanguage;
}

+ (id)mtui_lightTimeFont
{
  objc_msgSend(a1, "mtui_defaultTimeFontSize");
  v2 = objc_msgSend(a1, "mtui_lightTimeFontOfSize:");
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();

  return CopyOfSystemUIFontWithGrade;
}

- (uint64_t)mtui_fontByAddingTimeFontAttributes
{
  return objc_msgSend(a1, "mtui_fontByAddingAttributes:", 1);
}

@end