@interface UIKeyboardCandidateController
+ (double)candidateViewAnimationDuration;
+ (id)sharedInstance;
- (BOOL)adjustForLeftHandBias;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)barIsExtended;
- (BOOL)darkKeyboard;
- (BOOL)darkKeyboardChanged;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleNumberKey:(unint64_t)a3;
- (BOOL)handleTabKeyWithShift:(BOOL)a3;
- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)hasCandidates;
- (BOOL)hideDisambiguationCandidates;
- (BOOL)hostTextIsVertical;
- (BOOL)inLineCandidateViewIsHosted;
- (BOOL)inlineRectIsVertical;
- (BOOL)inlineViewIsExtended;
- (BOOL)isExtended;
- (BOOL)isExtendedList;
- (BOOL)isFloatingList;
- (BOOL)isKeyExtended;
- (BOOL)isTextEffectsButtonPresented;
- (BOOL)reuseArrowButtonToExpandAssistantBarItems;
- (BOOL)shouldShowDisambiguationCandidates;
- (BOOL)shouldShowSortControlForConfiguration:(id)a3;
- (BOOL)showCandidate:(id)a3;
- (BOOL)showCandidate:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (CGRect)inlineRect;
- (CGSize)maximumSizeForInlineView;
- (NSArray)activeCandidateViews;
- (NSDictionary)opacities;
- (NSMutableArray)activeViews;
- (NSString)inlineText;
- (TIKeyboardCandidate)currentCandidate;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TUICandidateView)bar;
- (TUICandidateView)inlineView;
- (TUICandidateView)key;
- (UIEdgeInsets)candidateBarEdgeInsetsForOrientation:(int64_t)a3;
- (UIKBRenderConfig)renderConfig;
- (UIKBScreenTraits)screenTraits;
- (UIKeyboardCandidateController)init;
- (UIKeyboardCandidateControllerDelegate)delegate;
- (UIKeyboardCandidateInlineFloatingView)inlineViewContainer;
- (UIKeyboardCandidateListDelegate)candidateListDelegate;
- (UIKeyboardCandidateSceneHostingController)hostingController;
- (UIKeyboardCandidateViewConfiguration)barConfiguration;
- (UIKeyboardCandidateViewConfiguration)inlineConfiguration;
- (UIKeyboardCandidateViewConfiguration)keyConfiguration;
- (UIKeyboardCandidateViewState)barState;
- (UIKeyboardCandidateViewState)extendedBarState;
- (UIKeyboardCandidateViewState)extendedInlineViewState;
- (UIKeyboardCandidateViewState)extendedKeyState;
- (UIKeyboardCandidateViewState)extendedScrolledBarState;
- (UIKeyboardCandidateViewState)inlineViewState;
- (UIKeyboardCandidateViewState)keyState;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)candidateBar;
- (UIView)candidateKey;
- (UIView)hostedInlineViewContainer;
- (UIView)hostingParentView;
- (UIView)inlineCandidateView;
- (UIViewPropertyAnimator)animator;
- (double)additionalExtendedBarBackdropOffset;
- (double)candidateBarHeight;
- (double)candidateBarHeightForOrientation:(int64_t)a3;
- (double)candidateBarWidth;
- (double)rowHeightForBarForOrientation:(int64_t)a3;
- (double)singleSlottedCellMargin;
- (double)splitGap;
- (id)candidateAtIndex:(unint64_t)a3;
- (id)firstNonEmptyActiveCandidateView;
- (id)keyboardBehaviors;
- (id)loadCandidateBar;
- (id)loadInProcessInlineCandidateView;
- (id)loadInlineCandidateView;
- (id)newCandidateKeyWithFrame:(CGRect)a3 configuration:(id)a4;
- (id)obtainHideDisambiguationCandidatesAssertionForReason:(id)a3;
- (id)secureCandidateRenderTraits;
- (id)snapshot;
- (id)statisticsIdentifier;
- (int64_t)activeCandidateViewType;
- (int64_t)candidateViewTypeForView:(id)a3;
- (int64_t)layoutDirectionForCurrentInputMode;
- (int64_t)rowForCandidateAtIndex:(unint64_t)a3;
- (int64_t)viewOffsetForCandidateAtIndex:(unint64_t)a3;
- (unint64_t)currentIndex;
- (unint64_t)selectedSortIndex;
- (void)_setRenderConfig:(id)a3;
- (void)acceptSelectedCandidate;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)candidateAcceptedAtIndex:(unint64_t)a3;
- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6;
- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6 generateFeedback:(BOOL)a7;
- (void)candidateViewDidTapArrowButton:(id)a3;
- (void)candidateViewDidTapInlineText:(id)a3;
- (void)candidateViewNeedsToExpand:(id)a3;
- (void)candidateViewSelectionDidChange:(id)a3 inGridType:(int64_t)a4;
- (void)candidateViewWillBeginDragging:(id)a3;
- (void)candidatesDidChange;
- (void)clearCurrentCandidate;
- (void)clientExpandedStateChanged:(BOOL)a3;
- (void)clientStateChangedWithIsExpanded:(BOOL)a3 isVisible:(BOOL)a4;
- (void)clientVisibilityChanged:(BOOL)a3;
- (void)collapse;
- (void)dealloc;
- (void)dimKeys:(id)a3;
- (void)extendKeyboardBackdropHeight:(double)a3;
- (void)hostedInlineFloatingViewFrameUpdated;
- (void)hostedInlineFloatingViewIsTextVerticalUpdated:(BOOL)a3;
- (void)loadDefaultStates;
- (void)panGestureRecognizerAction:(id)a3;
- (void)removeInlineView;
- (void)resetHostedInlineCandidateView;
- (void)resetSortControlIndexAfterCandidatesChanged;
- (void)revealHiddenCandidates;
- (void)setActiveCandidateViewType:(int64_t)a3;
- (void)setActiveViews:(id)a3;
- (void)setAdditionalExtendedBarBackdropOffset:(double)a3;
- (void)setAdjustForLeftHandBias:(BOOL)a3;
- (void)setAnimator:(id)a3;
- (void)setBar:(id)a3;
- (void)setBarConfiguration:(id)a3;
- (void)setBarState:(id)a3;
- (void)setCandidateListDelegate:(id)a3;
- (void)setCandidateResultSet:(id)a3;
- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7;
- (void)setCandidates:(id)a3 type:(int)a4 inlineText:(id)a5 inlineRect:(CGRect)a6 maxX:(double)a7 layout:(BOOL)a8;
- (void)setCandidates:(id)a3 type:(int)a4 inlineText:(id)a5 inlineRect:(CGRect)a6 maxX:(double)a7 layout:(BOOL)a8 inlineCandidatesAreHosted:(BOOL)a9;
- (void)setCurrentCandidate:(id)a3;
- (void)setDarkKeyboard:(BOOL)a3;
- (void)setDarkKeyboardChanged:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExtendedBarState:(id)a3;
- (void)setExtendedInlineViewState:(id)a3;
- (void)setExtendedKeyState:(id)a3;
- (void)setExtendedScrolledBarState:(id)a3;
- (void)setHideDisambiguationCandidates:(BOOL)a3;
- (void)setHostedInlineViewContainer:(id)a3;
- (void)setHostingController:(id)a3;
- (void)setInlineConfiguration:(id)a3;
- (void)setInlineRect:(CGRect)a3;
- (void)setInlineRectIsVertical:(BOOL)a3;
- (void)setInlineState:(id)a3 extended:(BOOL)a4 animated:(BOOL)a5 options:(unint64_t)a6 force:(BOOL)a7 completion:(id)a8;
- (void)setInlineText:(id)a3;
- (void)setInlineView:(id)a3;
- (void)setInlineViewContainer:(id)a3;
- (void)setInlineViewState:(id)a3;
- (void)setIsExtended:(BOOL)a3;
- (void)setIsTextEffectsButtonPresented:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeyConfiguration:(id)a3;
- (void)setKeyState:(id)a3;
- (void)setOpacities:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setReuseArrowButtonToExpandAssistantBarItems:(BOOL)a3;
- (void)setScreenTraits:(id)a3;
- (void)setSingleSlottedCellMargin:(double)a3;
- (void)setSplitGap:(double)a3;
- (void)setUIKeyboardCandidateListDelegate:(id)a3;
- (void)setupAnimatorWithCurve:(int64_t)a3;
- (void)setupPanGestureRecognizerIfNeeded;
- (void)showCandidateAtIndex:(unint64_t)a3;
- (void)showCandidateAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)syncIsExtended;
- (void)toggleBarExtended;
- (void)toggleBarExtendedUnanimated;
- (void)toggleBarExtendedWithAnimator:(id)a3;
- (void)toggleCandidateView:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)toggleInlineViewExtendedAnimated:(BOOL)a3 completion:(id)a4;
- (void)toggleKeyViewExtendedAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateArrowButtonImageNameToState:(id)a3;
- (void)updateConfigurations;
- (void)updateHostedInlineCandidatesWithInlineText:(id)a3 type:(int)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7;
- (void)updateOpacitiesToState:(id)a3;
- (void)updateStates;
- (void)updateStatesForBar;
- (void)updateStatesForInlineView;
- (void)updateStatesForKey;
- (void)updateStyles;
@end

@implementation UIKeyboardCandidateController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__UIKeyboardCandidateController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2615A0 != -1) {
    dispatch_once(&qword_1EB2615A0, block);
  }
  v2 = (void *)_MergedGlobals_1110;
  return v2;
}

void __47__UIKeyboardCandidateController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1110;
  _MergedGlobals_1110 = (uint64_t)v1;
}

- (UIKeyboardCandidateController)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardCandidateController;
  v2 = [(UIKeyboardCandidateController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    activeViews = v2->_activeViews;
    v2->_activeViews = (NSMutableArray *)v3;

    v2->_adjustForLeftHandBias = 1;
    v2->_hideDisambiguationCandidates = 0;
    v5 = [[_UIAssertionController alloc] initWithAssertionSubject:v2];
    assertionController = v2->_assertionController;
    v2->_assertionController = v5;
  }
  return v2;
}

- (void)dealloc
{
  [(TUICandidateView *)self->_bar removeFromSuperview];
  [(UIView *)self->_inlineViewContainer removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardCandidateController;
  [(UIKeyboardCandidateController *)&v3 dealloc];
}

- (UIView)candidateBar
{
  return (UIView *)self->_bar;
}

- (UIView)candidateKey
{
  return (UIView *)self->_key;
}

- (UIView)inlineCandidateView
{
  return (UIView *)self->_inlineViewContainer;
}

- (id)loadCandidateBar
{
  bar = self->_bar;
  if (!bar)
  {
    [(UIKeyboardCandidateController *)self loadDefaultStates];
    v4 = (TUICandidateView *)objc_msgSend(objc_alloc((Class)getTUICandidateViewClass()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v5 = self->_bar;
    self->_bar = v4;

    [(TUICandidateView *)self->_bar setState:self->_barState];
    [(TUICandidateView *)self->_bar setDelegate:self];
    bar = self->_bar;
  }
  return bar;
}

- (id)loadInlineCandidateView
{
  if (!self->_inlineView && !self->_hostedInlineViewContainer)
  {
    [(UIKeyboardCandidateController *)self loadDefaultStates];
    objc_super v3 = +[UIKeyboardImpl activeInstance];
    v4 = [v3 inputOverlayContainer];

    v5 = [(UIKeyboardCandidateController *)self loadInProcessInlineCandidateView];
    [(UIView *)self->_inlineViewContainer setHidden:1];
    inlineViewContainer = self->_inlineViewContainer;
    if (!inlineViewContainer)
    {
      v7 = [UIKeyboardCandidateInlineFloatingView alloc];
      objc_super v8 = -[UIKeyboardCandidateInlineFloatingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v9 = self->_inlineViewContainer;
      self->_inlineViewContainer = v8;

      [(UIView *)self->_inlineViewContainer setHidden:1];
      inlineViewContainer = self->_inlineViewContainer;
    }
    v10 = +[UITraitCollection traitCollectionWithUserInterfaceLevel:1];
    [(UIView *)inlineViewContainer _setLocalOverrideTraitCollection:v10];

    [(UIView *)self->_inlineViewContainer addSubview:v5];
    if (v4 != self->_inlineViewContainer) {
      -[UIView addSubview:](v4, "addSubview:");
    }
  }
  v11 = self->_inlineViewContainer;
  return v11;
}

- (id)loadInProcessInlineCandidateView
{
  objc_super v3 = (TUICandidateView *)objc_msgSend(objc_alloc((Class)getTUICandidateViewClass()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  inlineView = self->_inlineView;
  self->_inlineView = v3;

  [(TUICandidateView *)self->_inlineView setState:self->_inlineViewState];
  [(TUICandidateView *)self->_inlineView setDelegate:self];
  v5 = self->_inlineView;
  return v5;
}

- (id)newCandidateKeyWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIKeyboardCandidateController *)self setKeyConfiguration:a4];
  v9 = (TUICandidateView *)objc_msgSend(objc_alloc((Class)getTUICandidateViewClass()), "initWithFrame:", x, y, width, height);
  kedouble y = self->_key;
  self->_kedouble y = v9;
  v11 = v9;

  [(TUICandidateView *)self->_key setDelegate:self];
  v12 = self->_key;

  return v12;
}

- (void)setActiveCandidateViewType:(int64_t)a3
{
  char v3 = a3;
  self->_activeCandidateViewType = a3;
  [(NSMutableArray *)self->_activeViews removeAllObjects];
  if ((v3 & 1) != 0 && self->_key)
  {
    activeViews = self->_activeViews;
    v6 = [(UIKeyboardCandidateController *)self key];
    [(NSMutableArray *)activeViews addObject:v6];
  }
  if ((v3 & 2) != 0)
  {
    id v9 = [(UIKeyboardCandidateController *)self loadCandidateBar];
    v10 = self->_activeViews;
    objc_super v8 = [(UIKeyboardCandidateController *)self bar];
    [(NSMutableArray *)v10 addObject:v8];
  }
  else
  {
    v7 = +[UIKeyboardImpl activeInstance];
    objc_super v8 = [v7 _layout];

    [v8 setHidden:0];
  }

  if ((v3 & 4) != 0)
  {
    id v11 = [(UIKeyboardCandidateController *)self loadInlineCandidateView];
    if (![(UIKeyboardCandidateController *)self inLineCandidateViewIsHosted])
    {
      v12 = self->_activeViews;
      id v13 = [(UIKeyboardCandidateController *)self inlineView];
      [(NSMutableArray *)v12 addObject:v13];
    }
  }
}

- (NSArray)activeCandidateViews
{
  v2 = (void *)[(NSMutableArray *)self->_activeViews copy];
  return (NSArray *)v2;
}

- (int64_t)candidateViewTypeForView:(id)a3
{
  v4 = (TUICandidateView *)a3;
  if (self->_bar == v4)
  {
    int64_t v5 = 2;
  }
  else if (self->_inlineView == v4)
  {
    int64_t v5 = 4;
  }
  else
  {
    int64_t v5 = self->_key == v4;
  }

  return v5;
}

- (id)firstNonEmptyActiveCandidateView
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIKeyboardCandidateController *)self activeViews];
  v4 = [v3 firstObject];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v5 = [(UIKeyboardCandidateController *)self activeViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 candidateResultSet];
        int v12 = [v11 hasCandidates];

        if (v12)
        {
          id v13 = v10;

          v4 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)inLineCandidateViewIsHosted
{
  return 0;
}

- (void)resetHostedInlineCandidateView
{
  if ([(UIKeyboardCandidateController *)self inLineCandidateViewIsHosted])
  {
    [(UIKeyboardCandidateController *)self removeInlineView];
  }
}

- (void)updateConfigurations
{
  char v3 = +[UIKeyboardInputModeController sharedInputModeController];
  id v54 = [v3 currentInputMode];

  v4 = [(UIKeyboardCandidateController *)self screenTraits];
  unint64_t v5 = [v4 orientation] - 3;

  uint64_t v6 = [(UIKeyboardCandidateController *)self screenTraits];
  uint64_t v7 = [v6 idiom];

  if (v7 == 1)
  {
    uint64_t v8 = [(UIKeyboardCandidateController *)self bar];
    id v9 = [v8 _rootInputWindowController];
    v10 = [v9 placement];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v20 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v21 = [v20 containerRootController];
      id v12 = [v21 placement];
    }
    if ([v12 isFloatingAssistantView])
    {
      v22 = off_1E52D3F40;
      if (v5 < 2) {
        v22 = off_1E52D3F48;
      }
    }
    else
    {
      if (+[UIKeyboardImpl isSplit]
        && (+[UIKeyboardImpl activeInstance],
            v23 = objc_claimAutoreleasedReturnValue(),
            char v24 = [v23 centerFilled],
            v23,
            (v24 & 1) == 0))
      {
        v28 = [v54 identifier];
        v29 = TIInputModeGetBaseLanguage();
        int v30 = [v29 isEqualToString:@"ja"];

        v22 = off_1E52D3F70;
        v26 = off_1E52D3F78;
        BOOL v27 = v30 == 0;
      }
      else
      {
        BOOL v25 = +[UIKeyboardImpl isFloating];
        v22 = off_1E52D3F30;
        if (v5 < 2) {
          v22 = off_1E52D3F38;
        }
        v26 = off_1E52D3F50;
        BOOL v27 = !v25;
      }
      if (!v27) {
        v22 = v26;
      }
    }
    v31 = [(__objc2_class *)*v22 configuration];
    [(UIKeyboardCandidateController *)self setBarConfiguration:v31];

    v32 = +[UIKeyboardImpl activeInstance];
    int v33 = [v32 liveConversionEnabled];

    BOOL v34 = [(UIKeyboardCandidateController *)self inlineRectIsVertical];
    BOOL v35 = v34;
    if (v33)
    {
      v36 = [v54 identifier];
      v37 = TIInputModeGetVariant();
      int v38 = [v37 isEqualToString:@"Zhuyin"];

      if (v35)
      {
        v39 = off_1E52D3F80;
        v40 = off_1E52D3F88;
      }
      else
      {
        v39 = off_1E52D3F60;
        v40 = off_1E52D3F68;
      }
      BOOL v41 = v38 == 0;
    }
    else
    {
      v39 = off_1E52D3F58;
      v40 = off_1E52D3F80;
      BOOL v41 = !v34;
    }
    if (!v41) {
      v39 = v40;
    }
    v42 = [(__objc2_class *)*v39 configuration];
    [(UIKeyboardCandidateController *)self setInlineConfiguration:v42];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      v53 = TIGetCandidateViewExperimentsValue();
      unint64_t v13 = [v53 integerValue];
    }
    else
    {
      unint64_t v13 = 0;
    }
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    long long v15 = [(UIKeyboardCandidateController *)self screenTraits];
    +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", [v15 orientation], v54);
    double v17 = v16;

    if (v17 <= 0.0)
    {
      if (v5 >= 2)
      {
        if (v13 >= 2)
        {
          v43 = [(UIKeyboardCandidateController *)self screenTraits];
          [v43 bounds];
          double v45 = v44;

          v46 = [(UIKeyboardCandidateController *)self screenTraits];
          [v46 bounds];
          double v48 = v47;

          if (v45 >= v48) {
            double v49 = v45;
          }
          else {
            double v49 = v48;
          }
          BOOL v50 = v14 != 2 && v49 <= 568.0;
          long long v18 = off_1E52D3F90;
          if (!v50) {
            long long v18 = off_1E52D3FB8;
          }
        }
        else
        {
          long long v18 = off_1E52D3F98;
        }
      }
      else
      {
        long long v18 = off_1E52D3FA8;
      }
    }
    else
    {
      long long v18 = off_1E52D3FB0;
      v19 = off_1E52D3FC0;
      if (v13 < 2) {
        v19 = off_1E52D3FA0;
      }
      if (v5 >= 2) {
        long long v18 = v19;
      }
    }
    v51 = [(__objc2_class *)*v18 configuration];
    [(UIKeyboardCandidateController *)self setBarConfiguration:v51];

    if ([(UIKeyboardCandidateController *)self inlineRectIsVertical]) {
      v52 = UIKeyboardCandidateViewConfigurationPhoneVerticalInline;
    }
    else {
      v52 = UIKeyboardCandidateViewConfigurationPhoneInline;
    }
    id v12 = [(__objc2_class *)v52 configuration];
    [(UIKeyboardCandidateController *)self setInlineConfiguration:v12];
  }

  [(UIKeyboardCandidateController *)self updateStyles];
}

