@interface _UISheetInteraction
- (BOOL)_descendentScrollView:(id)a3 shouldPreserveStartOffset:(CGPoint)a4;
- (BOOL)_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:(id)a3;
- (BOOL)_descendentScrollViewShouldScrollHorizontally:(id)a3;
- (BOOL)_descendentScrollViewShouldScrollVertically:(id)a3;
- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4;
- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4;
- (BOOL)_shouldInteractWithDescendentScrollView:(id)a3 startOffset:(CGPoint)a4 maxTopOffset:(double)a5;
- (BOOL)delegateAllowsInteractWithQuicklyScrollingDescendentScrollView;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isDragging;
- (BOOL)isEnabled;
- (BOOL)isGeneratingAnimations;
- (BOOL)isScrollInteractionEnabled;
- (BOOL)isUnconstrainedOffsetBeyondSideOrTopExtentInverted:(BOOL)a3;
- (BOOL)scrollingExpandsToLargerDetentWhenScrolledToEdge;
- (CGPoint)_scrollView:(id)a3 adjustedUnconstrainedOffsetForUnconstrainedOffset:(CGPoint)a4 startOffset:(CGPoint)a5 horizontalVelocity:(double *)a6 verticalVelocity:(double *)a7 animator:(id *)a8;
- (CGPoint)attachmentPoint;
- (CGPoint)currentOffset;
- (CGPoint)currentVelocity;
- (NSMutableArray)detentPoints;
- (NSMutableArray)registeredPanGestureRecognizers;
- (NSObject)dragSource;
- (UIPanGestureRecognizer)backgroundGestureRecognizer;
- (UIView)view;
- (_UIHyperAsymmetricExtender)extender;
- (_UIHyperInteractor)interactor;
- (_UIHyperOutOfProcessViewAnimator)animator;
- (_UIHyperrectangle)detentContinuum;
- (_UIHyperregionUnion)detentUnion;
- (_UISheetInteraction)init;
- (_UISheetInteractionDelegate)delegate;
- (id)_currentDragPanGesture;
- (id)currentOffsetWasInvalidated;
- (id)detentGetter;
- (id)indexOfCurrentDetentGetter;
- (id)numberOfDetentsGetter;
- (id)rubberBandExtentBeyondMaximumOffsetGetter;
- (id)rubberBandExtentBeyondMinimumOffsetGetter;
- (int64_t)indexOfCurrentDetent;
- (void)_animateWithParameters:(id)a3 animations:(id)a4;
- (void)_hyperOutOfProcessViewAnimator:(id)a3 getPresentationPointForInterruptedAnimation:(double *)a4;
- (void)cancelDraggingIfNeeded;
- (void)didMoveToView:(id)a3;
- (void)draggingBeganFromSource:(id)a3 withRubberBandCoefficient:(double)a4;
- (void)draggingChangedInSource:(id)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5 animateChange:(BOOL)a6;
- (void)draggingEndedInSource:(id)a3;
- (void)handlePan:(id)a3;
- (void)invalidateDetents;
- (void)invalidateIndexOfCurrentDetent;
- (void)invalidateRubberBandExtentBeyondMaximumOffset;
- (void)invalidateRubberBandExtentBeyondMinimumOffset;
- (void)registerPanGestureRecognizer:(id)a3;
- (void)sendCurrentOffsetDidChange;
- (void)setCurrentOffsetWasInvalidated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetentGetter:(id)a3;
- (void)setDragSource:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGeneratingAnimations:(BOOL)a3;
- (void)setIndexOfCurrentDetent:(int64_t)a3;
- (void)setIndexOfCurrentDetentGetter:(id)a3;
- (void)setNumberOfDetentsGetter:(id)a3;
- (void)setRubberBandExtentBeyondMaximumOffsetGetter:(id)a3;
- (void)setRubberBandExtentBeyondMinimumOffsetGetter:(id)a3;
- (void)setScrollInteractionEnabled:(BOOL)a3;
- (void)setScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3;
- (void)setView:(id)a3;
- (void)unregisterPanGestureRecognizer:(id)a3;
- (void)updateRegisteredPanGestureRecognizerEnabled:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UISheetInteraction

