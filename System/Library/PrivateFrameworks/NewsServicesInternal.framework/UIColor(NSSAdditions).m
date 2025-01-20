@interface UIColor(NSSAdditions)
+ (id)nss_dynamicColor:()NSSAdditions withDarkStyleVariant:;
@end

@implementation UIColor(NSSAdditions)

+ (id)nss_dynamicColor:()NSSAdditions withDarkStyleVariant:
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F42F80];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 traitCollectionWithUserInterfaceStyle:0];
  v9 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [MEMORY[0x1E4F428B8] _dynamicColorWithColorsByTraitCollection:v10];

  return v11;
}

@end