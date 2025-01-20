@interface CRLiOSImageHUDViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)notAllowedToHideHUD;
- (CGRect)p_viewPositionAtTop:(BOOL)a3 inside:(BOOL)a4 ofUnscaledRect:(CGRect)a5;
- (CRLiOSImageHUDSlider)i_slider;
- (CRLiOSImageHUDViewController)init;
- (NSArray)decoratorOverlayRenderables;
- (UIButton)i_doneButton;
- (UIView)backgroundView;
- (double)p_overlapOfViewRectWithKnobs:(CGRect)a3;
- (void)buttonPressed:(id)a3;
- (void)closeHUDWithAnimation:(BOOL)a3;
- (void)dealloc;
- (void)didEndDynamicOperation;
- (void)didEndScrollingOperation;
- (void)didEndZoomingOperation;
- (void)hideHUDForRep:(id)a3;
- (void)i_observedTraitsDidUpdate;
- (void)loadView;
- (void)p_didEndDynamicOperation:(id)a3;
- (void)p_resumeCollaborationIfNeeded;
- (void)p_startIgnoringKeyboardIfNeeded;
- (void)p_stopIgnoringKeyboardIfNeeded;
- (void)p_suspendCollaborationIfNeeded;
- (void)p_updateHUDAppearance;
- (void)p_updateHUDSize;
- (void)p_updateViewPosition;
- (void)setBackgroundView:(id)a3;
- (void)setI_doneButton:(id)a3;
- (void)setI_slider:(id)a3;
- (void)setNotAllowedToHideHUD:(BOOL)a3;
- (void)setView:(id)a3;
- (void)showHUDForRep:(id)a3;
- (void)sliderChanged:(id)a3;
- (void)sliderEnd:(id)a3;
- (void)sliderStart:(id)a3;
- (void)updateControlsForRep:(id)a3;
- (void)viewDidLoad;
- (void)willBeginDynamicOperation;
- (void)willBeginZoomingOperation;
@end

@implementation CRLiOSImageHUDViewController

- (CRLiOSImageHUDViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSImageHUDViewController;
  return [(CRLiOSImageHUDViewController *)&v3 initWithNibName:0 bundle:0];
}

