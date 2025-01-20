@interface PTCinematographyExistingTrack
- (BOOL)isDiscrete;
- (PTCinematographyExistingTrack)initWithDetectionType:(unint64_t)a3 trackIdentifier:(int64_t)a4 groupIdentifier:(int64_t)a5;
- (id)_initWithExistingTrack:(id)a3;
- (id)detectionAtOrBeforeTime:(id *)a3;
- (id)detectionInFrame:(id)a3;
- (id)detectionNearestTime:(id *)a3;
- (id)detectionsInTimeRange:(id *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)trackType;
@end

@implementation PTCinematographyExistingTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 _initWithExistingTrack:self];
}

- (id)_initWithExistingTrack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 detectionType];
  uint64_t v6 = [v4 trackIdentifier];
  uint64_t v7 = [v4 groupIdentifier];

  return [(PTCinematographyExistingTrack *)self initWithDetectionType:v5 trackIdentifier:v6 groupIdentifier:v7];
}

- (BOOL)isDiscrete
{
  return 1;
}

- (unint64_t)trackType
{
  return 1;
}

- (PTCinematographyExistingTrack)initWithDetectionType:(unint64_t)a3 trackIdentifier:(int64_t)a4 groupIdentifier:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyExistingTrack;
  uint64_t v7 = [(PTCinematographyTrack *)&v10 initWithDetectionType:a3];
  v8 = v7;
  if (v7)
  {
    [(PTCinematographyTrack *)v7 setTrackIdentifier:a4];
    [(PTCinematographyTrack *)v8 setGroupIdentifier:a5];
    [(PTCinematographyTrack *)v8 setUserCreated:0];
  }
  return v8;
}

- (id)detectionInFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "detectionForTrackIdentifier:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));

  return v5;
}

- (id)detectionNearestTime:(id *)a3
{
  time1.CMTimeRange start = (CMTime)*a3;
  uint64_t v5 = [(PTCinematographyExistingTrack *)self detectionAtOrBeforeTime:&time1];
  uint64_t v6 = v5;
  if (v5) {
    [v5 time];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
  time1.start.epoch = a3->var3;
  if (CMTimeCompare(&time1.start, &time2))
  {
    memset(&v19, 0, sizeof(v19));
    if (v6) {
      [v6 time];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.epoch = a3->var3;
    CMTimeSubtract(&v19, &time1.start, &rhs);
    memset(&time1, 0, sizeof(time1));
    *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0;
    start.start.epoch = a3->var3;
    CMTime duration = v19;
    CMTimeRangeMake(&time1, &start.start, &duration);
    CMTimeRange start = time1;
    uint64_t v7 = [(PTCinematographyExistingTrack *)self detectionsInTimeRange:&start];
    if ([v7 count])
    {
      v8 = [v7 objectAtIndexedSubscript:0];
      v9 = v8;
      if (v8) {
        [v8 time];
      }
      else {
        memset(&v13, 0, sizeof(v13));
      }
      *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0;
      start.start.epoch = a3->var3;
      CMTimeSubtract(&v14, &v13, &start.start);
      start.CMTimeRange start = v19;
      int32_t v10 = CMTimeCompare(&v14, &start.start);

      if (v10 < 0)
      {
        uint64_t v11 = [v7 objectAtIndexedSubscript:0];

        uint64_t v6 = (void *)v11;
      }
    }
  }

  return v6;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  uint64_t v5 = [(PTCinematographyTrack *)self script];
  int64_t v6 = [(PTCinematographyTrack *)self trackIdentifier];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  uint64_t v7 = [v5 _detectionWithTrackIdentifier:v6 atOrBeforeTime:&v9];

  return v7;
}

- (id)detectionsInTimeRange:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PTCinematographyTrack *)self script];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v21[0] = *(_OWORD *)&a3->var0.var0;
  v21[1] = v6;
  v21[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 framesInTimeRange:v21];

  v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        CMTime v14 = -[PTCinematographyExistingTrack detectionInFrame:](self, "detectionInFrame:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];

  return v15;
}

@end