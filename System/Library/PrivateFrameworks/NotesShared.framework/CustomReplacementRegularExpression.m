@interface CustomReplacementRegularExpression
- (_TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression)initWithCoder:(id)a3;
- (_TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)replacementStringForResult:(id)a3 inString:(id)a4 offset:(int64_t)a5 template:(id)a6;
@end

@implementation CustomReplacementRegularExpression

- (_TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression)initWithCoder:(id)a3
{
  result = (_TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression *)sub_1C3DBAF58();
  __break(1u);
  return result;
}

- (id)replacementStringForResult:(id)a3 inString:(id)a4 offset:(int64_t)a5 template:(id)a6
{
  uint64_t v8 = sub_1C3DB9C38();
  uint64_t v10 = v9;
  v11 = *(void (**)(void *))((char *)&self->super.super.isa
                                        + OBJC_IVAR____TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression_replaceBlock);
  id v12 = a3;
  v13 = self;
  swift_bridgeObjectRetain();
  sub_1C3D7640C(v12, v8, v10, v19);
  v16[0] = v19[0];
  v16[1] = v19[1];
  long long v17 = v20;
  uint64_t v18 = v21;
  v11(v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1C3DB9BF8();
  swift_bridgeObjectRelease();
  return v14;
}

- (_TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  result = (_TtC11NotesSharedP33_452BF3924CAE69326F83BAE5FEEBFB4234CustomReplacementRegularExpression *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end