- (void)loadView
{
  objc_super v3 = (UIView *)objc_alloc_init((Class)UIView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = +[UIColor systemBackgroundColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v5];

  v6 = [(UIView *)self->_backgroundView layer];
  [v6 setCornerRadius:22.0];

  v7 = [(UIView *)self->_backgroundView layer];
  [v7 setCornerCurve:kCACornerCurveContinuous];

  [(UIView *)self->_backgroundView setUserInteractionEnabled:1];
  v8 = [(UIView *)self->_backgroundView layer];
  [v8 crl_applyDefaultCanvasOverlayUIShadowSettings];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Done" value:0 table:0];

  v76 = +[UIFont systemFontOfSize:18.0];
  v11 = +[UIColor labelColor];
  v80[0] = NSFontAttributeName;
  v80[1] = NSForegroundColorAttributeName;
  v81[0] = v76;
  v81[1] = v11;
  v74 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  v13 = v10;
  [v10 sizeWithAttributes:v12];
  self->_doneStringWidth = v14;
  self->_viewSize.width = v14 + 220.0;
  self->_viewSize.height = 44.0;
  v15 = +[UIButtonConfiguration filledButtonConfiguration];
  v16 = +[UIButton buttonWithType:1];
  doneButton = self->_doneButton;
  self->_doneButton = v16;

  v73 = v10;
  v75 = v12;
  id v71 = [objc_alloc((Class)NSAttributedString) initWithString:v10 attributes:v12];
  id v18 = [v12 mutableCopy];
  v19 = [v11 colorWithAlphaComponent:0.5];
  v72 = v18;
  [v18 setValue:v19 forKey:NSForegroundColorAttributeName];

  id v20 = objc_alloc((Class)NSAttributedString);
  id v21 = [v18 copy];
  id v70 = [v20 initWithString:v13 attributes:v21];

  [(UIButton *)self->_doneButton setAttributedTitle:v71 forState:0];
  [(UIButton *)self->_doneButton setAttributedTitle:v70 forState:1];
  v69 = v15;
  [v15 setCornerStyle:4];
  v22 = +[UIColor quaternarySystemFillColor];
  [(UIButton *)self->_doneButton setTintColor:v22];

  v23 = +[UIColor blackColor];
  [v15 setBaseForegroundColor:v23];

  [(UIButton *)self->_doneButton setConfiguration:v15];
  [(UIButton *)self->_doneButton addTarget:self action:"buttonPressed:" forControlEvents:64];
  LODWORD(v24) = 1148846080;
  [(UIButton *)self->_doneButton setContentCompressionResistancePriority:0 forAxis:v24];
  v25 = [(UIButton *)self->_doneButton topAnchor];
  v26 = [(UIView *)self->_backgroundView topAnchor];
  v77 = [v25 constraintEqualToAnchor:v26 constant:8.0];

  v27 = [(UIButton *)self->_doneButton bottomAnchor];
  v28 = [(UIView *)self->_backgroundView bottomAnchor];
  v54 = [v27 constraintEqualToAnchor:v28 constant:-8.0];

  v29 = objc_alloc_init(CRLiOSImageHUDSlider);
  slider = self->_slider;
  self->_slider = v29;

  [(CRLiOSImageHUDSlider *)self->_slider setParentHUDViewController:self];
  LODWORD(v31) = 0.25;
  [(CRLiOSImageHUDSlider *)self->_slider setMinimumValue:v31];
  LODWORD(v32) = 3.0;
  [(CRLiOSImageHUDSlider *)self->_slider setMaximumValue:v32];
  [(CRLiOSImageHUDSlider *)self->_slider setExclusiveTouch:1];
  [(CRLiOSImageHUDSlider *)self->_slider addTarget:self action:"sliderStart:" forControlEvents:1];
  [(CRLiOSImageHUDSlider *)self->_slider addTarget:self action:"sliderChanged:" forControlEvents:4096];
  [(CRLiOSImageHUDSlider *)self->_slider addTarget:self action:"sliderEnd:" forControlEvents:448];
  [(CRLiOSImageHUDSlider *)self->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = [(CRLiOSImageHUDSlider *)self->_slider widthAnchor];
  v68 = [v33 constraintEqualToConstant:150.0];

  LODWORD(v34) = 1144766464;
  [v68 setPriority:v34];
  [v68 setActive:1];
  id v35 = objc_alloc_init((Class)UIView);
  [v35 addSubview:self->_slider];
  id v36 = objc_alloc((Class)UIStackView);
  v37 = self->_doneButton;
  v79[0] = v35;
  v79[1] = v37;
  v38 = +[NSArray arrayWithObjects:v79 count:2];
  id v39 = [v36 initWithArrangedSubviews:v38];

  v40 = +[UIColor clearColor];
  [v39 setBackgroundColor:v40];

  [v39 setSpacing:9.0];
  [v39 setDistribution:2];
  [v39 setAlignment:0];
  [v39 setLayoutMargins:0.0, 9.0, 0.0, 9.0];
  [v39 setLayoutMarginsRelativeArrangement:1];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_backgroundView addSubview:v39];
  v67 = [v35 topAnchor];
  v66 = [(CRLiOSImageHUDSlider *)self->_slider topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v78[0] = v65;
  v63 = [v35 bottomAnchor];
  v62 = [(CRLiOSImageHUDSlider *)self->_slider bottomAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v78[1] = v61;
  v64 = v35;
  v60 = [v35 leftAnchor];
  v59 = [(CRLiOSImageHUDSlider *)self->_slider leftAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:-9.0];
  v78[2] = v58;
  v57 = [v35 rightAnchor];
  v56 = [(CRLiOSImageHUDSlider *)self->_slider rightAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:9.0];
  v78[3] = v55;
  v53 = [v39 topAnchor];
  v52 = [(UIView *)self->_backgroundView topAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v78[4] = v51;
  v50 = [v39 bottomAnchor];
  v49 = [(UIView *)self->_backgroundView bottomAnchor];
  v41 = [v50 constraintEqualToAnchor:v49];
  v78[5] = v41;
  v42 = [v39 leftAnchor];
  v43 = [(UIView *)self->_backgroundView leftAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v78[6] = v44;
  v45 = [v39 rightAnchor];
  v46 = [(UIView *)self->_backgroundView rightAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  v78[7] = v47;
  v78[8] = v77;
  v78[9] = v54;
  v48 = +[NSArray arrayWithObjects:v78 count:10];
  +[NSLayoutConstraint activateConstraints:v48];

  [(CRLiOSImageHUDViewController *)self setView:self->_backgroundView];
  [(CRLiOSImageHUDViewController *)self p_updateHUDSize];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSImageHUDViewController;
  [(CRLiOSImageHUDViewController *)&v5 viewDidLoad];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  objc_super v3 = +[NSArray arrayWithObjects:v6 count:3];
  id v4 = [(CRLiOSImageHUDViewController *)self registerForTraitChanges:v3 withTarget:self action:"i_observedTraitsDidUpdate"];
}

- (void)dealloc
{
  if (self->_ignoringKeyboard)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEA78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085C40();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEA98);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController dealloc]");
    objc_super v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:250 isFatal:0 description:"CRLiOSImageHUDViewController still ignoring keyboard on dealloc"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSImageHUDViewController;
  [(CRLiOSImageHUDViewController *)&v6 dealloc];
}

- (void)setView:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    slider = self->_slider;
    self->_slider = 0;

    maskResizer = self->_maskResizer;
    self->_maskResizer = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSImageHUDViewController;
  [(CRLiOSImageHUDViewController *)&v7 setView:v4];
}

- (void)i_observedTraitsDidUpdate
{
  [(CRLiOSImageHUDSlider *)self->_slider layoutIfNeeded];

  [(CRLiOSImageHUDViewController *)self p_updateHUDAppearance];
}

- (void)buttonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  [WeakRetained endEditingMask];
}

- (void)p_startIgnoringKeyboardIfNeeded
{
  if (!self->_ignoringKeyboard) {
    self->_ignoringKeyboard = 1;
  }
}

- (void)p_stopIgnoringKeyboardIfNeeded
{
  if (self->_ignoringKeyboard) {
    self->_ignoringKeyboard = 0;
  }
}

- (void)p_suspendCollaborationIfNeeded
{
  if (!self->_didSuspendCollaboration)
  {
    self->_didSuspendCollaboration = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    v2 = [WeakRetained interactiveCanvasController];
    objc_super v3 = [v2 editingCoordinator];
    [v3 suspendCollaborationWithReason:@"CRLImageHUDSliderDrag"];
  }
}

- (void)p_resumeCollaborationIfNeeded
{
  if (self->_didSuspendCollaboration)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    id v4 = [WeakRetained interactiveCanvasController];
    objc_super v5 = [v4 editingCoordinator];
    [v5 resumeCollaborationWithReason:@"CRLImageHUDSliderDrag"];

    self->_didSuspendCollaboration = 0;
  }
}

- (void)sliderStart:(id)a3
{
  [(CRLiOSImageHUDViewController *)self p_startIgnoringKeyboardIfNeeded];
  [(CRLiOSImageHUDViewController *)self p_suspendCollaborationIfNeeded];
  if (!self->_maskResizer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    objc_super v5 = (CRLMaskResizing *)[WeakRetained newMaskResizer];
    maskResizer = self->_maskResizer;
    self->_maskResizer = v5;

    objc_super v7 = self->_maskResizer;
    id v8 = objc_loadWeakRetained((id *)&self->_rep);
    [(CRLMaskResizing *)v7 beginResizingRep:v8];

    id v10 = objc_loadWeakRetained((id *)&self->_rep);
    [v10 maskScale];
    self->_lastValue = v9;
  }
}

- (void)sliderChanged:(id)a3
{
  maskResizer = self->_maskResizer;
  if (maskResizer)
  {
    [(CRLiOSImageHUDSlider *)self->_slider value];
    [(CRLMaskResizing *)maskResizer updateResizeToScale:v5];
    [(CRLiOSImageHUDSlider *)self->_slider value];
    self->_lastValue = v6;
  }
}

- (void)sliderEnd:(id)a3
{
  maskResizer = self->_maskResizer;
  if (maskResizer)
  {
    -[CRLMaskResizing endResizingRepAtScale:](maskResizer, "endResizingRepAtScale:", a3, self->_lastValue);
    self->_animateNextTransition = 1;
    float v5 = self->_maskResizer;
    self->_maskResizer = 0;
  }
  [(CRLiOSImageHUDViewController *)self p_stopIgnoringKeyboardIfNeeded];

  [(CRLiOSImageHUDViewController *)self p_resumeCollaborationIfNeeded];
}

- (void)updateControlsForRep:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  float v6 = [WeakRetained interactiveCanvasController];

  id v7 = objc_loadWeakRetained((id *)&self->_rep);
  if (v7 == v4 && !self->_maskResizer)
  {
    unsigned __int8 v8 = [v6 isInDynamicOperation];

    if ((v8 & 1) == 0)
    {
      uint64_t v23 = 0;
      uint64_t v22 = 0;
      [v4 maskScaleLimitsReturningMin:&v23 max:&v22];
      double v9 = [v4 maskScaleDetents];
      uint64_t v10 = 0;
      if ([v4 isMaskScaleFromLayout])
      {
        [v4 maskScale];
        uint64_t v10 = v11;
      }
      unsigned __int8 v12 = +[NSThread isMainThread];
      double v14 = sub_1001BD334;
      v15 = &unk_1014DEAC0;
      uint64_t v18 = v23;
      uint64_t v19 = v22;
      v16 = self;
      v17 = v9;
      uint64_t v20 = v10;
      unsigned __int8 v21 = v12;
      if (+[NSThread isMainThread]) {
        v14((uint64_t)&v13);
      }
      else {
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v13);
      }
    }
  }
  else
  {
  }
}