- (void)loadDefaultStates
{
  if (!self->_barState)
  {
    [(UIKeyboardCandidateController *)self updateConfigurations];
    char v3 = [(UIKeyboardCandidateController *)self barConfiguration];
    v4 = [v3 initialState];
    barState = self->_barState;
    self->_barState = v4;

    uint64_t v6 = [(UIKeyboardCandidateController *)self barConfiguration];
    uint64_t v7 = [v6 extendedState];
    extendedBarState = self->_extendedBarState;
    self->_extendedBarState = v7;

    id v11 = [(UIKeyboardCandidateController *)self barConfiguration];
    id v9 = [v11 extendedScrolledState];
    extendedScrolledBarState = self->_extendedScrolledBarState;
    self->_extendedScrolledBarState = v9;
  }
}

- (void)updateStyles
{
  BOOL v3 = [(UIKeyboardCandidateController *)self darkKeyboard];
  v4 = [(UIKeyboardCandidateController *)self barConfiguration];
  [v4 setDarkKeyboard:v3];

  BOOL v5 = [(UIKeyboardCandidateController *)self darkKeyboard];
  uint64_t v6 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  [v6 setDarkKeyboard:v5];

  BOOL v7 = [(UIKeyboardCandidateController *)self darkKeyboard];
  id v8 = [(UIKeyboardCandidateController *)self keyConfiguration];
  [v8 setDarkKeyboard:v7];
}

- (void)updateStates
{
  [(UIKeyboardCandidateController *)self updateConfigurations];
  [(UIKeyboardCandidateController *)self updateStatesForBar];
  [(UIKeyboardCandidateController *)self updateStatesForInlineView];
  [(UIKeyboardCandidateController *)self updateStatesForKey];
}

- (BOOL)shouldShowSortControlForConfiguration:(id)a3
{
  if ([a3 shouldAlwaysShowSortControl]) {
    return 1;
  }
  BOOL v5 = [(UIKeyboardCandidateController *)self candidateResultSet];
  uint64_t v6 = [v5 sortMethods];
  BOOL v4 = (unint64_t)[v6 count] > 1;

  return v4;
}

- (BOOL)shouldShowDisambiguationCandidates
{
  BOOL v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [v3 currentLinguisticInputMode];
  BOOL v5 = [v4 identifier];
  uint64_t v6 = [&unk_1ED3F4680 stringValue];
  BOOL v7 = [@"Pinyin" stringByAppendingString:v6];
  if ([v5 rangeOfString:v7] == 0x7FFFFFFFFFFFFFFFLL) {
    LOBYTE(v8) = 0;
  }
  else {
    BOOL v8 = ![(UIKeyboardCandidateController *)self hideDisambiguationCandidates];
  }

  return v8;
}

- (void)setHideDisambiguationCandidates:(BOOL)a3
{
  if (self->_hideDisambiguationCandidates != a3)
  {
    self->_hideDisambiguationCandidates = a3;
    [(UIKeyboardCandidateController *)self updateStates];
  }
}

