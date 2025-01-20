@interface CollectionsPosterInvalidatable
- (_TtC17CollectionsPoster30CollectionsPosterInvalidatable)init;
- (void)wk_invalidate;
@end

@implementation CollectionsPosterInvalidatable

- (_TtC17CollectionsPoster30CollectionsPosterInvalidatable)init
{
  result = (_TtC17CollectionsPoster30CollectionsPosterInvalidatable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CollectionsPoster30CollectionsPosterInvalidatable_posterKitInvalidatable));
}

- (void)wk_invalidate
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17CollectionsPoster30CollectionsPosterInvalidatable_posterKitInvalidatable);
  v3 = self;
  objc_msgSend(objc_msgSend(v2, "assertion"), "invalidate");

  swift_unknownObjectRelease();
}

@end