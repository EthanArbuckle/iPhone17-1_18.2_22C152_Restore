@interface SBTouchTemplateGestureRecognizer
- (BOOL)_directionallyAcceptMotion:(double)a3;
- (BOOL)_shouldAddNewTouchesAfterGestureRecognition;
- (BOOL)hasSignificantMotionToBegin;
- (NSMapTable)_initialTouchPointMap;
- (NSMutableDictionary)templatesForTouchType;
- (NSTimer)_noChangeCancellationTimer;
- (SBPolygon)_matchedPolygon;
- (SBTouchTemplate)_matchedTemplate;
- (SBTouchTemplateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIGestureRecognizerTransformAnalyzer)transformAnalyzer;
- (double)_cumulativeMotion;
- (double)_cumulativeMotionEnvelope;
- (double)_projectedMotionForInterval:(double)a3;
- (double)_smoothedIncrementalMotion;
- (double)animationDistance;
- (double)cumulativePercentage;
- (double)incrementalGestureMotionForCandidate:(id)a3 withTransformAnalyzerInfo:(id)a4;
- (id)_matchedTemplateForTouches:(id)a3 polygon:(id)a4;
- (id)_polygonForTouches:(id)a3;
- (id)_touchesByFilteringRestingTrackpadTouches:(id)a3;
- (id)logCategory;
- (id)templatesForTouchType:(int64_t)a3;
- (int64_t)projectedCompletionTypeForInterval:(double)a3;
- (int64_t)requiredDirectionality;
- (unint64_t)_failedRecognitionAttempts;
- (unint64_t)_trackingTouchCount;
- (unint64_t)sequenceNumber;
- (void)_attemptTemplateMatchWithTouches:(id)a3 polygon:(id)a4;
- (void)_computeGestureMotionWithTouches:(id)a3 polygon:(id)a4;
- (void)_failMeForReason:(id)a3;
- (void)_invalidateNoChangeCancellationTimer;
- (void)_log:(id)a3;
- (void)_noChangeCancellationTimerFired:(id)a3;
- (void)_pingNoChangeCancellationTimer;
- (void)_reset;
- (void)_resetNoChangeCancellationTimer;
- (void)_setCumulativeMotion:(double)a3;
- (void)_setCumulativeMotionEnvelope:(double)a3;
- (void)_setFailedRecognitionAttempts:(unint64_t)a3;
- (void)_setMatchedPolygon:(id)a3;
- (void)_setMatchedTemplate:(id)a3;
- (void)_setNoChangeCancellationTimer:(id)a3;
- (void)_setSmoothedIncrementalMotion:(double)a3;
- (void)_setTrackingTouchCount:(unint64_t)a3;
- (void)_updateForTouchesBeganOrMoved:(id)a3;
- (void)_updateForTouchesCancelledOrEnded:(id)a3 state:(int64_t)a4 withEvent:(id)a5;
- (void)_updateMatchedTemplateForTouchesBeganOrEnded:(id)a3;
- (void)log:(id)a3;
- (void)reset;
- (void)setAnimationDistance:(double)a3;
- (void)setRequiredDirectionality:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setTemplates:(id)a3 forTouchType:(int64_t)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBTouchTemplateGestureRecognizer

