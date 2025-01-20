@interface SiriSharedUIDropletLayer
- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)init;
- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)initWithLayer:(id)a3;
@end

@implementation SiriSharedUIDropletLayer

- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriSharedUIDropletLayer();
  return [(SiriSharedUIDropletLayer *)&v3 init];
}

- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_20CA83228();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_20CA833F8();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SiriSharedUIDropletLayer();
  v5 = [(SiriSharedUIDropletLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtC12SiriSharedUI24SiriSharedUIDropletLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriSharedUIDropletLayer();
  return [(SiriSharedUIDropletLayer *)&v5 initWithCoder:a3];
}

@end