@interface UIFont(Private)
+ (id)_smu_preferredFontForTextStyle:()Private design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:;
+ (id)_smu_preferredFontForTextStyle:()Private variant:maximumContentSizeCategory:compatibleWithTraitCollection:;
+ (id)_stringForSystemDesign:()Private;
+ (id)smu_preferredFontForTextStyle:()Private design:variant:;
+ (id)smu_preferredFontForTextStyle:()Private design:variant:compatibleWithTraitCollection:;
+ (id)smu_preferredFontForTextStyle:()Private variant:;
+ (uint64_t)_smu_preferredFontForTextStyle:()Private maximumContentSizeCategory:compatibleWithTraitCollection:;
+ (uint64_t)_underlyingVariantForVariant:()Private;
@end

@implementation UIFont(Private)

+ (id)smu_preferredFontForTextStyle:()Private variant:
{
  v6 = (void *)MEMORY[0x263F81708];
  id v7 = a3;
  v8 = objc_msgSend(v6, "_preferredFontForTextStyle:variant:", v7, objc_msgSend(a1, "_underlyingVariantForVariant:", a4));

  return v8;
}

+ (id)smu_preferredFontForTextStyle:()Private design:variant:
{
  v8 = (void *)MEMORY[0x263F81708];
  id v9 = a3;
  v10 = [a1 _stringForSystemDesign:a4];
  v11 = objc_msgSend(v8, "_preferredFontForTextStyle:design:variant:", v9, v10, objc_msgSend(a1, "_underlyingVariantForVariant:", a5));

  return v11;
}

+ (id)smu_preferredFontForTextStyle:()Private design:variant:compatibleWithTraitCollection:
{
  v10 = (void *)MEMORY[0x263F81708];
  id v11 = a6;
  id v12 = a3;
  v13 = [a1 _stringForSystemDesign:a4];
  v14 = objc_msgSend(v10, "_preferredFontForTextStyle:design:variant:compatibleWithTraitCollection:", v12, v13, objc_msgSend(a1, "_underlyingVariantForVariant:", a5), v11);

  return v14;
}

+ (uint64_t)_smu_preferredFontForTextStyle:()Private maximumContentSizeCategory:compatibleWithTraitCollection:
{
  return objc_msgSend(MEMORY[0x263F81708], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:");
}

+ (id)_smu_preferredFontForTextStyle:()Private variant:maximumContentSizeCategory:compatibleWithTraitCollection:
{
  v10 = (void *)MEMORY[0x263F81708];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [a1 _stringForSystemDesign:0];
  v15 = objc_msgSend(v10, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v13, v14, objc_msgSend(a1, "_underlyingVariantForVariant:", a4), v12, v11);

  return v15;
}

+ (id)_smu_preferredFontForTextStyle:()Private design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:
{
  id v12 = (void *)MEMORY[0x263F81708];
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [a1 _stringForSystemDesign:a4];
  v17 = objc_msgSend(v12, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", v15, v16, objc_msgSend(a1, "_underlyingVariantForVariant:", a5), v14, v13);

  return v17;
}

+ (id)_stringForSystemDesign:()Private
{
  if (a3 <= 3) {
    a1 = **((id **)&unk_264DBCFB8 + a3);
  }
  return a1;
}

+ (uint64_t)_underlyingVariantForVariant:()Private
{
  if (a3 == 0x10000) {
    uint64_t v3 = 0x10000;
  }
  else {
    uint64_t v3 = 0;
  }
  if (a3 == 1280) {
    uint64_t v3 = 1280;
  }
  if (a3 == 1024) {
    uint64_t v4 = 1024;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a3 == 512) {
    uint64_t v4 = 512;
  }
  if (a3 <= 1279) {
    uint64_t v3 = v4;
  }
  if (a3 == 256) {
    uint64_t v5 = 256;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a3 == 8) {
    uint64_t v5 = 8;
  }
  if (a3 == 4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a3 == 2) {
    uint64_t v6 = 2;
  }
  if (a3 <= 7) {
    uint64_t v5 = v6;
  }
  if (a3 <= 511) {
    return v5;
  }
  else {
    return v3;
  }
}

@end