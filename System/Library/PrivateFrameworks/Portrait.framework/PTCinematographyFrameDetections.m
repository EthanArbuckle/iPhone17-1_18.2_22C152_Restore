@interface PTCinematographyFrameDetections
+ (id)frameDetections:(id)a3 detectorDidRun:(id)a4 presentationTime:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTime;
- (BOOL)didCacheAutoFocusDetection;
- (BOOL)didCacheCustomDetection;
- (NSArray)allFocusIdentifiers;
- (NSArray)allTrackIdentifiers;
- (NSArray)allTrackIdentifiersForCinematicChoice;
- (NSArray)detections;
- (NSDictionary)cachedDetectionsByFocusIdentifier;
- (NSDictionary)cachedDetectionsByTrackIdentifier;
- (NSNumber)baseFocusTrackNumberOverride;
- (NSNumber)detectorDidRun;
- (PTCinematographyDetection)autoFocusDetection;
- (PTCinematographyDetection)cachedAutoFocusDetection;
- (PTCinematographyDetection)cachedCustomDetection;
- (PTCinematographyDetection)customDetection;
- (PTCinematographyFrameDetections)initWithDetections:(id)a3 detectorDidRun:(id)a4 presentationTime:(id *)a5;
- (id)_detectionsByFocusIdentifier;
- (id)_detectionsByTrackIdentifier;
- (id)bestDetectionForGroupIdentifier:(int64_t)a3;
- (id)bestDetectionForGroupIdentifier:(int64_t)a3 options:(unint64_t)a4;
- (id)debugDescription;
- (id)detectionForFocusIdentifier:(id)a3;
- (id)detectionForTrackIdentifier:(int64_t)a3;
- (void)addDetection:(id)a3;
- (void)flushCachedDetectionsDictionaries;
- (void)setBaseFocusTrackNumberOverride:(id)a3;
- (void)setCachedAutoFocusDetection:(id)a3;
- (void)setCachedCustomDetection:(id)a3;
- (void)setDidCacheAutoFocusDetection:(BOOL)a3;
- (void)setDidCacheCustomDetection:(BOOL)a3;
- (void)setPresentationTime:(id *)a3;
@end

@implementation PTCinematographyFrameDetections

+ (id)frameDetections:(id)a3 detectorDidRun:(id)a4 presentationTime:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [PTCinematographyFrameDetections alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  v10 = [(PTCinematographyFrameDetections *)v9 initWithDetections:v8 detectorDidRun:v7 presentationTime:&v12];

  return v10;
}

- (PTCinematographyFrameDetections)initWithDetections:(id)a3 detectorDidRun:(id)a4 presentationTime:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PTCinematographyFrameDetections;
  v10 = [(PTCinematographyFrameDetections *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v11;

    uint64_t v13 = [v9 copy];
    v14 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v13;

    long long v15 = *(_OWORD *)&a5->var0;
    *((void *)v10 + 11) = a5->var3;
    *(_OWORD *)(v10 + 72) = v15;
  }

  return (PTCinematographyFrameDetections *)v10;
}

- (id)detectionForTrackIdentifier:(int64_t)a3
{
  v4 = [(PTCinematographyFrameDetections *)self _detectionsByTrackIdentifier];
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)bestDetectionForGroupIdentifier:(int64_t)a3
{
  return [(PTCinematographyFrameDetections *)self bestDetectionForGroupIdentifier:a3 options:0];
}

- (id)bestDetectionForGroupIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(PTCinematographyFrameDetections *)self detections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (!v7)
  {
    v10 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = v7;
  v10 = 0;
  uint64_t v11 = *(void *)v19;
  *(void *)&long long v8 = 138412546;
  long long v17 = v8;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (objc_msgSend(v13, "groupIdentifier", v17) == a3)
      {
        if ((v4 & 1) != 0 && [v13 _isExcludedAsCinematicChoice])
        {
          v14 = _PTLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            long long v15 = [NSNumber numberWithInteger:a3];
            *(_DWORD *)buf = v17;
            v23 = v13;
            __int16 v24 = 2112;
            v25 = v15;
            _os_log_debug_impl(&dword_1D0778000, v14, OS_LOG_TYPE_DEBUG, "excluding %@ as best detection for group %@", buf, 0x16u);
          }
          goto LABEL_14;
        }
        if (!v10
          || PTDetectionTypeIsBetter([v13 detectionType], -[NSObject detectionType](v10, "detectionType")))
        {
          v14 = v10;
          v10 = v13;
LABEL_14:

          continue;
        }
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  }
  while (v9);
LABEL_19:

  return v10;
}

