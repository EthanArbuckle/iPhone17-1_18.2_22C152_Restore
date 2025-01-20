@interface UICalloutBar
+ (BOOL)sharedCalloutBarIsVisible;
+ (id)_visualStyleForCalloutBar:(id)a3;
+ (id)activeCalloutBar;
+ (id)sharedCalloutBar;
+ (void)_releaseSharedInstance;
+ (void)fadeSharedCalloutBar;
+ (void)fadeSharedCalloutBarFromTargetView:(id)a3;
+ (void)hideSharedCalloutBar;
+ (void)hideSharedCalloutBarFromTargetView:(id)a3;
+ (void)performWithoutAffectingSharedCalloutBar:(id)a3;
+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4;
- (BOOL)_isOwnedByView:(id)a3;
- (BOOL)_touchesInsideShouldHideCalloutBar;
- (BOOL)_updateVisibleItemsAnimated:(BOOL)a3;
- (BOOL)calculateControlFrameForCalloutSize:(CGSize)a3 below:(BOOL)a4;
- (BOOL)calculateControlFrameForCalloutSize:(CGSize)a3 right:(BOOL)a4;
- (BOOL)calculateControlFrameInsideTargetRect:(CGSize)a3;
- (BOOL)containsButtonForAction:(SEL)a3;
- (BOOL)fadedDueToCommand;
- (BOOL)hasReplacements;
- (BOOL)isDisplayingVertically;
- (BOOL)isUsingVerticalFallbackPosition;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)recentlyFaded;
- (BOOL)rectClear:(CGRect)a3;
- (BOOL)setFrameForSize:(CGSize)a3;
- (BOOL)showAllReplacements;
- (BOOL)suppressesAppearance;
- (BOOL)supressesHorizontalMovement;
- (BOOL)targetHorizontal;
- (BOOL)visible;
- (CGPoint)pointAboveControls;
- (CGPoint)pointBelowControls;
- (CGPoint)pointLeftOfControls;
- (CGPoint)pointRightOfControls;
- (CGPoint)targetPoint;
- (CGRect)controlFrame;
- (CGRect)targetRect;
- (CGRect)textEffectsWindowSafeArea;
- (NSArray)extraItems;
- (NSArray)rectsToEvade;
- (NSArray)replacements;
- (NSDictionary)currentAppearOrFadeContext;
- (NSString)untruncatedString;
- (UICalloutBar)initWithFrame:(CGRect)a3;
- (UICalloutBarDelegate)delegate;
- (UIResponder)responderTarget;
- (UIScrollView)verticalScrollView;
- (UIStackView)verticalStackView;
- (UIView)targetView;
- (double)maxVerticalCalloutHeightForMinButtonHeight:(double)a3;
- (double)supressHorizontalXMovementIfNeededForPoint:(CGPoint)a3 proposedX:(double)a4;
- (id)_targetForAction:(SEL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)arrowDirection;
- (int)targetDirection;
- (int)textEffectsVisibilityLevel;
- (int64_t)indexOfButton:(id)a3;
- (void)_clearResponderTarget;
- (void)_endOngoingAppearOrFadeAnimations;
- (void)_fadeAfterCommand:(SEL)a3;
- (void)_showNextItems:(id)a3;
- (void)_showPreviousItems:(id)a3;
- (void)addRectToEvade:(CGRect)a3;
- (void)addVerticalSeparatorAfterButton:(id)a3 usingLargeText:(BOOL)a4;
- (void)adjustFrameToAvoidDividerOnArrow;
- (void)appear;
- (void)appearAnimationDidStopWithContext:(id)a3;
- (void)applicationDidAddDeactivationReason:(id)a3;
- (void)buttonHighlighted:(id)a3 highlighted:(BOOL)a4;
- (void)buttonHovered:(id)a3 index:(int64_t)a4 hovered:(BOOL)a5;
- (void)buttonPressed:(id)a3;
- (void)clearEvadeRects;
- (void)clearReplacements;
- (void)clearSupressesHorizontalMovementFrame;
- (void)configureButtons:(double)a3;
- (void)configureButtonsForVerticalView:(double)a3;
- (void)dealloc;
- (void)fade;
- (void)fadeAnimationDidStopWithContext:(id)a3 finished:(BOOL)a4;
- (void)fadeFromTargetView:(id)a3;
- (void)hide;
- (void)hideFromTargetView:(id)a3;
- (void)removeFromSuperview;
- (void)resetPage;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)scrollableButtonTouchDown:(id)a3;
- (void)setArrowDirection:(int)a3;
- (void)setControlFrame:(CGRect)a3;
- (void)setCurrentAppearOrFadeContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtraItems:(id)a3;
- (void)setPointAboveControls:(CGPoint)a3;
- (void)setPointBelowControls:(CGPoint)a3;
- (void)setPointLeftOfControls:(CGPoint)a3;
- (void)setPointRightOfControls:(CGPoint)a3;
- (void)setReplacements:(id)a3;
- (void)setResponderTarget:(id)a3;
- (void)setResponderTarget:(id)a3 completion:(id)a4;
- (void)setShowAllReplacements:(BOOL)a3;
- (void)setSuppressesAppearance:(BOOL)a3;
- (void)setSupressesHorizontalMovement:(BOOL)a3;
- (void)setTargetDirection:(int)a3;
- (void)setTargetHorizontal:(BOOL)a3;
- (void)setTargetPoint:(CGPoint)a3;
- (void)setTargetRect:(CGRect)a3;
- (void)setTargetRect:(CGRect)a3 view:(id)a4 arrowDirection:(int)a5;
- (void)setTargetRect:(CGRect)a3 view:(id)a4 pointBelowControls:(CGPoint)a5 pointAboveControls:(CGPoint)a6;
- (void)setTargetRect:(CGRect)a3 view:(id)a4 pointLeftOfControls:(CGPoint)a5 pointRightOfControls:(CGPoint)a6;
- (void)setTargetView:(id)a3;
- (void)setUntruncatedString:(id)a3;
- (void)show;
- (void)update;
- (void)updateAnimated:(BOOL)a3;
- (void)updateAvailableButtons;
- (void)updateForCurrentHorizontalPage;
- (void)updateForCurrentPage;
- (void)updateForCurrentVerticalPage;
@end

@implementation UICalloutBar

+ (void)hideSharedCalloutBar
{
  v2 = [a1 activeCalloutBar];
  int v3 = [v2 visible];

  if (v3)
  {
    v4 = (void *)qword_1EB25D848;
    [v4 hide];
  }
}

+ (void)fadeSharedCalloutBar
{
  v2 = [a1 activeCalloutBar];
  int v3 = [v2 visible];

  if (v3)
  {
    v4 = (void *)qword_1EB25D848;
    [v4 fade];
  }
}

+ (id)activeCalloutBar
{
  return (id)qword_1EB25D848;
}

+ (void)performWithoutAffectingSharedCalloutBar:(id)a3
{
  if (qword_1EB25D850)
  {
    v4 = (void (*)(void))*((void *)a3 + 2);
    id v8 = a3;
    v4();
    v5 = v8;
  }
  else
  {
    objc_storeStrong((id *)&qword_1EB25D850, (id)qword_1EB25D848);
    v6 = (void (**)(void))a3;
    v7 = (void *)qword_1EB25D848;
    qword_1EB25D848 = 0;

    v6[2](v6);
    objc_storeStrong((id *)&qword_1EB25D848, (id)qword_1EB25D850);
    v5 = (void *)qword_1EB25D850;
    qword_1EB25D850 = 0;
  }
}

+ (id)sharedCalloutBar
{
  v2 = (void *)xmmword_1EB25D848;
  if (xmmword_1EB25D848 == 0)
  {
    int v3 = [UICalloutBar alloc];
    uint64_t v4 = -[UICalloutBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v5 = (void *)xmmword_1EB25D848;
    *(void *)&xmmword_1EB25D848 = v4;

    v2 = (void *)xmmword_1EB25D848;
  }
  return v2;
}

+ (void)_releaseSharedInstance
{
  if ((void)xmmword_1EB25D848)
  {
    v2 = [(id)xmmword_1EB25D848 layer];
    [v2 removeAllAnimations];

    int v3 = (void *)xmmword_1EB25D848;
    *(void *)&xmmword_1EB25D848 = 0;
  }
}

+ (BOOL)sharedCalloutBarIsVisible
{
  v2 = [a1 activeCalloutBar];
  char v3 = [v2 visible];

  return v3;
}

+ (void)fadeSharedCalloutBarFromTargetView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [a1 activeCalloutBar];
  int v5 = [v4 visible];

  if (v5) {
    [(id)xmmword_1EB25D848 fadeFromTargetView:v6];
  }
}

+ (void)hideSharedCalloutBarFromTargetView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [a1 activeCalloutBar];
  int v5 = [v4 visible];

  if (v5) {
    [(id)xmmword_1EB25D848 hideFromTargetView:v6];
  }
}

- (UICalloutBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v95.receiver = self;
  v95.super_class = (Class)UICalloutBar;
  v7 = -[UIView initWithFrame:](&v95, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = +[UICalloutBar _visualStyleForCalloutBar:v7];
    m_visualStyle = v7->m_visualStyle;
    v7->m_visualStyle = (_UICalloutBarVisualStyle *)v8;

    v10 = [[UICalloutBarBackground alloc] initWithVisualStyle:v7->m_visualStyle];
    m_overladouble y = v7->m_overlay;
    v7->m_overladouble y = v10;

    [(UIView *)v7->m_overlay setAutoresizingMask:18];
    [(UIView *)v7 addSubview:v7->m_overlay];
    v12 = [(UIView *)v7 layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = [(UIView *)v7 layer];
    [v13 setHitTestsAsOpaque:1];

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_rectsToEvade = v7->m_rectsToEvade;
    v7->m_rectsToEvade = v14;

    v7->m_recalcVisibleItems = 1;
    CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v7->m_supressesHorizontalMovementFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->m_supressesHorizontalMovementFrame.size = v16;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v18 = _UINSLocalizedStringWithDefaultValue(@"Cut", @"Cut");
    v19 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v18 action:sel_cut_ type:1];
    [v17 addObject:v19];

    v20 = _UIKitBundle();
    v21 = [v20 localizedStringForKey:@"Copy[Menu]" value:@"Copy" table:@"Localizable"];
    v22 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v21 action:sel_copy_ type:1];
    [v17 addObject:v22];

    v23 = _UINSLocalizedStringWithDefaultValue(@"Select", @"Select");
    v24 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v23 action:sel_select_ type:1];
    [v17 addObject:v24];

    v25 = _UINSLocalizedStringWithDefaultValue(@"Select All", @"Select All");
    v26 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v25 action:sel_selectAll_ type:1];
    [v17 addObject:v26];

    v27 = [MEMORY[0x1E4FB3418] variantForSecureName:0x10000];
    v28 = [v27 localizedStringForLocalization:0];
    v94 = v27;
    v29 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v28, [v27 selector], 1);
    [v17 addObject:v29];

    v30 = _UIKitBundle();
    v31 = [v30 localizedStringForKey:@"Delete[Menu]" value:@"Delete" table:@"Localizable"];
    v32 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v31 action:sel_delete_ type:1];
    [v17 addObject:v32];

    v33 = _UINSLocalizedStringWithDefaultValue(@"Replace…", @"Replace…");
    v34 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v33 action:sel__promptForReplace_ type:2];
    [v17 addObject:v34];

    v35 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:@"简⇄繁" action:sel__transliterateChinese_ type:2];
    [v17 addObject:v35];

    v36 = _UINSLocalizedStringWithDefaultValue(@"Insert Drawing", @"Insert Drawing");
    v37 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v36 action:sel__insertDrawing_ type:1];
    [v17 addObject:v37];

    uint64_t v38 = +[UIAction _textFromCameraImage];
    v39 = +[UIAction _textFromCameraTitle];
    v93 = (void *)v38;
    v40 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v39 image:v38 action:sel_captureTextFromCamera_ type:0];
    [v17 addObject:v40];

    v41 = +[UIImage systemImageNamed:@"bold.italic.underline"];
    v42 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithImage:v41 action:sel__showTextStyleOptions_ type:0];

    [v42 setConfigurationBlock:&__block_literal_global_250];
    [v17 addObject:v42];
    v43 = +[UIDevice currentDevice];
    uint64_t v44 = [v43 userInterfaceIdiom];

    if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) != 0
       || [(id)UIApp _appAdoptsUISceneLifecycle]))
    {
      v45 = _UINSLocalizedStringWithDefaultValue(@"Open in New Window", @"Open in New Window");
      v46 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v45 action:sel__openInNewCanvas_ type:1];
      [v17 addObject:v46];
    }
    v47 = _UINSLocalizedStringWithDefaultValue(@"Look Up", @"Look Up");
    v48 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v47 action:sel__lookup_ type:0];
    [v17 addObject:v48];

    v49 = _UINSLocalizedStringWithDefaultValue(@"Look Up", @"Look Up");
    v50 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v49 action:sel__define_ type:0];
    [v17 addObject:v50];

    v51 = _UINSLocalizedStringWithDefaultValue(@"Translate", @"Translate");
    v52 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v51 action:sel__translate_ type:0];
    [v17 addObject:v52];

    v53 = _UINSLocalizedStringWithDefaultValue(@"Learn…", @"Learn…");
    v54 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v53 action:sel__addShortcut_ type:0];
    [v17 addObject:v54];

    v55 = _UINSLocalizedStringWithDefaultValue(@"Speak", @"Speak");
    v56 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v55 action:sel__accessibilitySpeak_ type:5];
    [v17 addObject:v56];

    v57 = _UINSLocalizedStringWithDefaultValue(@"Speak…", @"Speak…");
    v58 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v57 action:sel__accessibilitySpeakLanguageSelection_ type:5];
    [v17 addObject:v58];

    v59 = _UINSLocalizedStringWithDefaultValue(@"Pause", @"Pause");
    v60 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v59 action:sel__accessibilityPauseSpeaking_ type:5];
    [v17 addObject:v60];

    v61 = _UINSLocalizedStringWithDefaultValue(@"Share…", @"Share…");
    v62 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:v61 action:sel__share_ type:0];
    [v17 addObject:v62];

    v63 = _UIImageWithName(@"UICalloutBarTextRtoL.png");
    v64 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithImage:v63 action:sel_makeTextWritingDirectionRightToLeft_ type:0];
    [v17 addObject:v64];

    v65 = _UIImageWithName(@"UICalloutBarTextLtoR.png");
    v66 = +[_UICalloutBarSystemButtonDescription buttonDescriptionWithImage:v65 action:sel_makeTextWritingDirectionLeftToRight_ type:0];
    [v17 addObject:v66];

    objc_storeStrong((id *)&v7->m_systemButtonDescriptions, v17);
    v67 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", x, y, width, height);
    m_buttonView = v7->m_buttonView;
    v7->m_buttonView = v67;

    [(UIView *)v7->m_buttonView setAutoresizingMask:18];
    v69 = [(_UICalloutBarVisualStyle *)v7->m_visualStyle buttonMetrics];
    [v69 cornerRadius];
    -[UIView _setCornerRadius:](v7->m_buttonView, "_setCornerRadius:");

    [(UIView *)v7->m_buttonView setClipsToBounds:1];
    [(UIView *)v7 addSubview:v7->m_buttonView];
    BOOL v70 = [(UIView *)v7 _shouldReverseLayoutDirection];
    BOOL v71 = !v70;
    if (v70) {
      v72 = @"UICalloutBarNextArrow.png";
    }
    else {
      v72 = @"UICalloutBarPreviousArrow.png";
    }
    if (v71) {
      v73 = @"UICalloutBarNextArrow.png";
    }
    else {
      v73 = @"UICalloutBarPreviousArrow.png";
    }
    if (v71) {
      uint64_t v74 = 2;
    }
    else {
      uint64_t v74 = 1;
    }
    if (v71) {
      uint64_t v75 = 1;
    }
    else {
      uint64_t v75 = 2;
    }
    v76 = _UIImageWithName(v72);
    v77 = _UIImageWithName(v73);
    uint64_t v78 = +[UICalloutBarButton buttonWithImage:v76 action:sel__showPreviousItems_ type:3 inView:v7->m_buttonView visualStyle:v7->m_visualStyle];
    m_previousButton = v7->m_previousButton;
    v7->m_previousButton = (UICalloutBarButton *)v78;

    uint64_t v80 = +[UICalloutBarButton buttonWithImage:v77 action:sel__showNextItems_ type:3 inView:v7->m_buttonView visualStyle:v7->m_visualStyle];
    m_nextButton = v7->m_nextButton;
    v7->m_nextButton = (UICalloutBarButton *)v80;

    v82 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_currentSystemButtons = v7->m_currentSystemButtons;
    v7->m_currentSystemButtons = v82;

    v84 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_extraButtons = v7->m_extraButtons;
    v7->m_extraButtons = v84;

    v86 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_separatorViews = v7->m_separatorViews;
    v7->m_separatorViews = v86;

    v7->m_hoveredIndedouble x = -1;
    v88 = [[UISwipeGestureRecognizer alloc] initWithTarget:v7 action:sel__showPreviousItems_];
    [(UISwipeGestureRecognizer *)v88 setDirection:v75];
    [(UIView *)v7 addGestureRecognizer:v88];
    v89 = [[UISwipeGestureRecognizer alloc] initWithTarget:v7 action:sel__showNextItems_];
    [(UISwipeGestureRecognizer *)v89 setDirection:v74];
    [(UIView *)v7 addGestureRecognizer:v89];
    v90 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v90 addObserver:v7 selector:sel_applicationDidAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];

    v91 = v7;
  }

  return v7;
}

