@interface CRLUSDRendering.CoreRE.AppExRepBackend
- (_TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend)init;
@end

@implementation CRLUSDRendering.CoreRE.AppExRepBackend

- (_TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend)init
{
  result = (_TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_metalLayer));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE15AppExRepBackend_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end