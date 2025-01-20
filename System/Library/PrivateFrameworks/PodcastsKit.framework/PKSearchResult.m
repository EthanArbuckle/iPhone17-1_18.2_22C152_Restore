@interface PKSearchResult
- (NSArray)episodes;
- (NSArray)shows;
- (PKSearchResult)init;
- (PKSearchResult)initWithEpisodes:(id)a3 shows:(id)a4;
@end

@implementation PKSearchResult

- (NSArray)episodes
{
  return (NSArray *)sub_23F0B65E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___PKSearchResult_episodes, (void (*)(void))type metadata accessor for Episode);
}

- (NSArray)shows
{
  return (NSArray *)sub_23F0B65E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___PKSearchResult_shows, (void (*)(void))type metadata accessor for Show);
}

- (PKSearchResult)initWithEpisodes:(id)a3 shows:(id)a4
{
  type metadata accessor for Episode();
  v5 = (objc_class *)sub_23F0BF780();
  type metadata accessor for Show();
  v6 = (objc_class *)sub_23F0BF780();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKSearchResult_episodes) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKSearchResult_shows) = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResult();
  return [(PKSearchResult *)&v8 init];
}

- (PKSearchResult)init
{
  result = (PKSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end