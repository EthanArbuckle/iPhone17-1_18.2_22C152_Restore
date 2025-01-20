@interface PXStorySongsConfiguration
- (BOOL)isEqual:(id)a3;
- (PXAudioAsset)currentAsset;
- (PXAudioAssetFetchResult)curatedAudioAssets;
- (PXAudioAssetFetchResult)fallbackCuratedAssets;
- (PXStorySongsConfiguration)init;
- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3;
- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3 currentAsset:(id)a4;
- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3 fallbackCuratedAssets:(id)a4 currentAsset:(id)a5;
- (id)description;
- (id)previewConfiguration;
- (unint64_t)hash;
@end

@implementation PXStorySongsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_fallbackCuratedAssets, 0);
  objc_storeStrong((id *)&self->_curatedAudioAssets, 0);
}

- (PXAudioAsset)currentAsset
{
  return self->_currentAsset;
}

- (PXAudioAssetFetchResult)fallbackCuratedAssets
{
  return self->_fallbackCuratedAssets;
}

- (PXAudioAssetFetchResult)curatedAudioAssets
{
  return self->_curatedAudioAssets;
}

- (id)previewConfiguration
{
  v3 = [(PXStorySongsConfiguration *)self curatedAudioAssets];
  v4 = PXAudioAssetFetchResultMappingFetchResult(v3, &__block_literal_global_138640);

  v5 = [(PXStorySongsConfiguration *)self currentAsset];
  v6 = [v5 previewAudioAsset];

  v7 = [[PXStorySongsConfiguration alloc] initWithCuratedAudioAssets:v4 currentAsset:v6];
  return v7;
}

uint64_t __49__PXStorySongsConfiguration_previewConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 previewAudioAsset];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXStorySongsConfiguration *)self curatedAudioAssets];
  uint64_t v6 = [v5 count];
  v7 = [(PXStorySongsConfiguration *)self fallbackCuratedAssets];
  uint64_t v8 = [v7 count];
  v9 = [(PXStorySongsConfiguration *)self currentAsset];
  v10 = PXAudioAssetDescription(v9);
  v11 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; curated: %li; fallbackCurated: %li, current: %@>",
                  v4,
                  self,
                  v6,
                  v8,
                  v10);

  return v11;
}

- (unint64_t)hash
{
  v2 = [(PXStorySongsConfiguration *)self curatedAudioAssets];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStorySongsConfiguration *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXStorySongsConfiguration *)self curatedAudioAssets];
      id v7 = [(PXStorySongsConfiguration *)v5 curatedAudioAssets];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      id v10 = [(PXStorySongsConfiguration *)self fallbackCuratedAssets];
      id v11 = [(PXStorySongsConfiguration *)v5 fallbackCuratedAssets];
      if (v10 == v11)
      {
      }
      else
      {
        int v12 = [v10 isEqual:v11];

        if (!v12)
        {
          char v9 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v13 = [(PXStorySongsConfiguration *)self currentAsset];
      v14 = [(PXStorySongsConfiguration *)v5 currentAsset];
      if (v13 == v14) {
        char v9 = 1;
      }
      else {
        char v9 = [v13 isEqual:v14];
      }

      goto LABEL_17;
    }
    char v9 = 0;
  }
LABEL_19:

  return v9;
}

- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3 fallbackCuratedAssets:(id)a4 currentAsset:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXStorySongsConfiguration;
  int v12 = [(PXStorySongsConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_curatedAudioAssets, a3);
    objc_storeStrong((id *)&v13->_fallbackCuratedAssets, a4);
    objc_storeStrong((id *)&v13->_currentAsset, a5);
  }

  return v13;
}

- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3 currentAsset:(id)a4
{
  return [(PXStorySongsConfiguration *)self initWithCuratedAudioAssets:a3 fallbackCuratedAssets:0 currentAsset:a4];
}

- (PXStorySongsConfiguration)initWithCuratedAudioAssets:(id)a3
{
  return [(PXStorySongsConfiguration *)self initWithCuratedAudioAssets:a3 currentAsset:0];
}

- (PXStorySongsConfiguration)init
{
  return [(PXStorySongsConfiguration *)self initWithCuratedAudioAssets:0];
}

@end