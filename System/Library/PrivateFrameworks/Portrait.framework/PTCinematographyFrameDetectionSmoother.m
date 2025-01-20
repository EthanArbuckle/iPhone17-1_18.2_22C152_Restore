@interface PTCinematographyFrameDetectionSmoother
- (BOOL)_computeIsNextFrameAvailable;
- (BOOL)didCacheIsNextFrameAvailable;
- (BOOL)didEndFrames;
- (BOOL)isNextFrameAtEnd;
- (BOOL)isNextFrameAvailable;
- (BOOL)isNextFrameAvailableCache;
- (NSMutableArray)frames;
- (NSMutableDictionary)firstFocusSmootherByTrackNumber;
- (PTCinematographyDetection)lastKnownFocusDetection;
- (PTCinematographyFrameDetectionSmoother)init;
- (id)_activeTrackNumbers;
- (id)_focusSmootherForAppendingWithTrackIdentifier:(int64_t)a3;
- (id)_focusSmootherForReadingWithTrackIdentifier:(int64_t)a3;
- (id)_newFocusSmoother;
- (id)nextFrame;
- (void)_dropAllFocusSmoothersIfLeaked;
- (void)_endFocusSmoothersForTrackNumbers:(id)a3;
- (void)_invalidateIsNextFrameAvailableCache;
- (void)_reinit;
- (void)_skipToNextFocusSmootherWithTrackIdentifier:(int64_t)a3;
- (void)_updateFocusDetectionForFrame:(id)a3;
- (void)addFrame:(id)a3;
- (void)endFrames;
- (void)nextFrame;
- (void)setDidCacheIsNextFrameAvailable:(BOOL)a3;
- (void)setDidEndFrames:(BOOL)a3;
- (void)setFirstFocusSmootherByTrackNumber:(id)a3;
- (void)setFrames:(id)a3;
- (void)setIsNextFrameAvailableCache:(BOOL)a3;
- (void)setLastKnownFocusDetection:(id)a3;
@end

@implementation PTCinematographyFrameDetectionSmoother

- (PTCinematographyFrameDetectionSmoother)init
{
  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyFrameDetectionSmoother;
  v2 = [(PTCinematographyFrameDetectionSmoother *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PTCinematographyFrameDetectionSmoother *)v2 _reinit];
  }
  return v3;
}

- (void)_reinit
{
  v3 = (NSMutableArray *)objc_opt_new();
  frames = self->_frames;
  self->_frames = v3;

  lastKnownFocusDetection = self->_lastKnownFocusDetection;
  self->_lastKnownFocusDetection = 0;

  v6 = (NSMutableDictionary *)objc_opt_new();
  firstFocusSmootherByTrackNumber = self->_firstFocusSmootherByTrackNumber;
  self->_firstFocusSmootherByTrackNumber = v6;

  *(_WORD *)&self->_didEndFrames = 0;
}

- (void)addFrame:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_didEndFrames) {
    [(PTCinematographyFrameDetectionSmoother *)self _reinit];
  }
  objc_super v5 = (void *)MEMORY[0x1E4F1CA80];
  v6 = [(PTCinematographyFrameDetectionSmoother *)self _activeTrackNumbers];
  v7 = [v5 setWithArray:v6];

  [(NSMutableArray *)self->_frames addObject:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v17 = v4;
  v8 = [v4 allDetections];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = -[PTCinematographyFrameDetectionSmoother _focusSmootherForAppendingWithTrackIdentifier:](self, "_focusSmootherForAppendingWithTrackIdentifier:", [v13 trackIdentifier]);
        [v13 focusDistance];
        objc_msgSend(v14, "addSample:");
        v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "trackIdentifier"));
        [v7 removeObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v16 = [v7 allObjects];
  [(PTCinematographyFrameDetectionSmoother *)self _endFocusSmoothersForTrackNumbers:v16];

  [(PTCinematographyFrameDetectionSmoother *)self _invalidateIsNextFrameAvailableCache];
}

- (void)endFrames
{
  v3 = [(PTCinematographyFrameDetectionSmoother *)self _activeTrackNumbers];
  [(PTCinematographyFrameDetectionSmoother *)self _endFocusSmoothersForTrackNumbers:v3];

  [(PTCinematographyFrameDetectionSmoother *)self _invalidateIsNextFrameAvailableCache];
  self->_didEndFrames = 1;
}

