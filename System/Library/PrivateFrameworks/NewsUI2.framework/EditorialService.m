@interface EditorialService
- (_TtC7NewsUI216EditorialService)init;
- (void)refreshEditorialItemsWithItems:(id)a3;
- (void)updateEditorialItemWith:(id)a3;
@end

@implementation EditorialService

- (_TtC7NewsUI216EditorialService)init
{
  result = (_TtC7NewsUI216EditorialService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI216EditorialService_delegate);
  swift_unknownObjectRelease();
}

- (void)updateEditorialItemWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DFB53EA8((uint64_t)v4);
}

- (void)refreshEditorialItemsWithItems:(id)a3
{
  type metadata accessor for EditorialItem();
  uint64_t v4 = sub_1DFDFE220();
  v5 = self;
  sub_1DFB5400C(v4);

  swift_bridgeObjectRelease();
}

@end