- (SBTouchTemplateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBTouchTemplateGestureRecognizer;
  v4 = [(SBTouchTemplateGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_sequenceNumber = 1;
    v6 = objc_alloc_init(UIGestureRecognizerTransformAnalyzer);
    transformAnalyzer = v5->_transformAnalyzer;
    v5->_transformAnalyzer = v6;
  }
  return v5;
}

- (double)cumulativePercentage
{
  if (![(SBTouchTemplateGestureRecognizer *)self state]) {
    return 0.0;
  }
  double cumulativeMotion = self->_cumulativeMotion;
  [(SBTouchTemplateGestureRecognizer *)self animationDistance];
  return cumulativeMotion / v4;
}

- (int64_t)projectedCompletionTypeForInterval:(double)a3
{
  [(SBTouchTemplateGestureRecognizer *)self animationDistance];
  double v6 = v5;
  [(SBTouchTemplateGestureRecognizer *)self _projectedMotionForInterval:a3];
  double v8 = v7;
  BOOL v9 = -[SBTouchTemplateGestureRecognizer _directionallyAcceptMotion:](self, "_directionallyAcceptMotion:");
  double v10 = fabs(v8);
  double v11 = fabs(self->_cumulativeMotionEnvelope) * 0.899999976;
  int v12 = !v9;
  if (v10 <= v6 * 0.5) {
    int v12 = 1;
  }
  if (v10 <= v11) {
    int v12 = 1;
  }
  if (v8 * self->_cumulativeMotion < 0.0) {
    int v12 = 1;
  }
  if (v12) {
    return -1;
  }
  else {
    return 1;
  }
}

- (void)log:(id)a3
{
  id v4 = a3;
  double v5 = SBLogSystemGesture();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    double v7 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v8];
    [(SBTouchTemplateGestureRecognizer *)self _log:v7];
  }
}

- (void)_log:(id)a3
{
  id v4 = a3;
  double v5 = [(SBTouchTemplateGestureRecognizer *)self logCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SBTouchTemplateGestureRecognizer *)(uint64_t)self _log:v5];
  }
}

- (void)setTemplates:(id)a3 forTouchType:(int64_t)a4
{
  id v10 = a3;
  templatesForTouchType = self->_templatesForTouchType;
  if (!templatesForTouchType)
  {
    double v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = self->_templatesForTouchType;
    self->_templatesForTouchType = v7;

    templatesForTouchType = self->_templatesForTouchType;
  }
  BOOL v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)templatesForTouchType setObject:v10 forKey:v9];
}

- (id)templatesForTouchType:(int64_t)a3
{
  templatesForTouchType = self->_templatesForTouchType;
  id v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)templatesForTouchType objectForKey:v4];

  return v5;
}

- (BOOL)hasSignificantMotionToBegin
{
  BOOL v3 = [(SBTouchTemplateGestureRecognizer *)self _directionallyAcceptMotion:self->_cumulativeMotion];
  if (!v3)
  {
    id v4 = SBLogSystemGesture();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5) {
      [(SBTouchTemplateGestureRecognizer *)self log:@"hasSignificantMotionToBegin is NO because it hasn't been directionally accepted for required direction: %d cumulativeMotion: %f", [(SBTouchTemplateGestureRecognizer *)self requiredDirectionality], *(void *)&self->_cumulativeMotion];
    }
  }
  return v3;
}

- (double)incrementalGestureMotionForCandidate:(id)a3 withTransformAnalyzerInfo:(id)a4
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"SBTouchTemplateGestureRecognizer.m" lineNumber:128 description:@"Subclasses must override this function"];

  return 0.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_trackingTouchCount += [v6 count];
  uint64_t v8 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplate];

  if (!v8) {
    goto LABEL_4;
  }
  if ([(SBTouchTemplateGestureRecognizer *)self _shouldAddNewTouchesAfterGestureRecognition])
  {
    BOOL v9 = [v7 touchesForGestureRecognizer:self];
    id v10 = (void *)[v9 mutableCopy];

    [v10 unionSet:v6];
    [(SBTouchTemplateGestureRecognizer *)self _updateMatchedTemplateForTouchesBeganOrEnded:v10];

LABEL_4:
    double v11 = [v6 anyObject];
    uint64_t v12 = [v11 type];

    if (v12 != 1) {
      [(SBTouchTemplateGestureRecognizer *)self _pingNoChangeCancellationTimer];
    }
    v13 = [v7 touchesForGestureRecognizer:self];
    [(SBTouchTemplateGestureRecognizer *)self _updateForTouchesBeganOrMoved:v13];

    goto LABEL_10;
  }
  v14 = SBLogSystemGesture();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

  if (v15) {
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", @"%s - Got another touch but we're already matching, so ignore this one", "-[SBTouchTemplateGestureRecognizer touchesBegan:withEvent:]");
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__SBTouchTemplateGestureRecognizer_touchesBegan_withEvent___block_invoke;
  v16[3] = &unk_1E6B067C0;
  v16[4] = self;
  id v17 = v7;
  [v6 enumerateObjectsUsingBlock:v16];

LABEL_10:
}

