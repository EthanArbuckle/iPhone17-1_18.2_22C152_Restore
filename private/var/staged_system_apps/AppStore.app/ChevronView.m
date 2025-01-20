@interface ChevronView
- (_TtC8AppStore11ChevronView)init;
- (_TtC8AppStore11ChevronView)initWithCoder:(id)a3;
- (_TtC8AppStore11ChevronView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation ChevronView

- (_TtC8AppStore11ChevronView)init
{
  return (_TtC8AppStore11ChevronView *)sub_1000A577C();
}

- (_TtC8AppStore11ChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore11ChevronView *)sub_1000A58A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore11ChevronView)initWithCoder:(id)a3
{
  return (_TtC8AppStore11ChevronView *)sub_1000A59F4(a3);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChevronView();
  id v2 = v3.receiver;
  [(ChevronView *)&v3 didMoveToWindow];
  sub_1000A5D0C();
}

- (void).cxx_destruct
{
}

@end