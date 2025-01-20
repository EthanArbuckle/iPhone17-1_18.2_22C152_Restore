@interface CalculateDocumentProvider
- (BOOL)isEqual:(id)a3;
- (NSArray)expressionEvaluationResults;
- (NSArray)recognizedExpressions;
- (NSSet)declaredVariables;
- (_TtC8PaperKit25CalculateDocumentProvider)init;
- (void)setDeclaredVariables:(id)a3;
@end

@implementation CalculateDocumentProvider

- (NSSet)declaredVariables
{
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)v2.super.isa;
}

- (void)setDeclaredVariables:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_declaredVariables) = (Class)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
}

- (NSArray)recognizedExpressions
{
  return (NSArray *)@objc CalculateDocumentProvider.recognizedExpressions.getter(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_expressions, (void (*)(uint64_t))specialized _arrayForceCast<A, B>(_:), (uint64_t *)&demangling cache variable for type metadata for CHMathExpression);
}

- (NSArray)expressionEvaluationResults
{
  return (NSArray *)@objc CalculateDocumentProvider.recognizedExpressions.getter(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_evaluationResults, (void (*)(uint64_t))specialized _arrayForceCast<A, B>(_:), &demangling cache variable for type metadata for CHMathExpressionEvaluationResult);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CalculateDocumentProvider.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CalculateDocumentProvider.isEqual(_:));
}

- (_TtC8PaperKit25CalculateDocumentProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_declaredVariables) = (Class)MEMORY[0x263F8EE88];
  v4 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_expressions) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit25CalculateDocumentProvider_evaluationResults) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(CalculateDocumentProvider *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end