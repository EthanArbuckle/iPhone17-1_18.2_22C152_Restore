@interface PNSafeAssetAnalyzer
- (PNSafeAssetAnalyzer)initWithPhotoLibrary:(id)a3;
- (signed)eligibilityStateWithAsset:(id)a3 curationContext:(id)a4;
@end

@implementation PNSafeAssetAnalyzer

- (void).cxx_destruct
{
}

- (signed)eligibilityStateWithAsset:(id)a3 curationContext:(id)a4
{
  return [(_PNSafeAssetAnalyzer *)self->_safeAssetAnalyzer eligibilityStateWithAsset:a3 curationContext:a4];
}

- (PNSafeAssetAnalyzer)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PNSafeAssetAnalyzer;
  v5 = [(PNSafeAssetAnalyzer *)&v9 init];
  if (v5)
  {
    v6 = [[_PNSafeAssetAnalyzer alloc] initWithPhotoLibrary:v4 computeIsUtilityForMemories:1];
    safeAssetAnalyzer = v5->_safeAssetAnalyzer;
    v5->_safeAssetAnalyzer = v6;
  }
  return v5;
}

@end