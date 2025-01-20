@interface NSREBundleConfiguration
- (Class)dataSourceClassForKey:(id)a3;
@end

@implementation NSREBundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  id v3 = a3;
  if (([(id)*MEMORY[0x263F62DE8] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263F62DC8] isEqualToString:v3] & 1) != 0
    || [(id)*MEMORY[0x263F62DF0] isEqualToString:v3])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

@end