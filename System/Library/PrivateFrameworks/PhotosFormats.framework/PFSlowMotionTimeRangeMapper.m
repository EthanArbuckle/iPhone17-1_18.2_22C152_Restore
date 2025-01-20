@interface PFSlowMotionTimeRangeMapper
- ($9E16F6706E08E1DCF37CEDFAE5F41851)scaledTimeRangeForOriginalTimeRange:(SEL)a3;
- (PFSlowMotionTimeRangeMapper)init;
- (float)_mapTime:(float)a3 fromLengths:(id)a4 toLengths:(id)a5;
- (float)originalTimeForScaledTime:(float)a3;
- (float)scaledTimeForOriginalTime:(float)a3;
- (void)addNextRange:(float)a3 scaledLength:(float)a4;
- (void)enumerateScaledRegionsUsingBlock:(id)a3;
- (void)markScaledRegionWithRate:(float)a3 rampInStartTime:(float)a4 rampInEndTime:(float)a5 rampOutStartTime:(float)a6 rampOutEndTime:(float)a7;
@end

@implementation PFSlowMotionTimeRangeMapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaledRegions, 0);
  objc_storeStrong((id *)&self->_scaledLengths, 0);

  objc_storeStrong((id *)&self->_originalLengths, 0);
}

- (void)enumerateScaledRegionsUsingBlock:(id)a3
{
  id v4 = a3;
  scaledRegions = self->_scaledRegions;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PFSlowMotionTimeRangeMapper_enumerateScaledRegionsUsingBlock___block_invoke;
  v7[3] = &unk_1E5B2E2F0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)scaledRegions enumerateObjectsUsingBlock:v7];
}

uint64_t __64__PFSlowMotionTimeRangeMapper_enumerateScaledRegionsUsingBlock___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    id v3 = a2;
    [v3 rate];
    unsigned __int32 v5 = v4;
    [v3 rampInStartTime];
    unsigned __int32 v7 = v6;
    [v3 rampInEndTime];
    unsigned __int32 v9 = v8;
    [v3 rampOutStartTime];
    unsigned __int32 v11 = v10;
    [v3 rampOutEndTime];
    unsigned __int32 v13 = v12;

    v14 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128, __n128))(v2 + 16);
    v15.n128_u32[0] = v5;
    v16.n128_u32[0] = v7;
    v17.n128_u32[0] = v9;
    v18.n128_u32[0] = v11;
    v19.n128_u32[0] = v13;
    return v14(v2, v15, v16, v17, v18, v19);
  }
  return result;
}

- (void)markScaledRegionWithRate:(float)a3 rampInStartTime:(float)a4 rampInEndTime:(float)a5 rampOutStartTime:(float)a6 rampOutEndTime:(float)a7
{
  __n128 v18 = objc_alloc_init(PFSlowMotionTimeRangeMapperScaledRegion);
  *(float *)&double v13 = a3;
  [(PFSlowMotionTimeRangeMapperScaledRegion *)v18 setRate:v13];
  *(float *)&double v14 = a4;
  [(PFSlowMotionTimeRangeMapperScaledRegion *)v18 setRampInStartTime:v14];
  *(float *)&double v15 = a5;
  [(PFSlowMotionTimeRangeMapperScaledRegion *)v18 setRampInEndTime:v15];
  *(float *)&double v16 = a6;
  [(PFSlowMotionTimeRangeMapperScaledRegion *)v18 setRampOutStartTime:v16];
  *(float *)&double v17 = a7;
  [(PFSlowMotionTimeRangeMapperScaledRegion *)v18 setRampOutEndTime:v17];
  [(NSMutableArray *)self->_scaledRegions addObject:v18];
}

- (float)_mapTime:(float)a3 fromLengths:(id)a4 toLengths:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    float v12 = 0.0;
    do
    {
      double v13 = [v7 objectAtIndexedSubscript:v11];
      [v13 floatValue];
      float v15 = v14;

      double v16 = [v8 objectAtIndexedSubscript:v11];
      [v16 floatValue];
      float v18 = v17;

      float v19 = (float)(a3 * v18) / v15;
      if (a3 <= v15)
      {
        a3 = 0.0;
      }
      else
      {
        float v19 = v18;
        a3 = a3 - v15;
      }
      float v12 = v12 + v19;
      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    float v12 = 0.0;
  }

  return v12 + a3;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)scaledTimeRangeForOriginalTimeRange:(SEL)a3
{
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  time.start.epoch = a4->var0.var3;
  double Seconds = CMTimeGetSeconds(&time.start);
  long long v8 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&time.start.epoch = v8;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CMTimeRangeGetEnd(&v20, &time);
  Float64 v9 = CMTimeGetSeconds(&v20);
  double v10 = v9;
  *(float *)&Float64 v9 = Seconds;
  [(PFSlowMotionTimeRangeMapper *)self scaledTimeForOriginalTime:v9];
  Float64 v12 = v11;
  *(float *)&double v13 = v10;
  [(PFSlowMotionTimeRangeMapper *)self scaledTimeForOriginalTime:v13];
  Float64 v15 = v14;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  CMTimeMakeWithSeconds(&start, v12, 600);
  CMTimeMakeWithSeconds(&v17, v15, 600);
  return ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v17);
}

- (float)originalTimeForScaledTime:(float)a3
{
  -[PFSlowMotionTimeRangeMapper _mapTime:fromLengths:toLengths:](self, "_mapTime:fromLengths:toLengths:", self->_scaledLengths, self->_originalLengths);
  return result;
}

- (float)scaledTimeForOriginalTime:(float)a3
{
  -[PFSlowMotionTimeRangeMapper _mapTime:fromLengths:toLengths:](self, "_mapTime:fromLengths:toLengths:", self->_originalLengths, self->_scaledLengths);
  return result;
}

- (void)addNextRange:(float)a3 scaledLength:(float)a4
{
  originalLengths = self->_originalLengths;
  id v7 = objc_msgSend(NSNumber, "numberWithFloat:");
  [(NSMutableArray *)originalLengths addObject:v7];

  scaledLengths = self->_scaledLengths;
  *(float *)&double v9 = a4;
  id v10 = [NSNumber numberWithFloat:v9];
  [(NSMutableArray *)scaledLengths addObject:v10];
}

- (PFSlowMotionTimeRangeMapper)init
{
  v10.receiver = self;
  v10.super_class = (Class)PFSlowMotionTimeRangeMapper;
  uint64_t v2 = [(PFSlowMotionTimeRangeMapper *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    originalLengths = v2->_originalLengths;
    v2->_originalLengths = v3;

    unsigned __int32 v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scaledLengths = v2->_scaledLengths;
    v2->_scaledLengths = v5;

    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scaledRegions = v2->_scaledRegions;
    v2->_scaledRegions = v7;
  }
  return v2;
}

@end