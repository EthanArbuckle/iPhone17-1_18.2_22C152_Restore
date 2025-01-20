@interface RCWaveformSegment
+ (BOOL)supportsSecureCoding;
+ (id)_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:(id)a3;
+ (id)_mergedSegmentByFastMergingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4;
+ (id)_mergedSegmentByResamplingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4;
+ (id)_segmentByMergingMergableSegments:(id)a3;
+ (id)_segmentsByJoiningSegment:(id)a3 toSegmentIfNecessaryWithGreaterSegment:(id)a4 averagePowerLevelJoinLimit:(unint64_t)a5;
+ (id)emptySegmentWithTimeRange:(id)a3;
+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4;
+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4 beforeTime:(double)a5 andThenUsePreferredSegmentDuration:(double)a6;
+ (id)segmentsByReparingDiscontinuitiesInSegments:(id)a3;
+ (id)segmentsByShiftingSegments:(id)a3 byTimeOffset:(double)a4;
+ (void)initialize;
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange;
- (BOOL)hasUniformPowerLevel:(float)a3;
- (BOOL)isRendered;
- (BOOL)isWaveformDataAlmostEqualToDataInSegment:(id)a3;
- (BOOL)isWaveformDataEqualToDataInSegment:(id)a3;
- (RCWaveformSegment)initWithCoder:(id)a3;
- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4;
- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelVector:(void *)a4;
- (const)averagePowerLevels;
- (id)_initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4;
- (id)_segmentWithValuesInContainedTimeRange:(id)a3;
- (id)_segmentsByJoiningIfNecessaryGreaterSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4;
- (id)copyEmptiedWithTimeRangeOffsetByTimeOffset:(double)a3;
- (id)copyWithAdjustedTimeRange:(id)a3;
- (id)copyWithTimeRangeOffsetByTimeOffset:(double)a3;
- (id)segmentByClippingToTimeRange:(id)a3;
- (id)segmentsByJoiningIfSmallSegment:(id)a3;
- (id)segmentsByJoiningIfSmallSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4;
- (id)simpleDescription;
- (id)verboseDescription;
- (int64_t)averagePowerLevelsCount;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRendered:(BOOL)a3;
@end

@implementation RCWaveformSegment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[RCWaveformSegment setVersion:1];
  }
}

+ (id)emptySegmentWithTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v5 = objc_alloc((Class)a1);
  v6 = [MEMORY[0x1E4F1C9B8] data];
  v7 = objc_msgSend(v5, "_initWithTimeRange:averagePowerLevelData:", v6, var0, var1);

  return v7;
}

- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformSegment.mm"];
    v10 = (void *)v9;
    v11 = @"<Unknown File>";
    if (v9) {
      v11 = (__CFString *)v9;
    }
    v12 = v11;

    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, v12, 33, @"invalid segment data.  if this segment really has no data, use +emptySegmentWithTimeRange:", 0, 0, 0, 0, 0 object file lineNumber description];
  }
  v14 = -[RCWaveformSegment _initWithTimeRange:averagePowerLevelData:](self, "_initWithTimeRange:averagePowerLevelData:", v8, var0, var1);

  return v14;
}

- (id)_initWithTimeRange:(id)a3 averagePowerLevelData:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RCWaveformSegment;
  uint64_t v9 = [(RCWaveformSegment *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_timeRange.beginTime = var0;
    v9->_timeRange.endTime = var1;
    objc_storeStrong((id *)&v9->_averagePowerLevelData, a4);
    v10->_isRendered = 0;
  }

  return v10;
}

- (RCWaveformSegment)initWithTimeRange:(id)a3 averagePowerLevelVector:(void *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (*((void *)a4 + 1) == *(void *)a4)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:*(void *)a4 length:*((void *)a4 + 1) - *(void *)a4];
    memcpy((void *)[v8 mutableBytes], *(const void **)a4, *((void *)a4 + 1) - *(void *)a4);
  }
  uint64_t v9 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:](self, "initWithTimeRange:averagePowerLevelData:", v8, var0, var1);
  v10 = v9;
  if (v9)
  {
    v9->_timeRange.beginTime = var0;
    v9->_timeRange.endTime = var1;
  }

  return v10;
}

