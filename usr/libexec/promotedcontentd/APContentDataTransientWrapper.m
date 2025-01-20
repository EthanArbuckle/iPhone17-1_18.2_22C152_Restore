@interface APContentDataTransientWrapper
+ (Class)objectClass;
+ (id)kind;
- (BOOL)canBeGarbageCollected;
@end

@implementation APContentDataTransientWrapper

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)kind
{
  return @"f";
}

- (BOOL)canBeGarbageCollected
{
  v3 = [(APCacheableBaseObject *)self identifier];
  unsigned __int8 v4 = sub_10017FF74((uint64_t)APManagedContentData, v3);

  if (v4) {
    return 0;
  }
  v6 = [(APCacheableBaseObject *)self identifier];
  unsigned __int8 v7 = sub_10018031C((uint64_t)APManagedContentData, v6);

  return v7 ^ 1;
}

@end