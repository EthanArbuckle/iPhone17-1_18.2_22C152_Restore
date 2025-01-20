@interface EpisodeCollectionViewModel
- (id)seasonCanonicalIdForSeasonIndex:(int64_t)a3;
- (id)tvShowCanonicalId;
- (int64_t)episodeCountForSeasonIndex:(int64_t)a3;
- (int64_t)totalEpisodeCount;
- (int64_t)totalSeasonCount;
@end

@implementation EpisodeCollectionViewModel

- (id)tvShowCanonicalId
{
  swift_retain();
  v2 = (void *)sub_1E33EFC44();
  swift_release();
  sub_1E387C8E8();
  OUTLINED_FUNCTION_32_66();
  return v2;
}

- (int64_t)totalSeasonCount
{
  swift_retain();
  sub_1E33EFD94();
  OUTLINED_FUNCTION_3_25();
  return v2;
}

- (int64_t)totalEpisodeCount
{
  swift_retain();
  sub_1E33EFE40();
  OUTLINED_FUNCTION_3_25();
  return v2;
}

- (id)seasonCanonicalIdForSeasonIndex:(int64_t)a3
{
  swift_retain();
  v4 = (void *)sub_1E33EFEC0(a3);
  swift_release();
  sub_1E387C8E8();
  OUTLINED_FUNCTION_32_66();
  return v4;
}

- (int64_t)episodeCountForSeasonIndex:(int64_t)a3
{
  return a3;
}

@end