void __30__UICalloutBar_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDontDismiss:1];
  [v2 setImageVerticalAdjust:1.0];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIApplicationWillAddDeactivationReasonNotification" object:UIApp];

  v4.receiver = self;
  v4.super_class = (Class)UICalloutBar;
  [(UIView *)&v4 dealloc];
}

- (void)applicationDidAddDeactivationReason:(id)a3
{
  objc_super v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  if (v6 == 5)
  {
    [(UICalloutBar *)self hide];
  }
  else
  {
    [(UICalloutBar *)self fade];
  }
}

- (BOOL)visible
{
  char v3 = [(UIView *)self superview];
  BOOL v5 = v3 && ([(UIView *)self alpha], v4 == 1.0) && !self->m_fadeAfterCommand;

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(UIView *)self bounds];
  v12.double x = x;
  v12.double y = y;
  if (CGRectContainsPoint(v13, v12) && !self->m_isDisplayingVertically) {
    double y = 18.0;
  }
  v10.receiver = self;
  v10.super_class = (Class)UICalloutBar;
  uint64_t v8 = -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);

  return v8;
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

- (id)_targetForAction:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->m_responderTarget);
  id v7 = v6;
  if (v6)
  {
    if ([v6 canPerformAction:a3 withSender:WeakRetained]) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    v9 = +[UIWindow _externalKeyWindow];
    objc_super v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)&self->m_targetView);
      CGRect v13 = [v12 window];
      v14 = [v13 windowScene];
      -[UIWindowScene _keyWindow](v14);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = [v11 firstResponder];
    CGSize v16 = [v15 _responderForEditing];

    id v17 = +[UIKeyboardImpl activeInstance];
    v18 = [v17 inputDelegateManager];
    v19 = [v18 forwardingInputDelegate];

    if (v19)
    {
      v20 = +[UIKeyboardImpl activeInstance];
      v21 = [v20 inputDelegateManager];
      v22 = [v21 forwardingInputDelegate];
      uint64_t v23 = [v22 _responderForEditing];

      CGSize v16 = (void *)v23;
    }
    id v8 = [v16 targetForAction:a3 withSender:WeakRetained];
  }
  return v8;
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  int v5 = [v4 type];
  int v6 = [v4 type];
  int v7 = v6;
  if (v5 != 3 && v6 != 5)
  {
    p_m_fadeAfterCommand = &self->m_fadeAfterCommand;
    self->m_fadeAfterCommand = [v4 dontDismiss] ^ 1;
LABEL_6:
    -[UICalloutBar _targetForAction:](self, "_targetForAction:", [v4 action]);
    v9 = (UICalloutBar *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  p_m_fadeAfterCommand = &self->m_fadeAfterCommand;
  self->m_fadeAfterCommand = 0;
  if (v5 != 3) {
    goto LABEL_6;
  }
  v9 = self;
LABEL_7:
  objc_super v10 = v9;
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if ([v4 type] == 4)
  {
    uint64_t v12 = [v4 textReplacement];

    id WeakRetained = (void *)v12;
    if (!v12)
    {
      id WeakRetained = [v4 currentTitle];
    }
  }
  self->m_ignoreFade = [v4 dontDismiss];
  uint64_t v13 = [v4 action];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __30__UICalloutBar_buttonPressed___block_invoke;
  v20[3] = &unk_1E52DCB30;
  v14 = v10;
  v21 = v14;
  id v15 = v4;
  id v22 = v15;
  id v16 = WeakRetained;
  id v23 = v16;
  +[UIPasteboard _performAsDataOwnerForAction:v13 responder:v14 block:v20];
  if ([v15 type] == 4)
  {
    id v17 = [v15 textReplacement];
    [v17 didReplaceTextWithTarget:v14];
  }
  if (self->m_ignoreFade && (objc_opt_respondsToSelector() & 1) != 0)
  {
    +[UIKBInputDelegateManager isAsyncTextInputEnabled];
    [(UICalloutBar *)v14 willFinishIgnoringCalloutBarFadeAfterPerformingAction];
  }
  self->m_ignoreFade = 0;
  if (*p_m_fadeAfterCommand)
  {
    v18 = +[UIDevice currentDevice];
    uint64_t v19 = [v18 userInterfaceIdiom];

    if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && ((char *)[v15 action] == sel_cut_
       || (char *)[v15 action] == sel_copy_
       || (char *)[v15 action] == sel_paste_
       || (char *)[v15 action] == sel_undo_
       || (char *)[v15 action] == sel_redo_))
    {
      +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:0];
    }
    -[UICalloutBar _fadeAfterCommand:](self, "_fadeAfterCommand:", [v15 action]);
  }
  else if (v5 != 3)
  {
    if (v7 == 5)
    {
      self->m_recalcVisibleItems = 1;
      [(UICalloutBar *)self _updateVisibleItemsAnimated:1];
    }
    else
    {
      [v15 setHighlighted:0];
    }
  }
  +[UIKBAnalyticsDispatcher keyboardAnalyticsDispatchWithSelector:withTrigger:](UIKBAnalyticsDispatcher, "keyboardAnalyticsDispatchWithSelector:withTrigger:", [v15 action], @"CalloutBar");
}

id __30__UICalloutBar_buttonPressed___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) action];
  uint64_t v4 = *(void *)(a1 + 48);
  if (dyld_program_sdk_at_least())
  {
    int v5 = v2;
    int v6 = (const char *)v3;
    uint64_t v7 = v4;
  }
  else
  {
    int v6 = sel_performSelector_withObject_;
    int v5 = v2;
    uint64_t v7 = v3;
  }
  return objc_msgSend(v5, v6, v7);
}

- (void)_showPreviousItems:(id)a3
{
  int m_currentPage = self->m_currentPage;
  BOOL v4 = __OFSUB__(m_currentPage, 1);
  int v5 = m_currentPage - 1;
  if (v5 < 0 == v4)
  {
    self->int m_currentPage = v5;
    [(UICalloutBar *)self _updateVisibleItemsAnimated:1];
  }
}

- (void)_showNextItems:(id)a3
{
  int m_currentPage = self->m_currentPage;
  if (m_currentPage < self->m_pageCount - 1)
  {
    self->int m_currentPage = m_currentPage + 1;
    [(UICalloutBar *)self _updateVisibleItemsAnimated:1];
  }
}

- (void)removeFromSuperview
{
  [(UICalloutBar *)self clearEvadeRects];
  v3.receiver = self;
  v3.super_class = (Class)UICalloutBar;
  [(UIView *)&v3 removeFromSuperview];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  int v6 = self;
  uint64_t v7 = [(UIView *)self _window];
  id v8 = [v7 windowScene];
  v9 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v8];

  objc_msgSend(v9, "convertPoint:fromView:", v6, x, y);
  v13.double x = v10;
  v13.double y = v11;
  LOBYTE(v6) = CGRectContainsPoint(v6->m_controlFrame, v13);

  return (char)v6;
}

- (int)textEffectsVisibilityLevel
{
  return 350;
}

- (CGRect)textEffectsWindowSafeArea
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
  objc_super v3 = [WeakRetained _window];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIWindow _applicationKeyWindow];
  }
  int v6 = v5;

  [v6 _usableBounds];
  double x = v7;
  double y = v9;
  double width = v11;
  double height = v13;
  if ([v6 _isHostedInAnotherProcess])
  {
    [v6 safeAreaInsets];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [v6 _usableSceneBounds];
    objc_msgSend(v6, "convertRect:fromWindow:", 0, v18 + v23, v16 + v24, v25 - (v18 + v22), v26 - (v16 + v20));
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    [v6 bounds];
    v56.origin.double x = v35;
    v56.origin.double y = v36;
    v56.size.double width = v37;
    v56.size.double height = v38;
    v53.origin.double x = v28;
    v53.origin.double y = v30;
    v53.size.double width = v32;
    v53.size.double height = v34;
    CGRect v54 = CGRectIntersection(v53, v56);
    double x = v54.origin.x;
    double y = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;
  }
  v39 = [v6 windowScene];
  v40 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v39];
  objc_msgSend(v40, "convertRect:fromWindow:", v6, x, y, width, height);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;

  double v49 = v42;
  double v50 = v44;
  double v51 = v46;
  double v52 = v48;
  result.size.double height = v52;
  result.size.double width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

- (void)resetPage
{
  if (self->m_currentPage >= 1) {
    self->int m_currentPage = 0;
  }
}

