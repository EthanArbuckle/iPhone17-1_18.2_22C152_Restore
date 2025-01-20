@interface PTCinematographyFrame
+ (id)_frameFromInnerAtomStream:(id)a3;
+ (id)_frameHeaderFromAtomStream:(id)a3;
+ (id)_framesWithCinematographyDictionaries:(id)a3;
+ (id)objectFromAtomStream:(id)a3;
+ (void)_debugLogFrame:(id)a3 label:(id)a4;
+ (void)_debugLogFrames:(id)a3 label:(id)a4;
+ (void)initialize;
+ (void)registerForSerialization;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)_copyToFrameHeaderData_0:(FrameHeaderData_0 *)a3;
- (BOOL)_writeHeaderToAtomWriter:(id)a3 options:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFocusStrong;
- (BOOL)isInTransition;
- (BOOL)isUserFocusEnd;
- (BOOL)isUserFocusGroup;
- (BOOL)isUserFocusStrong;
- (BOOL)supportsVersion:(unint64_t)a3;
- (BOOL)writeToAtomWriter:(id)a3 options:(id)a4;
- (NSArray)allDetections;
- (NSDictionary)cachedDetectionsByFocusIdentifier;
- (NSDictionary)cachedDetectionsByTrackIdentifier;
- (NSNumber)_detectorDidRun;
- (NSNumber)_frameNumber;
- (NSNumber)baseFocusTrackNumber;
- (NSNumber)focusTrackNumber;
- (NSNumber)userFocusTrackNumber;
- (NSSet)_detectionTrackNumberSet;
- (NSString)debugDescription;
- (NSString)description;
- (PTCinematographyDetection)focusDetection;
- (PTCinematographyFocusBlend)focusBlend;
- (float)aperture;
- (float)focusDistance;
- (float)rawFocusDistance;
- (float)transitionCoefficient;
- (float)transitionDuration;
- (float)transitionElapsedTime;
- (id)_asCinematographyDictionary;
- (id)_detectionsByFocusIdentifier;
- (id)_detectionsByTrackIdentifier;
- (id)_focusDetectionFromCoefficientsDictionary:(id)a3 coefficient:(float *)a4;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithCinematographyDictionary:(id)a3 time:(id *)a4;
- (id)_initWithFrameHeaderData_0:(FrameHeaderData_0 *)a3;
- (id)_snapshot;
- (id)bestDetectionForGroupIdentifier:(int64_t)a3;
- (id)detectionAtPoint:(CGPoint)a3;
- (id)detectionForFocusIdentifier:(id)a3;
- (id)detectionForTrack:(id)a3;
- (id)detectionForTrackIdentifier:(int64_t)a3;
- (id)detectionForTrackNumber:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)focusGroupIdentifier;
- (int64_t)focusTrackIdentifier;
- (unint64_t)_snapshotPolicy;
- (unint64_t)hash;
- (unint64_t)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)_addDetection:(id)a3;
- (void)_flushCachedDetectionsDictionaries;
- (void)_focusFromDetection:(id)a3 toDetection:(id)a4 rawFocusDistance:(float)a5 focusDistance:(float)a6 transitionCoefficient:(float)a7 elapsedTime:(float)a8 duration:(float)a9;
- (void)_removeDetection:(id)a3;
- (void)_removeDetectionWithTrackIdentifier:(int64_t)a3;
- (void)_restoreOriginal;
- (void)_setDetectorDidRun:(id)a3;
- (void)_setFrameNumber:(id)a3;
- (void)_setSnapshot:(id)a3;
- (void)_setSnapshotPolicy:(unint64_t)a3;
- (void)_updateDetectionTimes;
- (void)focusOnDetection:(id)a3;
- (void)focusOnDetection:(id)a3 focusPuller:(id)a4;
- (void)focusOnNothing;
- (void)focusTrackIdentifier;
- (void)setAllDetections:(id)a3;
- (void)setAperture:(float)a3;
- (void)setBaseFocusTrackNumber:(id)a3;
- (void)setDetections:(id)a3;
- (void)setFocusBlend:(id)a3;
- (void)setFocusDetection:(id)a3;
- (void)setFocusDistance:(float)a3;
- (void)setFocusTrackNumber:(id)a3;
- (void)setRawFocusDistance:(float)a3;
- (void)setTime:(id *)a3;
- (void)setTransitionCoefficient:(float)a3;
- (void)setTransitionDuration:(float)a3;
- (void)setTransitionElapsedTime:(float)a3;
- (void)setUserFocusEnd:(BOOL)a3;
- (void)setUserFocusGroup:(BOOL)a3;
- (void)setUserFocusStrong:(BOOL)a3;
- (void)setUserFocusTrackNumber:(id)a3;
@end

@implementation PTCinematographyFrame

- (BOOL)isFocusStrong
{
  v3 = [(PTCinematographyFrame *)self userFocusTrackNumber];

  if (!v3) {
    return 0;
  }

  return [(PTCinematographyFrame *)self isUserFocusStrong];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[PTSerialization registerSerializationClass:a1];
  }
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
  [(PTCinematographyFrame *)self _updateDetectionTimes];
}

- (void)setAllDetections:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  allDetections = self->_allDetections;
  self->_allDetections = v4;

  [(PTCinematographyFrame *)self _updateDetectionTimes];
}

- (NSSet)_detectionTrackNumberSet
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "trackIdentifier"));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return (NSSet *)v10;
}

