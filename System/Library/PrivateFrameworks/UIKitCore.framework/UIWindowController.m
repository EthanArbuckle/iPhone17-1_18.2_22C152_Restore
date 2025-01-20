@interface UIWindowController
+ (id)windowControllerForWindow:(id)a3;
+ (void)windowWillBeDeallocated:(id)a3;
- (BOOL)_isInteractiveTransition;
- (BOOL)presenting;
- (BOOL)transitionViewShouldUseViewControllerCallbacks;
- (CGPoint)_adjustOrigin:(CGPoint)result givenOtherOrigin:(CGPoint)a4 forTransition:(int)a5;
- (CGPoint)_originForViewController:(id)a3 orientation:(int64_t)a4 actualStatusBarHeight:(double)a5 fullScreenLayout:(BOOL)a6 inWindow:(id)a7;
- (CGPoint)transitionView:(id)a3 beginOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6;
- (CGPoint)transitionView:(id)a3 endOriginForFromView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6;
- (CGPoint)transitionView:(id)a3 endOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6;
- (CGRect)_boundsForViewController:(id)a3 transition:(int)a4 orientation:(int64_t)a5 fullScreenLayout:(BOOL)a6 inWindow:(id)a7;
- (CGSize)_flipSize:(CGSize)a3;
- (UITransitionView)transitionView;
- (UIViewControllerAnimatedTransitioning)_transitionController;
- (UIViewControllerInteractiveTransitioning)_interactionController;
- (UIWindow)window;
- (double)durationForTransition:(int)a3;
- (void)_prepareKeyboardForTransition:(int)a3 fromView:(id)a4;
- (void)_setInteractionController:(id)a3;
- (void)_setInteractiveTransition:(BOOL)a3;
- (void)_setTransitionController:(id)a3;
- (void)_transition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7;
- (void)_transition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7 animation:(id)a8;
- (void)_transplantView:(id)a3 toSuperview:(id)a4 atIndex:(unint64_t)a5;
- (void)dealloc;
- (void)setPresenting:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)transitionView:(id)a3 startCustomTransitionWithDuration:(double)a4;
- (void)transitionViewDidCancel:(id)a3 fromView:(id)a4 toView:(id)a5;
- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6;
- (void)transitionViewDidStart:(id)a3;
@end

@implementation UIWindowController

+ (id)windowControllerForWindow:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)__windowToWindowControllerMapTable;
    if (!__windowToWindowControllerMapTable)
    {
      uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      v6 = (void *)__windowToWindowControllerMapTable;
      __windowToWindowControllerMapTable = v5;

      v4 = (void *)__windowToWindowControllerMapTable;
    }
    v7 = [v4 objectForKey:v3];
    if (!v7)
    {
      v7 = objc_alloc_init(UIWindowController);
      [(UIWindowController *)v7 setWindow:v3];
      [(id)__windowToWindowControllerMapTable setObject:v7 forKey:v3];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)windowWillBeDeallocated:(id)a3
{
}

- (void)dealloc
{
  transitionView = self->_transitionView;
  if (transitionView)
  {
    v4 = [(UIViewController *)self->_fromViewController view];
    uint64_t v5 = [(UIViewController *)self->_toViewController view];
    [(UIWindowController *)self transitionViewDidComplete:transitionView fromView:v4 toView:v5 removeFromView:1];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIWindowController;
  [(UIWindowController *)&v6 dealloc];
}

- (CGPoint)_originForViewController:(id)a3 orientation:(int64_t)a4 actualStatusBarHeight:(double)a5 fullScreenLayout:(BOOL)a6 inWindow:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if (a6)
  {
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    v15 = [(UIWindowController *)self window];
    v16 = __UIStatusBarManagerForWindow(v15);
    [v16 defaultStatusBarHeightInOrientation:a4];
    double v18 = v17;

    if (v12) {
      [v12 screen];
    }
    else {
    v19 = +[UIScreen mainScreen];
    }
    [v19 _applicationFrameForInterfaceOrientation:a4 usingStatusbarHeight:v18];
    double v13 = v20;
    double v14 = v21;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  objc_msgSend(WeakRetained, "convertPoint:fromWindow:", 0, v13, v14);
  double v24 = v23;
  double v26 = v25;

  double v27 = v24;
  double v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (CGSize)_flipSize:(CGSize)a3
{
  CGFloat width = a3.width;
  double height = a3.height;
  double v5 = width;
  result.double height = v5;
  result.CGFloat width = height;
  return result;
}

- (CGRect)_boundsForViewController:(id)a3 transition:(int)a4 orientation:(int64_t)a5 fullScreenLayout:(BOOL)a6 inWindow:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  double v13 = v12;
  if (!v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
    char v23 = [WeakRetained _isHostedInAnotherProcess];

    if (v23)
    {
      id v24 = objc_loadWeakRetained((id *)&self->_window);
      [v24 bounds];
      double v15 = v25;
      double v17 = v26;
      double v19 = v27;
      double v21 = v28;

      goto LABEL_17;
    }
    if (a6)
    {
      v29 = +[UIScreen mainScreen];
      goto LABEL_10;
    }
LABEL_11:
    v35 = [(UIWindowController *)self window];
    v36 = __UIStatusBarManagerForWindow(v35);
    [v36 defaultStatusBarHeightInOrientation:a5];
    double v38 = v37;

    if (v13) {
      [v13 screen];
    }
    else {
    v39 = +[UIScreen mainScreen];
    }
    [v39 _applicationFrameForInterfaceOrientation:a5 usingStatusbarHeight:v38];
    double v19 = v40;
    double v21 = v41;

    double v15 = *MEMORY[0x1E4F1DAD8];
    double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    goto LABEL_15;
  }
  if ([v12 _isHostedInAnotherProcess])
  {
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    goto LABEL_17;
  }
  if (!a6) {
    goto LABEL_11;
  }
  v29 = [v13 screen];
LABEL_10:
  v30 = v29;
  [v29 bounds];
  double v15 = v31;
  double v17 = v32;
  double v19 = v33;
  double v21 = v34;

LABEL_15:
  if ((unint64_t)(a5 - 3) <= 1)
  {
    -[UIWindowController _flipSize:](self, "_flipSize:", v19, v21);
    double v19 = v42;
    double v21 = v43;
  }
LABEL_17:

  double v44 = v15;
  double v45 = v17;
  double v46 = v19;
  double v47 = v21;
  result.size.double height = v47;
  result.size.CGFloat width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)_prepareKeyboardForTransition:(int)a3 fromView:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v12 = a4;
  [(id)objc_opt_class() durationForTransition:v4];
  double v6 = v5;
  v7 = [v12 keyboardSceneDelegate];
  if ((UIKeyboardAutomaticIsOffScreen() & 1) == 0)
  {
    v8 = [v7 responder];
    int v9 = [v12 _containsResponder:v8];

    if (v9)
    {
      [v7 _beginIgnoringReloadInputViews];
      [v7 setAutomaticAppearanceInternalEnabled:0];
      [v12 endEditing:1];
      [v7 setAutomaticAppearanceInternalEnabled:1];
      [v7 _endIgnoringReloadInputViews];
      uint64_t v10 = +[UIViewController _keyboardDirectionForTransition:v4];
      if ([v7 currentState] != 2) {
        [v7 forceOrderOutAutomaticToDirection:v10 withDuration:v6];
      }
    }
  }
  if (v4)
  {
    id v11 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", 1, +[UIViewController _keyboardDirectionForTransition:v4], v6);
    [v7 pushAnimationStyle:v11];
  }
}

