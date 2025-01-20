@interface PIScalarKeyframe
+ (id)keyframeInArray:(id)a3 closestToTime:(id *)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (PIScalarKeyframe)initWithDictionaryRepresentation:(id)a3;
- (PIScalarKeyframe)initWithTime:(id *)a3 value:(double)a4;
- (void)nu_updateDigest:(id)a3;
@end

@implementation PIScalarKeyframe

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PIScalarKeyframe;
  v4 = [(PIScalarKeyframe *)&v8 description];
  v5 = NUStringFromTime();
  v6 = [v3 stringWithFormat:@"%@: t=%@, v=%f", v4, v5, *(void *)&self->_value];

  return (NSString *)v6;
}

- (void)nu_updateDigest:(id)a3
{
  p_time = &self->_time;
  id v5 = a3;
  [v5 addBytes:p_time length:24];
  [v5 addBytes:&self->_value length:8];
}

- (NSDictionary)dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"timeValue";
  if (self) {
    int64_t value = self->_time.value;
  }
  else {
    int64_t value = 0;
  }
  v4 = [NSNumber numberWithLongLong:value];
  v12[0] = v4;
  v11[1] = @"timeScale";
  if (self) {
    uint64_t timescale = self->_time.timescale;
  }
  else {
    uint64_t timescale = 0;
  }
  v6 = [NSNumber numberWithInt:timescale];
  v12[1] = v6;
  v11[2] = @"value";
  if (self) {
    double v7 = self->_value;
  }
  else {
    double v7 = 0.0;
  }
  objc_super v8 = [NSNumber numberWithDouble:v7];
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return (NSDictionary *)v9;
}

- (PIScalarKeyframe)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"timeValue"];
  v6 = [v4 objectForKeyedSubscript:@"timeScale"];
  double v7 = [v4 objectForKeyedSubscript:@"value"];

  if (v5 && v6 && v7)
  {
    memset(&v11, 0, sizeof(v11));
    CMTimeMake(&v11, [v5 longLongValue], objc_msgSend(v6, "intValue"));
    [v7 doubleValue];
    CMTime v10 = v11;
    objc_super v8 = -[PIScalarKeyframe initWithTime:value:](self, "initWithTime:value:", &v10);
  }
  else
  {

    objc_super v8 = 0;
  }

  return v8;
}

- (PIScalarKeyframe)initWithTime:(id *)a3 value:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PIScalarKeyframe;
  result = [(PIScalarKeyframe *)&v8 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.int64_t value = v7;
    result->_int64_t value = a4;
  }
  return result;
}

+ (id)keyframeInArray:(id)a3 closestToTime:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 firstObject];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      v12 = v6;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        if (v13) {
          CMTime time1 = *(CMTime *)(v13 + 16);
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a4;
        if (CMTimeCompare(&time1, (CMTime *)&v16) > 0)
        {
          id v6 = v12;
          goto LABEL_15;
        }
        id v6 = (id)v13;

        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      uint64_t v14 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v14;
    }
    while (v14);
  }
LABEL_15:

  return v6;
}

@end