uint64_t __59__SBTouchTemplateGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) ignoreTouch:a2 forEvent:*(void *)(a1 + 40)];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = [a4 touchesForGestureRecognizer:self];
  [(SBTouchTemplateGestureRecognizer *)self _updateForTouchesBeganOrMoved:v5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplate];

  if (v7)
  {
    uint64_t v8 = [v6 touchesForGestureRecognizer:self];
    BOOL v9 = (void *)[v8 mutableCopy];

    [v9 minusSet:v11];
    id v10 = [(SBTouchTemplateGestureRecognizer *)self _polygonForTouches:v9];
    [(SBTouchTemplateGestureRecognizer *)self _computeGestureMotionWithTouches:v9 polygon:v10];
    [(SBTouchTemplateGestureRecognizer *)self _updateMatchedTemplateForTouchesBeganOrEnded:v9];
  }
  [(SBTouchTemplateGestureRecognizer *)self _updateForTouchesCancelledOrEnded:v11 state:3 withEvent:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 touchesForGestureRecognizer:self];
  id v9 = (id)[v8 mutableCopy];

  [v9 minusSet:v7];
  [(SBTouchTemplateGestureRecognizer *)self _updateForTouchesBeganOrMoved:v9];
  [(SBTouchTemplateGestureRecognizer *)self _updateForTouchesCancelledOrEnded:v7 state:4 withEvent:v6];
}

- (void)reset
{
  [(SBTouchTemplateGestureRecognizer *)self _reset];
  v3.receiver = self;
  v3.super_class = (Class)SBTouchTemplateGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v3 reset];
}

