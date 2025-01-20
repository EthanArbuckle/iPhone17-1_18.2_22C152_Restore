@interface MapsFavoritesSuggestor
- (_TtC4Maps22MapsFavoritesSuggestor)init;
- (char)suggestShortcutsOfType:(int64_t)a3 handler:(id)a4;
- (id)initFromResourceDepot:(id)a3;
@end

@implementation MapsFavoritesSuggestor

- (id)initFromResourceDepot:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MapsFavoritesSuggestor();
  return [(MapsFavoritesSuggestor *)&v4 init];
}

- (char)suggestShortcutsOfType:(int64_t)a3 handler:(id)a4
{
  v5 = (void (**)(void *, Class, void))_Block_copy(a4);
  sub_100100830(0, &qword_1015D5D58);
  v6 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v5[2](v5, isa, 0);

  _Block_release(v5);
  return 1;
}

- (_TtC4Maps22MapsFavoritesSuggestor)init
{
  result = (_TtC4Maps22MapsFavoritesSuggestor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end