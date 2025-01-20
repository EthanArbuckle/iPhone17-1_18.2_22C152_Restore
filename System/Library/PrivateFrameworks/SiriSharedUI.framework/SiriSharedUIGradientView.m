@interface SiriSharedUIGradientView
+ (id)verticalBlackToClear;
+ (id)verticalClearToBlack;
+ (id)verticalTwoColorGradientWithTop:(id)a3 bottom:(id)a4;
- (_TtC12SiriSharedUI24SiriSharedUIGradientView)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI24SiriSharedUIGradientView)initWithColors:(id)a3 locations:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6;
- (_TtC12SiriSharedUI24SiriSharedUIGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SiriSharedUIGradientView

+ (id)verticalBlackToClear
{
  v2 = (void *)sub_20CA2FDB4((SEL *)&selRef_blackColor, (SEL *)&selRef_clearColor);
  return v2;
}

+ (id)verticalClearToBlack
{
  v2 = (void *)sub_20CA2FDB4((SEL *)&selRef_clearColor, (SEL *)&selRef_blackColor);
  return v2;
}

+ (id)verticalTwoColorGradientWithTop:(id)a3 bottom:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)_s12SiriSharedUI0aB14UIGradientViewC24verticalTwoColorGradient3top6bottomACSo7UIColorC_AHtFZ_0(v5, v6);

  return v7;
}

- (_TtC12SiriSharedUI24SiriSharedUIGradientView)initWithColors:(id)a3 locations:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  sub_20CA20160(0, &qword_2676EC7A8);
  unint64_t v10 = sub_20CA82FB8();
  sub_20CA20160(0, &qword_2676ECC10);
  sub_20CA82FB8();
  return (_TtC12SiriSharedUI24SiriSharedUIGradientView *)SiriSharedUIGradientView.init(colors:locations:startPoint:endPoint:)(v10, v9, v8, x, y);
}

- (_TtC12SiriSharedUI24SiriSharedUIGradientView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12SiriSharedUI24SiriSharedUIGradientView_gradientLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F157D0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12SiriSharedUI24SiriSharedUIGradientView *)sub_20CA83348();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUIGradientView();
  v2 = (char *)v4.receiver;
  [(SiriSharedUIGradientView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12SiriSharedUI24SiriSharedUIGradientView_gradientLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (_TtC12SiriSharedUI24SiriSharedUIGradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC12SiriSharedUI24SiriSharedUIGradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI24SiriSharedUIGradientView_gradientLayer));
}

@end