- (void)setState:(int64_t)a3
{
  if ([(SBTouchTemplateGestureRecognizer *)self state] != a3)
  {
    id v5 = SBLogSystemGesture();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      id v7 = SBSystemGestureRecognizerStateDescription(a3);
      [(SBTouchTemplateGestureRecognizer *)self log:@"Recognizer changing state to %@", v7];
    }
    if (a3 == 1)
    {
      self->_recognitionBegan = 1;
      uint64_t v8 = SBLogSystemGesture();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

      if (v9) {
        [(SBTouchTemplateGestureRecognizer *)self log:@"Beginning gesture recognition sequence number %lu", self->_sequenceNumber];
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SBTouchTemplateGestureRecognizer;
  [(SBTouchTemplateGestureRecognizer *)&v10 setState:a3];
}

- (void)_pingNoChangeCancellationTimer
{
  noChangeCancellationTimer = self->_noChangeCancellationTimer;
  if (noChangeCancellationTimer)
  {
    if (![(NSTimer *)noChangeCancellationTimer isValid]) {
      return;
    }
    id v4 = self->_noChangeCancellationTimer;
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.2];
    -[NSTimer setFireDate:](v4, "setFireDate:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__noChangeCancellationTimerFired_ selector:0 userInfo:0 repeats:0.2];
    BOOL v6 = self->_noChangeCancellationTimer;
    self->_noChangeCancellationTimer = v5;

    id v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v7 addTimer:self->_noChangeCancellationTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_invalidateNoChangeCancellationTimer
{
}

- (void)_resetNoChangeCancellationTimer
{
  [(NSTimer *)self->_noChangeCancellationTimer invalidate];
  noChangeCancellationTimer = self->_noChangeCancellationTimer;
  self->_noChangeCancellationTimer = 0;
}

- (void)_noChangeCancellationTimerFired:(id)a3
{
  if (![(SBTouchTemplateGestureRecognizer *)self state])
  {
    [(SBTouchTemplateGestureRecognizer *)self _failMeForReason:@"No change cancellation timer fired."];
  }
}

- (id)_polygonForTouches:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBTouchTemplateGestureRecognizer__polygonForTouches___block_invoke;
  v9[3] = &unk_1E6B067E8;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateObjectsUsingBlock:v9];

  if ([v6 count]) {
    id v7 = [[SBPolygon alloc] initWithPoints:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __55__SBTouchTemplateGestureRecognizer__polygonForTouches___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)MEMORY[0x1E4F29238];
  [a2 locationInView:0];
  objc_msgSend(v3, "valueWithCGPoint:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)_directionallyAcceptMotion:(double)a3
{
  int64_t requiredDirectionality = self->_requiredDirectionality;
  if (requiredDirectionality == 1) {
    return a3 >= 0.0;
  }
  if (requiredDirectionality == -1) {
    return a3 <= 0.0;
  }
  return 1;
}

- (double)_projectedMotionForInterval:(double)a3
{
  return self->_cumulativeMotion + self->_smoothedIncrementalMotion * (a3 / 0.016);
}

- (void)_updateForTouchesCancelledOrEnded:(id)a3 state:(int64_t)a4 withEvent:(id)a5
{
  id v13 = a3;
  id v9 = a5;
  if ((unint64_t)(a4 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBTouchTemplateGestureRecognizer.m" lineNumber:267 description:@"state must be cancelled or ended."];
  }
  unint64_t trackingTouchCount = self->_trackingTouchCount;
  if (trackingTouchCount < 3 || trackingTouchCount == [v13 count])
  {
    if ([(SBTouchTemplateGestureRecognizer *)self state])
    {
      [(SBTouchTemplateGestureRecognizer *)self setState:a4];
    }
    else
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s - hadn't recognized yet and we were tracking this touch", "-[SBTouchTemplateGestureRecognizer _updateForTouchesCancelledOrEnded:state:withEvent:]");
      [(SBTouchTemplateGestureRecognizer *)self _failMeForReason:v11];
    }
  }
  self->_trackingTouchCount -= [v13 count];
}

- (void)_updateForTouchesBeganOrMoved:(id)a3
{
  id v6 = a3;
  id v4 = -[SBTouchTemplateGestureRecognizer _polygonForTouches:](self, "_polygonForTouches:");
  if (![(SBTouchTemplateGestureRecognizer *)self state])
  {
    id v5 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplate];

    if (!v5) {
      [(SBTouchTemplateGestureRecognizer *)self _attemptTemplateMatchWithTouches:v6 polygon:v4];
    }
  }
  [(SBTouchTemplateGestureRecognizer *)self _computeGestureMotionWithTouches:v6 polygon:v4];
}

- (id)_matchedTemplateForTouches:(id)a3 polygon:(id)a4
{
  id v6 = a3;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  id v7 = a4;
  uint64_t v8 = SBLogSystemGesture();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9) {
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", @"%s - candidate: %@ from points: %@", "-[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:]", v7, 0);
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__76;
  v34 = __Block_byref_object_dispose__76;
  id v35 = 0;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, v10);

  id v11 = [v6 anyObject];
  uint64_t v12 = [v11 type];

  id v13 = [(SBTouchTemplateGestureRecognizer *)self templatesForTouchType:v12];
  if (v12 == 1) {
    double v14 = 4.0;
  }
  else {
    double v14 = 1.0;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__SBTouchTemplateGestureRecognizer__matchedTemplateForTouches_polygon___block_invoke;
  v22[3] = &unk_1E6B06810;
  id v15 = v6;
  id v23 = v15;
  v26 = v36;
  id v16 = v7;
  id v24 = v16;
  v28[1] = *(id *)&v14;
  objc_copyWeak(v28, &location);
  v25 = self;
  v27 = &v30;
  [v13 enumerateObjectsUsingBlock:v22];

  id v17 = SBLogSystemGesture();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

  if (v18)
  {
    v19 = NSStringFromBOOL();
    -[SBTouchTemplateGestureRecognizer log:](self, "log:", @"%s - attemptedTemplateMatch: %@ # of attempts so far: %lu", "-[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:]", v19, [(SBTouchTemplateGestureRecognizer *)self _failedRecognitionAttempts]);
  }
  id v20 = (id)v31[5];
  objc_destroyWeak(v28);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(v36, 8);
  return v20;
}

void __71__SBTouchTemplateGestureRecognizer__matchedTemplateForTouches_polygon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 pointCount];
  if (v8 == [*(id *)(a1 + 32) count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v9 = *(void *)(a1 + 40);
    double v10 = *(double *)(a1 + 80);
    id v18 = 0;
    uint64_t v11 = [v7 matchesPolygon:v9 matchTransformsAllowed:15 acceptanceFactor:&v18 outMorphedCandidate:v10];
    id v12 = v18;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    double v14 = [[SBTemplateAndMorph alloc] initWithTemplate:v7 morph:v12];
    [WeakRetained addObject:v14];

    id v15 = SBLogSystemGesture();
    LODWORD(v14) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v14)
    {
      id v16 = *(void **)(a1 + 48);
      id v17 = stringForSBTouchTemplateMatchResult(v11);
      [v16 log:@"%s - result: %@ template: %@", "-[SBTouchTemplateGestureRecognizer _matchedTemplateForTouches:polygon:]_block_invoke", v17, v7];
    }
    if (v11 == 1)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)_updateMatchedTemplateForTouchesBeganOrEnded:(id)a3
{
  id v7 = [(SBTouchTemplateGestureRecognizer *)self _touchesByFilteringRestingTrackpadTouches:a3];
  id v4 = [(SBTouchTemplateGestureRecognizer *)self _polygonForTouches:v7];
  id v5 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplateForTouches:v7 polygon:v4];
  if (v5)
  {
    [(SBTouchTemplateGestureRecognizer *)self _setMatchedTemplate:v5];
    id v6 = v4;
LABEL_3:
    [(SBTouchTemplateGestureRecognizer *)self _setMatchedPolygon:v6];
    goto LABEL_5;
  }
  if (![(SBTouchTemplateGestureRecognizer *)self state])
  {
    [(SBTouchTemplateGestureRecognizer *)self _setMatchedTemplate:0];
    id v6 = 0;
    goto LABEL_3;
  }
LABEL_5:
}

- (void)_attemptTemplateMatchWithTouches:(id)a3 polygon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBTouchTemplateGestureRecognizer *)self _matchedTemplateForTouches:v6 polygon:v7];
  if (v8)
  {
    [(SBTouchTemplateGestureRecognizer *)self _setMatchedTemplate:v8];
    [(SBTouchTemplateGestureRecognizer *)self _setMatchedPolygon:v7];
    if (!self->_initialTouchPointMap)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:0];
      initialTouchPointMap = self->_initialTouchPointMap;
      self->_initialTouchPointMap = v9;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__SBTouchTemplateGestureRecognizer__attemptTemplateMatchWithTouches_polygon___block_invoke;
    v12[3] = &unk_1E6B067E8;
    v12[4] = self;
    [v6 enumerateObjectsUsingBlock:v12];
    self->_failedRecognitionAttempts = 0;
  }
  else
  {
    ++self->_failedRecognitionAttempts;
    if ([(SBTouchTemplateGestureRecognizer *)self _failedRecognitionAttempts] >= 0xB)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s - >%d attempts and still no template matches", "-[SBTouchTemplateGestureRecognizer _attemptTemplateMatchWithTouches:polygon:]", 10);
      [(SBTouchTemplateGestureRecognizer *)self _failMeForReason:v11];
    }
  }
}

