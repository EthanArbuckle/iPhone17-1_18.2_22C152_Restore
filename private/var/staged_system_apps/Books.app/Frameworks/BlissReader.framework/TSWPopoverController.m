@interface TSWPopoverController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasGradientBackground;
- (BOOL)isDismissing;
- (BOOL)isPopoverVisible;
- (BOOL)shouldDismissWhileRotating:(BOOL)a3;
- (CAShapeLayer)strokeLayer;
- (CGPath)p_newMaskPathWithBounds:(CGRect)a3 cornerRadius:(double)a4 arrowDirection:(unint64_t)a5 arrowBounds:(CGRect)a6;
- (CGPoint)p_popoverCenterForArrowDirection:(unint64_t)a3 targetRect:(CGRect)a4 targetBounds:(CGRect)a5;
- (CGRect)boundsIncludingStroke;
- (CGRect)p_arrowBoundsForArrowDirection:(unint64_t)a3 targetPoint:(CGPoint)a4;
- (CGSize)originalViewSize;
- (NSArray)passThroughGestureRecognizers;
- (TSDStroke)stroke;
- (TSUColor)backgroundColor;
- (TSWClipView)clipView;
- (TSWPopUpInfo)popUpInfo;
- (TSWPopoverController)initWithContentProvider:(id)a3;
- (TSWPopoverControllerContentProvider)contentProvider;
- (TSWPopoverControllerDelegate)delegate;
- (TSWPopoverTheme)theme;
- (UIButton)closeButton;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)fadeInsets;
- (UIEdgeInsets)fadeSizes;
- (UIGestureRecognizer)dismissGR;
- (UITapGestureRecognizer)doubleTapGR;
- (UIView)backgroundView;
- (UIView)scrimView;
- (double)cornerRadius;
- (int)displayMode;
- (unint64_t)p_arrowDirectionForTargetRect:(CGRect)a3 targetBounds:(CGRect)a4 permittedDirections:(unint64_t)a5;
- (void)dealloc;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)handleClose:(id)a3;
- (void)loadView;
- (void)pFadeInIncludeScrim:(BOOL)a3;
- (void)p_customizeWithTheme:(id)a3;
- (void)p_didFade;
- (void)p_handleDismissGR:(id)a3;
- (void)p_handleDoubleTapGR:(id)a3;
- (void)p_updateAppearanceForArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4;
- (void)p_updateBackgroundViewWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4;
- (void)p_updateClipViewWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4;
- (void)p_updateStrokeLayerWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4;
- (void)p_willFade;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 viewBounds:(CGRect)a5 permittedArrowDirections:(unint64_t)a6 displayMode:(int)a7 animated:(BOOL)a8;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setClipView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissGR:(id)a3;
- (void)setDisplayMode:(int)a3;
- (void)setDoubleTapGR:(id)a3;
- (void)setFadeInsets:(UIEdgeInsets)a3;
- (void)setFadeSizes:(UIEdgeInsets)a3;
- (void)setHasGradientBackground:(BOOL)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setOriginalViewSize:(CGSize)a3;
- (void)setPassThroughGestureRecognizers:(id)a3;
- (void)setScrimView:(id)a3;
- (void)setStroke:(id)a3;
- (void)setStrokeLayer:(id)a3;
- (void)setTheme:(id)a3;
@end

@implementation TSWPopoverController

- (TSWPopoverController)initWithContentProvider:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController initWithContentProvider:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:98 description:@"invalid nil value for '%s'", "contentProvider"];
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWPopoverController;
  v5 = [(TSWPopoverController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v5->_contentProvider = (TSWPopoverControllerContentProvider *)a3;
      if ([(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)v6 contentProvider] popoverTheme])
      {
        v7 = (TSWPopoverTheme *)[(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)v6 contentProvider] popoverTheme];
      }
      else
      {
        v7 = objc_alloc_init(TSWPopoverTheme);
      }
      [(TSWPopoverController *)v6 p_customizeWithTheme:v7];
      v6->_popUpInfo = (TSWPopUpInfo *)[(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)v6 contentProvider] popupInfo];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  if (self->_dismissGR) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:121 description:@"expected nil value for '%s'", "_dismissGR"];
  }

  [(TSWPopoverControllerContentProvider *)self->_contentProvider teardown];
  v3.receiver = self;
  v3.super_class = (Class)TSWPopoverController;
  [(TSWPopoverController *)&v3 dealloc];
}

- (void)loadView
{
  -[TSWPopoverController setView:[objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
  objc_super v3 = [TSWClipView alloc];
  [self view].bounds;
  self->_clipView = -[TSWClipView initWithFrame:](v3, "initWithFrame:");
  [self->_clipView addSubview:[self view]];
  clipView = self->_clipView;
  id v5 = [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] popoverContentView];

  [(TSWClipView *)clipView addContentView:v5];
}

- (BOOL)isPopoverVisible
{
  return ![(TSWPopoverController *)self isDismissing]
      && [self view].superview != 0;
}

- (BOOL)shouldDismissWhileRotating:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(TSWPopoverController *)self isPopoverVisible];
  if (v5 && v3) {
    LOBYTE(v5) = [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] != 1;
  }
  return v5;
}

