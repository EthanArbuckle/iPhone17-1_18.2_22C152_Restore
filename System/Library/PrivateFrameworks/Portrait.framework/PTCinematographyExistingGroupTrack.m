@interface PTCinematographyExistingGroupTrack
- (NSArray)trackDecisions;
- (PTCinematographyExistingGroupTrack)initWithDetectionType:(unint64_t)a3 groupIdentifier:(int64_t)a4;
- (id)_calculateTrackDecisions;
- (id)_initWithExistingGroupTrack:(id)a3;
- (id)detectionAtOrBeforeTime:(id *)a3;
- (id)detectionInFrame:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)trackDecisionsInTimeRange:(id *)a3;
@end

@implementation PTCinematographyExistingGroupTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 _initWithExistingGroupTrack:self];
}

- (id)_initWithExistingGroupTrack:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 detectionType];
  uint64_t v6 = [v4 groupIdentifier];

  return [(PTCinematographyExistingGroupTrack *)self initWithDetectionType:v5 groupIdentifier:v6];
}

- (PTCinematographyExistingGroupTrack)initWithDetectionType:(unint64_t)a3 groupIdentifier:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyExistingGroupTrack;
  return [(PTCinematographyExistingTrack *)&v5 initWithDetectionType:a3 trackIdentifier:-1 groupIdentifier:a4];
}

- (id)detectionInFrame:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(v4, "bestDetectionForGroupIdentifier:", -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier"));

  return v5;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  objc_super v5 = [(PTCinematographyTrack *)self script];
  int64_t v6 = [(PTCinematographyTrack *)self groupIdentifier];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  v7 = [v5 _detectionWithGroupIdentifier:v6 atOrBeforeTime:&v9];

  return v7;
}

- (id)trackDecisionsInTimeRange:(id *)a3
{
  objc_super v5 = [(PTCinematographyExistingGroupTrack *)self trackDecisions];

  if (!v5)
  {
    int64_t v6 = [(PTCinematographyExistingGroupTrack *)self _calculateTrackDecisions];
    trackDecisions = self->_trackDecisions;
    self->_trackDecisions = v6;
  }
  v8 = [(PTCinematographyExistingGroupTrack *)self trackDecisions];
  long long v9 = *(_OWORD *)&a3->var0.var3;
  v16[0] = *(_OWORD *)&a3->var0.var0;
  v16[1] = v9;
  v16[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v10 = [v8 _indexRangeOfTimeRange:v16];
  uint64_t v12 = v11;

  v13 = [(PTCinematographyExistingGroupTrack *)self trackDecisions];
  v14 = objc_msgSend(v13, "subarrayWithRange:", v10, v12);

  return v14;
}

- (id)_calculateTrackDecisions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(PTCinematographyTrack *)self script];
  objc_super v5 = [(PTCinematographyTrack *)self script];
  int64_t v6 = v5;
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  v7 = [v4 framesInTimeRange:v26];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v14 = v11;
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [(PTCinematographyExistingGroupTrack *)self detectionInFrame:v15];
        if (v11)
        {
          if (!v14 || (uint64_t v16 = [v14 trackIdentifier], v16 != objc_msgSend(v11, "trackIdentifier")))
          {
            v17 = [PTCinematographyDecision alloc];
            if (v15) {
              [v15 time];
            }
            else {
              memset(v21, 0, sizeof(v21));
            }
            v18 = -[PTCinematographyDecision initWithTime:trackIdentifier:options:](v17, "initWithTime:trackIdentifier:options:", v21, [v11 trackIdentifier], 0);
            [(PTCinematographyDecision *)v18 setGroupIdentifier:[(PTCinematographyTrack *)self groupIdentifier]];
            [v3 addObject:v18];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }
  v19 = (void *)[v3 copy];

  return v19;
}

- (NSArray)trackDecisions
{
  return self->_trackDecisions;
}

- (void).cxx_destruct
{
}

@end