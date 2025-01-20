@interface PIVideoStabilizeAdjustmentController
+ (id)keyframesKey;
+ (id)stabCropRectKey;
- ($FD18CD26FAB5729647810B74E671536E)stabCropRect;
- (BOOL)isEqual:(id)a3 forKeys:(id)a4;
- (NSArray)keyframes;
- (double)cropFraction;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (unint64_t)analysisType;
- (void)setAnalysisType:(unint64_t)a3;
- (void)setCropFraction:(double)a3;
- (void)setKeyframes:(id)a3;
- (void)setStabCropRect:(id *)a3;
@end

@implementation PIVideoStabilizeAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4
{
  if (a3) {
    return 1;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PIVideoStabilizeAdjustmentController;
  return [(PIAdjustmentController *)&v7 isEqual:a3 forKeys:a4];
}

- (void)setStabCropRect:(id *)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"X";
  uint64_t v5 = [NSNumber numberWithInteger:a3->var0.var0];
  v13[0] = v5;
  v12[1] = @"Y";
  v6 = [NSNumber numberWithInteger:a3->var0.var1];
  v13[1] = v6;
  v12[2] = @"Width";
  objc_super v7 = [NSNumber numberWithInteger:a3->var1.var0];
  v13[2] = v7;
  v12[3] = @"Height";
  uint64_t v8 = [NSNumber numberWithInteger:a3->var1.var1];
  v13[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  v10 = [(PIAdjustmentController *)self adjustment];
  v11 = +[PIVideoStabilizeAdjustmentController stabCropRectKey];
  [v10 setObject:v9 forKeyedSubscript:v11];
}

- ($FD18CD26FAB5729647810B74E671536E)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v4 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)(MEMORY[0x1E4F7A320] + 16);
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E4F7A320];
  retstr->var1 = v4;
  uint64_t v5 = [(PIAdjustmentController *)self adjustment];
  v6 = +[PIVideoStabilizeAdjustmentController stabCropRectKey];
  id v16 = [v5 objectForKeyedSubscript:v6];

  if (v16)
  {
    objc_super v7 = [v16 objectForKeyedSubscript:@"X"];
    int64_t v8 = (int)[v7 intValue];
    uint64_t v9 = [v16 objectForKeyedSubscript:@"Y"];
    int64_t v10 = (int)[v9 intValue];
    v11 = [v16 objectForKeyedSubscript:@"Width"];
    int64_t v12 = (int)[v11 intValue];
    v13 = [v16 objectForKeyedSubscript:@"Height"];
    int v14 = [v13 intValue];
    retstr->var0.var0 = v8;
    retstr->var0.var1 = v10;
    retstr->var1.var0 = v12;
    retstr->var1.var1 = v14;
  }

  return result;
}

- (void)setKeyframes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "dictionaryRepresentation", (void)v14);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  int64_t v12 = [(PIAdjustmentController *)self adjustment];
  v13 = +[PIVideoStabilizeAdjustmentController keyframesKey];
  [v12 setObject:v5 forKeyedSubscript:v13];
}

- (NSArray)keyframes
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIVideoStabilizeAdjustmentController keyframesKey];
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = +[PIReframeKeyframe keyframesFromDictionaryRepresentations:v4];

  return (NSArray *)v5;
}

- (void)setAnalysisType:(unint64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(PIAdjustmentController *)self adjustment];
    id v4 = @"gyro";
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    v3 = [(PIAdjustmentController *)self adjustment];
    id v4 = @"pixel";
  }
  id v5 = v3;
  [v3 setObject:v4 forKeyedSubscript:@"analysisType"];
}

- (unint64_t)analysisType
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"analysisType"];

  if ([v3 isEqualToString:@"pixel"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"gyro"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setCropFraction:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  unint64_t v4 = [(PIAdjustmentController *)self adjustment];
  [v4 setObject:v5 forKeyedSubscript:@"cropFraction"];
}

- (double)cropFraction
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"cropFraction"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (id)stabCropRectKey
{
  return @"stabCropRect";
}

+ (id)keyframesKey
{
  return @"keyframes";
}

@end