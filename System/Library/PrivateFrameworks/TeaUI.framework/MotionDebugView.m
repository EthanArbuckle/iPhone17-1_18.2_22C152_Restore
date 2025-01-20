@interface MotionDebugView
- (_TtC5TeaUI15MotionDebugView)initWithCoder:(id)a3;
- (_TtC5TeaUI15MotionDebugView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation MotionDebugView

- (_TtC5TeaUI15MotionDebugView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI15MotionDebugView *)MotionDebugView.init(frame:)();
}

- (_TtC5TeaUI15MotionDebugView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B614AE68();
}

- (void)didMoveToWindow
{
  v2 = self;
  MotionDebugView.didMoveToWindow()();
}

- (void)layoutSubviews
{
  v2 = self;
  MotionDebugView.layoutSubviews()();
}

- (void)safeAreaInsetsDidChange
{
  v2 = self;
  MotionDebugView.safeAreaInsetsDidChange()();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI15MotionDebugView_labelBackgroundView);
}

@end