- (BOOL)rectClear:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  if (!CGRectContainsRect(v21, v23)) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(UICalloutBar *)self rectsToEvade];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) CGRectValue];
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        if (CGRectIntersectsRect(v22, v24))
        {
          BOOL v13 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (double)supressHorizontalXMovementIfNeededForPoint:(CGPoint)a3 proposedX:(double)a4
{
  double x = a3.x;
  if ([(UICalloutBar *)self supressesHorizontalMovement])
  {
    p_m_supressesHorizontalMovementFrame = &self->m_supressesHorizontalMovementFrame;
    if (!CGRectIsNull(*p_m_supressesHorizontalMovementFrame))
    {
      a4 = p_m_supressesHorizontalMovementFrame->origin.x;
      double v8 = x;
      if (x < p_m_supressesHorizontalMovementFrame->origin.x)
      {
LABEL_6:
        p_m_supressesHorizontalMovementFrame->origin.double x = x;
        return v8;
      }
      double width = p_m_supressesHorizontalMovementFrame->size.width;
      double v10 = a4 + width;
      if (x > a4 + width)
      {
        double v8 = x - width;
        double x = a4 + x - v10;
        goto LABEL_6;
      }
    }
  }
  return a4;
}

- (double)maxVerticalCalloutHeightForMinButtonHeight:(double)a3
{
  double v4 = a3 * 3.0;
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  double v6 = v5;
  double v8 = self->m_pointBelowControls.y + -9.0 + -6.0 - v7;
  double v9 = v5 - (self->m_pointAboveControls.y + 9.0 + 6.0);
  double v10 = [(UICalloutBar *)self rectsToEvade];
  if ([v10 count])
  {
    uint64_t v11 = [(UICalloutBar *)self rectsToEvade];
    uint64_t v12 = [v11 firstObject];
    [v12 CGRectValue];
    double v14 = v13;
  }
  else
  {
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v15 = v8 + -10.0;
  double v16 = v9 - v14 + -10.0;
  if ((v8 + -10.0 >= v4 || v16 >= v4) && v14 + v15 + v16 <= v6)
  {
    self->m_isUsingVerticalFallbackPosition = 0;
    if (v15 >= v16) {
      return v8 + -10.0;
    }
    else {
      return v9 - v14 + -10.0;
    }
  }
  else
  {
    self->m_isUsingVerticalFallbackPosition = 1;
    return (v6 - v14) * 0.5 + -9.0 + -6.0 + -10.0;
  }
}

- (BOOL)calculateControlFrameForCalloutSize:(CGSize)a3 below:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v29 = v14;
  double v15 = &OBJC_IVAR___UICalloutBar_m_pointAboveControls;
  if (v4) {
    double v15 = &OBJC_IVAR___UICalloutBar_m_pointBelowControls;
  }
  double v16 = (double *)((char *)self + *v15);
  double v17 = v16[1];
  -[UICalloutBar supressHorizontalXMovementIfNeededForPoint:proposedX:](self, "supressHorizontalXMovementIfNeededForPoint:proposedX:", *(void *)v16);
  double v19 = v18;
  if ([(UICalloutBar *)self supressesHorizontalMovement]
    && !CGRectIsNull(self->m_supressesHorizontalMovementFrame))
  {
    double v27 = v27 * 0.7 + self->m_supressedHorizontalMovementX * 0.3;
  }
  v30.origin.double x = v9;
  v30.origin.CGFloat y = v11;
  v30.size.double width = v13;
  v30.size.double height = v29;
  double rect1 = v11;
  if (v19 >= CGRectGetMinX(v30) + 10.0)
  {
    double v23 = v9 + v13 + -10.0;
    if (width + v19 <= v23)
    {
      self->m_availableSpaceOnLeft = v19 + -10.0;
      double v21 = v23 - v19 - width;
    }
    else
    {
      double v19 = v23 - width;
      self->m_availableSpaceOnLeft = v23 - width + -10.0;
      double v21 = 0.0;
    }
    CGFloat v22 = v29;
  }
  else
  {
    v31.origin.double x = v9;
    v31.origin.CGFloat y = v11;
    v31.size.double width = v13;
    v31.size.double height = v29;
    CGFloat MinX = CGRectGetMinX(v31);
    self->m_availableSpaceOnLeft = 0.0;
    double v19 = MinX + 10.0;
    double v21 = v9 + v13 + -10.0 - (MinX + 10.0) - width;
    CGFloat v22 = v29;
  }
  self->m_availableSpaceOnRight = v21;
  if (v4) {
    double v24 = v17 + -9.0 + -6.0 - height;
  }
  else {
    double v24 = v17 + 9.0 + 6.0;
  }
  if (self->m_isDisplayingVertically
    && self->m_isUsingVerticalFallbackPosition
    && v4
    && height + height + height + rect1 + 9.0 + 6.0 < self->m_targetRect.origin.y + self->m_targetRect.size.height)
  {
    double v24 = height + height + rect1;
  }
  v32.origin.double x = v9;
  v32.origin.CGFloat y = rect1;
  v32.size.double width = v13;
  v32.size.double height = v22;
  v33.origin.double x = v19;
  v33.origin.CGFloat y = v24;
  v33.size.double width = width;
  v33.size.double height = height;
  BOOL v25 = CGRectContainsRect(v32, v33);
  if (v25)
  {
    BOOL v25 = -[UICalloutBar rectClear:](self, "rectClear:", v19, v24, width, height);
    if (v25)
    {
      self->m_controlFrame.origin.double x = v19;
      self->m_controlFrame.origin.CGFloat y = v24;
      self->m_controlFrame.size.double width = width;
      self->m_controlFrame.size.double height = height;
      if ([(UICalloutBar *)self supressesHorizontalMovement]
        && CGRectIsNull(self->m_supressesHorizontalMovementFrame))
      {
        self->m_supressesHorizontalMovementFrame.origin.double x = v19;
        self->m_supressesHorizontalMovementFrame.origin.CGFloat y = v24;
        self->m_supressesHorizontalMovementFrame.size.double width = width;
        self->m_supressesHorizontalMovementFrame.size.double height = height;
        self->m_supressedHorizontalMovementX = v27;
      }
      LOBYTE(v25) = 1;
    }
  }
  return v25;
}

- (BOOL)calculateControlFrameForCalloutSize:(CGSize)a3 right:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  CGFloat v11 = v7;
  double v12 = v8;
  CGFloat v13 = v9;
  double v14 = v10;
  double v15 = &OBJC_IVAR___UICalloutBar_m_pointLeftOfControls;
  if (v4) {
    double v15 = &OBJC_IVAR___UICalloutBar_m_pointRightOfControls;
  }
  double v16 = (double *)((char *)self + *v15);
  double v17 = *v16;
  double v18 = floor(v16[1] + height * -0.5);
  if (v18 >= CGRectGetMinY(*(CGRect *)&v7) + 10.0)
  {
    double v19 = v12 + v14 + -10.0;
    if (height + v18 > v19) {
      double v18 = v19 - height;
    }
  }
  else
  {
    v24.origin.double x = v11;
    v24.origin.CGFloat y = v12;
    v24.size.double width = v13;
    v24.size.double height = v14;
    double v18 = CGRectGetMinY(v24) + 10.0;
  }
  if (v4) {
    double v20 = v17 + -3.0 - width;
  }
  else {
    double v20 = v17 + 3.0;
  }
  v25.origin.double x = v11;
  v25.origin.CGFloat y = v12;
  v25.size.double width = v13;
  v25.size.double height = v14;
  v26.origin.double x = v20;
  v26.origin.CGFloat y = v18;
  v26.size.double width = width;
  v26.size.double height = height;
  BOOL v21 = CGRectContainsRect(v25, v26);
  if (v21)
  {
    BOOL v21 = -[UICalloutBar rectClear:](self, "rectClear:", v20, v18, width, height);
    if (v21)
    {
      self->m_controlFrame.origin.double x = v20;
      self->m_controlFrame.origin.CGFloat y = v18;
      self->m_controlFrame.size.double width = width;
      self->m_controlFrame.size.double height = height;
      LOBYTE(v21) = 1;
    }
  }
  return v21;
}

- (BOOL)calculateControlFrameInsideTargetRect:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  [(UICalloutBar *)self targetRect];
  v78.origin.CGFloat x = v14;
  v78.origin.CGFloat y = v15;
  v78.size.double width = v16;
  v78.size.double height = v17;
  rect[0] = v7;
  v74.origin.CGFloat x = v7;
  v74.origin.CGFloat y = v9;
  v74.size.double width = v11;
  v74.size.double height = v13;
  CGRect slice = CGRectIntersection(v74, v78);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  double v18 = [(UICalloutBar *)self rectsToEvade];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v68 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        memset(&rect[1], 0, 32);
        [v23 CGRectValue];
        *(CGRect *)&rect[1] = CGRectIntersection(v75, slice);
        double MinX = CGRectGetMinX(*(CGRect *)&rect[1]);
        if (MinX >= CGRectGetMaxX(slice))
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&rect[1]);
          double v33 = CGRectGetMinX(slice);
          double v34 = rect[1];
          double v35 = rect[2];
          double v36 = rect[3];
          double v37 = rect[4];
          if (MaxX <= v33)
          {
            double MinY = CGRectGetMinY(*(CGRect *)&v34);
            if (MinY >= CGRectGetMaxY(slice))
            {
              double MaxY = CGRectGetMaxY(*(CGRect *)&rect[1]);
              if (MaxY <= CGRectGetMinY(slice)) {
                continue;
              }
              double v42 = CGRectGetMaxY(*(CGRect *)&rect[1]);
              double v26 = v42 - CGRectGetMinY(slice);
              CGFloat x = slice.origin.x;
              CGFloat y = slice.origin.y;
              CGFloat v29 = slice.size.width;
              CGFloat v30 = slice.size.height;
              CGRectEdge v31 = CGRectMinYEdge;
            }
            else
            {
              double v40 = CGRectGetMaxY(slice);
              double v26 = v40 - CGRectGetMinY(*(CGRect *)&rect[1]);
              CGFloat x = slice.origin.x;
              CGFloat y = slice.origin.y;
              CGFloat v29 = slice.size.width;
              CGFloat v30 = slice.size.height;
              CGRectEdge v31 = CGRectMaxYEdge;
            }
          }
          else
          {
            double v38 = CGRectGetMaxX(*(CGRect *)&v34);
            double v26 = v38 - CGRectGetMinX(slice);
            CGFloat x = slice.origin.x;
            CGFloat y = slice.origin.y;
            CGFloat v29 = slice.size.width;
            CGFloat v30 = slice.size.height;
            CGRectEdge v31 = CGRectMinXEdge;
          }
        }
        else
        {
          double v25 = CGRectGetMaxX(slice);
          double v26 = v25 - CGRectGetMinX(*(CGRect *)&rect[1]);
          CGFloat x = slice.origin.x;
          CGFloat y = slice.origin.y;
          CGFloat v29 = slice.size.width;
          CGFloat v30 = slice.size.height;
          CGRectEdge v31 = CGRectMaxXEdge;
        }
        CGRectDivide(*(CGRect *)&x, &slice, (CGRect *)&rect[1], v26, v31);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v20);
  }

  if (CGRectIsNull(slice))
  {
    LOBYTE(v43) = 0;
  }
  else
  {
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v49 = vmulq_f64((float64x2_t)slice.size, _Q2);
    float64x2_t v50 = vrndaq_f64(vaddq_f64((float64x2_t)slice.origin, v49));
    int m_arrowDirection = self->m_arrowDirection;
    double v52 = v50.f64[1];
    float64x2_t v64 = v50;
    if (m_arrowDirection == 4)
    {
      double v53 = floor(v50.f64[0] - width - v49.f64[0]);
    }
    else if (m_arrowDirection == 3)
    {
      double v53 = floor(vaddq_f64(v49, v50).f64[0]);
    }
    else
    {
      [(UICalloutBar *)self supressHorizontalXMovementIfNeededForPoint:*(_OWORD *)&v50 proposedX:floor(v50.f64[0] + width * -0.5)];
      double v53 = v54;
      if ([(UICalloutBar *)self supressesHorizontalMovement]
        && !CGRectIsNull(self->m_supressesHorizontalMovementFrame))
      {
        v55.f64[0] = v64.f64[0] * 0.7 + self->m_supressedHorizontalMovementX * 0.3;
        float64x2_t v64 = v55;
      }
    }
    double v56 = 10.0;
    if (v53 >= 10.0)
    {
      double v57 = rect[0] + v11 + -10.0;
      double v56 = v53;
      if (width + v53 > v57) {
        double v56 = v57 - width;
      }
    }
    if (self->m_isDisplayingVertically
      && (v76.origin.CGFloat x = rect[0],
          v76.origin.CGFloat y = v9,
          v76.size.double width = v11,
          v76.size.double height = v13,
          double MidY = CGRectGetMidY(v76),
          MidY > CGRectGetMidY(slice)))
    {
      uint64_t v59 = 1;
      double v60 = 0.0;
    }
    else
    {
      uint64_t v59 = [(UICalloutBar *)self arrowDirection];
      double v60 = height;
    }
    double v61 = v52 - v60 + 9.0 + 6.0;
    -[UICalloutBar setArrowDirection:](self, "setArrowDirection:", v59, *(_OWORD *)&v64);
    v77.origin.CGFloat x = rect[0];
    v77.origin.CGFloat y = v9;
    v77.size.double width = v11;
    v77.size.double height = v13;
    v79.origin.CGFloat x = v56;
    v79.origin.CGFloat y = v61;
    v79.size.double width = width;
    v79.size.double height = height;
    BOOL v43 = CGRectContainsRect(v77, v79);
    if (v43)
    {
      BOOL v43 = -[UICalloutBar rectClear:](self, "rectClear:", v56, v61, width, height);
      if (v43)
      {
        self->m_controlFrame.origin.CGFloat x = v56;
        self->m_controlFrame.origin.CGFloat y = v61;
        self->m_controlFrame.size.double width = width;
        self->m_controlFrame.size.double height = height;
        CGFloat v62 = round(width * 0.5 + v56);
        self->m_pointBelowControls.CGFloat x = v62;
        self->m_pointBelowControls.CGFloat y = round(height + v61);
        self->m_pointAboveControls.CGFloat x = v62;
        self->m_pointAboveControls.CGFloat y = round(v61) + -9.0;
        if ([(UICalloutBar *)self supressesHorizontalMovement]
          && CGRectIsNull(self->m_supressesHorizontalMovementFrame))
        {
          self->m_supressesHorizontalMovementFrame.origin.CGFloat x = v56;
          self->m_supressesHorizontalMovementFrame.origin.CGFloat y = v61;
          self->m_supressesHorizontalMovementFrame.size.double width = width;
          self->m_supressesHorizontalMovementFrame.size.double height = height;
          self->m_supressedHorizontalMovementX = v65;
        }
        LOBYTE(v43) = 1;
      }
    }
  }
  return v43;
}

- (void)updateAvailableButtons
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->m_currentSystemButtons enumerateObjectsUsingBlock:&__block_literal_global_456_0];
  [(NSMutableArray *)self->m_currentSystemButtons removeAllObjects];
  [(NSMutableArray *)self->m_extraButtons enumerateObjectsUsingBlock:&__block_literal_global_458_0];
  [(NSMutableArray *)self->m_extraButtons removeAllObjects];
  [(UIView *)self->m_previousButton setHidden:1];
  [(UICalloutBarButton *)self->m_previousButton setHighlighted:0];
  [(UIView *)self->m_nextButton setHidden:1];
  [(UICalloutBarButton *)self->m_nextButton setHighlighted:0];
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  double v4 = v3;
  if ([(NSString *)self->m_untruncatedString length])
  {
    double v5 = self->m_untruncatedString;
    m_untruncatedString = self->m_untruncatedString;
    CGFloat v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    double v8 = [(NSString *)m_untruncatedString componentsSeparatedByCharactersInSet:v7];

    if ((unint64_t)[v8 count] < 2)
    {
      double v11 = 0;
    }
    else
    {
      uint64_t v9 = [v8 objectAtIndex:0];

      double v10 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      double v11 = [v10 componentsJoinedByString:@"\n"];

      double v5 = (NSString *)v9;
    }
    CGFloat v13 = +[UICalloutBarButton buttonWithTitle:v5 subtitle:v11 maxWidth:0 action:7 type:self->m_buttonView inView:self->m_visualStyle visualStyle:v4 + -20.0 + -34.0];
    [v13 setHidden:0];
    [v13 setEnabled:0];
    [(NSMutableArray *)self->m_extraButtons addObject:v13];
  }
  else if ([(UICalloutBar *)self hasReplacements])
  {
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__UICalloutBar_updateAvailableButtons__block_invoke_3;
    aBlock[3] = &unk_1E52F0698;
    aBlock[4] = self;
    aBlock[5] = v50;
    *(double *)&aBlock[6] = v4 + -20.0;
    double v12 = _Block_copy(aBlock);
    [(NSArray *)self->m_replacements enumerateObjectsUsingBlock:v12];

    _Block_object_dispose(v50, 8);
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obj = self->m_systemButtonDescriptions;
    uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v14)
    {
      uint64_t v37 = 0;
      double v38 = 0;
      v39 = 0;
      char v15 = 0;
      uint64_t v16 = *(void *)v46;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(obj);
          }
          double v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
          if ((v15 & 1) != 0
            && (char *)[*(id *)(*((void *)&v45 + 1) + 8 * v17) action] == sel__define_)
          {
            char v15 = 1;
          }
          else
          {
            uint64_t v19 = -[UICalloutBar _targetForAction:](self, "_targetForAction:", objc_msgSend(v18, "action", v37));
            if (v19)
            {
              if ((char *)[v18 action] == sel_captureTextFromCamera_)
              {
                id v22 = v18;

                id v23 = v19;
                uint64_t v37 = [(NSMutableArray *)self->m_currentSystemButtons count];
                double v38 = v23;
                v39 = v22;
              }
              else
              {
                uint64_t v20 = [v18 materializeButtonInView:self->m_buttonView visualStyle:self->m_visualStyle];
                [v20 setHidden:0];
                [(NSMutableArray *)self->m_currentSystemButtons addObject:v20];
                BOOL v21 = [v18 action] == (void)sel__lookup_;

                v15 |= v21;
              }
            }
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v52 count:16];
        uint64_t v14 = v24;
      }
      while (v24);
    }
    else
    {
      uint64_t v37 = 0;
      double v38 = 0;
      v39 = 0;
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    double v25 = self->m_extraItems;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v25);
          }
          CGFloat v29 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          CGFloat v30 = -[UICalloutBar _targetForAction:](self, "_targetForAction:", objc_msgSend(v29, "action", v37));
          BOOL v31 = v30 == 0;

          if (!v31)
          {
            CGRect v32 = [v29 title];
            double v33 = +[UICalloutBarButton buttonWithTitle:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:action:type:inView:visualStyle:", v32, [v29 action], 6, self->m_buttonView, self->m_visualStyle);

            objc_msgSend(v33, "setDontDismiss:", objc_msgSend(v29, "dontDismiss"));
            [(NSMutableArray *)self->m_extraButtons addObject:v33];
          }
        }
        uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v26);
    }

    if (v39 && v38)
    {
      uint64_t v34 = [(NSMutableArray *)self->m_currentSystemButtons count];
      if (v34 + [(NSMutableArray *)self->m_extraButtons count])
      {
        [v39 setTitle:0];
      }
      else
      {
        double v35 = +[UIAction _textFromCameraTitleForResponder:v38];
        [v39 setTitle:v35];
      }
      double v36 = objc_msgSend(v39, "materializeButtonInView:visualStyle:", self->m_buttonView, self->m_visualStyle, v37);
      [v36 setHidden:0];
      [(NSMutableArray *)self->m_currentSystemButtons insertObject:v36 atIndex:v37];
    }
  }
  [(UIView *)self->m_overlay setNeedsLayout];
}

