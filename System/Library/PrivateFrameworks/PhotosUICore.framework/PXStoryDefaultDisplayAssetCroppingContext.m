@interface PXStoryDefaultDisplayAssetCroppingContext
- (NSSet)featuredPersonLocalIdentifiers;
- (PXDisplayAssetCollection)assetCollection;
- (PXStoryDefaultDisplayAssetCroppingContext)init;
- (PXStoryDefaultDisplayAssetCroppingContext)initWithAssetCollection:(id)a3 detailedSaliency:(id)a4;
- (PXStorySaliencyDataSource)detailedSaliency;
- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4;
- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4 forFeaturedPersonWithLocalIdentifiers:(id)a5;
- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5;
- (id)orderFaces:(id)a3;
@end

@implementation PXStoryDefaultDisplayAssetCroppingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_featuredPersonLocalIdentifiers, 0);
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5
{
  id v8 = a3;
  v9 = [(PXStoryDefaultDisplayAssetCroppingContext *)self detailedSaliency];
  v10 = [v9 saliencyAreasForDisplayAsset:v8];

  v11 = [[PXStoryMultipartPanoramaCropFinder alloc] initWithSaliencyAreas:v10];
  v12 = [(PXStoryMultipartPanoramaCropFinder *)v11 bestCropContentsRectsWithAspectRatio:a4 axis:a5];

  return v12;
}

- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PXStoryDefaultDisplayAssetCroppingContext;
  int64_t v12 = 0;
  v6 = [(PXStoryBaseDisplayAssetCroppingContext *)&v11 adjustOrderedFaces:a3 featuredFaceCount:&v12];
  v7 = [(PXStoryDefaultDisplayAssetCroppingContext *)self orderFaces:v6];

  id v8 = [(PXStoryDefaultDisplayAssetCroppingContext *)self featuredPersonLocalIdentifiers];
  v9 = [(PXStoryDefaultDisplayAssetCroppingContext *)self adjustOrderedFaces:v7 featuredFaceCount:&v12 forFeaturedPersonWithLocalIdentifiers:v8];

  if (!v12) {
    int64_t v12 = [v9 count] != 0;
  }
  if (a4) {
    *a4 = v12;
  }
  return v9;
}

- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4 forFeaturedPersonWithLocalIdentifiers:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  uint64_t v10 = [v9 count];
  if (v10 < 1 || (uint64_t v11 = v10, ![v8 count]))
  {
    int64_t v13 = 0;
    v21 = v9;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v23 = a4;
  int64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  int64_t v13 = 0;
  for (uint64_t i = 0; i != v11; ++i)
  {
    v15 = [v9 objectAtIndexedSubscript:i];
    v16 = [v15 personLocalIdentifier];
    uint64_t v17 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v16];
    v18 = (void *)v17;
    if (v17) {
      v19 = (void *)v17;
    }
    else {
      v19 = v16;
    }
    id v20 = v19;

    if (v20 && [v8 containsObject:v20]) {
      [v12 insertObject:v15 atIndex:v13++];
    }
    else {
      [v12 addObject:v15];
    }
  }
  v21 = (void *)[v12 copy];

  a4 = v23;
  if (v23) {
LABEL_15:
  }
    *a4 = v13;
LABEL_16:

  return v21;
}

- (id)orderFaces:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 < 1)
  {
    id v18 = v3;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    double v7 = -1.79769313e308;
    do
    {
      id v8 = [v3 objectAtIndexedSubscript:v6];
      [v8 size];
      double v10 = v9;

      if (v7 < v10) {
        double v7 = v10;
      }
      ++v6;
    }
    while (v5 != v6);
    uint64_t v11 = 0;
    double v12 = v7 * 0.9;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    double v14 = -1.79769313e308;
    do
    {
      v15 = [v3 objectAtIndexedSubscript:v11];
      [v15 size];
      if (v16 >= v12)
      {
        [v15 quality];
        if (v17 > v14)
        {
          uint64_t v13 = v11;
          double v14 = v17;
        }
      }

      ++v11;
    }
    while (v5 != v11);
    id v18 = v3;
    if (v13 && v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
      for (uint64_t i = 0; i != v5; ++i)
      {
        v21 = [v18 objectAtIndexedSubscript:i];
        if (v13 == i) {
          [v19 insertObject:v21 atIndex:0];
        }
        else {
          [v19 addObject:v21];
        }
      }
      uint64_t v22 = [v19 copy];

      id v18 = (id)v22;
    }
  }

  return v18;
}

- (NSSet)featuredPersonLocalIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_featuredPersonLocalIdentifiers)
  {
    id v3 = [(PXStoryDefaultDisplayAssetCroppingContext *)v2 assetCollection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 featuredPersonLocalIdentifiers];
      objc_claimAutoreleasedReturnValue();
      id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      PXMap();
    }

    if (!v2->_featuredPersonLocalIdentifiers)
    {
      uint64_t v5 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      featuredPersonLocalIdentifiers = v2->_featuredPersonLocalIdentifiers;
      v2->_featuredPersonLocalIdentifiers = v5;
    }
  }
  objc_sync_exit(v2);

  double v7 = v2->_featuredPersonLocalIdentifiers;
  return v7;
}

uint64_t __75__PXStoryDefaultDisplayAssetCroppingContext_featuredPersonLocalIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:a2];
}

- (PXStoryDefaultDisplayAssetCroppingContext)initWithAssetCollection:(id)a3 detailedSaliency:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryDefaultDisplayAssetCroppingContext;
  double v9 = [(PXStoryBaseDisplayAssetCroppingContext *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollection, a3);
    objc_storeStrong((id *)&v10->_detailedSaliency, a4);
  }

  return v10;
}

- (PXStoryDefaultDisplayAssetCroppingContext)init
{
  return [(PXStoryDefaultDisplayAssetCroppingContext *)self initWithAssetCollection:0 detailedSaliency:0];
}

@end