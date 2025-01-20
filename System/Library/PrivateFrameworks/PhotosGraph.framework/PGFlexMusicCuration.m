@interface PGFlexMusicCuration
- (NSArray)bestSongSuggestions;
- (NSArray)secondarySongSuggestions;
- (NSString)description;
- (PGFlexMusicCuration)init;
- (id)expandedJsonRepresentation;
- (id)jsonRepresentation;
- (id)replaceBestSongSuggestionsWithFlexSongIds:(id)a3;
- (id)replaceFirstSongInBestSongSuggestionsWith:(id)a3;
@end

@implementation PGFlexMusicCuration

- (NSArray)bestSongSuggestions
{
  return (NSArray *)sub_1D1AE4E74();
}

- (NSArray)secondarySongSuggestions
{
  return (NSArray *)sub_1D1AE4E74();
}

- (id)jsonRepresentation
{
  return sub_1D1AE5B38(self, (uint64_t)a2, (void (*)(void))FlexMusicCuration.jsonRepresentation());
}

- (id)expandedJsonRepresentation
{
  return sub_1D1AE5B38(self, (uint64_t)a2, (void (*)(void))FlexMusicCuration.expandedJsonRepresentation());
}

- (NSString)description
{
  v2 = self;
  FlexMusicCuration.description.getter();

  v3 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PGFlexMusicCuration)init
{
  result = (PGFlexMusicCuration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)replaceBestSongSuggestionsWithFlexSongIds:(id)a3
{
  uint64_t v4 = sub_1D1EBE1B0();
  v5 = self;
  id v6 = FlexMusicCuration.replaceBestSongSuggestions(flexSongIds:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)replaceFirstSongInBestSongSuggestionsWith:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  unint64_t v6 = v5;
  v7 = self;
  id v8 = FlexMusicCuration.replaceFirstSongInBestSongSuggestions(with:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

@end