- (BOOL)isGeneratingAnimations
{
  return self->_generatingAnimations;
}

- (void)setScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3
{
  self->_scrollingExpandsToLargerDetentWhenScrolledToEdge = a3;
}

- (void)setScrollInteractionEnabled:(BOOL)a3
{
  self->_scrollInteractionEnabled = a3;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (!a3) {
      [(_UISheetInteraction *)self cancelDraggingIfNeeded];
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(_UISheetInteraction *)self registeredPanGestureRecognizers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(_UISheetInteraction *)self updateRegisteredPanGestureRecognizerEnabled:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)cancelDraggingIfNeeded
{
  if ([(_UISheetInteraction *)self isDragging])
  {
    id v3 = [(_UISheetInteraction *)self dragSource];
    [(_UISheetInteraction *)self draggingCancelledInSource:v3];
  }
}

- (CGPoint)currentOffset
{
  v2 = [(_UISheetInteraction *)self interactor];
  id v3 = (double *)[v2 _presentationPoint];

  double v4 = *v3;
  double v5 = v3[1];
  result.y = v5;
  result.x = v4;
  return result;
}

- (_UIHyperInteractor)interactor
{
  return self->_interactor;
}

- (void)invalidateIndexOfCurrentDetent
{
  id v2 = [(_UISheetInteraction *)self interactor];
  [v2 _invalidateUnconstrainedPoint];
}

- (void)invalidateDetents
{
  id v3 = [(_UISheetInteraction *)self interactor];
  [v3 _invalidateRegion];

  id v4 = [(_UISheetInteraction *)self interactor];
  [v4 _invalidateUnconstrainedPoint];
}

- (id)indexOfCurrentDetentGetter
{
  return self->_indexOfCurrentDetentGetter;
}

- (id)detentGetter
{
  return self->_detentGetter;
}

- (_UIHyperregionUnion)detentUnion
{
  return self->_detentUnion;
}

- (BOOL)isDragging
{
  id v2 = [(_UISheetInteraction *)self dragSource];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSObject)dragSource
{
  return self->_dragSource;
}

- (id)numberOfDetentsGetter
{
  return self->_numberOfDetentsGetter;
}

- (NSMutableArray)detentPoints
{
  return self->_detentPoints;
}

- (_UIHyperrectangle)detentContinuum
{
  return self->_detentContinuum;
}

- (_UISheetInteraction)init
{
  v32.receiver = self;
  v32.super_class = (Class)_UISheetInteraction;
  id v2 = [(_UISheetInteraction *)&v32 init];
  BOOL v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_scrollingExpandsToLargerDetentWhenScrolledToEdge = 257;
    v2->_scrollInteractionEnabled = 1;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registeredPanGestureRecognizers = v3->_registeredPanGestureRecognizers;
    v3->_registeredPanGestureRecognizers = v4;

    uint64_t v6 = objc_alloc_init(UIPanGestureRecognizer);
    backgroundGestureRecognizer = v3->_backgroundGestureRecognizer;
    v3->_backgroundGestureRecognizer = v6;

    [(UIGestureRecognizer *)v3->_backgroundGestureRecognizer setName:@"_UISheetInteractionBackgroundDismissRecognizer"];
    [(UIPanGestureRecognizer *)v3->_backgroundGestureRecognizer setDelegate:v3];
    [(UIPanGestureRecognizer *)v3->_backgroundGestureRecognizer setAllowedScrollTypesMask:2];
    [(_UISheetInteraction *)v3 registerPanGestureRecognizer:v3->_backgroundGestureRecognizer];
    uint64_t v8 = [[_UIHyperInteractor alloc] initWithDimensions:2];
    interactor = v3->_interactor;
    v3->_interactor = v8;

    int v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SheetDecelerationFactor, @"SheetDecelerationFactor", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v11 = *(double *)&qword_1EB256E48;
    if (v10) {
      double v11 = 0.99;
    }
    [(_UIHyperInteractor *)v3->_interactor _setDecelerationRate:v11];
    [(_UIHyperInteractor *)v3->_interactor _setDelegate:v3];
    long long v12 = (void *)MEMORY[0x1E4F1CA48];
    v13 = [[_UIHyperpoint alloc] initWithDimensions:[(_UIHyperInteractor *)v3->_interactor _dimensions]];
    uint64_t v14 = [v12 arrayWithObject:v13];
    detentPoints = v3->_detentPoints;
    v3->_detentPoints = (NSMutableArray *)v14;

    v16 = [[_UIHyperregionUnion alloc] initWithDimensions:[(_UIHyperInteractor *)v3->_interactor _dimensions]];
    detentUnion = v3->_detentUnion;
    v3->_detentUnion = v16;

    [(_UIHyperregionUnion *)v3->_detentUnion _setRegions:v3->_detentPoints];
    v18 = [[_UIHyperrectangle alloc] initWithDimensions:[(_UIHyperInteractor *)v3->_interactor _dimensions]];
    detentContinuum = v3->_detentContinuum;
    v3->_detentContinuum = v18;

    objc_initWeak(&location, v3);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __27___UISheetInteraction_init__block_invoke;
    v29[3] = &unk_1E52DB378;
    objc_copyWeak(&v30, &location);
    [(_UIHyperInteractor *)v3->_interactor _setRegionGetter:v29];
    v20 = [[_UIHyperAsymmetricExtender alloc] initWithDimensions:[(_UIHyperInteractor *)v3->_interactor _dimensions]];
    extender = v3->_extender;
    v3->_extender = v20;

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __27___UISheetInteraction_init__block_invoke_5;
    v27[3] = &unk_1E52DB3C8;
    objc_copyWeak(&v28, &location);
    [(_UIHyperInteractor *)v3->_interactor _setExtenderGetter:v27];
    v22 = [[_UIHyperOutOfProcessViewAnimator alloc] initWithDimensions:[(_UIHyperInteractor *)v3->_interactor _dimensions]];
    animator = v3->_animator;
    v3->_animator = v22;

    CAFrameRateRange v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[_UIHyperOutOfProcessViewAnimator _setPreferredFrameRateRange:](v3->_animator, "_setPreferredFrameRateRange:", *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
    [(_UIHyperOutOfProcessViewAnimator *)v3->_animator _setUpdateReason:1048612];
    [(_UIHyperOutOfProcessViewAnimator *)v3->_animator _setDelegate:v3];
    [(_UIHyperInteractor *)v3->_interactor _setAnimator:v3->_animator];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __27___UISheetInteraction_init__block_invoke_8;
    v25[3] = &unk_1E52DB3F0;
    objc_copyWeak(&v26, &location);
    [(_UIHyperInteractor *)v3->_interactor _setUnconstrainedPointGetter:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)registerPanGestureRecognizer:(id)a3
{
  id v5 = a3;
  id v4 = [(_UISheetInteraction *)self registeredPanGestureRecognizers];
  [v4 addObject:v5];

  [v5 addTarget:self action:sel_handlePan_];
  [(_UISheetInteraction *)self updateRegisteredPanGestureRecognizerEnabled:v5];
  [(_UISheetInteraction *)self handlePan:v5];
}

- (void)updateRegisteredPanGestureRecognizerEnabled:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setEnabled:", -[_UISheetInteraction isEnabled](self, "isEnabled"));
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSMutableArray)registeredPanGestureRecognizers
{
  return self->_registeredPanGestureRecognizers;
}

- (void)handlePan:(id)a3
{
  id v11 = a3;
  switch([v11 state])
  {
    case 1:
      uint64_t v4 = -[UIPanGestureRecognizer _scrollDeviceCategory](v11);
      [(_UISheetInteraction *)self draggingBeganFromSource:v11 withRubberBandCoefficient:_UIScrollViewRubberBandCoefficient(v4)];
      break;
    case 2:
      [v11 translationInView:0];
      double v6 = v5;
      double v8 = v7;
      [v11 velocityInView:0];
      -[_UISheetInteraction draggingChangedInSource:withTranslation:velocity:animateChange:](self, "draggingChangedInSource:withTranslation:velocity:animateChange:", v11, 0, v6, v8, v9, v10);
      break;
    case 3:
      [(_UISheetInteraction *)self draggingEndedInSource:v11];
      break;
    case 4:
      [(_UISheetInteraction *)self draggingCancelledInSource:v11];
      break;
    default:
      break;
  }
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  [(_UISheetInteraction *)self setView:v5];
  if (v5)
  {
    uint64_t v4 = [(_UISheetInteraction *)self backgroundGestureRecognizer];
    [v5 addGestureRecognizer:v4];
  }
}

- (void)setView:(id)a3
{
}

- (UIPanGestureRecognizer)backgroundGestureRecognizer
{
  return self->_backgroundGestureRecognizer;
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  id v7 = [(_UISheetInteraction *)self view];

  id v5 = v7;
  if (v7 && v7 != v4)
  {
    [(_UISheetInteraction *)self cancelDraggingIfNeeded];
    double v6 = [(_UISheetInteraction *)self backgroundGestureRecognizer];
    [v7 removeGestureRecognizer:v6];

    id v5 = v7;
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setRubberBandExtentBeyondMinimumOffsetGetter:(id)a3
{
}

- (void)setRubberBandExtentBeyondMaximumOffsetGetter:(id)a3
{
}

- (void)setNumberOfDetentsGetter:(id)a3
{
}

- (void)setIndexOfCurrentDetentGetter:(id)a3
{
}

- (void)setDetentGetter:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (void)setCurrentOffsetWasInvalidated:(id)a3
{
  if (self->_currentOffsetWasInvalidated != a3)
  {
    id v4 = a3;
    id v5 = _Block_copy(v4);
    id currentOffsetWasInvalidated = self->_currentOffsetWasInvalidated;
    self->_id currentOffsetWasInvalidated = v5;

    id v7 = [(_UISheetInteraction *)self interactor];
    [v7 _setPresentationPointWasInvalidated:v4];
  }
}

- (void)setDragSource:(id)a3
{
  id v5 = a3;
  if (self->_dragSource != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_dragSource, a3);
    double v6 = [(_UISheetInteraction *)self interactor];
    [v6 _invalidateRegion];

    id v5 = v7;
  }
}

- (CGPoint)currentVelocity
{
  id v2 = [(_UISheetInteraction *)self interactor];
  BOOL v3 = (double *)[v2 _velocity];

  double v4 = *v3;
  double v5 = v3[1];
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)sendCurrentOffsetDidChange
{
  BOOL v3 = [(_UISheetInteraction *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UISheetInteraction *)self delegate];
    [(_UISheetInteraction *)self currentOffset];
    objc_msgSend(v5, "sheetInteraction:didChangeOffset:", self);
  }
}

- (void)invalidateRubberBandExtentBeyondMinimumOffset
{
  id v2 = [(_UISheetInteraction *)self interactor];
  [v2 _invalidateExtender];
}

- (void)invalidateRubberBandExtentBeyondMaximumOffset
{
  id v2 = [(_UISheetInteraction *)self interactor];
  [v2 _invalidateExtender];
}

- (BOOL)isUnconstrainedOffsetBeyondSideOrTopExtentInverted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UISheetInteraction *)self interactor];
  [v5 _unconstrainedExtent];
  double v7 = v6;
  double v8 = [(_UISheetInteraction *)self interactor];
  [v8 _extent];
  double v10 = v9;

  id v11 = [(_UISheetInteraction *)self interactor];
  uint64_t v12 = [v11 _extentVector];

  double v13 = atan2(-*(double *)(v12 + 8), *(long double *)v12);
  double v14 = -2.61799388;
  if (v3) {
    double v14 = 0.523598776;
  }
  double v15 = -0.523598776;
  if (v3) {
    double v15 = 2.61799388;
  }
  BOOL v16 = v13 < v14;
  if (v13 > v15) {
    BOOL v16 = 1;
  }
  return v7 > v10 && v16;
}

