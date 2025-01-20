@interface ICDebugStatusRootView
- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView)initWithCoder:(id)a3;
- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)handlePanGesture:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)updateColors;
- (void)updateInitialPosition;
@end

@implementation ICDebugStatusRootView

- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_panStart;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_xPosition) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_yPosition) = 0;
  id v5 = a3;

  result = (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = (char *)v13.receiver;
  id v8 = a4;
  id v9 = -[ICDebugStatusRootView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    id v10 = v9;
    if ([v9 isDescendantOfView:*(void *)&v7[OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_container]] goto LABEL_5; {
  }
    }
  Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  id v10 = [Strong hitTest:v8 withEvent:x, y];

  id v8 = v7;
  v7 = Strong;
LABEL_5:

  return v10;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ICDebugStatusRootView *)&v3 layoutSubviews];
  sub_100219460();
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ICDebugStatusRootView *)&v3 safeAreaInsetsDidChange];
  if (v2[OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_panStart + 16] == 1) {
    sub_100219170();
  }
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002197C4(v4);
}

- (void)updateColors
{
  id v2 = self;
  sub_100219360();
}

- (void)updateInitialPosition
{
  id v2 = self;
  sub_100219170();
}

- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_container));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_xPosition));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_yPosition);
}

@end