- (void)updateStatesForBar
{
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 2) == 0) {
    return;
  }
  BOOL v3 = [(UIKeyboardCandidateController *)self bar];
  BOOL v4 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  [v4 setViewForTraitCollection:v3];

  BOOL v5 = [(UIKeyboardCandidateController *)self barConfiguration];
  uint64_t v6 = [v5 initialState];

  BOOL v7 = [(UIKeyboardCandidateController *)self barConfiguration];
  BOOL v8 = [v7 extendedState];

  id v9 = [(UIKeyboardCandidateController *)self barConfiguration];
  v10 = [v9 extendedScrolledState];

  id v11 = [(UIKeyboardCandidateController *)self screenTraits];
  -[UIKeyboardCandidateController rowHeightForBarForOrientation:](self, "rowHeightForBarForOrientation:", [v11 orientation]);
  double v13 = v12;

  uint64_t v14 = [v6 style];
  [v14 setRowHeight:v13];

  long long v15 = [v8 style];
  [v15 setRowHeight:v13];

  double v16 = [v10 style];
  [v16 setRowHeight:v13];

  if (self->_activeCandidateViewType == 6)
  {
    [v6 setArrowButtonPosition:0];
    double v17 = [v6 style];
    long long v18 = [v17 arrowButtonSeparatorImage];
    v19 = [v6 style];
    [v19 setRightEdgeSeparatorImage:v18];
  }
  [(UIKeyboardCandidateController *)self setAdditionalExtendedBarBackdropOffset:0.0];
  uint64_t v20 = +[UIKeyboardImpl activeInstance];
  v21 = [v20 inputDelegateManager];
  v22 = [v21 forwardingInputDelegate];

  if ([(UIKeyboardCandidateController *)self barIsExtended])
  {
    v23 = [(UIKeyboardCandidateController *)self extendedBarState];
    [v23 yOffset];
    objc_msgSend(v8, "setYOffset:");

    char v24 = [(UIKeyboardCandidateController *)self extendedBarState];
    [v24 additionalHeight];
    objc_msgSend(v8, "setAdditionalHeight:");

    BOOL v25 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];
    [v25 yOffset];
    objc_msgSend(v10, "setYOffset:");

    v26 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];
    [v26 additionalHeight];
    objc_msgSend(v10, "setAdditionalHeight:");

    goto LABEL_37;
  }
  BOOL v27 = +[UIKeyboardImpl activeInstance];
  [v27 frame];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  int v262 = [v27 showsCandidateBar];
  v36 = +[UIKeyboardInputModeController sharedInputModeController];
  v37 = [v36 currentInputMode];

  int v38 = [(UIKeyboardCandidateController *)self screenTraits];
  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", [v38 orientation], v37);
  double v40 = v39;

  BOOL v41 = [(UIKeyboardCandidateController *)self screenTraits];
  +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", [v41 orientation], v37);
  double v43 = v42;

  v268.origin.double x = v29;
  v268.origin.double y = v31;
  v268.size.double width = v33;
  v268.size.double height = v35;
  double v44 = v40 + CGRectGetHeight(v268) - v43;
  double v45 = [(UIKeyboardCandidateController *)self screenTraits];
  -[UIKeyboardCandidateController candidateBarEdgeInsetsForOrientation:](self, "candidateBarEdgeInsetsForOrientation:", [v45 orientation]);
  double v47 = v46;

  double v48 = [(UIKeyboardCandidateController *)self screenTraits];
  -[UIKeyboardCandidateController candidateBarHeightForOrientation:](self, "candidateBarHeightForOrientation:", [v48 orientation]);
  double v50 = v47 + v49;

  v51 = [v27 window];
  if (v51) {
    [v27 window];
  }
  else {
  v52 = [(UIKeyboardCandidateController *)self screenTraits];
  }
  [v52 bounds];
  double Height = CGRectGetHeight(v269);

  double v54 = v44 + v50;
  v55 = [(UIKeyboardCandidateController *)self barConfiguration];
  uint64_t v56 = [v55 rowsToExtend];

  if (v56)
  {
    v57 = [(UIKeyboardCandidateController *)self extendedBarState];
    v58 = [v57 style];
    [v58 rowHeight];
    double v60 = v59;
    v61 = [(UIKeyboardCandidateController *)self barConfiguration];
    double v62 = v60 * (double)(unint64_t)[v61 rowsToExtend];

    v63 = [(UIKeyboardCandidateController *)self barConfiguration];
    LODWORD(v57) = [(UIKeyboardCandidateController *)self shouldShowSortControlForConfiguration:v63];

    double v64 = 0.0;
    if (v57)
    {
      v65 = [(UIKeyboardCandidateController *)self extendedBarState];
      v66 = [v65 style];
      [v66 rowHeight];
      double v62 = v62 + v67;
    }
  }
  else
  {
    v68 = [v27 window];
    v69 = __UIStatusBarManagerForWindow(v68);
    [v69 statusBarHeight];
    double v71 = v70;

    double v64 = 0.0;
    if (v71 > v47)
    {
      [(UIKeyboardCandidateController *)self setAdditionalExtendedBarBackdropOffset:-(v71 - v47)];
      double v64 = v71;
    }
    double v62 = v47 + Height - v54 - v71;
  }
  if ([v6 arrowButtonDirection])
  {
    double v72 = v54 - v40;
    double v73 = 0.0;
    if (v262) {
      double v73 = v50;
    }
    double v74 = v72 - v73;
    [v8 setAdditionalHeight:v72 - v73];
    v75 = v10;
    double v76 = v74;
  }
  else
  {
    if (v22)
    {
      uint64_t v264 = 0;
      v265 = &v264;
      uint64_t v266 = 0x2050000000;
      v77 = (void *)qword_1EB2615B8;
      uint64_t v267 = qword_1EB2615B8;
      if (!qword_1EB2615B8)
      {
        v263[0] = MEMORY[0x1E4F143A8];
        v263[1] = 3221225472;
        v263[2] = __getTUIEmojiSearchTextFieldClass_block_invoke_0;
        v263[3] = &unk_1E52D9900;
        v263[4] = &v264;
        __getTUIEmojiSearchTextFieldClass_block_invoke_0((uint64_t)v263);
        v77 = (void *)v265[3];
      }
      id v78 = v77;
      _Block_object_dispose(&v264, 8);
      [v78 preferredHeight];
      double v54 = v54 + v79;
    }
    [v8 setYOffset:-v62];
    [v8 setAdditionalHeight:v62];
    [v10 setYOffset:-v62 - v54];
    double v76 = Height - v50 - v64;
    v75 = v10;
  }
  [v75 setAdditionalHeight:v76];
  if ([v27 usesContinuousPath])
  {
    if (qword_1EB2615C0 != -1) {
      dispatch_once(&qword_1EB2615C0, &__block_literal_global_589);
    }
    v80 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    v81 = [v80 valueForPreferenceKey:@"DisableCPCandidateBarScrolling"];

    LODWORD(v80) = [v81 BOOLValue];
    if (v80)
    {
      v82 = [v6 style];
      [v82 setScrollDisabled:1];
    }
  }
  if (-[UIKeyboardCandidateController reuseArrowButtonToExpandAssistantBarItems](self, "reuseArrowButtonToExpandAssistantBarItems")&& [v6 arrowButtonPosition] == 7)
  {
    v83 = [(UIKeyboardCandidateController *)self candidateResultSet];
    if ([v83 hasCandidates])
    {
      v84 = [(UIKeyboardCandidateController *)self candidateResultSet];
      int v85 = [v84 hasOnlyCompletionCandidates];

      if (!v85) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    [v6 setArrowButtonDirection:2];
  }
LABEL_36:

LABEL_37:
  if ([v6 arrowButtonPosition] == 2)
  {
    double v86 = 0.0;
    if (+[UIKeyboardImpl isSplit])
    {
      v87 = +[UIKeyboardImpl activeInstance];
      char v88 = [v87 centerFilled];

      if ((v88 & 1) == 0)
      {
        [(UIKeyboardCandidateController *)self splitGap];
        double v86 = v89;
      }
    }
    objc_msgSend(v6, "setArrowButtonOffset:", v86, 0.0);
    objc_msgSend(v8, "setArrowButtonOffset:", v86, 0.0);
    objc_msgSend(v10, "setArrowButtonOffset:", v86, 0.0);
    v90 = [v6 style];
    [v90 rowHeight];
    double v92 = v91;
    v93 = [v8 style];
    [v93 setRowHeight:v92];

    v94 = [v6 style];
    [v94 rowHeight];
    double v96 = v95;
    v97 = [v10 style];
    [v97 setRowHeight:v96];
  }
  v98 = [(UIKeyboardCandidateController *)self barConfiguration];
  BOOL v99 = [(UIKeyboardCandidateController *)self shouldShowSortControlForConfiguration:v98];

  if (!v99)
  {
    [v8 setSortControlPosition:0];
    [v10 setSortControlPosition:0];
  }
  if (![(UIKeyboardCandidateController *)self shouldShowDisambiguationCandidates]) {
    [v6 setDisambiguationGridPosition:0];
  }
  if (![(UIKeyboardCandidateController *)self shouldShowDisambiguationCandidatesInExtendedView])
  {
    [v8 setDisambiguationGridPosition:0];
    [v10 setDisambiguationGridPosition:0];
  }
  v100 = +[UIKeyboardImpl activeInstance];
  uint64_t v101 = [v100 currentHandBias];

  if (!v22
    && (v101 == 1 || v101 == 2 && [(UIKeyboardCandidateController *)self adjustForLeftHandBias]))
  {
    v102 = +[UIKeyboardImpl activeInstance];
    [v102 frame];
    double v104 = v103;
    v105 = +[UIKeyboardImpl activeInstance];
    v106 = [v105 _layout];
    [v106 biasedKeyboardWidthRatio];
    double v108 = v104 * (1.0 - v107);

    if (v101 == 1) {
      double v109 = 0.0;
    }
    else {
      double v109 = v108;
    }
    if (v101 != 1) {
      double v108 = 0.0;
    }
    int64_t v110 = [(UIKeyboardCandidateController *)self layoutDirectionForCurrentInputMode];
    if ((v101 != 2) == (v110 == 1))
    {
      v111 = [v6 style];
      objc_msgSend(v111, "setArrowButtonPadding:", 0.0, v108, 0.0, v109);

      v112 = [v8 style];
      objc_msgSend(v112, "setArrowButtonPadding:", 0.0, v108, 0.0, v109);

      v113 = [v10 style];
      objc_msgSend(v113, "setArrowButtonPadding:", 0.0, v108, 0.0, v109);
    }
    if (v110 == 1) {
      double v114 = v108;
    }
    else {
      double v114 = v109;
    }
    if (v110 == 1) {
      double v115 = v109;
    }
    else {
      double v115 = v108;
    }
    v116 = [v6 style];
    [v116 gridPadding];
    double v118 = v117 + 0.0;
    double v120 = v115 + v119;
    double v122 = v121 + 0.0;
    double v124 = v114 + v123;
    v125 = [v6 style];
    objc_msgSend(v125, "setGridPadding:", v118, v120, v122, v124);

    v126 = [v8 style];
    [v126 gridPadding];
    double v128 = v127 + 0.0;
    double v130 = v115 + v129;
    double v132 = v131 + 0.0;
    double v134 = v114 + v133;
    v135 = [v8 style];
    objc_msgSend(v135, "setGridPadding:", v128, v130, v132, v134);

    v136 = [v10 style];
    [v136 gridPadding];
    double v138 = v137 + 0.0;
    double v140 = v115 + v139;
    double v142 = v141 + 0.0;
    double v144 = v114 + v143;
    v145 = [v10 style];
    objc_msgSend(v145, "setGridPadding:", v138, v140, v142, v144);

    v146 = [v6 style];
    [v146 gridPadding];
    double v148 = v147;
    double v150 = v149;
    double v152 = v151;
    double v154 = v153;
    v155 = [v6 style];
    objc_msgSend(v155, "setGridLinePadding:", v148, v150, v152, v154);

    v156 = [v8 style];
    [v156 gridPadding];
    double v158 = v157;
    double v160 = v159;
    double v162 = v161;
    double v164 = v163;
    v165 = [v8 style];
    objc_msgSend(v165, "setGridLinePadding:", v158, v160, v162, v164);

    v166 = [v10 style];
    [v166 gridPadding];
    double v168 = v167;
    double v170 = v169;
    double v172 = v171;
    double v174 = v173;
    v175 = [v10 style];
    objc_msgSend(v175, "setGridLinePadding:", v168, v170, v172, v174);

    v176 = [v6 style];
    [v176 sortControlPadding];
    double v178 = v177 + 0.0;
    double v180 = v115 + v179;
    double v182 = v181 + 0.0;
    double v184 = v114 + v183;
    v185 = [v6 style];
    objc_msgSend(v185, "setSortControlPadding:", v178, v180, v182, v184);

    v186 = [v8 style];
    [v186 sortControlPadding];
    double v188 = v187 + 0.0;
    double v190 = v115 + v189;
    double v192 = v191 + 0.0;
    double v194 = v114 + v193;
    v195 = [v8 style];
    objc_msgSend(v195, "setSortControlPadding:", v188, v190, v192, v194);

    v196 = [v10 style];
    [v196 sortControlPadding];
    double v198 = v197 + 0.0;
    double v200 = v115 + v199;
    double v202 = v201 + 0.0;
    double v204 = v114 + v203;
    v205 = [v10 style];
    objc_msgSend(v205, "setSortControlPadding:", v198, v200, v202, v204);

    v206 = [v6 disambiguationStyle];
    [v206 gridPadding];
    double v208 = v207 + 0.0;
    double v210 = v115 + v209;
    double v212 = v211 + 0.0;
    double v214 = v114 + v213;
    v215 = [v6 disambiguationStyle];
    objc_msgSend(v215, "setGridPadding:", v208, v210, v212, v214);

    v216 = [v8 disambiguationStyle];
    [v216 gridPadding];
    double v218 = v217 + 0.0;
    double v220 = v115 + v219;
    double v222 = v221 + 0.0;
    double v224 = v114 + v223;
    v225 = [v8 disambiguationStyle];
    objc_msgSend(v225, "setGridPadding:", v218, v220, v222, v224);

    v226 = [v10 disambiguationStyle];
    [v226 gridPadding];
    double v228 = v227 + 0.0;
    double v230 = v115 + v229;
    double v232 = v231 + 0.0;
    double v234 = v114 + v233;
    v235 = [v10 disambiguationStyle];
    objc_msgSend(v235, "setGridPadding:", v228, v230, v232, v234);
  }
  v236 = [v6 style];
  [v236 singleSlottedCellMargin];
  if (v237 <= 0.0) {
    goto LABEL_69;
  }
  [(UIKeyboardCandidateController *)self singleSlottedCellMargin];
  double v239 = v238;

  if (v239 > 0.0)
  {
    [(UIKeyboardCandidateController *)self singleSlottedCellMargin];
    double v241 = v240;
    v236 = [v6 style];
    [v236 setSingleSlottedCellMargin:v241];
LABEL_69:
  }
  [(UIKeyboardCandidateController *)self updateOpacitiesToState:v6];
  [(UIKeyboardCandidateController *)self updateArrowButtonImageNameToState:v6];
  v242 = [(UIKeyboardCandidateController *)self barState];
  char v243 = [v242 isEqual:v6];

  if ((v243 & 1) == 0)
  {
    v244 = [(UIKeyboardCandidateController *)self bar];
    v245 = [v244 state];
    v246 = [(UIKeyboardCandidateController *)self barState];

    if (v245 == v246)
    {
      v247 = [(UIKeyboardCandidateController *)self bar];
      [v247 setState:v6 animated:0 force:1 completion:0];

      [(UIKeyboardCandidateController *)self syncIsExtended];
    }
    [(UIKeyboardCandidateController *)self setBarState:v6];
  }
  v248 = [(UIKeyboardCandidateController *)self extendedBarState];
  char v249 = [v248 isEqual:v8];

  if ((v249 & 1) == 0)
  {
    v250 = [(UIKeyboardCandidateController *)self bar];
    v251 = [v250 state];
    v252 = [(UIKeyboardCandidateController *)self extendedBarState];

    if (v251 == v252)
    {
      v253 = [(UIKeyboardCandidateController *)self bar];
      [v253 setState:v8 animated:0 force:1 completion:0];

      [(UIKeyboardCandidateController *)self syncIsExtended];
    }
    [(UIKeyboardCandidateController *)self setExtendedBarState:v8];
  }
  v254 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];
  char v255 = [v254 isEqual:v10];

  if ((v255 & 1) == 0)
  {
    v256 = [(UIKeyboardCandidateController *)self bar];
    v257 = [v256 state];
    v258 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];

    if (v257 == v258)
    {
      v259 = [(UIKeyboardCandidateController *)self bar];
      [v259 setState:v10 animated:0 force:1 completion:0];

      [(UIKeyboardCandidateController *)self syncIsExtended];
    }
    [(UIKeyboardCandidateController *)self setExtendedScrolledBarState:v10];
  }
  v260 = [(UIKeyboardCandidateController *)self bar];
  v261 = +[UITraitCollection traitCollectionWithLayoutDirection:[(UIKeyboardCandidateController *)self layoutDirectionForCurrentInputMode]];
  [v260 _setLocalOverrideTraitCollection:v261];

  [(UIKeyboardCandidateController *)self setupPanGestureRecognizerIfNeeded];
}

- (void)updateStatesForInlineView
{
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) == 0) {
    return;
  }
  BOOL v3 = [(UIKeyboardCandidateController *)self inlineView];
  BOOL v4 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
  [v4 setViewForTraitCollection:v3];

  BOOL v5 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  id v132 = [v5 initialState];

  uint64_t v6 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  BOOL v7 = [v6 extendedState];

  BOOL v8 = +[UIKeyboardImpl activeInstance];
  id v9 = [v8 inputDelegate];

  if (objc_opt_respondsToSelector())
  {
    id v10 = v9;
    id v11 = +[UITextInputTraits traitEnvironmentFromTraits:v10];
    double v12 = [v11 traitCollection];
    double v13 = [v10 insertionPointColor];
    uint64_t v14 = [v13 resolvedColorWithTraitCollection:v12];

    long long v15 = [v132 style];
    [v15 setHighlightedBackgroundColor:v14];

    double v16 = [v7 style];
    [v16 setHighlightedBackgroundColor:v14];

    id v17 = v14;
    long long v18 = [v132 style];
    v19 = [v18 highlightedTextColor];

    [v17 _distanceFrom:v19];
    if (v20 != 1.79769313e308 && v20 <= 0.1)
    {
      v21 = [v17 _inverseColor];
      v22 = [v132 style];
      [v22 setHighlightedTextColor:v21];

      v23 = [v17 _inverseColor];
      char v24 = [v132 style];
      [v24 setHighlightedCandidateNumberColor:v23];

      BOOL v25 = [v17 _inverseColor];
      v26 = [v7 style];
      [v26 setHighlightedTextColor:v25];

      BOOL v27 = [v17 _inverseColor];
      double v28 = [v7 style];
      [v28 setHighlightedCandidateNumberColor:v27];
    }
  }
  +[UIKeyboardCandidateViewConfiguration lineHeightMultiplierForCurrentLanguage];
  double v30 = v29;
  CGFloat v31 = [v132 style];
  [v31 rowHeight];
  double v33 = v30 * v32;
  double v34 = [v132 style];
  [v34 setRowHeight:v33];

  CGFloat v35 = [v7 style];
  [v35 rowHeight];
  double v37 = v30 * v36;
  int v38 = [v7 style];
  [v38 setRowHeight:v37];

  [(UIKeyboardCandidateController *)self inlineRect];
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v130 = v43;
  CGFloat rect = v44;
  double v45 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  double v46 = [v45 superview];
  [v46 bounds];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;

  v55 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  uint64_t v56 = [v55 superview];
  [v56 safeAreaInsets];
  double v58 = v48 + v57;
  double v60 = v50 + v59;
  double v62 = v52 - (v57 + v61);
  double v64 = v54 - (v59 + v63);

  [(UIKeyboardCandidateController *)self candidateBarHeight];
  double v66 = v64 - v65;
  v134.origin.double x = v58;
  v134.origin.double y = v60;
  v134.size.double width = v62;
  v134.size.double height = v66;
  if (CGRectGetHeight(v134) > 0.0)
  {
    v135.origin.double x = v58;
    v135.origin.double y = v60;
    v135.size.double width = v62;
    v135.size.double height = v66;
    if (!CGRectIsNull(v135))
    {
      v136.origin.double x = v58;
      v136.origin.double y = v60;
      v136.size.double width = v62;
      v136.size.double height = v66;
      if (!CGRectIsEmpty(v136))
      {
        v137.origin.double x = v40;
        v137.origin.double y = v42;
        v137.size.double height = rect;
        v137.size.double width = v130;
        double MinY = CGRectGetMinY(v137);
        v138.origin.double x = v58;
        v138.origin.double y = v60;
        v138.size.double width = v62;
        v138.size.double height = v66;
        double MaxY = CGRectGetMaxY(v138);
        v139.origin.double x = v40;
        v139.origin.double y = v42;
        v139.size.double width = v130;
        v139.size.double height = rect;
        double v68 = MaxY - CGRectGetMaxY(v139);
        if (MinY >= v68) {
          double v69 = MinY;
        }
        else {
          double v69 = v68;
        }
        double v70 = objc_msgSend(v7, "style", *(void *)&MinY);
        [v70 rowHeight];
        double v72 = v71;

        double v73 = [(UIKeyboardCandidateController *)self inlineConfiguration];
        [v73 preferredInlineFloatingViewSize];
        double v75 = v74;

        if (v72 < v75) {
          double v72 = v75;
        }
        double v76 = [v7 style];
        [v76 rowHeight];
        if (v77 <= 0.0) {
          goto LABEL_20;
        }
        [v7 additionalHeight];
        double v79 = v72 + v78;

        if (v69 < v79)
        {
          v80 = [v7 style];
          [v80 rowHeight];
          uint64_t v82 = (uint64_t)((v69 - v72) / v81);

          uint64_t v83 = 2;
          if (v82 > 2) {
            uint64_t v83 = v82;
          }
          double v84 = (double)v83;
          double v76 = [v7 style];
          [v76 rowHeight];
          [v7 setAdditionalHeight:v85 * v84];
LABEL_20:
        }
      }
    }
  }
  double v86 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  [v86 preferredInlineFloatingViewSize];
  double v88 = v87;
  double v90 = v89;

  double v91 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  objc_msgSend(v91, "setPreferredSize:", v88, v30 * v90);

  [v7 additionalHeight];
  double v93 = v92;
  v94 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  [v94 setExtendedStateAdditionalHeight:v93];

  double v95 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  uint64_t v96 = [v95 inlineFloatingViewAdjustMode];
  v97 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  [v97 setAdjustMode:v96];

  BOOL v98 = [(UIKeyboardCandidateController *)self inlineRectIsVertical];
  BOOL v99 = [v132 style];
  [v99 minimumCellPadding];
  double v101 = v100;
  v102 = [v132 style];
  [v102 minimumCellPadding];
  double v104 = v103;
  v105 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  v106 = v105;
  double v107 = 0.0;
  if (v98) {
    double v108 = v101;
  }
  else {
    double v108 = 0.0;
  }
  if (v98) {
    double v109 = 0.0;
  }
  else {
    double v109 = v101;
  }
  if (v98) {
    double v110 = v104;
  }
  else {
    double v110 = 0.0;
  }
  if (v98) {
    double v111 = 0.0;
  }
  else {
    double v111 = v104;
  }
  objc_msgSend(v105, "setCellPadding:", v108, v109, v110, v111);

  [(UIKeyboardCandidateController *)self candidateBarHeight];
  double v113 = v112;
  double v114 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  objc_msgSend(v114, "setExtraInsets:", 0.0, 0.0, v113, 0.0);

  double v115 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  if ([v115 shouldExtendUpwards])
  {
    [v7 additionalHeight];
    double v107 = -v116;
  }
  [v7 setYOffset:v107];

  double v117 = [(UIKeyboardCandidateController *)self inlineViewState];
  char v118 = [v117 isEqual:v132];

  if ((v118 & 1) == 0)
  {
    double v119 = [(UIKeyboardCandidateController *)self inlineView];
    double v120 = [v119 state];
    double v121 = [(UIKeyboardCandidateController *)self inlineViewState];

    if (v120 == v121) {
      [(UIKeyboardCandidateController *)self setInlineState:v132 extended:0 animated:0 options:0 force:1 completion:0];
    }
    [(UIKeyboardCandidateController *)self setInlineViewState:v132];
  }
  double v122 = [(UIKeyboardCandidateController *)self extendedInlineViewState];
  char v123 = [v122 isEqual:v7];

  if ((v123 & 1) == 0)
  {
    double v124 = [(UIKeyboardCandidateController *)self inlineView];
    v125 = [v124 state];
    v126 = [(UIKeyboardCandidateController *)self extendedInlineViewState];

    if (v125 == v126) {
      [(UIKeyboardCandidateController *)self setInlineState:v7 extended:1 animated:0 options:0 force:1 completion:0];
    }
    [(UIKeyboardCandidateController *)self setExtendedInlineViewState:v7];
  }
  if (![(UIKeyboardCandidateController *)self inLineCandidateViewIsHosted])
  {
    double v127 = [(UIKeyboardCandidateController *)self inlineView];
    double v128 = +[UITraitCollection traitCollectionWithLayoutDirection:[(UIKeyboardCandidateController *)self layoutDirectionForCurrentInputMode]];
    [v127 _setLocalOverrideTraitCollection:v128];
  }
}

