@interface MTDetailScrubController
- (BOOL)beginTrackingWithLocation:(CGPoint)a3;
- (BOOL)continueTrackingWithLocation:(CGPoint)a3;
- (BOOL)detailedScrubbingEnabled;
- (BOOL)durationAllowsForDetailedScrubbing;
- (BOOL)isTracking;
- (MTDetailScrubController)init;
- (MTDetailScrubController)initWithScrubbingControl:(id)a3;
- (MTDetailScrubControllerDelegate)delegate;
- (MTDetailedScrubbing)scrubbingControl;
- (double)_minimumScale;
- (double)_scaleForIdealValueForVerticalPosition:(double)a3;
- (double)duration;
- (double)scaleForVerticalPosition:(double)a3;
- (double)scrubbingVerticalRange;
- (int64_t)currentScrubSpeed;
- (void)_beginScrubbing;
- (void)_commitValue:(float)a3;
- (void)_endScrubbing;
- (void)endTrackingWithLocation:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailedScrubbingEnabled:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setScrubbingControl:(id)a3;
- (void)setScrubbingVerticalRange:(double)a3;
@end

@implementation MTDetailScrubController

- (MTDetailScrubController)initWithScrubbingControl:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTDetailScrubController;
  v5 = [(MTDetailScrubController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrubbingControl, v4);
    v6->_scrubbingVerticalRange = 220.0;
    v6->_detailedScrubbingEnabled = 1;
  }

  return v6;
}

- (MTDetailScrubController)init
{
  return 0;
}

- (BOOL)beginTrackingWithLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  self->_didBeginTracking = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [WeakRetained thumbHitRect];
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  BOOL v7 = CGRectContainsPoint(v13, v12);

  if (v7)
  {
    self->_previousLocationInView.CGFloat x = x;
    self->_previousLocationInView.CGFloat y = y;
    self->_beginLocationInView.CGFloat x = x;
    self->_beginLocationInView.CGFloat y = y;
    [(MTDetailScrubController *)self _beginScrubbing];
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      v9 = (UISelectionFeedbackGenerator *)objc_alloc_init((Class)UISelectionFeedbackGenerator);
      v10 = self->_feedbackGenerator;
      self->_feedbackGenerator = v9;

      feedbackGenerator = self->_feedbackGenerator;
    }
    [(UISelectionFeedbackGenerator *)feedbackGenerator prepare];
  }
  return v7;
}

- (BOOL)continueTrackingWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = 1.0;
  if (self->_detailedScrubbingEnabled
    && [(MTDetailScrubController *)self durationAllowsForDetailedScrubbing])
  {
    [(MTDetailScrubController *)self scaleForVerticalPosition:y];
    double v6 = v7;
    if (v7 <= 0.1)
    {
      int64_t v8 = 3;
    }
    else if (v7 > 0.35 || v7 <= 0.1)
    {
      int64_t v8 = v7 > 0.35 && (unint64_t)(v7 <= 0.75);
    }
    else
    {
      int64_t v8 = 2;
    }
    if (self->_currentScrubSpeed != v8)
    {
      self->_currentScrubSpeed = v8;
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        [v11 detailScrubController:self didChangeScrubSpeed:self->_currentScrubSpeed];
      }
    }
  }
  [(MTDetailScrubController *)self _minimumScale];
  if (v12 < v6) {
    double v12 = v6;
  }
  if (!self->_didBeginTracking)
  {
    if (vabdd_f64(self->_beginLocationInView.x, x) < 12.0) {
      goto LABEL_33;
    }
    self->_didBeginTracking = 1;
    self->_accumulatedDelta = 0.0;
  }
  double v13 = fmin(v12, 1.0);
  id v14 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v16 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  v17 = v16;
  if (isKindOfClass)
  {
    id v18 = v16;
    [v18 bounds];
    [v18 trackRectForBounds:];
    double v20 = v19;
  }
  else
  {
    [v16 bounds];
    double v20 = v21;
  }

  double v22 = x - self->_previousLocationInView.x;
  id v23 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v23 maximumValue];
  float v25 = v24;
  id v26 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v26 minimumValue];
  double v28 = (float)(v25 - v27) / v20;

  double v29 = v22 * v28;
  id v30 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v30 value];
  float v32 = v31;

  float v33 = v32 + v29 * v13;
  id v34 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v34 minimumValue];
  float v36 = v35;

  id v37 = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [v37 maximumValue];
  float v39 = v38;

  if (v39 >= v33) {
    *(float *)&double v40 = v33;
  }
  else {
    *(float *)&double v40 = v39;
  }
  if (v36 >= *(float *)&v40) {
    *(float *)&double v40 = v36;
  }
  if (vabds_f32(*(float *)&v40, v32) > 0.00000011921) {
    self->_needsCommit = 1;
  }
  if (vabdd_f64(self->_lastCommittedLocationInView.x, x) <= 1.0
    && vabdd_f64(self->_lastCommittedLocationInView.y, y) <= 4.0)
  {
    self->_accumulatedDelta = (float)(*(float *)&v40 - v32) + self->_accumulatedDelta;
  }
  else
  {
    *(float *)&double v40 = *(float *)&v40 + self->_accumulatedDelta;
    [(MTDetailScrubController *)self _commitValue:v40];
    self->_accumulatedDelta = 0.0;
    self->_lastCommittedLocationInView.double x = x;
    self->_lastCommittedLocationInView.double y = y;
  }
