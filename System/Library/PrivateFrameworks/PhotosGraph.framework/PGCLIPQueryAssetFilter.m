@interface PGCLIPQueryAssetFilter
+ (NSString)name;
- (BOOL)passesWithAsset:(id)a3;
- (NSArray)positiveQueryEmbeddings;
- (NSDictionary)cosineSimilarityThresholdByVersion;
- (PGCLIPQueryAssetFilter)initWithPositiveQueryEmbeddings:(id)a3 cosineSimilarityThresholdByVersion:(id)a4;
- (double)cosineSimilarityBetweenQueryEmbedding:(id)a3 assetEmbedding:(id)a4;
- (id)filteredAssetsFromAssets:(id)a3;
@end

@implementation PGCLIPQueryAssetFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cosineSimilarityThresholdByVersion, 0);
  objc_storeStrong((id *)&self->_positiveQueryEmbeddings, 0);
}

- (NSDictionary)cosineSimilarityThresholdByVersion
{
  return self->_cosineSimilarityThresholdByVersion;
}

- (NSArray)positiveQueryEmbeddings
{
  return self->_positiveQueryEmbeddings;
}

- (double)cosineSimilarityBetweenQueryEmbedding:(id)a3 assetEmbedding:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  uint64_t v8 = [v6 elementCount];
  uint64_t v9 = [v6 elementType];
  float v10 = 0.0;
  if (v8 == v7 >> 2 && v9 == 1)
  {
    id v11 = [v6 descriptorData];
    v12 = (float *)[v11 bytes];

    v13 = (float *)[v5 bytes];
    if (v12)
    {
      if (v13)
      {
        if (v7 >= 4)
        {
          unint64_t v14 = v7 >> 2;
          float v15 = 0.0;
          float v16 = 0.0;
          do
          {
            float v17 = *v12++;
            float v18 = v17;
            float v19 = *v13++;
            float v10 = v10 + (float)(v18 * v19);
            float v16 = v16 + (float)(v18 * v18);
            float v15 = v15 + (float)(v19 * v19);
            --v14;
          }
          while (v14);
          if (v16 > 0.0 && v15 > 0.0) {
            float v10 = v10 / sqrtf(v16 * v15);
          }
        }
      }
    }
  }

  return v10;
}

- (BOOL)passesWithAsset:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 curationModel];
  id v6 = [v5 CLIPprintModel];
  uint64_t v7 = [v6 version];

  if (v7 == [MEMORY[0x1E4F8EB20] latestVersion])
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
    uint64_t v9 = [v8 stringValue];

    float v10 = [(NSDictionary *)self->_cosineSimilarityThresholdByVersion allKeys];
    if ([v10 containsObject:v9])
    {
      id v11 = [(NSDictionary *)self->_cosineSimilarityThresholdByVersion objectForKeyedSubscript:v9];
      [v11 doubleValue];
      double v13 = v12;

      unint64_t v14 = [v4 clsSceneprint];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      float v15 = self->_positiveQueryEmbeddings;
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            -[PGCLIPQueryAssetFilter cosineSimilarityBetweenQueryEmbedding:assetEmbedding:](self, "cosineSimilarityBetweenQueryEmbedding:assetEmbedding:", *(void *)(*((void *)&v23 + 1) + 8 * i), v14, (void)v23);
            if (v20 >= v13)
            {
              BOOL v21 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      BOOL v21 = 0;
LABEL_15:
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)filteredAssetsFromAssets:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PGCLIPQueryAssetFilter_filteredAssetsFromAssets___block_invoke;
  v8[3] = &unk_1E68EC880;
  v8[4] = self;
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:v8];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __51__PGCLIPQueryAssetFilter_filteredAssetsFromAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) passesWithAsset:a2];
}

- (PGCLIPQueryAssetFilter)initWithPositiveQueryEmbeddings:(id)a3 cosineSimilarityThresholdByVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCLIPQueryAssetFilter;
  uint64_t v9 = [(PGCLIPQueryAssetFilter *)&v12 init];
  float v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_positiveQueryEmbeddings, a3);
    objc_storeStrong((id *)&v10->_cosineSimilarityThresholdByVersion, a4);
  }

  return v10;
}

+ (NSString)name
{
  return (NSString *)@"CLIP";
}

@end