- (void)showHUDForRep:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEAE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085D50();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEB00);
    }
    float v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    float v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController showHUDForRep:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 396, 0, "invalid nil value for '%{public}s'", "rep");
  }
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEB20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085CC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEB40);
    }
    unsigned __int8 v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController showHUDForRep:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:397 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_rep, v4);
    self->_pinnedToTopOfImage = 0;
    unsigned __int8 v12 = [v4 interactiveCanvasController];
    [v12 addDecorator:self];
    uint64_t v13 = [(CRLiOSImageHUDViewController *)self view];
    double v14 = [v12 canvasView];
    [v13 setHidden:0];
    v15 = [v13 superview];

    if (v15 != v14)
    {
      [v13 removeFromSuperview];
      [v14 addSubview:v13];
    }
    [(CRLiOSImageHUDViewController *)self updateControlsForRep:v4];
    if ([v12 isInDynamicOperation])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001BDA38;
      v18[3] = &unk_1014CBBB0;
      v18[4] = v13;
      +[UIView animateWithDuration:0 delay:v18 options:0 animations:*(double *)&qword_10166E198 completion:*(double *)&qword_10166E1A0];
    }
    else
    {
      [(CRLiOSImageHUDViewController *)self p_updateViewPosition];
      [v13 setAlpha:1.0];
    }
    UIAccessibilityNotifications v16 = UIAccessibilityLayoutChangedNotification;
    v17 = [(CRLiOSImageHUDViewController *)self view];
    UIAccessibilityPostNotification(v16, v17);
  }
}

