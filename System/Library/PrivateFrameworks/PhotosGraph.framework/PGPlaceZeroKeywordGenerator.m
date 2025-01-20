@interface PGPlaceZeroKeywordGenerator
- (PGPlaceZeroKeywordGenerator)init;
- (PGPlaceZeroKeywordGenerator)initWithGraph:(id)a3 photoLibrary:(id)a4 searchComputationCache:(id)a5 options:(id)a6;
- (id)generatePlaceZeroKeywords;
@end

@implementation PGPlaceZeroKeywordGenerator

- (PGPlaceZeroKeywordGenerator)initWithGraph:(id)a3 photoLibrary:(id)a4 searchComputationCache:(id)a5 options:(id)a6
{
  uint64_t v9 = sub_1D1EBDCE0();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (PGPlaceZeroKeywordGenerator *)sub_1D1B24F50(v10, v11, v12, v9);

  return v13;
}

- (id)generatePlaceZeroKeywords
{
  v2 = self;
  sub_1D1B1C014();

  type metadata accessor for PlaceZeroKeyword();
  v3 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return v3;
}

- (PGPlaceZeroKeywordGenerator)init
{
  result = (PGPlaceZeroKeywordGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGPlaceZeroKeywordGenerator_locationOrAreaNodeByQueryToken);
}

@end