- (void)pFadeInIncludeScrim:(BOOL)a3
{
  [(TSWPopoverController *)self p_willFade];
  [self view].alpha = 0.0;
  [(UIButton *)[(TSWPopoverController *)self closeButton] setAlpha:0.0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_12B288;
  v6[3] = &unk_457278;
  v6[4] = self;
  BOOL v7 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_12B2F8;
  v5[3] = &unk_457140;
  v5[4] = self;
  +[UIView animateWithDuration:v6 animations:v5 completion:0.150000006];
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 viewBounds:(CGRect)a5 permittedArrowDirections:(unint64_t)a6 displayMode:(int)a7 animated:(BOOL)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat rect_16 = a5.origin.y;
  CGFloat rect = a5.origin.x;
  CGFloat v13 = a3.size.height;
  CGFloat v14 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (objc_msgSend(-[TSWPopoverController view](self, "view", a4, a6, *(void *)&a7, a8), "superview")
    || self->_dismissGR)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:222 description:@"shouldn't present more than once before being dismissed"];
  }
  self->_displayMode = a7;
  if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1)
  {
    double v96 = v14;
    double v98 = v13;
    double rect_8 = width;
    double rect_24 = height;
    if (self->_scrimView) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:229 description:@"shouldn't have a scrim at this point"];
    }
    id v18 = objc_alloc((Class)UIView);
    [a4 bounds];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    [a4 bounds];
    CGFloat v28 = v27 * -1.414;
    [a4 bounds];
    CGFloat v30 = v29 * -1.414;
    v109.origin.CGFloat x = v20;
    v109.origin.CGFloat y = v22;
    v109.size.CGFloat width = v24;
    v109.size.CGFloat height = v26;
    CGRect v110 = CGRectInset(v109, v28, v30);
    self->_scrimView = [v18 initWithFrame:v110.origin.x, v110.origin.y, v110.size.width, v110.size.height];
    [-[TSWPopoverController scrimView](self, "scrimView") setBackgroundColor:[+[TSUColor blackColor](TSUColor, "blackColor") platformColor]];
    [(UIView *)[(TSWPopoverController *)self scrimView] setAutoresizingMask:18];
    [(UIView *)[(TSWPopoverController *)self scrimView] setAlpha:0.0];
    [a4 addSubview:[self scrimView]];
    CGFloat height = rect_24;
    CGFloat width = rect_8;
    CGFloat v14 = v96;
    CGFloat v13 = v98;
  }
  [a4 addSubview:[self view]];
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setZPosition:", 3.0);
  [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
  CGFloat v32 = v31 * -12.0;
  [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
  CGFloat v34 = v33 * -12.0;
  v111.origin.CGFloat x = x;
  v111.origin.CGFloat y = y;
  v111.size.CGFloat width = v14;
  v111.size.CGFloat height = v13;
  CGRect v112 = CGRectInset(v111, v32, v34);
  CGFloat rect_24a = v112.origin.x;
  double rect_8a = v112.origin.y;
  CGFloat v35 = v112.size.width;
  CGFloat v36 = v112.size.height;
  v112.origin.CGFloat x = rect;
  v112.origin.CGFloat y = rect_16;
  v112.size.CGFloat width = width;
  v112.size.CGFloat height = height;
  CGRect v113 = CGRectInset(v112, 15.0, 15.0);
  CGFloat v37 = v113.origin.x;
  CGFloat v38 = v113.origin.y;
  double v39 = v113.size.width;
  double v40 = v113.size.height;
  [self view].bounds;
  -[TSWPopoverController setOriginalViewSize:](self, "setOriginalViewSize:", v41, v42);
  [(TSWPopoverController *)self originalViewSize];
  double v45 = v43;
  double v46 = v44;
  double rect_16a = v39;
  BOOL v47 = v43 <= v39;
  double v48 = v40;
  double v99 = v38;
  double recta = v37;
  if (v47 && v44 <= v40)
  {
    double v49 = v36;
    double v50 = v35;
    BOOL v51 = 0;
    double v52 = rect_24a;
  }
  else
  {
    double v49 = v36;
    double v50 = v35;
    double v94 = v43;
    double v95 = v44;
    double v97 = v40;
    TSDFitOrFillSizeInSize();
    TSDRectWithSize();
    TSDRoundedRectForMainScreen();
    double v54 = v53;
    double v56 = v55;
    objc_msgSend(objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentController](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentController"), "mainView"), "frame");
    double v59 = v58;
    double v61 = v60;
    if (v54 != v62 || v56 != v57)
    {
      objc_msgSend(objc_msgSend(-[TSWPopoverControllerContentProvider popupInfo](-[TSWPopoverController contentProvider](self, "contentProvider"), "popupInfo"), "frameViewSettings"), "frameViewSize");
      if (v54 / v63 >= v56 / v64) {
        double v65 = v56 / v64;
      }
      else {
        double v65 = v54 / v63;
      }
      [(-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentController") setFrame:scale:v59, v61, v63 * v65, v64 * v65, v65];
    }
    TSDRectWithSize();
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v72 = v56;
    double v73 = v54;
    double v75 = v74;
    id v76 = [(TSWPopoverController *)self view];
    double v77 = v75;
    double v78 = v73;
    double v46 = v72;
    [v76 setFrame:v67, v69, v71, v77];
    double v52 = rect_24a;
    double v48 = v97;
    if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1) {
      BOOL v51 = v97 / v95 < 0.8 || rect_16a / v94 < 0.8;
    }
    else {
      BOOL v51 = 0;
    }
    double v45 = v78;
  }
  [self contentProvider].popoverContentView.bounds
  if (v81 < v45) {
    double v45 = v81;
  }
  if (v82 < v46) {
    double v46 = v82;
  }
  [(-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView") setBounds:v79, v80, v45, v46];
  unint64_t v83 = -[TSWPopoverController p_arrowDirectionForTargetRect:targetBounds:permittedDirections:](self, "p_arrowDirectionForTargetRect:targetBounds:permittedDirections:", a6, v52, rect_8a, v50, v49, recta, v99, rect_16a, v48);
  -[TSWPopoverController p_popoverCenterForArrowDirection:targetRect:targetBounds:](self, "p_popoverCenterForArrowDirection:targetRect:targetBounds:", v83, v52, rect_8a, v50, v49, recta, v99, rect_16a, v48);
  [self view].bounds;
  TSDRectWithCenterAndSize();
  TSDRoundedRectForMainScreen();
  [self view].frame = CGRectMake(v84, v85, v86, v87);
  [(TSWPopoverController *)self boundsIncludingStroke];
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowPath:", -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:"), "CGPath"));
  id v88 = [(TSWPopoverController *)self view];
  TSDCenterOfRect();
  [v88 convertPoint:a4 fromView:];
  -[TSWPopoverController p_arrowBoundsForArrowDirection:targetPoint:](self, "p_arrowBoundsForArrowDirection:targetPoint:", v83);
  -[TSWPopoverController p_updateAppearanceForArrowDirection:arrowBounds:](self, "p_updateAppearanceForArrowDirection:arrowBounds:", v83);
  [(TSWPopoverController *)self contentProvider];
  v89 = (void *)TSUProtocolCast();
  [v89 displayModeDidChange:self->_displayMode];
  if (v51 || [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1) {
    [v89 disableCanvasInteraction];
  }
  v90 = [[TSWPopoverDismissGestureRecognizer alloc] initWithTarget:self action:"p_handleDismissGR:"];
  self->_dismissGR = &v90->super;
  [(TSWPopoverDismissGestureRecognizer *)v90 setDelegate:self];
  [a4 addGestureRecognizer:self->_dismissGR];
  if (v51)
  {
    -[TSWPopoverController setDoubleTapGR:](self, "setDoubleTapGR:", [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"p_handleDoubleTapGR:"]);
    [(UITapGestureRecognizer *)[(TSWPopoverController *)self doubleTapGR] setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)[(TSWPopoverController *)self doubleTapGR] setDelegate:self];
    [self view].addGestureRecognizer:[self doubleTapGR];
  }
  if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1)
  {
    if (self->_closeButton) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:335 description:@"shouldn't have a close button at this point"];
    }
    [(TSWPopoverController *)self setCloseButton:+[UIButton buttonWithType:0]];
    [(UIButton *)[(TSWPopoverController *)self closeButton] setImage:+[UIImage th_imageNamed:@"closebox-black_N"] forState:0];
    [(UIButton *)[(TSWPopoverController *)self closeButton] setImage:+[UIImage th_imageNamed:@"closebox-black_P"] forState:1];
    [(UIButton *)[(TSWPopoverController *)self closeButton] addTarget:self action:"handleClose:" forControlEvents:64];
    -[UIButton setFrame:]([(TSWPopoverController *)self closeButton], "setFrame:", 0.0, 0.0, 35.0, 35.0);
    [a4 addSubview:[self closeButton]];
    [self view].frame;
    double v92 = v91 + 5.0;
    [self view].frame;
    -[UIButton setCenter:]([(TSWPopoverController *)self closeButton], "setCenter:", v92, v93 + 5.0);
  }

  [(TSWPopoverController *)self pFadeInIncludeScrim:1];
}

