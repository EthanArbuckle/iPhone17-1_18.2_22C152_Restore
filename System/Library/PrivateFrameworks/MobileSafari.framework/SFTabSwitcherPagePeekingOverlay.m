@interface SFTabSwitcherPagePeekingOverlay
+ (SFTabSwitcherPagePeekingOverlay)lockedPrivateBrowsing;
+ (SFTabSwitcherPagePeekingOverlay)privateBrowsing;
- (SFTabSwitcherPagePeekingOverlay)init;
@end

@implementation SFTabSwitcherPagePeekingOverlay

+ (SFTabSwitcherPagePeekingOverlay)privateBrowsing
{
  v2 = objc_allocWithZone((Class)SFTabSwitcherPagePeekingOverlay);
  v2[OBJC_IVAR___SFTabSwitcherPagePeekingOverlay_wrapped] = 2;
  v5.receiver = v2;
  v5.super_class = (Class)SFTabSwitcherPagePeekingOverlay;
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return (SFTabSwitcherPagePeekingOverlay *)v3;
}

+ (SFTabSwitcherPagePeekingOverlay)lockedPrivateBrowsing
{
  v2 = objc_allocWithZone((Class)SFTabSwitcherPagePeekingOverlay);
  v2[OBJC_IVAR___SFTabSwitcherPagePeekingOverlay_wrapped] = 0;
  v5.receiver = v2;
  v5.super_class = (Class)SFTabSwitcherPagePeekingOverlay;
  id v3 = objc_msgSendSuper2(&v5, sel_init);

  return (SFTabSwitcherPagePeekingOverlay *)v3;
}

- (SFTabSwitcherPagePeekingOverlay)init
{
  result = (SFTabSwitcherPagePeekingOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end