@interface PGMusicCurator
+ (id)curateMusicForFeatures:(id)a3 context:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)emptyCuration;
+ (id)extractMusicCurationFeaturesForAssets:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)extractMusicCurationFeaturesForEnrichedMemory:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)extractMusicCurationFeaturesForMemory:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)generateDebugInformationForAssetCollection:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)generateDebugInformationForSongWithAdamID:(id)a3 context:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (void)fetchSongAdamIDsForPurchasedSongID:(id)a3 inflationContext:(id)a4 progressReport:(id)a5 completionHandler:(id)a6;
+ (void)fetchSongDisplayMetadataJSONForAdamIDs:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6;
+ (void)inflateDisplayMetadataForMusicCuration:(id)a3 inflationContext:(id)a4 curatorContext:(id)a5 progressReporter:(id)a6 completionHandler:(id)a7;
- (PGMusicCurator)init;
@end

@implementation PGMusicCurator

+ (id)generateDebugInformationForSongWithAdamID:(id)a3 context:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  unint64_t v8 = sub_1D1EBDE60();
  uint64_t v10 = v9;
  id v11 = a4;
  id v12 = a5;
  sub_1D19864A0(v8, v10, (uint64_t)v11);
  swift_bridgeObjectRelease();

  v13 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v13;
}

+ (id)generateDebugInformationForAssetCollection:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (char **)a6;
  sub_1D198783C(v10, v11, (uint64_t)v12, v13);

  v14 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)extractMusicCurationFeaturesForMemory:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (char **)a6;
  v14 = (void *)sub_1D1A0E920(v10, (char **)a4, (uint64_t)v12, v13);

  return v14;
}

+ (id)extractMusicCurationFeaturesForEnrichedMemory:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  swift_unknownObjectRetain();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  sub_1D1A81854(a3, a4, (uint64_t)v12);
  v15 = v14;

  swift_unknownObjectRelease();
  return v15;
}

+ (id)extractMusicCurationFeaturesForAssets:(id)a3 graph:(id)a4 context:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  sub_1D181F2D8(0, (unint64_t *)&qword_1EBD47710);
  unint64_t v10 = sub_1D1EBE1B0();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)sub_1D1AA6E4C(v10, a4, v12);
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)curateMusicForFeatures:(id)a3 context:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  swift_getObjCClassMetadata();
  id v9 = a3;
  unint64_t v10 = (char *)a4;
  id v11 = a5;
  id v12 = static MusicCurator.curateMusic(for:context:progressReporter:)((uint64_t)v9, v10);

  return v12;
}

- (PGMusicCurator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGMusicCurator *)&v3 init];
}

+ (id)emptyCuration
{
  id v2 = _s11PhotosGraph12MusicCuratorC13emptyCurationAA0cF0CyFZ_0();
  return v2;
}

+ (void)inflateDisplayMetadataForMusicCuration:(id)a3 inflationContext:(id)a4 curatorContext:(id)a5 progressReporter:(id)a6 completionHandler:(id)a7
{
  id v11 = _Block_copy(a7);
  _Block_copy(v11);
  id v12 = a3;
  id v13 = (char *)a4;
  id v14 = a5;
  id v15 = a6;
  sub_1D1B01754(v12, v13, v15, (void (**)(void, void, void))v11);
  _Block_release(v11);
  _Block_release(v11);
}

+ (void)fetchSongDisplayMetadataJSONForAdamIDs:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  unint64_t v8 = _Block_copy(a6);
  id v9 = (void *)sub_1D1EBE1B0();
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  _Block_copy(v8);
  id v11 = a4;
  id v12 = a5;
  sub_1D1B01CD0(v9, v11, v12, ObjCClassMetadata, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

+ (void)fetchSongAdamIDsForPurchasedSongID:(id)a3 inflationContext:(id)a4 progressReport:(id)a5 completionHandler:(id)a6
{
  unint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_1D1EBDE60();
  unint64_t v11 = v10;
  _Block_copy(v8);
  id v12 = a4;
  id v13 = a5;
  sub_1D1B02974(v9, v11, (uint64_t)v12, v13, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

@end