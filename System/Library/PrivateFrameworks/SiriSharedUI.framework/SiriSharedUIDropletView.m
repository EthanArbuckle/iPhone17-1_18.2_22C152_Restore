@interface SiriSharedUIDropletView
+ (Class)layerClass;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC12SiriSharedUI23SiriSharedUIDropletView)init;
- (_TtC12SiriSharedUI23SiriSharedUIDropletView)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI23SiriSharedUIDropletView)initWithFrame:(CGRect)a3;
@end

@implementation SiriSharedUIDropletView

+ (Class)layerClass
{
  type metadata accessor for SiriSharedUIDropletLayer();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC12SiriSharedUI23SiriSharedUIDropletView)init
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriSharedUIDropletView();
  v2 = -[SiriSharedUIDropletView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v3 = [(SiriSharedUIDropletView *)v2 layer];
  type metadata accessor for SiriSharedUIDropletLayer();
  swift_dynamicCastClassUnconditional();
  sub_20CA60B34();

  return v2;
}

- (_TtC12SiriSharedUI23SiriSharedUIDropletView)initWithCoder:(id)a3
{
  result = (_TtC12SiriSharedUI23SiriSharedUIDropletView *)sub_20CA83348();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = [(SiriSharedUIDropletView *)v9 subviews];
  sub_20CA528F4();
  unint64_t v11 = sub_20CA82FB8();

  id v12 = v8;
  v13 = v9;
  LOBYTE(v4) = sub_20CA52934(v11, v13, v4, x, y);
  swift_bridgeObjectRelease();

  return v4 & 1;
}

- (_TtC12SiriSharedUI23SiriSharedUIDropletView)initWithFrame:(CGRect)a3
{
  result = (_TtC12SiriSharedUI23SiriSharedUIDropletView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end