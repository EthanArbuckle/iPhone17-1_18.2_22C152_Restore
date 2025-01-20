@interface PGFlexMusicCurator
+ (id)curateFlexMusicWithCurationParameters:(id)a3 progressReporter:(id)a4 error:(id *)a5;
+ (id)generateDebugInformationForAssetCollection:(id)a3 graph:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)generateDebugInformationForSongWithUID:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (PGFlexMusicCurator)init;
@end

@implementation PGFlexMusicCurator

+ (id)curateFlexMusicWithCurationParameters:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v6 = a3;
  id v7 = a4;
  id v8 = sub_1D18DAB8C(v6, v7);

  return v8;
}

- (PGFlexMusicCurator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGFlexMusicCurator *)&v3 init];
}

+ (id)generateDebugInformationForSongWithUID:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1D1EBDE60();
  uint64_t v8 = v7;
  id v9 = a4;
  sub_1D1973C84(v6, v8);
  swift_bridgeObjectRelease();

  v10 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)generateDebugInformationForAssetCollection:(id)a3 graph:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = (char **)a4;
  v10 = (char **)a5;
  sub_1D197424C(v8, v9, v10);

  v11 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v11;
}

@end