@interface SKUIViewControllerContainerCollectionView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (void)_beginDynamicHysteresisIncreaseWithCompetingScrollView:(id)a3;
- (void)_endDynamicHysteresisIncrease;
- (void)_updateStateForDynamicHysteresisIncrease;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SKUIViewControllerContainerCollectionView

- (void)dealloc
{
  [(SKUIViewControllerContainerCollectionView *)self _endDynamicHysteresisIncrease];
  v3.receiver = self;
  v3.super_class = (Class)SKUIViewControllerContainerCollectionView;
  [(SKUIViewControllerContainerCollectionView *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v13) {
        -[SKUIViewControllerContainerCollectionView observeValueForKeyPath:ofObject:change:context:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  if ((void *)_SKUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext == a6)
  {
    v21 = [(SKUIViewControllerContainerCollectionView *)self panGestureRecognizer];
    if ((unint64_t)([v21 state] - 3) <= 2) {
      [(SKUIViewControllerContainerCollectionView *)self _endDynamicHysteresisIncrease];
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SKUIViewControllerContainerCollectionView;
    [(SKUIViewControllerContainerCollectionView *)&v22 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIViewControllerContainerCollectionView gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = [(SKUIViewControllerContainerCollectionView *)self panGestureRecognizer];

  if (v17 == v7)
  {
    uint64_t v18 = [v8 delegate];
    if (v18 != self)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = v18;
        id v20 = [(SKUIViewControllerContainerCollectionView *)v19 panGestureRecognizer];

        if (v20 == v8
          && _SKUIScrollViewIsCompetingWithScrollView(self, v19)
          && (_SKUIScrollViewWantsToBeginTrackingImmediately(v19) & 1) != 0)
        {
          [(SKUIViewControllerContainerCollectionView *)self _beginDynamicHysteresisIncreaseWithCompetingScrollView:v19];

          BOOL v21 = 1;
          goto LABEL_17;
        }
      }
    }
  }
  if (objc_msgSend((id)+[SKUIViewControllerContainerCollectionView superclass](SKUIViewControllerContainerCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v23.receiver = self;
    v23.super_class = (Class)SKUIViewControllerContainerCollectionView;
    BOOL v21 = [(SKUIViewControllerContainerCollectionView *)&v23 gestureRecognizer:v7 shouldBeRequiredToFailByGestureRecognizer:v8];
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_17:

  return v21;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIViewControllerContainerCollectionView gestureRecognizer:shouldRequireFailureOfGestureRecognizer:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = [(SKUIViewControllerContainerCollectionView *)self panGestureRecognizer];

  if (v17 != v7) {
    goto LABEL_14;
  }
  uint64_t v18 = [v8 delegate];
  if (v18 == self) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v19 = v18;
  id v20 = [(SKUIViewControllerContainerCollectionView *)v19 panGestureRecognizer];

  if (v20 != v8 || !_SKUIScrollViewIsCompetingWithScrollView(self, v19))
  {

LABEL_13:
    goto LABEL_14;
  }
  char v21 = _SKUIScrollViewWantsToBeginTrackingImmediately(self);

  if (v21)
  {
    BOOL v22 = 1;
    goto LABEL_17;
  }
LABEL_14:
  if (objc_msgSend((id)+[SKUIViewControllerContainerCollectionView superclass](SKUIViewControllerContainerCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v24.receiver = self;
    v24.super_class = (Class)SKUIViewControllerContainerCollectionView;
    BOOL v22 = [(SKUIViewControllerContainerCollectionView *)&v24 gestureRecognizer:v7 shouldRequireFailureOfGestureRecognizer:v8];
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_17:

  return v22;
}

- (void)_beginDynamicHysteresisIncreaseWithCompetingScrollView:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_forcingIncreasedPanGestureRecognizerHysteresis)
  {
    v6 = [v4 panGestureRecognizer];
    [v6 _hysteresis];
    self->_competingScrollViewPanGestureRecognizerHysteresis = v7;

    id v8 = [(SKUIViewControllerContainerCollectionView *)self panGestureRecognizer];
    [v8 _hysteresis];
    self->_originalPanGestureRecognizerHysteresis = v9;
    [v8 _setHysteresis:88.0];
    [v8 addObserver:self forKeyPath:@"state" options:0 context:_SKUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext];
    self->_forcingIncreasedPanGestureRecognizerHysteresis = 1;
    objc_initWeak(&location, self);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__SKUIViewControllerContainerCollectionView__beginDynamicHysteresisIncreaseWithCompetingScrollView___block_invoke;
    v12[3] = &unk_1E642AF58;
    objc_copyWeak(&v13, &location);
    self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(v10, 0x20uLL, 1u, 0, v12);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4FB30B0]);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __100__SKUIViewControllerContainerCollectionView__beginDynamicHysteresisIncreaseWithCompetingScrollView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStateForDynamicHysteresisIncrease];
}

- (void)_endDynamicHysteresisIncrease
{
  if (self->_forcingIncreasedPanGestureRecognizerHysteresis)
  {
    self->_competingScrollViewPanGestureRecognizerHysteresis = 0.0;
    id v4 = [(SKUIViewControllerContainerCollectionView *)self panGestureRecognizer];
    [v4 _setHysteresis:self->_originalPanGestureRecognizerHysteresis];
    [v4 removeObserver:self forKeyPath:@"state" context:&_SKUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext];
    self->_originalPanGestureRecognizerHysteresis = 0.0;
    self->_forcingIncreasedPanGestureRecognizerHysteresis = 0;
    if (self->_runLoopObserver)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      CFRunLoopRemoveObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4FB30B0]);
      CFRelease(self->_runLoopObserver);
      self->_runLoopObserver = 0;
    }
  }
}

- (void)_updateStateForDynamicHysteresisIncrease
{
  id v7 = [(SKUIViewControllerContainerCollectionView *)self panGestureRecognizer];
  if (![v7 state])
  {
    [v7 translationInView:self];
    double v4 = fabs(v3);
    double v6 = fabs(v5);
    if (v6 > v4 && v6 > self->_competingScrollViewPanGestureRecognizerHysteresis) {
      [v7 setState:5];
    }
  }
}

- (void)observeValueForKeyPath:(uint64_t)a3 ofObject:(uint64_t)a4 change:(uint64_t)a5 context:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)gestureRecognizer:(uint64_t)a3 shouldBeRequiredToFailByGestureRecognizer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)gestureRecognizer:(uint64_t)a3 shouldRequireFailureOfGestureRecognizer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end