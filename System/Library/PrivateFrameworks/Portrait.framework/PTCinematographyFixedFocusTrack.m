@interface PTCinematographyFixedFocusTrack
- (BOOL)isDiscrete;
- (PTCinematographyDetection)detection;
- (PTCinematographyFixedFocusTrack)initWithDetection:(id)a3;
- (PTCinematographyFixedFocusTrack)initWithFocusDistance:(float)a3;
- (float)focusDistance;
- (id)_asCinematographyDictionary;
- (id)_calculateTimeRanges;
- (id)_fixedFocusDetectionAtTime:(id *)a3;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithFixedFocusTrack:(id)a3;
- (id)detectionAtOrBeforeTime:(id *)a3;
- (id)detectionInFrame:(id)a3;
- (id)detectionNearestTime:(id *)a3;
- (id)detectionsInTimeRange:(id *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)detectionType;
- (unint64_t)trackType;
@end

@implementation PTCinematographyFixedFocusTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 _initWithFixedFocusTrack:self];
}

- (id)_initWithFixedFocusTrack:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyFixedFocusTrack;
  v5 = -[PTCinematographyTrack initWithDetectionType:](&v10, sel_initWithDetectionType_, [v4 detectionType]);
  if (v5)
  {
    v6 = [v4 detection];
    uint64_t v7 = [v6 copy];
    detection = v5->_detection;
    v5->_detection = (PTCinematographyDetection *)v7;
  }
  return v5;
}

- (BOOL)isDiscrete
{
  return 0;
}

- (unint64_t)detectionType
{
  return 101;
}

- (PTCinematographyFixedFocusTrack)initWithDetection:(id)a3
{
  id v4 = a3;
  v5 = -[PTCinematographyTrack initWithDetectionType:](self, "initWithDetectionType:", [v4 detectionType]);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    detection = v5->_detection;
    v5->_detection = (PTCinematographyDetection *)v6;
  }
  return v5;
}

- (PTCinematographyFixedFocusTrack)initWithFocusDistance:(float)a3
{
  v5 = [PTCinematographyDetection alloc];
  long long v10 = *MEMORY[0x1E4F1F9F0];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  *(float *)&double v6 = a3;
  uint64_t v7 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v5, "initWithTime:rect:focusDistance:", &v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v6);
  v8 = [(PTCinematographyFixedFocusTrack *)self initWithDetection:v7];

  return v8;
}

- (float)focusDistance
{
  [(PTCinematographyDetection *)self->_detection focusDistance];
  return result;
}

- (id)_fixedFocusDetectionAtTime:(id *)a3
{
  v5 = [(PTCinematographyFixedFocusTrack *)self detection];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  double v6 = [v5 _detectionByChangingTime:&v8];

  [v6 setDetectionType:101];
  objc_msgSend(v6, "setTrackIdentifier:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));

  return v6;
}

- (id)detectionNearestTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  v3 = [(PTCinematographyFixedFocusTrack *)self _fixedFocusDetectionAtTime:&v5];

  return v3;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  v3 = [(PTCinematographyFixedFocusTrack *)self _fixedFocusDetectionAtTime:&v5];

  return v3;
}

- (id)detectionsInTimeRange:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = _PTLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[PTCinematographyFixedFocusTrack detectionsInTimeRange:]((uint64_t)self, v4);
  }

  long long v8 = *MEMORY[0x1E4F1F9F0];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(PTCinematographyFixedFocusTrack *)self _fixedFocusDetectionAtTime:&v8];
  v10[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v6;
}

- (id)detectionInFrame:(id)a3
{
  if (a3) {
    [a3 time];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  id v4 = [(PTCinematographyFixedFocusTrack *)self _fixedFocusDetectionAtTime:v6];

  return v4;
}

- (id)_calculateTimeRanges
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F29238];
  v3 = [(PTCinematographyTrack *)self script];
  id v4 = v3;
  if (v3) {
    [v3 timeRange];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [v2 valueWithCMTimeRange:v8];
  v9[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

- (unint64_t)trackType
{
  return 3;
}

- (id)_asCinematographyDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyFixedFocusTrack;
  v3 = [(PTCinematographyTrack *)&v9 _asMutableCinematographyDictionary];
  id v4 = [(PTCinematographyFixedFocusTrack *)self detection];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [v4 _asCinematographyDictionary];
  v10[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 setObject:v6 forKeyedSubscript:@"detections"];

  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [v4 objectForKeyedSubscript:@"detections"];
  if ([v5 count])
  {
    double v6 = [PTCinematographyDetection alloc];
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    id v8 = [(PTCinematographyDetection *)v6 _initWithCinematographyDictionary:v7];

    v13.receiver = self;
    v13.super_class = (Class)PTCinematographyFixedFocusTrack;
    objc_super v9 = [(PTCinematographyTrack *)&v13 _initWithCinematographyDictionary:v4];
    long long v10 = v9;
    if (v9) {
      objc_storeStrong(v9 + 8, v8);
    }
    self = v10;

    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (PTCinematographyDetection)detection
{
  return self->_detection;
}

- (void).cxx_destruct
{
}

- (void)detectionsInTimeRange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "attempt to get detections in time range for continuous track %@", (uint8_t *)&v2, 0xCu);
}

@end