@interface FormatBorderLayer
- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)init;
- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)initWithCoder:(id)a3;
- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)initWithLayer:(id)a3;
@end

@implementation FormatBorderLayer

- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FormatBorderLayer *)&v3 init];
}

- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1C151FF3C();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = sub_1C1520A7C();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(FormatBorderLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(FormatBorderLayer *)&v5 initWithCoder:a3];
}

@end