- (void)hideHUDForRep:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEB60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085DEC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEB80);
    }
    float v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    float v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController hideHUDForRep:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:444 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  if (WeakRetained != v4 || ![(CRLiOSImageHUDViewController *)self isViewLoaded]) {
    goto LABEL_15;
  }
  unsigned __int8 v9 = [(CRLiOSImageHUDViewController *)self notAllowedToHideHUD];

  if ((v9 & 1) == 0)
  {
    [(CRLiOSImageHUDViewController *)self p_stopIgnoringKeyboardIfNeeded];
    [(CRLiOSImageHUDViewController *)self p_resumeCollaborationIfNeeded];
    objc_storeWeak((id *)&self->_rep, 0);
    id WeakRetained = [v4 interactiveCanvasController];
    [WeakRetained removeDecorator:self];
    uint64_t v10 = [(CRLiOSImageHUDViewController *)self view];
    uint64_t v11 = [v10 superview];
    double v12 = *(double *)&qword_10166E190;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001BDD64;
    v14[3] = &unk_1014CBBB0;
    id v15 = v10;
    id v13 = v10;
    +[UIView transitionWithView:v11 duration:5242880 options:v14 animations:0 completion:v12];

LABEL_15:
  }
}

- (void)closeHUDWithAnimation:(BOOL)a3
{
  if (![(CRLiOSImageHUDViewController *)self notAllowedToHideHUD])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
    [(CRLiOSImageHUDViewController *)self hideHUDForRep:WeakRetained];

    if (!a3)
    {
      if ([(CRLiOSImageHUDViewController *)self isViewLoaded])
      {
        id v6 = [(CRLiOSImageHUDViewController *)self view];
        [v6 removeFromSuperview];
      }
    }
  }
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)willBeginDynamicOperation
{
  if (!self->_maskResizer)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1001BDEB4;
    v2[3] = &unk_1014CBBB0;
    v2[4] = self;
    +[UIView animateWithDuration:v2 animations:0.200000003];
  }
}

