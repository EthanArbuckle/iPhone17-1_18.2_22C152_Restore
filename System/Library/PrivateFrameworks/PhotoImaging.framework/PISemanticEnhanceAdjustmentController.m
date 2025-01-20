@interface PISemanticEnhanceAdjustmentController
+ (id)boundingBoxesKey;
+ (id)faceBoundingBoxesKey;
+ (id)genericLandscapeSceneLabel;
+ (id)intensityKey;
+ (id)platedFoodSceneLabel;
+ (id)sceneConfidenceKey;
+ (id)sceneLabelKey;
+ (id)sunriseSunsetSceneLabel;
- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4;
- (NSArray)boundingBoxes;
- (double)intensity;
- (double)sceneConfidence;
- (int64_t)scene;
- (void)setBoundingBoxesFromObservations:(id)a3 orientation:(int64_t)a4;
- (void)setFaceBoundingBoxesFromObservations:(id)a3 orientation:(int64_t)a4;
- (void)setIntensity:(double)a3;
- (void)setScene:(int64_t)a3 confidence:(double)a4;
@end

@implementation PISemanticEnhanceAdjustmentController

- (void)setFaceBoundingBoxesFromObservations:(id)a3 orientation:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_468);
  }
  v6 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = NUOrientationName();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1A9680000, v7, OS_LOG_TYPE_DEFAULT, "Setting face bounding boxes based on orientation (%@) and observations: %@", buf, 0x16u);
  }
  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  NUOrientationInverse();
  long long v27 = 0u;
  memset(buf, 0, sizeof(buf));
  NUOrientationMakeTransformWithSize();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v20[0] = *(_OWORD *)buf;
        v20[1] = *(_OWORD *)&buf[16];
        v20[2] = v27;
        v16 = DictionaryRepresentationFromObservation(v15, v20);
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  v17 = (void *)[v9 copy];
  v18 = [(PIAdjustmentController *)self adjustment];
  v19 = [(id)objc_opt_class() faceBoundingBoxesKey];
  [v18 setObject:v17 forKeyedSubscript:v19];
}

- (void)setBoundingBoxesFromObservations:(id)a3 orientation:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_468);
  }
  v6 = (void *)*MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = NUOrientationName();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1A9680000, v7, OS_LOG_TYPE_DEFAULT, "Setting bounding boxes based on orientation (%@) and observations: %@", buf, 0x16u);
  }
  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  NUOrientationInverse();
  long long v27 = 0u;
  memset(buf, 0, sizeof(buf));
  NUOrientationMakeTransformWithSize();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v20[0] = *(_OWORD *)buf;
        v20[1] = *(_OWORD *)&buf[16];
        v20[2] = v27;
        v16 = DictionaryRepresentationFromObservation(v15, v20);
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  v17 = (void *)[v9 copy];
  v18 = [(PIAdjustmentController *)self adjustment];
  v19 = [(id)objc_opt_class() boundingBoxesKey];
  [v18 setObject:v17 forKeyedSubscript:v19];
}

- (void)setScene:(int64_t)a3 confidence:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) > 2)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_468);
    }
    uint64_t v12 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v15 = a3;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Tried to set sceneLabel to unsupported value: %ld", buf, 0xCu);
    }
  }
  else
  {
    v6 = off_1E5D7ED80[a3 - 1];
    v7 = [(PIAdjustmentController *)self adjustment];
    v8 = [(id)objc_opt_class() sceneLabelKey];
    [v7 setObject:v6 forKeyedSubscript:v8];

    id v13 = [NSNumber numberWithDouble:a4];
    v9 = [(PIAdjustmentController *)self adjustment];
    id v10 = [(id)objc_opt_class() sceneConfidenceKey];
    [v9 setObject:v13 forKeyedSubscript:v10];
  }
}

- (NSArray)boundingBoxes
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() boundingBoxesKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (double)sceneConfidence
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() sceneConfidenceKey];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = (void *)v4;
  v6 = &unk_1F0009710;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (int64_t)scene
{
  v2 = [(PIAdjustmentController *)self adjustment];
  uint64_t v3 = [(id)objc_opt_class() sceneLabelKey];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [(id)objc_opt_class() platedFoodSceneLabel];
  LOBYTE(v3) = [v4 isEqualToString:v5];

  if (v3)
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [(id)objc_opt_class() sunriseSunsetSceneLabel];
    char v8 = [v4 isEqualToString:v7];

    if (v8)
    {
      int64_t v6 = 2;
    }
    else
    {
      float v9 = [(id)objc_opt_class() genericLandscapeSceneLabel];
      int v10 = [v4 isEqualToString:v9];

      if (v10) {
        int64_t v6 = 3;
      }
      else {
        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (double)intensity
{
  v2 = [(PIAdjustmentController *)self adjustment];
  uint64_t v3 = [(id)objc_opt_class() intensityKey];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  objc_opt_class();
  double v5 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [v4 floatValue];
    double v5 = v6;
  }

  return v5;
}

- (void)setIntensity:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  uint64_t v4 = [(PIAdjustmentController *)self adjustment];
  double v5 = [(id)objc_opt_class() intensityKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(PIAdjustmentController *)self adjustment];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v6 objectForKeyedSubscript:v7];
  if (v9 | v10)
  {
    uint64_t v12 = [(id)objc_opt_class() intensityKey];
    int v13 = [v7 isEqualToString:v12];

    if (v13)
    {
      [(id)v9 doubleValue];
      double v15 = v14;
      [(id)v10 doubleValue];
      BOOL v11 = vabdd_f64(v15, v16) < 1.0;
    }
    else
    {
      v17 = [(id)objc_opt_class() sceneLabelKey];
      int v18 = [v7 isEqualToString:v17];

      if (v18)
      {
        unsigned __int8 v19 = [(id)v9 isEqualToString:v10];
      }
      else
      {
        v20 = [(id)objc_opt_class() boundingBoxesKey];
        int v21 = [v7 isEqualToString:v20];

        if (v21)
        {
          unsigned __int8 v19 = [(id)v9 isEqualToArray:v10];
        }
        else
        {
          v23.receiver = self;
          v23.super_class = (Class)PISemanticEnhanceAdjustmentController;
          unsigned __int8 v19 = [(PIAdjustmentController *)&v23 isSettingEqual:v6 forKey:v7];
        }
      }
      BOOL v11 = v19;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

+ (id)boundingBoxesKey
{
  return @"boundingBoxes";
}

+ (id)faceBoundingBoxesKey
{
  return @"faceBoundingBoxes";
}

+ (id)sceneConfidenceKey
{
  return @"sceneConfidence";
}

+ (id)sceneLabelKey
{
  return @"sceneLabel";
}

+ (id)intensityKey
{
  return @"intensity";
}

+ (id)genericLandscapeSceneLabel
{
  return @"genericLandscape";
}

+ (id)sunriseSunsetSceneLabel
{
  return @"sunriseSunset";
}

+ (id)platedFoodSceneLabel
{
  return @"platedFood";
}

@end