- (void)setInlineState:(id)a3 extended:(BOOL)a4 animated:(BOOL)a5 options:(unint64_t)a6 force:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a3;
  id v15 = [(UIKeyboardCandidateController *)self inlineView];
  [v15 setState:v14 animated:v10 options:a6 force:v8 completion:v13];
}

- (void)updateStatesForKey
{
  if ([(UIKeyboardCandidateController *)self activeCandidateViewType])
  {
    BOOL v3 = [(UIKeyboardCandidateController *)self key];
    BOOL v4 = +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer];
    [v4 setViewForTraitCollection:v3];

    BOOL v5 = [(UIKeyboardCandidateController *)self keyConfiguration];
    id v38 = [v5 initialState];

    uint64_t v6 = [(UIKeyboardCandidateController *)self keyConfiguration];
    BOOL v7 = [v6 extendedState];

    BOOL v8 = [(UIKeyboardCandidateController *)self keyConfiguration];
    if ([(UIKeyboardCandidateController *)self shouldShowSortControlForConfiguration:v8])
    {
      uint64_t v9 = [v38 sortControlPosition];
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v38 setSortControlPosition:v9];

    if ([(UIKeyboardCandidateController *)self shouldShowDisambiguationCandidates]) {
      uint64_t v10 = [v38 disambiguationGridPosition];
    }
    else {
      uint64_t v10 = 0;
    }
    [v38 setDisambiguationGridPosition:v10];
    id v11 = [(UIKeyboardCandidateController *)self keyConfiguration];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v13 = [v38 primaryGridRowType];
      id v14 = [(UIKeyboardCandidateController *)self key];
      [v14 frame];
      double Height = CGRectGetHeight(v40);
      double v16 = ceil(Height * 0.25);
      if (v13 == 1) {
        double v17 = v16;
      }
      else {
        double v17 = Height;
      }

      long long v18 = [v38 style];
      [v18 setRowHeight:v17];

      v19 = [v38 disambiguationStyle];
      [v19 setRowHeight:v17];
    }
    [(UIKeyboardCandidateController *)self updateOpacitiesToState:v38];
    double v20 = [(UIKeyboardCandidateController *)self keyState];
    char v21 = [v20 isEqual:v38];

    if ((v21 & 1) == 0)
    {
      v22 = [(UIKeyboardCandidateController *)self key];
      v23 = [v22 state];
      char v24 = [(UIKeyboardCandidateController *)self keyState];

      if (v23 == v24)
      {
        BOOL v25 = [(UIKeyboardCandidateController *)self key];
        [v25 setState:v38 animated:0 force:1 completion:0];
      }
      [(UIKeyboardCandidateController *)self setKeyState:v38];
    }
    v26 = [(UIKeyboardCandidateController *)self extendedKeyState];
    char v27 = [v26 isEqual:v7];

    if ((v27 & 1) == 0)
    {
      double v28 = [(UIKeyboardCandidateController *)self key];
      double v29 = [v28 state];
      double v30 = [(UIKeyboardCandidateController *)self extendedKeyState];

      if (v29 == v30)
      {
        CGFloat v31 = [(UIKeyboardCandidateController *)self key];
        [v31 setState:v7 animated:0 force:1 completion:0];
      }
      [(UIKeyboardCandidateController *)self setExtendedKeyState:v7];
    }
    double v32 = [(UIKeyboardCandidateController *)self key];
    double v33 = [v32 state];

    if (!v33)
    {
      double v34 = [(UIKeyboardCandidateController *)self key];
      CGFloat v35 = [(UIKeyboardCandidateController *)self keyState];
      [v34 setState:v35 animated:0 force:1 completion:0];
    }
    double v36 = [(UIKeyboardCandidateController *)self key];
    double v37 = +[UITraitCollection traitCollectionWithLayoutDirection:[(UIKeyboardCandidateController *)self layoutDirectionForCurrentInputMode]];
    [v36 _setLocalOverrideTraitCollection:v37];
  }
}

- (void)updateOpacitiesToState:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(UIKeyboardCandidateController *)self opacities];

  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v6 = [(UIKeyboardCandidateController *)self opacities];
    BOOL v7 = [v6 allKeys];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        uint64_t v13 = [(UIKeyboardCandidateController *)self opacities];
        id v14 = [v13 objectForKeyedSubscript:v12];

        char v15 = [v12 integerValue];
        if ((v15 & 4) != 0)
        {
          [v14 doubleValue];
          double v23 = v22;
          char v24 = [v4 style];
          [v24 setForegroundOpacity:v23];

          [v14 doubleValue];
          double v26 = v25;
          char v21 = [v4 disambiguationStyle];
          [v21 setForegroundOpacity:v26];
        }
        else
        {
          if ((v15 & 1) == 0) {
            goto LABEL_12;
          }
          [v14 doubleValue];
          double v17 = v16;
          long long v18 = [v4 style];
          [v18 setBackgroundOpacity:v17];

          [v14 doubleValue];
          double v20 = v19;
          char v21 = [v4 disambiguationStyle];
          [v21 setBackgroundOpacity:v20];
        }

LABEL_12:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v9)
      {
LABEL_14:

        break;
      }
    }
  }
}

- (void)updateArrowButtonImageNameToState:(id)a3
{
  id v11 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  if (([v4 _hasMarkedText] & 1) == 0)
  {
    BOOL v5 = [v4 _editMenuAssistant];
    if ([v5 _editMenuIsVisible])
    {
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4FAE300] imageNameForTextEffectsButton];

      if (v6)
      {
        uint64_t v7 = 1;
        goto LABEL_8;
      }
    }
  }
  uint64_t v6 = 0;
  if (![(UIKeyboardCandidateController *)self isTextEffectsButtonPresented]) {
    goto LABEL_10;
  }
  uint64_t v7 = 0;
LABEL_8:
  [(UIKeyboardCandidateController *)self setIsTextEffectsButtonPresented:v7];
  uint64_t v8 = [v11 style];
  uint64_t v9 = [v8 arrowButtonImageName];

  if (v6 != v9)
  {
    uint64_t v10 = [v11 style];
    [v10 setArrowButtonImageName:v6];
  }
LABEL_10:
}

- (double)rowHeightForBarForOrientation:(int64_t)a3
{
  id v4 = [(UIKeyboardCandidateController *)self screenTraits];
  BOOL v5 = [(UIKeyboardCandidateController *)self screenTraits];
  uint64_t v6 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, [v5 idiom], 0);

  if ((unint64_t)(v6 - 23) < 4 || v6 == 1)
  {
    uint64_t v8 = [(UIKeyboardCandidateController *)self bar];
    uint64_t v9 = [v8 _rootInputWindowController];
    uint64_t v10 = [v9 placement];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      id v14 = [v13 containerRootController];
      id v12 = [v14 placement];
    }
    if ([v12 isFloatingAssistantView])
    {
      double v15 = 42.0;
    }
    else
    {
      double v16 = [(UIKeyboardCandidateController *)self screenTraits];
      int v17 = [v16 isFloating];

      if (v17) {
        double v15 = 44.5;
      }
      else {
        double v15 = 55.0;
      }
    }
  }
  else
  {
    double v19 = [(UIKeyboardCandidateController *)self screenTraits];
    unint64_t v20 = [v19 orientation] - 3;

    double v21 = 38.0;
    if (v6 == 22) {
      double v21 = 45.0;
    }
    if (v6 == 21) {
      double v21 = 44.0;
    }
    if (v20 >= 2) {
      double v22 = v21;
    }
    else {
      double v22 = 32.0;
    }
    double v23 = [(UIKeyboardCandidateController *)self barState];
    char v24 = [v23 style];
    double v25 = [v24 candidateFont];
    [v25 lineHeight];
    double v27 = v26;

    +[UIKeyboardCandidateViewConfiguration lineHeightMultiplierForCurrentLanguage];
    double v29 = round(v27 * v28) + 1.0;
    if (v22 >= v29) {
      return v22;
    }
    else {
      return v29;
    }
  }
  return v15;
}

- (double)candidateBarWidth
{
  BOOL v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    goto LABEL_8;
  }
  BOOL v5 = [(UIKeyboardCandidateController *)self screenTraits];
  char v6 = [v5 isKeyboardMinorEdgeWidth];

  uint64_t v7 = [(UIKeyboardCandidateController *)self screenTraits];
  [v7 keyboardWidth];
  double v9 = v8;

  if (v6)
  {
    if (v9 < 1024.0)
    {
      uint64_t v10 = [(UIKeyboardCandidateController *)self screenTraits];
      [v10 keyboardWidth];
      double v12 = v11;

      if (v12 >= 768.0) {
        return 452.0;
      }
      goto LABEL_8;
    }
    return 656.0;
  }
  if (v9 < 1366.0)
  {
    id v14 = [(UIKeyboardCandidateController *)self screenTraits];
    [v14 keyboardWidth];
    double v16 = v15;

    if (v16 >= 1024.0) {
      return 656.0;
    }
LABEL_8:
    int v17 = [(UIKeyboardCandidateController *)self screenTraits];
    [v17 keyboardWidth];
    double v19 = v18;

    return v19;
  }
  return 846.0;
}

- (double)candidateBarHeight
{
  BOOL v3 = [(UIKeyboardCandidateController *)self screenTraits];
  -[UIKeyboardCandidateController candidateBarHeightForOrientation:](self, "candidateBarHeightForOrientation:", [v3 orientation]);
  double v5 = v4;

  return v5;
}

- (double)candidateBarHeightForOrientation:(int64_t)a3
{
  if ([(UIKeyboardCandidateController *)self shouldShowDisambiguationCandidates]
    && ((unint64_t)(a3 - 1) < 2 || +[UIKeyboardImpl isFloating]))
  {
    [(UIKeyboardCandidateController *)self rowHeightForBarForOrientation:a3];
    double v6 = v5;
    uint64_t v7 = [(UIKeyboardCandidateController *)self barState];
    double v8 = [v7 disambiguationStyle];
    [v8 rowHeight];
    double v10 = v6 + v9;

    return v10;
  }
  else
  {
    [(UIKeyboardCandidateController *)self rowHeightForBarForOrientation:a3];
  }
  return result;
}

- (UIEdgeInsets)candidateBarEdgeInsetsForOrientation:(int64_t)a3
{
  double v4 = [(UIKeyboardCandidateController *)self screenTraits];
  if ([v4 idiom])
  {

LABEL_5:
    double v8 = 0.0;
    double v7 = 0.0;
    goto LABEL_6;
  }
  double v5 = [(UIKeyboardCandidateController *)self screenTraits];
  unint64_t v6 = [v5 orientation] - 3;

  if (v6 >= 2) {
    goto LABEL_5;
  }
  double v7 = 2.0;
  double v8 = 6.0;
LABEL_6:
  double v9 = 0.0;
  double v10 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (CGSize)maximumSizeForInlineView
{
  [(UIKeyboardCandidateViewConfiguration *)self->_inlineConfiguration preferredInlineFloatingViewSize];
  double v4 = v3;
  [(UIKeyboardCandidateViewConfiguration *)self->_inlineConfiguration preferredInlineFloatingViewSize];
  double v6 = v5;
  double v7 = [(UIKeyboardCandidateViewConfiguration *)self->_inlineConfiguration extendedState];
  double v8 = [v7 style];
  [v8 rowHeight];
  double v10 = v9;
  double v11 = [(UIKeyboardCandidateViewConfiguration *)self->_inlineConfiguration extendedState];
  [v11 additionalHeight];
  double v13 = v10 + v12;

  if (v6 >= v13) {
    double v14 = v6;
  }
  else {
    double v14 = v13;
  }
  double v15 = v4;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (BOOL)barIsExtended
{
  double v3 = [(UIKeyboardCandidateController *)self bar];
  double v4 = [v3 state];
  if (v4)
  {
    double v5 = [(UIKeyboardCandidateController *)self bar];
    double v6 = [v5 state];
    double v7 = [(UIKeyboardCandidateController *)self extendedBarState];
    if (v6 == v7)
    {
      BOOL v11 = 1;
    }
    else
    {
      double v8 = [(UIKeyboardCandidateController *)self bar];
      double v9 = [v8 state];
      double v10 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];
      BOOL v11 = v9 == v10;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)inlineViewIsExtended
{
  v2 = self;
  double v3 = [(UIKeyboardCandidateController *)self inlineView];
  double v4 = [v3 state];
  double v5 = [(UIKeyboardCandidateController *)v2 extendedInlineViewState];
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (BOOL)isKeyExtended
{
  v2 = self;
  double v3 = [(UIKeyboardCandidateController *)self key];
  double v4 = [v3 state];
  double v5 = [(UIKeyboardCandidateController *)v2 extendedKeyState];
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (void)syncIsExtended
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    double v3 = [v5 remoteTextInputPartner];
    double v4 = objc_msgSend(NSNumber, "numberWithBool:", -[UIKeyboardCandidateController isExtended](self, "isExtended"));
    [v3 forwardKeyboardOperation:sel_setIsExtended_ object:v4];
  }
}

- (void)setIsExtended:(BOOL)a3
{
  self->_isExtended = a3;
}

- (BOOL)isExtended
{
  if (+[UIKeyboard usesInputSystemUI]) {
    return self->_isExtended;
  }
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 2) != 0
    && [(UIKeyboardCandidateController *)self barIsExtended]
    || ([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) != 0
    && [(UIKeyboardCandidateController *)self inlineViewIsExtended])
  {
    return 1;
  }
  return [(UIKeyboardCandidateController *)self activeCandidateViewType] & 1;
}

- (void)setupAnimatorWithCurve:(int64_t)a3
{
  id v5 = [(UIKeyboardCandidateController *)self animator];

  if (!v5)
  {
    double v6 = [UIViewPropertyAnimator alloc];
    [(id)objc_opt_class() candidateViewAnimationDuration];
    double v7 = -[UIViewPropertyAnimator initWithDuration:curve:animations:](v6, "initWithDuration:curve:animations:", a3, &__block_literal_global_306);
    [(UIKeyboardCandidateController *)self setAnimator:v7];

    objc_initWeak(&location, self);
    double v8 = [(UIKeyboardCandidateController *)self animator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__UIKeyboardCandidateController_setupAnimatorWithCurve___block_invoke_2;
    v9[3] = &unk_1E52DC6C0;
    objc_copyWeak(&v10, &location);
    [v8 addCompletion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __56__UIKeyboardCandidateController_setupAnimatorWithCurve___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAnimator:0];
}

- (void)extendKeyboardBackdropHeight:(double)a3
{
  id v5 = [(UIKeyboardCandidateController *)self bar];
  double v6 = [v5 state];
  double v7 = [(UIKeyboardCandidateController *)self barState];

  if (v6 != v7)
  {
    [(UIKeyboardCandidateController *)self additionalExtendedBarBackdropOffset];
    a3 = v8 + a3;
  }
  id v11 = [(UIKeyboardCandidateController *)self bar];
  double v9 = [v11 _rootInputWindowController];
  [(id)objc_opt_class() candidateViewAnimationDuration];
  [v9 extendKeyboardBackdropHeight:a3 withDuration:v10];
}

- (void)toggleBarExtended
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIKeyboardCandidateController *)self barConfiguration];
  int v4 = [v3 shouldAnimateStateTransition];

  if (v4)
  {
    id v5 = [(UIKeyboardCandidateController *)self animator];

    if (v5)
    {
      double v6 = [(UIKeyboardCandidateController *)self animator];
      uint64_t v7 = [v6 state];

      if (v7)
      {
        double v8 = [(UIKeyboardCandidateController *)self animator];
        [v8 stopAnimation:0];

        double v9 = [(UIKeyboardCandidateController *)self animator];
        [v9 finishAnimationAtPosition:0];
      }
    }
    [(UIKeyboardCandidateController *)self setupAnimatorWithCurve:0];
    double v10 = [(UIKeyboardCandidateController *)self animator];
    [(UIKeyboardCandidateController *)self toggleBarExtendedWithAnimator:v10];

    id v11 = [(UIKeyboardCandidateController *)self animator];
    [v11 startAnimation];
  }
  else
  {
    [(UIKeyboardCandidateController *)self toggleBarExtendedUnanimated];
  }
  double v15 = @"isExtended";
  double v12 = objc_msgSend(NSNumber, "numberWithBool:", -[UIKeyboardCandidateController barIsExtended](self, "barIsExtended"));
  v16[0] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"UIKeyboardWillToggleCandidateBar" object:0 userInfo:v13];
}