- (id)verboseDescription
{
  v3 = [(RCWaveformSegment *)self simpleDescription];
  double v4 = RCTimeRangeDeltaWithExactPrecision(self->_timeRange.beginTime, self->_timeRange.endTime);
  uint64_t v5 = [(RCWaveformSegment *)self averagePowerLevelsCount];
  v6 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = 0;
  double v8 = v4 / (double)v5;
  while (v7 < [(RCWaveformSegment *)self averagePowerLevelsCount])
  {
    uint64_t v9 = [(RCWaveformSegment *)self averagePowerLevels];
    v10 = [NSString stringWithFormat:@"[%.3fs] %.2f", v8 * (double)v7, v9[v7]];
    [v6 addObject:v10];

    ++v7;
  }
  v11 = NSString;
  objc_super v12 = [v6 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"%@ %@", v3, v12];

  return v13;
}

- (id)simpleDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RCWaveformSegment;
  double v4 = [(RCWaveformSegment *)&v8 description];
  uint64_t v5 = NSStringFromRCTimeRange(self->_timeRange.beginTime, self->_timeRange.endTime);
  v6 = [v3 stringWithFormat:@"%@: timeRange=%@, levelCount=%d", v4, v5, -[RCWaveformSegment averagePowerLevelsCount](self, "averagePowerLevelsCount")];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCWaveformSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_timeRange.beginTime = RCTimeRangeDecodeWithKey(v4, @"RCTimeRange");
  self->_timeRange.endTime = v5;
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RCAveragePowerLevelVectorData"];
  averagePowerLevelData = self->_averagePowerLevelData;
  self->_averagePowerLevelData = v6;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  RCTimeRangeEncodeWithKey(v4, @"RCTimeRange", self->_timeRange.beginTime, self->_timeRange.endTime);
  [v4 encodeObject:self->_averagePowerLevelData forKey:@"RCAveragePowerLevelVectorData"];
}

- (const)averagePowerLevels
{
  return (const float *)[(NSData *)self->_averagePowerLevelData bytes];
}

- (int64_t)averagePowerLevelsCount
{
  return [(NSData *)self->_averagePowerLevelData length] >> 2;
}

- (BOOL)hasUniformPowerLevel:(float)a3
{
  if (![(RCWaveformSegment *)self averagePowerLevelsCount]) {
    return 0;
  }
  if (![(RCWaveformSegment *)self averagePowerLevelsCount]) {
    return 1;
  }
  unint64_t v5 = 0;
  do
  {
    float v6 = [(RCWaveformSegment *)self averagePowerLevels][4 * v5];
    BOOL v7 = v6 == a3;
    if (v6 != a3) {
      break;
    }
    ++v5;
  }
  while (v5 < [(RCWaveformSegment *)self averagePowerLevelsCount]);
  return v7;
}

- (BOOL)isWaveformDataEqualToDataInSegment:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  else {
    return [(NSData *)self->_averagePowerLevelData isEqual:*((void *)a3 + 1)];
  }
}

- (BOOL)isWaveformDataAlmostEqualToDataInSegment:(id)a3
{
  id v4 = (RCWaveformSegment *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_10;
  }
  uint64_t v6 = [(RCWaveformSegment *)v4 averagePowerLevelsCount];
  if (v6 != [(RCWaveformSegment *)self averagePowerLevelsCount])
  {
    BOOL v11 = 0;
    goto LABEL_12;
  }
  int64_t v7 = [(RCWaveformSegment *)self averagePowerLevelsCount];
  if (!v7)
  {
LABEL_10:
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    int64_t v9 = v7 - 1;
    do
    {
      BOOL v10 = RCEqualFloatsWithTolerance([(RCWaveformSegment *)self averagePowerLevels][4 * v8], [(RCWaveformSegment *)v5 averagePowerLevels][4 * v8], 0.1);
      BOOL v11 = v10;
    }
    while (v9 != v8++ && v10);
  }
LABEL_12:

  return v11;
}

- (id)copyWithTimeRangeOffsetByTimeOffset:(double)a3
{
  double v4 = self->_timeRange.beginTime + a3;
  double v5 = self->_timeRange.endTime + a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  averagePowerLevelData = self->_averagePowerLevelData;
  return (id)objc_msgSend(v6, "initWithTimeRange:averagePowerLevelData:", averagePowerLevelData, v4, v5);
}

