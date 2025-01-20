@interface _UIGestureStudyInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (NSMutableDictionary)eventMetadata;
- (UIView)view;
- (_UIGestureStudyClickInteraction)forceClickInteraction;
- (_UIGestureStudyClickInteraction)longPressClickInteraction;
- (_UIGestureStudyInteraction)initWithDelegate:(id)a3;
- (_UIGestureStudyInteractionDelegate)delegate;
- (_UIGestureStudyMetricsGestureRecognizer)metricsGestureRecognizer;
- (id)_baseMetadataForTriggeredParticipant:(id)a3;
- (id)_numberOfActiveTouches;
- (id)_viewRegionForTriggeredParticipant:(id)a3;
- (void)_handleMetricsEvent:(id)a3;
- (void)_reportEventForTriggeredParticipant:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setForceClickInteraction:(id)a3;
- (void)setLongPressClickInteraction:(id)a3;
- (void)setMetricsGestureRecognizer:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIGestureStudyInteraction

- (_UIGestureStudyInteraction)initWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 bundleIdentifier];
  char v8 = [v7 isEqualToString:@"com.apple.springboard"];

  if ((v8 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIGestureStudyInteraction.m" lineNumber:89 description:@"This interaction is only intended for use in SpringBoard."];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIGestureStudyInteraction;
  v9 = [(_UIGestureStudyInteraction *)&v13 init];
  v10 = v9;
  if (v9) {
    [(_UIGestureStudyInteraction *)v9 setDelegate:v5];
  }

  return v10;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];
  v6 = [(_UIGestureStudyInteraction *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  v11 = [(_UIGestureStudyInteraction *)self view];
  objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v4, v8, v10);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)willMoveToView:(id)a3
{
  id v4 = [(_UIGestureStudyInteraction *)self forceClickInteraction];
  id v5 = [v4 view];
  v6 = [(_UIGestureStudyInteraction *)self forceClickInteraction];
  [v5 removeInteraction:v6];

  double v7 = [(_UIGestureStudyInteraction *)self longPressClickInteraction];
  double v8 = [v7 view];
  double v9 = [(_UIGestureStudyInteraction *)self longPressClickInteraction];
  [v8 removeInteraction:v9];

  id v12 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];
  double v10 = [v12 view];
  v11 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];
  [v10 removeGestureRecognizer:v11];
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    v6 = +[UIDevice currentDevice];
    int v7 = [v6 _supportsForceTouch];

    if (v7)
    {
      double v8 = [(_UIGestureStudyInteraction *)self forceClickInteraction];

      if (!v8)
      {
        double v9 = [[_UIGestureStudyClickInteraction alloc] initWithTarget:self action:sel__interactionDidTrigger_ useForce:1];
        [(_UIGestureStudyInteraction *)self setForceClickInteraction:v9];
      }
      id WeakRetained = objc_loadWeakRetained((id *)p_view);
      uint64_t v11 = [(_UIGestureStudyInteraction *)self forceClickInteraction];
    }
    else
    {
      id v12 = [(_UIGestureStudyInteraction *)self longPressClickInteraction];

      if (!v12)
      {
        double v13 = [[_UIGestureStudyClickInteraction alloc] initWithTarget:self action:sel__interactionDidTrigger_ useForce:0];
        [(_UIGestureStudyInteraction *)self setLongPressClickInteraction:v13];
      }
      id WeakRetained = objc_loadWeakRetained((id *)p_view);
      uint64_t v11 = [(_UIGestureStudyInteraction *)self longPressClickInteraction];
    }
    double v14 = (void *)v11;
    [WeakRetained addInteraction:v11];

    double v15 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];

    if (!v15)
    {
      double v16 = [[_UIGestureStudyMetricsGestureRecognizer alloc] initWithTarget:self action:sel__handleMetricsEvent_];
      [(_UIGestureStudyInteraction *)self setMetricsGestureRecognizer:v16];

      double v17 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];
      [v17 setDelegate:self];
    }
    id v18 = objc_loadWeakRetained((id *)p_view);
    v19 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];
    [v18 addGestureRecognizer:v19];
  }
}

- (void)_handleMetricsEvent:(id)a3
{
  id v4 = a3;
  if ([v4 state] != 3) {
    goto LABEL_9;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__215;
  v22 = __Block_byref_object_dispose__215;
  id v23 = [(_UIGestureStudyInteraction *)self eventMetadata];
  [(_UIGestureStudyInteraction *)self setEventMetadata:0];
  if (!v19[5])
  {
    [v4 movement];
    if (v5 >= 100.0)
    {
LABEL_8:
      _Block_object_dispose(&v18, 8);

LABEL_9:
      return;
    }
  }
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __50___UIGestureStudyInteraction__handleMetricsEvent___block_invoke;
  double v15 = &unk_1E530C2C0;
  double v17 = &v18;
  id v16 = v4;
  v6 = _Block_copy(&aBlock);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v7 = (void (*)(__CFString *, void *))getAnalyticsSendEventLazySymbolLoc_ptr;
  v32 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v27 = &unk_1E52D9900;
    v28 = &v29;
    double v8 = CoreAnalyticsLibrary();
    double v9 = dlsym(v8, "AnalyticsSendEventLazy");
    *(void *)(v28[1] + 24) = v9;
    getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(v28[1] + 24);
    int v7 = (void (*)(__CFString *, void *))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (v7)
  {
    v7(@"com.apple.UIKit.CoverSheetStudy.v1", v6);

    goto LABEL_8;
  }
  double v10 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool __AnalyticsSendEventLazy(NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"_UIGestureStudyInteraction.m", 22, @"%s", dlerror(), aBlock, v13, v14, v15);

  __break(1u);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(_UIGestureStudyInteraction *)self metricsGestureRecognizer];

  return v6 == v5;
}

