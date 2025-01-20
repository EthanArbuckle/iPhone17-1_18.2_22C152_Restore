@interface MathExpressionEvaluationResult
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (NSArray)strokes;
- (NSNumber)strokeGroupIdentifier;
- (NSString)string;
- (_TtC8Freeform30MathExpressionEvaluationResult)init;
- (void)setString:(id)a3;
- (void)setStrokeGroupIdentifier:(id)a3;
@end

@implementation MathExpressionEvaluationResult

- (NSString)string
{
  return (NSString *)sub_10060236C();
}

- (void)setString:(id)a3
{
}

- (NSArray)strokes
{
  v2 = self;
  sub_100934D64();

  sub_1005057FC((uint64_t *)&unk_1016887D0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1009353B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100934EF0);
}

- (CGRect)bounds
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_drawing);
  if (v2)
  {
    [v2 bounds];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform30MathExpressionEvaluationResult)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_string);
  *id v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_drawing) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier;
  id v6 = objc_allocWithZone((Class)NSNumber);
  v7 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)[v6 initWithInteger:0];

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return [(MathExpressionEvaluationResult *)&v9 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform30MathExpressionEvaluationResult_strokeGroupIdentifier);
}

@end