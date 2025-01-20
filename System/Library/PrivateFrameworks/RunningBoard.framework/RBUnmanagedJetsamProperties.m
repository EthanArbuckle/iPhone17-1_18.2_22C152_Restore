@interface RBUnmanagedJetsamProperties
+ (id)new;
- (BOOL)isValid;
- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4;
@end

@implementation RBUnmanagedJetsamProperties

- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4
{
  return 0;
}

+ (id)new
{
  return objc_alloc_init(RBUnmanagedJetsamProperties);
}

- (BOOL)isValid
{
  return 0;
}

@end