- (CGPoint)attachmentPoint
{
  BOOL v3 = [(_UISheetInteraction *)self _currentDragPanGesture];
  if (v3)
  {
    char v4 = [(_UISheetInteraction *)self view];
    [v3 locationInView:v4];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  }

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)unregisterPanGestureRecognizer:(id)a3
{
  id v5 = a3;
  char v4 = [(_UISheetInteraction *)self registeredPanGestureRecognizers];
  [v4 removeObject:v5];

  [v5 removeTarget:self action:sel_handlePan_];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UISheetInteraction *)self backgroundGestureRecognizer];

  if (v8 == v7)
  {
    +[UIPanGestureRecognizer _defaultHysteresis];
    double v10 = v9;
    if ([v6 _isPointerTouch])
    {
      id v11 = [(_UISheetInteraction *)self view];
      uint64_t v12 = [(_UISheetInteraction *)self view];
      [v6 locationInView:v12];
      double v13 = objc_msgSend(v11, "hitTest:withEvent:", 0);

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v10 = 0.0;
      }
    }
    double v14 = [(_UISheetInteraction *)self backgroundGestureRecognizer];
    [v14 _setHysteresis:v10];
  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  char v4 = objc_msgSend(a4, "name", a3);
  char v5 = [v4 isEqualToString:@"com.apple.UIKit.UIWindowDraggingPan"];

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4 = a4;
  NSClassFromString(&cfstr_Pkdrawinggestu.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (BOOL v5 = 1,
        (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceCardDismissGestureDoesNotRequireFailure, @"ForceCardDismissGestureDoesNotRequireFailure", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0)&& byte_1E8FD4F3C)
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(_UISheetInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UISheetInteraction *)self delegate];
    char v9 = [v8 sheetInteraction:self shouldBeginHorizontalRubberBandingWithGestureRecognizer:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(_UISheetInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UISheetInteraction *)self delegate];
    char v9 = [v8 sheetInteraction:self shouldAllowVerticalRubberBandingWithEvent:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)_descendentScrollViewShouldScrollHorizontally:(id)a3
{
  return 0;
}