uint64_t __38__UICalloutBar_updateAvailableButtons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __38__UICalloutBar_updateAvailableButtons__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

void __38__UICalloutBar_updateAvailableButtons__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v12 = [v6 menuTitle];
  CGFloat v7 = [v6 replacementText];
  int v8 = [v7 isEqualToString:&stru_1ED0E84C0];
  int v9 = [v6 _isNoReplacementsFoundItem];
  double v10 = +[UICalloutBarButton buttonWithTitle:v12 action:sel_replace_ type:4 inView:*(void *)(*(void *)(a1 + 32) + 808) visualStyle:*(void *)(*(void *)(a1 + 32) + 824)];
  [v10 setTextReplacement:v6];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 777)
    || ([v10 contentWidth],
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 24),
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < *(double *)(a1 + 48)))
  {
    [v10 setHidden:0];
    [v10 setEnabled:(v9 | v8) ^ 1u];
    [*(id *)(*(void *)(a1 + 32) + 672) addObject:v10];
  }
  else
  {
    *a4 = 1;
  }
}

- (BOOL)setFrameForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!self->m_targetHorizontal)
  {
    if ((![(UICalloutBar *)self arrowDirection]
       || [(UICalloutBar *)self arrowDirection] == 2)
      && -[UICalloutBar calculateControlFrameForCalloutSize:below:](self, "calculateControlFrameForCalloutSize:below:", 1, width, height))
    {
      goto LABEL_23;
    }
    if (!self->m_targetHorizontal)
    {
      if ((![(UICalloutBar *)self arrowDirection]
         || [(UICalloutBar *)self arrowDirection] == 1)
        && -[UICalloutBar calculateControlFrameForCalloutSize:below:](self, "calculateControlFrameForCalloutSize:below:", 0, width, height))
      {
        uint64_t v6 = 1;
        goto LABEL_24;
      }
      if (!self->m_targetHorizontal)
      {
LABEL_20:
        if (!-[UICalloutBar calculateControlFrameInsideTargetRect:](self, "calculateControlFrameInsideTargetRect:", width, height))goto LABEL_25; {
        if ([(UICalloutBar *)self arrowDirection])
        }
        {
          uint64_t v6 = [(UICalloutBar *)self arrowDirection];
          goto LABEL_24;
        }
LABEL_23:
        uint64_t v6 = 2;
        goto LABEL_24;
      }
    }
  }
  if ([(UICalloutBar *)self arrowDirection]
    && [(UICalloutBar *)self arrowDirection] != 4
    || !-[UICalloutBar calculateControlFrameForCalloutSize:right:](self, "calculateControlFrameForCalloutSize:right:", 1, width, height))
  {
    if (self->m_targetHorizontal
      && (![(UICalloutBar *)self arrowDirection]
       || [(UICalloutBar *)self arrowDirection] == 3)
      && -[UICalloutBar calculateControlFrameForCalloutSize:right:](self, "calculateControlFrameForCalloutSize:right:", 0, width, height))
    {
      uint64_t v6 = 3;
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  uint64_t v6 = 4;
LABEL_24:
  [(UICalloutBar *)self setTargetDirection:v6];
LABEL_25:
  BOOL v7 = CGRectEqualToRect(self->m_controlFrame, *MEMORY[0x1E4F1DB28]);
  if (!v7)
  {
    [(UICalloutBar *)self controlFrame];
    CGFloat v9 = v8;
    double v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    int v16 = [(UICalloutBar *)self targetDirection];
    if ((v16 - 3) >= 2)
    {
      if (v16 == 1)
      {
        [(UICalloutBar *)self pointAboveControls];
        -[UICalloutBar setTargetPoint:](self, "setTargetPoint:");
        [(UICalloutBar *)self targetPoint];
        double v15 = v15 + v11 - v17 + 9.0;
        [(UICalloutBar *)self targetPoint];
        double v11 = v18;
        goto LABEL_32;
      }
      if (v16 != 2)
      {
LABEL_32:
        v20.origin.CGFloat x = v9;
        v20.origin.CGFloat y = v11;
        v20.size.double width = v13;
        v20.size.double height = v15;
        CGRect v21 = CGRectIntegral(v20);
        -[UIView setFrame:](self, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
        return !v7;
      }
      [(UICalloutBar *)self pointBelowControls];
      -[UICalloutBar setTargetPoint:](self, "setTargetPoint:");
    }
    double v15 = v15 + 9.0;
    goto LABEL_32;
  }
  return !v7;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (a5 && self->m_isDisplayingVertically)
  {
    double y = a5->y;
    m_verticalStackView = self->m_verticalStackView;
    double v8 = [(_UICalloutBarVisualStyle *)self->m_visualStyle buttonMetrics];
    [v8 height];
    -[UIView hitTest:forEvent:](m_verticalStackView, "hitTest:forEvent:", 0, 0.0, y + v9 * 0.5);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [v12 frameOrigin];
    double v11 = v10 + -7.0;
    if (v10 <= 0.0) {
      double v11 = v10;
    }
    a5->double y = v11;
  }
}

- (void)scrollableButtonTouchDown:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->m_isDisplayingVertically)
  {
    id v4 = v14;
    [(UIScrollView *)self->m_verticalScrollView contentOffset];
    double v6 = v5;
    [v4 frame];
    double v8 = v7;
    [v4 frame];
    double v10 = v9;
    [v4 size];
    double v12 = v11;
    [(UIView *)self->m_verticalScrollView size];
    if (v8 < v6 || (double v8 = v10 + v12 - v13, v8 > v6))
    {
      -[UIScrollView setContentOffset:animated:](self->m_verticalScrollView, "setContentOffset:animated:", 1, 0.0, v8);
      [v4 cancelTrackingWithEvent:0];
    }
  }
}

