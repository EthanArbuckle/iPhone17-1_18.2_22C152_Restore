@interface TKVibrationRecorderTouchSurfaceRecordedDataWrapper
- (BOOL)getNormalizedTouchLocation:(CGPoint *)a3 touchPhase:(int *)a4 forTimeInterval:(double)a5;
- (TKVibrationRecorderTouchSurfaceRecordedDataWrapper)initWithVibrationPatternMaximumDuration:(double)a3;
- (void)_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:(double)a3;
- (void)_recordFinalDataWithNormalizedTouchLocation:(CGPoint)a3 touchPhase:(int)a4 timeIntervalSinceBeginningOfPattern:(double)a5;
- (void)_updateMaximumFramesPerSecondRate:(id)a3;
- (void)dealloc;
- (void)didStopRecording;
- (void)recordNormalizedTouchLocation:(CGPoint)a3 touchPhase:(int)a4;
@end

@implementation TKVibrationRecorderTouchSurfaceRecordedDataWrapper

- (TKVibrationRecorderTouchSurfaceRecordedDataWrapper)initWithVibrationPatternMaximumDuration:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TKVibrationRecorderTouchSurfaceRecordedDataWrapper;
  v4 = [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_vibrationPatternMaximumDuration = a3;
    v4->_maximumFramesPerSecondRate = 60;
    v4->_isWarmUpModeEnabled = 1;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v5->_warmUpModeDidStartTimestamp = v6;
    v7 = +[TKDisplayLinkManager currentDisplayLinkManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__TKVibrationRecorderTouchSurfaceRecordedDataWrapper_initWithVibrationPatternMaximumDuration___block_invoke;
    v12[3] = &unk_264589D08;
    v8 = v5;
    v13 = v8;
    uint64_t v9 = [v7 addObserverWithHandler:v12];
    displayLinkManagerObserverToken = v8->_displayLinkManagerObserverToken;
    v8->_displayLinkManagerObserverToken = (NSCopying *)v9;
  }
  return v5;
}

uint64_t __94__TKVibrationRecorderTouchSurfaceRecordedDataWrapper_initWithVibrationPatternMaximumDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateMaximumFramesPerSecondRate:a2];
}

- (void)dealloc
{
  recordedData = self->_recordedData;
  if (recordedData) {
    free(recordedData);
  }
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationRecorderTouchSurfaceRecordedDataWrapper;
  [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)&v4 dealloc];
}

- (void)_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:(double)a3
{
  size_t v4 = vcvtpd_u64_f64((double)self->_maximumFramesPerSecondRate * a3);
  recordedData = self->_recordedData;
  if (recordedData)
  {
    if (self->_recordedDataElementsCount < v4)
    {
      double v6 = (char *)malloc_type_realloc(recordedData, 32 * v4, 0x1000040CA85BC40uLL);
      self->_recordedData = v6;
      bzero(&v6[32 * self->_recordedDataElementsCount], 32 * (v4 - self->_recordedDataElementsCount));
      self->_recordedDataElementsCount = v4;
    }
  }
  else
  {
    self->_recordedData = malloc_type_calloc(v4, 0x20uLL, 0x1000040CA85BC40uLL);
    self->_recordedDataElementsCount = v4;
    self->_recordedDataCursor = 0;
  }
}

- (void)_recordFinalDataWithNormalizedTouchLocation:(CGPoint)a3 touchPhase:(int)a4 timeIntervalSinceBeginningOfPattern:(double)a5
{
  uint64_t v5 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  double maximumFramesPerSecondRate = (double)self->_maximumFramesPerSecondRate;
  unint64_t v10 = vcvtmd_u64_f64(maximumFramesPerSecondRate * a5);
  unint64_t recordedDataElementsCount = self->_recordedDataElementsCount;
  if (recordedDataElementsCount <= v10)
  {
    double v17 = (double)recordedDataElementsCount / maximumFramesPerSecondRate
        + (double)recordedDataElementsCount / maximumFramesPerSecondRate;
    if (v17 < a5) {
      double v17 = a5 + a5;
    }
    [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)self _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:v17];
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:](self, "_recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:", v5, x, y, a5);
  }
  else
  {
    v12 = (char *)self->_recordedData + 32 * v10;
    *(double *)v12 = x;
    *((void *)v12 + 1) = *(void *)&a3.y;
    *((_DWORD *)v12 + 4) = a4;
    *((void *)v12 + 3) = v10;
    if (v10)
    {
      unint64_t recordedDataCursor = self->_recordedDataCursor;
      objc_super v14 = (unint64_t *)(v12 - 8);
      unint64_t v15 = v10;
      do
      {
        if (*v14) {
          break;
        }
        *objc_super v14 = recordedDataCursor;
        v14 -= 4;
        --v15;
      }
      while (v15);
    }
    self->_unint64_t recordedDataCursor = v10;
  }
}

