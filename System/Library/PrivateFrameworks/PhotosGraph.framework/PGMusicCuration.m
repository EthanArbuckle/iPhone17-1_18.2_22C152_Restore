@interface PGMusicCuration
- (BOOL)isEqual:(id)a3;
- (NSNumber)keySongArousal;
- (NSNumber)keySongValence;
- (NSString)description;
- (NSString)keySongAdamID;
- (NSString)keySongArtist;
- (NSString)keySongTitle;
- (PGMusicCuration)init;
- (id)jsonRepresentation;
- (id)replaceBestMusicSuggestionsWithAdamIds:(id)a3;
- (id)replaceFirstSongInBestSongSuggestionsWith:(id)a3;
@end

@implementation PGMusicCuration

- (NSString)description
{
  v2 = self;
  MusicCuration.description.getter();

  v3 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)jsonRepresentation
{
  v2 = self;
  object = MusicCuration.jsonRepresentation()().value._object;

  if (object)
  {
    v4 = (void *)sub_1D1EBDE30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (PGMusicCuration)init
{
  result = (PGMusicCuration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D1EBE950();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = MusicCuration.isEqual(_:)((uint64_t)v8);

  sub_1D18D693C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)keySongAdamID
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuration_bestMusicSuggestions))[2])
  {
    type metadata accessor for Song();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D1EBDE30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)keySongTitle
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuration_bestMusicSuggestions);
  if (*(void *)(v2 + 16)
    && (uint64_t v3 = *(void *)(type metadata accessor for Song() - 8),
        *(void *)(v2 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + 24)))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1D1EBDE30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)keySongArtist
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuration_bestMusicSuggestions);
  if (*(void *)(v2 + 16)
    && (uint64_t v3 = *(void *)(type metadata accessor for Song() - 8),
        *(void *)(v2 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + 40)))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1D1EBDE30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSNumber)keySongArousal
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)MusicCuration.keySongArousal.getter();

  return (NSNumber *)v3;
}

- (NSNumber)keySongValence
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)MusicCuration.keySongValence.getter();

  return (NSNumber *)v3;
}

- (id)replaceBestMusicSuggestionsWithAdamIds:(id)a3
{
  uint64_t v4 = sub_1D1EBE1B0();
  v5 = self;
  id v6 = MusicCuration.replaceBestMusicSuggestions(adamIds:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)replaceFirstSongInBestSongSuggestionsWith:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  unint64_t v6 = v5;
  v7 = self;
  id v8 = MusicCuration.replaceFirstSongInBestSongSuggestions(with:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

@end