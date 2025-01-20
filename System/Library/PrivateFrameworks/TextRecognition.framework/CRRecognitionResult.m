@interface CRRecognitionResult
- (CRRecognitionResult)init;
- (NSMutableArray)detectedLineRegions;
- (NSMutableDictionary)detectorRecognizerResultMap;
- (id)_recognizedRegionsForDetectedLineRegion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)recognizedLineRegions;
- (id)recognizedRegionsForDetectedLineRegion:(id)a3;
- (id)recognizedRegionsForDetectedLineRegions:(id)a3;
- (void)addRecognizedRegionPair:(id)a3;
- (void)enumerateResultsUsingBlock:(id)a3;
- (void)setDetectedLineRegions:(id)a3;
- (void)setDetectorRecognizerResultMap:(id)a3;
@end

@implementation CRRecognitionResult

- (CRRecognitionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRRecognitionResult;
  v2 = [(CRRecognitionResult *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    detectorRecognizerResultMap = v2->_detectorRecognizerResultMap;
    v2->_detectorRecognizerResultMap = (NSMutableDictionary *)v3;

    v2->_mapUpdateLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CRRecognitionResult);
  v5 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  objc_super v6 = (void *)[v5 copy];
  [(CRRecognitionResult *)v4 setDetectorRecognizerResultMap:v6];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CRMutableRecognitionResult);
  v5 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  objc_super v6 = (void *)[v5 copy];
  [(CRRecognitionResult *)v4 setDetectorRecognizerResultMap:v6];

  return v4;
}

- (id)recognizedLineRegions
{
  v2 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  uint64_t v3 = [v2 allValues];
  v4 = [v3 valueForKeyPath:@"@unionOfArrays.self"];

  return v4;
}

- (id)recognizedRegionsForDetectedLineRegion:(id)a3
{
  p_mapUpdateLock = &self->_mapUpdateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_mapUpdateLock);
  objc_super v6 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  v7 = [v5 uuid];

  v8 = [v6 objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_mapUpdateLock);
  v9 = [v8 recognizedTextRegions];

  return v9;
}

- (id)recognizedRegionsForDetectedLineRegions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_mapUpdateLock);
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[CRRecognitionResult _recognizedRegionsForDetectedLineRegion:](self, "_recognizedRegionsForDetectedLineRegion:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_mapUpdateLock);
  return v5;
}

- (void)enumerateResultsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CRRecognitionResult_enumerateResultsUsingBlock___block_invoke;
  v7[3] = &unk_1E6CDBF10;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __50__CRRecognitionResult_enumerateResultsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a3;
  id v6 = [v4 detectedLineRegion];
  id v5 = [v4 recognizedTextRegions];

  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v6, v5);
}

- (void)addRecognizedRegionPair:(id)a3
{
  p_mapUpdateLock = &self->_mapUpdateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_mapUpdateLock);
  id v6 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  uint64_t v7 = [v5 detectedLineRegion];
  id v8 = [v7 uuid];
  [v6 setObject:v5 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_mapUpdateLock);
}

- (id)_recognizedRegionsForDetectedLineRegion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRRecognitionResult *)self detectorRecognizerResultMap];
  id v6 = [v4 uuid];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v7 recognizedTextRegions];

  return v8;
}

- (NSMutableDictionary)detectorRecognizerResultMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetectorRecognizerResultMap:(id)a3
{
}

- (NSMutableArray)detectedLineRegions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDetectedLineRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedLineRegions, 0);
  objc_storeStrong((id *)&self->_detectorRecognizerResultMap, 0);
}

@end