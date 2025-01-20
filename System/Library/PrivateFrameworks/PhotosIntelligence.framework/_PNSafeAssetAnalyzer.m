@interface _PNSafeAssetAnalyzer
- (_PNSafeAssetAnalyzer)init;
- (_PNSafeAssetAnalyzer)initWithPhotoLibrary:(id)a3 computeIsUtilityForMemories:(BOOL)a4;
- (signed)eligibilityStateWithAsset:(id)a3 curationContext:(id)a4;
@end

@implementation _PNSafeAssetAnalyzer

- (_PNSafeAssetAnalyzer)initWithPhotoLibrary:(id)a3 computeIsUtilityForMemories:(BOOL)a4
{
  return (_PNSafeAssetAnalyzer *)SafeAssetAnalyzer.init(photoLibrary:computeIsUtilityForMemories:)(a3, a4);
}

- (signed)eligibilityStateWithAsset:(id)a3 curationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  signed __int16 v9 = SafeAssetAnalyzer.eligibilityState(asset:curationContext:)(v6, v7);

  return v9;
}

- (_PNSafeAssetAnalyzer)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end