- (id)copyWithAdjustedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v6 = objc_alloc((Class)objc_opt_class());
  averagePowerLevelData = self->_averagePowerLevelData;
  return (id)objc_msgSend(v6, "initWithTimeRange:averagePowerLevelData:", averagePowerLevelData, var0, var1);
}

- (id)copyEmptiedWithTimeRangeOffsetByTimeOffset:(double)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)segmentsByReparingDiscontinuitiesInSegments:(id)a3
{
  v3 = [a1 _discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:a3];
  return v3;
}

+ (id)segmentsByShiftingSegments:(id)a3 byTimeOffset:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          BOOL v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "copyWithTimeRangeOffsetByTimeOffset:", a4, (void)v13);
          [v6 addObject:v11];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = (void *)[v5 mutableCopy];
  }

  return v6;
}

+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4 beforeTime:(double)a5 andThenUsePreferredSegmentDuration:(double)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ((unint64_t)[v10 count] <= 1)
  {
    id v11 = v10;
    goto LABEL_42;
  }
  id v44 = v10;
  v45 = (void *)[v10 mutableCopy];
  if (v45)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F1CA48];
    long long v13 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = [v12 arrayWithObject:v13];

    id v11 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v15 = v45;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v51;
      double v18 = 0.0;
      double v19 = a4;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          [v21 timeRange];
          double v23 = v22;
          double v25 = v24;
          if (v22 >= a5 && v19 == a4)
          {
            v27 = [MEMORY[0x1E4F1CA48] array];
            [v14 addObject:v27];

            double v19 = a6;
          }
          v28 = [v14 lastObject];
          if (![v28 count]) {
            double v18 = v23;
          }
          [v28 addObject:v21];
          if (v25 - v18 >= v19)
          {
            v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v25 - v18);
            [v14 addObject:v29];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v16);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v30 = v14;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          if ([v34 count] == 1)
          {
            v35 = [v34 objectAtIndexedSubscript:0];
            [v11 addObject:v35];
          }
          else
          {
            if ((unint64_t)[v34 count] < 2) {
              continue;
            }
            v35 = [v34 firstObject];
            v36 = [v34 lastObject];
            [v35 timeRange];
            double v38 = v37;
            [v36 timeRange];
            double v40 = v39 - v38;
            if (v38 >= a5) {
              double v41 = a6;
            }
            else {
              double v41 = a4;
            }
            if (v40 >= v41)
            {
              v42 = [a1 _segmentByMergingMergableSegments:v34];
              [v11 addObject:v42];
            }
            else
            {
              [v11 addObjectsFromArray:v34];
            }
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v31);
    }
  }
  else
  {
    id v11 = v10;
  }

  id v10 = v44;
LABEL_42:

  return v11;
}

+ (id)segmentsByMergingSegments:(id)a3 preferredSegmentDuration:(double)a4
{
  double v4 = [a1 segmentsByMergingSegments:a3 preferredSegmentDuration:a4 beforeTime:1.79769313e308 andThenUsePreferredSegmentDuration:1.0];
  return v4;
}

- (id)segmentsByJoiningIfSmallSegment:(id)a3
{
  v3 = [(RCWaveformSegment *)self _segmentsByJoiningIfNecessaryGreaterSegment:a3 averagePowerLevelJoinLimit:8];
  return v3;
}

- (id)segmentsByJoiningIfSmallSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = self;
    id v11 = &v20;
    uint64_t v12 = 1;
LABEL_5:
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, v12, v18, v19, v20, v21);
    goto LABEL_8;
  }
  [(RCWaveformSegment *)self timeRange];
  double v8 = v7;
  [v6 timeRange];
  if (v8 == v9)
  {
    uint64_t v10 = [(RCWaveformSegment *)self _segmentsByJoiningIfNecessaryGreaterSegment:v6 averagePowerLevelJoinLimit:a4];
    goto LABEL_8;
  }
  [v6 timeRange];
  double v14 = v13;
  [(RCWaveformSegment *)self timeRange];
  if (v14 != v15)
  {
    double v18 = self;
    id v19 = v6;
    id v11 = &v18;
    uint64_t v12 = 2;
    goto LABEL_5;
  }
  uint64_t v10 = [v6 _segmentsByJoiningIfNecessaryGreaterSegment:self averagePowerLevelJoinLimit:a4];