- (void)didEndDynamicOperation
{
  if (!self->_maskResizer) {
    [(CRLiOSImageHUDViewController *)self performSelector:"p_didEndDynamicOperation:" withObject:0 afterDelay:0.0];
  }
}

- (void)didEndScrollingOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  [(CRLiOSImageHUDViewController *)self updateControlsForRep:WeakRetained];
}

- (void)willBeginZoomingOperation
{
  id v2 = [(CRLiOSImageHUDViewController *)self view];
  [v2 setHidden:1];
}

- (void)didEndZoomingOperation
{
  objc_super v3 = [(CRLiOSImageHUDViewController *)self view];
  [v3 setHidden:0];

  [(CRLiOSImageHUDViewController *)self p_updateViewPosition];
}

- (void)p_updateHUDSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  id v4 = [WeakRetained interactiveCanvasController];

  [v4 visibleScaledRectForCanvasUI];
  double v6 = v5;
  double doneStringWidth = self->_doneStringWidth;
  unsigned __int8 v8 = [(CRLiOSImageHUDViewController *)self view];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEBA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101085E74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEBC0);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    UIAccessibilityNotifications v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateHUDSize]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:542 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (doneStringWidth + 220.0 >= v6 + -8.0) {
    double v18 = v6 + -8.0;
  }
  else {
    double v18 = doneStringWidth + 220.0;
  }
  if (v6 + -8.0 <= 0.0) {
    double v19 = doneStringWidth + 220.0;
  }
  else {
    double v19 = v18;
  }
  double v20 = v19 - (doneStringWidth + 220.0) + 150.0;
  double v21 = 75.0 - v20;
  BOOL v22 = v20 < 75.0;
  double v23 = -0.0;
  if (v22) {
    double v23 = v21;
  }
  double v24 = v19 + v23;
  v25 = [(CRLiOSImageHUDViewController *)self view];
  [v25 setFrame:v10, v12, v24, v14];
}

