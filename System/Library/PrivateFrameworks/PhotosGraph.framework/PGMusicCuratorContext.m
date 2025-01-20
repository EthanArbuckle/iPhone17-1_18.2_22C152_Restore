@interface PGMusicCuratorContext
+ (id)contextWithPhotoLibrary:(id)a3 adamIDsWithNegativeUserFeedback:(id)a4 allowExplicitMusicContent:(id)a5 cache:(id)a6 musicBag:(id)a7 recentlyUsedSongs:(id)a8 genre:(id)a9 isMemoryCreationCuration:(id)a10 configuration:(id)a11 error:(id *)a12;
- (BOOL)allowChillMixElection;
- (BOOL)allowGetUpMixElection;
- (BOOL)bypassMusicForTopicElection;
- (BOOL)forceShareableInBestSuggestions;
- (BOOL)isMemoryCreationCuration;
- (BOOL)refreshSongMetadata;
- (BOOL)useOnlyMusicForTopicInTopPickSuggestions;
- (NSDictionary)musicCurationOverrideDictionary;
- (NSString)description;
- (NSString)genre;
- (PGMusicCache)cache;
- (PGMusicCurationRecentlyUsedSongs)recentlyUsedSongs;
- (PGMusicCuratorContext)init;
- (void)setAllowChillMixElection:(BOOL)a3;
- (void)setAllowGetUpMixElection:(BOOL)a3;
- (void)setBypassMusicForTopicElection:(BOOL)a3;
- (void)setForceShareableInBestSuggestions:(BOOL)a3;
- (void)setGenre:(id)a3;
- (void)setIsMemoryCreationCuration:(BOOL)a3;
- (void)setMusicCurationOverrideDictionary:(id)a3;
- (void)setRefreshSongMetadata:(BOOL)a3;
- (void)setUseOnlyMusicForTopicInTopPickSuggestions:(BOOL)a3;
@end

@implementation PGMusicCuratorContext

- (PGMusicCache)cache
{
  return (PGMusicCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PGMusicCuratorContext_cache));
}

- (BOOL)useOnlyMusicForTopicInTopPickSuggestions
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_useOnlyMusicForTopicInTopPickSuggestions;
  swift_beginAccess();
  return *v2;
}

- (void)setUseOnlyMusicForTopicInTopPickSuggestions:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_useOnlyMusicForTopicInTopPickSuggestions;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowChillMixElection
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowChillMixElection;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowChillMixElection:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowChillMixElection;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowGetUpMixElection
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowGetUpMixElection;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowGetUpMixElection:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_allowGetUpMixElection;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)refreshSongMetadata
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_refreshSongMetadata;
  swift_beginAccess();
  return *v2;
}

- (void)setRefreshSongMetadata:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_refreshSongMetadata;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)forceShareableInBestSuggestions
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_forceShareableInBestSuggestions;
  swift_beginAccess();
  return *v2;
}

- (void)setForceShareableInBestSuggestions:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_forceShareableInBestSuggestions;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (PGMusicCurationRecentlyUsedSongs)recentlyUsedSongs
{
  return (PGMusicCurationRecentlyUsedSongs *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___PGMusicCuratorContext_recentlyUsedSongs));
}

- (NSDictionary)musicCurationOverrideDictionary
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuratorContext_musicCurationOverrideDictionary);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1D1EBDCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setMusicCurationOverrideDictionary:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1D1EBDCE0();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___PGMusicCuratorContext_musicCurationOverrideDictionary);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)bypassMusicForTopicElection
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_bypassMusicForTopicElection;
  swift_beginAccess();
  return *v2;
}

- (void)setBypassMusicForTopicElection:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_bypassMusicForTopicElection;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)genre
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setGenre:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PGMusicCuratorContext_genre);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)isMemoryCreationCuration
{
  v2 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_isMemoryCreationCuration;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMemoryCreationCuration:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___PGMusicCuratorContext_isMemoryCreationCuration;
  swift_beginAccess();
  BOOL *v4 = a3;
}

+ (id)contextWithPhotoLibrary:(id)a3 adamIDsWithNegativeUserFeedback:(id)a4 allowExplicitMusicContent:(id)a5 cache:(id)a6 musicBag:(id)a7 recentlyUsedSongs:(id)a8 genre:(id)a9 isMemoryCreationCuration:(id)a10 configuration:(id)a11 error:(id *)a12
{
  if (a4)
  {
    uint64_t v25 = sub_1D1EBE430();
    if (a9)
    {
LABEL_3:
      uint64_t v23 = sub_1D1EBDE60();
      uint64_t v24 = v17;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if (a9) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
LABEL_6:
  id v26 = a3;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  v21 = sub_1D19F4FF8(v26, v25, a5, (char *)a6, a7, a8, v23, v24, a10, (uint64_t)a11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v21;
}

- (PGMusicCuratorContext)init
{
  result = (PGMusicCuratorContext *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1D1978C80(*(id *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCuratorContext____lazy_storage___keywordsByAdamID), self->configuration[OBJC_IVAR___PGMusicCuratorContext____lazy_storage___keywordsByAdamID]);
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  MusicCuratorContext.description.getter();

  v3 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end