- (void)configureButtonsForVerticalView:(double)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  double v5 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
  double v6 = [(_UICalloutBarVisualStyle *)self->m_visualStyle buttonMetrics];
  [v6 height];
  if (v7 >= a3 + 36.0) {
    double v8 = v7;
  }
  else {
    double v8 = a3 + 36.0;
  }
  [v5 verticalPadding];
  double v10 = v9;
  [v5 horizontalPadding];
  double v12 = v11;
  v110 = v5;
  [v5 interitemPadding];
  double v14 = v13;
  [v6 horizontalPadding];
  double v112 = v15;
  [v6 imageWidth];
  double v115 = v16;
  v109 = v6;
  [v6 minimumTitleAndImageSpacing];
  double v114 = v17;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  double v18 = self->m_currentSystemButtons;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v124 objects:v130 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v125;
    double v22 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v125 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void **)(*((void *)&v124 + 1) + 8 * i);
        [v24 contentWidth];
        if (v25 > v22)
        {
          [v24 contentWidth];
          double v22 = v26;
        }
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v124 objects:v130 count:16];
    }
    while (v20);
  }
  else
  {
    double v22 = 0.0;
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v27 = self->m_extraButtons;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v120 objects:v129 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v121;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v121 != v30) {
          objc_enumerationMutation(v27);
        }
        CGRect v32 = *(void **)(*((void *)&v120 + 1) + 8 * j);
        [v32 contentWidth];
        if (v33 > v22)
        {
          [v32 contentWidth];
          double v22 = v34;
        }
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v120 objects:v129 count:16];
    }
    while (v29);
  }

  if ([(UICalloutBar *)self arrowDirection] == 3
    || (double v35 = 0.0, [(UICalloutBar *)self arrowDirection] == 4))
  {
    double v35 = 9.0;
  }
  [(UIView *)self size];
  if (v22 >= v36) {
    double v37 = v36;
  }
  else {
    double v37 = v22;
  }
  double v38 = [MEMORY[0x1E4F1CA48] array];
  [v38 addObjectsFromArray:self->m_currentSystemButtons];
  [v38 addObjectsFromArray:self->m_extraButtons];
  [(_UICalloutBarVisualStyle *)self->m_visualStyle updateCalloutBar:self withContentButtons:v38];
  if (!self->m_verticalScrollView)
  {
    v39 = objc_alloc_init(UIScrollView);
    m_verticalScrollView = self->m_verticalScrollView;
    self->m_verticalScrollView = v39;

    [(UIScrollView *)self->m_verticalScrollView setShowsVerticalScrollIndicator:0];
    long long v41 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
    [v41 cornerRadius];
    double v43 = v42;
    long long v44 = [(UIView *)self->m_verticalScrollView layer];
    [v44 setCornerRadius:v43];

    [(UIScrollView *)self->m_verticalScrollView setDelegate:self];
  }
  m_verticalStackView = self->m_verticalStackView;
  unint64_t v46 = 0x1E4F5B000uLL;
  if (!m_verticalStackView)
  {
    long long v47 = objc_alloc_init(UIStackView);
    long long v48 = self->m_verticalStackView;
    self->m_verticalStackView = v47;

    [(UIView *)self->m_verticalScrollView addSubview:self->m_verticalStackView];
    [(UIStackView *)self->m_verticalStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->m_verticalStackView setAxis:1];
    [(UIStackView *)self->m_verticalStackView setDistribution:3];
    [(UIStackView *)self->m_verticalStackView setSpacing:v14];
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    float64x2_t v50 = [(UIView *)self->m_verticalStackView topAnchor];
    double v51 = [(UIView *)self->m_verticalScrollView topAnchor];
    double v52 = [v50 constraintEqualToAnchor:v51 constant:v10];
    [v49 addObject:v52];

    uint64_t v53 = [(UIView *)self->m_verticalStackView bottomAnchor];
    double v54 = [(UIView *)self->m_verticalScrollView bottomAnchor];
    float64x2_t v55 = [v53 constraintEqualToAnchor:v54 constant:-v10];
    [v49 addObject:v55];

    double v56 = [(UIView *)self->m_verticalStackView centerXAnchor];
    double v57 = [(UIView *)self->m_verticalScrollView centerXAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    [v49 addObject:v58];

    uint64_t v59 = [(UIView *)self->m_verticalStackView widthAnchor];
    double v60 = [(UIView *)self->m_verticalScrollView widthAnchor];
    double v61 = [v59 constraintEqualToAnchor:v60 constant:v12 * -2.0];
    [v49 addObject:v61];

    [MEMORY[0x1E4F5B268] activateConstraints:v49];
    m_verticalStackView = self->m_verticalStackView;
  }
  CGFloat v62 = [(UIView *)m_verticalStackView subviews];
  [v62 makeObjectsPerformSelector:sel_removeFromSuperview];

  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double height = self->m_controlFrame.size.height;
  double v65 = v10 + v10;
  uint64_t v66 = [v38 count];
  double v111 = v35;
  if (v66)
  {
    char v67 = 0;
    uint64_t v68 = 0;
    double v69 = v37 - v35 + -17.0;
    double v70 = v112 + v112;
    uint64_t v113 = v66 - 1;
    double v71 = 0.0;
    while (1)
    {
      v72 = [v38 objectAtIndex:v68];
      [(UIStackView *)self->m_verticalStackView addArrangedSubview:v72];
      [v72 setHidden:0];
      [v72 addTarget:self action:sel_scrollableButtonTouchDown_ forControlEvents:1];
      [v72 setContentHorizontalAlignment:1];
      objc_msgSend(v72, "setContentEdgeInsets:", 0.0, 8.0, 0.0, 8.0);
      objc_msgSend(v72, "configureForVerticalPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
      uint64_t v73 = [v72 titleLabel];
      objc_msgSend(v73, "sizeThatFits:", v69, 0.0);
      double v75 = v74;

      if (v115 + v114 + v70 + v75 + 16.0 >= v71) {
        double v71 = v115 + v114 + v70 + v75 + 16.0;
      }
      CGRect v76 = [v72 widthAnchor];
      CGRect v77 = [(UIView *)self->m_verticalStackView widthAnchor];
      CGRect v78 = [v76 constraintEqualToAnchor:v77];
      [v63 addObject:v78];

      CGRect v79 = [v72 heightAnchor];
      uint64_t v80 = [v79 constraintEqualToConstant:v8];
      [v63 addObject:v80];

      double v81 = v8 + v65;
      if (v65 + 14.0 <= height) {
        double v82 = 0.0;
      }
      else {
        double v82 = v8;
      }
      BOOL v83 = v81 >= height;
      if (v81 >= height) {
        double v81 = v65 + 14.0 - v82;
      }
      if ((v67 & 1) == 0) {
        double v65 = v81;
      }
      if (v113 == v68) {
        break;
      }
      v67 |= v83;
      v84 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
      int v85 = [v84 displaySeparators];

      if (v85)
      {
        v86 = objc_alloc_init(UIView);
        v87 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
        v88 = [v87 separatorColor];
        [(UIView *)v86 setBackgroundColor:v88];

        [(UIStackView *)self->m_verticalStackView addArrangedSubview:v86];
        v89 = [(UIView *)v86 widthAnchor];
        v90 = [(UIView *)self->m_verticalStackView widthAnchor];
        v91 = [v89 constraintEqualToAnchor:v90];
        [v63 addObject:v91];

        v92 = [(UIView *)v86 heightAnchor];
        v93 = [v92 constraintEqualToConstant:1.0];
        [v63 addObject:v93];

        double v94 = 1.0;
        if (v67) {
          double v94 = 0.0;
        }
        double v65 = v65 + v94;
      }
      ++v68;
    }

    double v35 = v111;
    unint64_t v46 = 0x1E4F5B000;
  }
  else
  {
    double v71 = 0.0;
  }
  [*(id *)(v46 + 616) activateConstraints:v63];
  double v95 = v35 + v71;
  double v96 = v12 + v12;
  double v97 = v12 + v12 + v95;
  [(UICalloutBar *)self controlFrame];
  if (v97 >= v98) {
    double v97 = v98;
  }
  -[UICalloutBar setFrameForSize:](self, "setFrameForSize:", v97, v65);
  [(UIView *)self frame];
  double Width = CGRectGetWidth(v132);
  UIRoundToScale(v97 / v71, 10.0);
  double v101 = v100;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v102 = v38;
  uint64_t v103 = [v102 countByEnumeratingWithState:&v116 objects:v128 count:16];
  if (v103)
  {
    uint64_t v104 = v103;
    uint64_t v105 = *(void *)v117;
    double v106 = Width - v96;
    do
    {
      for (uint64_t k = 0; k != v104; ++k)
      {
        if (*(void *)v117 != v105) {
          objc_enumerationMutation(v102);
        }
        v108 = *(void **)(*((void *)&v116 + 1) + 8 * k);
        if (v101 < 1.0) {
          [*(id *)(*((void *)&v116 + 1) + 8 * k) setContentScale:v101];
        }
        if ([v108 isSecurePasteButton]) {
          [v108 configureSecurePasteButtonWithWidth:v106 height:v8];
        }
      }
      uint64_t v104 = [v102 countByEnumeratingWithState:&v116 objects:v128 count:16];
    }
    while (v104);
  }

  [(UICalloutBar *)self controlFrame];
  CGRect v134 = CGRectIntegral(v133);
  if ([(UICalloutBar *)self targetDirection] != 1
    && [(UICalloutBar *)self targetDirection] != 3)
  {
    [(UICalloutBar *)self targetDirection];
  }
  -[UIScrollView setFrame:](self->m_verticalScrollView, "setFrame:");
  [(UIView *)self addSubview:self->m_verticalScrollView];
}

- (void)configureButtons:(double)a3
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  [(UIScrollView *)self->m_verticalScrollView removeFromSuperview];
  double v5 = a3 + 36.0;
  if ([(UICalloutBar *)self targetDirection] == 1)
  {
    [(UICalloutBar *)self targetPoint];
    double v7 = v6;
    [(UIView *)self frame];
    double v5 = v5 + v7 - v8;
  }
  double v9 = 0.0;
  if ([(UICalloutBar *)self targetDirection] == 2)
  {
    double y = self->m_controlFrame.origin.y;
    [(UIView *)self frame];
    double v9 = y - v11;
  }
  CGFloat v142 = v9;
  if ([(UICalloutBar *)self targetDirection] != 2)
  {
    [(UIView *)self bounds];
    double v9 = v12 - v5 + -9.0;
  }
  double v13 = 0.0;
  if ([(UICalloutBar *)self arrowDirection] == 3) {
    double v14 = 5.0;
  }
  else {
    double v14 = 0.0;
  }
  double v138 = v14;
  if ([(UICalloutBar *)self arrowDirection] == 4) {
    double v13 = 5.0;
  }
  [(UIView *)self bounds];
  double v16 = v15;
  [(UIView *)self _currentScreenScale];
  double v18 = v17;
  BOOL v19 = [(UIView *)self _shouldReverseLayoutDirection];
  [(UIView *)self bounds];
  v173.origin.CGFloat x = 0.0;
  v173.origin.double y = v9;
  v173.size.CGFloat height = v5;
  CGRect v174 = CGRectIntegral(v173);
  -[UIView setFrame:](self->m_buttonView, "setFrame:", v174.origin.x, v174.origin.y, v174.size.width, v174.size.height);
  if (self->m_pageCount >= 1)
  {
    uint64_t v20 = 0;
    double v21 = v138;
    double v22 = v16 - v138 - v13;
    if (v19) {
      double v23 = v13;
    }
    else {
      double v23 = v138;
    }
    double v143 = v23;
    double v136 = v13;
    double v137 = v22;
    if (!v19) {
      double v21 = v13;
    }
    double v139 = 1.0 / v18;
    double v140 = v21;
    while (1)
    {
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      uint64_t v24 = self->m_currentSystemButtons;
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v163 objects:v171 count:16];
      double v26 = 0.0;
      if (v25)
      {
        uint64_t v27 = v25;
        uint64_t v28 = *(void *)v164;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v164 != v28) {
              objc_enumerationMutation(v24);
            }
            uint64_t v30 = *(void **)(*((void *)&v163 + 1) + 8 * i);
            if ([v30 page] == v20)
            {
              [v30 contentWidth];
              double v26 = v26 + v31 + -8.0;
            }
          }
          uint64_t v27 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v163 objects:v171 count:16];
        }
        while (v27);
      }

      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      CGRect v32 = self->m_extraButtons;
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v159 objects:v170 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v160;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v160 != v35) {
              objc_enumerationMutation(v32);
            }
            double v37 = *(void **)(*((void *)&v159 + 1) + 8 * j);
            if ([v37 page] == v20)
            {
              [v37 contentWidth];
              double v26 = v26 + v38 + -8.0;
            }
          }
          uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v159 objects:v170 count:16];
        }
        while (v34);
      }

      if (v26 == 0.0) {
        goto LABEL_122;
      }
      double v39 = v22;
      if (self->m_pageCount >= 2)
      {
        [(UICalloutBarButton *)self->m_nextButton contentWidth];
        double v39 = v22 - v40;
      }
      if (v20)
      {
        [(UICalloutBarButton *)self->m_previousButton contentWidth];
        double v39 = v39 - v41;
      }
      UIRoundToScale(v39 / v26, 10.0);
      double v43 = v42;
      long long v44 = [MEMORY[0x1E4F1CA48] array];
      long long v155 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v45 = self->m_currentSystemButtons;
      uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v155 objects:v169 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v156;
        do
        {
          for (uint64_t k = 0; k != v47; ++k)
          {
            if (*(void *)v156 != v48) {
              objc_enumerationMutation(v45);
            }
            float64x2_t v50 = *(void **)(*((void *)&v155 + 1) + 8 * k);
            if ([v50 page] == v20) {
              [v44 addObject:v50];
            }
          }
          uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v155 objects:v169 count:16];
        }
        while (v47);
      }

      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      double v51 = self->m_extraButtons;
      uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v151 objects:v168 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v152;
        do
        {
          for (uint64_t m = 0; m != v53; ++m)
          {
            if (*(void *)v152 != v54) {
              objc_enumerationMutation(v51);
            }
            double v56 = *(void **)(*((void *)&v151 + 1) + 8 * m);
            if ([v56 page] == v20) {
              [v44 addObject:v56];
            }
          }
          uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v151 objects:v168 count:16];
        }
        while (v53);
      }

      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v57 = v44;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v147 objects:v167 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v148;
        double v61 = 0.0;
        do
        {
          for (uint64_t n = 0; n != v59; ++n)
          {
            if (*(void *)v148 != v60) {
              objc_enumerationMutation(v57);
            }
            [*(id *)(*((void *)&v147 + 1) + 8 * n) contentWidth];
            double v61 = v61 + v63;
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v147 objects:v167 count:16];
        }
        while (v59);
      }
      else
      {
        double v61 = 0.0;
      }

      double v64 = v22;
      if (self->m_pageCount >= 2)
      {
        [(UICalloutBarButton *)self->m_nextButton contentWidth];
        double v64 = v22 - v65;
      }
      if (v20)
      {
        [(UICalloutBarButton *)self->m_previousButton contentWidth];
        double v64 = v64 - v66;
      }
      double v67 = v64 / v61;
      if (v61 <= 0.0) {
        double v67 = 1.0;
      }
      double v145 = v67;
      int v68 = [v57 count];
      if (v20) {
        char v69 = v19;
      }
      else {
        char v69 = 1;
      }
      double v70 = 0.0;
      if ((v69 & 1) == 0)
      {
        [(UICalloutBarButton *)self->m_previousButton contentWidth];
        double v70 = v138 + v71;
      }
      double v146 = fmin(v43, 1.0);
      if (v68 == 1)
      {
        CGFloat v72 = v142;
        if (self->m_pageCount != 1) {
          break;
        }
        uint64_t v73 = [v57 lastObject];
        [v73 contentWidth];
        v175.size.CGFloat width = round(v136 + v138 + v145 * v74);
        v175.origin.CGFloat x = v70;
        v175.origin.double y = v142;
        v175.size.CGFloat height = v5;
        CGRect v176 = CGRectIntegral(v175);
        CGFloat x = v176.origin.x;
        CGFloat v76 = v176.origin.y;
        CGFloat width = v176.size.width;
        CGFloat height = v176.size.height;
        objc_msgSend(v73, "setFrame:");
        [v73 setContentScale:v146];
        [v73 setContentHorizontalAlignment:0];
        objc_msgSend(v73, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
        objc_msgSend(v73, "configureForSingle:", -[UICalloutBar targetDirection](self, "targetDirection"));
        if ([v73 isSecurePasteButton])
        {
          v177.origin.CGFloat x = x;
          v177.origin.double y = v76;
          v177.size.CGFloat width = width;
          v177.size.CGFloat height = height;
          double v79 = CGRectGetWidth(v177);
          v178.origin.CGFloat x = x;
          v178.origin.double y = v76;
          v178.size.CGFloat width = width;
          v178.size.CGFloat height = height;
          [v73 configureSecurePasteButtonWithWidth:v79 height:CGRectGetHeight(v178)];
        }

        goto LABEL_121;
      }
      CGFloat v72 = v142;
      if (v68 >= 1) {
        break;
      }
LABEL_121:

      double v22 = v137;
LABEL_122:
      ++v20;
      uint64_t m_pageCount = self->m_pageCount;
      if (v20 >= m_pageCount)
      {
        double v118 = v136;
        if ((int)m_pageCount > 1)
        {
          if (v19) {
            long long v119 = &OBJC_IVAR___UICalloutBar_m_nextButton;
          }
          else {
            long long v119 = &OBJC_IVAR___UICalloutBar_m_previousButton;
          }
          long long v120 = *(Class *)((char *)&self->super.super.super.isa + *v119);
          if (v19) {
            long long v121 = &OBJC_IVAR___UICalloutBar_m_previousButton;
          }
          else {
            long long v121 = &OBJC_IVAR___UICalloutBar_m_nextButton;
          }
          id v122 = v120;
          id v123 = *(id *)((char *)&self->super.super.super.isa + *v121);
          objc_msgSend(v122, "configureForLeftPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
          objc_msgSend(v123, "configureForRightPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
          [(UIView *)self bounds];
          double v125 = v124;
          if (v19)
          {
            [(UICalloutBarButton *)self->m_previousButton contentWidth];
            double v127 = v125 - v126 - v136;
            double v128 = 0.0;
            double v129 = v138;
            v130 = &OBJC_IVAR____UIFocusEngineScrollableContainerOffsets__lastVelocity;
          }
          else
          {
            v130 = &OBJC_IVAR____UIFocusEngineScrollableContainerOffsets__lastVelocity;
            [(UICalloutBarButton *)self->m_nextButton contentWidth];
            double v128 = v125 - v131 - v136;
            double v127 = 0.0;
            double v129 = v136;
            double v118 = v138;
          }
          [(UICalloutBarButton *)self->m_previousButton contentWidth];
          v182.size.CGFloat width = v118 + v132;
          v182.origin.CGFloat x = v127;
          v182.origin.double y = v142;
          v182.size.CGFloat height = v5;
          CGRect v183 = CGRectIntegral(v182);
          -[UIButton setFrame:](self->m_previousButton, "setFrame:", v183.origin.x, v183.origin.y, v183.size.width, v183.size.height);
          uint64_t v133 = v130[488];
          [*(id *)((char *)&self->super.super.super.isa + v133) contentWidth];
          v184.size.CGFloat width = v129 + v134;
          v184.origin.CGFloat x = v128;
          v184.origin.double y = v142;
          v184.size.CGFloat height = v5;
          CGRect v185 = CGRectIntegral(v184);
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v133), "setFrame:", v185.origin.x, v185.origin.y, v185.size.width, v185.size.height);
          if (!v19)
          {
            [(UICalloutBarButton *)self->m_previousButton contentWidth];
            double v127 = v138 + v135 - v139;
          }
          [(UICalloutBarButton *)self->m_previousButton setDividerOffset:v127];
        }
        return;
      }
    }
    uint64_t v80 = 0;
    double v144 = (v64 - v61) / (double)v68;
    uint64_t v81 = (v68 - 1);
    double v141 = v136 + v138 + v39;
    uint64_t v82 = v68;
    while (1)
    {
      BOOL v83 = [v57 objectAtIndex:v80];
      [v83 contentWidth];
      double v85 = v144 + v84;
      double v86 = v145 * v84;
      if (v146 >= 1.0) {
        double v86 = v85;
      }
      if (v81 == v80)
      {
        int v87 = self->m_pageCount;
        double v88 = -0.0;
        double v89 = v143;
        if (v80 | v20) {
          double v89 = -0.0;
        }
        BOOL v90 = v87 < 2;
        double v91 = v89 + v86;
        if (v87 < 2) {
          double v88 = v140;
        }
        double v92 = v91 + v88;
      }
      else
      {
        BOOL v90 = 0;
        double v93 = -0.0;
        if (!(v80 | v20)) {
          double v93 = v143;
        }
        double v92 = v93 + v86;
      }
      double v94 = v70 + v92;
      double v95 = round(v70 + v92);
      double v96 = round(v70);
      double v97 = v95 - v96;
      if (v19)
      {
        double v98 = 0.0;
        if (self->m_pageCount >= 2) {
          [(UICalloutBarButton *)self->m_nextButton contentWidth];
        }
        double v96 = round(v141 - v70 - v97 + v98);
      }
      CGFloat v99 = v72;
      double v100 = v97;
      double v101 = v5;
      CGRect v179 = CGRectIntegral(*(CGRect *)&v96);
      CGFloat v102 = v179.origin.x;
      CGFloat v103 = v179.origin.y;
      CGFloat v104 = v179.size.width;
      CGFloat v105 = v179.size.height;
      objc_msgSend(v83, "setFrame:");
      [v83 setContentScale:v146];
      [v83 setContentHorizontalAlignment:0];
      objc_msgSend(v83, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
      if (v19 ? v90 : (v80 | v20) == 0) {
        break;
      }
      if (v19) {
        BOOL v112 = (v80 | v20) == 0;
      }
      else {
        BOOL v112 = v90;
      }
      if (!v112)
      {
        [v83 configureForMiddlePosition];
        goto LABEL_107;
      }
      objc_msgSend(v83, "configureForRightPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
      double MinX = 0.0;
      if (v19)
      {
        objc_msgSend(v83, "frame", 0.0);
LABEL_115:
        double MinX = CGRectGetMinX(*(CGRect *)&v107);
      }
LABEL_116:
      [v83 setDividerOffset:MinX];
      if ([v83 isSecurePasteButton])
      {
        v180.origin.CGFloat x = v102;
        v180.origin.double y = v103;
        v180.size.CGFloat width = v104;
        v180.size.CGFloat height = v105;
        double v113 = v5;
        CGFloat v114 = CGRectGetWidth(v180);
        v181.origin.CGFloat x = v102;
        v181.origin.double y = v103;
        v181.size.CGFloat width = v104;
        v181.size.CGFloat height = v105;
        double v115 = CGRectGetHeight(v181);
        double v116 = v114;
        double v5 = v113;
        CGFloat v72 = v142;
        [v83 configureSecurePasteButtonWithWidth:v116 height:v115];
      }

      ++v80;
      double v70 = v94;
      if (v82 == v80) {
        goto LABEL_121;
      }
    }
    objc_msgSend(v83, "configureForLeftPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
LABEL_107:
    [v83 frame];
    if (v19) {
      goto LABEL_115;
    }
    double MinX = CGRectGetMaxX(*(CGRect *)&v107) - v139;
    goto LABEL_116;
  }
}

- (void)updateForCurrentPage
{
  if ([(NSMutableArray *)self->m_separatorViews count])
  {
    [(NSMutableArray *)self->m_separatorViews makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableArray *)self->m_separatorViews removeAllObjects];
  }
  if (self->m_isDisplayingVertically)
  {
    [(UICalloutBar *)self updateForCurrentVerticalPage];
  }
  else
  {
    [(UICalloutBar *)self updateForCurrentHorizontalPage];
  }
}

