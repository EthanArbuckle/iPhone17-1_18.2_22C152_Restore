@interface PGFlexMusicCurationParameters
- (PGFlexMusicCurationParameters)init;
- (PGFlexMusicCurationParameters)initWithMood:(unint64_t)a3 moodKeywords:(id)a4 recentlyUsedSongs:(id)a5 entityUUID:(id)a6 useMoodKeywords:(BOOL)a7 features:(id)a8 musicCuratorContext:(id)a9;
- (PGFlexMusicCurationParameters)initWithMood:(unint64_t)a3 moodKeywords:(id)a4 recentlyUsedSongs:(id)a5 entityUUID:(id)a6 useMoodKeywords:(BOOL)a7 features:(id)a8 musicCuratorContext:(id)a9 genre:(id)a10;
@end

@implementation PGFlexMusicCurationParameters

- (PGFlexMusicCurationParameters)initWithMood:(unint64_t)a3 moodKeywords:(id)a4 recentlyUsedSongs:(id)a5 entityUUID:(id)a6 useMoodKeywords:(BOOL)a7 features:(id)a8 musicCuratorContext:(id)a9
{
  uint64_t v12 = sub_1D1EBE1B0();
  uint64_t v13 = sub_1D1EBDE60();
  uint64_t v15 = v14;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v19 = (PGFlexMusicCurationParameters *)sub_1D18DA4C0(a3, v12, v16, v13, v15, a7, a8, (uint64_t)a9);

  return v19;
}

- (PGFlexMusicCurationParameters)initWithMood:(unint64_t)a3 moodKeywords:(id)a4 recentlyUsedSongs:(id)a5 entityUUID:(id)a6 useMoodKeywords:(BOOL)a7 features:(id)a8 musicCuratorContext:(id)a9 genre:(id)a10
{
  uint64_t v12 = sub_1D1EBE1B0();
  uint64_t v13 = sub_1D1EBDE60();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1D1EBDE60();
  uint64_t v18 = v17;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  v22 = (PGFlexMusicCurationParameters *)sub_1D18DA5E4(a3, v12, v19, v13, v15, a7, a8, (uint64_t)a9, v16, v18);

  return v22;
}

- (PGFlexMusicCurationParameters)init
{
  result = (PGFlexMusicCurationParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end