@interface UIDetection
- (NSString)labelString;
- (NSString)text;
- (_TtC15UIUnderstanding11UIDetection)init;
- (_TtC15UIUnderstanding11UIDetection)initWithLabel:(int64_t)a3 confidence:(double)a4 text:(id)a5;
- (double)confidence;
- (int64_t)label;
- (void)setText:(id)a3;
@end

@implementation UIDetection

- (int64_t)label
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_label);
}

- (NSString)labelString
{
  UIType.toString()();
  v2 = (void *)sub_260655788();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_confidence);
}

- (NSString)text
{
  v2 = (char *)self + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_text;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_260655788();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_2606557B8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_text);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC15UIUnderstanding11UIDetection)initWithLabel:(int64_t)a3 confidence:(double)a4 text:(id)a5
{
  if (a5)
  {
    uint64_t v8 = sub_2606557B8();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_text);
  uint64_t *v11 = 0;
  v11[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_label) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding11UIDetection_confidence) = a4;
  swift_beginAccess();
  uint64_t *v11 = v8;
  v11[1] = v10;
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UIDetection();
  return [(UIDetection *)&v13 init];
}

- (_TtC15UIUnderstanding11UIDetection)init
{
  result = (_TtC15UIUnderstanding11UIDetection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end