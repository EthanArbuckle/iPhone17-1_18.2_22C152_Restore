@interface REHomeBundleConfiguration
- (Class)dataSourceClassForKey:(id)a3;
@end

@implementation REHomeBundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F62DF0]])
  {
    v3 = objc_opt_class();
  }
  else
  {
    v3 = 0;
  }

  return (Class)v3;
}

@end