- (void)_transplantView:(id)a3 toSuperview:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 keyboardSceneDelegate];
  [v9 setAutomaticAppearanceInternalEnabled:0];
  self;
  ++__disablePromoteDescendantToFirstResponderCount;
  [v7 insertSubview:v8 atIndex:a5];

  self;
  if (__disablePromoteDescendantToFirstResponderCount) {
    --__disablePromoteDescendantToFirstResponderCount;
  }
  [v9 setAutomaticAppearanceInternalEnabled:1];
}

- (void)_transition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7
{
}

- (void)_transition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7 animation:(id)a8
{
  v249[1] = *MEMORY[0x1E4F143B8];
  v193 = (UIViewController *)a4;
  v192 = (UIViewController *)a5;
  id v176 = a6;
  v178 = (void (**)(void))a8;
  if (self->_currentTransition)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UIWindowController.m", 237, @"Attempting to begin a modal transition from %@ to %@ while a transition is already in progress. Wait for viewDidAppear/viewDidDisappear to know the current transition has completed", v193, v192 object file lineNumber description];

    if (self->_fromViewController == v193 && self->_toViewController == v192) {
      goto LABEL_239;
    }
  }
  uint64_t v14 = [(UIViewController *)v192 modalPresentationStyle];
  uint64_t v15 = [(UIViewController *)v193 modalPresentationStyle];
  uint64_t v16 = [(UIViewController *)v193 interfaceOrientation];
  if (!a3 && v14 != 4)
  {
    v190 = 0;
    int v173 = 0;
    id v17 = 0;
LABEL_11:
    char v180 = 0;
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  id v17 = [(UIWindowController *)self _transitionController];

  if (!v17)
  {
    v190 = 0;
    int v173 = 0;
    goto LABEL_11;
  }
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  double v20 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
  [(_UIViewControllerTransitionContext *)v20 _setAnimator:v17];
  v190 = v20;
  if (v18 == v19)
  {
    [(_UIViewControllerTransitionContext *)v20 _setCompletionCurve:7];
    char v180 = 0;
    uint64_t v21 = 0;
    int v173 = 1;
  }
  else
  {
    int v173 = 1;
    uint64_t v21 = 4;
    char v180 = 1;
  }
LABEL_12:
  int64_t v22 = 3;
  if (v14 != 15) {
    int64_t v22 = v14;
  }
  if (v22 == 4) {
    int64_t v22 = v21;
  }
  if (v15 == 4) {
    unint64_t v23 = v21;
  }
  else {
    unint64_t v23 = v15;
  }
  self->_toModalStyle = v22;
  v187 = (void *)v22;
  unint64_t v181 = v23;
  id val = v17;
  if (self->_presenting)
  {
    if (v22 != 3 && v22 != 18)
    {
      char v24 = 0;
      BOOL presenting = 1;
LABEL_26:
      BOOL v184 = presenting;
      goto LABEL_27;
    }
LABEL_25:
    double v26 = [(UIViewController *)v193 view];
    double v27 = [v26 superview];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass() ^ 1;

    BOOL presenting = self->_presenting;
    goto LABEL_26;
  }
  if (v23 == 18 || v23 == 3) {
    goto LABEL_25;
  }
  BOOL v184 = 0;
  char v24 = 0;
LABEL_27:
  double v28 = [(UIWindowController *)self window];
  v171 = [v28 _delegateViewController];
  if (self->_presenting)
  {
    v29 = [(UIViewController *)v193 presentingViewController];
    if (v29)
    {
      int isKindOfClass = 0;
      double v31 = v187;
    }
    else
    {
      double v32 = [(UIViewController *)v193 _rootAncestorViewController];
      if (v171 == v32)
      {
        int isKindOfClass = 0;
      }
      else
      {
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
      }
      double v31 = v187;
    }
  }
  else
  {
    int isKindOfClass = v171 == v193;
    double v31 = v187;
  }
  int v188 = v24 & 1;
  BOOL v33 = !(v24 & 1);
  if (v184) {
    BOOL v33 = 1;
  }
  BOOL v167 = v33;
  if (!v33)
  {
    BOOL v34 = [(UIViewController *)v192 definesPresentationContext];
    if (v31 == (void *)3 && v34) {
      [(UIViewController *)v193 setDefinesPresentationContext:[(UIViewController *)v193 _isPresentationContextByDefault]];
    }
  }
  if (isKindOfClass)
  {
    if (v184)
    {
      if (!v31)
      {
        v35 = [(UIViewController *)v193 _existingView];
        v36 = [v35 superview];
        [v36 frame];
        double v38 = v37;

        if (v38 != 0.0)
        {
          v39 = [v28 _delegateViewController];
          [v28 _addRotationViewController:v39];
          if (v192) {
            objc_storeWeak((id *)&v192->_previousRootViewController, v39);
          }
          [v28 _setDelegateViewController:v192];
          v39[47] &= ~0x100uLL;
          *(void *)&v192->_viewControllerFlags |= 0x100uLL;
LABEL_55:
        }
      }
    }
    else if (!v181)
    {
      v39 = -[UIViewController _previousRootViewController]((id *)&v193->super.super.isa);
      if (v39)
      {
        [v28 _removeRotationViewController:v39];
        [v28 _setDelegateViewController:v39];
        double v40 = v39;

        *(void *)&v40->_viewControllerFlags |= 0x100uLL;
        v171 = v40;
      }
      *(void *)&v193->_viewControllerFlags &= ~0x100uLL;
      goto LABEL_55;
    }
  }
  uint64_t v41 = [(id)UIApp _statusBarOrientationForWindow:v28];
  if ((v24 & 1) == 0
    && (([(UIViewController *)v193 _ancestorViewControllerIsInPopover] | isKindOfClass) & 1) != 0)
  {
    uint64_t v16 = v41;
  }
  double v42 = [v28 screen];
  char v43 = [v42 _isEmbeddedScreen];

  if (v43)
  {
    double v44 = v192;
    uint64_t v45 = -[UIViewController _preferredInterfaceOrientationForPresentationInWindow:fromInterfaceOrientation:](v192, v28, v16);
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v45 = [(id)UIApp _statusBarOrientationForWindow:v28];
    double v44 = v192;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_66;
    }
  }
  if (([v28 _shouldAutorotateToInterfaceOrientation:v45] & 1) == 0)
  {
    uint64_t v45 = v16;
    if (v44)
    {
      v44->_lastKnownInterfaceOrientation = v16;
      uint64_t v45 = v16;
    }
  }
