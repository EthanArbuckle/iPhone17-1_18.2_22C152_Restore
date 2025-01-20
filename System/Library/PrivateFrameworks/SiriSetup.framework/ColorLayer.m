@interface ColorLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC9SiriSetup10ColorLayer)init;
- (_TtC9SiriSetup10ColorLayer)initWithCoder:(id)a3;
- (_TtC9SiriSetup10ColorLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (void)display;
@end

@implementation ColorLayer

- (_TtC9SiriSetup10ColorLayer)init
{
  uint64_t v3 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor;
  v4 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = CGColorCreateGenericRGB(0.96875, 0.25390625, 0.36328125, 1.0);
  uint64_t v5 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor;
  *(Class *)((char *)&v4->super.super.super.isa + v5) = CGColorCreateGenericRGB(0.15625, 0.52734375, 0.9921875, 1.0);
  uint64_t v6 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor;
  *(Class *)((char *)&v4->super.super.super.isa + v6) = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ColorLayer();
  return [(ColorLayer *)&v8 init];
}

- (_TtC9SiriSetup10ColorLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_235A68DA0();
  swift_unknownObjectRelease();
  uint64_t v4 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor;
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v4) = CGColorCreateGenericRGB(0.96875, 0.25390625, 0.36328125, 1.0);
  uint64_t v6 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = CGColorCreateGenericRGB(0.15625, 0.52734375, 0.9921875, 1.0);
  uint64_t v7 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor;
  *(Class *)((char *)&v5->super.super.super.isa + v7) = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);

  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  uint64_t v8 = sub_235A68F40();
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for ColorLayer();
  v9 = [(ColorLayer *)&v11 initWithLayer:v8];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

- (_TtC9SiriSetup10ColorLayer)initWithCoder:(id)a3
{
  return (_TtC9SiriSetup10ColorLayer *)sub_235A66294(a3);
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3 = sub_235A68B00();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  if (qword_26882D108 != -1) {
    swift_once();
  }
  BOOL v6 = v3 == qword_26882DE70 && v5 == *(void *)algn_26882DE78;
  if (v6 || (sub_235A68F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v9 = (void *)sub_235A68AF0();
    v11.receiver = ObjCClassFromMetadata;
    v11.super_class = (Class)&OBJC_METACLASS____TtC9SiriSetup10ColorLayer;
    unsigned __int8 v7 = objc_msgSendSuper2(&v11, sel_needsDisplayForKey_, v9);
    swift_bridgeObjectRelease();
  }
  return v7;
}

- (void)display
{
  v2 = self;
  sub_235A664A8();
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = sub_235A68B00();
  uint64_t v6 = v5;
  unsigned __int8 v7 = self;
  id v8 = sub_235A66A40(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor);
}

@end