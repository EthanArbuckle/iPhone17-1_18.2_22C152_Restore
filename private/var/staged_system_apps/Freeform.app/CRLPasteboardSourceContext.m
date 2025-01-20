@interface CRLPasteboardSourceContext
- (CRContext)sourceContext;
- (_TtC8Freeform17CRLBoardDataStore)sourceStore;
- (_TtC8Freeform26CRLPasteboardSourceContext)init;
@end

@implementation CRLPasteboardSourceContext

- (CRContext)sourceContext
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__sourceContext));
}

- (_TtC8Freeform17CRLBoardDataStore)sourceStore
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__store));
}

- (_TtC8Freeform26CRLPasteboardSourceContext)init
{
  result = (_TtC8Freeform26CRLPasteboardSourceContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform26CRLPasteboardSourceContext__sourceContext);
}

@end