LABEL_66:
  if (v41 == v45 || v187 && v181 <= 0x10 && ((1 << v181) & 0x10006) != 0)
  {
    BOOL v46 = 0;
  }
  else if ([(UIViewController *)v44 _ignoreAppSupportedOrientations])
  {
    BOOL v46 = 1;
  }
  else
  {
    v58 = [(UIViewController *)v193 _rootAncestorViewController];
    BOOL v46 = v171 == v58;

    double v44 = v192;
  }
  [v28 _setRotatableClient:v44 toOrientation:v45 updateStatusBar:v46 duration:0 force:0 isRotating:0.0];
  double v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v248 = 0x1ED160180;
  v48 = [NSNumber numberWithInteger:v45];
  v249[0] = v48;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v249 forKeys:&v248 count:1];
  [v47 postNotificationName:0x1ED160160 object:v28 userInfo:v49];

  if (isKindOfClass)
  {
    v50 = +[UIDevice currentDevice];
    uint64_t v51 = [v50 userInterfaceIdiom];

    BOOL v52 = (v51 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    BOOL v52 = 0;
  }
  if (!self->_presenting)
  {
    int v186 = 0;
    goto LABEL_90;
  }
  if ([(UIViewController *)v192 _isModalSheet])
  {
    BOOL v53 = 1;
LABEL_80:
    int v186 = v53;
    goto LABEL_90;
  }
  if (v52)
  {
    BOOL v53 = v187 == 0;
    goto LABEL_80;
  }
  v54 = [(UIViewController *)v193 _popoverController];
  if (v54) {
    BOOL v55 = v187 == 0;
  }
  else {
    BOOL v55 = 0;
  }
  int v56 = v55;
  int v186 = v56;

LABEL_90:
  if (v184)
  {
    int v175 = 0;
    goto LABEL_105;
  }
  if ([(UIViewController *)v193 _isModalSheet])
  {
    BOOL v57 = 1;
LABEL_96:
    int v175 = v57;
    goto LABEL_105;
  }
  if (v52)
  {
    BOOL v57 = v181 == 0;
    goto LABEL_96;
  }
  v59 = [(UIViewController *)v192 _popoverController];
  if (v59) {
    BOOL v60 = v181 == 0;
  }
  else {
    BOOL v60 = 0;
  }
  int v61 = v60;
  int v175 = v61;

LABEL_105:
  id v62 = 0;
  BOOL v63 = !v184;
  BOOL v64 = self->_presenting;
  BOOL v65 = v187 == (void *)17;
  BOOL v66 = v181 == 17 && !v184;
  BOOL v174 = v66;
  BOOL v67 = v187 == (void *)18;
  BOOL v68 = v181 != 18 || v184;
  BOOL v166 = v68;
  if (!self->_presenting)
  {
    BOOL v65 = 0;
    BOOL v67 = 0;
  }
  BOOL v172 = v67;
  BOOL v69 = self->_presenting && v187 == (void *)4;
  if (v181 != 4) {
    BOOL v63 = 0;
  }
  BOOL v185 = v63;
  BOOL v179 = v65;
  int v70 = v186 | v65;
  BOOL v189 = v69;
  if (((v186 | v65) & 1) == 0 && !v69)
  {
    id v62 = [(UIViewController *)v193 _visibleView];

    BOOL v64 = self->_presenting;
  }
  if (v187 != (void *)3 && v64 && v181 == 3)
  {

    id v62 = 0;
  }
  if (v188)
  {
    uint64_t v71 = [(UIViewController *)v193 view];

    id v62 = (id)v71;
  }
  if ((v186 & 1) != 0 || !v62)
  {
    id v72 = [(UIViewController *)v193 view];
    id v73 = [v72 window];
  }
  else
  {
    id v72 = [v62 superview];
    id v73 = v72;
  }

  if (v185 || v189)
  {
    if (self->_presenting) {
      v74 = v193;
    }
    else {
      v74 = v192;
    }
    v75 = [(UIViewController *)v74 customTransitioningView];
    id v182 = [v75 superview];

    if (self->_presenting) {
      v76 = v193;
    }
    else {
      v76 = v192;
    }
    v77 = [(UIViewController *)v76 customTransitioningView];
    objc_storeStrong((id *)&self->_transitionView, v77);
  }
  else
  {
    id v182 = v73;
  }
  BOOL v78 = (!v186
      || [(UIViewController *)v193 _preferredInterfaceOrientationGivenCurrentOrientation:v45] != v45)&& v16 != v45;
  v79 = [(UIWindowController *)self _interactionController];
  BOOL v80 = v79 == 0;

  if (v80) {
    [(id)UIApp beginIgnoringInteractionEvents];
  }
  [v182 bounds];
  if (!self->_transitionView)
  {
    double v85 = v81;
    double v86 = v82;
    double v87 = v83;
    double v88 = v84;
    v89 = -[UITransitionView initWithFrame:]([UITransitionView alloc], "initWithFrame:", v81, v82, v83, v84);
    transitionView = self->_transitionView;
    self->_transitionView = v89;

    -[UITransitionView setBounds:](self->_transitionView, "setBounds:", v85, v86, v87, v88);
    [(UITransitionView *)self->_transitionView setDelegate:self];
    if (v188)
    {
      if ([(UIViewController *)v193 _isModalSheet]
        || [(UIViewController *)v192 _isModalSheet])
      {
        v91 = [(UIView *)self->_transitionView layer];
        v92 = [(UIViewController *)v193 view];
        v93 = [v92 layer];
        [v93 cornerRadius];
        objc_msgSend(v91, "setCornerRadius:");

        v94 = [(UIViewController *)v193 view];
        v95 = [v94 layer];
        objc_msgSend(v91, "setMasksToBounds:", objc_msgSend(v95, "masksToBounds"));
      }
    }
  }
  v96 = [(UIWindowController *)self _interactionController];

  if (v96) {
    [(UITransitionView *)self->_transitionView setIgnoresInteractionEvents:0];
  }
  [(UITransitionView *)self->_transitionView setShouldNotifyDidCompleteImmediately:1];
  switch(v45)
  {
    case 1:
      double v97 = 0.0;
      break;
    case 3:
      double v97 = 1.57079633;
      break;
    case 4:
      double v97 = -1.57079633;
      break;
    case 2:
      double v97 = 3.14159265;
      break;
    default:
      double v97 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v246, v97);
  *(float64x2_t *)&v246.a = vrndaq_f64(*(float64x2_t *)&v246.a);
  *(float64x2_t *)&v246.c = vrndaq_f64(*(float64x2_t *)&v246.c);
  *(float64x2_t *)&v246.tx = vrndaq_f64(*(float64x2_t *)&v246.tx);
  CGAffineTransform v247 = v246;
  int v98 = [v28 _isHostedInAnotherProcess];
  int v99 = v45 == 1 || v78;
  [(UIView *)self->_transitionView bounds];
  double v101 = v100;
  double v103 = v102;
  CGFloat width = v104;
  CGFloat height = v106;
  int v108 = (v189 || v185) | v98 | v99;
  if (((v108 | v188) & 1) == 0)
  {
    memset(&v245, 0, sizeof(v245));
    +[UIScreen transformForScreenOriginRotation:v97];
    CGAffineTransform v244 = v245;
    v250.origin.x = v101;
    v250.origin.y = v103;
    v250.size.CGFloat width = width;
    v250.size.CGFloat height = height;
    CGRect v251 = CGRectApplyAffineTransform(v250, &v244);
    CGFloat width = v251.size.width;
    CGFloat height = v251.size.height;
    -[UITransitionView setBounds:](self->_transitionView, "setBounds:", v101, v103);
    CGAffineTransform v243 = v247;
    [(UIView *)self->_transitionView setTransform:&v243];
    if (v28)
    {
      if (!v28[62]) {
        v28[62] = v45;
      }
    }
  }
  v109 = [(UIView *)self->_transitionView superview];
  BOOL v110 = v109 == 0;

  if (v110)
  {
    if (v70)
    {
      [v182 addSubview:self->_transitionView];
    }
    else
    {
      v111 = [v182 subviews];
      uint64_t v112 = [v111 indexOfObjectIdenticalTo:v62];

      [v182 insertSubview:self->_transitionView atIndex:v112];
    }
  }
  if ((v175 | v174))
  {
    id v113 = 0;
  }
  else
  {
    id v113 = [(UIViewController *)v192 _visibleView];
  }
  if (!v167 || v185)
  {
    v114 = [(UIViewController *)v192 view];
    goto LABEL_182;
  }
  if (v187 == (void *)3 && !v184 && v181 != 3)
  {
    v114 = 0;
LABEL_182:

    goto LABEL_184;
  }
  v114 = v113;
LABEL_184:
  char v115 = v108 ^ 1;
  if ((v115 & 1) != 0 || v188)
  {
    long long v116 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v242[0] = *MEMORY[0x1E4F1DAB8];
    long long v168 = v242[0];
    long long v164 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v165 = v116;
    v242[1] = v116;
    v242[2] = v164;
    [v62 setTransform:v242];
    v117 = self->_transitionView;
    [v62 center];
    -[UIView convertPoint:fromView:](v117, "convertPoint:fromView:", v182);
    objc_msgSend(v62, "setCenter:");
    v241[0] = v168;
    v241[1] = v165;
    v241[2] = v164;
    [v114 setTransform:v241];
  }
  v245.a = 0.0;
  *(void *)&v245.b = &v245;
  *(void *)&v245.c = 0x2020000000;
  LOBYTE(v245.d) = 1;
  if (v62) {
    char v118 = v185;
  }
  else {
    char v118 = 1;
  }
  if ((v118 & 1) == 0) {
    [(UIWindowController *)self _transplantView:v62 toSuperview:self->_transitionView atIndex:0];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke;
  aBlock[3] = &unk_1E52EA5D8;
  aBlock[4] = self;
  v227 = &v245;
  char v236 = v186;
  char v237 = v115;
  char v238 = v188;
  uint64_t v228 = v45;
  v229 = v187;
  v119 = v192;
  v222 = v119;
  id v120 = v62;
  id v223 = v120;
  id v121 = v114;
  id v224 = v121;
  int v235 = a3;
  double v230 = v101;
  double v231 = v103;
  CGFloat v232 = width;
  CGFloat v233 = height;
  id v169 = v182;
  id v225 = v169;
  v183 = v28;
  id v226 = v183;
  char v239 = v98;
  CGAffineTransform v234 = v247;
  char v240 = v180;
  v122 = (void (**)(void))_Block_copy(aBlock);
  v122[2]();
  v123 = [(UIView *)self->_transitionView window];
  v124 = __UIStatusBarManagerForWindow(v123);
  [v124 statusBarHeight];
  double v126 = v125;

  self->_needsDidDisappear = 0;
  int v127 = a3 == 13 || v172;
  if ((((v186 | v189) | v179) & 1) == 0 && (v127 & 1) == 0)
  {
    [(UIViewController *)v193 beginAppearanceTransition:0 animated:a3 != 0];
    self->_needsDidDisappear = 1;
  }
  self->_needsDidAppear = 0;
  BOOL v128 = a3 != 14 && v166;
  if ((v185 | v175 | v174) != 1 && v128)
  {
    [(UIViewController *)v119 beginAppearanceTransition:1 animated:a3 != 0];
    self->_needsDidAppear = 1;
  }
  v129 = [(UIView *)self->_transitionView window];
  v130 = __UIStatusBarManagerForWindow(v129);
  [v130 statusBarHeight];
  double v132 = v131;

  if (v126 != v132)
  {
    ((void (*)(void (**)(void)))v122[2])(v122);
    v133 = [(UIView *)self->_transitionView window];
    v134 = __UIStatusBarManagerForWindow(v133);
    [v134 statusBarHeight];
    double v126 = v135;
  }
  if ((v188 & 1) == 0 && ([(id)UIApp _hasApplicationCalledLaunchDelegate] & 1) == 0) {
    [v183 _updateToInterfaceOrientation:v45 duration:0 force:0.0];
  }
  v136 = [(UIWindowController *)self _interactionController];
  BOOL v137 = v136 != 0;

  uint64_t v138 = (a3 != 14) & (((v189 || v179) | v127) ^ 1u);
  if (v173)
  {
    [(UIWindowController *)self _setInteractiveTransition:0];
    if (v136) {
      [(UIWindowController *)self _setInteractiveTransition:1];
    }
    if (v184) {
      v139 = v187;
    }
    else {
      v139 = (void *)v181;
    }
    if ((v180 & 1) == 0)
    {
      [val setToView:v121];
      [val setFromView:v120];
      [val setRemoveFromView:v138];
    }
    [(_UIViewControllerTransitionContext *)v190 _setPresentationStyle:v139];
    [(_UIViewControllerTransitionContext *)v190 _setIsPresentation:v189];
    [(_UIViewControllerTransitionContext *)v190 _setIsAnimated:a3 != 0];
    [(_UIViewControllerOneToOneTransitionContext *)v190 _setFromViewController:v193];
    [(_UIViewControllerOneToOneTransitionContext *)v190 _setToViewController:v119];
    [(_UIViewControllerTransitionContext *)v190 _setContainerView:self->_transitionView];
    v140 = (double *)MEMORY[0x1E4F1DB28];
    if (v189)
    {
      double v141 = *MEMORY[0x1E4F1DB28];
      double v142 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v143 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v144 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      v139 = [(UIViewController *)v119 view];
      [v139 frame];
    }
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v190, "_setToEndFrame:", v141, v142, v143, v144);
    if (!v189) {

    }
    v145 = [(UIViewController *)v193 view];
    [v145 frame];
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v190, "_setFromStartFrame:");

    double v146 = *v140;
    double v147 = v140[1];
    double v148 = v140[2];
    double v149 = v140[3];
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v190, "_setToStartFrame:", *v140, v147, v148, v149);
    if ((v138 & 1) == 0)
    {
      v145 = [(UIViewController *)v193 view];
      [v145 frame];
      double v146 = v150;
      double v147 = v151;
      double v148 = v152;
      double v149 = v153;
    }
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v190, "_setFromEndFrame:", v146, v147, v148, v149);
    if ((v138 & 1) == 0) {

    }
    v154 = [(UIWindowController *)self _interactionController];
    [(_UIViewControllerTransitionContext *)v190 _setInteractor:v154];

    [v183 beginDisablingInterfaceAutorotation];
    if (v178)
    {
      v155 = [(_UIViewControllerTransitionContext *)v190 _transitionCoordinator];
      v219[0] = MEMORY[0x1E4F143A8];
      v219[1] = 3221225472;
      v219[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_2;
      v219[3] = &unk_1E52DA110;
      v220 = v178;
      [v155 animateAlongsideTransition:v219 completion:0];
    }
    objc_initWeak((id *)&v244, val);
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_3;
    v212[3] = &unk_1E52EA600;
    char v217 = v180;
    v212[4] = self;
    id v213 = v120;
    id v214 = v121;
    char v218 = v138;
    objc_copyWeak(&v216, (id *)&v244);
    v215 = v183;
    [(_UIViewControllerTransitionContext *)v190 _setCompletionHandler:v212];
    if (v136)
    {
      [(_UIViewControllerTransitionContext *)v190 _setInteractiveUpdateHandler:&__block_literal_global_145];
      [(_UIViewControllerTransitionContext *)v190 _setTransitionIsCompleting:0];
    }

    objc_destroyWeak(&v216);
    objc_destroyWeak((id *)&v244);
  }
  else if (v178)
  {
    v178[2]();
  }
  v194[0] = MEMORY[0x1E4F143A8];
  v194[1] = 3221225472;
  v194[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_5;
  v194[3] = &unk_1E52EA628;
  int v205 = a3;
  v194[4] = self;
  double v203 = v126;
  v156 = v122;
  v202 = v156;
  id v157 = val;
  id v195 = v157;
  v158 = v190;
  v196 = v158;
  BOOL v206 = v189;
  v197 = v119;
  v198 = v193;
  char v207 = v138;
  id v199 = v176;
  int64_t v204 = a7;
  id v159 = v121;
  id v200 = v159;
  char v208 = v180;
  BOOL v209 = v137;
  id v160 = v120;
  id v201 = v160;
  BOOL v210 = v179;
  BOOL v211 = v172;
  v161 = _Block_copy(v194);
  v162 = v161;
  char v163 = v173 ^ 1;
  if ((a3 & 0xFFFFFFFE) == 0xA) {
    char v163 = 0;
  }
  if (v163) {
    (*((void (**)(void *))v161 + 2))(v161);
  }
  else {
    [(id)UIApp _performBlockAfterCATransactionCommits:v161];
  }

  _Block_object_dispose(&v245, 8);
LABEL_239:
}

