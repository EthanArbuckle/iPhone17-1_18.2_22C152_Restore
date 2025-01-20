@interface PXStoryDefaultAssetsProducerFactory
- (id)assetsProducerForConfiguration:(id)a3;
@end

@implementation PXStoryDefaultAssetsProducerFactory

- (id)assetsProducerForConfiguration:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 options];
  v5 = [v3 assetCollection];
  uint64_t v6 = [v3 keyAsset];
  uint64_t v7 = [v3 assets];
  v8 = [v3 referencePersons];
  v9 = [v3 persistableRecipe];
  if ((v4 & 2) != 0 && v6)
  {
    v34[0] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    v11 = [PXStaticDisplayAssetsDataSource alloc];
    v12 = v11;
    if (v5)
    {
      v33 = v5;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      v14 = [(PXStaticDisplayAssetsDataSource *)v12 initWithAssetCollectionBySection:v13 assetsBySection:0 curatedAssetsBySection:0 keyAssetsBySection:v10 sectionContent:0];
    }
    else
    {
      v14 = [(PXStaticDisplayAssetsDataSource *)v11 initWithAssetCollectionBySection:0 assetsBySection:0 curatedAssetsBySection:0 keyAssetsBySection:v10 sectionContent:0];
    }
    v26 = [PXStoryPassthroughAssetsProducer alloc];
    v27 = [[PXPassthroughAssetsDataSourceManager alloc] initWithDataSource:v14];
    v25 = [(PXStoryPassthroughAssetsProducer *)v26 initWithAssetsDataSourceManager:v27];

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v15 = (v4 >> 8) & 2 | ((v4 & 2) >> 1);
    v16 = [PXStoryPHAssetCollectionAssetsProducer alloc];
    id v17 = (id)v6;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      v18 = (PXStaticDisplayAssetsDataSource *)v17;
    }
    else {
      v18 = 0;
    }

    v25 = -[PXStoryPHAssetCollectionAssetsProducer initWithAssetCollection:keyAsset:referencePersons:curationKind:options:](v16, "initWithAssetCollection:keyAsset:referencePersons:curationKind:options:", v5, v18, v8, [v3 curationKind], v15);
LABEL_23:

    goto LABEL_24;
  }
  if (v6 | v7)
  {
    v19 = [PXStaticDisplayAssetsDataSource alloc];
    if (v5)
    {
      v32 = v5;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      if (v7) {
        goto LABEL_12;
      }
    }
    else
    {
      v20 = 0;
      if (v7)
      {
LABEL_12:
        uint64_t v31 = v7;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        if (v6) {
          goto LABEL_13;
        }
        goto LABEL_31;
      }
    }
    v21 = 0;
    if (v6)
    {
LABEL_13:
      uint64_t v30 = v6;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      v18 = [(PXStaticDisplayAssetsDataSource *)v19 initWithAssetCollectionBySection:v20 assetsBySection:v21 curatedAssetsBySection:0 keyAssetsBySection:v22 sectionContent:0];

      if (!v7)
      {
LABEL_15:
        if (v5) {

        }
        v23 = [PXStoryPassthroughAssetsProducer alloc];
        v24 = [[PXPassthroughAssetsDataSourceManager alloc] initWithDataSource:v18];
        v25 = [(PXStoryPassthroughAssetsProducer *)v23 initWithAssetsDataSourceManager:v24];

        goto LABEL_23;
      }
LABEL_14:

      goto LABEL_15;
    }
LABEL_31:
    v18 = [(PXStaticDisplayAssetsDataSource *)v19 initWithAssetCollectionBySection:v20 assetsBySection:v21 curatedAssetsBySection:0 keyAssetsBySection:0 sectionContent:0];
    if (!v7) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    v10 = objc_alloc_init(PXStaticDisplayAssetsDataSource);
    v29 = [PXStoryPassthroughAssetsProducer alloc];
    v14 = [[PXPassthroughAssetsDataSourceManager alloc] initWithDataSource:v10];
    v25 = [(PXStoryPassthroughAssetsProducer *)v29 initWithAssetsDataSourceManager:v14];
LABEL_20:

    goto LABEL_24;
  }
  v25 = [[PXStoryPersistableRecipeAssetsProducer alloc] initWithPersistableRecipe:v9];
LABEL_24:

  return v25;
}

@end