- (void)toggleBarExtendedUnanimated
{
  double v3 = [(UIKeyboardCandidateController *)self bar];
  id v21 = [v3 state];

  int v4 = [(UIKeyboardCandidateController *)self bar];
  id v5 = [v4 state];
  double v6 = [(UIKeyboardCandidateController *)self barState];

  if (v5 == v6)
  {
    uint64_t v7 = [(UIKeyboardCandidateController *)self extendedBarState];
    double v8 = +[UIKeyboardImpl keyboardWindow];
    double v9 = +[_UIEditMenuSceneComponent sceneComponentForView:v8];
    [v9 dismissCurrentMenu];

    double v10 = [(UIKeyboardCandidateController *)self bar];
    [v10 resetSortControlIndex];

    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = [(UIKeyboardCandidateController *)self barState];
    if (!v7) {
      goto LABEL_11;
    }
  }
  id v11 = [(UIKeyboardCandidateController *)self bar];
  double v12 = [v11 state];
  [v12 yOffset];

  double v13 = [(UIKeyboardCandidateController *)self bar];
  [v13 setState:v7 animated:0 animator:0 options:0 force:0 completion:0];

  [(UIKeyboardCandidateController *)self syncIsExtended];
  double v14 = [(UIKeyboardCandidateController *)self barConfiguration];
  LODWORD(v12) = [v14 willCoverKeyboardLayout];

  if (v12)
  {
    double v15 = [(UIKeyboardCandidateController *)self extendedBarState];

    uint64_t v16 = +[UIKeyboardImpl activeInstance];
    int v17 = [(id)v16 _layout];

    [v17 setHidden:v7 == v15];
    double v18 = +[UIKeyboardImpl sharedInstance];
    LOBYTE(v16) = [v18 _isBackdropVisible];

    if ((v16 & 1) == 0)
    {
      double v19 = 0.0;
      if (v7 != v15) {
        double v19 = 1.0;
      }
      [v17 setAlpha:v19];
    }
  }
LABEL_11:
  unint64_t v20 = +[UIKeyboardImpl activeInstance];
  [v20 updateKeyboardConfigurations];
}

- (void)toggleBarExtendedWithAnimator:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardCandidateController *)self bar];
  double v6 = [v5 state];

  uint64_t v7 = [(UIKeyboardCandidateController *)self bar];
  double v8 = [v7 state];
  double v9 = [(UIKeyboardCandidateController *)self barState];

  if (v8 == v9)
  {
    double v13 = [(UIKeyboardCandidateController *)self extendedBarState];
    double v14 = +[UIKeyboardImpl keyboardWindow];
    double v15 = +[_UIEditMenuSceneComponent sceneComponentForView:v14];
    [v15 dismissCurrentMenu];

    uint64_t v16 = [(UIKeyboardCandidateController *)self bar];
    [v16 resetSortControlIndex];

    if (!v13) {
      goto LABEL_29;
    }
    goto LABEL_7;
  }
  double v10 = [(UIKeyboardCandidateController *)self bar];
  id v11 = [v10 state];
  double v12 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];

  if (v11 == v12) {
    [v4 addAnimations:&__block_literal_global_56_5];
  }
  double v13 = [(UIKeyboardCandidateController *)self barState];
  if (v13)
  {
LABEL_7:
    int v17 = [(UIKeyboardCandidateController *)self bar];
    double v18 = [v17 state];
    [v18 yOffset];
    double v20 = v19;

    id v21 = [(UIKeyboardCandidateController *)self bar];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_2;
    v113[3] = &unk_1E52DC3A0;
    v113[4] = self;
    [v21 setState:v13 animated:1 animator:v4 options:0 force:0 completion:v113];

    double v22 = +[UIKeyboardImpl activeInstance];
    double v23 = [v22 _layout];

    [v23 setHidden:0];
    char v24 = [(UIKeyboardCandidateController *)self barConfiguration];
    int v25 = [v24 shouldResizeKeyboardBackdrop];

    if (v25)
    {
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_3;
      v112[3] = &unk_1E52D9F70;
      v112[4] = self;
      [v4 addAnimations:v112];
    }
    else
    {
      double v26 = [(UIKeyboardCandidateController *)self bar];
      double v27 = [v26 state];
      [v27 yOffset];
      double v29 = v28;

      if (v20 != v29)
      {
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_4;
        v111[3] = &unk_1E52D9F70;
        v111[4] = self;
        [v4 addAnimations:v111];
      }
      long long v30 = [(UIKeyboardCandidateController *)self barConfiguration];
      int v31 = [v30 willCoverKeyboardLayout];

      if (v31)
      {
        uint64_t v32 = +[UIKeyboardImpl sharedInstance];
        int v33 = [v32 _isBackdropVisible];

        if (v33)
        {
          double v34 = [UIKBBackdropView alloc];
          [v23 frame];
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          double v43 = [(UIKeyboardCandidateController *)self renderConfig];
          double v44 = -[UIKBBackdropView initWithFrame:style:](v34, "initWithFrame:style:", [v43 backdropStyle], v36, v38, v40, v42);

          double v45 = [v23 superview];
          [v45 insertSubview:v44 above:v23];
        }
        else
        {
          double v44 = 0;
        }
        [v13 additionalHeight];
        BOOL v47 = v46 <= 0.0;
        double v48 = v46;
        double v84 = v46;
        double v49 = 1.0;
        if (!v47) {
          double v49 = 0.0;
        }
        [(UIView *)v44 setAlpha:v49];
        double v50 = [(UIKeyboardCandidateController *)self bar];
        [v50 frame];
        double v52 = v51;
        double v53 = [(UIKeyboardCandidateController *)self extendedBarState];
        [v53 additionalHeight];
        double v55 = v54;

        uint64_t v56 = [(UIKeyboardCandidateController *)self bar];
        [v56 bounds];
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        double v64 = v57;
        BOOL v47 = v48 <= 0.0;
        BOOL v65 = v48 > 0.0;
        double v66 = v52 + v55 + v57;
        if (v47) {
          double v67 = v52 + v55 + v57;
        }
        else {
          double v67 = v57;
        }

        double v68 = [_UIKeyboardCandidateSlidingMaskView alloc];
        double v69 = [(UIKeyboardCandidateController *)self bar];
        [v69 frame];
        double v71 = v70;
        double v72 = [(UIKeyboardCandidateController *)self extendedBarState];
        [v72 additionalHeight];
        double v74 = -[_UIKeyboardCandidateSlidingMaskView initWithFrame:opaqueHeight:fadeHeight:](v68, "initWithFrame:opaqueHeight:fadeHeight:", v59, v61, v63, v64, v71, v73);

        double v75 = [(UIKeyboardCandidateController *)self bar];
        [v75 setMaskView:v74];

        -[UIView setFrame:](v74, "setFrame:", v59, v61, v63, v67);
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_5;
        v100[3] = &unk_1E52E7B00;
        double v76 = v74;
        double v101 = v76;
        BOOL v110 = v65;
        double v102 = v59;
        double v103 = v61;
        double v104 = v63;
        double v105 = v66;
        double v106 = v59;
        double v107 = v61;
        double v108 = v63;
        double v109 = v64;
        [v4 addAnimations:v100];
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_6;
        v98[3] = &unk_1E52E6608;
        v98[4] = self;
        double v77 = v44;
        BOOL v99 = v77;
        [v4 addCompletion:v98];
        if (v84 <= 0.0)
        {
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_11;
          v92[3] = &unk_1E52D9F70;
          double v79 = v77;
          double v93 = v79;
          [v4 addAnimations:v92 delayFactor:0.6];
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_12;
          v90[3] = &unk_1E52DC698;
          double v91 = v79;
          [v4 addCompletion:v90];

          double v78 = v93;
        }
        else
        {
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_7;
          v96[3] = &unk_1E52D9F98;
          v96[4] = self;
          v97 = v77;
          [v4 addAnimations:v96];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_10;
          v94[3] = &unk_1E52DC698;
          id v95 = v23;
          [v4 addCompletion:v94];

          double v78 = v97;
        }

        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_13;
        v88[3] = &unk_1E52E6608;
        v88[4] = self;
        id v89 = v6;
        [v4 addCompletion:v88];
        v80 = +[UIKeyboardImpl sharedInstance];
        char v81 = [v80 _isBackdropVisible];

        if ((v81 & 1) == 0)
        {
          double v82 = 0.0;
          if (v84 > 0.0) {
            double v82 = 1.0;
          }
          [v23 setAlpha:v82];
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_14;
          v85[3] = &unk_1E52D9FC0;
          id v86 = v23;
          BOOL v87 = v65;
          [v4 addAnimations:v85];
        }
      }
    }
    uint64_t v83 = +[UIKeyboardImpl activeInstance];
    [v83 updateKeyboardConfigurations];
  }
LABEL_29:
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke()
{
  id v1 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v0 = +[UIInputViewAnimationStyle animationStyleDefault];
  [v1 maximizeWithAnimationStyle:v0 force:1];
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncIsExtended];
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = [v1 bar];
  v2 = [v3 state];
  [v2 yOffset];
  objc_msgSend(v1, "extendKeyboardBackdropHeight:");
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_4(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) bar];
  v2 = [v8 _rootInputWindowController];
  id v3 = [*(id *)(a1 + 32) bar];
  id v4 = [v3 state];
  [v4 yOffset];
  double v6 = v5;
  [(id)objc_opt_class() candidateViewAnimationDuration];
  [v2 candidateBarWillChangeHeight:v6 withDuration:v7];
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104)) {
    id v1 = (double *)(a1 + 40);
  }
  else {
    id v1 = (double *)(a1 + 72);
  }
  if (*(unsigned char *)(a1 + 104)) {
    v2 = (double *)(a1 + 48);
  }
  else {
    v2 = (double *)(a1 + 80);
  }
  if (*(unsigned char *)(a1 + 104)) {
    id v3 = (double *)(a1 + 56);
  }
  else {
    id v3 = (double *)(a1 + 88);
  }
  if (*(unsigned char *)(a1 + 104)) {
    id v4 = (double *)(a1 + 64);
  }
  else {
    id v4 = (double *)(a1 + 96);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *v1, *v2, *v3, *v4);
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bar];
  [v2 setMaskView:0];

  id v3 = *(void **)(a1 + 40);
  return [v3 removeFromSuperview];
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_7(uint64_t a1)
{
  [(id)objc_opt_class() candidateViewAnimationDuration];
  double v3 = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_8;
  v4[3] = &unk_1E52D9F70;
  id v5 = *(id *)(a1 + 40);
  +[UIView animateKeyframesWithDuration:0 delay:v4 options:0 animations:v3 completion:0.0];
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_8(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_9;
  v1[3] = &unk_1E52D9F70;
  id v2 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v1 relativeDuration:0.0 animations:0.4];
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_10(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setHidden:1];
  }
  return result;
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_13(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v4 = [*(id *)(a1 + 32) bar];
    [v4 setState:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) syncIsExtended];
    id v5 = +[UIKeyboardImpl activeInstance];
    [v5 updateKeyboardConfigurations];
  }
}

uint64_t __63__UIKeyboardCandidateController_toggleBarExtendedWithAnimator___block_invoke_14(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)toggleInlineViewExtendedAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  double v6 = [(UIKeyboardCandidateController *)self inlineView];
  double v7 = [v6 state];
  id v8 = [(UIKeyboardCandidateController *)self inlineViewState];

  if (v7 == v8)
  {
    id v18 = [(UIKeyboardCandidateController *)self extendedInlineViewState];
    double v12 = [(UIKeyboardCandidateController *)self inlineViewContainer];
    int v13 = [v12 shouldExtendUpwards];
    double v14 = 0.0;
    if (v13)
    {
      objc_msgSend(v18, "additionalHeight", 0.0);
      double v14 = -v15;
    }
    [v18 setYOffset:v14];
  }
  else
  {
    double v9 = [(UIKeyboardCandidateController *)self inlineView];
    double v10 = [v9 state];
    id v11 = [(UIKeyboardCandidateController *)self extendedInlineViewState];

    if (v10 != v11) {
      return;
    }
    id v18 = [(UIKeyboardCandidateController *)self inlineViewState];
  }
  if (v18)
  {
    [(UIKeyboardCandidateController *)self setInlineState:v18 extended:v7 == v8 animated:v4 options:0 force:0 completion:0];
    uint64_t v16 = +[UIKeyboardImpl activeInstance];
    int v17 = [(UIKeyboardCandidateController *)self inlineViewContainer];
    [v18 yOffset];
    objc_msgSend(v16, "updateDictationPopoverLocationForCandidateInlineView:yOffset:", v17);
  }
}

- (void)toggleKeyViewExtendedAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v15 = a4;
  double v6 = [(UIKeyboardCandidateController *)self key];
  double v7 = [v6 state];
  id v8 = [(UIKeyboardCandidateController *)self keyState];

  if (v7 == v8)
  {
    uint64_t v12 = [(UIKeyboardCandidateController *)self extendedKeyState];
  }
  else
  {
    double v9 = [(UIKeyboardCandidateController *)self key];
    double v10 = [v9 state];
    id v11 = [(UIKeyboardCandidateController *)self extendedKeyState];

    if (v10 != v11) {
      goto LABEL_7;
    }
    uint64_t v12 = [(UIKeyboardCandidateController *)self keyState];
  }
  int v13 = (void *)v12;
  if (v12)
  {
    double v14 = [(UIKeyboardCandidateController *)self key];
    [v14 setState:v13 animated:v4 options:0 force:0 completion:v15];
  }
