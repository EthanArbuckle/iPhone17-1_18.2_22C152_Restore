@interface APContextWrapper
+ (Class)objectClass;
+ (NSString)kind;
- (BOOL)canBeGarbageCollected;
@end

@implementation APContextWrapper

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (NSString)kind
{
  return (NSString *)@"c";
}

- (BOOL)canBeGarbageCollected
{
  v3 = [(APCacheableBaseObject *)self identifier];
  unsigned __int8 v4 = sub_10017FF74((uint64_t)APManagedContext, v3);

  if (v4) {
    return 0;
  }
  v6 = [(APCacheableBaseObject *)self identifier];
  unsigned __int8 v7 = sub_10018031C((uint64_t)APManagedContext, v6);

  return v7 ^ 1;
}

@end