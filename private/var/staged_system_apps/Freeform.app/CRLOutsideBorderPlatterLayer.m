@interface CRLOutsideBorderPlatterLayer
- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)init;
- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)initWithCoder:(id)a3;
- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation CRLOutsideBorderPlatterLayer

- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_outsideBorderWidth) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_outsideBorderInsideCornerRadius) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_additionalOutsetForShadowPath) = 0;
  uint64_t v3 = OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_borderPlatterSublayer;
  id v4 = objc_allocWithZone((Class)CRLNoDefaultImplicitActionLayer);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)[v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CRLOutsideBorderPlatterLayer();
  v6 = [(CRLOutsideBorderPlatterLayer *)&v8 init];
  [(CRLOutsideBorderPlatterLayer *)v6 setMasksToBounds:0];
  return v6;
}

- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC8Freeform28CRLOutsideBorderPlatterLayer *)sub_100D555E4(v4);
}

- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform28CRLOutsideBorderPlatterLayer *)sub_100D5585C(a3);
}

- (void)layoutSublayers
{
  v2 = self;
  sub_100D55960();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_borderPlatterSublayer));
}

@end