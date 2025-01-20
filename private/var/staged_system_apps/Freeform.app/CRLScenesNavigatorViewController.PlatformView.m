@interface CRLScenesNavigatorViewController.PlatformView
- (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView)initWithCoder:(id)a3;
- (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)updateConstraints;
@end

@implementation CRLScenesNavigatorViewController.PlatformView

- (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController.PlatformView();
  id v2 = v5.receiver;
  [(CRLScenesNavigatorViewController.PlatformView *)&v5 updateConstraints];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_100D62074();

    id v2 = v4;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_100D6E424((uint64_t)a4, x, y);

  return v10;
}

- (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView)initWithFrame:(CGRect)a3
{
  result = (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end