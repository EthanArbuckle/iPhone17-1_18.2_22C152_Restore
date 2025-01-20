@interface CRLStatusHUDManager
- (BOOL)alwaysUseDarkAppearance;
- (BOOL)ready;
- (UIView)containerView;
- (_TtC8Freeform19CRLStatusHUDManager)init;
- (double)maxHUDWidth;
- (double)maxTextWidth;
- (id)delayedControllers;
- (int64_t)containerViewVerticalLayoutGravity;
- (void)hideAllControllers;
- (void)hideWithHudController:(id)a3;
- (void)replaceHudController:(id)a3 withHudController:(id)a4;
- (void)setAlwaysUseDarkAppearance:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setContainerViewVerticalLayoutGravity:(int64_t)a3;
- (void)setDelayedControllers:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)showWithHudController:(id)a3;
- (void)showWithHudController:(id)a3 withDelay:(double)a4;
- (void)updateForAppearance;
@end

@implementation CRLStatusHUDManager

- (BOOL)ready
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready;
  swift_beginAccess();
  return *v2;
}

- (void)setReady:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready;
  swift_beginAccess();
  unsigned char *v5 = v3;
  if (v3)
  {
    v6 = self;
    sub_100E89F18();
  }
}

- (id)delayedControllers
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_delayedControllers);
  swift_beginAccess();
  return *v2;
}

- (void)setDelayedControllers:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_delayedControllers);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (UIView)containerView
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setContainerView:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView);
  swift_beginAccess();
  id v6 = *v5;
  void *v5 = a3;
  id v7 = a3;
  v8 = self;

  v9 = (char *)v8 + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready;
  swift_beginAccess();
  if (*v9 == 1) {
    sub_100E89F18();
  }
}

- (BOOL)alwaysUseDarkAppearance
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_alwaysUseDarkAppearance;
  swift_beginAccess();
  return *v2;
}

- (void)setAlwaysUseDarkAppearance:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_alwaysUseDarkAppearance;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)maxTextWidth
{
  v2 = self;
  CRLStatusHUDManager.maxTextWidth.getter();
  double v4 = v3;

  return v4;
}

- (double)maxHUDWidth
{
  double v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView);
  swift_beginAccess();
  double v4 = *v3;
  if (v4)
  {
    v5 = self;
    id v6 = [v4 window];
    if (v6)
    {
      id v7 = v6;
      [v6 bounds];
      double Width = CGRectGetWidth(v10);

      return fmin(Width, 375.0);
    }
  }
  return 375.0;
}

- (void)showWithHudController:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_100E8C4F4(a3, (uint64_t)v5);
  swift_unknownObjectRelease();
}

- (void)showWithHudController:(id)a3 withDelay:(double)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100E8C4FC(a3, (uint64_t)v7, a4);
  swift_unknownObjectRelease();
}

- (void)replaceHudController:(id)a3 withHudController:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100E8C1EC(a3, a4, (uint64_t)v7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)hideWithHudController:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  CRLStatusHUDManager.hide(hudController:)(a3);
  swift_unknownObjectRelease();
}

- (void)hideAllControllers
{
  v2 = self;
  CRLStatusHUDManager.hideAllControllers()();
}

- (void)updateForAppearance
{
  v2 = self;
  CRLStatusHUDManager.updateForAppearance()();
}

- (int64_t)containerViewVerticalLayoutGravity
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerViewVerticalLayoutGravity);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerViewVerticalLayoutGravity:(int64_t)a3
{
  double v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerViewVerticalLayoutGravity);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtC8Freeform19CRLStatusHUDManager)init
{
  return (_TtC8Freeform19CRLStatusHUDManager *)CRLStatusHUDManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end