- (void)_updateDetectionTimes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v3 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        [(PTCinematographyFrame *)self time];
        long long v9 = v11;
        uint64_t v10 = v12;
        [v8 setTime:&v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (int64_t)focusTrackIdentifier
{
  long long v3 = [(PTCinematographyFrame *)self focusTrackNumber];
  int64_t v4 = PTTrackIDFromNumber(v3);

  uint64_t v5 = [(PTCinematographyFrame *)self focusDetection];

  if (v5)
  {
    uint64_t v6 = [(PTCinematographyFrame *)self focusDetection];
    if ([v6 trackIdentifier] != v4) {
      -[PTCinematographyFrame focusTrackIdentifier]();
    }
  }
  return v4;
}

- (int64_t)focusGroupIdentifier
{
  long long v3 = [(PTCinematographyFrame *)self focusDetection];
  if (v3)
  {
    int64_t v4 = [(PTCinematographyFrame *)self focusDetection];
    int64_t v5 = [v4 groupIdentifier];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (id)detectionForTrackIdentifier:(int64_t)a3
{
  int64_t v4 = [(PTCinematographyFrame *)self _detectionsByTrackIdentifier];
  int64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)bestDetectionForGroupIdentifier:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v4 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 groupIdentifier] == a3
          && (!v7 || PTDetectionTypeIsBetter([v10 detectionType], objc_msgSend(v7, "detectionType"))))
        {
          id v11 = v10;

          uint64_t v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isInTransition
{
  [(PTCinematographyFrame *)self transitionCoefficient];
  return v2 > 0.0;
}

- (void)setDetections:(id)a3
{
  id v5 = [a3 allValues];
  int64_t v4 = (void *)[v5 copy];
  [(PTCinematographyFrame *)self setAllDetections:v4];
}

- (id)detectionForFocusIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PTCinematographyFrame *)self _detectionsByFocusIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (PTCinematographyFocusBlend)focusBlend
{
  long long v3 = [PTCinematographyFocusBlend alloc];
  id v4 = [(PTCinematographyFrame *)self focusDetection];
  id v5 = [(PTCinematographyFocusBlend *)v3 initFocusedOnDetection:v4];

  return (PTCinematographyFocusBlend *)v5;
}

- (id)detectionForTrack:(id)a3
{
  uint64_t v4 = [a3 trackIdentifier];

  return [(PTCinematographyFrame *)self detectionForTrackIdentifier:v4];
}

- (NSString)description
{
  long long v3 = NSString;
  [(PTCinematographyFrame *)self time];
  uint64_t v4 = NSStringFromCMTime(&v13);
  id v5 = [(PTCinematographyFrame *)self focusDetection];
  uint64_t v6 = [v5 focusIdentifier];
  uint64_t v7 = NSNumber;
  [(PTCinematographyFrame *)self focusDistance];
  uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
  long long v9 = NSNumber;
  [(PTCinematographyFrame *)self aperture];
  uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
  id v11 = [v3 stringWithFormat:@"Frame: %@ [%@] (%@, %@)", v4, v6, v8, v10];

  return (NSString *)v11;
}

- (NSString)debugDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) debugDescription];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [NSString stringWithFormat:@"%@\n%@", self, v3];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PTCinematographyFrame *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [(PTCinematographyFrame *)self time];
      if (v5) {
        [(PTCinematographyFrame *)v5 time];
      }
      else {
        memset(&v22, 0, sizeof(v22));
      }
      if (!CMTimeCompare(&time1, &v22)
        && ([(PTCinematographyFrame *)self aperture],
            float v9 = v8,
            [(PTCinematographyFrame *)v5 aperture],
            v9 == v10)
        && ([(PTCinematographyFrame *)self focusDistance],
            float v12 = v11,
            [(PTCinematographyFrame *)v5 focusDistance],
            v12 == v13)
        && (int64_t v14 = [(PTCinematographyFrame *)self focusTrackIdentifier],
            v14 == [(PTCinematographyFrame *)v5 focusTrackIdentifier]))
      {
        long long v15 = [(PTCinematographyFrame *)self allDetections];
        long long v16 = [(PTCinematographyFrame *)v5 allDetections];
        if ([v15 isEqual:v16]
          && ([(PTCinematographyFrame *)self transitionCoefficient],
              float v18 = v17,
              [(PTCinematographyFrame *)v5 transitionCoefficient],
              v18 == v19))
        {
          v20 = [(PTCinematographyFrame *)self focusDetection];
          v21 = [(PTCinematographyFrame *)v5 focusDetection];
          char v6 = [v20 isEqual:v21];
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  [(PTCinematographyFrame *)self time];
  double Seconds = CMTimeGetSeconds(&time);
  [(PTCinematographyFrame *)self aperture];
  double v5 = v4 + Seconds * 600.0;
  [(PTCinematographyFrame *)self focusDistance];
  return (unint64_t)(v5 + v6);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  float v4 = objc_alloc_init(PTCinematographyFrame);
  if (v4)
  {
    [(PTCinematographyFrame *)self time];
    long long v15 = v17;
    uint64_t v16 = v18;
    [(PTCinematographyFrame *)v4 setTime:&v15];
    [(PTCinematographyFrame *)self aperture];
    -[PTCinematographyFrame setAperture:](v4, "setAperture:");
    [(PTCinematographyFrame *)self focusDistance];
    -[PTCinematographyFrame setFocusDistance:](v4, "setFocusDistance:");
    double v5 = [(PTCinematographyFrame *)self allDetections];
    float v6 = (void *)[v5 copy];
    [(PTCinematographyFrame *)v4 setAllDetections:v6];

    uint64_t v7 = [(PTCinematographyFrame *)self focusTrackNumber];
    [(PTCinematographyFrame *)v4 setFocusTrackNumber:v7];

    float v8 = [(PTCinematographyFrame *)self baseFocusTrackNumber];
    [(PTCinematographyFrame *)v4 setBaseFocusTrackNumber:v8];

    float v9 = [(PTCinematographyFrame *)self userFocusTrackNumber];
    [(PTCinematographyFrame *)v4 setUserFocusTrackNumber:v9];

    [(PTCinematographyFrame *)v4 setUserFocusStrong:[(PTCinematographyFrame *)self isUserFocusStrong]];
    [(PTCinematographyFrame *)v4 setUserFocusGroup:[(PTCinematographyFrame *)self isUserFocusGroup]];
    float v10 = [(PTCinematographyFrame *)self focusDetection];
    [(PTCinematographyFrame *)v4 setFocusDetection:v10];

    [(PTCinematographyFrame *)self transitionCoefficient];
    -[PTCinematographyFrame setTransitionCoefficient:](v4, "setTransitionCoefficient:");
    [(PTCinematographyFrame *)self transitionElapsedTime];
    -[PTCinematographyFrame setTransitionElapsedTime:](v4, "setTransitionElapsedTime:");
    [(PTCinematographyFrame *)self transitionDuration];
    -[PTCinematographyFrame setTransitionDuration:](v4, "setTransitionDuration:");
    float v11 = [(PTCinematographyFrame *)self _frameNumber];
    [(PTCinematographyFrame *)v4 _setFrameNumber:v11];

    [(PTCinematographyFrame *)v4 _setSnapshotPolicy:[(PTCinematographyFrame *)self _snapshotPolicy]];
    float v12 = [(PTCinematographyFrame *)self _snapshot];
    float v13 = (void *)[v12 copy];
    [(PTCinematographyFrame *)v4 _setSnapshot:v13];
  }
  return v4;
}

- (id)detectionAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v5 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    float v8 = 0;
    uint64_t v9 = *(void *)v24;
    double v10 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        float v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v12 rect];
        CGFloat v13 = v31.origin.x;
        CGFloat v14 = v31.origin.y;
        CGFloat width = v31.size.width;
        CGFloat height = v31.size.height;
        v30.CGFloat x = x;
        v30.CGFloat y = y;
        if (CGRectContainsPoint(v31, v30))
        {
          unint64_t v17 = [v12 detectionType];
          BOOL v18 = v17 > 0xB || ((1 << v17) & 0x83E) == 0;
          if (!v18 || v17 == 102)
          {
            double Area = CGRectGetArea(v13, v14, width, height);
            if (Area < v10)
            {
              double v20 = Area;
              id v21 = v12;

              double v10 = v20;
              float v8 = v21;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
  else
  {
    float v8 = 0;
  }

  return v8;
}

- (id)_detectionsByTrackIdentifier
{
  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  if (!cachedDetectionsByTrackIdentifier)
  {
    float v4 = [(PTCinematographyFrame *)self allDetections];
    double v5 = +[PTCinematographyDetection _detectionsByTrackIdentifierFromArray:v4];
    uint64_t v6 = self->_cachedDetectionsByTrackIdentifier;
    self->_cachedDetectionsByTrackIdentifier = v5;

    cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  }

  return cachedDetectionsByTrackIdentifier;
}

- (id)_detectionsByFocusIdentifier
{
  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  if (!cachedDetectionsByFocusIdentifier)
  {
    float v4 = [(PTCinematographyFrame *)self allDetections];
    double v5 = +[PTCinematographyDetection _detectionsByFocusIdentifierFromArray:v4];
    uint64_t v6 = self->_cachedDetectionsByFocusIdentifier;
    self->_cachedDetectionsByFocusIdentifier = v5;

    cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  }

  return cachedDetectionsByFocusIdentifier;
}

- (NSNumber)_frameNumber
{
  return self->_frameNumber;
}

- (void)_setFrameNumber:(id)a3
{
}

- (id)_snapshot
{
  return self->_snapshot;
}

- (void)_setSnapshot:(id)a3
{
}

- (unint64_t)_snapshotPolicy
{
  return self->_snapshotPolicy;
}

- (void)_setSnapshotPolicy:(unint64_t)a3
{
  self->_snapshotPolicCGFloat y = a3;
}

- (NSNumber)_detectorDidRun
{
  return self->_detectorDidRun;
}

- (void)_setDetectorDidRun:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (float)aperture
{
  return self->_aperture;
}

- (void)setAperture:(float)a3
{
  self->_aperture = a3;
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (PTCinematographyDetection)focusDetection
{
  return self->_focusDetection;
}

- (void)setFocusDetection:(id)a3
{
}

- (NSArray)allDetections
{
  return self->_allDetections;
}

- (float)rawFocusDistance
{
  return self->_rawFocusDistance;
}

- (void)setRawFocusDistance:(float)a3
{
  self->_rawFocusDistance = a3;
}

- (NSNumber)focusTrackNumber
{
  return self->_focusTrackNumber;
}

- (void)setFocusTrackNumber:(id)a3
{
}

- (NSNumber)baseFocusTrackNumber
{
  return self->_baseFocusTrackNumber;
}

- (void)setBaseFocusTrackNumber:(id)a3
{
}

- (NSNumber)userFocusTrackNumber
{
  return self->_userFocusTrackNumber;
}

- (void)setUserFocusTrackNumber:(id)a3
{
}

- (BOOL)isUserFocusStrong
{
  return self->_userFocusStrong;
}

- (void)setUserFocusStrong:(BOOL)a3
{
  self->_userFocusStrong = a3;
}

- (BOOL)isUserFocusGroup
{
  return self->_userFocusGroup;
}

- (void)setUserFocusGroup:(BOOL)a3
{
  self->_userFocusGroup = a3;
}

- (BOOL)isUserFocusEnd
{
  return self->_userFocusEnd;
}

- (void)setUserFocusEnd:(BOOL)a3
{
  self->_userFocusEnd = a3;
}

- (float)transitionCoefficient
{
  return self->_transitionCoefficient;
}

- (void)setTransitionCoefficient:(float)a3
{
  self->_transitionCoefficient = a3;
}

- (float)transitionElapsedTime
{
  return self->_transitionElapsedTime;
}

- (void)setTransitionElapsedTime:(float)a3
{
  self->_transitionElapsedTime = a3;
}

- (float)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(float)a3
{
  self->_transitionDuration = a3;
}

- (NSDictionary)cachedDetectionsByFocusIdentifier
{
  return self->_cachedDetectionsByFocusIdentifier;
}

- (NSDictionary)cachedDetectionsByTrackIdentifier
{
  return self->_cachedDetectionsByTrackIdentifier;
}

- (void)setFocusBlend:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusBlend, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_userFocusTrackNumber, 0);
  objc_storeStrong((id *)&self->_baseFocusTrackNumber, 0);
  objc_storeStrong((id *)&self->_focusTrackNumber, 0);
  objc_storeStrong((id *)&self->_allDetections, 0);
  objc_storeStrong((id *)&self->_focusDetection, 0);
  objc_storeStrong((id *)&self->_detectorDidRun, 0);
  objc_storeStrong(&self->_snapshot, 0);

  objc_storeStrong((id *)&self->_frameNumber, 0);
}

- (id)detectionForTrackNumber:(id)a3
{
  if (a3)
  {
    float v4 = -[PTCinematographyFrame detectionForTrackIdentifier:](self, "detectionForTrackIdentifier:", [a3 integerValue]);
  }
  else
  {
    float v4 = 0;
  }
  return v4;
}

- (void)_addDetection:(id)a3
{
  id v4 = a3;
  double v5 = [(PTCinematographyFrame *)self allDetections];
  id v7 = (id)[v5 mutableCopy];

  [v7 addObject:v4];
  uint64_t v6 = (void *)[v7 copy];
  [(PTCinematographyFrame *)self setAllDetections:v6];

  [(PTCinematographyFrame *)self _flushCachedDetectionsDictionaries];
}

- (void)_removeDetection:(id)a3
{
  id v4 = a3;
  double v5 = [(PTCinematographyFrame *)self allDetections];
  id v7 = (id)[v5 mutableCopy];

  [v7 removeObject:v4];
  uint64_t v6 = (void *)[v7 copy];
  [(PTCinematographyFrame *)self setAllDetections:v6];

  [(PTCinematographyFrame *)self _flushCachedDetectionsDictionaries];
}

- (void)_removeDetectionWithTrackIdentifier:(int64_t)a3
{
  uint64_t v4 = [(PTCinematographyFrame *)self detectionForTrackIdentifier:a3];
  if (v4) {
    [(PTCinematographyFrame *)self _removeDetection:v4];
  }

  MEMORY[0x1F41817F8]();
}

- (void)_flushCachedDetectionsDictionaries
{
  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  self->_cachedDetectionsByFocusIdentifier = 0;

  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  self->_cachedDetectionsByTrackIdentifier = 0;
}

+ (id)_framesWithCinematographyDictionaries:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
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
        float v11 = [PTCinematographyFrame alloc];
        id v12 = -[PTCinematographyFrame _initWithCinematographyDictionary:](v11, "_initWithCinematographyDictionary:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  CGFloat v13 = (void *)[v4 copy];

  return v13;
}

- (id)_focusDetectionFromCoefficientsDictionary:(id)a3 coefficient:(float *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v22;
    float v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        CGFloat v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v15 = [v14 focusIdentifier];
        long long v16 = [v6 objectForKeyedSubscript:v15];
        [v16 floatValue];
        float v18 = v17;

        if (v18 > v12)
        {
          id v19 = v14;

          uint64_t v10 = v19;
          float v12 = v18;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
    float v12 = 0.0;
  }

  if (a4) {
    *a4 = v12;
  }

  return v10;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PTCinematographyFrame;
  id v5 = [(PTCinematographyFrame *)&v49 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"trackers"];
    uint64_t v7 = [v6 allValues];
    uint64_t v8 = +[PTCinematographyDetection _detectionsFromCinematographyArray:v7];
    uint64_t v9 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"focus_track_id"];

    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"focus_track_id"];
      float v12 = (void *)*((void *)v5 + 11);
      *((void *)v5 + 11) = v11;

      uint64_t v13 = [v5 detectionForTrackNumber:*((void *)v5 + 11)];
      CGFloat v14 = (void *)*((void *)v5 + 9);
      *((void *)v5 + 9) = v13;

      long long v15 = [v4 objectForKeyedSubscript:@"transition_coefficient"];
      [v15 floatValue];
      *((_DWORD *)v5 + 6) = v16;
    }
    else
    {
      LODWORD(v48.value) = 0;
      long long v15 = [v4 objectForKeyedSubscript:@"coefficients"];
      uint64_t v17 = [v5 _focusDetectionFromCoefficientsDictionary:v15 coefficient:&v48];
      float v18 = (void *)*((void *)v5 + 9);
      *((void *)v5 + 9) = v17;

      uint64_t v19 = [*((id *)v5 + 9) trackNumber];
      uint64_t v20 = (void *)*((void *)v5 + 11);
      *((void *)v5 + 11) = v19;

      *((float *)v5 + 6) = 1.0 - *(float *)&v48.value;
      if (!*((void *)v5 + 9))
      {
        long long v21 = _PTLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[PTCinematographyFrame(Private) _initWithCinematographyDictionary:]((uint64_t)v15, v21);
        }
      }
    }

    long long v22 = [v4 objectForKeyedSubscript:@"transition_elapsed_time"];
    [v22 floatValue];
    *((_DWORD *)v5 + 7) = v23;

    long long v24 = [v4 objectForKeyedSubscript:@"transition_duration"];
    [v24 floatValue];
    *((_DWORD *)v5 + 8) = v25;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"base_track_id"];
    v27 = v26;
    if (!v26) {
      v27 = (void *)*((void *)v5 + 11);
    }
    objc_storeStrong((id *)v5 + 12, v27);

    uint64_t v28 = [v4 objectForKeyedSubscript:@"user_track_id"];
    v29 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v28;

    CGPoint v30 = [v4 objectForKeyedSubscript:@"user_focus_strong"];
    v5[8] = [v30 BOOLValue];

    CGRect v31 = [v4 objectForKeyedSubscript:@"user_focus_group"];
    v5[9] = [v31 BOOLValue];

    uint64_t v32 = [v4 objectForKeyedSubscript:@"frame"];
    v33 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v32;

    CFDictionaryRef v34 = [v4 objectForKeyedSubscript:@"ptime"];
    CMTimeFromPTCinematographyDictionary(&v48, v34);
    *(CMTime *)(v5 + 136) = v48;

    v35 = [v4 objectForKeyedSubscript:@"aperture"];
    [v35 floatValue];
    *((_DWORD *)v5 + 3) = v36;

    v37 = [v4 objectForKeyedSubscript:@"disparity"];
    [v37 floatValue];
    *((_DWORD *)v5 + 4) = v38;

    v39 = [v4 objectForKeyedSubscript:@"_raw_disparity"];
    if (objc_opt_respondsToSelector())
    {
      [v39 floatValue];
    }
    else
    {
      v41 = (void *)*((void *)v5 + 9);
      if (v41) {
        [v41 focusDistance];
      }
      else {
        int v40 = *((_DWORD *)v5 + 4);
      }
    }
    *((_DWORD *)v5 + 5) = v40;
    uint64_t v42 = [v4 objectForKeyedSubscript:@"_snapshot"];
    v43 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v42;

    v44 = [v4 objectForKeyedSubscript:@"_snapshot_policy"];
    *((void *)v5 + 7) = [v44 unsignedIntegerValue];

    uint64_t v45 = [v4 objectForKeyedSubscript:@"detector_did_run"];
    v46 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v45;
  }
  return v5;
}