LABEL_8:
  uint64_t v16 = (void *)v10;

  return v16;
}

- (id)segmentByClippingToTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(RCWaveformSegment *)self timeRange];
  if (RCTimeRangeEqualToTimeRange(var0, var1, v6, v7)
    || ([(RCWaveformSegment *)self timeRange], RCTimeRangeContainsRange(var0, var1, v8, v9))
    || ([(RCWaveformSegment *)self timeRange], RCTimeRangeContainsRange(var0, var1, v10, v11)))
  {
    uint64_t v12 = self;
  }
  else
  {
    [(RCWaveformSegment *)self timeRange];
    if (v14 > var1)
    {
      [(RCWaveformSegment *)self timeRange];
      if (v15 <= var1) {
        goto LABEL_16;
      }
    }
    [(RCWaveformSegment *)self timeRange];
    if (var0 < v16) {
      double var0 = v16;
    }
    [(RCWaveformSegment *)self timeRange];
    if (var1 < v18) {
      double v18 = var1;
    }
    if (var0 >= v18)
    {
LABEL_16:
      uint64_t v12 = 0;
    }
    else
    {
      v17.n128_f64[0] = var0;
      uint64_t v12 = [(RCWaveformSegment *)self _segmentWithValuesInContainedTimeRange:RCTimeRangeMake(v17, v18)];
    }
  }
  return v12;
}

+ (id)_discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    for (unint64_t i = 1; i < [v3 count]; unint64_t i = v8 + 1)
    {
      unint64_t v6 = i - 1;
      double v7 = [v3 objectAtIndexedSubscript:i - 1];
      unint64_t v8 = v6 + 1;
      double v9 = [v3 objectAtIndexedSubscript:v6 + 1];
      [v9 timeRange];
      double v11 = v10;
      [v7 timeRange];
      if (vabdd_f64(v11, v12) > 0.01)
      {
        [v7 timeRange];
        uint64_t v13 = objc_msgSend(v7, "copyWithAdjustedTimeRange:");

        double v7 = (void *)v13;
      }
      [v4 addObject:v7];
    }
    double v14 = [v3 lastObject];
    [v4 addObject:v14];
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)_segmentWithValuesInContainedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  int64_t v7 = [(RCWaveformSegment *)self averagePowerLevelsCount];
  if (v7)
  {
    int64_t v8 = v7;
    [(RCWaveformSegment *)self timeRange];
    if (!RCTimeRangeContainsRange(v9, v10, var0, var1))
    {
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformSegment.mm"];
      double v12 = (void *)v11;
      uint64_t v13 = @"<Unknown File>";
      if (v11) {
        uint64_t v13 = (__CFString *)v11;
      }
      double v14 = v13;

      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 355, @"Invalid argment", 0, 0, 0, 0, 0);
    }
    double v16 = RCTimeRangeDeltaWithExactPrecision(self->_timeRange.beginTime, self->_timeRange.endTime);
    float v17 = v16 / (float)[(RCWaveformSegment *)self averagePowerLevelsCount];
    [(RCWaveformSegment *)self timeRange];
    double v19 = (var0 - v18) / v17;
    if (v8 - 1 >= (unint64_t)v19) {
      unint64_t v20 = (unint64_t)v19;
    }
    else {
      unint64_t v20 = v8 - 1;
    }
    [(RCWaveformSegment *)self timeRange];
    double v22 = v21 + (float)(v17 * (float)v20);
    unint64_t v23 = vcvtpd_u64_f64(RCTimeRangeDeltaWithExactPrecision(v22, var1) / v17);
    if (v23 <= 1) {
      unint64_t v23 = 1;
    }
    if (v8 - v20 >= v23) {
      unint64_t v24 = v23;
    }
    else {
      unint64_t v24 = v8 - v20;
    }
    if (v24)
    {
      double v25 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v24];
      v26 = [(RCWaveformSegment *)self averagePowerLevels];
      id v27 = v25;
      memmove((void *)[v27 mutableBytes], &v26[v20], 4 * v24);
      v28 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v27, v22, v22 + (float)(v17 * (float)v24));
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "emptySegmentWithTimeRange:", var0, var1);
    v28 = (RCWaveformSegment *)objc_claimAutoreleasedReturnValue();
  }
  return v28;
}