- (BOOL)isNextFrameAtEnd
{
  if (self->_didEndFrames) {
    return ![(PTCinematographyFrameDetectionSmoother *)self isNextFrameAvailable];
  }
  else {
    return 0;
  }
}

- (BOOL)isNextFrameAvailable
{
  if (self->_didCacheIsNextFrameAvailable) {
    return self->_isNextFrameAvailableCache;
  }
  BOOL result = [(PTCinematographyFrameDetectionSmoother *)self _computeIsNextFrameAvailable];
  self->_isNextFrameAvailableCache = result;
  self->_didCacheIsNextFrameAvailable = 1;
  return result;
}

- (void)_updateFocusDetectionForFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "detectionForTrackIdentifier:", objc_msgSend(v4, "focusTrackIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    [(PTCinematographyFrameDetectionSmoother *)self setLastKnownFocusDetection:v5];
  }
  else
  {
    uint64_t v7 = [(PTCinematographyFrameDetectionSmoother *)self lastKnownFocusDetection];
    if (v7
      && (v8 = (void *)v7,
          [(PTCinematographyFrameDetectionSmoother *)self lastKnownFocusDetection],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 trackIdentifier],
          uint64_t v11 = [v4 focusTrackIdentifier],
          v9,
          v8,
          v10 == v11))
    {
      uint64_t v12 = [(PTCinematographyFrameDetectionSmoother *)self lastKnownFocusDetection];
    }
    else
    {
      v13 = _PTLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(PTCinematographyFrameDetectionSmoother *)v4 _updateFocusDetectionForFrame:v13];
      }

      uint64_t v12 = [v4 focusDetection];
    }
    v6 = (void *)v12;
  }
  [v4 focusOnDetection:v6];
}

- (id)nextFrame
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(PTCinematographyFrameDetectionSmoother *)self isNextFrameAvailable])
  {
    v3 = [(NSMutableArray *)self->_frames firstObject];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = objc_msgSend(v3, "allDetections", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
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
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v9 trackIdentifier];
          uint64_t v11 = [(PTCinematographyFrameDetectionSmoother *)self _focusSmootherForReadingWithTrackIdentifier:v10];
          uint64_t v12 = v11;
          if (v11)
          {
            [v11 nextSmoothedSample];
            objc_msgSend(v9, "setFocusDistance:");
            if ([v12 isEndOfSmoothedSamples]) {
              [(PTCinematographyFrameDetectionSmoother *)self _skipToNextFocusSmootherWithTrackIdentifier:v10];
            }
          }
          else
          {
            v13 = _PTLogSystem();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              [(PTCinematographyFrameDetectionSmoother *)v20 nextFrame];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v6);
    }

    [(PTCinematographyFrameDetectionSmoother *)self _updateFocusDetectionForFrame:v3];
    v14 = [v3 focusDetection];
    [v14 focusDistance];
    objc_msgSend(v3, "setFocusDistance:");

    [(NSMutableArray *)self->_frames removeObjectAtIndex:0];
    [(PTCinematographyFrameDetectionSmoother *)self _invalidateIsNextFrameAvailableCache];
    if (![(NSMutableArray *)self->_frames count]) {
      [(PTCinematographyFrameDetectionSmoother *)self _dropAllFocusSmoothersIfLeaked];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_invalidateIsNextFrameAvailableCache
{
  self->_didCacheIsNextFrameAvailable = 0;
}

- (BOOL)_computeIsNextFrameAvailable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_frames count]) {
    return 0;
  }
  v3 = [(NSMutableArray *)self->_frames firstObject];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "allDetections", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[PTCinematographyFrameDetectionSmoother _focusSmootherForReadingWithTrackIdentifier:](self, "_focusSmootherForReadingWithTrackIdentifier:", [*(id *)(*((void *)&v13 + 1) + 8 * i) trackIdentifier]);
        int v10 = [v9 isSmoothedSampleAvailable];

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (id)_newFocusSmoother
{
  return objc_alloc_init(PTCinematographyFocusSmoother);
}

- (id)_activeTrackNumbers
{
  return (id)[(NSMutableDictionary *)self->_firstFocusSmootherByTrackNumber allKeys];
}