- (id)_initWithCinematographyDictionary:(id)a3 time:(id *)a4
{
  id v5 = [(PTCinematographyFrame *)self _initWithCinematographyDictionary:a3];
  id v6 = v5;
  if (v5)
  {
    long long v8 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v5 setTime:&v8];
  }
  return v6;
}

- (id)_asCinematographyDictionary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v10 = [v9 focusIdentifier];
        uint64_t v11 = [v9 _asCinematographyDictionary];
        [v3 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v6);
  }

  float v12 = objc_opt_new();
  uint64_t v13 = [(PTCinematographyFrame *)self baseFocusTrackNumber];
  [v12 setObject:v13 forKeyedSubscript:@"base_track_id"];

  CGFloat v14 = [(PTCinematographyFrame *)self userFocusTrackNumber];
  [v12 setObject:v14 forKeyedSubscript:@"user_track_id"];

  if ([(PTCinematographyFrame *)self isUserFocusStrong])
  {
    long long v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PTCinematographyFrame isUserFocusStrong](self, "isUserFocusStrong"));
    [v12 setObject:v15 forKeyedSubscript:@"user_focus_strong"];
  }
  else
  {
    [v12 setObject:0 forKeyedSubscript:@"user_focus_strong"];
  }
  if ([(PTCinematographyFrame *)self isUserFocusGroup])
  {
    int v16 = objc_msgSend(NSNumber, "numberWithBool:", -[PTCinematographyFrame isUserFocusGroup](self, "isUserFocusGroup"));
    [v12 setObject:v16 forKeyedSubscript:@"user_focus_group"];
  }
  else
  {
    [v12 setObject:0 forKeyedSubscript:@"user_focus_group"];
  }
  uint64_t v17 = [(PTCinematographyFrame *)self _frameNumber];
  [v12 setObject:v17 forKeyedSubscript:@"frame"];

  [(PTCinematographyFrame *)self time];
  float v18 = PTCinematographyDictionaryFromCMTime((uint64_t)v37);
  [v12 setObject:v18 forKeyedSubscript:@"ptime"];

  uint64_t v19 = NSNumber;
  [(PTCinematographyFrame *)self aperture];
  uint64_t v20 = objc_msgSend(v19, "numberWithFloat:");
  [v12 setObject:v20 forKeyedSubscript:@"aperture"];

  long long v21 = NSNumber;
  [(PTCinematographyFrame *)self focusDistance];
  long long v22 = objc_msgSend(v21, "numberWithFloat:");
  [v12 setObject:v22 forKeyedSubscript:@"disparity"];

  int v23 = NSNumber;
  [(PTCinematographyFrame *)self rawFocusDistance];
  long long v24 = objc_msgSend(v23, "numberWithFloat:");
  [v12 setObject:v24 forKeyedSubscript:@"_raw_disparity"];

  int v25 = (void *)[v3 copy];
  [v12 setObject:v25 forKeyedSubscript:@"trackers"];

  uint64_t v26 = [(PTCinematographyFrame *)self _snapshot];
  [v12 setObject:v26 forKeyedSubscript:@"_snapshot"];

  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyFrame _snapshotPolicy](self, "_snapshotPolicy"));
  [v12 setObject:v27 forKeyedSubscript:@"_snapshot_policy"];

  uint64_t v28 = [(PTCinematographyFrame *)self _detectorDidRun];
  [v12 setObject:v28 forKeyedSubscript:@"detector_did_run"];

  v29 = [(PTCinematographyFrame *)self focusTrackNumber];
  [v12 setObject:v29 forKeyedSubscript:@"focus_track_id"];

  CGPoint v30 = NSNumber;
  [(PTCinematographyFrame *)self transitionCoefficient];
  CGRect v31 = objc_msgSend(v30, "numberWithFloat:");
  [v12 setObject:v31 forKeyedSubscript:@"transition_coefficient"];

  uint64_t v32 = NSNumber;
  [(PTCinematographyFrame *)self transitionElapsedTime];
  v33 = objc_msgSend(v32, "numberWithFloat:");
  [v12 setObject:v33 forKeyedSubscript:@"transition_elapsed_time"];

  CFDictionaryRef v34 = NSNumber;
  [(PTCinematographyFrame *)self transitionDuration];
  v35 = objc_msgSend(v34, "numberWithFloat:");
  [v12 setObject:v35 forKeyedSubscript:@"transition_duration"];

  return v12;
}