- (void)handleClose:(id)a3
{
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TSWPopoverController *)self isDismissing]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController dismissPopoverAnimated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:357 description:@"Dismissed the TSWPopoverController more than once."];
  }
  [(TSWPopoverController *)self setIsDismissing:1];
  [(TSWPopoverController *)self p_willFade];
  [(TSWPopoverControllerDelegate *)self->_delegate popoverControllerWillDismiss:self];
  [(UIView *)[(UIGestureRecognizer *)self->_dismissGR view] removeGestureRecognizer:self->_dismissGR];

  self->_dismissGR = 0;
  double v5 = 0.150000006;
  if (!v3) {
    double v5 = 0.0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12BD3C;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_12BD98;
  v6[3] = &unk_457140;
  v6[4] = self;
  +[UIView animateWithDuration:v7 animations:v6 completion:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  BOOL v7 = [(TSWPopoverController *)self doubleTapGR] == a3
    || [(TSWPopoverController *)self dismissGR] == a3;
  if ([(NSArray *)self->_passThroughGestureRecognizers containsObject:a4]) {
    return (objc_opt_respondsToSelector() & 1) == 0
  }
        || ([(TSWPopoverControllerDelegate *)self->_delegate popoverController:self shouldIgnorePassThroughGestureRecognizer:a4] & 1) == 0;
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if ([(TSWPopoverController *)self doubleTapGR] == a3) {
    return 1;
  }
  [self view].bounds;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [a4 locationInView:[self view]];
  v27.CGFloat x = v14;
  v27.CGFloat y = v15;
  v29.origin.CGFloat x = v7;
  v29.origin.CGFloat y = v9;
  v29.size.CGFloat width = v11;
  v29.size.CGFloat height = v13;
  if (CGRectContainsPoint(v29, v27)) {
    return 0;
  }
  if (![(TSWPopoverController *)self closeButton]) {
    return 1;
  }
  [(UIButton *)[(TSWPopoverController *)self closeButton] bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [a4 locationInView:[self closeButton]];
  v28.CGFloat x = v24;
  v28.CGFloat y = v25;
  v30.origin.CGFloat x = v17;
  v30.origin.CGFloat y = v19;
  v30.size.CGFloat width = v21;
  v30.size.CGFloat height = v23;
  return !CGRectContainsPoint(v30, v28);
}

- (CGRect)boundsIncludingStroke
{
  [self view].bounds;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(TSDStroke *)[(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverStroke] shouldRender])
  {
    CGFloat v11 = [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverStroke];
    [self view].bounds;
    [(TSDStroke *)v11 boundsForPath:+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:")];
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (unint64_t)p_arrowDirectionForTargetRect:(CGRect)a3 targetBounds:(CGRect)a4 permittedDirections:(unint64_t)a5
{
  char v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1) {
    return -1;
  }
  CGFloat v32 = width;
  CGFloat rect = height;
  [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
  double v31 = v16;
  double v17 = v16 * 13.0;
  [(TSWPopoverController *)self boundsIncludingStroke];
  CGFloat v18 = -CGRectGetWidth(v34);
  [(TSWPopoverController *)self boundsIncludingStroke];
  CGFloat v19 = -CGRectGetHeight(v35);
  v36.origin.CGFloat x = v13;
  v36.origin.CGFloat y = v12;
  v36.size.CGFloat width = v11;
  v36.size.CGFloat height = v10;
  CGRect v37 = CGRectInset(v36, v18, v19);
  CGFloat v20 = v37.origin.x;
  CGFloat v21 = v37.origin.y;
  CGFloat v22 = v37.size.width;
  CGFloat v23 = v37.size.height;
  if ((v5 & 2) != 0)
  {
    CGFloat v24 = CGRectGetMinY(v37) - v17;
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = v32;
    v38.size.CGFloat height = rect;
    if (v24 >= CGRectGetMinY(v38)) {
      return 2;
    }
  }
  if ((v5 & 1) == 0) {
    goto LABEL_23;
  }
  v39.origin.CGFloat x = v20;
  v39.origin.CGFloat y = v21;
  v39.size.CGFloat width = v22;
  v39.size.CGFloat height = v23;
  CGFloat v25 = v17 + CGRectGetMaxY(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = v32;
  v40.size.CGFloat height = rect;
  if (v25 <= CGRectGetMaxY(v40)) {
    return 1;
  }
  if ((v5 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_23:
  v41.origin.CGFloat x = v20;
  v41.origin.CGFloat y = v21;
  v41.size.CGFloat width = v22;
  v41.size.CGFloat height = v23;
  CGFloat v26 = v17 + CGRectGetMaxX(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = v32;
  v42.size.CGFloat height = rect;
  if (v26 <= CGRectGetMaxX(v42)) {
    return 4;
  }
LABEL_9:
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0) {
      return -1;
    }
    CGFloat v27 = v32;
LABEL_17:
    v45.origin.CGFloat x = v20;
    v45.origin.CGFloat y = v21;
    v45.size.CGFloat width = v22;
    v45.size.CGFloat height = v23;
    CGFloat v30 = CGRectGetMinY(v45) + v31 * 12.0;
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = v27;
    v46.size.CGFloat height = rect;
    if (v30 >= CGRectGetMinY(v46)) {
      return 2;
    }
    return -1;
  }
  v43.origin.CGFloat x = v20;
  v43.origin.CGFloat y = v21;
  v43.size.CGFloat width = v22;
  v43.size.CGFloat height = v23;
  double v28 = CGRectGetMinX(v43) - v17;
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  CGFloat v27 = v32;
  v44.size.CGFloat height = rect;
  v44.size.CGFloat width = v32;
  double MinX = CGRectGetMinX(v44);
  if (v28 < MinX) {
    unint64_t result = -1;
  }
  else {
    unint64_t result = 8;
  }
  if ((v5 & 2) != 0 && v28 < MinX) {
    goto LABEL_17;
  }
  return result;
}

- (CGRect)p_arrowBoundsForArrowDirection:(unint64_t)a3 targetPoint:(CGPoint)a4
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1)
  {
LABEL_2:
    double v8 = width;
    double v9 = height;
  }
  else
  {
    [self view].bounds;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
    double v19 = v18;
    double v28 = v18 * 30.0;
    double v20 = v18 * 30.0 * 0.5;
    [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverCornerRadius];
    v32.origin.double x = v11;
    v32.origin.double y = v13;
    v32.size.CGFloat width = v15;
    v32.size.CGFloat height = v17;
    CGRectGetWidth(v32);
    TSUClamp();
    double v27 = v21;
    v33.origin.double x = v11;
    v33.origin.double y = v13;
    v33.size.CGFloat width = v15;
    CGFloat rect = v17;
    v33.size.CGFloat height = v17;
    CGRectGetHeight(v33);
    TSUClamp();
    double v23 = v22;
    double v24 = v19 * 13.0;
    double x = CGRectZero.origin.x;
    double v8 = width;
    double v9 = height;
    switch(a3)
    {
      case 1uLL:
        double x = v27 - v20;
        v34.origin.double x = v11;
        v34.origin.double y = v13;
        v34.size.CGFloat width = v15;
        v34.size.CGFloat height = rect;
        double y = CGRectGetMinY(v34) - v24;
        goto LABEL_6;
      case 2uLL:
        double x = v27 - v20;
        v35.origin.double x = v11;
        v35.origin.double y = v13;
        v35.size.CGFloat width = v15;
        v35.size.CGFloat height = rect;
        double y = CGRectGetMaxY(v35);
LABEL_6:
        double v9 = v24;
        double v8 = v28;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v36.origin.double x = v11;
        v36.origin.double y = v13;
        v36.size.CGFloat width = v15;
        v36.size.CGFloat height = rect;
        double x = CGRectGetMinX(v36) - v24;
        goto LABEL_9;
      case 8uLL:
        v37.origin.double x = v11;
        v37.origin.double y = v13;
        v37.size.CGFloat width = v15;
        v37.size.CGFloat height = rect;
        double x = CGRectGetMaxX(v37);
LABEL_9:
        double y = v23 - v20;
        double v9 = v28;
        double v8 = v24;
        break;
      default:
        double x = CGRectZero.origin.x;
        goto LABEL_2;
    }
  }
  double v25 = x;
  double v26 = y;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGPoint)p_popoverCenterForArrowDirection:(unint64_t)a3 targetRect:(CGRect)a4 targetBounds:(CGRect)a5
{
  CGFloat x = a5.origin.x;
  CGFloat height = a5.size.height;
  CGFloat y = a5.origin.y;
  CGFloat width = a5.size.width;
  CGFloat v5 = a4.size.height;
  CGFloat v6 = a4.size.width;
  CGFloat v7 = a4.origin.y;
  CGFloat v8 = a4.origin.x;
  if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] presentationMode] == 1)
  {
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    CGRectGetMidX(v47);
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRectGetMidY(v48);
  }
  else
  {
    [(TSWPopoverController *)self boundsIncludingStroke];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v39 = v16;
    CGFloat v40 = v15;
    v49.origin.CGFloat x = v8;
    v49.origin.CGFloat y = v7;
    v49.size.CGFloat width = v6;
    v49.size.CGFloat height = v5;
    CGFloat MidX = CGRectGetMidX(v49);
    v50.origin.CGFloat x = v8;
    v50.origin.CGFloat y = v7;
    v50.size.CGFloat width = v6;
    v50.size.CGFloat height = v5;
    CGFloat MidY = CGRectGetMidY(v50);
    [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
    double v20 = v19 * 13.0;
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        double v21 = MidX;
        v51.origin.CGFloat x = v8;
        v51.origin.CGFloat y = v7;
        v51.size.CGFloat width = v6;
        v51.size.CGFloat height = v5;
        double MinY = CGRectGetMinY(v51);
        v52.origin.CGFloat x = v12;
        v52.origin.CGFloat y = v14;
        CGFloat v23 = v39;
        CGFloat v24 = v40;
        v52.size.CGFloat width = v40;
        v52.size.CGFloat height = v39;
        double v25 = MinY + CGRectGetHeight(v52) * -0.5;
        break;
      case 1uLL:
        double v21 = MidX;
        double v35 = v20;
        v53.origin.CGFloat x = v8;
        v53.origin.CGFloat y = v7;
        v53.size.CGFloat width = v6;
        v53.size.CGFloat height = v5;
        double MaxY = CGRectGetMaxY(v53);
        v54.origin.CGFloat x = v12;
        v54.origin.CGFloat y = v14;
        CGFloat v23 = v39;
        CGFloat v24 = v40;
        v54.size.CGFloat width = v40;
        v54.size.CGFloat height = v39;
        double v25 = v35 + MaxY + CGRectGetHeight(v54) * 0.5;
        break;
      case 2uLL:
        double v21 = MidX;
        double v36 = v20;
        v55.origin.CGFloat x = v8;
        v55.origin.CGFloat y = v7;
        v55.size.CGFloat width = v6;
        v55.size.CGFloat height = v5;
        double v27 = CGRectGetMinY(v55);
        v56.origin.CGFloat x = v12;
        v56.origin.CGFloat y = v14;
        CGFloat v23 = v39;
        CGFloat v24 = v40;
        v56.size.CGFloat width = v40;
        v56.size.CGFloat height = v39;
        double v25 = v27 + CGRectGetHeight(v56) * -0.5 - v36;
        break;
      case 4uLL:
        double v37 = v20;
        v57.origin.CGFloat x = v8;
        v57.origin.CGFloat y = v7;
        v57.size.CGFloat width = v6;
        v57.size.CGFloat height = v5;
        double MaxX = CGRectGetMaxX(v57);
        v58.origin.CGFloat x = v12;
        v58.origin.CGFloat y = v14;
        CGFloat v23 = v39;
        CGFloat v24 = v40;
        v58.size.CGFloat width = v40;
        v58.size.CGFloat height = v39;
        double v25 = MidY;
        double v21 = v37 + MaxX + CGRectGetWidth(v58) * 0.5;
        break;
      case 8uLL:
        double v38 = v20;
        v59.origin.CGFloat x = v8;
        v59.origin.CGFloat y = v7;
        v59.size.CGFloat width = v6;
        v59.size.CGFloat height = v5;
        double MinX = CGRectGetMinX(v59);
        v60.origin.CGFloat x = v12;
        v60.origin.CGFloat y = v14;
        CGFloat v23 = v39;
        CGFloat v24 = v40;
        v60.size.CGFloat width = v40;
        v60.size.CGFloat height = v39;
        double v25 = MidY;
        double v21 = MinX + CGRectGetWidth(v60) * -0.5 - v38;
        break;
      default:
        double v25 = MidY;
        double v21 = MidX;
        CGFloat v23 = v39;
        CGFloat v24 = v40;
        break;
    }
    v61.origin.CGFloat x = v12;
    v61.origin.CGFloat y = v14;
    v61.size.CGFloat width = v24;
    v61.size.CGFloat height = v23;
    CGFloat v30 = CGRectGetWidth(v61);
    v62.size.CGFloat height = v23;
    v62.origin.CGFloat x = v21 - v30 * 0.5;
    CGFloat v31 = v62.origin.x;
    v62.origin.CGFloat y = v14;
    v62.size.CGFloat width = v24;
    CGFloat v34 = v25 - CGRectGetHeight(v62) * 0.5;
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    CGRectGetMinX(v63);
    v64.origin.CGFloat x = v31;
    v64.origin.CGFloat y = v34;
    v64.size.CGFloat width = v24;
    v64.size.CGFloat height = v39;
    CGRectGetMinX(v64);
    v65.origin.CGFloat x = v31;
    v65.origin.CGFloat y = v34;
    v65.size.CGFloat width = v24;
    v65.size.CGFloat height = v39;
    CGRectGetMaxX(v65);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    CGRectGetMaxX(v66);
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    CGRectGetMinY(v67);
    v68.origin.CGFloat x = v31;
    v68.origin.CGFloat y = v34;
    v68.size.CGFloat width = v40;
    v68.size.CGFloat height = v39;
    CGRectGetMinY(v68);
    v69.origin.CGFloat x = v31;
    v69.origin.CGFloat y = v34;
    v69.size.CGFloat width = v40;
    v69.size.CGFloat height = v39;
    CGRectGetMaxY(v69);
    v70.origin.CGFloat x = x;
    v70.size.CGFloat height = height;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    CGRectGetMaxY(v70);
  }

  TSDRoundedPoint();
  result.CGFloat y = v33;
  result.CGFloat x = v32;
  return result;
}

- (void)p_handleDismissGR:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3 || objc_msgSend(a3, "state") == (char *)&dword_0 + 2)
  {
    [(TSWPopoverController *)self dismissPopoverAnimated:1];
  }
}