LABEL_7:
}

- (void)collapse
{
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 2) != 0
    && [(UIKeyboardCandidateController *)self barIsExtended])
  {
    [(UIKeyboardCandidateController *)self toggleBarExtended];
    +[UIKBAnalyticsDispatcher candidateViewExtended:@"Automatic" direction:@"Close"];
  }
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) != 0
    && [(UIKeyboardCandidateController *)self inlineViewIsExtended])
  {
    [(UIKeyboardCandidateController *)self toggleInlineViewExtendedAnimated:0 completion:0];
  }
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 1) != 0
    && [(UIKeyboardCandidateController *)self isKeyExtended])
  {
    [(UIKeyboardCandidateController *)self toggleKeyViewExtendedAnimated:0 completion:0];
  }
}

- (void)removeInlineView
{
  [(TUICandidateView *)self->_inlineView resetSortControlIndex];
  double v3 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  [v3 setHidden:1];

  BOOL v4 = [(UIKeyboardCandidateController *)self inlineViewState];
  id v5 = [(UIKeyboardCandidateController *)self inlineView];
  [v5 setState:v4];

  double v6 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  objc_msgSend(v6, "setInlineText:inlineRect:maxX:layout:", 0, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 3.40282347e38);

  double v7 = +[UIKeyboardImpl activeInstance];
  id v8 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  [v7 updateDictationPopoverLocationForCandidateInlineView:v8 yOffset:0.0];

  [(UIView *)self->_hostedInlineViewContainer removeFromSuperview];
  hostedInlineViewContainer = self->_hostedInlineViewContainer;
  self->_hostedInlineViewContainer = 0;

  hostingController = self->_hostingController;
  self->_hostingController = 0;
}

- (id)snapshot
{
  if (self->_bar)
  {
    double v3 = [_UIKeyboardCandidateSnapshotView alloc];
    [(TUICandidateView *)self->_bar bounds];
    BOOL v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    [(UIView *)v4 setOpaque:0];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (void)setupPanGestureRecognizerIfNeeded
{
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 2) != 0
    && ([(UIKeyboardCandidateController *)self barConfiguration],
        double v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 allowsPullDownGesture],
        v3,
        v4))
  {
    id v5 = [(UIKeyboardCandidateController *)self panGestureRecognizer];

    if (!v5)
    {
      double v6 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_panGestureRecognizerAction_];
      [(UIKeyboardCandidateController *)self setPanGestureRecognizer:v6];

      double v7 = [(UIKeyboardCandidateController *)self panGestureRecognizer];
      [v7 setMaximumNumberOfTouches:1];

      id v8 = [(UIKeyboardCandidateController *)self panGestureRecognizer];
      [v8 setDelegate:self];

      double v9 = [(UIKeyboardCandidateController *)self panGestureRecognizer];
      [v9 _setHysteresis:20.0];
    }
    bar = self->_bar;
    id v13 = [(UIKeyboardCandidateController *)self panGestureRecognizer];
    -[TUICandidateView addGestureRecognizer:](bar, "addGestureRecognizer:");
  }
  else
  {
    id v11 = [(UIKeyboardCandidateController *)self panGestureRecognizer];

    if (!v11) {
      return;
    }
    uint64_t v12 = self->_bar;
    id v13 = [(UIKeyboardCandidateController *)self panGestureRecognizer];
    -[TUICandidateView removeGestureRecognizer:](v12, "removeGestureRecognizer:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardCandidateController *)self panGestureRecognizer];

  if (v5 != v4 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  if (![(TUICandidateView *)self->_bar showingArrowButton]) {
    return 0;
  }
  double v6 = [(UIKeyboardCandidateController *)self bar];
  double v7 = [v6 state];
  BOOL v8 = [v7 arrowButtonDirection] != 2;

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 phase]) {
    goto LABEL_7;
  }
  double v7 = +[UIKeyboardImpl activeInstance];
  BOOL v8 = [v7 _layout];
  double v9 = [v8 currentKeyplane];
  uint64_t v10 = [v9 visualStyling] & 0xFF0000;

  if (v10 != 0x10000)
  {
LABEL_7:
    BOOL v21 = 1;
  }
  else
  {
    id v11 = [v5 view];
    [v11 frame];
    if (v12 <= 0.0)
    {
      BOOL v21 = 1;
    }
    else
    {
      double v13 = v12;
      [v6 locationInView:v11];
      double v15 = v14;
      double Current = CFAbsoluteTimeGetCurrent();
      int v17 = +[UIKeyboardImpl activeInstance];
      [v17 lastTouchDownTimestamp];
      double v19 = v18;

      double v20 = Current - v19;
      if (Current - v19 < 0.0) {
        double v20 = 0.0;
      }
      BOOL v21 = v15 <= v13 * (exp(-(v20 * v20) - v20 * v20) * -0.25 + 0.95);
    }
  }
  return v21;
}

- (void)panGestureRecognizerAction:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardCandidateController *)self extendedBarState];
  [v5 additionalHeight];
  double v7 = v6;

  if (v7 == 0.0) {
    double v8 = 50.0;
  }
  else {
    double v8 = v7;
  }
  uint64_t v9 = [v4 state];
  if ((unint64_t)(v9 - 3) < 3)
  {
    [(id)objc_opt_class() candidateViewAnimationDuration];
    double v11 = v10;
    double v12 = [(UIKeyboardCandidateController *)self animator];
    [v12 fractionComplete];
    double v14 = v13;

    double v15 = [(UIKeyboardCandidateController *)self bar];
    [v4 velocityInView:v15];
    double v17 = v16 / v8;

    double v18 = v14 + v11 * v17 * 0.5;
    double v19 = [(UIKeyboardCandidateController *)self animator];
    double v20 = v19;
    if (v18 < 0.5) {
      double v17 = -v17;
    }
    [v19 setReversed:v18 < 0.5];

    BOOL v21 = -[UISpringTimingParameters initWithDampingRatio:initialVelocity:]([UISpringTimingParameters alloc], "initWithDampingRatio:initialVelocity:", 1.0, v17, v17);
    double v22 = v11;
    if (v17 > 0.0) {
      double v22 = (1.0 - v14 + 1.0 - v14) / v17;
    }
    if (v11 >= v22) {
      double v23 = v22;
    }
    else {
      double v23 = v11;
    }
    char v24 = [(UIKeyboardCandidateController *)self animator];
    [v24 continueAnimationWithTimingParameters:v21 durationFactor:v23 / v11];

    int v25 = +[UIKeyboardImpl activeInstance];
    [v25 candidateBarDidExtendWithGesture];

    goto LABEL_22;
  }
  if (v9 == 2)
  {
    BOOL v21 = [(UIKeyboardCandidateController *)self panGestureRecognizer];
    double v34 = [(UIKeyboardCandidateController *)self bar];
    [(UISpringTimingParameters *)v21 translationInView:v34];
    double v36 = v35 / v8;
    double v37 = [(UIKeyboardCandidateController *)self animator];
    [v37 setFractionComplete:v36];

    goto LABEL_22;
  }
  if (v9 != 1) {
    goto LABEL_23;
  }
  BOOL v21 = [v4 view];
  if (v21 != (UISpringTimingParameters *)self->_bar
    || [(UIKeyboardCandidateController *)self barIsExtended])
  {
LABEL_22:

    goto LABEL_23;
  }
  BOOL v26 = [(UIKeyboardCandidateController *)self isTextEffectsButtonPresented];

  if (!v26)
  {
    objc_initWeak(&location, self);
    double v27 = [(UIKeyboardCandidateController *)self bar];
    [v27 resetSortControlIndex];

    [(UIKeyboardCandidateController *)self setupAnimatorWithCurve:2];
    double v28 = [(UIKeyboardCandidateController *)self animator];
    uint64_t v29 = [v28 state];

    if (v29)
    {
      long long v30 = [(UIKeyboardCandidateController *)self animator];
      [v30 stopAnimation:0];

      int v31 = [(UIKeyboardCandidateController *)self animator];
      [v31 finishAnimationAtPosition:0];
    }
    uint64_t v32 = [(UIKeyboardCandidateController *)self animator];
    [(UIKeyboardCandidateController *)self toggleBarExtendedWithAnimator:v32];

    int v33 = [(UIKeyboardCandidateController *)self bar];
    [v33 setUserInteractionEnabled:0];

    +[UIKBAnalyticsDispatcher candidateViewExtended:@"Gesture" direction:@"Open"];
    objc_destroyWeak(&location);
  }
LABEL_23:
}

- (void)setCandidateResultSet:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (TIKeyboardCandidateResultSet *)a3;
  if (self->_candidateResultSet != v5)
  {
    objc_storeStrong((id *)&self->_candidateResultSet, a3);
    [(UIKeyboardCandidateController *)self updateStates];
    [(UIKeyboardCandidateController *)self resetSortControlIndexAfterCandidatesChanged];
    int64_t activeCandidateViewType = self->_activeCandidateViewType;
    double v7 = [(UIKeyboardCandidateController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(UIKeyboardCandidateController *)self delegate];
      activeCandidateViewType &= [v9 preferredCandidateViewTypeForCandidateResultSet:v5];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v10 = [(UIKeyboardCandidateController *)self activeViews];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (([(UIKeyboardCandidateController *)self candidateViewTypeForView:v15] & activeCandidateViewType) != 0) {
            double v16 = v5;
          }
          else {
            double v16 = 0;
          }
          [v15 setCandidateResultSet:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [(UIKeyboardCandidateController *)self setCurrentCandidate:0];
    [(UIKeyboardCandidateController *)self candidatesDidChange];
  }
}

- (void)clearCurrentCandidate
{
}

- (void)setInlineText:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_inlineText isEqualToString:v4])
  {
    id v5 = (NSString *)[v4 copy];
    inlineText = self->_inlineText;
    self->_inlineText = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v7 = [(UIKeyboardCandidateController *)self activeViews];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setInlineText:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)resetSortControlIndexAfterCandidatesChanged
{
  [(TUICandidateView *)self->_key resetSortControlIndex];
  inlineView = self->_inlineView;
  [(TUICandidateView *)inlineView resetSortControlIndex];
}

+ (double)candidateViewAnimationDuration
{
  if (qword_1EB2615A8 != -1) {
    dispatch_once(&qword_1EB2615A8, &__block_literal_global_73_2);
  }
  return *(double *)&qword_1EB2615B0;
}

void __63__UIKeyboardCandidateController_candidateViewAnimationDuration__block_invoke()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (uint64_t *)qword_1EB2615C8;
  uint64_t v7 = qword_1EB2615C8;
  if (!qword_1EB2615C8)
  {
    double v1 = TextInputUILibrary_3();
    v5[3] = (uint64_t)dlsym(v1, "TUICandidateViewAnimationDuration");
    qword_1EB2615C8 = v5[3];
    v0 = (uint64_t *)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    qword_1EB2615B0 = *v0;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    double v3 = [NSString stringWithUTF8String:"NSTimeInterval getTUICandidateViewAnimationDuration(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIKeyboardCandidateController.m", 21, @"%s", dlerror());

    __break(1u);
  }
}

- (int64_t)layoutDirectionForCurrentInputMode
{
  uint64_t v2 = +[UIKeyboardInputModeController sharedInputModeController];
  double v3 = [v2 currentInputMode];

  uint64_t v4 = [v3 normalizedIdentifier];
  int64_t IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v4);

  return IsDefaultRightToLeft;
}

- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
}

- (void)setCandidates:(id)a3 type:(int)a4 inlineText:(id)a5 inlineRect:(CGRect)a6 maxX:(double)a7 layout:(BOOL)a8
{
}

- (void)setCandidates:(id)a3 type:(int)a4 inlineText:(id)a5 inlineRect:(CGRect)a6 maxX:(double)a7 layout:(BOOL)a8 inlineCandidatesAreHosted:(BOOL)a9
{
  BOOL v10 = a8;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v19 = a3;
  -[UIKeyboardCandidateController setInlineRect:](self, "setInlineRect:", x, y, width, height);
  [(UIKeyboardCandidateController *)self setCandidateResultSet:v19];

  [(UIKeyboardCandidateController *)self setInlineText:v18];
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) != 0)
  {
    uint64_t v22 = [(TUICandidateView *)self->_inlineView candidateResultSet];
    uint64_t v20 = [v22 hasCandidates];
    uint64_t v21 = v20 ^ 1;

    if (a9) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 1;
    if (a9) {
      goto LABEL_7;
    }
  }
  double v23 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  [v23 setHidden:v21];

  if ((v20 & 1) == 0) {
    [(UIKeyboardCandidateController *)self removeInlineView];
  }
LABEL_7:
  char v24 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  char v25 = [v24 isHidden];

  if ((v25 & 1) == 0)
  {
    BOOL v26 = [(UIKeyboardCandidateController *)self inlineRectIsVertical];
    double v27 = [(UIKeyboardCandidateController *)self inlineViewContainer];
    [v27 setInlineRectIsVertical:v26];
  }
  double v28 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  objc_msgSend(v28, "setInlineText:inlineRect:maxX:layout:", v18, v10, x, y, width, height, a7);

  uint64_t v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v34 = @"isVisible";
  long long v30 = [NSNumber numberWithInt:v20];
  v35[0] = v30;
  int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  [v29 postNotificationName:@"UIKeyboardInlineCandidateBarVisibilityChangedNotification" object:0 userInfo:v31];

  uint64_t v32 = +[UIKeyboardImpl activeInstance];
  int v33 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  [v32 updateDictationPopoverLocationForCandidateInlineView:v33 yOffset:0.0];
}

- (void)updateHostedInlineCandidatesWithInlineText:(id)a3 type:(int)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
  -[UIKeyboardCandidateController setCandidates:type:inlineText:inlineRect:maxX:layout:inlineCandidatesAreHosted:](self, "setCandidates:type:inlineText:inlineRect:maxX:layout:inlineCandidatesAreHosted:", 0, *(void *)&a4, a3, a7, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6);
  BOOL v8 = [(UIKeyboardCandidateSceneHostingController *)self->_hostingController isExpanded];
  [(UIKeyboardCandidateController *)self clientExpandedStateChanged:v8];
}

- (void)setScreenTraits:(id)a3
{
  id v5 = (UIKBScreenTraits *)a3;
  if (self->_screenTraits != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_screenTraits, a3);
    [(UIKeyboardCandidateController *)self updateStates];
    id v5 = v6;
  }
}

- (BOOL)isExtendedList
{
  BOOL v3 = ([(UIKeyboardCandidateController *)self activeCandidateViewType] & 2) != 0
    && [(UIKeyboardCandidateController *)self barIsExtended];
  unint64_t v4 = [(UIKeyboardCandidateController *)self activeCandidateViewType];
  if ((v4 & 4) == 0 || v3)
  {
    return (v4 >> 2) & 1 | v3;
  }
  else
  {
    LOBYTE(v5) = [(UIKeyboardCandidateController *)self inlineViewIsExtended];
  }
  return v5;
}

- (BOOL)isFloatingList
{
  return ((unint64_t)[(UIKeyboardCandidateController *)self activeCandidateViewType] >> 2) & 1;
}

- (void)setUIKeyboardCandidateListDelegate:(id)a3
{
  -[UIKeyboardCandidateController setCandidateListDelegate:](self, "setCandidateListDelegate:");
  if (!a3)
  {
    [(UIKeyboardCandidateController *)self collapse];
    [(UIKeyboardCandidateController *)self setCandidateResultSet:0];
    [(UIKeyboardCandidateController *)self removeInlineView];
  }
}

- (void)showCandidateAtIndex:(unint64_t)a3
{
}

- (void)showCandidateAtIndex:(unint64_t)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  }
  [v9 setSelectedIndexPath:v8 animated:v6 scrollPosition:a5];
}

