@interface NSObject(SafariCoreExtras)
- (uint64_t)safari_isNSBoolean;
- (void)safari_postKVONotificationsForKey:()SafariCoreExtras aroundBlock:;
@end

@implementation NSObject(SafariCoreExtras)

- (void)safari_postKVONotificationsForKey:()SafariCoreExtras aroundBlock:
{
  v6 = a4;
  id v7 = a3;
  [a1 willChangeValueForKey:v7];
  v6[2](v6);

  [a1 didChangeValueForKey:v7];
}

- (uint64_t)safari_isNSBoolean
{
  return objc_opt_isKindOfClass() & 1;
}

@end