@interface BuyButtonDataManager
- (void)networkReachabilityChangedWithNotification:(id)a3;
- (void)preorderedStateChanged;
@end

@implementation BuyButtonDataManager

- (void)networkReachabilityChangedWithNotification:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v4 = a3;
    swift_retain();
    sub_1005832F8();
    sub_100583068();

    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)preorderedStateChanged
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_retain();
    sub_1005832F8();
    sub_100583068();
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end