- (id)detectionForFocusIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PTCinematographyFrameDetections *)self _detectionsByFocusIdentifier];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSArray)allTrackIdentifiers
{
  v2 = [(PTCinematographyFrameDetections *)self _detectionsByTrackIdentifier];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSArray)allTrackIdentifiersForCinematicChoice
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(PTCinematographyFrameDetections *)self allTrackIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(PTCinematographyFrameDetections *)self detectionForTrackIdentifier:PTTrackIDFromNumber(v9)];
        uint64_t v11 = v10;
        if (v10 && ([v10 _isExcludedAsCinematicChoice] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (id)_detectionsByTrackIdentifier
{
  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  if (!cachedDetectionsByTrackIdentifier)
  {
    id v4 = [(PTCinematographyFrameDetections *)self detections];
    uint64_t v5 = +[PTCinematographyDetection _detectionsByTrackIdentifierFromArray:v4];
    uint64_t v6 = self->_cachedDetectionsByTrackIdentifier;
    self->_cachedDetectionsByTrackIdentifier = v5;

    cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  }

  return cachedDetectionsByTrackIdentifier;
}

- (NSArray)allFocusIdentifiers
{
  v2 = [(PTCinematographyFrameDetections *)self _detectionsByFocusIdentifier];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)_detectionsByFocusIdentifier
{
  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  if (!cachedDetectionsByFocusIdentifier)
  {
    id v4 = [(PTCinematographyFrameDetections *)self detections];
    uint64_t v5 = +[PTCinematographyDetection _detectionsByFocusIdentifierFromArray:v4];
    uint64_t v6 = self->_cachedDetectionsByFocusIdentifier;
    self->_cachedDetectionsByFocusIdentifier = v5;

    cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  }

  return cachedDetectionsByFocusIdentifier;
}

- (PTCinematographyDetection)autoFocusDetection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(PTCinematographyFrameDetections *)self didCacheAutoFocusDetection])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(PTCinematographyFrameDetections *)self detections];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v8 isAutoFocusDetection])
          {
            [(PTCinematographyFrameDetections *)self setCachedAutoFocusDetection:v8];
            [(PTCinematographyFrameDetections *)self setDidCacheAutoFocusDetection:1];
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  uint64_t v9 = [(PTCinematographyFrameDetections *)self cachedAutoFocusDetection];

  return (PTCinematographyDetection *)v9;
}

- (PTCinematographyDetection)customDetection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(PTCinematographyFrameDetections *)self didCacheCustomDetection])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(PTCinematographyFrameDetections *)self detections];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v8 isCustomDetection])
          {
            [(PTCinematographyFrameDetections *)self setCachedCustomDetection:v8];
            [(PTCinematographyFrameDetections *)self setDidCacheCustomDetection:1];
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  uint64_t v9 = [(PTCinematographyFrameDetections *)self cachedCustomDetection];

  return (PTCinematographyDetection *)v9;
}

- (void)addDetection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTCinematographyFrameDetections *)self detections];
  id v8 = (id)[v5 mutableCopy];

  [v8 addObject:v4];
  uint64_t v6 = (NSArray *)[v8 copy];
  detections = self->_detections;
  self->_detections = v6;

  [(PTCinematographyFrameDetections *)self flushCachedDetectionsDictionaries];
}

- (void)flushCachedDetectionsDictionaries
{
  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  self->_cachedDetectionsByFocusIdentifier = 0;

  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  self->_cachedDetectionsByTrackIdentifier = 0;
}

- (id)debugDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(PTCinematographyFrameDetections *)self detections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) debugDescription];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  long long v11 = [(PTCinematographyFrameDetections *)self detectorDidRun];
  [(PTCinematographyFrameDetections *)self presentationTime];
  long long v12 = NSStringFromCMTime(&v15);
  long long v13 = [v10 stringWithFormat:@"%@ (DDR:%@, pts:%@)\n%@", self, v11, v12, v3];

  return v13;
}

- (NSArray)detections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)detectorDidRun
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTime
{
  objc_copyStruct(retstr, &self->_presentationTime, 24, 1, 0);
  return result;
}

- (void)setPresentationTime:(id *)a3
{
}

- (NSDictionary)cachedDetectionsByFocusIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)cachedDetectionsByTrackIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)didCacheAutoFocusDetection
{
  return self->_didCacheAutoFocusDetection;
}

- (void)setDidCacheAutoFocusDetection:(BOOL)a3
{
  self->_didCacheAutoFocusDetection = a3;
}

- (PTCinematographyDetection)cachedAutoFocusDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedAutoFocusDetection:(id)a3
{
}

- (BOOL)didCacheCustomDetection
{
  return self->_didCacheCustomDetection;
}

- (void)setDidCacheCustomDetection:(BOOL)a3
{
  self->_didCacheCustomDetection = a3;
}

- (PTCinematographyDetection)cachedCustomDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedCustomDetection:(id)a3
{
}

- (NSNumber)baseFocusTrackNumberOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBaseFocusTrackNumberOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFocusTrackNumberOverride, 0);
  objc_storeStrong((id *)&self->_cachedCustomDetection, 0);
  objc_storeStrong((id *)&self->_cachedAutoFocusDetection, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_detectorDidRun, 0);

  objc_storeStrong((id *)&self->_detections, 0);
}

@end