- (void)_reportEventForTriggeredParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v5 = (unsigned int (*)(__CFString *))getAnalyticsIsEventUsedSymbolLoc_ptr;
  uint64_t v24 = getAnalyticsIsEventUsedSymbolLoc_ptr;
  if (!getAnalyticsIsEventUsedSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __getAnalyticsIsEventUsedSymbolLoc_block_invoke;
    v19 = &unk_1E52D9900;
    uint64_t v20 = &v21;
    id v6 = CoreAnalyticsLibrary();
    v22[3] = (uint64_t)dlsym(v6, "AnalyticsIsEventUsed");
    getAnalyticsIsEventUsedSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    id v5 = (unsigned int (*)(__CFString *))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (v5)
  {
    if (v5(@"com.apple.UIKit.CoverSheetStudy.v1"))
    {
      int v7 = objc_opt_new();
      double v8 = [(_UIGestureStudyInteraction *)self _baseMetadataForTriggeredParticipant:v4];
      [v7 addEntriesFromDictionary:v8];

      double v9 = [(_UIGestureStudyInteraction *)self delegate];
      double v10 = [v9 metadataForTriggeredInteraction:self];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __66___UIGestureStudyInteraction__reportEventForTriggeredParticipant___block_invoke;
      v14[3] = &unk_1E52DDE90;
      id v15 = v7;
      id v11 = v7;
      [v10 enumerateKeysAndObjectsUsingBlock:v14];
      [(_UIGestureStudyInteraction *)self setEventMetadata:v11];
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"_Bool __AnalyticsIsEventUsed(NSString *__strong)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"_UIGestureStudyInteraction.m", 25, @"%s", dlerror());

    __break(1u);
  }
}

- (id)_baseMetadataForTriggeredParticipant:(id)a3
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26[0] = @"gesture_type";
  id v5 = [v4 eventName];
  v27[0] = v5;
  v26[1] = @"duration_on_event";
  [v4 duration];
  int v7 = NSNumber;
  double v8 = 0.0;
  double v9 = 0.0;
  if (v6 != 0.0)
  {
    long double v10 = fabs(v6);
    long double v11 = v6 / v10;
    double v12 = log10(v10);
    double v13 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v12));
    double v9 = v11 * (round(v10 * v13) / v13);
  }
  double v14 = [v7 numberWithDouble:v9];
  v27[1] = v14;
  v26[2] = @"movement_on_event";
  [v4 movement];
  uint64_t v16 = NSNumber;
  if (v15 != 0.0)
  {
    long double v17 = fabs(v15);
    long double v18 = v15 / v17;
    double v19 = log10(v17);
    double v20 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v19));
    double v8 = v18 * (round(v17 * v20) / v20);
  }
  uint64_t v21 = [v16 numberWithDouble:v8];
  v27[2] = v21;
  v26[3] = @"display_region";
  v22 = [(_UIGestureStudyInteraction *)self _viewRegionForTriggeredParticipant:v4];
  v27[3] = v22;
  v26[4] = @"touch_count_on_event";
  uint64_t v23 = [(_UIGestureStudyInteraction *)self _numberOfActiveTouches];
  v27[4] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];

  return v24;
}

- (id)_viewRegionForTriggeredParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIGestureStudyInteraction *)self view];
  [v4 locationInCoordinateSpace:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(_UIGestureStudyInteraction *)self view];
  if (!v10) {
    goto LABEL_4;
  }
  long double v11 = (void *)v10;
  double v12 = [(_UIGestureStudyInteraction *)self view];
  [v12 bounds];
  v21.x = v7;
  v21.y = v9;
  BOOL v13 = CGRectContainsPoint(v22, v21);

  if (v13)
  {
    double v14 = [(_UIGestureStudyInteraction *)self view];
    [v14 bounds];
    double v15 = v7 / CGRectGetWidth(v23);
    uint64_t v16 = [(_UIGestureStudyInteraction *)self view];
    [v16 bounds];
    double v17 = v9 / CGRectGetHeight(v24);

    objc_msgSend(NSString, "stringWithFormat:", @"%lu,%lu", llround(v15 / 0.333333333), llround(v17 / 0.333333333));
    long double v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    long double v18 = @"Unknown";
  }
  return v18;
}

- (id)_numberOfActiveTouches
{
  v2 = (void *)UIApp;
  v3 = [(_UIGestureStudyInteraction *)self view];
  id v4 = [v3 _window];
  id v5 = [v2 _touchesEventForWindow:v4];

  double v6 = NSNumber;
  double v7 = [v5 allTouches];
  double v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));

  return v8;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIGestureStudyInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIGestureStudyInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIGestureStudyClickInteraction)forceClickInteraction
{
  return self->_forceClickInteraction;
}

- (void)setForceClickInteraction:(id)a3
{
}

- (_UIGestureStudyClickInteraction)longPressClickInteraction
{
  return self->_longPressClickInteraction;
}

- (void)setLongPressClickInteraction:(id)a3
{
}

- (_UIGestureStudyMetricsGestureRecognizer)metricsGestureRecognizer
{
  return self->_metricsGestureRecognizer;
}

- (void)setMetricsGestureRecognizer:(id)a3
{
}

- (NSMutableDictionary)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_metricsGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressClickInteraction, 0);
  objc_storeStrong((id *)&self->_forceClickInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end