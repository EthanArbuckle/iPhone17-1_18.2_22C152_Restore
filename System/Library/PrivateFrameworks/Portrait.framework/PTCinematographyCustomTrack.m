@interface PTCinematographyCustomTrack
- (BOOL)isDiscrete;
- (BOOL)isUserCreated;
- (NSArray)allDetections;
- (NSArray)detections;
- (PTCinematographyCustomTrack)initWithDetections:(id)a3;
- (id)_asCinematographyDictionary;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithCustomTrack:(id)a3;
- (id)_trackByTrimmingToTimeRange:(id *)a3 subtracting:(id *)a4;
- (id)detectionAtOrBeforeTime:(id *)a3;
- (id)detectionInFrame:(id)a3;
- (id)detectionNearestTime:(id *)a3;
- (id)detectionsInTimeRange:(id *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)trackType;
- (void)applyDetectionSmoothing;
- (void)setDetections:(id)a3;
@end

@implementation PTCinematographyCustomTrack

- (BOOL)isUserCreated
{
  return 1;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 _initWithCustomTrack:self];
}

- (id)_initWithCustomTrack:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v4, "detections", 0);
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
        v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v10) copy];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [(PTCinematographyCustomTrack *)self initWithDetections:v5];
  return v12;
}

- (PTCinematographyCustomTrack)initWithDetections:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyCustomTrack;
  v5 = [(PTCinematographyTrack *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    detections = v5->_detections;
    v5->_detections = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)allDetections
{
  return self->_detections;
}

- (void)applyDetectionSmoothing
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PTCinematographyFocusSmoother);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(PTCinematographyCustomTrack *)self allDetections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v8) focusDistance];
        -[PTCinematographyFocusSmoother addSample:](v3, "addSample:");
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  [(PTCinematographyFocusSmoother *)v3 endSamples];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v9 = [(PTCinematographyCustomTrack *)self allDetections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        [(PTCinematographyFocusSmoother *)v3 nextSmoothedSample];
        objc_msgSend(v14, "setFocusDistance:");
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  uint64_t v5 = [(PTCinematographyCustomTrack *)self detections];
  CMTime time1 = *(CMTime *)a3;
  uint64_t v6 = [v5 _firstIndexAtOrAfterTime:&time1];

  uint64_t v7 = [(PTCinematographyCustomTrack *)self detections];
  if (v6 == [v7 count])
  {
  }
  else
  {
    uint64_t v8 = [(PTCinematographyCustomTrack *)self detections];
    objc_super v9 = [v8 objectAtIndexedSubscript:v6];
    uint64_t v10 = v9;
    if (v9) {
      [v9 time];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = (CMTime)*a3;
    int32_t v11 = CMTimeCompare(&time1, &time2);

    if ((v11 & 0x80000000) == 0) {
      goto LABEL_9;
    }
  }
  if (v6)
  {
    --v6;
LABEL_9:
    uint64_t v12 = [(PTCinematographyCustomTrack *)self detections];
    uint64_t v13 = [v12 objectAtIndexedSubscript:v6];

    goto LABEL_11;
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)detectionNearestTime:(id *)a3
{
  uint64_t v5 = [(PTCinematographyCustomTrack *)self detections];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  unint64_t v6 = [v5 _indexNearestTime:&v12];

  uint64_t v7 = [(PTCinematographyCustomTrack *)self detections];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
    objc_super v9 = [(PTCinematographyCustomTrack *)self detections];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v6];
  }

  return v10;
}

- (id)detectionsInTimeRange:(id *)a3
{
  uint64_t v5 = [(PTCinematographyCustomTrack *)self detections];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:v13];
  uint64_t v9 = v8;

  if (v9)
  {
    uint64_t v10 = [(PTCinematographyCustomTrack *)self detections];
    int32_t v11 = objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  }
  else
  {
    int32_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)detectionInFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 time];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  long long v6 = [(PTCinematographyCustomTrack *)self detectionNearestTime:v11];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 time];
    if (v5) {
      [v5 time];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    if (CMTimeCompare(&time1, &time2))
    {

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)_trackByTrimmingToTimeRange:(id *)a3 subtracting:(id *)a4
{
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)CMTime time1 = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time1[16] = v6;
  long long v19 = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [(PTCinematographyCustomTrack *)self detectionsInTimeRange:time1];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if ((a4->var2 & 0x1D) == 1)
  {
    *(_OWORD *)CMTime time1 = *(_OWORD *)&a4->var0;
    *(void *)&time1[16] = a4->var3;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare((CMTime *)time1, &time2))
    {
      if ([v8 count])
      {
        unint64_t v9 = 0;
        do
        {
          memset(time1, 0, 24);
          uint64_t v10 = [v8 objectAtIndexedSubscript:v9];
          int32_t v11 = v10;
          if (v10) {
            [v10 time];
          }
          else {
            memset(&lhs, 0, sizeof(lhs));
          }
          CMTime time2 = (CMTime)*a4;
          CMTimeSubtract((CMTime *)time1, &lhs, &time2);

          $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = [v8 objectAtIndexedSubscript:v9];
          CMTime time2 = *(CMTime *)time1;
          uint64_t v13 = [v12 _detectionByChangingTime:&time2];
          [v8 setObject:v13 atIndexedSubscript:v9];

          ++v9;
        }
        while (v9 < [v8 count]);
      }
    }
  }
  long long v14 = [[PTCinematographyCustomTrack alloc] initWithDetections:v8];
  [(PTCinematographyTrack *)v14 setTrackIdentifier:[(PTCinematographyTrack *)self trackIdentifier]];
  [(PTCinematographyTrack *)v14 setGroupIdentifier:[(PTCinematographyTrack *)self groupIdentifier]];

  return v14;
}

- (unint64_t)trackType
{
  return 2;
}

- (id)_asCinematographyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyCustomTrack;
  v3 = [(PTCinematographyTrack *)&v8 _asMutableCinematographyDictionary];
  id v4 = [(PTCinematographyCustomTrack *)self allDetections];
  uint64_t v5 = +[PTCinematographyDetection _cinematographyArrayFromDetections:v4];
  [v3 setObject:v5 forKeyedSubscript:@"detections"];

  long long v6 = (void *)[v3 copy];

  return v6;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyCustomTrack;
  uint64_t v5 = [(PTCinematographyTrack *)&v10 _initWithCinematographyDictionary:v4];
  if (v5)
  {
    long long v6 = [v4 objectForKeyedSubscript:@"detections"];
    uint64_t v7 = +[PTCinematographyDetection _detectionsFromCinematographyArray:v6];
    objc_super v8 = (void *)v5[8];
    v5[8] = v7;
  }
  return v5;
}

- (NSArray)detections
{
  return self->_detections;
}

- (void)setDetections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end