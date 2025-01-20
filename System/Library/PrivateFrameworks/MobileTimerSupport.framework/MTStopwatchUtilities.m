@interface MTStopwatchUtilities
+ (double)_timeAdjustedFor30fpsDisplay:(double)a3;
+ (id)decodeStopwatchesFromDictionary:(id)a3;
+ (id)encodedDictionaryForStopwatches:(id)a3;
@end

@implementation MTStopwatchUtilities

+ (id)encodedDictionaryForStopwatches:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 encodeObject:v3 forKey:@"MTStopwatches"];

  v5 = [v4 encodedDictionary];

  return v5;
}

+ (id)decodeStopwatchesFromDictionary:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F78B88]) initWithEncodedDictionary:v7];
    v9 = [v8 decodeObjectForKey:@"MTStopwatches"];
  }
  else
  {
    v10 = MTLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543362;
      id v13 = a1;
      _os_log_impl(&dword_1BE27A000, v10, OS_LOG_TYPE_INFO, "%{public}@ decoding defaults could not generate dictionary", (uint8_t *)&v12, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

+ (double)_timeAdjustedFor30fpsDisplay:(double)a3
{
  double v3 = a3;
  double v4 = a3 * 1000.0;
  if (v4 <= 1.84467441e19)
  {
    int v5 = _timeAdjustedFor30fpsDisplay__leastSignificantDigits[(121 * ((unint64_t)v4 % 0x64)) >> 12];
    uint32_t v6 = arc4random_uniform(3u);
    float v7 = v3 * 10.0;
    return (double)((100 * vcvtms_u32_f32(v7) + (int)(10 * (v6 + v5))) | 1) / 1000.0;
  }
  return v3;
}

@end