@interface CRLCalculateDocumentProvider
- (BOOL)isEqual:(id)a3;
- (NSArray)expressionEvaluationResults;
- (NSArray)recognizedExpressions;
- (NSSet)declaredVariables;
- (_TtC8Freeform28CRLCalculateDocumentProvider)init;
- (void)setDeclaredVariables:(id)a3;
@end

@implementation CRLCalculateDocumentProvider

- (NSSet)declaredVariables
{
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (void)setDeclaredVariables:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables) = (Class)static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (NSArray)recognizedExpressions
{
  return (NSArray *)sub_10093450C(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_expressions, (void (*)(uint64_t))sub_100590978, (uint64_t *)&unk_101674770);
}

- (NSArray)expressionEvaluationResults
{
  return (NSArray *)sub_10093450C(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_evaluationResults, (void (*)(uint64_t))sub_100590984, (uint64_t *)&unk_1016887E0);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1009353B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_10093459C);
}

- (_TtC8Freeform28CRLCalculateDocumentProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_declaredVariables) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_expressions) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLCalculateDocumentProvider_evaluationResults) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(CRLCalculateDocumentProvider *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end