- (void)_restoreOriginal
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(PTCinematographyFrame *)self rawFocusDistance];
  if (v3 > 0.0)
  {
    [(PTCinematographyFrame *)self rawFocusDistance];
    -[PTCinematographyFrame setFocusDistance:](self, "setFocusDistance:");
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(PTCinematographyFrame *)self allDetections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _restoreOriginal];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)_debugLogFrames:(id)a3 label:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [a1 _debugLogFrame:*(void *)(*((void *)&v12 + 1) + 8 * v11++) label:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (void)_debugLogFrame:(id)a3 label:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 focusDetection];
  uint64_t v8 = [v7 focusIdentifier];

  uint64_t v9 = [v5 focusTrackNumber];
  uint64_t v10 = [v5 focusDetection];
  [v10 rect];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  uint64_t v19 = _PTLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v35 = [v5 _frameNumber];
    uint64_t v20 = NSNumber;
    [v5 focusDistance];
    long long v21 = objc_msgSend(v20, "numberWithFloat:");
    long long v22 = NSNumber;
    [v5 aperture];
    int v23 = objc_msgSend(v22, "numberWithFloat:");
    long long v24 = [v5 userFocusTrackNumber];
    int v25 = &stru_1F269F3B0;
    if (v24)
    {
      uint64_t v32 = NSString;
      [v5 userFocusTrackNumber];
      v33 = v23;
      v27 = uint64_t v26 = v21;
      if ([v5 isUserFocusGroup]) {
        uint64_t v28 = @"g";
      }
      else {
        uint64_t v28 = &stru_1F269F3B0;
      }
      int v29 = [v5 isUserFocusStrong];
      CGPoint v30 = @"+";
      if (!v29) {
        CGPoint v30 = &stru_1F269F3B0;
      }
      CFDictionaryRef v34 = (void *)v27;
      uint64_t v31 = v27;
      long long v21 = v26;
      int v23 = v33;
      int v25 = [v32 stringWithFormat:@"; userFocusTrackNumber: %@ %@%@", v31, v28, v30];
    }
    *(_DWORD *)buf = 138414850;
    id v37 = v6;
    __int16 v38 = 2112;
    long long v39 = v35;
    __int16 v40 = 2112;
    long long v41 = v8;
    __int16 v42 = 2112;
    uint64_t v43 = v9;
    __int16 v44 = 2112;
    uint64_t v45 = v21;
    __int16 v46 = 2112;
    v47 = v23;
    __int16 v48 = 2112;
    objc_super v49 = v25;
    __int16 v50 = 2048;
    uint64_t v51 = v12;
    __int16 v52 = 2048;
    uint64_t v53 = v14;
    __int16 v54 = 2048;
    uint64_t v55 = v16;
    __int16 v56 = 2048;
    uint64_t v57 = v18;
    _os_log_debug_impl(&dword_1D0778000, v19, OS_LOG_TYPE_DEBUG, "%@ Frame %@: focus %@ (%@), disparity %@, aperture %@%@ rect { %.3f, %.3f, %.3f, %.3f }", buf, 0x70u);
    if (v24)
    {
    }
  }
}

