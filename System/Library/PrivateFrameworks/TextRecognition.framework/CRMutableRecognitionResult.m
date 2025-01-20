@interface CRMutableRecognitionResult
- (void)addContentsOfRecognitionResult:(id)a3 shouldOverwriteExistingHandler:(id)a4;
- (void)addRecognizedRegions:(id)a3 detectedRegion:(id)a4;
@end

@implementation CRMutableRecognitionResult

- (void)addRecognizedRegions:(id)a3 detectedRegion:(id)a4
{
  p_mapUpdateLock = &self->super._mapUpdateLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_mapUpdateLock);
  v9 = [[CRDetectedRecognizedRegionPair alloc] initWithDetectedRegion:v7 recognizedRegions:v8];

  v10 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  v11 = [v7 uuid];

  [v10 setObject:v9 forKeyedSubscript:v11];
  os_unfair_lock_unlock(p_mapUpdateLock);
}

- (void)addContentsOfRecognitionResult:(id)a3 shouldOverwriteExistingHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->super._mapUpdateLock);
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [v6 detectorRecognizerResultMap];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__CRMutableRecognitionResult_addContentsOfRecognitionResult_shouldOverwriteExistingHandler___block_invoke;
  v21[3] = &unk_1E6CDBF38;
  v21[4] = self;
  id v10 = v7;
  id v23 = v10;
  id v11 = v8;
  id v22 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v21];

  os_unfair_lock_unlock(&self->super._mapUpdateLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[CRRecognitionResult addRecognizedRegionPair:](self, "addRecognizedRegionPair:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v14);
  }
}

void __92__CRMutableRecognitionResult_addContentsOfRecognitionResult_shouldOverwriteExistingHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) detectorRecognizerResultMap];
  id v7 = [v6 objectForKeyedSubscript:v13];

  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  v9 = [*(id *)(a1 + 32) detectorRecognizerResultMap];
  id v10 = [v9 objectForKeyedSubscript:v13];
  id v11 = [v10 recognizedTextRegions];
  id v12 = [v5 recognizedTextRegions];
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v11, v12);

  if (v8) {
LABEL_3:
  }
    [*(id *)(a1 + 40) addObject:v5];
}

@end