@interface RCMPDetailScrubController
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)detailedScrubbingEnabled;
- (BOOL)durationAllowsForDetailedScrubbing;
- (BOOL)isTracking;
- (RCMPDetailScrubController)init;
- (RCMPDetailScrubController)initWithScrubbingControl:(id)a3;
- (RCMPDetailScrubControllerDelegate)delegate;
- (RCMPDetailedScrubbing)scrubbingControl;
- (double)duration;
- (double)scrubbingVerticalRange;
- (float)_minimumScale;
- (float)_scaleForIdealValueForVerticalPosition:(double)a3;
- (float)scaleForVerticalPosition:(double)a3;
- (int64_t)currentScrubSpeed;
- (void)_beginScrubbing;
- (void)_beginScrubbingWithValue:(float)a3;
- (void)_calculateAndCommitLocation:(CGPoint)a3 force:(BOOL)a4;
- (void)_commitValue:(float)a3;
- (void)_endScrubbing;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDetailedScrubbingEnabled:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setScrubbingControl:(id)a3;
- (void)setScrubbingVerticalRange:(double)a3;
@end

@implementation RCMPDetailScrubController

- (RCMPDetailScrubController)initWithScrubbingControl:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCMPDetailScrubController;
  v5 = [(RCMPDetailScrubController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrubbingControl, v4);
    v6->_scrubbingVerticalRange = 220.0;
    v6->_detailedScrubbingEnabled = 1;
  }

  return v6;
}

- (RCMPDetailScrubController)init
{
  return 0;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_didBeginTracking = 0;
  p_scrubbingControl = &self->_scrubbingControl;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  [v6 locationInView:WeakRetained];
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_loadWeakRetained((id *)p_scrubbingControl);
  [v12 thumbHitRect];
  v17.x = v9;
  v17.y = v11;
  LODWORD(v6) = CGRectContainsPoint(v18, v17);

  self->_beginLocationInView.x = v9;
  self->_beginLocationInView.y = v11;
  self->_previousLocationInView.x = v9;
  self->_previousLocationInView.y = v11;
  if (v6) {
    [(RCMPDetailScrubController *)self _beginScrubbing];
  }
  else {
    -[RCMPDetailScrubController _calculateAndCommitLocation:force:](self, "_calculateAndCommitLocation:force:", 1, v9, v11);
  }
  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    v14 = (UISelectionFeedbackGenerator *)objc_alloc_init((Class)UISelectionFeedbackGenerator);
    v15 = self->_feedbackGenerator;
    self->_feedbackGenerator = v14;

    feedbackGenerator = self->_feedbackGenerator;
  }
  [(UISelectionFeedbackGenerator *)feedbackGenerator prepare];
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_scrubbingControl = &self->_scrubbingControl;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  [v6 locationInView:WeakRetained];
  double v9 = v8;
  double v11 = v10;

  if (self->_detailedScrubbingEnabled
    && [(RCMPDetailScrubController *)self durationAllowsForDetailedScrubbing])
  {
    [(RCMPDetailScrubController *)self scaleForVerticalPosition:v11];
    double v13 = v12;
    if (v12 <= 0.1)
    {
      int64_t v14 = 3;
    }
    else if (v13 > 0.35 || v13 <= 0.1)
    {
      int64_t v14 = v13 > 0.35 && v12 <= 0.75;
    }
    else
    {
      int64_t v14 = 2;
    }
    if (self->_currentScrubSpeed != v14)
    {
      self->_currentScrubSpeed = v14;
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 detailScrubController:self didChangeScrubSpeed:self->_currentScrubSpeed];
      }
    }
  }
  if (self->_didBeginTracking) {
    goto LABEL_18;
  }
  if (vabdd_f64(self->_beginLocationInView.x, v9) >= 12.0)
  {
    self->_didBeginTracking = 1;
    self->_accumulatedDelta = 0.0;
LABEL_18:
    -[RCMPDetailScrubController _calculateAndCommitLocation:force:](self, "_calculateAndCommitLocation:force:", 0, v9, v11);
    return 1;
  }
  self->_previousLocationInView.x = v9;
  self->_previousLocationInView.y = v11;
  return 1;
}

- (void)_calculateAndCommitLocation:(CGPoint)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = 1.0;
  if (self->_detailedScrubbingEnabled
    && [(RCMPDetailScrubController *)self durationAllowsForDetailedScrubbing])
  {
    [(RCMPDetailScrubController *)self scaleForVerticalPosition:y];
    double v8 = v9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v12 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  double v13 = v12;
  if (isKindOfClass)
  {
    id v14 = v12;
    [v14 bounds];
    [v14 trackRectForBounds:];
    double v48 = v15;
    double v17 = v16;
  }
  else
  {
    [v12 bounds];
    double v48 = v18;
    double v17 = v19;
  }

  double v20 = x - self->_previousLocationInView.x;
  id v21 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v21 maximumValue];
  float v23 = v22;
  id v24 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v24 minimumValue];
  double v26 = (float)(v23 - v25) / v17;

  id v27 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v27 value];
  float v29 = v28;

  double v30 = v29 + v20 * v26 * v8;
  id v31 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v31 minimumValue];
  float v33 = v32;

  id v34 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v34 maximumValue];
  float v36 = v35;

  double v37 = v36;
  if (v30 <= v36) {
    double v37 = v30;
  }
  if (v37 <= v33) {
    double v37 = v33;
  }
  float v38 = v37;
  if (vabds_f32(v38, v29) > 0.00000011921) {
    self->_needsCommit = 1;
  }
  if (v4)
  {
    id v39 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
    [v39 minimumValue];
    float v41 = v40;

    id v42 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
    [v42 maximumValue];
    float v44 = v43;

    double v45 = v44;
    if ((x - v48) * v26 <= v44) {
      double v45 = (x - v48) * v26;
    }
    if (v45 > v41) {
      float v41 = v45;
    }
    if (!self->_isTracking)
    {
      *(float *)&double v45 = v41;
      [(RCMPDetailScrubController *)self _beginScrubbingWithValue:v45];
    }
    self->_needsCommit = 1;
    v46 = self;
    *(float *)&double v45 = v41;
  }
  else
  {
    if (vabdd_f64(self->_lastCommittedLocationInView.x, x) <= 8.0
      && vabdd_f64(self->_lastCommittedLocationInView.y, y) <= 4.0)
    {
      float v47 = v37 - v29 + self->_accumulatedDelta;
      self->_accumulatedDelta = v47;
      goto LABEL_25;
    }
    double v45 = v37 + self->_accumulatedDelta;
    *(float *)&double v45 = v45;
    v46 = self;
  }
  [(RCMPDetailScrubController *)v46 _commitValue:v45];
  self->_accumulatedDelta = 0.0;
  self->_lastCommittedLocationInView.double x = x;
  self->_lastCommittedLocationInView.double y = y;
