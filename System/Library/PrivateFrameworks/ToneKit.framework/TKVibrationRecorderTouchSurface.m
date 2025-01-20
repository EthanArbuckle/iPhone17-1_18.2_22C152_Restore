@interface TKVibrationRecorderTouchSurface
- (TKVibrationRecorderTouchSurface)initWithVibrationPatternMaximumDuration:(double)a3 styleProvider:(id)a4;
- (TKVibrationRecorderTouchSurfaceDelegate)delegate;
- (void)_recordTouchLocation:(CGPoint)a3 touchPhase:(int)a4;
- (void)_updateTouchLocationForReplayMode:(id)a3;
- (void)currentVibrationComponentShouldEnd;
- (void)dealloc;
- (void)enterRecordingMode;
- (void)enterReplayModeWithVibrationPattern:(id)a3;
- (void)exitRecordingMode;
- (void)exitReplayMode;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TKVibrationRecorderTouchSurface

- (TKVibrationRecorderTouchSurface)initWithVibrationPatternMaximumDuration:(double)a3 styleProvider:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TKVibrationRecorderTouchSurface;
  v5 = [(TKVibrationRecorderRippleView *)&v9 initWithStyleProvider:a4];
  v6 = v5;
  if (v5)
  {
    [(TKVibrationRecorderTouchSurface *)v5 setMultipleTouchEnabled:0];
    [(TKVibrationRecorderTouchSurface *)v6 setUserInteractionEnabled:1];
    [(TKVibrationRecorderTouchSurface *)v6 setClipsToBounds:1];
    v7 = TLLocalizedString();
    [(TKVibrationRecorderTouchSurface *)v6 setAccessibilityLabel:v7];

    [(TKVibrationRecorderTouchSurface *)v6 setAccessibilityHint:0];
    v6->_vibrationPatternMaximumDuration = a3;
  }
  return v6;
}

