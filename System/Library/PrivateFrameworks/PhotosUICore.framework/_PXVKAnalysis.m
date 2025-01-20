@interface _PXVKAnalysis
- (PXDisplayAsset)asset;
- (PXVKImageAnalysis)analysis;
- (_PXVKAnalysis)initWithAsset:(id)a3 analysis:(id)a4;
@end

@implementation _PXVKAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PXVKImageAnalysis)analysis
{
  return self->_analysis;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (_PXVKAnalysis)initWithAsset:(id)a3 analysis:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXVKAnalysis;
  v9 = [(_PXVKAnalysis *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_analysis, a4);
  }

  return v10;
}

@end