@interface PGEventLabelingFeaturesFileCache
+ (id)cacheForMomentGraphRebuildWithGraphServiceURL:(id)a3 graph:(id)a4 error:(id *)a5;
- (BOOL)clearCacheWithError:(id *)a3;
- (BOOL)isCacheEmptyAtGraphServiceURL:(id)a3;
- (BOOL)writeFeaturesForMomentNode:(id)a3 assetFetchResult:(id)a4 photoLibrary:(id)a5 progressReporter:(id)a6 error:(id *)a7;
- (PGEventLabelingFeaturesFileCache)init;
@end

@implementation PGEventLabelingFeaturesFileCache

+ (id)cacheForMomentGraphRebuildWithGraphServiceURL:(id)a3 graph:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1D1EBC700();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D1EBC6C0();
  id v10 = a4;
  v11 = sub_1D187BFB4((uint64_t)v9, v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v11;
}

- (BOOL)writeFeaturesForMomentNode:(id)a3 assetFetchResult:(id)a4 photoLibrary:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = self;
  sub_1D187C4BC(v11, v12);

  return 1;
}

- (BOOL)clearCacheWithError:(id *)a3
{
  v4 = self;
  EventLabelingFeaturesFileCache.clearCache()();

  if (v5)
  {
    if (a3)
    {
      uint64_t v6 = (void *)sub_1D1EBC5F0();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (BOOL)isCacheEmptyAtGraphServiceURL:(id)a3
{
  uint64_t v4 = sub_1D1EBC700();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D1EBC6C0();
  id v8 = objc_allocWithZone(MEMORY[0x1E4F28CB8]);
  v9 = self;
  id v10 = objc_msgSend(v8, sel_init);
  sub_1D1EBC6D0();
  id v11 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  LOBYTE(v8) = objc_msgSend(v10, sel_fileExistsAtPath_, v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8 ^ 1;
}

- (PGEventLabelingFeaturesFileCache)init
{
  result = (PGEventLabelingFeaturesFileCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PGEventLabelingFeaturesFileCache_cacheFileURL;
  uint64_t v4 = sub_1D1EBC700();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end