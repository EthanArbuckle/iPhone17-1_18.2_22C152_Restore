@interface PIPortraitVideoAdjustmentController
- (NSArray)disparityKeyframes;
- (NSDictionary)cinematographyState;
- (NSNumber)aperture;
- (id)_keyframesForKey:(id)a3 class:(Class)a4;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (id)visualInputKeys;
- (int64_t)debugMode;
- (unint64_t)renderingVersionAtCapture;
- (void)_setKeyframes:(id)a3 forKey:(id)a4;
- (void)setAperture:(id)a3;
- (void)setCinematographyState:(id)a3;
- (void)setDebugMode:(int64_t)a3;
- (void)setDisparityKeyframes:(id)a3;
- (void)setRenderingVersionAtCapture:(unint64_t)a3;
- (void)trimToTimeRange:(id *)a3 usingScript:(id)a4;
@end

@implementation PIPortraitVideoAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = +[PIAdjustmentController enabledKey];
  v6[0] = v3;
  v6[1] = @"apertureKeyframes";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)trimToTimeRange:(id *)a3 usingScript:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(PIPortraitVideoAdjustmentController *)self cinematographyState];
  if (v7)
  {
    long long v8 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    v9 = [v6 changesDictionaryTrimmedByTimeRange:&range];
    [(PIPortraitVideoAdjustmentController *)self setCinematographyState:v9];
  }
  v10 = [(PIPortraitVideoAdjustmentController *)self disparityKeyframes];
  if (v10)
  {
    v24 = v7;
    v11 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = v10;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
          if (v17) {
            CMTime time = *(CMTime *)(v17 + 16);
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          long long v18 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&range.start.epoch = v18;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
          if (CMTimeRangeContainsTime(&range, &time))
          {
            v19 = [PIScalarKeyframe alloc];
            if (v17)
            {
              CMTime lhs = *(CMTime *)(v17 + 16);
              *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
              range.start.epoch = a3->var0.var3;
              CMTimeSubtract(&v26, &lhs, &range.start);
              double v20 = *(double *)(v17 + 8);
            }
            else
            {
              memset(&lhs, 0, sizeof(lhs));
              *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
              range.start.epoch = a3->var0.var3;
              CMTimeSubtract(&v26, &lhs, &range.start);
              double v20 = 0.0;
            }
            v21 = [(PIScalarKeyframe *)v19 initWithTime:&v26 value:v20];
            [v11 addObject:v21];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v22 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
        uint64_t v14 = v22;
      }
      while (v22);
    }

    [(PIPortraitVideoAdjustmentController *)self setDisparityKeyframes:v11];
    v7 = v24;
    v10 = v23;
  }
}

- (id)visualInputKeys
{
  v2 = [(PIAdjustmentController *)self inputKeys];
  v3 = (void *)[v2 mutableCopy];

  [v3 removeObject:@"cinematographyState"];
  return v3;
}

- (void)setRenderingVersionAtCapture:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v4 = [(PIAdjustmentController *)self adjustment];
  [v4 setObject:v5 forKeyedSubscript:@"renderingVersionAtCapture"];
}

- (unint64_t)renderingVersionAtCapture
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"renderingVersionAtCapture"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setDebugMode:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  unint64_t v4 = [(PIAdjustmentController *)self adjustment];
  [v4 setObject:v5 forKeyedSubscript:@"debugMode"];
}

- (int64_t)debugMode
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"debugMode"];
  int64_t v4 = [v3 unsignedIntValue];

  return v4;
}

- (void)setCinematographyState:(id)a3
{
  id v4 = a3;
  id v5 = [(PIAdjustmentController *)self adjustment];
  [v5 setObject:v4 forKeyedSubscript:@"cinematographyState"];
}

- (NSDictionary)cinematographyState
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"cinematographyState"];

  return (NSDictionary *)v3;
}

- (void)setAperture:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [PIScalarKeyframe alloc];
    [v4 floatValue];
    long long v9 = *MEMORY[0x1E4F1FA48];
    uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v7 = [(PIScalarKeyframe *)v5 initWithTime:&v9 value:v6];
    v11[0] = v7;
    long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(PIPortraitVideoAdjustmentController *)self _setKeyframes:v8 forKey:@"apertureKeyframes"];
  }
  else
  {
    [(PIPortraitVideoAdjustmentController *)self _setKeyframes:0 forKey:@"apertureKeyframes"];
  }
}

- (NSNumber)aperture
{
  v2 = [(PIPortraitVideoAdjustmentController *)self _keyframesForKey:@"apertureKeyframes" class:objc_opt_class()];
  v3 = [v2 firstObject];
  if (v3)
  {
    id v4 = [NSNumber numberWithDouble:v3[1]];
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setDisparityKeyframes:(id)a3
{
}

- (NSArray)disparityKeyframes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)[(PIPortraitVideoAdjustmentController *)self _keyframesForKey:@"disparityKeyframes" class:v3];
}

- (void)_setKeyframes:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "dictionaryRepresentation", (void)v17);
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(PIAdjustmentController *)self adjustment];
    [v15 setObject:v8 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v16 = [(PIAdjustmentController *)self adjustment];
    [v16 setObject:0 forKeyedSubscript:v7];
  }
}

- (id)_keyframesForKey:(id)a3 class:(Class)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PIAdjustmentController *)self adjustment];
  long long v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [(PIAdjustmentController *)self adjustment];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (void *)[[a4 alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          [v9 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    long long v17 = (void *)[v9 copy];
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

@end