@interface _NSLocalizedStringResource(SHSNavigationComponents)
+ (id)shs_localizedPathComponentForTonePickerSpecifier:()SHSNavigationComponents;
@end

@implementation _NSLocalizedStringResource(SHSNavigationComponents)

+ (id)shs_localizedPathComponentForTonePickerSpecifier:()SHSNavigationComponents
{
  id v3 = a3;
  v4 = NSStringFromClass((Class)[v3 detailControllerClass]);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (![v4 isEqualToString:v6])
  {
    v14 = 0;
    goto LABEL_5;
  }
  v7 = NSStringFromClass((Class)[v3 detailControllerClass]);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F08DB0]);
    v4 = [v3 identifier];
    v6 = [MEMORY[0x263EFF960] currentLocale];
    v12 = SHS_BundleForSoundsAndHapticsSettingsFramework();
    v13 = [v12 bundleURL];
    v14 = (void *)[v11 initWithKey:v4 table:@"Sounds" locale:v6 bundleURL:v13];

LABEL_5:
    goto LABEL_7;
  }
  v14 = 0;
LABEL_7:

  return v14;
}

@end