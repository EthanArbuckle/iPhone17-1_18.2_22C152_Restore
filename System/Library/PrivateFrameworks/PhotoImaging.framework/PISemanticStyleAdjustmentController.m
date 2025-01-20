@interface PISemanticStyleAdjustmentController
+ (id)allCasts;
+ (id)allCastsWithStandard:(BOOL)a3;
+ (id)allCreativeCasts;
+ (id)allSystemCasts;
+ (id)castKey;
+ (id)colorKey;
+ (id)defaultValuesForCast:(id)a3;
+ (id)intensityKey;
+ (id)statisticsKey;
+ (id)toneKey;
+ (id)useStyleEngineKey;
+ (id)versionKey;
- (BOOL)_areValuesEquivalentBetween:(id)a3 and:(id)a4 nilEquivalentDefaultValue:(id)a5;
- (BOOL)hasDefaultStyleParameters;
- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4;
- (NSDictionary)statistics;
- (NSString)cast;
- (double)color;
- (double)intensity;
- (double)tone;
- (int64_t)version;
- (void)resetToUnstyledOriginal;
- (void)setCast:(id)a3;
- (void)setColor:(double)a3;
- (void)setIntensity:(double)a3;
- (void)setStatistics:(id)a3;
- (void)setTone:(double)a3;
- (void)setVersion:(int64_t)a3;
- (void)updateWithSemStyleInfo:(id)a3;
@end

@implementation PISemanticStyleAdjustmentController

- (BOOL)_areValuesEquivalentBetween:(id)a3 and:(id)a4 nilEquivalentDefaultValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 || !v8)
  {
    if (!v7 || v8)
    {
      if (!v8 || !v7 || [v7 isEqual:v8]) {
        goto LABEL_8;
      }
LABEL_12:
      BOOL v11 = 0;
      goto LABEL_13;
    }
    v10 = v7;
  }
  else
  {
    v10 = v8;
  }
  if (([v10 isEqual:v9] & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PISemanticStyleAdjustmentController intensityKey];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [v6 schema];
    BOOL v11 = [v10 settings];
    v12 = [v11 objectForKeyedSubscript:v7];

    v13 = [(PIAdjustmentController *)self adjustment];
    v14 = [v13 objectForKeyedSubscript:v7];
    v15 = [v6 objectForKeyedSubscript:v7];
    BOOL v16 = [(PISemanticStyleAdjustmentController *)self _areValuesEquivalentBetween:v14 and:v15 nilEquivalentDefaultValue:v12];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PISemanticStyleAdjustmentController;
    BOOL v16 = [(PIAdjustmentController *)&v18 isSettingEqual:v6 forKey:v7];
  }

  return v16;
}

