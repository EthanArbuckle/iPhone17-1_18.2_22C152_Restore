@interface VisualTranslationResult
- (BOOL)isPassthrough;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (NSString)string;
- (NSUUID)uuid;
- (_TtC13TranslationUI23VisualTranslationResult)init;
@end

@implementation VisualTranslationResult

- (NSUUID)uuid
{
  v2 = (void *)sub_1DB1EF530();
  return (NSUUID *)v2;
}

- (NSString)string
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DB1F1260();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isPassthrough
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_isPassthrough);
}

- (CGPoint)topLeft
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topLeft);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topLeft];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topRight);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_topRight];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomLeft);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomLeft];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomRight);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_bottomRight];
  result.y = v3;
  result.x = v2;
  return result;
}

- (_TtC13TranslationUI23VisualTranslationResult)init
{
  CGPoint result = (_TtC13TranslationUI23VisualTranslationResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v2 = (char *)self + OBJC_IVAR____TtC13TranslationUI23VisualTranslationResult_uuid;
  uint64_t v3 = sub_1DB1EF570();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end