@interface SFMCachingContactDataProvider
- (void)contactStoreChangedWithNotification:(id)a3;
@end

@implementation SFMCachingContactDataProvider

- (void)contactStoreChangedWithNotification:(id)a3
{
  id v3 = a3;
  uint64_t v4 = swift_retain();
  sub_1D462EE58(v4);

  swift_release();
}

@end