void __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) window];
  id v3 = __UIStatusBarManagerForWindow(v2);
  [v3 defaultStatusBarHeightInOrientation:*(void *)(a1 + 88)];
  double v5 = v4;

  BOOL v6 = v5 != 0.0 && *(unsigned char *)(a1 + 188) == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v6;
  if (*(unsigned char *)(a1 + 189)) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 88);
  }
  int64x2_t v8 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(*(void *)(a1 + 32) + 64) = v8;
  *(int64x2_t *)(*(void *)(a1 + 32) + 80) = v8;
  if (*(unsigned char *)(a1 + 190) || *(void *)(a1 + 96) == 4)
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v26 = *(void **)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 40);
    double v28 = [*(id *)(a1 + 48) window];
    v29 = __UIStatusBarManagerForWindow(v28);
    [v29 defaultStatusBarHeightInOrientation:*(void *)(a1 + 88)];
    double v31 = v30;

    uint64_t v32 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    BOOL v33 = [*(id *)(a1 + 48) window];
    [v26 _originForViewController:v27 orientation:v7 actualStatusBarHeight:v32 fullScreenLayout:v33 inWindow:v31];
    double v9 = v34;
    double v10 = v35;
  }
  if (!*(void *)(a1 + 56)) {
    return;
  }
  if (*(unsigned char *)(a1 + 190) || *(void *)(a1 + 96) == 4)
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v36 = *(void **)(a1 + 32);
    uint64_t v37 = *(void *)(a1 + 40);
    uint64_t v38 = *(unsigned int *)(a1 + 184);
    uint64_t v39 = *(void *)(a1 + 88);
    uint64_t v40 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v41 = [*(id *)(a1 + 48) window];
    [v36 _boundsForViewController:v37 transition:v38 orientation:v39 fullScreenLayout:v40 inWindow:v41];
    double v11 = v42;
    double v12 = v43;
    double v14 = v44;
    double v13 = v45;
  }
  uint64_t v15 = *(void *)(a1 + 96);
  if (v15 == 4)
  {
    [*(id *)(a1 + 56) bounds];
    double v11 = v16;
    double v12 = v17;
    double v14 = v18;
    double v13 = v19;
    goto LABEL_29;
  }
  if (*(unsigned char *)(a1 + 190))
  {
    [*(id *)(a1 + 48) bounds];
    double v11 = v20;
    double v12 = v21;
    double v14 = v22;
    double v13 = v23;
    [*(id *)(a1 + 48) frame];
LABEL_18:
    double v9 = v24;
    double v10 = v25;
    goto LABEL_29;
  }
  if (v15 == 16 || v15 == 2)
  {
    [*(id *)(a1 + 40) formSheetSize];
    double v9 = v9 + (v14 - v51) * 0.5;
    double v10 = v10 + (v13 - v52) * 0.5;
    double v13 = v52;
    double v14 = v51;
    goto LABEL_29;
  }
  if (v15 == 1)
  {
    BOOL v46 = +[UIScreen mainScreen];
    [v46 _referenceBounds];
    double v48 = v47;

    if (v14 > v48)
    {
      v49 = +[UIScreen mainScreen];
      [v49 _referenceBounds];
      double v14 = v50;
    }
    double v9 = (*(double *)(a1 + 120) - v14) * 0.5;
    double v10 = *(double *)(a1 + 128) - v13;
    goto LABEL_29;
  }
  if (!*(unsigned char *)(a1 + 188))
  {
    objc_msgSend(*(id *)(a1 + 64), "convertPoint:fromView:", *(void *)(a1 + 72), v9, v10);
    goto LABEL_18;
  }
