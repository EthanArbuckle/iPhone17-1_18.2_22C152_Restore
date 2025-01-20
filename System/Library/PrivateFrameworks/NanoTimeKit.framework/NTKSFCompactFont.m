@interface NTKSFCompactFont
+ (id)fontOfType:(int64_t)a3 size:(double)a4 weight:(double)a5;
+ (id)numericFontOfSize:(double)a3 weight:(double)a4;
+ (id)numericRoundedFontOfSize:(double)a3 weight:(double)a4;
+ (id)numericSoftFontOfSize:(double)a3 weight:(double)a4;
@end

@implementation NTKSFCompactFont

+ (id)numericFontOfSize:(double)a3 weight:(double)a4
{
  return +[NTKSFCompactFont fontOfType:1 size:a3 weight:a4];
}

+ (id)numericSoftFontOfSize:(double)a3 weight:(double)a4
{
  return +[NTKSFCompactFont fontOfType:2 size:a3 weight:a4];
}

+ (id)numericRoundedFontOfSize:(double)a3 weight:(double)a4
{
  return +[NTKSFCompactFont fontOfType:3 size:a3 weight:a4];
}

+ (id)fontOfType:(int64_t)a3 size:(double)a4 weight:(double)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v10 = *MEMORY[0x1E4FB09E0];
  if (*MEMORY[0x1E4FB09E0] == a5) {
    double v10 = *MEMORY[0x1E4FB09B8];
  }
  if (IsBoldTextEnabled) {
    a5 = v10;
  }
  if (fontOfType_size_weight__onceToken != -1) {
    dispatch_once(&fontOfType_size_weight__onceToken, &__block_literal_global_152);
  }
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"t%ld-s%f-w%f", a3, *(void *)&a4, *(void *)&a5);
  v12 = [(id)fontOfType_size_weight____fontCache objectForKey:v11];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    switch(a3)
    {
      case 3:
        v14 = +[NTKSFCompactFontLoader sfCompactNumericRoundedFontDescriptor];
        v15 = @"SF Compact Rounded Numeric";
        break;
      case 2:
        v14 = +[NTKSFCompactFontLoader sfCompactNumericSoftFontDescriptor];
        v15 = @"SF Compact Soft";
        break;
      case 1:
        v14 = +[NTKSFCompactFontLoader sfCompactNumericFontDescriptor];
        v15 = @"SF Compact Numeric";
        break;
      default:
        v14 = 0;
        v15 = 0;
        break;
    }
    v16 = [v14 fontAttributes];
    v17 = (void *)[v16 mutableCopy];

    uint64_t v24 = *MEMORY[0x1E4FB09F0];
    v18 = [NSNumber numberWithDouble:a5];
    v25[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB0950]];

    [v17 setObject:0 forKeyedSubscript:*MEMORY[0x1E4FB0918]];
    [v17 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB0908]];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v17];

    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_METACLASS___NTKSFCompactFont;
    v21 = objc_msgSendSuper2(&v23, sel_fontWithDescriptor_size_, v20, a4);
    [(id)fontOfType_size_weight____fontCache setObject:v21 forKey:v11];
    id v13 = v21;
  }
  return v13;
}

void __43__NTKSFCompactFont_fontOfType_size_weight___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)fontOfType_size_weight____fontCache;
  fontOfType_size_weight____fontCache = (uint64_t)v0;
}

@end