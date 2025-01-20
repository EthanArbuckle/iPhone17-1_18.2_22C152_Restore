@interface CRLTextInputResponder.CRLWPInputStringTokenizer
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer)init;
- (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer)initWithTextInput:(id)a3;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
@end

@implementation CRLTextInputResponder.CRLWPInputStringTokenizer

- (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer)initWithTextInput:(id)a3
{
  swift_unknownObjectWeakInit();
  type metadata accessor for CRLTextInputResponder();
  v5 = (void *)swift_dynamicCastClass();
  if (v5) {
    id v6 = a3;
  }
  swift_unknownObjectWeakAssign();
  id v7 = a3;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLTextInputResponder.CRLWPInputStringTokenizer();
  v8 = [(CRLTextInputResponder.CRLWPInputStringTokenizer *)&v10 initWithTextInput:v7];

  return v8;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  LOBYTE(a5) = sub_100719D58(v8, a4, a5);

  return a5 & 1;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = sub_100719EEC(v8, a4, a5);

  return v10;
}

- (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer)init
{
  result = (_TtCC8Freeform21CRLTextInputResponder25CRLWPInputStringTokenizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end