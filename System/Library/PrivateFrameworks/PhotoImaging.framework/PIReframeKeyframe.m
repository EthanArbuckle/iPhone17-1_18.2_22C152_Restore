@interface PIReframeKeyframe
+ (id)keyframesFromDictionaryRepresentations:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (NSDictionary)dictionaryRepresentation;
- (PIReframeKeyframe)initWithDictionaryRepresentation:(id)a3;
- (__n128)homography;
- (__n128)initWithTime:(__n128)a3 homography:(__n128)a4;
- (id)description;
@end

@implementation PIReframeKeyframe

- (__n128)homography
{
  return a1[2];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (NSDictionary)dictionaryRepresentation
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = @"timeValue";
  v3 = NSNumber;
  [(PIReframeKeyframe *)self time];
  v4 = [v3 numberWithLongLong:v31];
  v33[1] = @"timeScale";
  v34[0] = v4;
  v5 = NSNumber;
  [(PIReframeKeyframe *)self time];
  v6 = [v5 numberWithInt:v30];
  v34[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  uint32x4_t v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._time.timescale, *(float32x4_t *)(MEMORY[0x1E4F14998] + 16)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[1].super.isa, *MEMORY[0x1E4F14998])), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[2].super.isa, *(float32x4_t *)(MEMORY[0x1E4F14998] + 32)));
  v8.i32[3] = v8.i32[2];
  if ((vminvq_u32(v8) & 0x80000000) == 0)
  {
    v29 = objc_msgSend(NSNumber, "numberWithFloat:");
    v32[0] = v29;
    LODWORD(v9) = self[1]._time.timescale;
    v28 = [NSNumber numberWithFloat:v9];
    v32[1] = v28;
    LODWORD(v10) = self[2].super.isa;
    v11 = [NSNumber numberWithFloat:v10];
    v32[2] = v11;
    LODWORD(v12) = HIDWORD(self[1].super.isa);
    v13 = [NSNumber numberWithFloat:v12];
    v32[3] = v13;
    LODWORD(v14) = self[1]._time.flags;
    v15 = [NSNumber numberWithFloat:v14];
    v32[4] = v15;
    LODWORD(v16) = HIDWORD(self[2].super.isa);
    v17 = [NSNumber numberWithFloat:v16];
    v32[5] = v17;
    LODWORD(v18) = self[1]._time.value;
    v19 = [NSNumber numberWithFloat:v18];
    v32[6] = v19;
    LODWORD(v20) = self[1]._time.epoch;
    v21 = [NSNumber numberWithFloat:v20];
    v32[7] = v21;
    LODWORD(v22) = self[2]._time.value;
    v23 = [NSNumber numberWithFloat:v22];
    v32[8] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:9];

    v25 = (void *)[v7 mutableCopy];
    [v25 setObject:v24 forKeyedSubscript:@"homography"];
    uint64_t v26 = [v25 copy];

    v7 = (void *)v26;
  }
  return (NSDictionary *)v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PIReframeKeyframe *)self time];
  v5 = NUStringFromTime();
  v6 = [v3 stringWithFormat:@"<%@:%p time:%@>", v4, self, v5];

  return v6;
}

- (PIReframeKeyframe)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"timeValue"];
  v6 = [v4 objectForKeyedSubscript:@"timeScale"];
  v7 = [v4 objectForKeyedSubscript:@"homography"];

  uint32x4_t v8 = 0;
  if (v5 && v6)
  {
    if ([v7 count] == 9
      && (memset(&v32, 0, sizeof(v32)),
          CMTimeMake(&v32, [v5 longLongValue], objc_msgSend(v6, "intValue")),
          (v32.flags & 1) != 0))
    {
      unsigned int v30 = [v7 objectAtIndexedSubscript:0];
      [v30 floatValue];
      unsigned int v27 = v9;
      v29 = [v7 objectAtIndexedSubscript:1];
      [v29 floatValue];
      unsigned int v26 = v10;
      v28 = [v7 objectAtIndexedSubscript:2];
      [v28 floatValue];
      unsigned int v25 = v11;
      double v12 = [v7 objectAtIndexedSubscript:3];
      [v12 floatValue];
      unsigned int v24 = v13;
      double v14 = [v7 objectAtIndexedSubscript:4];
      [v14 floatValue];
      unsigned int v23 = v15;
      double v16 = [v7 objectAtIndexedSubscript:5];
      [v16 floatValue];
      unsigned int v22 = v17;
      double v18 = [v7 objectAtIndexedSubscript:6];
      [v18 floatValue];
      v19 = [v7 objectAtIndexedSubscript:7];
      [v19 floatValue];
      double v20 = [v7 objectAtIndexedSubscript:8];
      [v20 floatValue];

      CMTime v31 = v32;
      self = -[PIReframeKeyframe initWithTime:homography:](self, "initWithTime:homography:", &v31, COERCE_DOUBLE(__PAIR64__(v24, v27)), COERCE_DOUBLE(__PAIR64__(v23, v26)), COERCE_DOUBLE(__PAIR64__(v22, v25)));
      uint32x4_t v8 = self;
    }
    else
    {
      uint32x4_t v8 = 0;
    }
  }

  return v8;
}

- (__n128)initWithTime:(__n128)a3 homography:(__n128)a4
{
  v13.receiver = a1;
  v13.super_class = (Class)PIReframeKeyframe;
  v7 = [(PIReframeKeyframe *)&v13 init];
  uint64_t v8 = *(void *)(a6 + 16);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)a6;
  *((void *)v7 + 3) = v8;
  *((__n128 *)v7 + 2) = a2;
  *((__n128 *)v7 + 3) = a3;
  __n128 result = a4;
  *((__n128 *)v7 + 4) = a4;
  return result;
}

+ (id)keyframesFromDictionaryRepresentations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v11 = [PIReframeKeyframe alloc];
        double v12 = -[PIReframeKeyframe initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", v10, (void)v15);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_super v13 = (void *)[v4 copy];
  return v13;
}

@end