@interface APContentDataPrivateWrapper
+ (Class)objectClass;
+ (NSString)kind;
- (BOOL)canBeGarbageCollected;
@end

@implementation APContentDataPrivateWrapper

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (NSString)kind
{
  return (NSString *)@"e";
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