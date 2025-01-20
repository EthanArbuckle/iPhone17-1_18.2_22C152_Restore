@interface PXStoryColorNormalizationEffect
- (NSString)effectDetails;
- (NSString)effectSummary;
- (PFStoryRecipeDisplayAssetNormalization)assetNormalization;
- (PXStoryColorNormalizationEffect)initWithEntityManager:(id)a3;
- (int64_t)currentRequestID;
- (void)_handleResult:(id)a3 resultType:(unint64_t)a4 requestID:(int64_t)a5;
- (void)_updateColorLookupCube;
- (void)setAssetNormalization:(id)a3;
- (void)setCurrentRequestID:(int64_t)a3;
@end

@implementation PXStoryColorNormalizationEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetNormalization, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (int64_t)currentRequestID
{
  return self->_currentRequestID;
}

- (PFStoryRecipeDisplayAssetNormalization)assetNormalization
{
  return self->_assetNormalization;
}

- (void)_handleResult:(id)a3 resultType:(unint64_t)a4 requestID:(int64_t)a5
{
  id v8 = a3;
  if (a4 >= 2)
  {
    if (a4 == 2 && [(PXStoryColorNormalizationEffect *)self currentRequestID] == a5)
    {
      v9 = [(PXGEffect *)self queue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__PXStoryColorNormalizationEffect__handleResult_resultType_requestID___block_invoke;
      v10[3] = &unk_1E5DD32A8;
      v10[4] = self;
      id v11 = v8;
      dispatch_async(v9, v10);
    }
  }
  else
  {
    [(PXGColorGradingEffect *)self setColorLookupCube:v8];
  }
}

uint64_t __70__PXStoryColorNormalizationEffect__handleResult_resultType_requestID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setColorLookupCube:*(void *)(a1 + 40)];
}

- (void)_updateColorLookupCube
{
  objc_initWeak(&location, self);
  library = self->_library;
  v4 = [(PXStoryColorNormalizationEffect *)self assetNormalization];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __57__PXStoryColorNormalizationEffect__updateColorLookupCube__block_invoke;
  v9 = &unk_1E5DB4ED8;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = [(PXStoryColorNormalizationCubeLibrary *)library requestColorCubeForAssetNormalization:v4 completionHandler:&v6];
  -[PXStoryColorNormalizationEffect setCurrentRequestID:](self, "setCurrentRequestID:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__PXStoryColorNormalizationEffect__updateColorLookupCube__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleResult:v7 resultType:a3 requestID:a4];
}

- (void)setCurrentRequestID:(int64_t)a3
{
  if (self->_currentRequestID != a3)
  {
    -[PXStoryColorNormalizationCubeLibrary cancelRequest:](self->_library, "cancelRequest:");
    self->_currentRequestID = a3;
  }
}

- (void)setAssetNormalization:(id)a3
{
  id v8 = (PFStoryRecipeDisplayAssetNormalization *)a3;
  uint64_t v5 = self->_assetNormalization;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PFStoryRecipeDisplayAssetNormalization *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetNormalization, a3);
      [(PXStoryColorNormalizationEffect *)self _updateColorLookupCube];
    }
  }
}

- (NSString)effectDetails
{
  v2 = [(PXStoryColorNormalizationEffect *)self assetNormalization];
  v3 = [v2 detailedDescription];

  return (NSString *)v3;
}

- (NSString)effectSummary
{
  v3 = NSString;
  uint64_t v4 = [(PXGEffect *)self effectId];
  uint64_t v5 = [(PXGColorGradingEffect *)self colorLookupCube];
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", @"EffectID:%d Cube:%ld", v4, objc_msgSend(v5, "edgeSize"));

  return (NSString *)v6;
}

- (PXStoryColorNormalizationEffect)initWithEntityManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryColorNormalizationEffect;
  v3 = [(PXGColorGradingEffect *)&v7 initWithEntityManager:a3];
  if (v3)
  {
    uint64_t v4 = +[PXStoryColorNormalizationCubeLibrary sharedInstance];
    library = v3->_library;
    v3->_library = (PXStoryColorNormalizationCubeLibrary *)v4;
  }
  return v3;
}

@end