void __77__SBTouchTemplateGestureRecognizer__attemptTemplateMatchWithTouches_polygon___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 304);
  objc_super v3 = (void *)MEMORY[0x1E4F29238];
  id v4 = a2;
  [v4 locationInView:0];
  objc_msgSend(v3, "valueWithCGPoint:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v5 forKey:v4];
}

- (void)_computeGestureMotionWithTouches:(id)a3 polygon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer analyzeTouches:v6];
  id v9 = v7;
  [(SBTouchTemplateGestureRecognizer *)self incrementalGestureMotionForCandidate:v9 withTransformAnalyzerInfo:v8];
  double v11 = v10;
  self->_double cumulativeMotion = v10 + self->_cumulativeMotion;
  [(SBTouchTemplateGestureRecognizer *)self animationDistance];
  double cumulativeMotion = self->_cumulativeMotion;
  if (cumulativeMotion > v12 || (double v12 = -v12, cumulativeMotion < v12)) {
    self->_double cumulativeMotion = v12;
  }
  double smoothedIncrementalMotion = self->_smoothedIncrementalMotion;
  float v15 = dbl_1D8FD21C0[fabs(v11) > fabs(smoothedIncrementalMotion)];
  self->_double smoothedIncrementalMotion = smoothedIncrementalMotion * (1.0 - v15) + v15 * v11;
  double v16 = self->_cumulativeMotion;
  double cumulativeMotionEnvelope = self->_cumulativeMotionEnvelope;
  if (fabs(v16) > fabs(cumulativeMotionEnvelope) || v16 * cumulativeMotionEnvelope < 0.0) {
    self->_double cumulativeMotionEnvelope = v16;
  }
  if ([(SBTouchTemplateGestureRecognizer *)self state]) {
    [(SBTouchTemplateGestureRecognizer *)self _setMatchedPolygon:v9];
  }
  if (![(SBTouchTemplateGestureRecognizer *)self state])
  {
    id v18 = [(SBTouchTemplateGestureRecognizer *)self _matchedPolygon];

    if (v18)
    {
      double v19 = fmin((float)(20.0 / (float)(unint64_t)[v9 pointCount]), 10.0);
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      BOOL v27 = fabs(self->_cumulativeMotion) >= v19;
      id v20 = SBLogSystemGesture();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v21)
      {
        v22 = NSStringFromBOOL();
        [(SBTouchTemplateGestureRecognizer *)self log:@"motionAccepted: %@, _cumulativeMotion: %f commitDistance: %f", v22, *(void *)&self->_cumulativeMotion, *(void *)&v19];
      }
      if (*((unsigned char *)v25 + 24))
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __77__SBTouchTemplateGestureRecognizer__computeGestureMotionWithTouches_polygon___block_invoke;
        v23[3] = &unk_1E6B06838;
        *(double *)&v23[6] = v19;
        v23[4] = self;
        v23[5] = &v24;
        [v6 enumerateObjectsUsingBlock:v23];
        if (*((unsigned char *)v25 + 24))
        {
          if ([(SBTouchTemplateGestureRecognizer *)self hasSignificantMotionToBegin])
          {
            [(SBTouchTemplateGestureRecognizer *)self _setMatchedPolygon:v9];
            [(SBTouchTemplateGestureRecognizer *)self setState:1];
            self->_double cumulativeMotion = 0.0;
          }
          else
          {
            ++self->_failedRecognitionAttempts;
            if ([(SBTouchTemplateGestureRecognizer *)self _failedRecognitionAttempts] >= 0xB) {
              [(SBTouchTemplateGestureRecognizer *)self _failMeForReason:@"Have enough motion, but the subclass doesn't agree'"];
            }
          }
        }
      }
      _Block_object_dispose(&v24, 8);
    }
  }
}