LABEL_29:
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v54 = *(void **)(a1 + 56);
  if (isKindOfClass)
  {
    [v54 contentOffset];
    double v11 = v55;
    double v12 = v56;
    v54 = *(void **)(a1 + 56);
  }
  objc_msgSend(v54, "setBounds:", v11, v12, v14, v13);
  uint64_t v57 = *(void *)(a1 + 32);
  *(double *)(v57 + 80) = v9;
  *(double *)(v57 + 88) = v10;
  objc_msgSend(*(id *)(a1 + 56), "setOrigin:", v9, v10);
  unsigned int v58 = *(_DWORD *)(a1 + 184);
  if (v58 <= 0x14 && ((1 << v58) & 0x137E40) != 0)
  {
    uint64_t v59 = *(void *)(a1 + 32);
    *(double *)(v59 + 64) = v9;
    *(double *)(v59 + 72) = v10;
  }
  if (!*(unsigned char *)(a1 + 189) && !*(unsigned char *)(a1 + 190) && !*(unsigned char *)(a1 + 191))
  {
    long long v61 = *(_OWORD *)(a1 + 152);
    v63[0] = *(_OWORD *)(a1 + 136);
    v63[1] = v61;
    v63[2] = *(_OWORD *)(a1 + 168);
    [*(id *)(a1 + 56) setTransform:v63];
    uint64_t v62 = *(void *)(a1 + 72);
    if (v62)
    {
      if (!*(void *)(v62 + 496)) {
        *(void *)(v62 + 496) = *(void *)(a1 + 88);
      }
    }
  }
  [*(id *)(a1 + 56) frame];
  if (*(unsigned char *)(a1 + 192) || (unsigned int v60 = *(_DWORD *)(a1 + 184), v60 <= 0x11) && ((1 << v60) & 0x32041) != 0) {
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", v9, v10);
  }
}

