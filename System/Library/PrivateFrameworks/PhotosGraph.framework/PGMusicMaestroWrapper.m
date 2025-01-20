@interface PGMusicMaestroWrapper
+ (id)curateMusicForNormalizedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)curateMusicForNormalizedSupportedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (PGMusicMaestroWrapper)init;
@end

@implementation PGMusicMaestroWrapper

+ (id)curateMusicForNormalizedSupportedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return sub_1D1910800((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1D1910BE8);
}

+ (id)curateMusicForNormalizedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return sub_1D1910800((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1D1911124);
}

- (PGMusicMaestroWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGMusicMaestroWrapper *)&v3 init];
}

@end