- (void)updateForCurrentHorizontalPage
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  int v6 = self->m_pageCount - 1;
  if (v6 >= (self->m_currentPage & ~(self->m_currentPage >> 31))) {
    int v6 = self->m_currentPage & ~(self->m_currentPage >> 31);
  }
  self->int m_currentPage = v6;
  [(UIView *)self->m_previousButton setHidden:v6 == 0];
  if (![(UIView *)self->m_previousButton isHidden]) {
    [(UICalloutBar *)self addVerticalSeparatorAfterButton:self->m_previousButton usingLargeText:IsAccessibilityCategory];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v7 = self->m_currentSystemButtons;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "setHidden:", objc_msgSend(v12, "page") != self->m_currentPage);
        if (([v12 isHidden] & 1) == 0) {
          [(UICalloutBar *)self addVerticalSeparatorAfterButton:v12 usingLargeText:IsAccessibilityCategory];
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v13 = self->m_extraButtons;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        objc_msgSend(v18, "setHidden:", objc_msgSend(v18, "page", (void)v19) != self->m_currentPage);
        if (([v18 isHidden] & 1) == 0) {
          [(UICalloutBar *)self addVerticalSeparatorAfterButton:v18 usingLargeText:IsAccessibilityCategory];
        }
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  [(UIView *)self->m_nextButton setHidden:self->m_pageCount < 2];
  [(UICalloutBarButton *)self->m_previousButton setHighlighted:0];
  [(UICalloutBarButton *)self->m_nextButton setHighlighted:0];
  [(UIButton *)self->m_nextButton setEnabled:self->m_currentPage < self->m_pageCount - 1];
}

- (void)updateForCurrentVerticalPage
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v3 = self->m_currentSystemButtons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) setHidden:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->m_extraButtons;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setHidden:", 0, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)addVerticalSeparatorAfterButton:(id)a3 usingLargeText:(BOOL)a4
{
  BOOL v4 = a4;
  long long v21 = (UICalloutBarButton *)a3;
  unint64_t v6 = [(NSMutableArray *)self->m_currentSystemButtons count];
  unint64_t v7 = [(NSMutableArray *)self->m_extraButtons count];
  uint64_t v8 = [(NSMutableArray *)self->m_currentSystemButtons indexOfObject:v21];
  uint64_t v9 = [(NSMutableArray *)self->m_extraButtons indexOfObject:v21];
  uint64_t v10 = v21;
  if (self->m_previousButton == v21
    || (v11 = [(UICalloutBarButton *)v21 page] <= 0, uint64_t v10 = v21, !v11)
    || v8 != 0x7FFFFFFFFFFFFFFFLL && (v8 + 1 >= v6 ? (BOOL v19 = v7 == 0) : (BOOL v19 = 0), !v19)
    || (v9 != 0x7FFFFFFFFFFFFFFFLL ? (BOOL v20 = v9 + 1 >= v7) : (BOOL v20 = 1), !v20))
  {
    [(UICalloutBarButton *)v10 dividerOffset];
    double v13 = v12;
    [(UIView *)v21 frame];
    double MinY = CGRectGetMinY(v23);
    double v15 = 1.0;
    if (!v4)
    {
      [(UIView *)self _currentScreenScale];
      double v15 = 1.0 / v16;
    }
    [(UIView *)v21 frame];
    long long v17 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, MinY, v15, CGRectGetHeight(v24));
    if (v4) {
      +[UIColor whiteColor];
    }
    else {
    long long v18 = +[UIColor colorWithRed:0.5569 green:0.5569 blue:0.5765 alpha:0.75];
    }
    [(UIView *)v17 setBackgroundColor:v18];

    [(UIView *)self->m_buttonView insertSubview:v17 atIndex:0];
    [(NSMutableArray *)self->m_separatorViews addObject:v17];

    uint64_t v10 = v21;
  }
}

- (void)adjustFrameToAvoidDividerOnArrow
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ([(UICalloutBar *)self targetDirection] != 3
    && [(UICalloutBar *)self targetDirection] != 4
    && !self->m_currentPage
    && ![(UICalloutBar *)self supressesHorizontalMovement])
  {
    double v3 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    BOOL v4 = self->m_currentSystemButtons;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v53 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (![v9 page]) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v6);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v10 = self->m_extraButtons;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          if (![v15 page]) {
            [v3 addObject:v15];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v12);
    }

    [(UIView *)self frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v24 = v3;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      while (2)
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * k), "dividerOffset", (void)v44);
          if (v29 > 0.0)
          {
            double v30 = v17 + v29;
            double x = self->m_targetPoint.x;
            double v32 = ceil(vabdd_f64(x, v17 + v29));
            if (v32 < 11.0)
            {
              double v33 = 11.0 - v32;
              if (v30 >= x)
              {
                double m_availableSpaceOnRight = self->m_availableSpaceOnRight;
                if (m_availableSpaceOnRight <= v33)
                {
                  double m_availableSpaceOnLeft = self->m_availableSpaceOnLeft;
                  double v37 = v32 + 11.0;
                  if (m_availableSpaceOnLeft <= v37)
                  {
                    double v40 = m_availableSpaceOnLeft - v37;
                    double v41 = -m_availableSpaceOnLeft;
                    if (v40 >= m_availableSpaceOnRight - v33) {
                      double v33 = self->m_availableSpaceOnRight;
                    }
                    else {
                      double v33 = v41;
                    }
                  }
                  else
                  {
                    double v33 = -v37;
                  }
                }
              }
              else
              {
                double v34 = self->m_availableSpaceOnLeft;
                if (v34 <= v33)
                {
                  double v38 = self->m_availableSpaceOnRight;
                  double v39 = v32 + 11.0;
                  if (v38 <= v39)
                  {
                    double v42 = v34 - v33;
                    double v43 = -v34;
                    if (v42 >= v38 - v39) {
                      double v33 = self->m_availableSpaceOnRight;
                    }
                    else {
                      double v33 = v43;
                    }
                  }
                  else
                  {
                    double v33 = v39;
                  }
                }
                else
                {
                  double v33 = -v33;
                }
              }
              if (v33 != 0.0)
              {
                -[UIView setFrame:](self, "setFrame:", v17 + v33, v19, v21, v23);
                self->m_controlFrame.origin.double x = v33 + self->m_controlFrame.origin.x;
              }
              goto LABEL_49;
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_49:
  }
}

- (BOOL)_updateVisibleItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (!self->m_recalcVisibleItems) {
    goto LABEL_39;
  }
  [(UICalloutBar *)self setTargetDirection:2];
  -[UICalloutBar setControlFrame:](self, "setControlFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  self->uint64_t m_pageCount = 0;
  [(UICalloutBar *)self updateAvailableButtons];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v6 = self->m_currentSystemButtons;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v76 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        if (([v10 isHidden] & 1) == 0) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v7);
  }

  [v5 addObjectsFromArray:self->m_extraButtons];
  uint64_t v71 = 0;
  CGFloat v72 = (double *)&v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  [(UICalloutBar *)self textEffectsWindowSafeArea];
  double v12 = v11;
  if ([(UICalloutBar *)self arrowDirection] == 3
    || (double v13 = 0.0, [(UICalloutBar *)self arrowDirection] == 4))
  {
    double v13 = 5.0;
  }
  if ([(UICalloutBar *)self arrowDirection] == 3)
  {
    double v14 = self->m_targetRect.origin.x + self->m_targetRect.size.width;
  }
  else
  {
    double v15 = 0.0;
    if ([(UICalloutBar *)self arrowDirection] != 4) {
      goto LABEL_19;
    }
    double v14 = v12 - self->m_targetRect.origin.x;
  }
  double v15 = fmin(v14, 120.0);
LABEL_19:
  double v16 = [(id)UIApp preferredContentSizeCategory];
  _UISSlotContentSizeCategoryFromContentSizeCategory(v16);
  UISCalloutBarFontSize();
  double v18 = v17;

  double v19 = [off_1E52D39B8 systemFontOfSize:v18];
  [v19 lineHeight];
  v72[3] = v20 + 8.0 + -36.0;
  double v21 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v21);
  *((void *)v72 + 3) = v22;

  double v23 = fmin(v12 - v13 + -20.0 - v15, 768.0);
  uint64_t v67 = 0;
  int v68 = (double *)&v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke;
  v66[3] = &unk_1E52DE018;
  v66[4] = &v67;
  *(double *)&v66[5] = v23;
  [v5 enumerateObjectsUsingBlock:v66];
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v65[3] = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v24 = 0;
  if (v68[3] > v23) {
    [(UICalloutBarButton *)self->m_nextButton contentWidth];
  }
  uint64_t v64 = v24;
  uint64_t v59 = 0;
  uint64_t v60 = (double *)&v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_2;
  v52[3] = &unk_1E52F06C0;
  v52[4] = self;
  long long v54 = v63;
  long long v55 = v65;
  double v58 = v23;
  id v25 = v5;
  id v53 = v25;
  double v56 = &v59;
  id v57 = &v71;
  [v25 enumerateObjectsUsingBlock:v52];
  double v26 = v60[3];
  if (v26 > v12 + -20.0 - v15) {
    double v26 = v12 + -20.0 - v15;
  }
  v60[3] = v26;
  uint64_t v27 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
  self->m_isDisplayingVerticalldouble y = [v27 isVerticallyAligned];

  if (self->m_isDisplayingVertically && ![(NSMutableArray *)self->m_rectsToEvade count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
    double v29 = [WeakRetained _window];
    double v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = +[UIWindow _applicationKeyWindow];
    }
    double v32 = v31;

    double v33 = [v32 windowScene];
    double v34 = [v33 keyboardSceneDelegate];

    uint64_t v35 = [v34 containerWindow];
    if (!v35)
    {
      double v36 = [v32 windowScene];
      uint64_t v35 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v36];
    }
    [v34 visibleFrameInView:v35];
    double x = v81.origin.x;
    double y = v81.origin.y;
    double width = v81.size.width;
    double height = v81.size.height;
    if (!CGRectIsEmpty(v81)) {
      -[UICalloutBar addRectToEvade:](self, "addRectToEvade:", x, y, width, height);
    }
  }
  double v41 = v72[3] + 36.0;
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_3;
  aBlock[3] = &unk_1E52F06E8;
  aBlock[4] = self;
  aBlock[5] = &v59;
  *(double *)&aBlock[8] = v13;
  *(double *)&aBlock[9] = v41;
  aBlock[6] = &v71;
  void aBlock[7] = &v48;
  double v42 = _Block_copy(aBlock);
  double v43 = v42;
  if (v3) {
    (*((void (**)(void *))v42 + 2))(v42);
  }
  else {
    +[UIView performWithoutAnimation:v42];
  }
  int v44 = *((unsigned __int8 *)v49 + 24);
  if (*((unsigned char *)v49 + 24))
  {
    [(UICalloutBar *)self adjustFrameToAvoidDividerOnArrow];
    self->m_recalcVisibleItems = 0;
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v71, 8);
  if (!v44) {
    return 0;
  }
LABEL_39:
  if (v3)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_4;
    v46[3] = &unk_1E52D9F70;
    v46[4] = self;
    +[UIView transitionWithView:self duration:5242880 options:v46 animations:0 completion:0.25];
  }
  else
  {
    [(UICalloutBar *)self updateForCurrentPage];
  }
  return 1;
}

uint64_t __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t result = [a2 contentWidth];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  *a4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > *(double *)(a1 + 40);
  return result;
}