- (BOOL)showCandidate:(id)a3
{
  return [(UIKeyboardCandidateController *)self showCandidate:a3 animated:0 scrollPosition:0];
}

- (BOOL)showCandidate:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  BOOL v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 indexPathForCandidate:v8];
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v10 setSelectedIndexPath:v11 animated:v6 scrollPosition:a5];
  }
  else {
    [v10 setSelectedIndexPath:v11];
  }

  return v11 != 0;
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  BOOL v6 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  LOBYTE(v4) = [v6 hasCandidateInForwardDirection:v5 granularity:v4];

  return v4;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (a4 == 1 && ([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) != 0)
  {
    BOOL v7 = [(UIKeyboardCandidateController *)self inlineViewIsExtended];
    if (!v5)
    {
      if (!v7) {
        goto LABEL_8;
      }
      LOBYTE(v7) = [(UIKeyboardCandidateController *)self hasCandidateInForwardDirection:0 granularity:1];
    }
    if (!v7) {
      [(UIKeyboardCandidateController *)self toggleInlineViewExtendedAnimated:1 completion:&__block_literal_global_78];
    }
  }
LABEL_8:
  id v8 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  [v8 showCandidateInForwardDirection:v5 granularity:v4];
}

- (void)acceptSelectedCandidate
{
  BOOL v3 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  uint64_t v4 = [v3 selectedCandidate];
  [(UIKeyboardCandidateController *)self setCurrentCandidate:v4];

  BOOL v5 = [(UIKeyboardCandidateController *)self candidateListDelegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(UIKeyboardCandidateController *)self candidateListDelegate];
    [v6 candidateListAcceptCandidate:self];
  }
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) == 0) {
    return 0;
  }
  id v6 = [(UIKeyboardCandidateController *)self inlineView];
  char v7 = [v6 handleNumberKey:a3];

  return v7;
}

- (BOOL)handleTabKeyWithShift:(BOOL)a3
{
  BOOL v3 = !a3;
  uint64_t v4 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  int v5 = [v4 hasCandidateInForwardDirection:v3 granularity:3];
  if (v5) {
    [v4 showCandidateInForwardDirection:v3 granularity:3];
  }

  return v5;
}

- (TIKeyboardCandidate)currentCandidate
{
  currentCandidate = self->_currentCandidate;
  if (currentCandidate)
  {
    BOOL v3 = currentCandidate;
  }
  else
  {
    uint64_t v4 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
    BOOL v3 = [v4 selectedCandidate];
  }
  return v3;
}

- (unint64_t)currentIndex
{
  BOOL v3 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 selectedIndexPath];
    id v6 = v5;
    if (v5)
    {
      if ([v5 section])
      {
        char v7 = [(UIKeyboardCandidateController *)self candidateResultSet];
        id v8 = [v7 candidates];
        id v9 = [v4 selectedCandidate];
        unint64_t v10 = [v8 indexOfObject:v9];
      }
      else
      {
        unint64_t v10 = [v6 row];
      }
    }
    else
    {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)candidateAcceptedAtIndex:(unint64_t)a3
{
}

- (BOOL)hasCandidates
{
  uint64_t v2 = [(UIKeyboardCandidateController *)self candidateResultSet];
  char v3 = [v2 hasCandidates];

  return v3;
}

- (id)keyboardBehaviors
{
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  int v3 = [v2 accessibilityUsesExtendedKeyboardPredictionsEnabled];

  uint64_t v4 = (Class *)0x1E4FAE2F0;
  if (!v3) {
    uint64_t v4 = (Class *)0x1E4FAE2F8;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

- (id)statisticsIdentifier
{
  char v3 = [(UIKeyboardCandidateController *)self activeCandidateViewType];
  uint64_t v4 = [(UIKeyboardCandidateController *)self screenTraits];
  uint64_t v5 = [v4 idiom];
  uint64_t v6 = v5;
  if ((v3 & 2) != 0)
  {
    if (v5 == 1 && +[UIKeyboardImpl isSplit])
    {
      unint64_t v10 = +[UIKeyboardImpl activeInstance];
      char v11 = [v10 centerFilled];

      if ((v11 & 1) == 0)
      {
        BOOL v12 = [(UIKeyboardCandidateController *)self barIsExtended];
        id v9 = (id *)MEMORY[0x1E4FAEC80];
        long long v13 = (id *)MEMORY[0x1E4FAEC78];
        goto LABEL_13;
      }
    }
    else
    {
    }
    BOOL v12 = [(UIKeyboardCandidateController *)self barIsExtended];
    id v9 = (id *)MEMORY[0x1E4FAEC40];
    long long v13 = (id *)MEMORY[0x1E4FAEC38];
LABEL_13:
    if (v12) {
      id v9 = v13;
    }
    goto LABEL_15;
  }

  if (v6)
  {
    char v7 = [(UIKeyboardCandidateController *)self screenTraits];
    uint64_t v8 = [v7 idiom];

    if (v8 != 1) {
      goto LABEL_18;
    }
    if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) == 0)
    {
      if ([(UIKeyboardCandidateController *)self activeCandidateViewType])
      {
        id v9 = (id *)MEMORY[0x1E4FAEC88];
LABEL_15:
        id v14 = *v9;
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    BOOL v12 = [(UIKeyboardCandidateController *)self inlineViewIsExtended];
    id v9 = (id *)MEMORY[0x1E4FAEC70];
    long long v13 = (id *)MEMORY[0x1E4FAEC68];
    goto LABEL_13;
  }
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) != 0)
  {
    BOOL v12 = [(UIKeyboardCandidateController *)self inlineViewIsExtended];
    id v9 = (id *)MEMORY[0x1E4FAEC98];
    long long v13 = (id *)MEMORY[0x1E4FAEC90];
    goto LABEL_13;
  }
  if ([(UIKeyboardCandidateController *)self activeCandidateViewType])
  {
    id v9 = (id *)MEMORY[0x1E4FAECA0];
    goto LABEL_15;
  }
LABEL_18:
  id v14 = 0;
LABEL_19:
  return v14;
}

- (unint64_t)selectedSortIndex
{
  uint64_t v2 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  unint64_t v3 = [v2 selectedSortControlIndex];

  return v3;
}

- (void)candidatesDidChange
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIKeyboardCandidatesChanged" object:0];
}

- (void)revealHiddenCandidates
{
  unint64_t v3 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
  if (v3)
  {
    id v10 = v3;
    uint64_t v4 = [(UIKeyboardCandidateController *)self candidateResultSet];
    uint64_t v5 = [v4 disambiguationCandidates];
    uint64_t v6 = [v5 count];

    unint64_t v3 = v10;
    if (v6)
    {
      if (([v10 hasCandidateInForwardDirection:1 granularity:0 inGridType:1] & 1) == 0) {
        [v10 setDisambiguationSelectedIndexPath:0];
      }
      [v10 showCandidateInForwardDirection:1 granularity:0 inGridType:1];
      char v7 = [v10 selectedDisambiguationCandidate];
      uint64_t v8 = (void *)[v7 copy];

      if (objc_opt_respondsToSelector()) {
        [v8 setGeneratedByChoosePinyin:1];
      }
      id v9 = [v10 disambiguationSelectedIndexPath];
      [(UIKeyboardCandidateController *)self candidateView:v10 didAcceptCandidate:v8 atIndexPath:v9 inGridType:1 generateFeedback:0];

      unint64_t v3 = v10;
    }
  }
}

- (id)candidateAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(UIKeyboardCandidateController *)self candidateResultSet];
  uint64_t v6 = [v5 candidates];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v8 = [(UIKeyboardCandidateController *)self candidateResultSet];
    id v9 = [v8 candidates];
    id v10 = [v9 objectAtIndex:a3];
  }
  return v10;
}

- (int64_t)viewOffsetForCandidateAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(UIKeyboardCandidateController *)self candidateAtIndex:a3];
  if (v4)
  {
    uint64_t v5 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
    int64_t v6 = [v5 viewOffsetForCandidate:v4];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (int64_t)rowForCandidateAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(UIKeyboardCandidateController *)self candidateAtIndex:a3];
  if (v4)
  {
    uint64_t v5 = [(UIKeyboardCandidateController *)self firstNonEmptyActiveCandidateView];
    int64_t v6 = [v5 rowForCandidate:v4];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)secureCandidateRenderTraits
{
  unint64_t v3 = off_1E52D4000;
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 2) != 0
    || ![(UIKeyboardCandidateController *)self activeCandidateViewType])
  {
    uint64_t v8 = [(UIKeyboardCandidateController *)self barState];
    uint64_t v4 = [v8 style];

    if (!v4)
    {
      id v9 = [(UIKeyboardCandidateController *)self barConfiguration];
      id v10 = [v9 initialState];
      uint64_t v4 = [v10 style];
    }
    char v11 = [(UIKeyboardCandidateController *)self bar];
    [v11 bounds];
    double Width = v12;

    id v14 = [(UIKeyboardCandidateController *)self screenTraits];
    -[UIKeyboardCandidateController rowHeightForBarForOrientation:](self, "rowHeightForBarForOrientation:", [v14 orientation]);
    double Height = v15;

    uint64_t v16 = [(UIKeyboardCandidateController *)self barConfiguration];
    goto LABEL_9;
  }
  if ([(UIKeyboardCandidateController *)self activeCandidateViewType])
  {
    double v42 = [(TUICandidateView *)self->_key state];
    uint64_t v4 = [v42 style];

    if (!v4)
    {
      double v43 = [(UIKeyboardCandidateController *)self keyConfiguration];
      double v44 = [v43 initialState];
      uint64_t v4 = [v44 style];
    }
    [(TUICandidateView *)self->_key bounds];
    double Width = CGRectGetWidth(v50);
    [(TUICandidateView *)self->_key bounds];
    double Height = CGRectGetWidth(v51);
    [v4 rowHeight];
    if (Height >= v45) {
      double Height = v45;
    }
    uint64_t v17 = [(UIKeyboardCandidateController *)self keyConfiguration];
    int v6 = 0;
LABEL_10:
    uint64_t v5 = [v17 maxNumberOfProactiveCandidates];

    if (Width != 0.0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (([(UIKeyboardCandidateController *)self activeCandidateViewType] & 4) != 0)
  {
    double v46 = [(UIKeyboardCandidateController *)self inlineViewState];
    uint64_t v4 = [v46 style];

    if (!v4)
    {
      BOOL v47 = [(UIKeyboardCandidateController *)self inlineConfiguration];
      double v48 = [v47 initialState];
      uint64_t v4 = [v48 style];
    }
    [(TUICandidateView *)self->_inlineView bounds];
    double Width = CGRectGetWidth(v52);
    [(TUICandidateView *)self->_inlineView bounds];
    double Height = CGRectGetHeight(v53);
    uint64_t v16 = [(UIKeyboardCandidateController *)self inlineConfiguration];
LABEL_9:
    uint64_t v17 = (void *)v16;
    int v6 = 1;
    goto LABEL_10;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  int v6 = 1;
  double Height = 0.0;
LABEL_11:
  id v18 = +[UIScreen mainScreen];
  [v18 bounds];
  double Width = v19;

LABEL_12:
  uint64_t v20 = [off_1E52D39B8 systemFontOfSize:14.0];
  uint64_t v21 = [v20 fontName];

  id v22 = objc_alloc_init(MEMORY[0x1E4FAE388]);
  id v23 = objc_alloc(MEMORY[0x1E4FAE390]);
  if ([(UIKeyboardCandidateController *)self darkKeyboard]) {
    [MEMORY[0x1E4FAE380] whiteColor];
  }
  else {
  char v24 = [MEMORY[0x1E4FAE380] blackColor];
  }
  char v25 = (void *)[v23 initWithFontName:v21 maxFontSize:v24 minFontSize:17.0 textColor:15.0];
  [v22 setHeaderTextTraits:v25];

  BOOL v26 = [v22 headerTextTraits];
  [v22 setInputTextTraits:v26];

  if (v6)
  {
    [v22 setResultCountToSingleCellWidth:MEMORY[0x1E4F1CBF0]];
    if (Width <= 0.0) {
      +[UIKeyboardPredictionCellMetrics secureCandidateEstimatedMetricsDictionary];
    }
    else {
    double v35 = +[UIKeyboardPredictionCellMetrics secureCandidateEstimatedMetricsDictionaryForWidth:Width];
    }
    [v22 setCellWidthOptions:v35];

    double v27 = [v22 cellWidthOptions];
    double v36 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4FAE960]];
    [v36 floatValue];
    [(UIKeyboardCandidateController *)self setSingleSlottedCellMargin:(Width - v37) * 0.5];
  }
  else
  {
    double v27 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v28 = [v4 maxNumberOfProactiveCells];
    uint64_t v29 = 0;
    if (v28 <= 1) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = v28;
    }
    uint64_t v31 = v30 + 1;
    do
    {
      if (v29)
      {
        double v32 = Width / (double)(int)v29;
        if (v29 == 1)
        {
          [v4 singleSlottedCellMargin];
          double v32 = v32 - (v33 + v33);
        }
      }
      else
      {
        double v32 = 0.0;
      }
      double v34 = [NSNumber numberWithDouble:v32];
      [v27 addObject:v34];

      ++v29;
    }
    while (v31 != v29);
    [v22 setResultCountToSingleCellWidth:v27];
    unint64_t v3 = off_1E52D4000;
  }

  [v22 setSingleCellHeight:Height];
  [v4 extraCellPadding];
  [v22 setSingleCellVerticalPadding:v38 * 0.5];
  [v22 setMaxCellCount:v5];
  double v39 = [(__objc2_class *)v3[203] mainScreen];
  [v39 scale];
  objc_msgSend(v22, "setScreenScale:");

  double v40 = [(UIKeyboardCandidateController *)self barConfiguration];
  objc_msgSend(v22, "setIsCandidateUI:", objc_msgSend(v40, "shouldUsePredictionViewSecureRenderTraits") ^ 1);

  return v22;
}

- (void)candidateViewDidTapArrowButton:(id)a3
{
}

- (void)toggleCandidateView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v21 = a3;
  id v8 = a5;
  id v9 = [(UIKeyboardCandidateController *)self bar];

  if (v9 == v21)
  {
    double v12 = [(UIKeyboardCandidateController *)self bar];
    long long v13 = [v12 state];
    id v14 = [(UIKeyboardCandidateController *)self barState];
    double v15 = UIKBAnalyticsCandidateUIDirectionOpen;
    if (v13 != v14) {
      double v15 = UIKBAnalyticsCandidateUIDirectionClose;
    }
    +[UIKBAnalyticsDispatcher candidateViewExtended:@"Button" direction:*v15];

    if ([(UIKeyboardCandidateController *)self isTextEffectsButtonPresented])
    {
      uint64_t v16 = +[UIKeyboardImpl activeInstance];
      uint64_t v17 = [v16 delegateAsResponder];

      if (objc_opt_respondsToSelector()) {
        [v17 performSelector:sel__showTextFormattingAnimationOptions_ withObject:0];
      }
    }
    else
    {
      if (!-[UIKeyboardCandidateController reuseArrowButtonToExpandAssistantBarItems](self, "reuseArrowButtonToExpandAssistantBarItems")|| (-[UIKeyboardCandidateController bar](self, "bar"), id v18 = objc_claimAutoreleasedReturnValue(), [v18 state], v19 = objc_claimAutoreleasedReturnValue(), v20 = objc_msgSend(v19, "arrowButtonDirection"), v19, v18, v20 != 2))
      {
        [(UIKeyboardCandidateController *)self toggleBarExtended];
        goto LABEL_16;
      }
      uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 postNotificationName:@"UIKeyboardShouldExpandAssistantBarItems" object:0 userInfo:0];
    }

    goto LABEL_16;
  }
  id v10 = [(UIKeyboardCandidateController *)self inlineView];

  if (v10 == v21)
  {
    [(UIKeyboardCandidateController *)self toggleInlineViewExtendedAnimated:v6 completion:v8];
  }
  else
  {
    id v11 = [(UIKeyboardCandidateController *)self key];

    if (v11 == v21) {
      [(UIKeyboardCandidateController *)self toggleKeyViewExtendedAnimated:v6 completion:v8];
    }
  }
