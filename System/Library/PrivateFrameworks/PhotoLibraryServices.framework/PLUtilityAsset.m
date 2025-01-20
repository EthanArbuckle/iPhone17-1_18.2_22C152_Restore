@interface PLUtilityAsset
+ (id)utilityAssetFromManagedAsset:(id)a3 usingPool:(id)a4;
- (BOOL)hasQRCodeData;
- (BOOL)isAIImageFromGenerativePlayground;
- (NSMutableSet)sceneClassifications;
- (PLUtilityAsset)init;
- (int64_t)sceneAnalysisVersion;
- (void)_prepareForRecycle;
- (void)setHasQRCodeData:(BOOL)a3;
- (void)setIsAIImageFromGenerativePlayground:(BOOL)a3;
- (void)setSceneAnalysisVersion:(int64_t)a3;
- (void)setSceneClassifications:(id)a3;
@end

@implementation PLUtilityAsset

- (void).cxx_destruct
{
}

- (void)setHasQRCodeData:(BOOL)a3
{
  self->_hasQRCodeData = a3;
}

- (BOOL)hasQRCodeData
{
  return self->_hasQRCodeData;
}

- (void)setIsAIImageFromGenerativePlayground:(BOOL)a3
{
  self->_isAIImageFromGenerativePlayground = a3;
}

- (BOOL)isAIImageFromGenerativePlayground
{
  return self->_isAIImageFromGenerativePlayground;
}

- (void)setSceneClassifications:(id)a3
{
}

- (NSMutableSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneAnalysisVersion:(int64_t)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (int64_t)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (PLUtilityAsset)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLUtilityAsset;
  v2 = [(PLUtilityAsset *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_sceneAnalysisVersion = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    sceneClassifications = v3->_sceneClassifications;
    v3->_sceneClassifications = (NSMutableSet *)v4;

    *(_WORD *)&v3->_isAIImageFromGenerativePlayground = 0;
  }
  return v3;
}

- (void)_prepareForRecycle
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_sceneAnalysisVersion = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_sceneClassifications;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "_prepareForRecycle", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_sceneClassifications removeAllObjects];
}

+ (id)utilityAssetFromManagedAsset:(id)a3 usingPool:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLUtilityAsset.m", 131, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v9)
    {
LABEL_3:
      long long v10 = [v9 _dequeueRecylableAsset];
      if (v10) {
        goto LABEL_5;
      }
    }
  }
  long long v10 = objc_alloc_init(PLUtilityAsset);
LABEL_5:
  long long v11 = [v7 mediaAnalysisAttributes];
  v12 = [v11 characterRecognitionAttributes];
  uint64_t v13 = [v12 machineReadableCodeData];
  [(PLUtilityAsset *)v10 setHasQRCodeData:v13 != 0];

  v14 = [v7 extendedAttributes];
  v15 = [v14 generativeAIType];
  -[PLUtilityAsset setIsAIImageFromGenerativePlayground:](v10, "setIsAIImageFromGenerativePlayground:", [v15 intValue] == 1);

  v16 = [v7 additionalAttributes];
  -[PLUtilityAsset setSceneAnalysisVersion:](v10, "setSceneAnalysisVersion:", (int)[v16 sceneAnalysisVersion]);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v17 = [v7 additionalAttributes];
  v18 = [v17 sceneClassifications];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (!v9
          || ([v9 _dequeueRecylableClassification],
              (v24 = (PLUtilityAssetClassification *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v24 = objc_alloc_init(PLUtilityAssetClassification);
        }
        -[PLUtilityAssetClassification setExtendedSceneIdentifier:](v24, "setExtendedSceneIdentifier:", [v23 sceneIdentifier]);
        [v23 confidence];
        -[PLUtilityAssetClassification setConfidence:](v24, "setConfidence:");
        -[PLUtilityAssetClassification setPackedBoundingBox:](v24, "setPackedBoundingBox:", [v23 packedBoundingBoxRect]);
        -[PLUtilityAssetClassification setClassificationType:](v24, "setClassificationType:", (int)[v23 classificationType]);
        v25 = [(PLUtilityAsset *)v10 sceneClassifications];
        [v25 addObject:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v20);
  }

  return v10;
}

@end