- (BOOL)_descendentScrollViewShouldScrollVertically:(id)a3
{
  id v4 = a3;
  [v4 _maxTopOffset];
  [v4 contentOffset];
  LOBYTE(self) = -[_UISheetInteraction _shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:](self, "_shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:", v4);

  return (char)self;
}

- (CGPoint)_scrollView:(id)a3 adjustedUnconstrainedOffsetForUnconstrainedOffset:(CGPoint)a4 startOffset:(CGPoint)a5 horizontalVelocity:(double *)a6 verticalVelocity:(double *)a7 animator:(id *)a8
{
  double y = a5.y;
  double x = a5.x;
  double v12 = a4.y;
  CGFloat v13 = a4.x;
  id v15 = a3;
  [v15 _maxTopOffset];
  double v17 = v16;
  self->_previousMaxTopOffset = v16;
  if (!-[_UISheetInteraction _shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:](self, "_shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:", v15, x, y, v16))goto LABEL_33; {
  int v18 = [v15 _canScrollIgnoringAncestorPermissionY];
  }
  BOOL v19 = v12 > y
     && [(_UISheetInteraction *)self scrollingExpandsToLargerDetentWhenScrolledToEdge];
  double v20 = *a7;
  v21 = [(_UISheetInteraction *)self detentPoints];
  v22 = [v21 objectAtIndexedSubscript:0];
  double v23 = *(double *)([v22 _value] + 8);

  if (v18)
  {
    if (v12 >= v17)
    {
      if (v19)
      {
        v25 = [(_UISheetInteraction *)self interactor];
        double v26 = *(double *)([v25 _unconstrainedPoint] + 8);
        v27 = [(_UISheetInteraction *)self interactor];
        double v28 = v26 + *(double *)([v27 _initialTranslation] + 8);

        double v24 = v23 - v28;
        if (y - v12 >= v24)
        {
          *a7 = 0.0;
          double v24 = y - v12;
        }
        else
        {
          double y = v12 + v24;
        }
      }
      else
      {
        double v24 = 0.0;
        if (v12 == v17 && v17 == y && *a7 > 0.0)
        {
          [(_UISheetInteraction *)self currentOffset];
          if (v29 > v23) {
            *a7 = 0.0;
          }
        }
        double y = v12;
      }
    }
    else
    {
      double v24 = v17 - v12;
      *a7 = 0.0;
      double y = v17;
    }
  }
  else
  {
    double v24 = y - v12;
    *a7 = 0.0;
  }
  [v15 _verticalVelocity];
  if (v30 == 0.0)
  {
    v31 = [v15 panGestureRecognizer];
    [v31 velocityInView:0];
    double v33 = v32;
  }
  else
  {
    double v33 = 0.0;
  }
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 1;
  if ([(_UISheetInteraction *)self isDragging]) {
    goto LABEL_29;
  }
  int v35 = v18 ^ 1;
  if (v12 < v17) {
    int v35 = 1;
  }
  if ((v35 | v19) != 1)
  {
LABEL_29:
    if (![(_UISheetInteraction *)self isDragging])
    {
LABEL_32:
      *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | flags & 1;
      double v12 = y;
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  v36 = [v15 panGestureRecognizer];
  uint64_t v37 = -[UIPanGestureRecognizer _scrollDeviceCategory](v36);
  double v38 = _UIScrollViewRubberBandCoefficient(v37);

  [(_UISheetInteraction *)self draggingBeganFromSource:v15 withRubberBandCoefficient:v38];
  [v15 contentOffset];
  if (v39 >= v17)
  {
LABEL_30:
    uint64_t v43 = 0;
    goto LABEL_31;
  }
  if (v20 != 0.0)
  {
    v40 = [UIViewPropertyAnimator alloc];
    double v41 = _UISheetTransitionDuration();
    v42 = _UISheetTransitionTimingCurve();
    *a8 = [(UIViewPropertyAnimator *)v40 initWithDuration:v42 timingParameters:v41];

    uint64_t v43 = 1;
LABEL_31:
    -[_UISheetInteraction draggingChangedInSource:withTranslation:velocity:animateChange:](self, "draggingChangedInSource:withTranslation:velocity:animateChange:", v15, v43, 0.0, v24, 0.0, v33);
    goto LABEL_32;
  }
LABEL_33:

  double v44 = v13;
  double v45 = v12;
  result.double y = v45;
  result.double x = v44;
  return result;
}

- (BOOL)_descendentScrollView:(id)a3 shouldPreserveStartOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double previousMaxTopOffset = self->_previousMaxTopOffset;
  [v7 contentOffset];
  BOOL v10 = v9 < previousMaxTopOffset
     && -[_UISheetInteraction _shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:](self, "_shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:", v7, x, y, previousMaxTopOffset);

  return v10;
}

- (BOOL)_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    return 1;
  }
  BOOL v3 = [(_UISheetInteraction *)self animator];
  char v4 = [v3 _isAnimating];

  return v4;
}

