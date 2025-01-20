@interface UITraitCollection(IC)
+ (id)ic_traitsAffectingSize;
+ (id)ic_traitsAffectingSizeAndColor;
+ (uint64_t)ic_alwaysShowLightContent;
+ (void)setIc_alwaysShowLightContent:()IC;
- (BOOL)ic_hasCompactHeight;
- (BOOL)ic_hasCompactWidth;
- (BOOL)ic_hasEqualSizeToTraitCollection:()IC;
- (BOOL)ic_isDark;
- (id)ic_traitCollectionByAppendingNonNilTraitCollection:()IC;
- (uint64_t)ic_appearanceInfo;
- (uint64_t)ic_hasCompactSize;
@end

@implementation UITraitCollection(IC)

+ (uint64_t)ic_alwaysShowLightContent
{
  return [MEMORY[0x1E4F837D0] BOOLForKey:@"ICAlwaysShowLightContentDefaultsKey"];
}

- (BOOL)ic_hasCompactWidth
{
  return [a1 horizontalSizeClass] == 1;
}

- (BOOL)ic_hasCompactHeight
{
  return [a1 verticalSizeClass] == 1;
}

- (uint64_t)ic_appearanceInfo
{
  uint64_t v1 = objc_msgSend(a1, "ic_isDark");
  v2 = (void *)MEMORY[0x1E4F83298];
  return [v2 appearanceInfoWithType:v1];
}

- (BOOL)ic_isDark
{
  return [a1 userInterfaceStyle] == 2;
}

- (id)ic_traitCollectionByAppendingNonNilTraitCollection:()IC
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  v5 = v4;
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E4FB1E20];
    v12[0] = v4;
    v12[1] = a3;
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a3;
    v9 = [v7 arrayWithObjects:v12 count:2];
    uint64_t v10 = [v6 traitCollectionWithTraitsFromCollections:v9];

    v5 = (void *)v10;
  }
  return v5;
}

- (uint64_t)ic_hasCompactSize
{
  if (objc_msgSend(a1, "ic_hasCompactWidth")) {
    return 1;
  }
  return objc_msgSend(a1, "ic_hasCompactHeight");
}

+ (void)setIc_alwaysShowLightContent:()IC
{
  [MEMORY[0x1E4F837D0] setBool:a3 forKey:@"ICAlwaysShowLightContentDefaultsKey"];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICAlwaysShowLightContentDidChangeNotification" object:0];
}

- (BOOL)ic_hasEqualSizeToTraitCollection:()IC
{
  id v4 = a3;
  uint64_t v5 = [a1 horizontalSizeClass];
  if (v5 == [v4 horizontalSizeClass])
  {
    uint64_t v6 = [a1 verticalSizeClass];
    BOOL v7 = v6 == [v4 verticalSizeClass];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)ic_traitsAffectingSizeAndColor
{
  v2 = objc_msgSend(a1, "ic_traitsAffectingSize");
  id v3 = [a1 systemTraitsAffectingColorAppearance];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)ic_traitsAffectingSize
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  return v0;
}

@end