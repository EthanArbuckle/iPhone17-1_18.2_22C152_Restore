@interface CRLUndownloadedAssetDrawingHelper
- (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper)init;
- (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper)initWithRep:(id)a3 asset:(id)a4;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation CRLUndownloadedAssetDrawingHelper

- (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper)initWithRep:(id)a3 asset:(id)a4
{
  return (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper *)sub_100F9BC38(a3, a4);
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_100F9BFA8(v4);
}

- (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper)init
{
  result = (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLUndownloadedAssetDrawingHelper_backgroundColor);
}

@end