- (void)dealloc
{
  [(TKVibrationRecorderTouchSurface *)self exitRecordingMode];
  [(TKVibrationRecorderTouchSurface *)self exitReplayMode];
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderTouchSurface;
  [(TKVibrationRecorderRippleView *)&v3 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v14 = a3;
  v6 = [(TKVibrationRecorderTouchSurface *)self delegate];
  v7 = v6;
  if ((self->_isRecordingModeEnabled
     || self->_isReplayModeEnabled
     || [v6 vibrationRecorderTouchSurfaceDidEnterRecordingMode:self]
     && self->_isRecordingModeEnabled)
    && (!a4 || !v14 || !self->_isReplayModeEnabled))
  {
    v8 = [v14 anyObject];
    objc_super v9 = v8;
    if (v8)
    {
      [v8 locationInView:self];
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      double v11 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
    }
    if (self->_isRecordingModeEnabled)
    {
      self->_shouldIgnoreCurrentTouch = 0;
      -[TKVibrationRecorderTouchSurface _recordTouchLocation:touchPhase:](self, "_recordTouchLocation:touchPhase:", 1, v11, v13);
      -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:", v11, v13);
      [v7 vibrationComponentDidStartForVibrationRecorderTouchSurface:self];
    }
    else
    {
      -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:", v11, v13);
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  BOOL isRecordingModeEnabled = self->_isRecordingModeEnabled;
  if ((self->_isReplayModeEnabled || isRecordingModeEnabled)
    && (!self->_isRecordingModeEnabled || !self->_shouldIgnoreCurrentTouch)
    && (!v23 || !v6 || !self->_isReplayModeEnabled))
  {
    [(TKVibrationRecorderTouchSurface *)self bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    v16 = [v23 anyObject];
    v17 = v16;
    if (v16)
    {
      [v16 locationInView:self];
      double v19 = v18;
      double v21 = v20;
    }
    else
    {
      double v19 = *MEMORY[0x263F00148];
      double v21 = *(double *)(MEMORY[0x263F00148] + 8);
    }
    double Height = 0.0;
    if (v21 >= 0.0)
    {
      v25.origin.x = v9;
      v25.origin.y = v11;
      v25.size.width = v13;
      v25.size.height = v15;
      double Height = v21;
      if (v21 > CGRectGetHeight(v25))
      {
        v26.origin.x = v9;
        v26.origin.y = v11;
        v26.size.width = v13;
        v26.size.height = v15;
        double Height = CGRectGetHeight(v26);
      }
    }
    if (isRecordingModeEnabled) {
      -[TKVibrationRecorderTouchSurface _recordTouchLocation:touchPhase:](self, "_recordTouchLocation:touchPhase:", 2, v19, Height);
    }
    -[TKVibrationRecorderRippleView _touchMovedToLocation:](self, "_touchMovedToLocation:", v19, Height);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  BOOL isRecordingModeEnabled = self->_isRecordingModeEnabled;
  int v8 = self->_isReplayModeEnabled || isRecordingModeEnabled;
  if (self->_isReplayModeEnabled)
  {
    uint64_t v9 = [v19 count];
    if (v6) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    char v11 = !v10;
    if (!v8 || (v11 & 1) != 0) {
      goto LABEL_19;
    }
  }
  else if (!v8)
  {
    goto LABEL_19;
  }
  double v12 = [v19 anyObject];
  CGFloat v13 = v12;
  if (v12)
  {
    [v12 locationInView:self];
    double v15 = v14;
    double v17 = v16;
    if (isRecordingModeEnabled) {
      goto LABEL_14;
    }
  }
  else
  {
    double v15 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
    if (isRecordingModeEnabled)
    {
LABEL_14:
      -[TKVibrationRecorderTouchSurface _recordTouchLocation:touchPhase:](self, "_recordTouchLocation:touchPhase:", 3, v15, v17);
      if (!self->_shouldIgnoreCurrentTouch)
      {
        -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:", v15, v17);
        double v18 = [(TKVibrationRecorderTouchSurface *)self delegate];
        [v18 vibrationComponentDidEndForVibrationRecorderTouchSurface:self];
      }
      goto LABEL_18;
    }
  }
  -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:", v15, v17);
LABEL_18:

LABEL_19:
}

- (void)enterRecordingMode
{
  if (!self->_isRecordingModeEnabled)
  {
    self->_BOOL isRecordingModeEnabled = 1;
    objc_super v3 = [[TKVibrationRecorderTouchSurfaceRecordedDataWrapper alloc] initWithVibrationPatternMaximumDuration:self->_vibrationPatternMaximumDuration];
    recordedDataWrapper = self->_recordedDataWrapper;
    self->_recordedDataWrapper = v3;
    MEMORY[0x270F9A758](v3, recordedDataWrapper);
  }
}

- (void)exitRecordingMode
{
  if (self->_isRecordingModeEnabled)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
    [(TKVibrationRecorderTouchSurface *)self touchesEnded:v5 withEvent:0];
    self->_BOOL isRecordingModeEnabled = 0;
    [(TKVibrationRecorderTouchSurfaceRecordedDataWrapper *)self->_recordedDataWrapper didStopRecording];
    objc_super v3 = [(TKVibrationRecorderTouchSurface *)self delegate];
    [v3 vibrationRecorderTouchSurface:self didExitRecordingModeWithContextObject:self->_recordedDataWrapper];

    recordedDataWrapper = self->_recordedDataWrapper;
    self->_recordedDataWrapper = 0;
  }
}

- (void)currentVibrationComponentShouldEnd
{
  if (self->_isRecordingModeEnabled)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFFA08]);
    [(TKVibrationRecorderTouchSurface *)self touchesEnded:v3 withEvent:0];
    self->_shouldIgnoreCurrentTouch = 1;
  }
}

- (void)_recordTouchLocation:(CGPoint)a3 touchPhase:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  [(TKVibrationRecorderTouchSurface *)self bounds];
  CGFloat v8 = v16.origin.x;
  CGFloat v9 = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v12 = x / CGRectGetWidth(v16);
  v17.origin.double x = v8;
  v17.origin.double y = v9;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v13 = y / CGRectGetHeight(v17);
  recordedDataWrapper = self->_recordedDataWrapper;

  -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:](recordedDataWrapper, "recordNormalizedTouchLocation:touchPhase:", v4, v12, v13);
}

