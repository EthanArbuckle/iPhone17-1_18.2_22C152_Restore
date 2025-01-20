@interface PGMusicMaestro
+ (id)curateMusicForNormalizedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)curateMusicForNormalizedSupportedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6;
@end

@implementation PGMusicMaestro

+ (id)curateMusicForNormalizedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return +[PGMusicMaestroWrapper curateMusicForNormalizedKeywordsByAssetCollectionLocalIdentifier:a3 keywordsDataFrame:a4 progressReporter:a5 error:a6];
}

+ (id)curateMusicForNormalizedSupportedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return +[PGMusicMaestroWrapper curateMusicForNormalizedSupportedKeywordsByAssetCollectionLocalIdentifier:a3 keywordsDataFrame:a4 progressReporter:a5 error:a6];
}

@end