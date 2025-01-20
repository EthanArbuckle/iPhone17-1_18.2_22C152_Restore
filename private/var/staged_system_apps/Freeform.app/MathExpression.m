@interface MathExpression
- (BOOL)isEqual:(id)a3;
- (NSNumber)strokeGroupIdentifier;
- (NSString)expression;
- (_TtC8Freeform14MathExpression)init;
- (int64_t)expressionType;
- (void)setExpression:(id)a3;
- (void)setExpressionType:(int64_t)a3;
- (void)setStrokeGroupIdentifier:(id)a3;
@end

@implementation MathExpression

- (NSString)expression
{
  return (NSString *)sub_10060236C();
}

- (void)setExpression:(id)a3
{
}

- (int64_t)expressionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expressionType);
}

- (void)setExpressionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expressionType) = (Class)a3;
}

- (NSNumber)strokeGroupIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier));
}

- (void)setStrokeGroupIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1009353B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100934ABC);
}

- (_TtC8Freeform14MathExpression)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expression);
  *id v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_expressionType) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(MathExpression *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14MathExpression_strokeGroupIdentifier);
}

@end