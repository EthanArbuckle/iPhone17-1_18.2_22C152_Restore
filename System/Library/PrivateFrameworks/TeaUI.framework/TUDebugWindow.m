@interface TUDebugWindow
- (TUDebugWindow)initWithCoder:(id)a3;
- (TUDebugWindow)initWithFrame:(CGRect)a3;
- (TUDebugWindow)initWithWindowScene:(id)a3;
- (UIViewController)rootViewController;
- (void)motionBegan:(int64_t)a3 withEvent:(id)a4;
- (void)onDidBecomeActive;
- (void)onWillEnterForeground:(id)a3;
- (void)onWillResignActive;
- (void)sendEvent:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TUDebugWindow

- (TUDebugWindow)initWithFrame:(CGRect)a3
{
  return (TUDebugWindow *)DebugWindow.init(frame:)();
}

- (TUDebugWindow)initWithWindowScene:(id)a3
{
  id v3 = a3;
  return (TUDebugWindow *)DebugWindow.init(windowScene:)();
}

- (TUDebugWindow)initWithCoder:(id)a3
{
  id v3 = a3;
  return (TUDebugWindow *)DebugWindow.init(coder:)();
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  DebugWindow.sendEvent(_:)((UIEvent)v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  DebugWindow.traitCollectionDidChange(_:)(v9);
}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  id v7 = a4;
  v8 = self;
  v11.is_nil = (char)v8;
  UITraitCollection_optional v9 = v8;
  v11.value.super.isa = (Class)a4;
  DebugWindow.motionBegan(_:with:)((UIEventSubtype)a3, v11);
}

- (UIViewController)rootViewController
{
  v2 = self;
  id v3 = DebugWindow.rootViewController.getter();

  return (UIViewController *)v3;
}

- (void)setRootViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DebugWindow.rootViewController.setter();
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR___TUDebugWindow_debugDelegate);
  swift_release();
}

- (void)onDidBecomeActive
{
}

- (void)onWillResignActive
{
}

- (void)onWillEnterForeground:(id)a3
{
  uint64_t v4 = sub_1B61AF6F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AF6B0();
  v8 = self;
  sub_1B61A029C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end