@interface MSDSetupUILocalization
+ (id)localizedStringForKey:(id)a3;
+ (id)localizedStringForKey:(id)a3 withStringArgument:(id)a4;
@end

@implementation MSDSetupUILocalization

+ (id)localizedStringForKey:(id)a3
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleWithPath:@"/System/Library/PrivateFrameworks/MobileStoreDemoSetupUI.framework"];
  v7 = [v6 localizedStringForKey:v5 value:&stru_26EC8FB50 table:@"Localizable"];

  v8 = [v3 localizedStringWithFormat:v7];

  return v8;
}

+ (id)localizedStringForKey:(id)a3 withStringArgument:(id)a4
{
  id v5 = a4;
  v6 = +[MSDSetupUILocalization localizedStringForKey:a3];
  id v11 = 0;
  v7 = [NSString localizedStringWithValidatedFormat:v6, @"%@", &v11, v5 validFormatSpecifiers error];

  id v8 = v11;
  if (!v7)
  {
    v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[MSDSetupUILocalization localizedStringForKey:withStringArgument:]((uint64_t)v6, v8, v9);
    }
  }
  return v7;
}

+ (void)localizedStringForKey:(NSObject *)a3 withStringArgument:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_23911B000, a3, OS_LOG_TYPE_ERROR, "Failed to validate localized format string %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end