- (void)p_handleDoubleTapGR:(id)a3
{
  int displayMode = self->_displayMode;
  if (displayMode)
  {
    if (displayMode == 1) {
      [(TSWPopoverController *)self setDisplayMode:0];
    }
  }
  else
  {
    [(TSWPopoverController *)self setDisplayMode:1];
  }
}

- (void)p_willFade
{
  double v3 = self;
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShouldRasterize:", 1);
  TSUScreenScale();
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setRasterizationScale:", v4);
  CGFloat v5 = +[UIApplication sharedApplication];

  [(UIApplication *)v5 beginIgnoringInteractionEvents];
}

- (void)p_didFade
{
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShouldRasterize:", 0);
  [+[UIApplication sharedApplication] endIgnoringInteractionEvents];

  double v3 = self;
}

- (void)p_customizeWithTheme:(id)a3
{
  id v4 = [a3 copy];
  [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
  [v4 scaleWithFactor:];
  [(TSWPopoverController *)self setTheme:v4];
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowColor:", -[TSUColor CGColor](-[TSWPopoverTheme popoverShadowColor](-[TSWPopoverController theme](self, "theme"), "popoverShadowColor"), "CGColor"));
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverShadowOffset];
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowOffset:", v5, v6);
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverShadowRadius];
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowRadius:", v7);
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverShadowOpacity];
  float v9 = v8;
  id v10 = [self view].layer;
  *(float *)&double v11 = v9;
  [v10 setShadowOpacity:v11];
  [self.contentProvider.popoverContentView bounds];
  TSDCeilSize();
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverContentInsets];
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverContentInsets];
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverContentInsets];
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverContentInsets];
  TSDRectWithSize();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(TSWPopoverController *)self view];

  [v20 setFrame:v13, v15, v17, v19];
}