void __77__SBTouchTemplateGestureRecognizer__computeGestureMotionWithTouches_polygon___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  [v5 locationInView:0];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 304) objectForKey:v5];

  id v6 = v8;
  if (v8)
  {
    [v8 CGPointValue];
    UIDistanceBetweenPoints();
    id v6 = v8;
    if (v7 < *(double *)(a1 + 48))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

- (void)_failMeForReason:(id)a3
{
  id v6 = a3;
  id v4 = SBLogSystemGesture();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5) {
    [(SBTouchTemplateGestureRecognizer *)self log:@"Failed: %@", v6];
  }
  [(SBTouchTemplateGestureRecognizer *)self setState:5];
  [(SBTouchTemplateGestureRecognizer *)self _invalidateNoChangeCancellationTimer];
}

- (void)_reset
{
  [(SBTouchTemplateGestureRecognizer *)self _resetNoChangeCancellationTimer];
  if (self->_recognitionBegan)
  {
    objc_super v3 = SBLogSystemGesture();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4) {
      [(SBTouchTemplateGestureRecognizer *)self log:@"Ending gesture recognition sequence %lu", self->_sequenceNumber];
    }
    self->_recognitionBegan = 0;
    ++self->_sequenceNumber;
  }
  self->_failedRecognitionAttempts = 0;
  [(SBTouchTemplateGestureRecognizer *)self _setMatchedTemplate:0];
  [(SBTouchTemplateGestureRecognizer *)self _setMatchedPolygon:0];
  [(UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer reset];
  [(NSMapTable *)self->_initialTouchPointMap removeAllObjects];
  self->_unint64_t trackingTouchCount = 0;
  self->_double cumulativeMotion = 0.0;
  self->_double cumulativeMotionEnvelope = 0.0;
  self->_double smoothedIncrementalMotion = 0.0;
}