- (BOOL)_shouldInteractWithDescendentScrollView:(id)a3 startOffset:(CGPoint)a4 maxTopOffset:(double)a5
{
  id v7 = a3;
  UIRoundToViewScale(v7);
  double v9 = v8;
  UIRoundToViewScale(v7);
  if (v9 >= v10 && ([v7 _isScrubbing] & 1) == 0)
  {
    double v12 = [v7 refreshControl];
    if (v12
      || ([v7 _canScrollX] & 1) != 0
      || [v7 _isAncestorOfFirstResponder] && objc_msgSend(v7, "keyboardDismissMode") == 2
      || ![(_UISheetInteraction *)self isEnabled]
      || ![(_UISheetInteraction *)self isScrollInteractionEnabled])
    {
      BOOL v11 = 1;
      goto LABEL_14;
    }
    BOOL v13 = [(_UISheetInteraction *)self isDragging];
    if (v13)
    {
      id v14 = [(_UISheetInteraction *)self dragSource];
      if (v14 != v7)
      {
        BOOL v11 = 1;
LABEL_28:

        goto LABEL_14;
      }
    }
    [v7 _intervalBetweenPanGestures];
    double v17 = v16;
    int v18 = &_UIInternalPreference_MinimumSheetSwipeInterval;
    int v19 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_MinimumSheetSwipeInterval, @"MinimumSheetSwipeInterval", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v20 = *(double *)&qword_1E8FD4F48;
    if (v19) {
      double v20 = 0.4;
    }
    if (v17 >= v20 || [(_UISheetInteraction *)self isDragging])
    {
      int v21 = 0;
    }
    else
    {
      int v18 = [(_UISheetInteraction *)self animator];
      if (([v18 _isAnimating] & 1) == 0
        && ![(_UISheetInteraction *)self delegateAllowsInteractWithQuicklyScrollingDescendentScrollView])
      {

        BOOL v11 = 1;
        goto LABEL_27;
      }
      int v21 = 1;
    }
    [v7 contentOffset];
    if (v22 >= a5)
    {
      BOOL v11 = 0;
      if ((v21 & 1) == 0)
      {
LABEL_23:
        id v14 = v7;
        if (v13) {
          goto LABEL_28;
        }
        goto LABEL_14;
      }
    }
    else
    {
      double v23 = [v7 panGestureRecognizer];
      [v23 velocityInView:0];
      BOOL v11 = v24 < 0.0;

      if (!v21) {
        goto LABEL_23;
      }
    }

LABEL_27:
    id v14 = v7;
    if (v13) {
      goto LABEL_28;
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 1;
LABEL_15:

  return !v11;
}

- (BOOL)delegateAllowsInteractWithQuicklyScrollingDescendentScrollView
{
  if ((*(unsigned char *)&self->_delegateFlags & 1) == 0) {
    return 0;
  }
  BOOL v3 = self;
  char v4 = [(_UISheetInteraction *)self delegate];
  LOBYTE(v3) = [v4 sheetInteractionShouldInteractWithQuicklyScrollingDescendentScrollView:v3];

  return (char)v3;
}

- (void)draggingBeganFromSource:(id)a3 withRubberBandCoefficient:(double)a4
{
  id v9 = a3;
  if (![(_UISheetInteraction *)self isDragging])
  {
    kdebug_trace();
    _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, updateRequest, 0x100024u);
    _UIQOSManagedCommitsBegin(self, @"Dragging");
    [(_UISheetInteraction *)self setDragSource:v9];
    id v6 = [(_UISheetInteraction *)self interactor];
    [v6 _setRubberBandCoefficient:a4];

    id v7 = [(_UISheetInteraction *)self interactor];
    [v7 _interactionBegan];

    double v8 = [(_UISheetInteraction *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 _sheetInteractionDraggingBegan:self withRubberBandCoefficient:a4];
    }
  }
}

- (void)draggingChangedInSource:(id)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5 animateChange:(BOOL)a6
{
  BOOL v6 = a6;
  CGPoint v15 = a4;
  CGPoint v14 = a5;
  id v8 = a3;
  if ([(_UISheetInteraction *)self isDragging])
  {
    id v9 = [(_UISheetInteraction *)self dragSource];

    if (v9 == v8)
    {
      double v10 = [(_UISheetInteraction *)self interactor];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke;
      v12[3] = &unk_1E52D9FC0;
      BOOL v13 = v6;
      v12[4] = self;
      [v10 _interactionChangedCopyingTranslation:&v15 velocity:&v14 mutatingState:v12];

      BOOL v11 = [(_UISheetInteraction *)self delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v11, "_sheetInteractionDraggingChanged:withTranslation:velocity:animateChange:", self, v6, v15.x, v15.y, v14.x, v14.y);
      }
    }
  }
}