- (void)recordNormalizedTouchLocation:(CGPoint)a3 touchPhase:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v9 = v8;
  double vibrationPatternDidStartTimestamp = self->_vibrationPatternDidStartTimestamp;
  if (vibrationPatternDidStartTimestamp < 2.22044605e-16)
  {
    self->_double vibrationPatternDidStartTimestamp = v9;
    double vibrationPatternDidStartTimestamp = v9;
  }
  if (!self->_recordedData)
  {
    [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)self _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:self->_vibrationPatternMaximumDuration * 1.2];
    double vibrationPatternDidStartTimestamp = self->_vibrationPatternDidStartTimestamp;
  }
  double v11 = v9 - vibrationPatternDidStartTimestamp;
  if (v11 >= 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }
  if (self->_isWarmUpModeEnabled)
  {
    unint64_t recordedDataCursor = self->_recordedDataCursor;
    p_unint64_t recordedDataCursor = (uint64_t *)&self->_recordedDataCursor;
    unint64_t v13 = recordedDataCursor;
    uint64_t v16 = *(p_recordedDataCursor - 2);
    unint64_t v17 = 32 * *(p_recordedDataCursor - 1) / 0x28uLL;
    if (recordedDataCursor >= v17)
    {
      v18 = TLLogGeneral();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

      if (v19)
      {
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Vibrations/Recorder/Touch-Surface/TKVibrationRecorderTouchSurfaceRecordedDataWrapper.m"];
        v21 = TLLogGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v20 lastPathComponent];
          v23 = [MEMORY[0x263F08B88] callStackSymbols];
          int v26 = 136381443;
          v27 = "-[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:]";
          __int16 v28 = 2113;
          v29 = v22;
          __int16 v30 = 2049;
          uint64_t v31 = 143;
          __int16 v32 = 2113;
          v33 = v23;
          _os_log_impl(&dword_22107E000, v21, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v26, 0x2Au);
        }
      }
      else
      {
        v20 = TLLogGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:](v20);
        }
      }

      v24 = TLLogGeneral();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:](p_recordedDataCursor, v24);
      }

      unint64_t v13 = *p_recordedDataCursor;
    }
    if (v13 < v17)
    {
      uint64_t v25 = v16 + 40 * v13;
      *(double *)uint64_t v25 = x;
      *(double *)(v25 + 8) = y;
      *(_DWORD *)(v25 + 16) = v4;
      *(_DWORD *)(v25 + 20) = 0;
      *(void *)(v25 + 24) = 0;
      *(double *)(v25 + 32) = v12;
      ++*p_recordedDataCursor;
    }
  }
  else
  {
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:](self, "_recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:", v4, x, y, v12);
  }
}

- (void)didStopRecording
{
  if (self->_displayLinkManagerObserverToken)
  {
    v3 = +[TKDisplayLinkManager currentDisplayLinkManager];
    [v3 removeObserverWithToken:self->_displayLinkManagerObserverToken];

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;
  }
}

- (BOOL)getNormalizedTouchLocation:(CGPoint *)a3 touchPhase:(int *)a4 forTimeInterval:(double)a5
{
  unint64_t v5 = vcvtmd_u64_f64((double)self->_maximumFramesPerSecondRate * a5);
  unint64_t recordedDataCursor = self->_recordedDataCursor;
  if (recordedDataCursor < v5
    || (recordedData = self->_recordedData, unint64_t v8 = recordedData[4 * v5 + 3], v8 > recordedDataCursor))
  {
    int v9 = 0;
    BOOL result = 0;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  double v11 = (char *)&recordedData[4 * v8];
  CGPoint v12 = *(CGPoint *)v11;
  int v9 = *((_DWORD *)v11 + 4);
  BOOL result = 1;
  if (a3) {
LABEL_4:
  }
    *a3 = v12;
LABEL_5:
  if (a4) {
    *a4 = v9;
  }
  return result;
}

- (void)_updateMaximumFramesPerSecondRate:(id)a3
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_isWarmUpModeEnabled)
  {
    if (self->_displayLinkHasRefreshedAtLeastOnce)
    {
      v11[0] = v4;
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      if (v5 - self->_warmUpModeDidStartTimestamp >= 0.5)
      {
        unint64_t recordedDataCursor = self->_recordedDataCursor;
        if (recordedDataCursor)
        {
          memcpy((char *)v11 - ((40 * recordedDataCursor + 15) & 0xFFFFFFFFFFFFFFF0), self->_recordedData, 40 * recordedDataCursor);
          [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)self _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:self->_vibrationPatternMaximumDuration * 1.2];
          bzero(self->_recordedData, 32 * self->_recordedDataElementsCount);
          self->_unint64_t recordedDataCursor = 0;
          int v9 = (double *)((char *)&v11[2] - ((40 * recordedDataCursor + 15) & 0xFFFFFFFFFFFFFFF0));
          do
          {
            -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:](self, "_recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:", *(unsigned int *)v9, *(v9 - 2), *(v9 - 1), v9[2]);
            v9 += 5;
            --recordedDataCursor;
          }
          while (recordedDataCursor);
        }
        else
        {
          [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)self _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:self->_vibrationPatternMaximumDuration * 1.2];
        }
        id v4 = v11[0];
        self->_isWarmUpModeEnabled = 0;
        if (self->_displayLinkManagerObserverToken)
        {
          objc_msgSend(v11[0], "removeObserverWithToken:");
          displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
          self->_displayLinkManagerObserverToken = 0;

          id v4 = v11[0];
        }
      }
      else
      {
        [v11[0] duration];
        id v4 = v11[0];
        unint64_t v7 = vcvtpd_u64_f64(1.0 / v6);
        if (self->_maximumFramesPerSecondRate < v7) {
          self->_double maximumFramesPerSecondRate = v7;
        }
      }
    }
    else
    {
      self->_displayLinkHasRefreshedAtLeastOnce = 1;
    }
  }
}

- (void).cxx_destruct
{
}

- (void)recordNormalizedTouchLocation:(uint64_t *)a1 touchPhase:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22107E000, a2, OS_LOG_TYPE_ERROR, "Couldn't not handle recording touch location in warm up mode with index %lu.", (uint8_t *)&v3, 0xCu);
}

- (void)recordNormalizedTouchLocation:(os_log_t)log touchPhase:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22107E000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", v1, 2u);
}

@end