- (void)focusOnNothing
{
  float v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[PTCinematographyFrame(Private) focusOnNothing](v3);
  }

  id v4 = _PTLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    id v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyFrame(Private) focusOnNothing](v6);
    }
  }
  [(PTCinematographyFrame *)self setRawFocusDistance:0.0];
  [(PTCinematographyFrame *)self setFocusDistance:0.0];
  [(PTCinematographyFrame *)self setFocusDetection:0];
  [(PTCinematographyFrame *)self setFocusTrackNumber:0];
  [(PTCinematographyFrame *)self setTransitionCoefficient:0.0];
  [(PTCinematographyFrame *)self setTransitionElapsedTime:0.0];
  [(PTCinematographyFrame *)self setTransitionDuration:0.0];
}

- (void)focusOnDetection:(id)a3
{
  if (a3) {
    [(PTCinematographyFrame *)self focusOnDetection:a3 focusPuller:0];
  }
  else {
    [(PTCinematographyFrame *)self focusOnNothing];
  }
}

- (void)focusOnDetection:(id)a3 focusPuller:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 focusDistance];
  int v9 = LODWORD(v8);
  int v10 = LODWORD(v8);
  if (v6)
  {
    [(PTCinematographyFrame *)self time];
    LODWORD(v11) = v9;
    [v6 pullTowardFocusDistance:v14 time:v11];
    int v10 = LODWORD(v8);
  }
  LODWORD(v8) = v9;
  [(PTCinematographyFrame *)self setRawFocusDistance:v8];
  LODWORD(v12) = v10;
  [(PTCinematographyFrame *)self setFocusDistance:v12];
  [(PTCinematographyFrame *)self setFocusDetection:v7];
  uint64_t v13 = [v7 trackNumber];

  [(PTCinematographyFrame *)self setFocusTrackNumber:v13];
  [(PTCinematographyFrame *)self setTransitionCoefficient:0.0];
  [(PTCinematographyFrame *)self setTransitionElapsedTime:0.0];
  [(PTCinematographyFrame *)self setTransitionDuration:0.0];
}