- (CGRect)p_viewPositionAtTop:(BOOL)a3 inside:(BOOL)a4 ofUnscaledRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat rect = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  BOOL v8 = a4;
  BOOL v9 = a3;
  p_rep = &self->_rep;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  double v13 = [WeakRetained interactiveCanvasController];

  double v14 = [v13 canvasView];
  id v15 = [(CRLiOSImageHUDViewController *)self view];
  [v15 frame];
  double v91 = v17;
  double v92 = v16;
  id v18 = objc_loadWeakRetained((id *)p_rep);
  double v19 = [v18 knobForTag:1];

  [v19 unscaledBoundingBoxOfHitRegionWithAdditionalScale:0.7];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  id v28 = objc_loadWeakRetained((id *)p_rep);
  [v19 position];
  [v28 convertNaturalPointToUnscaledCanvas:];
  double v30 = v29;
  double v89 = v31;

  v93.origin.CGFloat x = v21;
  v93.origin.CGFloat y = v23;
  v93.size.width = v25;
  v93.size.CGFloat height = v27;
  double MaxX = CGRectGetMaxX(v93);
  v94.origin.CGFloat x = v21;
  v94.origin.CGFloat y = v23;
  v94.size.width = v25;
  v94.size.CGFloat height = v27;
  double MinX = CGRectGetMinX(v94);
  v95.origin.CGFloat x = v21;
  v95.origin.CGFloat y = v23;
  v95.size.width = v25;
  v95.size.CGFloat height = v27;
  double MaxY = CGRectGetMaxY(v95);
  v96.origin.CGFloat x = v21;
  v96.origin.CGFloat y = v23;
  v96.size.width = v25;
  v96.size.CGFloat height = v27;
  double MinY = CGRectGetMinY(v96);
  [v13 viewScale];
  double v34 = v33;
  v97.origin.CGFloat x = x;
  v97.origin.CGFloat y = y;
  v97.size.width = rect;
  v97.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v97);
  CGFloat v36 = x;
  CGFloat v37 = y;
  CGFloat v38 = rect;
  CGFloat v39 = height;
  if (v9) {
    double v40 = CGRectGetMinY(*(CGRect *)&v36);
  }
  else {
    double v40 = CGRectGetMaxY(*(CGRect *)&v36);
  }
  double v41 = fmax(fmax(fmax(MaxX - v30, v30 - MinX), fmax(MaxY - v89, v89 - MinY)) * v34 + 1.0, 16.0);
  int v42 = v9 ^ v8;
  [v13 convertUnscaledToBoundsPoint:MidX, v40];
  double v44 = v43;
  double v46 = v45;
  v47 = [v13 canvasView];
  [v47 convertPoint:v14 toView:v44];
  double v49 = v48;
  double v51 = v50;

  double v52 = -v41 - v91;
  if (!v42) {
    double v52 = v41;
  }
  CGFloat v53 = v52 + v51;
  [v13 visibleScaledRectForCanvasUI];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  v62 = [v13 canvasView];
  [v62 convertRect:v14 toView:v55];
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;

  v98.origin.CGFloat x = v64;
  v98.origin.CGFloat y = v66;
  v98.size.width = v68;
  v98.size.CGFloat height = v70;
  CGRect v99 = CGRectInset(v98, 5.0, 5.0);
  double v71 = sub_100065E4C(v49 + v92 * -0.5, v53, v92, v91, v99.origin.x, v99.origin.y, v99.size.width, v99.size.height);
  double v75 = sub_10006757C(v71, v72, v73, v74);
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;

  double v82 = v75;
  double v83 = v77;
  double v84 = v79;
  double v85 = v81;
  result.size.CGFloat height = v85;
  result.size.width = v84;
  result.origin.CGFloat y = v83;
  result.origin.CGFloat x = v82;
  return result;
}

