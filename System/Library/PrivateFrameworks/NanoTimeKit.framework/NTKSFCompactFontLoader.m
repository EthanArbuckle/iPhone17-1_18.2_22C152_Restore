@interface NTKSFCompactFontLoader
+ (id)_loadFontDescriptorForFontWithName:(id)a3;
+ (id)sfCompactNumericFontDescriptor;
+ (id)sfCompactNumericRoundedFontDescriptor;
+ (id)sfCompactNumericSoftFontDescriptor;
@end

@implementation NTKSFCompactFontLoader

+ (id)sfCompactNumericFontDescriptor
{
  if (sfCompactNumericFontDescriptor_onceToken != -1) {
    dispatch_once(&sfCompactNumericFontDescriptor_onceToken, &__block_literal_global_23_0);
  }
  v2 = (void *)sfCompactNumericFontDescriptor_descriptor;
  return v2;
}

void __56__NTKSFCompactFontLoader_sfCompactNumericFontDescriptor__block_invoke()
{
  uint64_t v0 = +[NTKSFCompactFontLoader _loadFontDescriptorForFontWithName:@"SFCompactNumeric"];
  v1 = (void *)sfCompactNumericFontDescriptor_descriptor;
  sfCompactNumericFontDescriptor_descriptor = v0;
}

+ (id)sfCompactNumericSoftFontDescriptor
{
  if (sfCompactNumericSoftFontDescriptor_onceToken != -1) {
    dispatch_once(&sfCompactNumericSoftFontDescriptor_onceToken, &__block_literal_global_28_0);
  }
  v2 = (void *)sfCompactNumericSoftFontDescriptor_descriptor;
  return v2;
}

void __60__NTKSFCompactFontLoader_sfCompactNumericSoftFontDescriptor__block_invoke()
{
  uint64_t v0 = +[NTKSFCompactFontLoader _loadFontDescriptorForFontWithName:@"SFCompactSoft"];
  v1 = (void *)sfCompactNumericSoftFontDescriptor_descriptor;
  sfCompactNumericSoftFontDescriptor_descriptor = v0;
}

+ (id)sfCompactNumericRoundedFontDescriptor
{
  if (sfCompactNumericRoundedFontDescriptor_onceToken != -1) {
    dispatch_once(&sfCompactNumericRoundedFontDescriptor_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)sfCompactNumericRoundedFontDescriptor_descriptor;
  return v2;
}

void __63__NTKSFCompactFontLoader_sfCompactNumericRoundedFontDescriptor__block_invoke()
{
  uint64_t v0 = +[NTKSFCompactFontLoader _loadFontDescriptorForFontWithName:@"SFCompactRoundedNumeric"];
  v1 = (void *)sfCompactNumericRoundedFontDescriptor_descriptor;
  sfCompactNumericRoundedFontDescriptor_descriptor = v0;
}

+ (id)_loadFontDescriptorForFontWithName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"ttf"];

  if (v6)
  {
    CFURLRef v7 = v6;
    CTFontManagerRegisterFontsForURL(v7, kCTFontManagerScopeProcess, 0);
    CFDataRef v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
    FontDescriptorFromData = CTFontManagerCreateFontDescriptorFromData(v8);
    CFRelease(v8);
    CFRelease(v7);
  }
  else
  {
    FontDescriptorFromData = [MEMORY[0x1E4FB08E8] fontDescriptorWithName:@"SF Compact" size:12.0];
  }

  return FontDescriptorFromData;
}

@end