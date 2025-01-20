@interface PGDefaultCollectionTitleGenerator
- (BOOL)forDiagnostics;
- (BOOL)isDebug;
- (PGDefaultCollectionTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6;
- (PGEventEnrichment)collection;
- (PHAsset)keyAsset;
- (PHAssetCollection)curatedAssetCollection;
- (void)_generateTitleAndSubtitleWithManager:(id)a3 curationContext:(id)a4 result:(id)a5;
- (void)setDebug:(BOOL)a3;
- (void)setForDiagnostics:(BOOL)a3;
@end

@implementation PGDefaultCollectionTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)setForDiagnostics:(BOOL)a3
{
  self->_forDiagnostics = a3;
}

- (BOOL)forDiagnostics
{
  return self->_forDiagnostics;
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (void)_generateTitleAndSubtitleWithManager:(id)a3 curationContext:(id)a4 result:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  v29 = v8;
  if (self->_forDiagnostics)
  {
    v10 = 0;
LABEL_3:
    v11 = 0;
    v12 = 0;
    goto LABEL_11;
  }
  collection = self->_collection;
  v14 = [v30 photoLibrary];
  v10 = [(PGEventEnrichment *)collection fetchAssetCollectionInPhotoLibrary:v14];

  curatedAssetCollection = self->_curatedAssetCollection;
  if (curatedAssetCollection)
  {
    v12 = curatedAssetCollection;
    v11 = self->_keyAsset;
  }
  else
  {
    if (!v10) {
      goto LABEL_3;
    }
    v16 = +[PGCurationOptions defaultOptions];
    v17 = [(PGTitleGenerator *)self momentNodes];
    objc_msgSend(v16, "setIncludesAllFaces:", objc_msgSend(v17, "count") == 1);

    v18 = [v30 curationManager];
    v19 = [v18 curatedAssetsForAssetCollection:v10 options:v16 curationContext:v8 progressBlock:0];

    if (v19)
    {
      v12 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v19 title:0];
      v20 = [v30 curationManager];
      v21 = [(PGEventEnrichment *)self->_collection uuid];
      v11 = [v20 curatedKeyAssetForCollectionUUID:v21 curatedAssetCollection:v12 options:0 criteria:0 curationContext:v8];
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
LABEL_11:
  v22 = [(PGTitleGenerator *)self momentNodes];
  v23 = [PGTitleGenerator alloc];
  v24 = [(PGTitleGenerator *)self titleGenerationContext];
  v25 = [(PGTitleGenerator *)v23 initWithMomentNodes:v22 referenceDateInterval:0 keyAsset:v11 curatedAssetCollection:v12 assetCollection:v10 type:0 titleGenerationContext:v24];

  v26 = [(PGTitleGenerator *)v25 title];
  v27 = [(PGTitleGenerator *)v25 subtitle];
  v28 = [(PGTitleGenerator *)v25 usedLocationNodes];
  [(PGTitleGenerator *)self setUsedLocationNodes:v28];

  if (v9) {
    v9[2](v9, v26, v27);
  }
}

- (PGDefaultCollectionTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 eventEnrichmentMomentNodes];
  v16 = [v15 temporarySet];

  v19.receiver = self;
  v19.super_class = (Class)PGDefaultCollectionTitleGenerator;
  v17 = [(PGTitleGenerator *)&v19 initWithMomentNodes:v16 type:0 titleGenerationContext:v14];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_collection, a3);
    v17->_debug = 0;
    objc_storeStrong((id *)&v17->_keyAsset, a4);
    objc_storeStrong((id *)&v17->_curatedAssetCollection, a5);
  }

  return v17;
}

@end