- (BOOL)hasDefaultStyleParameters
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  v4 = [(PISemanticStyleAdjustmentController *)self cast];
  v5 = [v3 defaultValuesForCast:v4];

  if ([v5 count] != 3)
  {
    v20 = NUAssertLogger_8813();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"default values should contain 3 values (tone / color / ");
      int v33 = 138543362;
      v34 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v33, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_8813();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        int v33 = 138543618;
        v34 = v28;
        __int16 v35 = 2114;
        v36 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v33, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      int v33 = 138543362;
      v34 = v27;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v33, 0xCu);
    }
    _NUAssertFailHandler();
  }
  [(PISemanticStyleAdjustmentController *)self tone];
  double v7 = v6;
  id v8 = [v5 objectAtIndexedSubscript:0];
  [v8 floatValue];
  if (vabdd_f64(v7, v9) <= 0.01)
  {
    [(PISemanticStyleAdjustmentController *)self color];
    double v12 = v11;
    v13 = [v5 objectAtIndexedSubscript:1];
    [v13 floatValue];
    if (vabdd_f64(v12, v14) <= 0.01)
    {
      [(PISemanticStyleAdjustmentController *)self intensity];
      double v16 = v15;
      v17 = [v5 objectAtIndexedSubscript:2];
      [v17 floatValue];
      BOOL v10 = vabdd_f64(v16, v18) <= 0.01;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updateWithSemStyleInfo:(id)a3
{
  id v18 = a3;
  if ([v18 count])
  {
    [(PIAdjustmentController *)self setEnabled:1];
    v4 = [v18 objectForKey:@"cast"];
    v5 = v4;
    if (v4 && ([v4 isEqualToString:&stru_1EFFD8610] & 1) == 0)
    {
      double v6 = PISemanticStyleCastFromString(v5);
      [(PISemanticStyleAdjustmentController *)self setCast:v6];
    }
    else
    {
      [(PISemanticStyleAdjustmentController *)self setCast:@"Standard"];
    }
    double v7 = [v18 objectForKey:@"tone"];
    [v7 floatValue];
    double v9 = v8;

    [(PISemanticStyleAdjustmentController *)self setTone:v9];
    BOOL v10 = [v18 objectForKey:@"color"];
    [v10 floatValue];
    double v12 = v11;

    [(PISemanticStyleAdjustmentController *)self setColor:v12];
    v13 = [v18 objectForKey:@"intensity"];
    [v13 floatValue];
    double v15 = v14;

    [(PISemanticStyleAdjustmentController *)self setIntensity:v15];
    double v16 = [v18 objectForKey:@"version"];
    uint64_t v17 = [v16 integerValue];

    [(PISemanticStyleAdjustmentController *)self setVersion:v17];
  }
}

- (void)resetToUnstyledOriginal
{
  [(PISemanticStyleAdjustmentController *)self setCast:@"Standard"];
  [(PISemanticStyleAdjustmentController *)self setTone:0.0];
  [(PISemanticStyleAdjustmentController *)self setColor:0.0];
  [(PISemanticStyleAdjustmentController *)self setIntensity:1.0];
}

- (int64_t)version
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() versionKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)setVersion:(int64_t)a3
{
  id v6 = [NSNumber numberWithInteger:a3];
  v4 = [(PIAdjustmentController *)self adjustment];
  int64_t v5 = [(id)objc_opt_class() versionKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (void)setStatistics:(id)a3
{
  id v6 = (id)[a3 copy];
  v4 = [(PIAdjustmentController *)self adjustment];
  int64_t v5 = [(id)objc_opt_class() statisticsKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSDictionary)statistics
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() statisticsKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  return (NSDictionary *)v4;
}

- (double)intensity
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() intensityKey];
  v4 = [v2 objectForKeyedSubscript:v3];

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
  v4 = [(PIAdjustmentController *)self adjustment];
  double v5 = [(id)objc_opt_class() intensityKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSString)cast
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() castKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  return (NSString *)v4;
}

- (void)setCast:(id)a3
{
  id v6 = (id)[a3 copy];
  v4 = [(PIAdjustmentController *)self adjustment];
  double v5 = [(id)objc_opt_class() castKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (void)setColor:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  v4 = [(PIAdjustmentController *)self adjustment];
  double v5 = [(id)objc_opt_class() colorKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (double)color
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() colorKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)setTone:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  v4 = [(PIAdjustmentController *)self adjustment];
  double v5 = [(id)objc_opt_class() toneKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (double)tone
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [(id)objc_opt_class() toneKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

+ (id)defaultValuesForCast:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v3 = PISemanticStyleCastToMakerNoteString(a3);
  v4 = [MEMORY[0x1E4F55F08] defaultStyleForCastType:v3];
  double v5 = v4;
  if (v4)
  {
    [v4 toneBias];
    double v7 = v6;
    [v5 colorBias];
    double v9 = v8;
    [v5 castIntensity];
    double v11 = v10;
  }
  else
  {
    double v11 = 1.0;
    double v9 = 0.0;
    double v7 = 0.0;
  }
  double v12 = [NSNumber numberWithDouble:v7];
  v13 = objc_msgSend(NSNumber, "numberWithDouble:", v9, v12);
  v17[1] = v13;
  float v14 = [NSNumber numberWithDouble:v11];
  v17[2] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  return v15;
}

+ (id)allCreativeCasts
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Colorful";
  v4[1] = @"NoFilter";
  v4[2] = @"DreamyHues";
  v4[3] = @"UrbanCool";
  v4[4] = @"WarmAuthentic";
  v4[5] = @"Earthy";
  v4[6] = @"CloudCover";
  v4[7] = @"LongGray";
  v4[8] = @"StarkBW";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  return v2;
}

+ (id)allSystemCasts
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Cool";
  v4[1] = @"Neutral";
  v4[2] = @"BlushWarm";
  v4[3] = @"GoldWarm";
  v4[4] = @"TanWarm";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)allCasts
{
  return (id)[a1 allCastsWithStandard:0];
}

+ (id)allCastsWithStandard:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [a1 allSystemCasts];
  float v6 = [a1 allCreativeCasts];
  double v7 = [v5 arrayByAddingObjectsFromArray:v6];
  float v8 = (void *)[v7 mutableCopy];

  if (v3) {
    [v8 addObject:@"Standard"];
  }
  double v9 = (void *)[v8 copy];

  return v9;
}

+ (id)useStyleEngineKey
{
  return @"useStyleEngineKey";
}

+ (id)versionKey
{
  return @"version";
}

+ (id)statisticsKey
{
  return @"statistics";
}

+ (id)intensityKey
{
  return @"intensity";
}

+ (id)castKey
{
  return @"cast";
}

+ (id)colorKey
{
  return @"color";
}

+ (id)toneKey
{
  return @"tone";
}

@end