- (void)_focusFromDetection:(id)a3 toDetection:(id)a4 rawFocusDistance:(float)a5 focusDistance:(float)a6 transitionCoefficient:(float)a7 elapsedTime:(float)a8 duration:(float)a9
{
  id v15 = a3;
  *(float *)&double v16 = a5;
  [(PTCinematographyFrame *)self setRawFocusDistance:v16];
  *(float *)&double v17 = a6;
  [(PTCinematographyFrame *)self setFocusDistance:v17];
  [(PTCinematographyFrame *)self setFocusDetection:v15];
  uint64_t v18 = [v15 trackNumber];

  [(PTCinematographyFrame *)self setFocusTrackNumber:v18];
  *(float *)&double v19 = a7;
  [(PTCinematographyFrame *)self setTransitionCoefficient:v19];
  *(float *)&double v20 = a8;
  [(PTCinematographyFrame *)self setTransitionElapsedTime:v20];
  *(float *)&double v21 = a9;

  [(PTCinematographyFrame *)self setTransitionDuration:v21];
}

+ (void)registerForSerialization
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PTCinematographyFrame_Serialization__registerForSerialization__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerForSerialization_onceToken_0 != -1) {
    dispatch_once(&registerForSerialization_onceToken_0, block);
  }
}

BOOL __64__PTCinematographyFrame_Serialization__registerForSerialization__block_invoke(uint64_t a1)
{
  +[PTSerialization registerType:1718775141 providerClass:*(void *)(a1 + 32)];
  uint64_t v1 = objc_opt_class();

  return +[PTSerialization registerSerializationClass:v1];
}

