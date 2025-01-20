@interface SFTabSwitcherPageOverlay
+ (SFTabSwitcherPageOverlay)emptyPrivateBrowsing;
+ (id)lockedPrivateBrowsingOverlayWithUnlockHandler:(id)a3;
- (SFTabSwitcherPageOverlay)init;
@end

@implementation SFTabSwitcherPageOverlay

- (void).cxx_destruct
{
}

+ (SFTabSwitcherPageOverlay)emptyPrivateBrowsing
{
  v2 = (char *)objc_allocWithZone((Class)SFTabSwitcherPageOverlay);
  v3 = &v2[OBJC_IVAR___SFTabSwitcherPageOverlay_wrapped];
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  v6.receiver = v2;
  v6.super_class = (Class)SFTabSwitcherPageOverlay;
  id v4 = objc_msgSendSuper2(&v6, sel_init);

  return (SFTabSwitcherPageOverlay *)v4;
}

+ (id)lockedPrivateBrowsingOverlayWithUnlockHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  v5 = (char *)objc_allocWithZone((Class)SFTabSwitcherPageOverlay);
  objc_super v6 = &v5[OBJC_IVAR___SFTabSwitcherPageOverlay_wrapped];
  *(void *)objc_super v6 = sub_18C58C138;
  *((void *)v6 + 1) = v4;
  v9.receiver = v5;
  v9.super_class = (Class)SFTabSwitcherPageOverlay;
  id v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

- (SFTabSwitcherPageOverlay)init
{
  result = (SFTabSwitcherPageOverlay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end