void __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v22 = v5;
  if (!*(_DWORD *)(v6 + 504))
  {
    *(_DWORD *)(v6 + 504) = 1;
    goto LABEL_12;
  }
  [v5 contentWidth];
  id v5 = v22;
  if (v7 + *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) <= *(double *)(a1 + 80)) {
    goto LABEL_12;
  }
  if ([v22 type] == 1)
  {
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    [v22 contentWidth];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v5 = v22;
    if (v8 + v10 + (double)(4 * v9 + 4) * -8.0 <= *(double *)(a1 + 80)) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (v9 >= 2 && [*(id *)(a1 + 40) count] - 1 != a3
    || (double v11 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),
        [v22 contentWidth],
        id v5 = v22,
        v11 + v12 + (double)(4 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 4) * -8.0 > *(double *)(a1 + 80)))
  {
    [*(id *)(*(void *)(a1 + 32) + 688) contentWidth];
    double v14 = v13;
    [*(id *)(*(void *)(a1 + 32) + 680) contentWidth];
    id v5 = v22;
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14 + v15;
    ++*(_DWORD *)(*(void *)(a1 + 32) + 504);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
LABEL_12:
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  [v5 contentWidth];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v16
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  double v18 = *(double *)(v17 + 24);
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v18 < *(double *)(v19 + 24)) {
    double v18 = *(double *)(v19 + 24);
  }
  *(double *)(v17 + 24) = v18;
  double v20 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  [v22 additionalContentHeight];
  if (v20 >= v21) {
    double v21 = v20;
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v21;
  [v22 setPage:*(int *)(*(void *)(a1 + 32) + 504) - 1];
}

uint64_t __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_3(uint64_t result)
{
  uint64_t v1 = result;
  id v2 = *(unsigned char **)(result + 32);
  double v3 = *(double *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  if (v2[780])
  {
    if (v3 != 0.0)
    {
      double v4 = v3 + *(double *)(result + 64);
      [*(id *)(result + 32) maxVerticalCalloutHeightForMinButtonHeight:*(double *)(result + 72)];
      uint64_t result = objc_msgSend(v2, "setFrameForSize:", v4, v5);
      if (result)
      {
        uint64_t result = [*(id *)(v1 + 32) configureButtonsForVerticalView:*(double *)(*(void *)(*(void *)(v1 + 48) + 8) + 24)];
LABEL_8:
        *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      }
    }
  }
  else if (v3 != 0.0)
  {
    uint64_t result = objc_msgSend(*(id *)(result + 32), "setFrameForSize:", v3 + *(double *)(result + 64), *(double *)(result + 72));
    if (result)
    {
      uint64_t result = [*(id *)(v1 + 32) configureButtons:*(double *)(*(void *)(*(void *)(v1 + 48) + 8) + 24)];
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForCurrentPage];
}

- (void)setResponderTarget:(id)a3
{
}

- (void)setTargetRect:(CGRect)a3 view:(id)a4 pointBelowControls:(CGPoint)a5 pointAboveControls:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  id v17 = a4;
  v19.origin.double x = v13;
  v19.origin.double y = v12;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = CGRectIntegral(v19);
  -[UICalloutBar setTargetRect:](self, "setTargetRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  [(UICalloutBar *)self setTargetView:v17];
  [(UICalloutBar *)self setArrowDirection:0];
  [(UICalloutBar *)self setTargetHorizontal:0];
  -[UICalloutBar setPointBelowControls:](self, "setPointBelowControls:", v9, v8);
  -[UICalloutBar setPointAboveControls:](self, "setPointAboveControls:", x, y);
  BOOL v15 = [(UICalloutBar *)self visible];
  self->m_recalcVisibleItems = 1;
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

    if (WeakRetained != v17) {
      [(UICalloutBar *)self _clearResponderTarget];
    }
    if (![(UICalloutBar *)self _updateVisibleItemsAnimated:0]) {
      [(UICalloutBar *)self fade];
    }
  }
}

- (void)setTargetRect:(CGRect)a3 view:(id)a4 pointLeftOfControls:(CGPoint)a5 pointRightOfControls:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  id v17 = a4;
  v19.origin.double x = v13;
  v19.origin.double y = v12;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = CGRectIntegral(v19);
  -[UICalloutBar setTargetRect:](self, "setTargetRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  [(UICalloutBar *)self setTargetView:v17];
  [(UICalloutBar *)self setArrowDirection:0];
  [(UICalloutBar *)self setTargetHorizontal:1];
  -[UICalloutBar setPointLeftOfControls:](self, "setPointLeftOfControls:", v9, v8);
  -[UICalloutBar setPointRightOfControls:](self, "setPointRightOfControls:", x, y);
  BOOL v15 = [(UICalloutBar *)self visible];
  self->m_recalcVisibleItems = 1;
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

    if (WeakRetained != v17) {
      [(UICalloutBar *)self _clearResponderTarget];
    }
    if (![(UICalloutBar *)self _updateVisibleItemsAnimated:0]) {
      [(UICalloutBar *)self fade];
    }
  }
}

- (void)setTargetRect:(CGRect)a3 view:(id)a4 arrowDirection:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = a4;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRect v21 = CGRectIntegral(v20);
  double v11 = v21.origin.x;
  double v12 = v21.origin.y;
  double v13 = v21.size.width;
  double v14 = v21.size.height;
  -[UICalloutBar setTargetRect:](self, "setTargetRect:");
  [(UICalloutBar *)self setTargetView:v18];
  [(UICalloutBar *)self setArrowDirection:v5];
  [(UICalloutBar *)self setTargetHorizontal:(v5 - 3) < 2];
  -[UICalloutBar setPointBelowControls:](self, "setPointBelowControls:", v11 + v13 * 0.5, round(v12));
  -[UICalloutBar setPointAboveControls:](self, "setPointAboveControls:", v11 + v13 * 0.5, round(v12 + v14));
  double v15 = round(v12 + v14 * 0.5);
  -[UICalloutBar setPointLeftOfControls:](self, "setPointLeftOfControls:", v11 + v13, v15);
  -[UICalloutBar setPointRightOfControls:](self, "setPointRightOfControls:", v11, v15);
  BOOL v16 = [(UICalloutBar *)self visible];
  self->m_recalcVisibleItems = 1;
  if (v16)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

    if (WeakRetained != v18) {
      [(UICalloutBar *)self _clearResponderTarget];
    }
    if (![(UICalloutBar *)self _updateVisibleItemsAnimated:0]) {
      [(UICalloutBar *)self fade];
    }
  }
}

- (int64_t)indexOfButton:(id)a3
{
  return _indexOfButton(a3, self);
}

- (BOOL)containsButtonForAction:(SEL)a3
{
  if (![(UICalloutBar *)self visible]) {
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__UICalloutBar_containsButtonForAction___block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_B32__0__UICalloutBarButton_8Q16_B24l;
  aBlock[4] = a3;
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = [(NSMutableArray *)self->m_currentSystemButtons indexOfObjectPassingTest:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = [(NSMutableArray *)self->m_extraButtons indexOfObjectPassingTest:v5];
  }
  BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

BOOL __40__UICalloutBar_containsButtonForAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = ([v3 isHidden] & 1) == 0 && objc_msgSend(v3, "action") == *(void *)(a1 + 32);

  return v4;
}

- (void)buttonHovered:(id)a3 index:(int64_t)a4 hovered:(BOOL)a5
{
  BOOL v5 = a5;
  id v27 = 0;
  id v26 = 0;
  _separatorsForIndex(self, a4, &v27, &v26);
  id v8 = v27;
  id v9 = v26;
  if (v5)
  {
    self->m_hoveredIndeCGFloat x = a4;
    double v10 = 0.0;
    goto LABEL_17;
  }
  m_hoveredIndeCGFloat x = self->m_hoveredIndex;
  if (m_hoveredIndex != a4)
  {
    id v24 = 0;
    id v25 = 0;
    _separatorsForIndex(self, m_hoveredIndex, &v25, &v24);
    id v12 = v25;
    id v13 = v24;
    if (v8 == v12)
    {
      double v14 = v8;
      id v8 = 0;
    }
    else
    {
      if (v9 != v12) {
        goto LABEL_10;
      }
      double v14 = v9;
      id v9 = 0;
    }

LABEL_10:
    if (v8 == v13)
    {
      id v8 = 0;
    }
    else
    {
      if (v9 != v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v9 = 0;
    }

    goto LABEL_15;
  }
  self->m_hoveredIndeCGFloat x = -1;
LABEL_16:
  double v10 = 1.0;
LABEL_17:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__UICalloutBar_buttonHovered_index_hovered___block_invoke;
  aBlock[3] = &unk_1E52DA070;
  id v15 = v8;
  id v21 = v15;
  double v23 = v10;
  id v16 = v9;
  id v22 = v16;
  id v17 = (void (**)(void))_Block_copy(aBlock);
  if (v15 && ([v15 alpha], v10 != v18) || v16 && (objc_msgSend(v16, "alpha"), v10 != v19))
  {
    if (+[UIView areAnimationsEnabled]) {
      +[UIView animateWithDuration:327716 delay:v17 options:0 animations:0.41 completion:0.0];
    }
    else {
      v17[2](v17);
    }
  }
}

uint64_t __44__UICalloutBar_buttonHovered_index_hovered___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  double v2 = *(double *)(a1 + 48);
  id v3 = *(void **)(a1 + 40);
  return [v3 setAlpha:v2];
}

- (void)buttonHighlighted:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  uint64_t v6 = [(_UICalloutBarVisualStyle *)self->m_visualStyle buttonMetrics];
  char v7 = [v6 prefersCustomSelection];

  id v8 = v19;
  if ((v7 & 1) == 0)
  {
    if (!v4 || (v9 = _indexOfButton(v19, self) == self->m_hoveredIndex, id v8 = v19, !v9))
    {
      [v8 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      if (self->m_isDisplayingVertically)
      {
        [(UIScrollView *)self->m_verticalScrollView contentOffset];
        double v13 = v13 - v18;
        if ([(UICalloutBar *)self targetDirection] == 1) {
          double v13 = v13 + 15.0;
        }
      }
      -[UICalloutBarBackground setHighlighted:forFrame:](self->m_overlay, "setHighlighted:forFrame:", v4, v11, v13, v15, v17);
      id v8 = v19;
    }
  }
}

- (void)show
{
  id v3 = [(UIView *)self superview];

  if (v3 && ![(UICalloutBar *)self suppressesAppearance])
  {
    [(UICalloutBar *)self _endOngoingAppearOrFadeAnimations];
    id v6 = [(UICalloutBar *)self delegate];
    if (!v6)
    {
      BOOL v4 = +[UIMenuController sharedMenuController];
      id v6 = [v4 _asCalloutBarDelegate];

      [(UICalloutBar *)self setDelegate:v6];
    }
    self->m_fadedTime = 0.0;
    self->m_fadedDueToCommand = 0;
    self->int m_currentPage = 0;
    if (!self->m_recalcVisibleItems
      || [(UICalloutBar *)self _updateVisibleItemsAnimated:0])
    {
      BOOL v5 = UICalloutBarAnimationContext(@"UICalloutBarAnimationAppear", [(UICalloutBar *)self hasReplacements], self->m_didPromptForReplace);
      if (objc_opt_respondsToSelector()) {
        [v6 calloutBar:self willStartAnimation:v5];
      }
      [(_UICalloutBarVisualStyle *)self->m_visualStyle calloutBarWillAppear:self];
      [(UIView *)self setAlpha:1.0];
      if (objc_opt_respondsToSelector()) {
        [v6 calloutBar:self didFinishAnimation:v5];
      }
      self->m_fadeAfterCommand = 0;
      self->m_didPromptForReplace = 0;
    }
  }
}

- (void)appear
{
  id v3 = [(UIView *)self superview];

  if (v3 && ![(UICalloutBar *)self suppressesAppearance])
  {
    [(UICalloutBar *)self _endOngoingAppearOrFadeAnimations];
    BOOL v4 = [(UICalloutBar *)self delegate];
    if (!v4)
    {
      BOOL v5 = +[UIMenuController sharedMenuController];
      BOOL v4 = [v5 _asCalloutBarDelegate];

      [(UICalloutBar *)self setDelegate:v4];
    }
    self->m_fadedTime = 0.0;
    self->m_fadedDueToCommand = 0;
    [(UIView *)self setAlpha:0.0];
    self->int m_currentPage = 0;
    if (!self->m_recalcVisibleItems
      || [(UICalloutBar *)self _updateVisibleItemsAnimated:0])
    {
      id v6 = UICalloutBarAnimationContext(@"UICalloutBarAnimationAppear", [(UICalloutBar *)self hasReplacements], self->m_didPromptForReplace);
      if (objc_opt_respondsToSelector()) {
        [v4 calloutBar:self willStartAnimation:v6];
      }
      [(_UICalloutBarVisualStyle *)self->m_visualStyle calloutBarWillAppear:self];
      [(UICalloutBar *)self setCurrentAppearOrFadeContext:v6];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __22__UICalloutBar_appear__block_invoke;
      v11[3] = &unk_1E52D9F70;
      v11[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __22__UICalloutBar_appear__block_invoke_2;
      v9[3] = &unk_1E52DA660;
      v9[4] = self;
      id v10 = v6;
      id v7 = v6;
      +[UIView animateWithDuration:v11 animations:v9 completion:0.2];
      self->m_fadeAfterCommand = 0;
      self->m_didPromptForReplace = 0;
      id v8 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      [v8 logBlock:&__block_literal_global_484 domain:@"com.apple.keyboard.UIKit"];
    }
  }
}

uint64_t __22__UICalloutBar_appear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __22__UICalloutBar_appear__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) appearAnimationDidStopWithContext:*(void *)(a1 + 40)];
}

id __22__UICalloutBar_appear__block_invoke_3()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"KeyboardEventType";
  v2[1] = @"Operation";
  v3[0] = @"TextEditing";
  v3[1] = @"Show callout bar";
  v2[2] = @"TriggerType";
  v3[2] = @"CalloutBar";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

- (void)_endOngoingAppearOrFadeAnimations
{
  id v3 = [(UICalloutBar *)self currentAppearOrFadeContext];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 objectForKeyedSubscript:@"UICalloutBarInfoKeyAnimationID"];
    if ([v4 isEqualToString:@"UICalloutBarAnimationAppear"]) {
      [(UICalloutBar *)self appearAnimationDidStopWithContext:v5];
    }
    else {
      [(UICalloutBar *)self fadeAnimationDidStopWithContext:v5 finished:0];
    }

    id v3 = v5;
  }
}

