@interface REWalletBundleConfiguration
- (Class)dataSourceClassForKey:(id)a3;
@end

@implementation REWalletBundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  if ([a3 isEqualToString:RESampleDataSourceKey])
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