- (CGPath)p_newMaskPathWithBounds:(CGRect)a3 cornerRadius:(double)a4 arrowDirection:(unint64_t)a5 arrowBounds:(CGRect)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v75.origin.CGFloat x = x;
  v75.origin.CGFloat y = y;
  v75.size.CGFloat width = width;
  v75.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v75);
  v76.origin.CGFloat x = x;
  v76.origin.CGFloat y = y;
  v76.size.CGFloat width = width;
  v76.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v76);
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.CGFloat width = width;
  v77.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v77);
  v78.origin.CGFloat x = x;
  v78.origin.CGFloat y = y;
  v78.size.CGFloat width = width;
  v78.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v78);
  v79.origin.CGFloat x = x;
  v79.origin.CGFloat y = y;
  v79.size.CGFloat width = width;
  v79.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v79);
  v80.origin.CGFloat x = x;
  v80.origin.CGFloat y = y;
  v80.size.CGFloat width = width;
  double v14 = a4;
  v80.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v80);
  CGPathMoveToPoint(Mutable, 0, MinX, MinY + a4);
  CGFloat v69 = MinX;
  CGFloat v67 = MidX;
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, a4);
  if (a5 == 1)
  {
    CGFloat v16 = CGRectGetMinX(a6);
    CGPathAddLineToPoint(Mutable, 0, v16, MinY);
    cp1CGFloat x = CGRectGetMinX(a6) + 7.0;
    CGFloat v17 = CGRectGetMidX(a6) + -5.0;
    CGFloat v18 = CGRectGetMinY(a6);
    CGFloat v19 = CGRectGetMidX(a6);
    CGFloat v20 = CGRectGetMinY(a6);
    CGPathAddCurveToPoint(Mutable, 0, cp1x, MinY, v17, v18, v19, v20);
    CGFloat v21 = CGRectGetMidX(a6) + 5.0;
    CGFloat v22 = CGRectGetMinY(a6);
    CGFloat v23 = CGRectGetMaxX(a6) + -7.0;
    CGFloat v24 = CGRectGetMaxX(a6);
    CGFloat v25 = v21;
    double v14 = a4;
    CGPathAddCurveToPoint(Mutable, 0, v25, v22, v23, MinY, v24, MinY);
    double v26 = MaxX;
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, a4);
    CGFloat v27 = a6.size.height;
    CGFloat v28 = a6.size.width;
    CGFloat v29 = MidY;
