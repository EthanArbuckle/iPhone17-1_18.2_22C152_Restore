@interface PTCinematographyRefinement
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeDelayForRefinement;
- (BOOL)_needSnapshotForPolicy:(unint64_t)a3;
- (BOOL)shouldReturnAllCachedFrames;
- (NSMutableArray)frames;
- (NSMutableDictionary)globals;
- (NSNumber)refinedFrameNumber;
- (PTCinematographyFrameDetectionSmoother)smoother;
- (PTCinematographyRefinement)init;
- (PTCinematographyRefinement)initWithOptions:(id)a3;
- (PTCinematographyRefinementOptions)options;
- (id)_extractFramesReturningAll:(BOOL)a3;
- (id)_extractFramesToIndex:(unint64_t)a3;
- (id)globalCinematographyDictionary;
- (id)refinedFrames;
- (unint64_t)_framesIndexForTime:(id *)a3;
- (unint64_t)firstIndexToLookForTransitions;
- (unint64_t)recordingState;
- (void)_endSmoothedFrames;
- (void)_logRackFocusPullToFrameAtIndex:(unint64_t)a3 fromIndex:(unint64_t)a4 label:(id)a5;
- (void)_moveAlongSmoothedFrames;
- (void)_performLinearRackFocusPullToFrameAtIndex:(unint64_t)a3 fromIndex:(int64_t)a4;
- (void)_performRackFocusPullToFrameAtIndex:(unint64_t)a3;
- (void)_performRackFocusPullsStartingAtIndex:(unint64_t)a3;
- (void)_updateGlobalsWithSnapshot:(id)a3;
- (void)_updateRecordingStateForSnapshot:(id)a3;
- (void)addFrames:(id)a3;
- (void)setFirstIndexToLookForTransitions:(unint64_t)a3;
- (void)setFrames:(id)a3;
- (void)setGlobals:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRecordingState:(unint64_t)a3;
- (void)setRefinedFrameNumber:(id)a3;
- (void)setShouldReturnAllCachedFrames:(BOOL)a3;
- (void)setSmoother:(id)a3;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation PTCinematographyRefinement

- (PTCinematographyRefinement)init
{
  return [(PTCinematographyRefinement *)self initWithOptions:0];
}

- (PTCinematographyRefinement)initWithOptions:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PTCinematographyRefinement;
  v5 = [(PTCinematographyRefinement *)&v24 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = (PTCinematographyRefinementOptions *)objc_opt_new();
    }
    options = v5->_options;
    v5->_options = v8;

    memset(&v23, 0, sizeof(v23));
    CMTimeMake(&v23, 1, 1);
    v10 = [(PTCinematographyRefinementOptions *)v5->_options focusFramesOptions];
    v11 = v10;
    if (v10) {
      [v10 maximumRackFocusPullTime];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTime v20 = v23;
    CMTimeAdd(&v22, &v20, &rhs);
    v5->_timeDelayForRefinement = ($95D729B680665BEAEFA1D6FCA8238556)v22;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    globals = v5->_globals;
    v5->_globals = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    frames = v5->_frames;
    v5->_frames = (NSMutableArray *)v14;

    v5->_shouldReturnAllCachedFrames = 0;
    refinedFrameNumber = v5->_refinedFrameNumber;
    v5->_refinedFrameNumber = (NSNumber *)&unk_1F26C0AF0;
    v5->_firstIndexToLookForTransitions = 0;

    if (![(PTCinematographyRefinementOptions *)v5->_options disableDetectionSmoothing])
    {
      v17 = objc_alloc_init(PTCinematographyFrameDetectionSmoother);
      smoother = v5->_smoother;
      v5->_smoother = v17;
    }
  }

  return v5;
}