- (void)p_updateViewPosition
{
  p_rep = &self->_rep;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  double v5 = [WeakRetained interactiveCanvasController];

  double v6 = [(CRLiOSImageHUDViewController *)self view];
  id v7 = objc_loadWeakRetained((id *)p_rep);
  if ([v7 isInDynamicOperation])
  {
  }
  else
  {
    [v6 frame];
    double v9 = v8;
    [v5 visibleScaledRectForCanvasUI];
    double v11 = v10;

    if (v9 <= v11)
    {
      [(CRLiOSImageHUDViewController *)self p_updateHUDSize];
      id v12 = objc_loadWeakRetained((id *)p_rep);
      [v12 frameInUnscaledCanvas];
      double v14 = v13;
      double v16 = v15;

      id v17 = objc_loadWeakRetained((id *)p_rep);
      id v18 = [v17 layout];
      [v18 frameInRoot];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      double v97 = v16;
      double v98 = v14;
      -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", self->_pinnedToTopOfImage, 0, v20, v14, v24, v16);
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
      if (v35 > 0.0)
      {
        -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", self->_pinnedToTopOfImage, 0, v20, v22, v24, v26);
        double v28 = v36;
        double v30 = v37;
        double v32 = v38;
        double v34 = v39;
        -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
        if (v40 > 0.0)
        {
          BOOL v41 = !self->_pinnedToTopOfImage;
          self->_pinnedToTopOfImage ^= 1u;
          -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", v41, 0, v20, v98, v24, v97);
          double v28 = v42;
          double v30 = v43;
          double v32 = v44;
          double v34 = v45;
          -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
          if (v46 > 0.0)
          {
            -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", self->_pinnedToTopOfImage, 0, v20, v22, v24, v26);
            double v28 = v47;
            double v30 = v48;
            double v32 = v49;
            double v34 = v50;
            -[CRLiOSImageHUDViewController p_overlapOfViewRectWithKnobs:](self, "p_overlapOfViewRectWithKnobs:");
            if (v51 > 0.0)
            {
              BOOL v52 = !self->_pinnedToTopOfImage;
              self->_pinnedToTopOfImage ^= 1u;
              -[CRLiOSImageHUDViewController p_viewPositionAtTop:inside:ofUnscaledRect:](self, "p_viewPositionAtTop:inside:ofUnscaledRect:", v52, 1, v20, v98, v24, v97);
              double v28 = v53;
              double v30 = v54;
              double v32 = v55;
              double v34 = v56;
            }
          }
        }
      }
      double v57 = [v5 canvasView];
      if (!v57)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DEBE0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101086020();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DEC00);
        }
        double v58 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v58);
        }
        double v59 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateViewPosition]");
        double v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v59, v60, 658, 0, "invalid nil value for '%{public}s'", "canvasView");
      }
      double v61 = [v5 layerHost];
      v62 = [v61 asiOSCVC];
      double v63 = [v62 view];
      CGFloat v64 = [v63 window];
      double v65 = [v64 rootViewController];
      CGFloat v66 = [v65 view];

      if (v66)
      {
        if (v57)
        {
          [v66 safeAreaInsets];
          double v68 = v67;
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;
          [v66 convertRect:v57 fromCoordinateSpace:v28, v30, v32, v34];
          CGFloat v76 = v75;
          CGFloat v78 = v77;
          CGFloat v80 = v79;
          CGFloat v82 = v81;
          [v66 bounds];
          [v57 convertRect:v66 fromCoordinateSpace:sub_100065E4C(v76, v78, v80, v82, v70 + v83, v68 + v84, v85 - (v70 + v74), v86 - (v68 + v72))];
          double v28 = v87;
          double v30 = v88;
          double v32 = v89;
          double v34 = v90;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DEC20);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101085F84();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DEC40);
        }
        double v91 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v91);
        }
        double v92 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateViewPosition]");
        CGRect v93 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v92, v93, 660, 0, "invalid nil value for '%{public}s'", "rootView");
      }
      if (!+[NSThread isMainThread])
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DEC60);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101085EFC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DEC80);
        }
        CGRect v94 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v94);
        }
        CGRect v95 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSImageHUDViewController p_updateViewPosition]");
        CGRect v96 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSImageHUDViewController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v95 file:v96 lineNumber:669 isFatal:0 description:"This operation must only be performed on the main thread."];
      }
      [v6 setFrame:v28, v30, v32, v34];
    }
  }
}