- (BOOL)_shouldAddNewTouchesAfterGestureRecognition
{
  return 0;
}

- (id)_touchesByFilteringRestingTrackpadTouches:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 _isRestingTouch])
        {
          if (!v6) {
            id v6 = (void *)[v3 mutableCopy];
          }
          [v6 removeObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  if (v6) {
    double v10 = v6;
  }
  else {
    double v10 = v3;
  }
  id v11 = v10;

  return v11;
}

- (NSTimer)_noChangeCancellationTimer
{
  return self->_noChangeCancellationTimer;
}

- (void)_setNoChangeCancellationTimer:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSMutableDictionary)templatesForTouchType
{
  return self->_templatesForTouchType;
}

- (NSMapTable)_initialTouchPointMap
{
  return self->_initialTouchPointMap;
}

- (unint64_t)_failedRecognitionAttempts
{
  return self->_failedRecognitionAttempts;
}

- (void)_setFailedRecognitionAttempts:(unint64_t)a3
{
  self->_failedRecognitionAttempts = a3;
}

- (unint64_t)_trackingTouchCount
{
  return self->_trackingTouchCount;
}

- (void)_setTrackingTouchCount:(unint64_t)a3
{
  self->_unint64_t trackingTouchCount = a3;
}

- (double)_cumulativeMotion
{
  return self->_cumulativeMotion;
}

- (void)_setCumulativeMotion:(double)a3
{
  self->_double cumulativeMotion = a3;
}

- (double)_cumulativeMotionEnvelope
{
  return self->_cumulativeMotionEnvelope;
}

- (void)_setCumulativeMotionEnvelope:(double)a3
{
  self->_double cumulativeMotionEnvelope = a3;
}

- (double)_smoothedIncrementalMotion
{
  return self->_smoothedIncrementalMotion;
}

- (void)_setSmoothedIncrementalMotion:(double)a3
{
  self->_double smoothedIncrementalMotion = a3;
}

- (double)animationDistance
{
  return self->_animationDistance;
}

- (void)setAnimationDistance:(double)a3
{
  self->_animationDistance = a3;
}

- (int64_t)requiredDirectionality
{
  return self->_requiredDirectionality;
}

- (void)setRequiredDirectionality:(int64_t)a3
{
  self->_int64_t requiredDirectionality = a3;
}

- (UIGestureRecognizerTransformAnalyzer)transformAnalyzer
{
  return self->_transformAnalyzer;
}

- (SBTouchTemplate)_matchedTemplate
{
  return self->_matchedTemplate;
}

- (void)_setMatchedTemplate:(id)a3
{
}

- (SBPolygon)_matchedPolygon
{
  return self->_matchedPolygon;
}

- (void)_setMatchedPolygon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedPolygon, 0);
  objc_storeStrong((id *)&self->_matchedTemplate, 0);
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
  objc_storeStrong((id *)&self->_initialTouchPointMap, 0);
  objc_storeStrong((id *)&self->_templatesForTouchType, 0);
  objc_storeStrong((id *)&self->_noChangeCancellationTimer, 0);
}

- (id)logCategory
{
  return 0;
}

- (void)_log:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v7, 0x16u);
}

@end