- (void)addFrames:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 138412290;
    long long v20 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        v11 = [(PTCinematographyRefinement *)self refinedFrameNumber];

        if (v11)
        {
          uint64_t v12 = [(PTCinematographyRefinement *)self refinedFrameNumber];
          [v10 _setFrameNumber:v12];

          v13 = NSNumber;
          uint64_t v14 = [(PTCinematographyRefinement *)self refinedFrameNumber];
          v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue") + 1);
          [(PTCinematographyRefinement *)self setRefinedFrameNumber:v15];
        }
        if (-[PTCinematographyRefinement _needSnapshotForPolicy:](self, "_needSnapshotForPolicy:", [v10 _snapshotPolicy]))
        {
          v16 = [v10 _snapshot];

          if (v16)
          {
            v17 = [v10 _snapshot];
            [(PTCinematographyRefinement *)self _updateRecordingStateForSnapshot:v17];
          }
          else
          {
            v17 = _PTLogSystem();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = [v10 _frameNumber];
              *(_DWORD *)buf = v20;
              v26 = v18;
              _os_log_impl(&dword_1D0778000, v17, OS_LOG_TYPE_INFO, "warning: snapshot missing from refined frame %@", buf, 0xCu);
            }
          }
        }
        else
        {
          [v10 _setSnapshot:0];
        }
        smoother = self->_smoother;
        if (smoother) {
          [(PTCinematographyFrameDetectionSmoother *)smoother addFrame:v10];
        }
        else {
          [(NSMutableArray *)self->_frames addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }
  if (self->_smoother) {
    [(PTCinematographyRefinement *)self _moveAlongSmoothedFrames];
  }
}

- (void)startRecording
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_1D0778000, v3, OS_LOG_TYPE_INFO, "Cinematography refinement <%p> start recording", (uint8_t *)&v4, 0xCu);
  }

  [(PTCinematographyRefinement *)self setRefinedFrameNumber:&unk_1F26C0AF0];
  [(PTCinematographyRefinement *)self setRecordingState:1];
}

- (void)stopRecording
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_1D0778000, v3, OS_LOG_TYPE_INFO, "Cinematography refinement <%p> stop recording", (uint8_t *)&v4, 0xCu);
  }

  if (self->_smoother) {
    [(PTCinematographyRefinement *)self _endSmoothedFrames];
  }
  [(PTCinematographyRefinement *)self setRecordingState:0];
  self->_shouldReturnAllCachedFrames = 1;
}

- (id)refinedFrames
{
  if ([(NSMutableArray *)self->_frames count])
  {
    [(PTCinematographyRefinement *)self _performRackFocusPullsStartingAtIndex:self->_firstIndexToLookForTransitions];
    v3 = [(PTCinematographyRefinement *)self _extractFramesReturningAll:self->_shouldReturnAllCachedFrames];
    if ([(NSMutableArray *)self->_frames count]) {
      unint64_t v4 = [(NSMutableArray *)self->_frames count] - 1;
    }
    else {
      unint64_t v4 = 0;
    }
    self->_firstIndexToLookForTransitions = v4;
    self->_shouldReturnAllCachedFrames = 0;
    uint64_t v5 = _PTLogSystem();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6) {
      +[PTCinematographyFrame _debugLogFrames:v3 label:@"Refined Cinematography"];
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)globalCinematographyDictionary
{
  v2 = [(PTCinematographyRefinement *)self globals];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)_moveAlongSmoothedFrames
{
  if ([(PTCinematographyFrameDetectionSmoother *)self->_smoother isNextFrameAvailable])
  {
    do
    {
      v3 = [(PTCinematographyFrameDetectionSmoother *)self->_smoother nextFrame];
      [(NSMutableArray *)self->_frames addObject:v3];
    }
    while ([(PTCinematographyFrameDetectionSmoother *)self->_smoother isNextFrameAvailable]);
  }
}

- (void)_endSmoothedFrames
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "error: frames in smoother after recording stopped", v1, 2u);
}

- (void)_performRackFocusPullsStartingAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_frames count] >= a3 + 2)
  {
    uint64_t v5 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a3];
    uint64_t v6 = [v5 focusTrackIdentifier];

    unint64_t v7 = a3 + 1;
    unint64_t v8 = [(NSMutableArray *)self->_frames count];
    while (v7 < v8)
    {
      uint64_t v9 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:v7];
      uint64_t v10 = [v9 focusTrackIdentifier];

      if (v10 != v6) {
        [(PTCinematographyRefinement *)self _performRackFocusPullToFrameAtIndex:v7];
      }
      ++v7;
      unint64_t v8 = [(NSMutableArray *)self->_frames count];
      uint64_t v6 = v10;
    }
  }
}

- (void)_performRackFocusPullToFrameAtIndex:(unint64_t)a3
{
  uint64_t v5 = [PTCinematographyFocusFrames alloc];
  frames = self->_frames;
  unint64_t v7 = [(PTCinematographyRefinementOptions *)self->_options focusFramesOptions];
  uint64_t v9 = [(PTCinematographyFocusFrames *)v5 initWithFrames:frames options:v7];

  uint64_t v8 = [(PTCinematographyFocusFrames *)v9 startIndexForLinearRackFocusPullToFrameAtIndex:a3];
  [(PTCinematographyRefinement *)self _logRackFocusPullToFrameAtIndex:a3 fromIndex:v8 label:@"linear rack focus"];
  [(PTCinematographyRefinement *)self _performLinearRackFocusPullToFrameAtIndex:a3 fromIndex:v8];
}

- (void)_logRackFocusPullToFrameAtIndex:(unint64_t)a3 fromIndex:(unint64_t)a4 label:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = _PTLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v21 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a4];
    long long v20 = [v21 _frameNumber];
    uint64_t v18 = [v20 longValue];
    v19 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a4];
    uint64_t v10 = [v19 focusDetection];
    v11 = [v10 focusIdentifier];
    uint64_t v12 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a3];
    v13 = [v12 _frameNumber];
    uint64_t v14 = [v13 longValue];
    v15 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a3];
    v16 = [v15 focusDetection];
    v17 = [v16 focusIdentifier];
    *(_DWORD *)buf = 138413314;
    id v23 = v8;
    __int16 v24 = 2048;
    uint64_t v25 = v18;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2048;
    uint64_t v29 = v14;
    __int16 v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_1D0778000, v9, OS_LOG_TYPE_INFO, "Cinematography %@ from frame %ld (%@) to frame %ld (%@)", buf, 0x34u);
  }
}

- (void)_performLinearRackFocusPullToFrameAtIndex:(unint64_t)a3 fromIndex:(int64_t)a4
{
  unint64_t v7 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a4];
  id v8 = v7;
  if (v7) {
    [v7 time];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  uint64_t v10 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a3];
  v11 = v10;
  if (v10) {
    [v10 time];
  }
  else {
    memset(&v37, 0, sizeof(v37));
  }
  double v12 = CMTimeGetSeconds(&v37);

  v13 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a4];
  [v13 focusDistance];
  float v15 = v14;

  v16 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:a3];
  [v16 focusDistance];
  float v18 = v17;

  unint64_t v20 = a4 + 1;
  if (v20 < a3)
  {
    float v21 = Seconds;
    float v22 = v12;
    float v23 = v22 - v21;
    *(float *)&double v19 = v18 - v15;
    do
    {
      __int16 v24 = -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v20, v19);
      uint64_t v25 = v24;
      if (v24) {
        [v24 time];
      }
      else {
        memset(&v36, 0, sizeof(v36));
      }
      float v26 = CMTimeGetSeconds(&v36);

      float v27 = v26 - v21;
      __int16 v28 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:v20];
      *(float *)&double v29 = v15 + (float)((float)((float)(v18 - v15) / v23) * v27);
      [v28 setFocusDistance:v29];

      __int16 v30 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:v20];
      *(float *)&double v31 = v27 / v23;
      [v30 setTransitionCoefficient:v31];

      uint64_t v32 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:v20];
      *(float *)&double v33 = v27;
      [v32 setTransitionElapsedTime:v33];

      v34 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:v20];
      *(float *)&double v35 = v23;
      [v34 setTransitionDuration:v35];

      ++v20;
    }
    while (a3 != v20);
  }
}