- (id)_initWithFrameHeaderData_0:(FrameHeaderData_0 *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PTCinematographyFrame;
  id v4 = [(PTCinematographyFrame *)&v17 init];
  if (v4)
  {
    BOOL v5 = NSNumberFromPTTrackID(bswap64(a3->var0));
    [(PTCinematographyFrame *)v4 setFocusTrackNumber:v5];

    id v6 = NSNumberFromPTTrackID(bswap64(a3->var1));
    [(PTCinematographyFrame *)v4 setBaseFocusTrackNumber:v6];

    id v7 = NSNumberFromPTTrackID(bswap64(a3->var2));
    [(PTCinematographyFrame *)v4 setUserFocusTrackNumber:v7];

    *(float *)&double v8 = _PTSwapBigGetFloat((unsigned int *)&a3->var3);
    [(PTCinematographyFrame *)v4 setAperture:v8];
    *(float *)&double v9 = _PTSwapBigGetFloat((unsigned int *)&a3->var4);
    [(PTCinematographyFrame *)v4 setFocusDistance:v9];
    *(float *)&double v10 = _PTSwapBigGetFloat((unsigned int *)&a3->var5);
    [(PTCinematographyFrame *)v4 setRawFocusDistance:v10];
    *(float *)&double v11 = _PTSwapBigGetFloat((unsigned int *)&a3->var6);
    [(PTCinematographyFrame *)v4 setTransitionCoefficient:v11];
    *(float *)&double v12 = _PTSwapBigGetFloat((unsigned int *)&a3->var7);
    [(PTCinematographyFrame *)v4 setTransitionElapsedTime:v12];
    *(float *)&double v13 = _PTSwapBigGetFloat((unsigned int *)&a3->var8);
    [(PTCinematographyFrame *)v4 setTransitionDuration:v13];
    unsigned int v14 = bswap32(a3->var9);
    if ((v14 & 2) != 0)
    {
      [(PTCinematographyFrame *)v4 _setDetectorDidRun:0];
    }
    else
    {
      id v15 = [NSNumber numberWithBool:v14 & 1];
      [(PTCinematographyFrame *)v4 _setDetectorDidRun:v15];
    }
    [(PTCinematographyFrame *)v4 setUserFocusStrong:(v14 >> 2) & 1];
    [(PTCinematographyFrame *)v4 setUserFocusGroup:(v14 >> 3) & 1];
    [(PTCinematographyFrame *)v4 setUserFocusEnd:(v14 >> 4) & 1];
  }
  return v4;
}