LABEL_16:
}

- (void)candidateViewDidTapInlineText:(id)a3
{
  id v10 = a3;
  id v4 = [(UIKeyboardCandidateController *)self bar];
  if (v4 != v10) {
    goto LABEL_2;
  }
  uint64_t v5 = [v10 state];
  BOOL v6 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];

  if (v5 == v6)
  {
    unint64_t v7 = [(UIKeyboardCandidateController *)self extendedBarState];
    [v10 setState:v7 animated:1 options:0 force:0 completion:&__block_literal_global_94_1];

    id v4 = +[UIInputViewAnimationStyle animationStyleDefault];
    [v4 setDontMerge:1];
    [v4 setExtraOptions:0];
    [(id)objc_opt_class() candidateViewAnimationDuration];
    objc_msgSend(v4, "setDuration:");
    id v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v8 maximizeWithAnimationStyle:v4 force:1];

    id v9 = [v10 state];
    [v9 yOffset];
    -[UIKeyboardCandidateController extendKeyboardBackdropHeight:](self, "extendKeyboardBackdropHeight:");

LABEL_2:
  }
}

- (void)candidateViewWillBeginDragging:(id)a3
{
  id v11 = a3;
  id v4 = [(UIKeyboardCandidateController *)self bar];
  if (v4 != v11) {
    goto LABEL_2;
  }
  uint64_t v5 = [v11 state];
  BOOL v6 = [(UIKeyboardCandidateController *)self extendedBarState];

  if (v5 == v6)
  {
    unint64_t v7 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];

    if (v7)
    {
      id v8 = [(UIKeyboardCandidateController *)self extendedScrolledBarState];
      [v11 setState:v8 animated:1 options:0 force:0 completion:&__block_literal_global_96_2];

      id v4 = +[UIInputViewAnimationStyle animationStyleDefault];
      [v4 setDontMerge:1];
      [v4 setExtraOptions:0];
      [(id)objc_opt_class() candidateViewAnimationDuration];
      objc_msgSend(v4, "setDuration:");
      id v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      [v9 minimizeWithAnimationStyle:v4 force:1];

      id v10 = [v11 state];
      [v10 yOffset];
      -[UIKeyboardCandidateController extendKeyboardBackdropHeight:](self, "extendKeyboardBackdropHeight:");

LABEL_2:
    }
  }
}

- (void)candidateViewSelectionDidChange:(id)a3 inGridType:(int64_t)a4
{
  uint64_t v5 = [(UIKeyboardCandidateController *)self candidateListDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UIKeyboardCandidateController *)self candidateListDelegate];
    [v7 candidateListSelectionDidChange:self];
  }
}

- (void)candidateViewNeedsToExpand:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardCandidateController *)self inlineView];

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__UIKeyboardCandidateController_candidateViewNeedsToExpand___block_invoke;
    v6[3] = &unk_1E52DC3A0;
    id v7 = v4;
    [(UIKeyboardCandidateController *)self toggleInlineViewExtendedAnimated:1 completion:v6];
  }
}

void __60__UIKeyboardCandidateController_candidateViewNeedsToExpand___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  id v2 = [v1 selectedIndexPath];
  [v1 setSelectedIndexPath:v2 animated:0 scrollPosition:0];
}

- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v13 = a3;
  double v12 = +[UIKeyboardImpl activeInstance];
  [v12 updateIdleDetection:0];

  [(UIKeyboardCandidateController *)self candidateView:v13 didAcceptCandidate:v11 atIndexPath:v10 inGridType:a6 generateFeedback:1];
}

- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6 generateFeedback:(BOOL)a7
{
  BOOL v7 = a7;
  [(UIKeyboardCandidateController *)self setCurrentCandidate:a4];
  id v9 = [(UIKeyboardCandidateController *)self candidateListDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(UIKeyboardCandidateController *)self candidateListDelegate];
    [v11 candidateListAcceptCandidate:self];
  }
  if (v7)
  {
    if ([(UIKBScreenTraits *)self->_screenTraits idiom] == 3)
    {
      id v13 = +[UIDevice currentDevice];
      [v13 _playSystemSound:1123];
    }
    else
    {
      id v13 = +[UIKeyboardImpl activeInstance];
      double v12 = [v13 feedbackGenerator];
      [v12 actionOccurred:10];
    }
  }
}

- (void)_setRenderConfig:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  objc_storeStrong((id *)&self->_renderConfig, v3);
  LODWORD(v3) = self->_darkKeyboard;
  if (v3 != ([v5 lightKeyboard] ^ 1))
  {
    self->_darkKeyboard = [v5 lightKeyboard] ^ 1;
    [(UIKeyboardCandidateController *)self updateStates];
  }
}

- (void)dimKeys:(id)a3
{
  id v6 = a3;
  id v4 = [(UIKeyboardCandidateController *)self opacities];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    [(UIKeyboardCandidateController *)self setOpacities:v6];
    [(UIKeyboardCandidateController *)self updateStates];
  }
}

- (id)obtainHideDisambiguationCandidatesAssertionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:0 initialState:1 reason:a3 requiresExplicitInvalidation:1];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return !a3 && [(UIKeyboardCandidateController *)self hideDisambiguationCandidates];
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4) {
    [(UIKeyboardCandidateController *)self setHideDisambiguationCandidates:a3];
  }
}

- (void)setInlineRectIsVertical:(BOOL)a3
{
  self->_inlineRectIsVertical = a3;
  -[UIKeyboardCandidateSceneHostingController setHostIsTextVertical:](self->_hostingController, "setHostIsTextVertical:");
}

- (BOOL)inlineRectIsVertical
{
  return self->_inlineRectIsVertical;
}

- (UIView)hostingParentView
{
  return self->_hostedInlineViewContainer;
}

- (BOOL)hostTextIsVertical
{
  id v2 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  char v3 = [v2 inlineRectIsVertical];

  return v3;
}

- (void)clientStateChangedWithIsExpanded:(BOOL)a3 isVisible:(BOOL)a4
{
  BOOL v4 = a3;
  [(UIKeyboardCandidateController *)self clientVisibilityChanged:a4];
  [(UIKeyboardCandidateController *)self clientExpandedStateChanged:v4];
}

- (void)clientExpandedStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(UIKeyboardCandidateController *)self inlineViewState];
  id v6 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  BOOL v7 = v6;
  if (v3)
  {
    id v8 = [v6 extendedState];

    if (v5 != v8)
    {
      id v9 = [(UIKeyboardCandidateController *)self inlineConfiguration];
      char v10 = [v9 extendedState];
      [(UIKeyboardCandidateController *)self setInlineViewState:v10];

      id v11 = [(UIKeyboardCandidateController *)self inlineViewState];
      [v11 yOffset];
      float v13 = v12;

      id v14 = [(UIKeyboardCandidateController *)self inlineViewContainer];
      LODWORD(v10) = [v14 shouldExtendUpwards];

      if (v10)
      {
        double v15 = [(UIKeyboardCandidateController *)self inlineViewState];
        [v15 additionalHeight];
        float v13 = v13 - v16;
      }
      [(UIView *)self->_inlineViewContainer frame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23 + v13;
      char v25 = [(UIKeyboardCandidateController *)self inlineViewState];
      [v25 additionalHeight];
      double v27 = v22 + v26;

      inlineViewContainer = self->_inlineViewContainer;
      -[UIView setFrame:](inlineViewContainer, "setFrame:", v18, v24, v20, v27);
    }
    return;
  }
  uint64_t v29 = [v6 initialState];

  if (v5 == v29) {
    return;
  }
  uint64_t v30 = [(UIKeyboardCandidateController *)self inlineViewState];
  [v30 yOffset];
  float v32 = v31;

  double v33 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  if (![v33 shouldExtendUpwards]) {
    goto LABEL_12;
  }
  double v34 = [(UIKeyboardCandidateController *)self inlineViewContainer];
  int v35 = [v34 position];

  if (v35 == 1)
  {
    double v33 = [(UIKeyboardCandidateController *)self inlineViewState];
    [v33 additionalHeight];
    float v32 = v32 - v36;
LABEL_12:
  }
  [(UIView *)self->_inlineViewContainer frame];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43 - v32;
  double v45 = [(UIKeyboardCandidateController *)self inlineViewState];
  [v45 additionalHeight];
  double v47 = v42 - v46;

  -[UIView setFrame:](self->_inlineViewContainer, "setFrame:", v38, v44, v40, v47);
  id v49 = [(UIKeyboardCandidateController *)self inlineConfiguration];
  double v48 = [v49 initialState];
  [(UIKeyboardCandidateController *)self setInlineViewState:v48];
}

- (void)clientVisibilityChanged:(BOOL)a3
{
}

- (void)hostedInlineFloatingViewFrameUpdated
{
  id v5 = [(UIKeyboardCandidateController *)self inlineView];
  BOOL v3 = [(UIKeyboardCandidateController *)self inlineView];
  BOOL v4 = [v3 state];
  [v5 setState:v4 animated:0 options:0 force:1 completion:0];
}

- (void)hostedInlineFloatingViewIsTextVerticalUpdated:(BOOL)a3
{
  [(UIKeyboardCandidateController *)self updateStates];
  id v6 = [(UIKeyboardCandidateController *)self inlineView];
  BOOL v4 = [(UIKeyboardCandidateController *)self inlineView];
  id v5 = [v4 state];
  [v6 setState:v5 animated:0 options:0 force:1 completion:0];
}

- (UIKeyboardCandidateControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardCandidateControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (NSString)inlineText
{
  return self->_inlineText;
}

- (CGRect)inlineRect
{
  double x = self->_inlineRect.origin.x;
  double y = self->_inlineRect.origin.y;
  double width = self->_inlineRect.size.width;
  double height = self->_inlineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInlineRect:(CGRect)a3
{
  self->_inlineRect = a3;
}

- (BOOL)adjustForLeftHandBias
{
  return self->_adjustForLeftHandBias;
}

- (void)setAdjustForLeftHandBias:(BOOL)a3
{
  self->_adjustForLeftHandBias = a3;
}

- (BOOL)reuseArrowButtonToExpandAssistantBarItems
{
  return self->_reuseArrowButtonToExpandAssistantBarItems;
}

- (void)setReuseArrowButtonToExpandAssistantBarItems:(BOOL)a3
{
  self->_reuseArrowButtonToExpandAssistantBarItems = a3;
}

- (double)splitGap
{
  return self->_splitGap;
}

- (void)setSplitGap:(double)a3
{
  self->_splitGap = a3;
}

- (int64_t)activeCandidateViewType
{
  return self->_activeCandidateViewType;
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (UIKeyboardCandidateListDelegate)candidateListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_candidateListDelegate);
  return (UIKeyboardCandidateListDelegate *)WeakRetained;
}

- (void)setCandidateListDelegate:(id)a3
{
}

- (TUICandidateView)bar
{
  return self->_bar;
}

- (void)setBar:(id)a3
{
}

- (TUICandidateView)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (TUICandidateView)inlineView
{
  return self->_inlineView;
}

- (void)setInlineView:(id)a3
{
}

- (UIKeyboardCandidateInlineFloatingView)inlineViewContainer
{
  return self->_inlineViewContainer;
}

- (void)setInlineViewContainer:(id)a3
{
}

- (UIView)hostedInlineViewContainer
{
  return self->_hostedInlineViewContainer;
}

- (void)setHostedInlineViewContainer:(id)a3
{
}

- (NSMutableArray)activeViews
{
  return self->_activeViews;
}

- (void)setActiveViews:(id)a3
{
}

- (UIKeyboardCandidateViewConfiguration)barConfiguration
{
  return self->_barConfiguration;
}

- (void)setBarConfiguration:(id)a3
{
}

- (UIKeyboardCandidateViewConfiguration)inlineConfiguration
{
  return self->_inlineConfiguration;
}

- (void)setInlineConfiguration:(id)a3
{
}

- (UIKeyboardCandidateViewConfiguration)keyConfiguration
{
  return self->_keyConfiguration;
}

- (void)setKeyConfiguration:(id)a3
{
}

- (UIKeyboardCandidateViewState)barState
{
  return self->_barState;
}

- (void)setBarState:(id)a3
{
}

- (UIKeyboardCandidateViewState)extendedBarState
{
  return self->_extendedBarState;
}

- (void)setExtendedBarState:(id)a3
{
}

- (UIKeyboardCandidateViewState)extendedScrolledBarState
{
  return self->_extendedScrolledBarState;
}

- (void)setExtendedScrolledBarState:(id)a3
{
}

- (UIKeyboardCandidateViewState)inlineViewState
{
  return self->_inlineViewState;
}

- (void)setInlineViewState:(id)a3
{
}

- (UIKeyboardCandidateViewState)extendedInlineViewState
{
  return self->_extendedInlineViewState;
}

- (void)setExtendedInlineViewState:(id)a3
{
}

- (UIKeyboardCandidateViewState)keyState
{
  return self->_keyState;
}

- (void)setKeyState:(id)a3
{
}

- (UIKeyboardCandidateViewState)extendedKeyState
{
  return self->_extendedKeyState;
}

- (void)setExtendedKeyState:(id)a3
{
}

- (double)additionalExtendedBarBackdropOffset
{
  return self->_additionalExtendedBarBackdropOffset;
}

- (void)setAdditionalExtendedBarBackdropOffset:(double)a3
{
  self->_additionalExtendedBarBackdropOffset = a3;
}

- (void)setCurrentCandidate:(id)a3
{
}

- (BOOL)darkKeyboard
{
  return self->_darkKeyboard;
}

- (void)setDarkKeyboard:(BOOL)a3
{
  self->_darkKeyboard = a3;
}

- (BOOL)darkKeyboardChanged
{
  return self->_darkKeyboardChanged;
}

- (void)setDarkKeyboardChanged:(BOOL)a3
{
  self->_darkKeyboardChanged = a3;
}

- (NSDictionary)opacities
{
  return self->_opacities;
}

- (void)setOpacities:(id)a3
{
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setRenderConfig:(id)a3
{
}

- (UIKeyboardCandidateSceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (BOOL)hideDisambiguationCandidates
{
  return self->_hideDisambiguationCandidates;
}

- (BOOL)isTextEffectsButtonPresented
{
  return self->_isTextEffectsButtonPresented;
}

- (void)setIsTextEffectsButtonPresented:(BOOL)a3
{
  self->_isTextEffectsButtonPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_opacities, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_extendedKeyState, 0);
  objc_storeStrong((id *)&self->_keyState, 0);
  objc_storeStrong((id *)&self->_extendedInlineViewState, 0);
  objc_storeStrong((id *)&self->_inlineViewState, 0);
  objc_storeStrong((id *)&self->_extendedScrolledBarState, 0);
  objc_storeStrong((id *)&self->_extendedBarState, 0);
  objc_storeStrong((id *)&self->_barState, 0);
  objc_storeStrong((id *)&self->_keyConfiguration, 0);
  objc_storeStrong((id *)&self->_inlineConfiguration, 0);
  objc_storeStrong((id *)&self->_barConfiguration, 0);
  objc_storeStrong((id *)&self->_activeViews, 0);
  objc_storeStrong((id *)&self->_hostedInlineViewContainer, 0);
  objc_storeStrong((id *)&self->_inlineViewContainer, 0);
  objc_storeStrong((id *)&self->_inlineView, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bar, 0);
  objc_destroyWeak((id *)&self->_candidateListDelegate);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_inlineText, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionController, 0);
}

@end