- (void)_fadeAfterCommand:(SEL)a3
{
  [(UICalloutBar *)self _endOngoingAppearOrFadeAnimations];
  [(UICalloutBar *)self clearEvadeRects];
  [(UICalloutBar *)self clearSupressesHorizontalMovementFrame];
  id v5 = [(UIView *)self superview];

  if (v5)
  {
    self->m_fadedTime = CFAbsoluteTimeGetCurrent();
    self->m_fadedDueToCommand = a3 != 0;
    BOOL v6 = sel__promptForReplace_ == a3;
    self->m_didPromptForReplace = v6;
    id v7 = UICalloutBarAnimationContext(@"UICalloutBarAnimationFade", v6, v6);
    id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained calloutBar:self willStartAnimation:v7];
    }
    [(UICalloutBar *)self setCurrentAppearOrFadeContext:v7];
    BOOL m_fadeAfterCommand = self->m_fadeAfterCommand;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __34__UICalloutBar__fadeAfterCommand___block_invoke;
    v16[3] = &unk_1E52D9FC0;
    BOOL v17 = m_fadeAfterCommand;
    v16[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__UICalloutBar__fadeAfterCommand___block_invoke_2;
    v13[3] = &unk_1E52DF270;
    v13[4] = self;
    id v14 = v7;
    BOOL v15 = m_fadeAfterCommand;
    id v10 = v7;
    +[UIView animateWithDuration:v16 animations:v13 completion:0.2];
    self->BOOL m_fadeAfterCommand = 0;
    double v11 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__UICalloutBar__fadeAfterCommand___block_invoke_3;
    v12[3] = &__block_descriptor_40_e5__8__0l;
    v12[4] = a3;
    [v11 logBlock:v12 domain:@"com.apple.keyboard.UIKit"];
  }
}

uint64_t __34__UICalloutBar__fadeAfterCommand___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [(id)UIApp beginIgnoringInteractionEvents];
  }
  double v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

uint64_t __34__UICalloutBar__fadeAfterCommand___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) fadeAnimationDidStopWithContext:*(void *)(a1 + 40) finished:a2];
  [*(id *)(a1 + 32) _clearResponderTarget];
  if (*(unsigned char *)(a1 + 48)) {
    [(id)UIApp endIgnoringInteractionEvents];
  }
  id v3 = *(void **)(*(void *)(a1 + 32) + 824);
  return objc_msgSend(v3, "calloutBarDidDisappear:");
}

id __34__UICalloutBar__fadeAfterCommand___block_invoke_3(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"TextEditing";
  v8[0] = @"KeyboardEventType";
  v8[1] = @"Operation";
  uint64_t v1 = NSString;
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 32));
  id v3 = (void *)v2;
  BOOL v4 = @"None";
  if (v2) {
    BOOL v4 = (__CFString *)v2;
  }
  id v5 = [v1 stringWithFormat:@"%@(%@)", @"Fade callout bar after command", v4];
  v8[2] = @"TriggerType";
  v9[1] = v5;
  v9[2] = @"CalloutBar";
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)_isOwnedByView:(id)a3
{
  id v4 = a3;
  p_m_targetView = &self->m_targetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_m_targetView);
    BOOL v8 = v7 == v4;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_clearResponderTarget
{
  m_responderTargetCompletionHandler = (void (**)(id, id))self->m_responderTargetCompletionHandler;
  if (m_responderTargetCompletionHandler)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);
    m_responderTargetCompletionHandler[2](m_responderTargetCompletionHandler, WeakRetained);
  }
  objc_storeWeak((id *)&self->m_responderTarget, 0);
  id v5 = self->m_responderTargetCompletionHandler;
  self->m_responderTargetCompletionHandler = 0;
}

- (void)setResponderTarget:(id)a3 completion:(id)a4
{
  obuint64_t j = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

  if (WeakRetained != obj)
  {
    [(UICalloutBar *)self _clearResponderTarget];
    objc_storeWeak((id *)&self->m_responderTarget, obj);
    BOOL v8 = _Block_copy(v6);
    id m_responderTargetCompletionHandler = self->m_responderTargetCompletionHandler;
    self->id m_responderTargetCompletionHandler = v8;
  }
}

- (void)fadeFromTargetView:(id)a3
{
  if ([(UICalloutBar *)self _isOwnedByView:a3])
  {
    [(UICalloutBar *)self fade];
  }
}

- (void)fade
{
  if (!self->m_ignoreFade) {
    [(UICalloutBar *)self _fadeAfterCommand:0];
  }
}

- (void)hideFromTargetView:(id)a3
{
  if ([(UICalloutBar *)self _isOwnedByView:a3])
  {
    [(UICalloutBar *)self hide];
  }
}

- (void)hide
{
  [(UICalloutBar *)self clearEvadeRects];
  [(UICalloutBar *)self clearSupressesHorizontalMovementFrame];
  id v3 = [(UIView *)self superview];

  if (v3)
  {
    [(UICalloutBar *)self _endOngoingAppearOrFadeAnimations];
    UICalloutBarAnimationContext(@"UICalloutBarAnimationHide", 0, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained calloutBar:self willStartAnimation:v7];
    }
    [(UIView *)self setAlpha:0.0];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained calloutBar:self didFinishAnimation:v7];
    }
    [(_UICalloutBarVisualStyle *)self->m_visualStyle calloutBarDidDisappear:self];
    [(UICalloutBar *)self _clearResponderTarget];
    objc_storeWeak((id *)&self->m_targetView, 0);
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->m_targetRect.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->m_targetRect.size = v5;
    [(UICalloutBar *)self removeFromSuperview];
    id v6 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    [v6 logBlock:&__block_literal_global_494_0 domain:@"com.apple.keyboard.UIKit"];
  }
}

id __20__UICalloutBar_hide__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"KeyboardEventType";
  v2[1] = @"Operation";
  v3[0] = @"TextEditing";
  v3[1] = @"Hide callout bar";
  v2[2] = @"TriggerType";
  v3[2] = @"CalloutBar";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

- (void)update
{
  self->m_recalcVisibleItems = 1;
  [(UICalloutBar *)self _updateVisibleItemsAnimated:1];
}

- (void)updateAnimated:(BOOL)a3
{
  self->m_recalcVisibleItems = 1;
  [(UICalloutBar *)self _updateVisibleItemsAnimated:a3];
}

- (BOOL)recentlyFaded
{
  return self->m_fadedTime + 0.5 > CFAbsoluteTimeGetCurrent();
}

- (BOOL)fadedDueToCommand
{
  return self->m_fadedDueToCommand;
}

- (void)appearAnimationDidStopWithContext:(id)a3
{
  id v7 = a3;
  id v4 = [(UICalloutBar *)self currentAppearOrFadeContext];

  CGSize v5 = v7;
  if (v4 == v7)
  {
    [(UICalloutBar *)self setCurrentAppearOrFadeContext:0];
    id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained calloutBar:self didFinishAnimation:v7];
    }

    CGSize v5 = v7;
  }
}

- (void)fadeAnimationDidStopWithContext:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(UICalloutBar *)self currentAppearOrFadeContext];

  id v7 = v10;
  if (v6 == v10)
  {
    [(UICalloutBar *)self setCurrentAppearOrFadeContext:0];
    id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained calloutBar:self didFinishAnimation:v10];
    }
    if (v4)
    {
      objc_storeWeak((id *)&self->m_targetView, 0);
      CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->m_targetRect.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->m_targetRect.size = v9;
      [(UICalloutBar *)self removeFromSuperview];
    }

    id v7 = v10;
  }
}

- (void)addRectToEvade:(CGRect)a3
{
  m_rectsToEvade = self->m_rectsToEvade;
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)m_rectsToEvade addObject:v4];
}

- (void)clearEvadeRects
{
}

- (BOOL)hasReplacements
{
  return [(NSArray *)self->m_replacements count] != 0;
}

- (void)clearReplacements
{
  m_replacements = self->m_replacements;
  self->m_replacements = 0;
}

- (void)clearSupressesHorizontalMovementFrame
{
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->m_supressesHorizontalMovementFrame.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->m_supressesHorizontalMovementFrame.size = v2;
  self->m_supressedHorizontalMovementX = 0.0;
}

- (BOOL)isDisplayingVertically
{
  return self->m_isDisplayingVertically;
}

- (CGPoint)pointAboveControls
{
  double x = self->m_pointAboveControls.x;
  double y = self->m_pointAboveControls.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPointAboveControls:(CGPoint)a3
{
  self->m_pointAboveControls = a3;
}

- (CGPoint)pointBelowControls
{
  double x = self->m_pointBelowControls.x;
  double y = self->m_pointBelowControls.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPointBelowControls:(CGPoint)a3
{
  self->m_pointBelowControls = a3;
}

- (CGPoint)pointLeftOfControls
{
  double x = self->m_pointLeftOfControls.x;
  double y = self->m_pointLeftOfControls.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPointLeftOfControls:(CGPoint)a3
{
  self->m_pointLeftOfControls = a3;
}

- (CGPoint)pointRightOfControls
{
  double x = self->m_pointRightOfControls.x;
  double y = self->m_pointRightOfControls.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPointRightOfControls:(CGPoint)a3
{
  self->m_pointRightOfControls = a3;
}

- (CGPoint)targetPoint
{
  double x = self->m_targetPoint.x;
  double y = self->m_targetPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetPoint:(CGPoint)a3
{
  self->m_targetPoint = a3;
}

- (int)targetDirection
{
  return self->m_targetDirection;
}

- (void)setTargetDirection:(int)a3
{
  self->m_targetDirectiouint64_t n = a3;
}

- (BOOL)targetHorizontal
{
  return self->m_targetHorizontal;
}

- (void)setTargetHorizontal:(BOOL)a3
{
  self->m_targetHorizontal = a3;
}

- (CGRect)controlFrame
{
  double x = self->m_controlFrame.origin.x;
  double y = self->m_controlFrame.origin.y;
  double width = self->m_controlFrame.size.width;
  double height = self->m_controlFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setControlFrame:(CGRect)a3
{
  self->m_controlFrame = a3;
}

- (UICalloutBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  return (UICalloutBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)rectsToEvade
{
  return &self->m_rectsToEvade->super;
}

- (CGRect)targetRect
{
  double x = self->m_targetRect.origin.x;
  double y = self->m_targetRect.origin.y;
  double width = self->m_targetRect.size.width;
  double height = self->m_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->m_targetRect = a3;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (int)arrowDirection
{
  return self->m_arrowDirection;
}

- (void)setArrowDirection:(int)a3
{
  self->int m_arrowDirection = a3;
}

- (UIResponder)responderTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);
  return (UIResponder *)WeakRetained;
}

- (NSArray)replacements
{
  return self->m_replacements;
}

- (void)setReplacements:(id)a3
{
}

- (BOOL)showAllReplacements
{
  return self->m_showAllReplacements;
}

- (void)setShowAllReplacements:(BOOL)a3
{
  self->m_showAllReplacements = a3;
}

- (NSArray)extraItems
{
  return self->m_extraItems;
}

- (void)setExtraItems:(id)a3
{
}

- (NSString)untruncatedString
{
  return self->m_untruncatedString;
}

- (void)setUntruncatedString:(id)a3
{
}

- (BOOL)supressesHorizontalMovement
{
  return self->m_supressesHorizontalMovement;
}

- (void)setSupressesHorizontalMovement:(BOOL)a3
{
  self->m_supressesHorizontalMovement = a3;
}

- (NSDictionary)currentAppearOrFadeContext
{
  return self->m_currentAppearOrFadeContext;
}

- (void)setCurrentAppearOrFadeContext:(id)a3
{
}

- (BOOL)suppressesAppearance
{
  return self->m_suppressesAppearance;
}

- (void)setSuppressesAppearance:(BOOL)a3
{
  self->m_suppressesAppearance = a3;
}

- (BOOL)isUsingVerticalFallbackPosition
{
  return self->m_isUsingVerticalFallbackPosition;
}

- (UIScrollView)verticalScrollView
{
  return self->m_verticalScrollView;
}

- (UIStackView)verticalStackView
{
  return self->m_verticalStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_visualStyle, 0);
  objc_storeStrong((id *)&self->m_buttonView, 0);
  objc_storeStrong((id *)&self->m_separatorViews, 0);
  objc_storeStrong((id *)&self->m_verticalStackView, 0);
  objc_storeStrong((id *)&self->m_verticalScrollView, 0);
  objc_storeStrong((id *)&self->m_untruncatedString, 0);
  objc_storeStrong((id *)&self->m_extraItems, 0);
  objc_storeStrong((id *)&self->m_replacements, 0);
  objc_storeStrong(&self->m_responderTargetCompletionHandler, 0);
  objc_destroyWeak((id *)&self->m_responderTarget);
  objc_storeStrong((id *)&self->m_currentAppearOrFadeContext, 0);
  objc_storeStrong((id *)&self->m_overlay, 0);
  objc_storeStrong((id *)&self->m_rectsToEvade, 0);
  objc_storeStrong((id *)&self->m_previousButton, 0);
  objc_storeStrong((id *)&self->m_nextButton, 0);
  objc_storeStrong((id *)&self->m_extraButtons, 0);
  objc_storeStrong((id *)&self->m_currentSystemButtons, 0);
  objc_storeStrong((id *)&self->m_systemButtonDescriptions, 0);
  objc_destroyWeak((id *)&self->m_targetView);
  objc_destroyWeak(&self->m_delegate);
}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  if (!__idiomToVisualStyleClassMap)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    CGSize v9 = (void *)__idiomToVisualStyleClassMap;
    __idiomToVisualStyleClassMap = v8;
  }
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = NSStringFromClass(a3);
    [v11 handleFailureInMethod:a2, a1, @"UICalloutBar.m", 3574, @"visualStyleClass of type %@ is not a subclass of _UICalloutBarVisualStyle.", v12 object file lineNumber description];
  }
  id v10 = (void *)__idiomToVisualStyleClassMap;
  id v13 = [NSNumber numberWithInteger:a4];
  [v10 setObject:a3 forKeyedSubscript:v13];
}

+ (id)_visualStyleForCalloutBar:(id)a3
{
  id v3 = (void *)__idiomToVisualStyleClassMap;
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = [v5 traitCollection];
  id v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "userInterfaceIdiom"));
  uint64_t v8 = [v3 objectForKeyedSubscript:v7];

  if (v8) {
    CGSize v9 = (objc_class *)v8;
  }
  else {
    CGSize v9 = (objc_class *)_UICalloutBarVisualStyle;
  }
  id v10 = (void *)[[v9 alloc] initWithCalloutBar:v5];

  return v10;
}

@end