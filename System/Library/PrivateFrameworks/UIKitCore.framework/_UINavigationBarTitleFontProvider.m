@interface _UINavigationBarTitleFontProvider
+ (id)providerForIdiom:(int64_t)a3;
+ (void)registerProviderClass:(Class)a3 forIdiom:(int64_t)a4;
- (id)defaultInlineTitleFont;
- (id)defaultLargeTitleFont;
- (id)defaultTitleFont;
@end

@implementation _UINavigationBarTitleFontProvider

+ (id)providerForIdiom:(int64_t)a3
{
  v4 = (void *)_register;
  if (!_register)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)_register;
    _register = v5;

    v4 = (void *)_register;
  }
  v7 = [NSNumber numberWithInteger:a3];
  id v8 = (id)[v4 objectForKeyedSubscript:v7];

  v9 = objc_opt_new();
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v12 = v11;

  return v12;
}

- (id)defaultLargeTitleFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedTitle0"];
}

- (id)defaultInlineTitleFont
{
  if (_UIBarsUseDynamicType()) {
    [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleShortEmphasizedBody"];
  }
  else {
  v2 = [off_1E52D39B8 defaultFontForTextStyle:@"UICTFontTextStyleShortEmphasizedBody"];
  }
  return v2;
}

- (id)defaultTitleFont
{
  [off_1E52D39B8 defaultFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
}

+ (void)registerProviderClass:(Class)a3 forIdiom:(int64_t)a4
{
  v6 = (void *)_register;
  if (!_register)
  {
    uint64_t v7 = objc_opt_new();
    id v8 = (void *)_register;
    _register = v7;

    v6 = (void *)_register;
  }
  id v9 = [NSNumber numberWithInteger:a4];
  [v6 setObject:a3 forKeyedSubscript:v9];
}

@end