- (void)draggingEndedInSource:(id)a3
{
  id v4 = a3;
  if ([(_UISheetInteraction *)self isDragging])
  {
    id v5 = [(_UISheetInteraction *)self dragSource];

    if (v5 == v4)
    {
      kdebug_trace();
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, updateRequest, 0x100024u);
      _UIQOSManagedCommitsEnd(self, @"Dragging");
      [(_UISheetInteraction *)self setGeneratingAnimations:1];
      BOOL v6 = [(_UISheetInteraction *)self interactor];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45___UISheetInteraction_draggingEndedInSource___block_invoke;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      [v6 _interactionEndedMutatingState:v8];

      [(_UISheetInteraction *)self setGeneratingAnimations:0];
      id v7 = [(_UISheetInteraction *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v7 _sheetInteractionDraggingEnded:self];
      }
      [(_UISheetInteraction *)self setIndexOfCurrentDetent:0];
    }
  }
}

- (id)_currentDragPanGesture
{
  id v2 = [(_UISheetInteraction *)self dragSource];
  if ([v2 _isGestureType:8])
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 panGestureRecognizer];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (void)_hyperOutOfProcessViewAnimator:(id)a3 getPresentationPointForInterruptedAnimation:(double *)a4
{
  BOOL v6 = [(_UISheetInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UISheetInteraction *)self delegate];
    [v8 offsetForInterruptedAnimationInSheetInteraction:self];
    uint64_t v10 = v9;
    uint64_t v12 = v11;

    *(void *)a4 = v10;
    *((void *)a4 + 1) = v12;
  }
}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UISheetInteraction *)self animator];
  [v8 _animateWithParameters:v7 animations:v6];
}