LABEL_25:
  self->_previousLocationInView.double x = x;
  self->_previousLocationInView.double y = y;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
}

- (void)cancelTrackingWithEvent:(id)a3
{
}

- (BOOL)durationAllowsForDetailedScrubbing
{
  double duration = self->_duration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [WeakRetained bounds];
  BOOL v4 = duration / CGRectGetWidth(v6) >= 0.1;

  return v4;
}

- (float)scaleForVerticalPosition:(double)a3
{
  v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  double scrubbingVerticalRange = self->_scrubbingVerticalRange;
  double v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange >= v8) {
    double scrubbingVerticalRange = v8;
  }
  if (v6 == (id)1) {
    double v9 = 20.0;
  }
  else {
    double v9 = 0.0;
  }
  if (v9 >= scrubbingVerticalRange) {
    double v10 = v9;
  }
  else {
    double v10 = scrubbingVerticalRange;
  }
  double v11 = +[UIDevice currentDevice];
  if ([v11 userInterfaceIdiom] == (id)1) {
    double v12 = 20.0;
  }
  else {
    double v12 = 0.0;
  }
  float v13 = v10 - v12;

  double v14 = v13;
  double v15 = self->_scrubbingVerticalRange;
  double v16 = +[UIDevice currentDevice];
  if ([v16 userInterfaceIdiom] == (id)1) {
    double v17 = 20.0;
  }
  else {
    double v17 = 0.0;
  }
  float v18 = v14 / (v15 - v17);
  float v19 = 1.0 - v18;

  return v19;
}

- (float)_minimumScale
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [WeakRetained bounds];
  float Width = CGRectGetWidth(v8);
  float duration = self->_duration;
  float v6 = (float)(Width / duration) / 20.0;

  return v6;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double scrubbingVerticalRange = self->_scrubbingVerticalRange;
  double v4 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange < v4) {
    double v4 = self->_scrubbingVerticalRange;
  }
  double v5 = v4 + -20.0;
  BOOL v6 = v4 == 20.0;
  BOOL v7 = v4 < 20.0;
  double v8 = 0.0;
  if (!v7 && !v6) {
    double v8 = v5;
  }
  float v9 = v8;
  float v10 = v9 / (scrubbingVerticalRange + -20.0);
  if (v10 <= 0.15)
  {
    float v10 = v10 / 0.15;
    float v11 = 0.33333;
  }
  else
  {
    float v11 = 0.025;
  }
  float v12 = powf(v10, v11);
  if (v12 <= 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = 1.0 - v12;
  }
  if (v13 > 1.0) {
    float v13 = 1.0;
  }
  return fmaxf(v13, 0.0);
}

- (void)_beginScrubbingWithValue:(float)a3
{
  p_scrubbingControl = &self->_scrubbingControl;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = objc_loadWeakRetained((id *)p_scrubbingControl);
    *(float *)&double v9 = a3;
    [v8 setValue:v9];
  }

  [(RCMPDetailScrubController *)self _beginScrubbing];
}

- (void)_beginScrubbing
{
  if (!self->_isTracking)
  {
    self->_isTracking = 1;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 detailScrubController:self didChangeScrubSpeed:0];
    }
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 detailScrubControllerDidBeginScrubbing:self];
    }
  }
}

- (void)_endScrubbing
{
  if (self->_isTracking)
  {
    self->_isTracking = 0;
    self->_currentScrubSpeed = 0;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 detailScrubControllerDidEndScrubbing:self];
    }
  }
}

- (void)_commitValue:(float)a3
{
  if (self->_needsCommit)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      double v9 = self->_duration * a3;
      *(float *)&double v9 = v9;
      [v8 detailScrubController:self didChangeValue:v9];

      self->_needsCommit = 0;
    }
  }
}

- (RCMPDetailedScrubbing)scrubbingControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);

  return (RCMPDetailedScrubbing *)WeakRetained;
}

- (void)setScrubbingControl:(id)a3
{
}

- (RCMPDetailScrubControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCMPDetailScrubControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_float duration = a3;
}

- (double)scrubbingVerticalRange
{
  return self->_scrubbingVerticalRange;
}

- (void)setScrubbingVerticalRange:(double)a3
{
  self->_double scrubbingVerticalRange = a3;
}

- (BOOL)detailedScrubbingEnabled
{
  return self->_detailedScrubbingEnabled;
}

- (void)setDetailedScrubbingEnabled:(BOOL)a3
{
  self->_detailedScrubbingEnabled = a3;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (int64_t)currentScrubSpeed
{
  return self->_currentScrubSpeed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrubbingControl);

  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

@end