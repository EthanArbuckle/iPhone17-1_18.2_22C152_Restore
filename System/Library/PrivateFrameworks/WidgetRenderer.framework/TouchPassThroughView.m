@interface TouchPassThroughView
- (_TtC14WidgetRenderer20TouchPassThroughView)init;
- (_TtC14WidgetRenderer20TouchPassThroughView)initWithCoder:(id)a3;
- (_TtC14WidgetRenderer20TouchPassThroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TouchPassThroughView

- (_TtC14WidgetRenderer20TouchPassThroughView)init
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TouchPassThroughView();
  v2 = -[TouchPassThroughView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = self;
  v4 = v2;
  id v5 = objc_msgSend(v3, sel_clearColor);
  [(TouchPassThroughView *)v4 setBackgroundColor:v5];

  [(TouchPassThroughView *)v4 setOpaque:0];
  return v4;
}

- (_TtC14WidgetRenderer20TouchPassThroughView)initWithCoder:(id)a3
{
  result = (_TtC14WidgetRenderer20TouchPassThroughView *)sub_2618FBA30();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TouchPassThroughView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[TouchPassThroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_2618A2568(0, (unint64_t *)&unk_26B4129B0);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_2618FB630();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (_TtC14WidgetRenderer20TouchPassThroughView)initWithFrame:(CGRect)a3
{
  result = (_TtC14WidgetRenderer20TouchPassThroughView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end