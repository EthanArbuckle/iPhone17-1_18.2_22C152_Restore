@interface FlowerBlurringLayer
- (_TtC13RhizomePoster19FlowerBlurringLayer)init;
- (_TtC13RhizomePoster19FlowerBlurringLayer)initWithCoder:(id)a3;
- (_TtC13RhizomePoster19FlowerBlurringLayer)initWithLayer:(id)a3;
@end

@implementation FlowerBlurringLayer

- (_TtC13RhizomePoster19FlowerBlurringLayer)init
{
  self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurEnabled] = 0;
  v2 = &self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurRadiusKeyPath];
  *(void *)v2 = 0xD000000000000020;
  *((void *)v2 + 1) = 0x800000010003D100;
  *(void *)&self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurRadius] = 0x4014000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FlowerBlurringLayer();
  return [(FlowerBlurringLayer *)&v4 init];
}

- (_TtC13RhizomePoster19FlowerBlurringLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_10003A960();
  swift_unknownObjectRelease();
  self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurEnabled] = 0;
  objc_super v4 = &self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurRadiusKeyPath];
  *(void *)objc_super v4 = 0xD000000000000020;
  *((void *)v4 + 1) = 0x800000010003D100;
  *(void *)&self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurRadius] = 0x4014000000000000;
  sub_100004D2C(v9, v9[3]);
  uint64_t v5 = sub_10003AC30();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FlowerBlurringLayer();
  v6 = [(FlowerBlurringLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  sub_100004D70((uint64_t)v9);
  return v6;
}

- (_TtC13RhizomePoster19FlowerBlurringLayer)initWithCoder:(id)a3
{
  self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurEnabled] = 0;
  objc_super v4 = &self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurRadiusKeyPath];
  *(void *)objc_super v4 = 0xD000000000000020;
  *((void *)v4 + 1) = 0x800000010003D100;
  *(void *)&self->CABackdropLayer_opaque[OBJC_IVAR____TtC13RhizomePoster19FlowerBlurringLayer_blurRadius] = 0x4014000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FlowerBlurringLayer();
  return [(FlowerBlurringLayer *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end