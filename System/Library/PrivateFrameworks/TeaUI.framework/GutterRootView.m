@interface GutterRootView
- (_TtC5TeaUIP33_DE89AB740D16D99A072493969E6EEC2114GutterRootView)initWithCoder:(id)a3;
- (_TtC5TeaUIP33_DE89AB740D16D99A072493969E6EEC2114GutterRootView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation GutterRootView

- (_TtC5TeaUIP33_DE89AB740D16D99A072493969E6EEC2114GutterRootView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B614A814();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_1B614A8A8((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5TeaUIP33_DE89AB740D16D99A072493969E6EEC2114GutterRootView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_DE89AB740D16D99A072493969E6EEC2114GutterRootView_contentScrollView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUIP33_DE89AB740D16D99A072493969E6EEC2114GutterRootView_outerView);
}

@end