@interface ColumnDebugView
- (_TtC11TeaTemplate15ColumnDebugView)initWithCoder:(id)a3;
- (_TtC11TeaTemplate15ColumnDebugView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ColumnDebugView

- (_TtC11TeaTemplate15ColumnDebugView)initWithCoder:(id)a3
{
  id v3 = a3;
  ColumnDebugView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  ColumnDebugView.layoutSubviews()();
}

- (_TtC11TeaTemplate15ColumnDebugView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView);
}

@end