- (void)enterReplayModeWithVibrationPattern:(id)a3
{
  id v5 = a3;
  if (!self->_isReplayModeEnabled)
  {
    self->_isReplayModeEnabled = 1;
    objc_storeStrong((id *)&self->_vibrationPatternToReplay, a3);
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_replayModeWasEnteredStartTime = v6;
    v7 = +[TKDisplayLinkManager currentDisplayLinkManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__TKVibrationRecorderTouchSurface_enterReplayModeWithVibrationPattern___block_invoke;
    v10[3] = &unk_264589D08;
    v10[4] = self;
    CGFloat v8 = [v7 addObserverWithHandler:v10];
    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = v8;
  }
}

uint64_t __71__TKVibrationRecorderTouchSurface_enterReplayModeWithVibrationPattern___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateTouchLocationForReplayMode:a2];
}

- (void)exitReplayMode
{
  if (self->_isReplayModeEnabled)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFFA08]);
    [(TKVibrationRecorderTouchSurface *)self touchesEnded:v6 withEvent:0];
    self->_isReplayModeEnabled = 0;
    vibrationPatternToRepladouble y = self->_vibrationPatternToReplay;
    self->_vibrationPatternToRepladouble y = 0;

    uint64_t v4 = +[TKDisplayLinkManager currentDisplayLinkManager];
    [v4 removeObserverWithToken:self->_displayLinkManagerObserverToken];

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;
  }
}

- (void)_updateTouchLocationForReplayMode:(id)a3
{
  long long v20 = *MEMORY[0x263F00148];
  int v19 = 0;
  objc_msgSend(MEMORY[0x263EFF910], "timeIntervalSinceReferenceDate", a3);
  double v5 = v4 - self->_replayModeWasEnteredStartTime;
  id v6 = [(TLVibrationPattern *)self->_vibrationPatternToReplay contextObject];
  int v7 = [v6 getNormalizedTouchLocation:&v20 touchPhase:&v19 forTimeInterval:v5];

  if (v7)
  {
    if (v19)
    {
      [(TKVibrationRecorderTouchSurface *)self bounds];
      CGFloat x = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
      double v12 = *(double *)&v20;
      double v13 = v12 * CGRectGetWidth(v21);
      double v14 = *((double *)&v20 + 1);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      double v15 = v14 * CGRectGetHeight(v22);
      BOOL v16 = [(TKVibrationRecorderRippleView *)self _isTouchDown];
      if (v19 == 2 && !v16)
      {
        int v19 = 1;
LABEL_6:
        -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:", v13, v15);
        return;
      }
      if (v19 == 1 && v16)
      {
        int v19 = 2;
LABEL_14:
        -[TKVibrationRecorderRippleView _touchMovedToLocation:](self, "_touchMovedToLocation:", v13, v15);
        return;
      }
      switch(v19)
      {
        case 3:
          -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:", v13, v15);
          break;
        case 2:
          goto LABEL_14;
        case 1:
          goto LABEL_6;
      }
    }
  }
  else
  {
    [(TKVibrationRecorderTouchSurface *)self exitReplayMode];
    CGRect v17 = [(TKVibrationRecorderTouchSurface *)self delegate];
    [v17 vibrationRecorderTouchSurfaceDidFinishReplayingVibration:self];
  }
}

- (TKVibrationRecorderTouchSurfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKVibrationRecorderTouchSurfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_vibrationPatternToReplay, 0);

  objc_storeStrong((id *)&self->_recordedDataWrapper, 0);
}

@end