uint64_t __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if (!*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 32) _setTransitionController:0];
    [*(id *)(a1 + 32) _setInteractionController:0];
    [*(id *)(a1 + 32) _setInteractiveTransition:0];
  }
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5[1];
  uint64_t v8 = *(void *)(a1 + 48);
  if (a3) {
    [v5 transitionViewDidComplete:v7 fromView:v6 toView:v8 removeFromView:*(unsigned __int8 *)(a1 + 73)];
  }
  else {
    [v5 transitionViewDidCancel:v7 fromView:v6 toView:v8];
  }
  double v9 = [v12 _postInteractiveCompletionHandler];

  if (v9)
  {
    double v10 = [v12 _postInteractiveCompletionHandler];
    v10[2]();

    [v12 _setPostInteractiveCompletionHandler:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained animationEnded:a3];
  }
  [v12 _setTransitionIsInFlight:0];
  [v12 _setInteractor:0];
  [v12 _setAnimator:0];
  [*(id *)(a1 + 56) endDisablingInterfaceAutorotation];
}

void __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_5(uint64_t a1)
{
  BOOL v2 = (*(_DWORD *)(a1 + 120) & 0xFFFFFFFE) == 10;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) window];
  double v4 = __UIStatusBarManagerForWindow(v3);
  [v4 statusBarHeight];
  double v6 = v5;

  double v7 = *(double *)(a1 + 104);
  if (v7 != v6 && (v7 == 0.0 || v6 == 0.0))
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    if (*(void *)(a1 + 40))
    {
      uint64_t v8 = *(void **)(a1 + 48);
      int v9 = *(unsigned __int8 *)(a1 + 124);
      double v10 = (double *)MEMORY[0x1E4F1DB28];
      if (*(unsigned char *)(a1 + 124))
      {
        double v11 = *MEMORY[0x1E4F1DB28];
        double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      else
      {
        double v4 = [*(id *)(a1 + 56) view];
        [v4 frame];
      }
      objc_msgSend(v8, "_setToEndFrame:", v11, v12, v13, v14);
      if (!v9) {

      }
      uint64_t v15 = *(void **)(a1 + 48);
      double v16 = [*(id *)(a1 + 64) view];
      [v16 frame];
      objc_msgSend(v15, "_setFromStartFrame:");

      double v17 = *v10;
      double v18 = v10[1];
      double v19 = v10[2];
      double v20 = v10[3];
      objc_msgSend(*(id *)(a1 + 48), "_setToStartFrame:", *v10, v18, v19, v20);
      double v21 = *(void **)(a1 + 48);
      if (*(unsigned char *)(a1 + 125))
      {
        objc_msgSend(*(id *)(a1 + 48), "_setFromEndFrame:", v17, v18, v19, v20);
      }
      else
      {
        double v22 = [*(id *)(a1 + 64) view];
        [v22 frame];
        objc_msgSend(v21, "_setFromEndFrame:");
      }
    }
    BOOL v2 = 1;
  }
  double v23 = *(void **)(a1 + 32);
  uint64_t v24 = *(unsigned int *)(a1 + 120);
  double v25 = [*(id *)(a1 + 64) view];
  [v23 _prepareKeyboardForTransition:v24 fromView:v25];

  *(_DWORD *)(*(void *)(a1 + 32) + 24) = *(_DWORD *)(a1 + 120);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 72));
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 112);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 64));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 56));
  if (v2) {
    [*(id *)(a1 + 56) _updateLayoutForStatusBarAndInterfaceOrientation];
  }
  int v26 = *(_DWORD *)(a1 + 120);
  if (!v26 || v26 == 14)
  {
    uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 56) view];
    double v28 = v27;
    uint64_t v29 = 1;
    goto LABEL_21;
  }
  if (v26 == 13)
  {
    uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 48) view];
    double v28 = v27;
    uint64_t v29 = 0;
LABEL_21:
    [v27 setUserInteractionEnabled:v29];

    int v26 = *(_DWORD *)(a1 + 120);
  }
  if (v26 == 17 || v26 == 13) {
    [*(id *)(a1 + 80) layoutIfNeeded];
  }
  double v30 = *(void **)(a1 + 40);
  if (v30)
  {
    [v30 transitionDuration:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 48), "_setDuration:");
    if (*(unsigned char *)(a1 + 126)) {
      [*(id *)(a1 + 32) transitionViewDidStart:*(void *)(*(void *)(a1 + 32) + 8)];
    }
    if (*(unsigned char *)(a1 + 127))
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_6;
      v47[3] = &unk_1E52D9F70;
      double v31 = &v48;
      id v48 = *(id *)(a1 + 48);
      +[UIView _setAlongsideAnimations:v47];
      uint64_t v32 = [*(id *)(a1 + 32) _interactionController];
      [v32 startInteractiveTransition:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      double v44 = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_7;
      double v45 = &unk_1E52D9F70;
      double v31 = &v46;
      id v46 = *(id *)(a1 + 48);
      +[UIView _setAlongsideAnimations:&v42];
      objc_msgSend(*(id *)(a1 + 40), "animateTransition:", *(void *)(a1 + 48), v42, v43, v44, v45);
    }
    uint64_t v38 = +[UIView _alongsideAnimations];

    if (v38)
    {
      objc_msgSend(*(id *)(a1 + 48), "__runAlongsideAnimations");
      +[UIView _setAlongsideAnimations:0];
    }

    uint64_t v39 = [*(id *)(a1 + 48) _animator];

    if (v39) {
      [*(id *)(a1 + 48) _setTransitionIsInFlight:1];
    }
  }
  else
  {
    BOOL v33 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v34 = *(unsigned int *)(a1 + 120);
    uint64_t v36 = *(void *)(a1 + 80);
    uint64_t v35 = *(void *)(a1 + 88);
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v37 = 0;
    }
    else
    {
      if (*(unsigned char *)(a1 + 129)) {
        BOOL v40 = 1;
      }
      else {
        BOOL v40 = v34 == 13;
      }
      uint64_t v37 = !v40 && v34 != 14;
    }
    [v33 transition:v34 fromView:v35 toView:v36 removeFromView:v37];
  }
}

uint64_t __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

uint64_t __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

- (void)transitionViewDidStart:(id)a3
{
  if (self->_transitionView == a3
    && ![(UIViewController *)self->_toViewController _containsFirstResponder])
  {
    toViewController = self->_toViewController;
    [(UIResponder *)toViewController becomeFirstResponder];
  }
}