- (id)_extractFramesReturningAll:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(NSMutableArray *)self->_frames count];
  }
  else
  {
    memset(&v14, 0, sizeof(v14));
    uint64_t v5 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:[(NSMutableArray *)self->_frames count] - 1];
    uint64_t v6 = v5;
    if (v5) {
      [v5 time];
    }
    else {
      memset(&v14, 0, sizeof(v14));
    }

    memset(&v13, 0, sizeof(v13));
    unint64_t v7 = [(PTCinematographyRefinementOptions *)self->_options focusFramesOptions];
    id v8 = v7;
    if (v7) {
      [v7 maximumRackFocusPullTime];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTime v11 = v14;
    CMTimeSubtract(&v13, &v11, &rhs);

    CMTime v11 = v13;
    uint64_t v4 = [(PTCinematographyRefinement *)self _framesIndexForTime:&v11];
  }
  uint64_t v9 = [(PTCinematographyRefinement *)self _extractFramesToIndex:v4];

  return v9;
}

- (id)_extractFramesToIndex:(unint64_t)a3
{
  uint64_t v5 = -[NSMutableArray subarrayWithRange:](self->_frames, "subarrayWithRange:", 0, a3);
  -[NSMutableArray removeObjectsInRange:](self->_frames, "removeObjectsInRange:", 0, a3);

  return v5;
}

- (unint64_t)_framesIndexForTime:(id *)a3
{
  if (![(NSMutableArray *)self->_frames count]) {
    return 0;
  }
  unint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = [(NSMutableArray *)self->_frames objectAtIndexedSubscript:v5];
    unint64_t v7 = v6;
    if (v6) {
      [v6 time];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
    int32_t v8 = CMTimeCompare(&time1, (CMTime *)&v10);

    if ((v8 & 0x80000000) == 0) {
      break;
    }
    if (++v5 >= [(NSMutableArray *)self->_frames count]) {
      return 0;
    }
  }
  return v5;
}

- (BOOL)_needSnapshotForPolicy:(unint64_t)a3
{
  if (a3 == 2) {
    return 0;
  }
  if (a3) {
    return 1;
  }
  return [(PTCinematographyRefinement *)self recordingState] == 1;
}

- (void)_updateRecordingStateForSnapshot:(id)a3
{
  id v4 = a3;
  if ([(PTCinematographyRefinement *)self recordingState] == 1)
  {
    [(PTCinematographyRefinement *)self setRecordingState:2];
    [(PTCinematographyRefinement *)self _updateGlobalsWithSnapshot:v4];
  }
}

- (void)_updateGlobalsWithSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(PTCinematographyRefinement *)self globals];
  [v5 addEntriesFromDictionary:v4];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeDelayForRefinement
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (PTCinematographyRefinementOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSMutableDictionary)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
}

- (PTCinematographyFrameDetectionSmoother)smoother
{
  return self->_smoother;
}

- (void)setSmoother:(id)a3
{
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (NSNumber)refinedFrameNumber
{
  return self->_refinedFrameNumber;
}

- (void)setRefinedFrameNumber:(id)a3
{
}

- (unint64_t)firstIndexToLookForTransitions
{
  return self->_firstIndexToLookForTransitions;
}

- (void)setFirstIndexToLookForTransitions:(unint64_t)a3
{
  self->_firstIndexToLookForTransitions = a3;
}

- (unint64_t)recordingState
{
  return self->_recordingState;
}

- (void)setRecordingState:(unint64_t)a3
{
  self->_recordingState = a3;
}

- (BOOL)shouldReturnAllCachedFrames
{
  return self->_shouldReturnAllCachedFrames;
}

- (void)setShouldReturnAllCachedFrames:(BOOL)a3
{
  self->_shouldReturnAllCachedFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinedFrameNumber, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_smoother, 0);
  objc_storeStrong((id *)&self->_globals, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end