- (double)p_overlapOfViewRectWithKnobs:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_rep = &self->_rep;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  double v9 = [WeakRetained interactiveCanvasController];

  double v10 = [v9 canvasView];
  double v11 = [v9 canvasView];
  [v10 convertRect:v11 toView:x, y, width, height];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  [v9 convertBoundsToUnscaledRect:v13, v15, v17, v19];
  double v85 = v21;
  double v86 = v20;
  double v84 = v22;
  CGFloat v91 = v23;
  id v24 = objc_loadWeakRetained((id *)p_rep);
  double v25 = [v24 knobForTag:1];
  [v25 unscaledBoundingBoxOfHitRegionWithAdditionalScale:0.7];
  uint64_t r1 = v27;
  uint64_t v83 = v26;
  uint64_t v80 = v28;
  uint64_t v81 = v29;

  id v30 = objc_loadWeakRetained((id *)p_rep);
  double v31 = [v30 knobForTag:3];
  [v31 unscaledBoundingBoxOfHitRegionWithAdditionalScale:0.7];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v79 = v38;

  id v39 = objc_loadWeakRetained((id *)p_rep);
  double v40 = [v39 knobForTag:7];
  [v40 unscaledBoundingBoxOfHitRegionWithAdditionalScale:0.7];
  double v42 = v41;
  double v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;

  id v49 = objc_loadWeakRetained((id *)p_rep);
  double v50 = [v49 knobForTag:9];
  [v50 unscaledBoundingBoxOfHitRegionWithAdditionalScale:0.7];
  CGFloat v89 = v52;
  CGFloat v90 = v51;
  CGFloat v87 = v54;
  CGFloat v88 = v53;

  id v55 = objc_loadWeakRetained((id *)p_rep);
  double v56 = [v55 info];

  double v57 = [v56 geometry];
  [v57 angle];
  sub_100065C2C(v58);
  double v60 = v59;

  if (v60 <= 45.0) {
    goto LABEL_7;
  }
  double v61 = v46;
  BOOL v62 = v60 >= 135.0;
  if (v60 > 225.0) {
    BOOL v62 = 0;
  }
  if (v60 > 315.0)
  {
LABEL_7:
    double v68 = v33;
    double v69 = v35;
    CGFloat v70 = v37;
    CGFloat v71 = v79;
    CGFloat v78 = v42;
    CGFloat v67 = v44;
    CGFloat v73 = v85;
    CGFloat v72 = v86;
    uint64_t v65 = v83;
    CGFloat v74 = v84;
    uint64_t v63 = v80;
    uint64_t v64 = v81;
    uint64_t v66 = r1;
  }
  else
  {
    uint64_t v63 = v80;
    uint64_t v64 = v81;
    uint64_t v66 = r1;
    uint64_t v65 = v83;
    CGFloat v46 = v37;
    CGFloat v67 = v35;
    if (v62)
    {
      double v68 = v33;
      double v69 = v35;
      CGFloat v70 = v46;
      CGFloat v71 = v79;
      CGFloat v78 = v42;
      CGFloat v67 = v44;
      CGFloat v46 = v61;
      CGFloat v73 = v85;
      CGFloat v72 = v86;
      CGFloat v74 = v84;
    }
    else
    {
      double v68 = v42;
      double v69 = v44;
      CGFloat v70 = v61;
      CGFloat v71 = v48;
      CGFloat v73 = v85;
      CGFloat v72 = v86;
      CGFloat v74 = v84;
      CGFloat v48 = v79;
      CGFloat v78 = v33;
    }
  }
  CGRect v96 = CGRectUnion(*(CGRect *)&v65, *(CGRect *)&v68);
  v92.origin.double x = v72;
  v92.origin.double y = v73;
  v92.size.double width = v74;
  v92.size.double height = v91;
  CGRect v93 = CGRectIntersection(v92, v96);
  CGFloat v75 = v93.size.width * v93.size.height + 0.0;
  v93.origin.double x = v78;
  v93.origin.double y = v67;
  v93.size.double width = v46;
  v93.size.double height = v48;
  v97.origin.double y = v89;
  v97.origin.double x = v90;
  v97.size.double height = v87;
  v97.size.double width = v88;
  CGRect v98 = CGRectUnion(v93, v97);
  v94.origin.double x = v72;
  v94.origin.double y = v73;
  v94.size.double width = v74;
  v94.size.double height = v91;
  CGRect v95 = CGRectIntersection(v94, v98);
  double v76 = v75 + v95.size.width * v95.size.height;

  return v76;
}

- (void)p_didEndDynamicOperation:(id)a3
{
  [(CRLiOSImageHUDViewController *)self p_updateViewPosition];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001BF33C;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  +[UIView animateWithDuration:0 delay:v4 options:0 animations:0.200000003 completion:*(double *)&qword_10166E1A0];
}

- (void)p_updateHUDAppearance
{
  objc_super v3 = +[UIColor systemBackgroundColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v3];

  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"Done" value:0 table:0];

  double v6 = +[UIFont systemFontOfSize:18.0];
  id v7 = +[UIColor labelColor];
  v10[0] = NSFontAttributeName;
  v10[1] = NSForegroundColorAttributeName;
  v11[0] = v6;
  v11[1] = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v9 = [objc_alloc((Class)NSAttributedString) initWithString:v5 attributes:v8];
  [(UIButton *)self->_doneButton setAttributedTitle:v9 forState:0];
}

- (BOOL)accessibilityPerformEscape
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  [WeakRetained endEditingMask];

  return 1;
}

- (BOOL)notAllowedToHideHUD
{
  return self->_notAllowedToHideHUD;
}

- (void)setNotAllowedToHideHUD:(BOOL)a3
{
  self->_notAllowedToHideHUD = a3;
}

- (CRLiOSImageHUDSlider)i_slider
{
  return self->_slider;
}

- (void)setI_slider:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIButton)i_doneButton
{
  return self->_doneButton;
}

- (void)setI_doneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_maskResizer, 0);

  objc_destroyWeak((id *)&self->_rep);
}

@end