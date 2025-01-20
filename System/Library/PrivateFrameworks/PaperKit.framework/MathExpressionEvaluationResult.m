@interface MathExpressionEvaluationResult
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (NSArray)strokes;
- (NSNumber)strokeGroupIdentifier;
- (NSString)string;
- (_TtC8PaperKit30MathExpressionEvaluationResult)init;
- (void)setString:(id)a3;
- (void)setStrokeGroupIdentifier:(id)a3;
@end

@implementation MathExpressionEvaluationResult

- (NSString)string
{
  return (NSString *)@objc MathExpression.expression.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_string);
}

- (void)setString:(id)a3
{
}

- (NSArray)strokes
{
  v2 = self;
  MathExpressionEvaluationResult.strokes.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CHStroke);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v3.super.isa;
}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MathExpressionEvaluationResult.isEqual(_:));
}

- (CGRect)bounds
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_drawing);
  if (v2)
  {
    objc_msgSend(v2, sel_bounds);
  }
  else
  {
    double v3 = *MEMORY[0x263F001A0];
    double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier) = (Class)a3;
  id v3 = a3;
}

- (_TtC8PaperKit30MathExpressionEvaluationResult)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_string);
  *id v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_drawing) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier;
  id v6 = objc_allocWithZone(NSNumber);
  v7 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithInteger_, 0);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return [(MathExpressionEvaluationResult *)&v9 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit30MathExpressionEvaluationResult_strokeGroupIdentifier);
}

@end