- (int64_t)indexOfCurrentDetent
{
  return self->_indexOfCurrentDetent;
}

- (void)setIndexOfCurrentDetent:(int64_t)a3
{
  self->_indexOfCurrentDetent = a3;
}

- (BOOL)scrollingExpandsToLargerDetentWhenScrolledToEdge
{
  return self->_scrollingExpandsToLargerDetentWhenScrolledToEdge;
}

- (BOOL)isScrollInteractionEnabled
{
  return self->_scrollInteractionEnabled;
}

- (void)setGeneratingAnimations:(BOOL)a3
{
  self->_generatingAnimations = a3;
}

- (id)currentOffsetWasInvalidated
{
  return self->_currentOffsetWasInvalidated;
}

- (id)rubberBandExtentBeyondMinimumOffsetGetter
{
  return self->_rubberBandExtentBeyondMinimumOffsetGetter;
}

- (id)rubberBandExtentBeyondMaximumOffsetGetter
{
  return self->_rubberBandExtentBeyondMaximumOffsetGetter;
}

- (_UISheetInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISheetInteractionDelegate *)WeakRetained;
}

- (_UIHyperAsymmetricExtender)extender
{
  return self->_extender;
}

- (_UIHyperOutOfProcessViewAnimator)animator
{
  return self->_animator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_extender, 0);
  objc_storeStrong((id *)&self->_detentContinuum, 0);
  objc_storeStrong((id *)&self->_detentUnion, 0);
  objc_storeStrong((id *)&self->_detentPoints, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_backgroundGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_registeredPanGestureRecognizers, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_rubberBandExtentBeyondMaximumOffsetGetter, 0);
  objc_storeStrong(&self->_rubberBandExtentBeyondMinimumOffsetGetter, 0);
  objc_storeStrong(&self->_currentOffsetWasInvalidated, 0);
  objc_storeStrong(&self->_indexOfCurrentDetentGetter, 0);
  objc_storeStrong(&self->_detentGetter, 0);
  objc_storeStrong(&self->_numberOfDetentsGetter, 0);
}

@end