- (id)_segmentsByJoiningIfNecessaryGreaterSegment:(id)a3 averagePowerLevelJoinLimit:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int64_t v7 = objc_opt_class();
    v14[0] = self;
    v14[1] = v6;
    int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    double v9 = [v7 _discontinuityRepairedSegmentsByGrowingToFillGapsInSegments:v8];

    double v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = [v9 objectAtIndexedSubscript:1];
    double v12 = +[RCWaveformSegment _segmentsByJoiningSegment:v10 toSegmentIfNecessaryWithGreaterSegment:v11 averagePowerLevelJoinLimit:a4];
  }
  else
  {
    v15[0] = self;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }

  return v12;
}

+ (id)_segmentsByJoiningSegment:(id)a3 toSegmentIfNecessaryWithGreaterSegment:(id)a4 averagePowerLevelJoinLimit:(unint64_t)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 timeRange];
  double v11 = RCTimeRangeDeltaWithExactPrecision(v9, v10);
  [v8 timeRange];
  double v14 = RCTimeRangeDeltaWithExactPrecision(v12, v13);
  if ([v7 averagePowerLevelsCount] <= 1)
  {
    [v7 timeRange];
    unint64_t v16 = v15;
    [v8 timeRange];
    v17.n128_u64[0] = v16;
    id v19 = (id)objc_msgSend(v8, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v17, v18));
    v62[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
LABEL_5:
    double v25 = (void *)v20;
LABEL_6:

    goto LABEL_7;
  }
  if ([v8 averagePowerLevelsCount] <= 1)
  {
    [v7 timeRange];
    unint64_t v22 = v21;
    [v8 timeRange];
    v23.n128_u64[0] = v22;
    id v19 = (id)objc_msgSend(v7, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v23, v24));
    id v61 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    goto LABEL_5;
  }
  uint64_t v27 = [v7 averagePowerLevelsCount];
  if ([v8 averagePowerLevelsCount] + v27 < a5)
  {
    float v28 = v11;
    float v29 = v14;
    if ((float)(v28 + v29) > 0.0)
    {
      [v7 timeRange];
      unint64_t v31 = v30;
      [v8 timeRange];
      v32.n128_u64[0] = v31;
      double v34 = RCTimeRangeMake(v32, v33);
      double v36 = v35;
      [v7 timeRange];
      double v39 = RCTimeRangeDeltaWithExactPrecision(v37, v38);
      uint64_t v40 = [v7 averagePowerLevelsCount];
      [v8 timeRange];
      double v43 = RCTimeRangeDeltaWithExactPrecision(v41, v42);
      uint64_t v44 = [v8 averagePowerLevelsCount];
      float v45 = v39;
      float v46 = v45 / (float)v40;
      float v47 = v43;
      float v48 = v47 / (float)v44;
      if (v46 > 0.0)
      {
        if (v48 <= 0.0)
        {
          float v48 = v45 / (float)v40;
        }
        else if (v46 < v48)
        {
          float v48 = v45 / (float)v40;
        }
      }
      uint64_t v49 = (uint64_t)(RCTimeRangeDeltaWithExactPrecision(v34, v36) / v48);
      id v19 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v49];
      uint64_t v50 = [v19 mutableBytes];
      if (v49)
      {
        uint64_t v51 = v50;
        for (unint64_t i = 0; i != v49; ++i)
        {
          [v7 timeRange];
          float v53 = v48 * (float)i;
          if (v54 <= v53)
          {
            uint64_t v55 = [v8 averagePowerLevels];
            uint64_t v56 = (uint64_t)(v53 - v45);
            float v57 = v47;
          }
          else
          {
            uint64_t v55 = [v7 averagePowerLevels];
            uint64_t v56 = (uint64_t)v53;
            float v57 = v45;
          }
          *(_DWORD *)(v51 + 4 * i) = *(_DWORD *)(v55 + 4 * (uint64_t)(float)((float)v56 / v57));
        }
      }
      v58 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v19, v34, v36);
      v60 = v58;
      double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];

      goto LABEL_6;
    }
  }
  v59[0] = v7;
  v59[1] = v8;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
LABEL_7:

  return v25;
}