- (BOOL)_copyToFrameHeaderData_0:(FrameHeaderData_0 *)a3
{
  a3->var0 = bswap64([(PTCinematographyFrame *)self focusTrackIdentifier]);
  BOOL v5 = [(PTCinematographyFrame *)self baseFocusTrackNumber];
  a3->var1 = bswap64(PTTrackIDFromNumber(v5));

  id v6 = [(PTCinematographyFrame *)self userFocusTrackNumber];
  a3->var2 = bswap64(PTTrackIDFromNumber(v6));

  [(PTCinematographyFrame *)self aperture];
  _PTSwapBigAssignFloat(&a3->var3, v7);
  [(PTCinematographyFrame *)self focusDistance];
  _PTSwapBigAssignFloat(&a3->var4, v8);
  [(PTCinematographyFrame *)self rawFocusDistance];
  _PTSwapBigAssignFloat(&a3->var5, v9);
  [(PTCinematographyFrame *)self transitionCoefficient];
  _PTSwapBigAssignFloat(&a3->var6, v10);
  [(PTCinematographyFrame *)self transitionElapsedTime];
  _PTSwapBigAssignFloat(&a3->var7, v11);
  [(PTCinematographyFrame *)self transitionDuration];
  _PTSwapBigAssignFloat(&a3->var8, v12);
  double v13 = [(PTCinematographyFrame *)self _detectorDidRun];
  BOOL v14 = v13 == 0;

  id v15 = [(PTCinematographyFrame *)self _detectorDidRun];
  int v16 = [v15 BOOLValue];

  if ([(PTCinematographyFrame *)self isUserFocusStrong]) {
    int v17 = 4;
  }
  else {
    int v17 = 0;
  }
  if ([(PTCinematographyFrame *)self isUserFocusGroup]) {
    int v18 = 8;
  }
  else {
    int v18 = 0;
  }
  if ([(PTCinematographyFrame *)self isUserFocusEnd]) {
    int v19 = 16;
  }
  else {
    int v19 = 0;
  }
  a3->var9 = (v16 | (2 * v14) | v17 | v18 | v19) << 24;
  return 1;
}

- (BOOL)supportsVersion:(unint64_t)a3
{
  return a3 == 0;
}

- (unint64_t)sizeOfSerializedObjectWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PTCinematographyFrame *)self allDetections];

  if (v5)
  {
    id v6 = [(PTCinematographyFrame *)self allDetections];
    unint64_t v7 = +[PTCinematographyDetection sizeOfSerializedArray:v6 options:v4]+ 76;
  }
  else
  {
    unint64_t v7 = 76;
  }

  return v7;
}

- (BOOL)writeToAtomWriter:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 beginAtomOfType:1718775141];
  [v6 appendVersion:0 flags:0];
  float v8 = [v6 error];

  if (v8)
  {
    float v9 = 0;
  }
  else
  {
    float v9 = [[PTAtomWriter alloc] initWithParent:v6];
    if (![(PTCinematographyFrame *)self _writeHeaderToAtomWriter:v9 options:v7]
      || ([(PTCinematographyFrame *)self allDetections],
          float v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10)
      && ([(PTCinematographyFrame *)self allDetections],
          float v11 = objc_claimAutoreleasedReturnValue(),
          BOOL v12 = +[PTCinematographyDetection writeArray:v11 toAtomWriter:v9 options:v7], v11, !v12))
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }
    [v6 endAtom];
  }
  double v13 = [v6 error];
  BOOL v14 = v13 == 0;

LABEL_7:
  return v14;
}

- (BOOL)_writeHeaderToAtomWriter:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v11 = 0;
  memset(v10, 0, sizeof(v10));
  BOOL v6 = [(PTCinematographyFrame *)self _copyToFrameHeaderData_0:v10];
  BOOL v7 = 0;
  if (v6)
  {
    [v5 beginAtomOfType:1718775144];
    [v5 appendVersion:0 flags:0];
    [v5 appendBytes:v10 size:52];
    [v5 endAtom];
    float v8 = [v5 error];
    BOOL v7 = v8 == 0;
  }
  return v7;
}

+ (id)objectFromAtomStream:(id)a3
{
  id v4 = a3;
  if ([v4 atomType] != 1718775141
    || ([v4 readCurrentAtomVersionAndFlags], objc_msgSend(v4, "atomVersion")))
  {
    BOOL v6 = 0;
    id v5 = 0;
  }
  else
  {
    id v5 = [[PTAtomStream alloc] initWithParent:v4];
    BOOL v6 = [a1 _frameFromInnerAtomStream:v5];
    BOOL v7 = objc_msgSend(v6, "detectionForTrackIdentifier:", objc_msgSend(v6, "focusTrackIdentifier"));
    [v6 setFocusDetection:v7];
  }

  return v6;
}

+ (id)_frameFromInnerAtomStream:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  BOOL v6 = 0;
  while ([v4 hasAtom])
  {
    if ([v4 atomType] == 1718775144)
    {
      uint64_t v7 = [a1 _frameHeaderFromAtomStream:v4];
      float v8 = v5;
      id v5 = (void *)v7;
    }
    else
    {
      if ([v4 atomType] != 1685349235) {
        goto LABEL_8;
      }
      uint64_t v9 = +[PTCinematographyDetection objectsFromAtomStream:v4];
      float v8 = v6;
      BOOL v6 = (void *)v9;
    }

LABEL_8:
    [v4 advanceToNextAtom];
    if (v5 && v6) {
      break;
    }
  }
  [v5 setAllDetections:v6];

  return v5;
}

+ (id)_frameHeaderFromAtomStream:(id)a3
{
  id v4 = a3;
  if ([v4 atomType] != 1718775144
    || ([v4 readCurrentAtomVersionAndFlags], objc_msgSend(v4, "atomVersion"))
    || (int v9 = 0,
        memset(v8, 0, sizeof(v8)),
        [v4 readCurrentAtomDataBytes:v8 size:52 offset:0],
        [v4 error],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = objc_msgSend(objc_alloc((Class)a1), "_initWithFrameHeaderData_0:", v8);
  }

  return v6;
}

- (void)focusTrackIdentifier
{
  __assert_rtn("-[PTCinematographyFrame focusTrackIdentifier]", "PTCinematographyFrame.m", 113, "self.focusDetection.trackIdentifier == result");
}

@end