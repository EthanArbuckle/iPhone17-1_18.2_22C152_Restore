@interface REBundleConfiguration
+ (void)initialize;
- (Class)dataSourceClassForKey:(id)a3;
- (id)elementGroupWithIdentifier:(id)a3;
@end

@implementation REBundleConfiguration

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
    [v2 registerDefaults:&unk_26CFCD890];
  }
}

- (Class)dataSourceClassForKey:(id)a3
{
  return 0;
}

- (id)elementGroupWithIdentifier:(id)a3
{
  return 0;
}

@end