LABEL_5:
    CGFloat v43 = v26;
    CGFloat v44 = MaxY;
    CGPathAddArcToPoint(Mutable, 0, v43, MaxY, v67, MaxY, v14);
    CGFloat v45 = v69;
    goto LABEL_6;
  }
  CGFloat v28 = a6.size.width;
  CGFloat v27 = a6.size.height;
  CGFloat v29 = MidY;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, a4);
  if (a5 == 8)
  {
    CGFloat v30 = CGRectGetMinY(a6);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v30);
    CGFloat v31 = CGRectGetMinY(a6) + 7.0;
    CGFloat v32 = CGRectGetMaxX(a6);
    CGFloat v33 = CGRectGetMidY(a6) + -5.0;
    CGFloat v34 = CGRectGetMaxX(a6);
    CGFloat v35 = CGRectGetMidY(a6);
    CGPathAddCurveToPoint(Mutable, 0, MaxX, v31, v32, v33, v34, v35);
    CGFloat v36 = CGRectGetMaxX(a6);
    CGFloat v37 = CGRectGetMidY(a6) + 5.0;
    CGFloat v38 = CGRectGetMaxY(a6) + -7.0;
    CGFloat v39 = CGRectGetMaxY(a6);
    CGFloat v40 = v36;
    double v14 = a4;
    CGFloat v41 = v37;
    CGFloat v42 = v38;
    CGFloat v29 = MidY;
    double v26 = MaxX;
    CGPathAddCurveToPoint(Mutable, 0, v40, v41, MaxX, v42, MaxX, v39);
    goto LABEL_5;
  }
  CGFloat v44 = MaxY;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, v67, MaxY, a4);
  CGFloat v45 = v69;
  if (a5 == 2)
  {
    CGFloat v56 = CGRectGetMaxX(a6);
    CGPathAddLineToPoint(Mutable, 0, v56, MaxY);
    CGFloat v72 = CGRectGetMaxX(a6) + -7.0;
    CGFloat v57 = CGRectGetMidX(a6) + 5.0;
    CGFloat v58 = CGRectGetMaxY(a6);
    CGFloat v59 = CGRectGetMidX(a6);
    CGFloat v60 = CGRectGetMaxY(a6);
    CGPathAddCurveToPoint(Mutable, 0, v72, MaxY, v57, v58, v59, v60);
    CGFloat v61 = CGRectGetMidX(a6) + -7.0;
    CGFloat v62 = CGRectGetMaxY(a6);
    CGFloat v63 = CGRectGetMinX(a6) + 5.0;
    CGFloat v64 = CGRectGetMinX(a6);
    CGPathAddCurveToPoint(Mutable, 0, v61, v62, v63, MaxY, v64, MaxY);
    CGPathAddArcToPoint(Mutable, 0, v69, MaxY, v69, MidY, a4);
    goto LABEL_10;
  }