+ (id)_segmentByMergingMergableSegments:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v6 = [0 objectAtIndexedSubscript:0];
    goto LABEL_20;
  }
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformSegment.mm"];
  id v8 = (void *)v7;
  double v9 = @"<Unknown File>";
  if (v7) {
    double v9 = (__CFString *)v7;
  }
  double v10 = v9;

  double v11 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v10, 441, @"Invalid paremeter", 0, 0, 0, 0, 0);

  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  if ([v5 count] == 1)
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
LABEL_20:
    unint64_t v22 = (void *)v6;
    goto LABEL_21;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        __n128 v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v17 timeRange];
        double v20 = RCTimeRangeDeltaWithExactPrecision(v18, v19);
        double v15 = v15 + v20 / (double)[v17 averagePowerLevelsCount];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  double v21 = v15 / (double)(unint64_t)[v12 count];
  unint64_t v22 = [a1 _mergedSegmentByFastMergingWithMergeableSegments:v12 mergedLevelsDuration:v21];
  if (!v22)
  {
    uint64_t v6 = [a1 _mergedSegmentByResamplingWithMergeableSegments:v12 mergedLevelsDuration:v21];
    goto LABEL_20;
  }
LABEL_21:

  return v22;
}

+ (id)_mergedSegmentByFastMergingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4
{
  return 0;
}

+ (id)_mergedSegmentByResamplingWithMergeableSegments:(id)a3 mergedLevelsDuration:(double)a4
{
  id v5 = a3;
  uint64_t v44 = [v5 firstObject];
  double v42 = [v5 lastObject];
  [v44 timeRange];
  unint64_t v7 = v6;
  [v42 timeRange];
  v8.n128_u64[0] = v7;
  double v10 = RCTimeRangeMake(v8, v9);
  double v12 = v11;
  unint64_t v13 = (unint64_t)(RCTimeRangeDeltaWithExactPrecision(v10, v11) / a4);
  id v14 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v13];
  uint64_t v43 = [v14 mutableBytes];
  if (v13)
  {
    unint64_t v15 = 0;
    for (unint64_t i = 0; i != v13; ++i)
    {
      [v44 timeRange];
      double v18 = v17 + (double)i * a4;
      unint64_t v19 = v15;
      do
      {
        unint64_t v15 = v19;
        if (v19 >= [v5 count]) {
          break;
        }
        double v20 = [v5 objectAtIndexedSubscript:v19];
        [v20 timeRange];
        BOOL v23 = RCTimeRangeContainsTime(v21, v22, v18);
        ++v19;
      }
      while (!v23);
      if ([v5 count] == v15) {
        break;
      }
      long long v24 = [v5 objectAtIndexedSubscript:v15];
      [v24 timeRange];
      double v27 = RCTimeRangeDeltaWithExactPrecision(v25, v26);
      uint64_t v28 = [v24 averagePowerLevelsCount];
      [v24 timeRange];
      double v30 = v29;
      uint64_t v31 = [v24 averagePowerLevelsCount];
      double v32 = (v18 - v30) / (v27 / (double)v28);
      if (v31 - 1 >= (uint64_t)v32) {
        uint64_t v33 = (uint64_t)v32;
      }
      else {
        uint64_t v33 = v31 - 1;
      }
      double v34 = [v5 objectAtIndexedSubscript:v15];
      id v35 = v14;
      uint64_t v36 = v33 + 1;
      if (v33 + 1 >= (unint64_t)([v24 averagePowerLevelsCount] - 1))
      {
        if (v15 + 1 >= [v5 count])
        {
          uint64_t v36 = v33;
        }
        else
        {
          uint64_t v37 = objc_msgSend(v5, "objectAtIndexedSubscript:");

          uint64_t v36 = 0;
          double v34 = (void *)v37;
        }
      }
      float v38 = *(float *)([v24 averagePowerLevels] + 4 * v33);
      float v39 = *(float *)([v34 averagePowerLevels] + 4 * v36);
      if (v38 >= v39) {
        float v39 = v38;
      }
      *(float *)(v43 + 4 * i) = v39;

      id v14 = v35;
    }
  }
  uint64_t v40 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v14, v10, v12);

  return v40;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRange
{
  double beginTime = self->_timeRange.beginTime;
  double endTime = self->_timeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (BOOL)isRendered
{
  return self->_isRendered;
}

- (void)setIsRendered:(BOOL)a3
{
  self->_isRendered = a3;
}

- (void).cxx_destruct
{
}

@end