- (id)_focusSmootherForReadingWithTrackIdentifier:(int64_t)a3
{
  if (PTTrackIDIsInvalid(a3))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [(PTCinematographyFrameDetectionSmoother *)self firstFocusSmootherByTrackNumber];
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    uint64_t v5 = [v6 objectForKeyedSubscript:v7];
  }

  return v5;
}

- (void)_skipToNextFocusSmootherWithTrackIdentifier:(int64_t)a3
{
  firstFocusSmootherByTrackNumber = self->_firstFocusSmootherByTrackNumber;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v10 = [(NSMutableDictionary *)firstFocusSmootherByTrackNumber objectForKeyedSubscript:v6];

  uint64_t v7 = [v10 nextFocusSmoother];
  v8 = self->_firstFocusSmootherByTrackNumber;
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
}

- (id)_focusSmootherForAppendingWithTrackIdentifier:(int64_t)a3
{
  if (PTTrackIDIsInvalid(a3))
  {
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  firstFocusSmootherByTrackNumber = self->_firstFocusSmootherByTrackNumber;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  v8 = [(NSMutableDictionary *)firstFocusSmootherByTrackNumber objectForKeyedSubscript:v7];
  uint64_t v5 = [v8 lastFocusSmoother];

  if (v5)
  {
    if (![v5 didEndSamples]) {
      goto LABEL_8;
    }
    id v9 = [(PTCinematographyFrameDetectionSmoother *)self _newFocusSmoother];
    [v5 setNextFocusSmoother:v9];

    id v10 = [v5 nextFocusSmoother];
  }
  else
  {
    id v10 = [(PTCinematographyFrameDetectionSmoother *)self _newFocusSmoother];
    BOOL v11 = self->_firstFocusSmootherByTrackNumber;
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v5];
  }

  uint64_t v5 = v10;
LABEL_8:

  return v5;
}

- (void)_endFocusSmoothersForTrackNumbers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMutableDictionary *)self->_firstFocusSmootherByTrackNumber objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        id v10 = [v9 lastFocusSmoother];

        [v10 endSamples];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_dropAllFocusSmoothersIfLeaked
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "error: focus detection smoothers remain when none expected", v1, 2u);
}

- (NSMutableArray)frames
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFrames:(id)a3
{
}

- (PTCinematographyDetection)lastKnownFocusDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastKnownFocusDetection:(id)a3
{
}

- (NSMutableDictionary)firstFocusSmootherByTrackNumber
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirstFocusSmootherByTrackNumber:(id)a3
{
}

- (BOOL)didEndFrames
{
  return self->_didEndFrames;
}

- (void)setDidEndFrames:(BOOL)a3
{
  self->_didEndFrames = a3;
}

- (BOOL)didCacheIsNextFrameAvailable
{
  return self->_didCacheIsNextFrameAvailable;
}

- (void)setDidCacheIsNextFrameAvailable:(BOOL)a3
{
  self->_didCacheIsNextFrameAvailable = a3;
}

- (BOOL)isNextFrameAvailableCache
{
  return self->_isNextFrameAvailableCache;
}

- (void)setIsNextFrameAvailableCache:(BOOL)a3
{
  self->_isNextFrameAvailableCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFocusSmootherByTrackNumber, 0);
  objc_storeStrong((id *)&self->_lastKnownFocusDetection, 0);

  objc_storeStrong((id *)&self->_frames, 0);
}

- (void)_updateFocusDetectionForFrame:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 focusTrackIdentifier];
  uint64_t v7 = [a1 focusDetection];
  uint64_t v8 = [v7 focusIdentifier];
  id v9 = [a2 lastKnownFocusDetection];
  int v10 = 134218498;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  long long v13 = v8;
  __int16 v14 = 2112;
  long long v15 = v9;
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "hanging focus track id %ld (%@?) with mismatching last known detection: %@", (uint8_t *)&v10, 0x20u);
}

- (void)nextFrame
{
  uint64_t v7 = [NSNumber numberWithInteger:a2];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0778000, a4, OS_LOG_TYPE_ERROR, "error: attempt to read from nonexistent focus smoother for track %@", a1, 0xCu);
}

@end