LABEL_6:
  CGPathAddArcToPoint(Mutable, 0, v45, v44, v45, v29, v14);
  if (a5 == 4)
  {
    v81.origin.CGFloat x = a6.origin.x;
    v81.origin.CGFloat y = a6.origin.y;
    v81.size.CGFloat width = v28;
    v81.size.CGFloat height = v27;
    CGFloat v46 = CGRectGetMaxY(v81);
    CGPathAddLineToPoint(Mutable, 0, v45, v46);
    v82.origin.CGFloat x = a6.origin.x;
    v82.origin.CGFloat y = a6.origin.y;
    v82.size.CGFloat width = v28;
    v82.size.CGFloat height = v27;
    CGFloat cp1ya = CGRectGetMaxY(v82) + -7.0;
    v83.origin.CGFloat x = a6.origin.x;
    v83.origin.CGFloat y = a6.origin.y;
    v83.size.CGFloat width = v28;
    v83.size.CGFloat height = v27;
    CGFloat v47 = CGRectGetMinX(v83);
    v84.origin.CGFloat x = a6.origin.x;
    v84.origin.CGFloat y = a6.origin.y;
    v84.size.CGFloat width = v28;
    v84.size.CGFloat height = v27;
    CGFloat v48 = CGRectGetMidY(v84) + 5.0;
    v85.origin.CGFloat x = a6.origin.x;
    v85.origin.CGFloat y = a6.origin.y;
    v85.size.CGFloat width = v28;
    v85.size.CGFloat height = v27;
    CGFloat v49 = v45;
    CGFloat v50 = CGRectGetMinX(v85);
    v86.origin.CGFloat x = a6.origin.x;
    v86.origin.CGFloat y = a6.origin.y;
    v86.size.CGFloat width = v28;
    v86.size.CGFloat height = v27;
    CGFloat v51 = CGRectGetMidY(v86);
    CGPathAddCurveToPoint(Mutable, 0, v49, cp1ya, v47, v48, v50, v51);
    v87.origin.CGFloat x = a6.origin.x;
    v87.origin.CGFloat y = a6.origin.y;
    v87.size.CGFloat width = v28;
    v87.size.CGFloat height = v27;
    CGFloat v52 = CGRectGetMinX(v87);
    v88.origin.CGFloat x = a6.origin.x;
    v88.origin.CGFloat y = a6.origin.y;
    v88.size.CGFloat width = v28;
    v88.size.CGFloat height = v27;
    CGFloat v53 = CGRectGetMidY(v88) + -5.0;
    v89.origin.CGFloat x = a6.origin.x;
    v89.origin.CGFloat y = a6.origin.y;
    v89.size.CGFloat width = v28;
    v89.size.CGFloat height = v27;
    CGFloat v54 = CGRectGetMinY(v89) + 7.0;
    v90.origin.CGFloat x = a6.origin.x;
    v90.origin.CGFloat y = a6.origin.y;
    v90.size.CGFloat width = v28;
    v90.size.CGFloat height = v27;
    CGFloat v55 = CGRectGetMinY(v90);
    CGPathAddCurveToPoint(Mutable, 0, v52, v53, v49, v54, v49, v55);
  }
LABEL_10:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)p_updateAppearanceForArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[TSWPopoverController p_updateClipViewWithArrowDirection:arrowBounds:](self, "p_updateClipViewWithArrowDirection:arrowBounds:");
  -[TSWPopoverController p_updateBackgroundViewWithArrowDirection:arrowBounds:](self, "p_updateBackgroundViewWithArrowDirection:arrowBounds:", a3, x, y, width, height);

  -[TSWPopoverController p_updateStrokeLayerWithArrowDirection:arrowBounds:](self, "p_updateStrokeLayerWithArrowDirection:arrowBounds:", a3, x, y, width, height);
}

- (void)p_updateClipViewWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [self view].bounds;
  -[TSWClipView setFrame:](self->_clipView, "setFrame:");
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverContentInsets];
  double v11 = v10;
  [self.contentProvider.popoverContentView bounds];
  double v12 = v11 + CGRectGetWidth(v40) * 0.5;
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverContentInsets];
  double v14 = v13;
  [self contentProvider].popoverContentView.bounds
  [(-[TSWPopoverController contentProvider](self, "contentProvider")).popoverContentView setCenter:v12, v14 + CGRectGetHeight(v41) * 0.5];
  [self view].bounds;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverCornerRadius];
  CGFloat v24 = -[TSWPopoverController p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:](self, "p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:", a3, v16, v18, v20, v22, v23, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  [self view].bounds;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverFadeInsets];
  id v37 = [+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v26 + v36, v28 + v33, v30 - (v36 + v34), v32 - (v33 + v35)) CGPath];
  clipView = self->_clipView;
  [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverFadeSizes];
  -[TSWClipView updateClipWithOuterPath:innerPath:fadeSizes:](clipView, "updateClipWithOuterPath:innerPath:fadeSizes:", v24, v37);

  CGPathRelease(v24);
}