- (void)transitionViewDidCancel:(id)a3 fromView:(id)a4 toView:(id)a5
{
  id v28 = a3;
  id v7 = a4;
  uint64_t v8 = [v28 superview];
  int v9 = [(UIWindowController *)self _transitionController];
  if (![(UIWindowController *)self _isInteractiveTransition]) {
    goto LABEL_35;
  }
  if (v9)
  {
    double v10 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v9];
    BOOL v11 = [v10 presentationStyle] == 4;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v11 = 0;
    double v10 = 0;
    if (!v7) {
      goto LABEL_8;
    }
  }
  if (!v11)
  {
    double v12 = [v28 superview];
    double v13 = [v12 subviews];
    uint64_t v14 = [v13 indexOfObjectIdenticalTo:v28];

    [(UIWindowController *)self _transplantView:v7 toSuperview:v8 atIndex:v14];
  }
LABEL_8:
  if (v10) {
    [v10 _setContainerView:0];
  }
  uint64_t v15 = [(UITransitionView *)self->_transitionView delegate];

  if (v15 == self)
  {
    [(UITransitionView *)self->_transitionView setDelegate:0];
    if (v11) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (!v11) {
LABEL_12:
  }
    [v28 removeFromSuperview];
LABEL_13:
  transitionView = self->_transitionView;
  self->_transitionView = 0;

  double v17 = (UIViewController *)self->_target;
  double v18 = self->_fromViewController;
  double v19 = self->_toViewController;
  self->_currentTransition = 0;
  id target = self->_target;
  self->_id target = 0;

  fromViewController = self->_fromViewController;
  self->_didFinish = 0;
  self->_fromViewController = 0;

  toViewController = self->_toViewController;
  self->_toViewController = 0;

  if (v10)
  {
    if (v17)
    {
      if ([v10 _isPresentation])
      {
        if (objc_opt_respondsToSelector()) {
          [(UIViewController *)v17 _didCancelPresentTransition:v10];
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        [(UIViewController *)v17 _didCancelDismissTransition:v10];
      }
    }
    [(UIWindowController *)self _setTransitionController:0];
    [(UIWindowController *)self _setInteractionController:0];
    [(UIWindowController *)self _setInteractiveTransition:0];
  }
  BOOL needsDidDisappear = self->_needsDidDisappear;
  BOOL needsDidAppear = self->_needsDidAppear;
  *(_WORD *)&self->_BOOL needsDidAppear = 0;
  self->_BOOL presenting = 0;
  if (needsDidAppear)
  {
    if (v17 == v19) {
      [(UIViewController *)v17 setInAnimatedVCTransition:1];
    }
    [(UIViewController *)v19 setFinishingModalTransition:1];
    [(UIViewController *)v19 cancelBeginAppearanceTransition];
    [(UIViewController *)v19 setFinishingModalTransition:0];
  }
  if (needsDidDisappear)
  {
    if (v17 == v18) {
      [(UIViewController *)v17 setInAnimatedVCTransition:1];
    }
    [(UIViewController *)v18 cancelBeginAppearanceTransition];
  }
  if ([v10 _isPresentation])
  {
    [(UIViewController *)v19 _presentingViewControllerWillChange:0];
    double v25 = v19;
    int v26 = 0;
  }
  else
  {
    [(UIViewController *)v18 _presentingViewControllerWillChange:v19];
    double v25 = v18;
    int v26 = v19;
  }
  [(UIViewController *)v25 _presentingViewControllerDidChange:v26];
  [(UIViewController *)v18 setPerformingModalTransition:0];
  [(UIViewController *)v19 setPerformingModalTransition:0];
  [(UIViewController *)v18 _windowControllerTransitionDidCancel];
  uint64_t v27 = [v8 keyboardSceneDelegate];
  [v27 popAnimationStyle];

LABEL_35:
}

- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(UIWindowController *)self _transitionController];
  id v46 = v12;
  BOOL v45 = [(UIWindowController *)self _isInteractiveTransition];
  if (v13)
  {
    uint64_t v14 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v13];
    uint64_t v15 = [v14 presentationStyle];
    double v47 = [v10 superview];
    if (v15 == 4)
    {
      uint64_t v16 = 0;
      LOBYTE(v12) = 1;
      if (!v11) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }
  }
  else
  {
    double v47 = [v10 superview];
    uint64_t v14 = 0;
  }
  if (v10)
  {
    [v10 transform];
    if (CGAffineTransformIsIdentity(&v56)) {
      goto LABEL_12;
    }
    [v10 transform];
  }
  else
  {
    memset(&v56, 0, sizeof(v56));
    if (CGAffineTransformIsIdentity(&v56)) {
      goto LABEL_12;
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v53 = 0u;
  }
  v52[0] = v53;
  v52[1] = v54;
  v52[2] = v55;
  [v12 setTransform:v52];
  [v12 center];
  objc_msgSend(v47, "convertPoint:fromView:", v10);
  objc_msgSend(v12, "setCenter:");
LABEL_12:
  if (!v12)
  {
    uint64_t v16 = 0;
    if (!v11) {
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  double v17 = [v10 superview];
  uint64_t v18 = [v17 subviews];
  uint64_t v16 = [(id)v18 indexOfObjectIdenticalTo:v10];

  [(UIWindowController *)self _transplantView:v12 toSuperview:v47 atIndex:v16];
  double v19 = [v10 superview];
  objc_opt_class();
  LOBYTE(v18) = objc_opt_isKindOfClass();

  if (v18)
  {
    double v20 = [v10 superview];
    [v20 setContentView:v12];

    double v21 = [(UIViewController *)self->_fromViewController dropShadowView];
    [(UIViewController *)self->_toViewController setDropShadowView:v21];

    [(UIViewController *)self->_fromViewController setDropShadowView:0];
  }
  LOBYTE(v12) = 0;
  if (v11)
  {
LABEL_18:
    if (!v6
      && ([(UIViewController *)self->_toViewController modalTransitionStyle] == UIModalTransitionStylePartialCurl
       || [(UIViewController *)self->_toViewController modalPresentationStyle] == 18))
    {
      if ([(UIViewController *)self->_toViewController modalTransitionStyle] == UIModalTransitionStylePartialCurl) {
        ++v16;
      }
      if (v10)
      {
        [v10 transform];
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v49 = 0u;
      }
      v48[0] = v49;
      v48[1] = v50;
      v48[2] = v51;
      [v11 setTransform:v48];
      [(UIWindowController *)self _transplantView:v11 toSuperview:v47 atIndex:v16];
      [v11 center];
      objc_msgSend(v47, "convertPoint:fromView:", v10);
      objc_msgSend(v11, "setCenter:");
    }
  }
LABEL_27:
  double v22 = [(UIViewController *)self->_fromViewController currentAction];
  [(UITransitionView *)self->_transitionView _curlUpRevealedHeight];
  if (v22) {
    v22[4] = v23;
  }

  if ((v12 & 1) == 0)
  {
    uint64_t v24 = v10;
    goto LABEL_34;
  }
  if (v11 && v6)
  {
    uint64_t v24 = v11;
LABEL_34:
    [v24 removeFromSuperview];
  }
  if (v14) {
    [v14 _setContainerView:0];
  }
  double v25 = [(UITransitionView *)self->_transitionView delegate];

  if (v25 == self) {
    [(UITransitionView *)self->_transitionView setDelegate:0];
  }
  double v44 = (void *)v13;
  int v26 = v11;
  transitionView = self->_transitionView;
  self->_transitionView = 0;

  uint64_t v43 = v14;
  if (v14)
  {
    [(UIWindowController *)self _setTransitionController:0];
    [(UIWindowController *)self _setInteractionController:0];
    [(UIWindowController *)self _setInteractiveTransition:0];
  }
  id v28 = (UIViewController *)self->_target;
  int64_t didFinish = self->_didFinish;
  double v30 = self->_fromViewController;
  double v31 = self->_toViewController;
  int currentTransition = self->_currentTransition;
  if (objc_opt_respondsToSelector())
  {
    BOOL v33 = [(UIViewController *)v28 _completionBlock];
    uint64_t v34 = (void (**)(void *, uint64_t))_Block_copy(v33);
  }
  else
  {
    uint64_t v34 = 0;
  }
  self->_int currentTransition = 0;
  id target = self->_target;
  self->_id target = 0;

  fromViewController = self->_fromViewController;
  self->_int64_t didFinish = 0;
  self->_fromViewController = 0;

  toViewController = self->_toViewController;
  self->_toViewController = 0;

  if (v28)
  {
    if (didFinish == 2)
    {
      if (objc_opt_respondsToSelector()) {
        [(UIViewController *)v28 _didFinishDismissTransition];
      }
    }
    else if (didFinish == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(UIViewController *)v28 _didFinishPresentTransition];
    }
  }
  BOOL needsDidDisappear = self->_needsDidDisappear;
  BOOL needsDidAppear = self->_needsDidAppear;
  BOOL presenting = self->_presenting;
  *(_WORD *)&self->_BOOL needsDidAppear = 0;
  self->_BOOL presenting = 0;
  if (needsDidAppear)
  {
    if (currentTransition && v28 == v31) {
      [(UIViewController *)v28 setInAnimatedVCTransition:1];
    }
    [(UIViewController *)v31 setFinishingModalTransition:1];
    [(UIViewController *)v31 endAppearanceTransition];
    [(UIViewController *)v31 setFinishingModalTransition:0];
  }
  if (needsDidDisappear)
  {
    if (currentTransition && v28 == v30) {
      [(UIViewController *)v28 setInAnimatedVCTransition:1];
    }
    [(UIViewController *)v30 endAppearanceTransition];
  }
  [(UIViewController *)v30 setPerformingModalTransition:0];
  [(UIViewController *)v31 setPerformingModalTransition:0];
  if (presenting)
  {
    [(UIViewController *)v31 _presentingViewControllerDidChange:v30];
    uint64_t v41 = -[UIViewController _modalPreservedFirstResponder]((id *)&v30->super.super.isa);
    [v41 _becomeFirstResponderWhenPossible];
  }
  else
  {
    [(UIViewController *)v30 _presentingViewControllerDidChange:0];
  }
  if (v34) {
    v34[2](v34, 1);
  }
  uint64_t v42 = [v47 keyboardSceneDelegate];
  [v42 popAnimationStyle];

  if (!v45) {
    [(id)UIApp endIgnoringInteractionEvents];
  }
}

- (double)durationForTransition:(int)a3
{
  +[UIViewController durationForTransition:*(void *)&a3];
  return result;
}

- (CGPoint)_adjustOrigin:(CGPoint)result givenOtherOrigin:(CGPoint)a4 forTransition:(int)a5
{
  if ((a5 - 1) >= 2)
  {
    if (((1 << a5) & 0x1C1388) == 0) {
      a4.x = result.x;
    }
    if (a5 <= 0x14) {
      result.x = a4.x;
    }
    a4.double y = result.y;
  }
  double y = a4.y;
  result.double y = y;
  return result;
}

- (void)transitionView:(id)a3 startCustomTransitionWithDuration:(double)a4
{
  id v6 = a3;
  int currentTransition = self->_currentTransition;
  if (currentTransition == 17)
  {
    id v9 = v6;
    uint64_t v8 = 48;
  }
  else
  {
    if (currentTransition != 16) {
      goto LABEL_6;
    }
    id v9 = v6;
    uint64_t v8 = 56;
  }
  [*(id *)((char *)&self->super.isa + v8) _startPresentCustomTransitionWithDuration:a4];
  id v6 = v9;
LABEL_6:
}

- (CGPoint)transitionView:(id)a3 endOriginForFromView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v8 = *(void *)&a5;
  objc_msgSend(a4, "frame", a3);
  -[UIWindowController _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", v8, x, y, v10, v11);
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)transitionView:(id)a3 beginOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double x = self->_beginOriginForToView.x;
  double y = self->_beginOriginForToView.y;
  if (x == 1.79769313e308 && y == 1.79769313e308)
  {
    -[UIWindowController _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", *(void *)&a5, a4, a6.x, a6.y, self->_endOriginForToView.x, self->_endOriginForToView.y);
    double x = v9;
    double y = v10;
  }
  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)transitionView:(id)a3 endOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  CGFloat y = a6.y;
  double x = a6.x;
  id v9 = a3;
  double v10 = [v9 keyboardSceneDelegate];
  [v10 visibleFrameInView:0];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  if (self->_endOriginForToView.x != 1.79769313e308 || self->_endOriginForToView.y != 1.79769313e308)
  {
    if (self->_presenting
      && ((int64_t toModalStyle = self->_toModalStyle, toModalStyle == 16) || toModalStyle == 2)
      && (v30.origin.x = v12, v30.origin.y = v14, v30.size.CGFloat width = v16, v30.size.height = v18, !CGRectIsEmpty(v30))
      && (unint64_t)([(UIViewController *)self->_toViewController interfaceOrientation] - 3) <= 1)
    {
      [v9 bounds];
      double v22 = v21;
      [(UIViewController *)self->_toViewController formSheetSize];
      double x = (v22 - v23) * 0.5;
      uint64_t v24 = [v9 window];
      double v25 = __UIStatusBarManagerForWindow(v24);
      [v25 defaultStatusBarHeightInOrientation:1];
      CGFloat y = v26;
    }
    else
    {
      double x = self->_endOriginForToView.x;
      CGFloat y = self->_endOriginForToView.y;
    }
  }

  double v27 = x;
  double v28 = y;
  result.CGFloat y = v28;
  result.double x = v27;
  return result;
}

- (BOOL)transitionViewShouldUseViewControllerCallbacks
{
  return 0;
}

- (UITransitionView)transitionView
{
  return self->_transitionView;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_BOOL presenting = a3;
}

- (UIViewControllerAnimatedTransitioning)_transitionController
{
  return self->_transitionController;
}

- (void)_setTransitionController:(id)a3
{
}

- (UIViewControllerInteractiveTransitioning)_interactionController
{
  return self->_interactionController;
}

- (void)_setInteractionController:(id)a3
{
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)_isInteractiveTransition
{
  return self->__interactiveTransition;
}

- (void)_setInteractiveTransition:(BOOL)a3
{
  self->__interactiveTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong(&self->_target, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_transitionView, 0);
}

@end