LABEL_33:
  self->_previousLocationInView.double x = x;
  self->_previousLocationInView.double y = y;
  return 1;
}

- (void)endTrackingWithLocation:(CGPoint)a3
{
  double x = a3.x;
  [(MTDetailScrubController *)self _endScrubbing];
  if (vabdd_f64(self->_lastCommittedLocationInView.x, x) > 3.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
    [WeakRetained value];
    -[MTDetailScrubController _commitValue:](self, "_commitValue:");
  }
}

- (BOOL)durationAllowsForDetailedScrubbing
{
  return self->_duration >= 60.0;
}

- (double)scaleForVerticalPosition:(double)a3
{
  v5 = +[UIDevice currentDevice];
  double v6 = (char *)[v5 userInterfaceIdiom];

  double scrubbingVerticalRange = self->_scrubbingVerticalRange;
  double v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange >= v8) {
    double scrubbingVerticalRange = v8;
  }
  if (v6 == (unsigned char *)&dword_0 + 1) {
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
  id v11 = +[UIDevice currentDevice];
  if ([v11 userInterfaceIdiom] == (char *)&dword_0 + 1) {
    double v12 = 20.0;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = v10 - v12;

  double v14 = self->_scrubbingVerticalRange;
  v15 = +[UIDevice currentDevice];
  if ([v15 userInterfaceIdiom] == (char *)&dword_0 + 1) {
    double v16 = 20.0;
  }
  else {
    double v16 = 0.0;
  }
  float v17 = v13 / (v14 - v16);
  double v18 = (float)(1.0 - v17);

  return v18;
}

- (double)_minimumScale
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [WeakRetained bounds];
  double v4 = CGRectGetWidth(v6) / self->_duration / 10.0;

  return v4;
}

- (double)_scaleForIdealValueForVerticalPosition:(double)a3
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
  float v9 = v8 / (scrubbingVerticalRange + -20.0);
  double v10 = v9;
  if (v9 <= 0.15)
  {
    double v10 = v10 / 0.150000006;
    long double v11 = 0.333333333;
  }
  else
  {
    long double v11 = 0.0250000004;
  }
  double v12 = pow(v10, v11);
  if (v12 <= 0.0) {
    double v13 = 1.0;
  }
  else {
    double v13 = 1.0 - v12;
  }
  if (v13 > 1.0) {
    double v13 = 1.0;
  }
  return fmax(v13, 0.0);
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

- (MTDetailedScrubbing)scrubbingControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);

  return (MTDetailedScrubbing *)WeakRetained;
}

- (void)setScrubbingControl:(id)a3
{
}

- (MTDetailScrubControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTDetailScrubControllerDelegate *)WeakRetained;
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
  self->_duration = a3;
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