- (void)p_updateBackgroundViewWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  [(UIView *)self->_backgroundView removeFromSuperview];

  self->_backgroundView = 0;
  [(TSWPopoverControllerContentProvider *)[(TSWPopoverController *)self contentProvider] scale];
  *(float *)&double v5 = v5 * 13.0;
  double v6 = ceilf(*(float *)&v5);
  id v7 = objc_alloc((Class)UIView);
  [self view].bounds;
  CGRect v17 = CGRectInset(v16, -v6, -v6);
  double v8 = [v7 initWithFrame:v17.origin.x, v17.origin.y, v17.size.width, v17.size.height];
  [(UIView *)v8 setBackgroundColor:[(TSUColor *)[(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverBackgroundColor] platformColor]];
  if ([(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverHasGradientBackground])
  {
    [(UIView *)v8 setBackgroundColor:0];
    id v9 = objc_alloc_init((Class)TSDNoDefaultImplicitActionGradientLayer);
    [(UIView *)v8 bounds];
    [v9 setFrame:];
    double v10 = +[TSUColor colorWithWhite:1.0 alpha:0.200000003];
    double v11 = [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverBackgroundColor];
    [(TSUColor *)v10 alphaComponent];
    id v12 = -[TSUColor blendedColorWithFraction:ofColor:](v11, "blendedColorWithFraction:ofColor:", v10);
    [(TSUColor *)[(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverBackgroundColor] alphaComponent];
    objc_msgSend(v9, "setColors:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", objc_msgSend(objc_msgSend(v12, "colorWithAlphaComponent:"), "CGColor"), -[TSUColor CGColor](-[TSWPopoverTheme popoverBackgroundColor](-[TSWPopoverController theme](self, "theme"), "popoverBackgroundColor"), "CGColor"), 0));
    [(UIView *)v8 bounds];
    [v9 setStartPoint:0.5, v6 / CGRectGetHeight(v18)];
    [(UIView *)v8 bounds];
    CGFloat v13 = CGRectGetHeight(v19) - v6;
    [(UIView *)v8 bounds];
    [v9 setEndPoint:0.5, v13 / CGRectGetHeight(v20)];
    [(CALayer *)[(UIView *)v8 layer] addSublayer:v9];
  }
  self->_backgroundView = v8;
  clipView = self->_clipView;

  [(TSWClipView *)clipView addBackgroundView:v8];
}

- (void)p_updateStrokeLayerWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  unsigned int v10 = [(TSDStroke *)[(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverStroke] shouldRender];
  strokeLayer = self->_strokeLayer;
  if (v10)
  {
    if (!strokeLayer)
    {
      id v12 = (CAShapeLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionShapeLayer);
      self->_strokeLayer = v12;
      [(CAShapeLayer *)v12 setFillColor:0];
      objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "addSublayer:", self->_strokeLayer);
    }
    [self view].bounds;
    CGFloat v13 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
    [(TSDStroke *)[(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverStroke] width];
    double v15 = 1.0;
    if (v14 > 1.0) {
      double v14 = 1.0;
    }
    *(float *)&double v15 = v14;
    LODWORD(v14) = 1.0;
    [v13 aliasedPathWithViewScale:v14 effectiveStrokeWidth:v15].bounds
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverCornerRadius];
    double v25 = -[TSWPopoverController p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:](self, "p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:", a3, v17, v19, v21, v23, v24, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
    [(CAShapeLayer *)self->_strokeLayer setPath:v25];
    CGPathRelease(v25);
    if (([TSWPopoverTheme popoverStroke]([TSWPopoverController theme](self, "theme"), "popoverStroke") canApplyToShapeRenderable] & 1) == 0) {
    [TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler").handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController p_updateStrokeLayerWithArrowDirection:arrowBounds:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m") lineNumber:874 description:@"popover doesn't support strokes that can't apply to shape layers"];
}
    double v26 = [(TSWPopoverTheme *)[(TSWPopoverController *)self theme] popoverStroke];
    }
    id v27 = +[TSDRenderable renderableFromLayer:self->_strokeLayer];
    [(TSDStroke *)v26 applyToRepRenderable:v27 withScale:1.0];
  }
  else
  {
    [(CAShapeLayer *)strokeLayer removeFromSuperlayer];

    self->_strokeLayer = 0;
  }
}

- (TSWPopoverControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPopoverControllerDelegate *)a3;
}

- (NSArray)passThroughGestureRecognizers
{
  return self->_passThroughGestureRecognizers;
}

- (void)setPassThroughGestureRecognizers:(id)a3
{
}

- (TSWPopUpInfo)popUpInfo
{
  return self->_popUpInfo;
}

- (UIGestureRecognizer)dismissGR
{
  return self->_dismissGR;
}

- (void)setDismissGR:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGR
{
  return self->_doubleTapGR;
}

- (void)setDoubleTapGR:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)fadeInsets
{
  double top = self->_fadeInsets.top;
  double left = self->_fadeInsets.left;
  double bottom = self->_fadeInsets.bottom;
  double right = self->_fadeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFadeInsets:(UIEdgeInsets)a3
{
  self->_fadeInsets = a3;
}

- (UIEdgeInsets)fadeSizes
{
  double top = self->_fadeSizes.top;
  double left = self->_fadeSizes.left;
  double bottom = self->_fadeSizes.bottom;
  double right = self->_fadeSizes.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFadeSizes:(UIEdgeInsets)a3
{
  self->_fadeSizes = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (int)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int)a3
{
  self->_int displayMode = a3;
}

- (TSWPopoverControllerContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
}

- (CAShapeLayer)strokeLayer
{
  return self->_strokeLayer;
}

- (void)setStrokeLayer:(id)a3
{
}

- (TSUColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  self->_backgroundColor = (TSUColor *)a3;
}

- (BOOL)hasGradientBackground
{
  return self->_hasGradientBackground;
}

- (void)setHasGradientBackground:(BOOL)a3
{
  self->_hasGradientBackground = a3;
}

- (TSDStroke)stroke
{
  return self->_stroke;
}

- (void)setStroke:(id)a3
{
  self->_stroke = (TSDStroke *)a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (TSWPopoverTheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
}

- (CGSize)originalViewSize
{
  double width = self->_originalViewSize.width;
  double height = self->_originalViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOriginalViewSize:(CGSize)a3
{
  self->_originalViewSize = a3;
}

- (TSWClipView)clipView
{
  return self->_clipView;
}

- (void)setClipView:(id)a3
{
}

@end