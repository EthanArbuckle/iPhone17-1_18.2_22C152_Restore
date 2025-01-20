@interface THiOSStudyViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)p_showingMultipleCards;
- (BOOL)shouldAutorotate;
- (IMTheme)theme;
- (THStudyOptionsPopoverController)optionsPopoverController;
- (THiOSStudyViewController)initWithDocumentRoot:(id)a3;
- (THiOSStudyViewControllerDelegate)delegate;
- (UIButton)doneButton;
- (UIButton)optionsButton;
- (UIEdgeInsets)p_cardEdgeInsets;
- (UIEdgeInsets)p_scaledInsetsFromInsets:(UIEdgeInsets)a3 referenceSize:(CGSize)a4;
- (UILabel)titleLabel;
- (UIView)backdrop;
- (UIView)contentView;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)interfaceOrientation;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)p_styleForPresentation:(id)a3;
- (void)_keyEnter:(id)a3;
- (void)_keyLeft:(id)a3;
- (void)_keyRight:(id)a3;
- (void)_keySpace:(id)a3;
- (void)dealloc;
- (void)dismissStudyOptionsMenu:(BOOL)a3 completion:(id)a4;
- (void)done:(id)a3;
- (void)doneButtonPressed:(id)a3;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)p_animateTransitionInWithCompletion:(id)a3;
- (void)p_animateTransitionOutWithCompletion:(id)a3;
- (void)p_handleFlickGesture:(id)a3;
- (void)p_handlePanGesture:(id)a3;
- (void)p_handleTapGesture:(id)a3;
- (void)p_layoutViewsWithDuration:(double)a3;
- (void)p_setupGestureRecognizers;
- (void)p_stageTransitionAnimationIn:(BOOL)a3;
- (void)p_updateDarkMode;
- (void)p_updateFlipGlyphWithTouches:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setBackdrop:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setOptionsButton:(id)a3;
- (void)setOptionsPopoverController:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showOptions:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)transitionInWithCompletion:(id)a3;
- (void)transitionOutWithCompletion:(id)a3;
- (void)updateWithNavigationUnit:(id)a3 title:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation THiOSStudyViewController

- (THiOSStudyViewController)initWithDocumentRoot:(id)a3
{
  v4 = [(THiOSStudyViewController *)self initWithNibName:0 bundle:THBundle()];
  if (v4)
  {
    v5 = [[THNoteCardsController alloc] initWithDocumentRoot:a3];
    v4->_noteCardsController = v5;
    [(THNoteCardsController *)v5 setDelegate:v4];
    [(THiOSStudyViewController *)v4 p_setupGestureRecognizers];
    [(THiOSStudyViewController *)v4 addKeyCommand:+[UIKeyCommand keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:0 action:"_keyLeft:"]];
    [(THiOSStudyViewController *)v4 addKeyCommand:+[UIKeyCommand keyCommandWithInput:UIKeyInputRightArrow modifierFlags:0 action:"_keyRight:"]];
    [(THiOSStudyViewController *)v4 addKeyCommand:+[UIKeyCommand keyCommandWithInput:@" " modifierFlags:0 action:"_keySpace:"]];
    [(THiOSStudyViewController *)v4 addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:"_keyEnter:"]];
    [(THiOSStudyViewController *)v4 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)dealloc
{
  [(THNoteCardsController *)self->_noteCardsController detachFromView:[(THiOSStudyViewController *)self view]];
  [+[NSNotificationCenter defaultCenter] removeObserver:self];

  self->_theme = 0;
  self->_panGR = 0;

  self->_flickGR = 0;
  self->_tapGR = 0;

  self->_indirectPanGR = 0;
  self->_optionsPopoverController = 0;

  self->_titleLabel = 0;
  self->_doneButton = 0;

  self->_optionsButton = 0;
  self->_backdrop = 0;

  self->_noteCardsController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v3 dealloc];
}

- (UIEdgeInsets)p_scaledInsetsFromInsets:(UIEdgeInsets)a3 referenceSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  CGFloat top = a3.top;
  [self view].bounds;
  double v11 = round(left / width * v10);
  double v12 = round(right / width * v10);
  double v14 = round(bottom / height * v13);
  double v15 = top;
  double v16 = v12;
  result.double right = v16;
  result.double bottom = v14;
  result.double left = v11;
  result.CGFloat top = v15;
  return result;
}

- (UIEdgeInsets)p_cardEdgeInsets
{
  unsigned int v3 = [(THiOSStudyViewController *)self im_isCompactWidth];
  unsigned int v4 = [(THiOSStudyViewController *)self im_isCompactHeight];
  if ([(THNoteCardsController *)self->_noteCardsController noteCardCount] <= 1) {
    goto LABEL_2;
  }
  int v11 = v4 ^ 1;
  if ((v3 ^ 1) & 1) != 0 || (v11)
  {
    if ((v3 ^ 1 | v4))
    {
      if (((v3 | v11) & 1) == 0)
      {
        double v5 = 38.0;
        double v6 = 64.0;
        double v7 = 736.0;
        double v8 = 414.0;
        double v9 = 20.0;
        goto LABEL_3;
      }
LABEL_2:
      double v5 = 58.0;
      double v6 = 64.0;
      double v7 = 1024.0;
      double v8 = 768.0;
      double v9 = 30.0;
LABEL_3:
      double v10 = 64.0;
      goto LABEL_11;
    }
    double v5 = 58.0;
    double v10 = 32.0;
    double v7 = 375.0;
    double v8 = 667.0;
    double v6 = 8.0;
    double v9 = 20.0;
  }
  else
  {
    double v5 = 38.0;
    double v7 = 667.0;
    double v8 = 375.0;
    double v6 = 20.0;
    double v9 = 22.0;
    double v10 = 20.0;
  }
LABEL_11:

  -[THiOSStudyViewController p_scaledInsetsFromInsets:referenceSize:](self, "p_scaledInsetsFromInsets:referenceSize:", v5, v6, v9, v10, v7, v8);
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v4 viewDidLoad];
  objc_msgSend(-[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView leftAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "leftAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "leftAnchor")), "setActive:", 1);
  objc_msgSend(-[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView rightAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "rightAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "rightAnchor")), "setActive:", 1);
  objc_msgSend(-[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView topAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "topAnchor")), "setActive:", 1);
  objc_msgSend(-[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView bottomAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "bottomAnchor")), "setActive:", 1);
  id v3 = objc_alloc((Class)UIView);
  [self view].bounds;
  -[THiOSStudyViewController setBackdrop:[v3 initWithFrame:]];
  [(UIView *)[(THiOSStudyViewController *)self backdrop] setBackgroundColor:+[UIColor bc_booksBackground]];
  [self.view insertSubview:[self backdrop] atIndex:0];
  -[UIButton setTitle:forState:](-[THiOSStudyViewController doneButton](self, "doneButton"), "setTitle:forState:", [(id)THBundle() localizedStringForKey:@"Done" value:&stru_46D7E8 table:0], 0);
  [(UIButton *)[(THiOSStudyViewController *)self doneButton] sizeToFit];
  [(UIButton *)[(THiOSStudyViewController *)self doneButton] setTitleColor:+[UIColor bc_booksLabelColor] forState:0];
  [(UIButton *)[(THiOSStudyViewController *)self doneButton] setPointerInteractionEnabled:1];
  -[UIButton setTitle:forState:](-[THiOSStudyViewController optionsButton](self, "optionsButton"), "setTitle:forState:", [(id)THBundle() localizedStringForKey:@"Options" value:&stru_46D7E8 table:0], 0);
  [(UIButton *)[(THiOSStudyViewController *)self optionsButton] setTitleColor:+[UIColor bc_booksLabelColor] forState:0];
  [(UIButton *)[(THiOSStudyViewController *)self optionsButton] sizeToFit];
  [(UIButton *)[(THiOSStudyViewController *)self optionsButton] setPointerInteractionEnabled:1];
  [self.view setTintColor:[UIColor whiteColor]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v4 viewWillAppear:a3];
  [(THiOSStudyViewController *)self p_updateDarkMode];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v3 viewWillLayoutSubviews];
  [(THiOSStudyViewController *)self p_layoutViewsWithDuration:0.0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v8 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  noteCardsController = self->_noteCardsController;
  id v7 = [(THiOSStudyViewController *)self view];
  if (a3)
  {
    [(THNoteCardsController *)noteCardsController attachToView:v7];
    [self.view insertSubview:[self backdrop] atIndex:0];
  }
  else
  {
    [(THNoteCardsController *)noteCardsController detachFromView:v7];
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  int64_t result = [(THiOSStudyViewController *)&v4 overrideUserInterfaceStyle];
  if (!result)
  {
    objc_opt_class();
    [(THiOSStudyViewController *)self theme];
    int64_t result = TSUDynamicCast();
    if (result) {
      return (int64_t)[(id)result userInterfaceStyle];
    }
  }
  return result;
}

- (void)p_updateFlipGlyphWithTouches:(id)a3
{
  if ([a3 count] == (char *)&dword_0 + 1)
  {
    noteCardsController = self->_noteCardsController;
    objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", -[THiOSStudyViewController view](self, "view"));
    BOOL v6 = -[THNoteCardsController isPointInsideTopCardFlipGlyph:](noteCardsController, "isPointInsideTopCardFlipGlyph:");
    id v7 = self->_noteCardsController;
    [(THNoteCardsController *)v7 handleTopCardFlipAffordancePressed:v6];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[THiOSStudyViewController p_updateFlipGlyphWithTouches:](self, "p_updateFlipGlyphWithTouches:");
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v7 touchesBegan:a3 withEvent:a4];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[THiOSStudyViewController p_updateFlipGlyphWithTouches:](self, "p_updateFlipGlyphWithTouches:");
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v7 touchesMoved:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  [(THNoteCardsController *)self->_noteCardsController handleTopCardFlipAffordancePressed:0];
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v7 touchesEnded:a3 withEvent:a4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(THNoteCardsController *)self->_noteCardsController handleTopCardFlipAffordancePressed:0];
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v7 touchesCancelled:a3 withEvent:a4];
}

- (int64_t)interfaceOrientation
{
  id v2 = [self bc_windowForViewController].windowScene;

  return (int64_t)[v2 interfaceOrientation];
}

- (BOOL)shouldAutorotate
{
  return !self->_isTransitioningInOut;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v16 viewWillTransitionToSize:a3.width withTransitionCoordinator:a3.height];
  if (a4)
  {
    [a4 targetTransform];
    uint64_t v11 = 0;
    double v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_E0D6C;
    v9[3] = &unk_4592D8;
    BOOL v10 = !CGAffineTransformIsIdentity(&v15);
    v9[4] = self;
    v9[5] = &v11;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_E0DEC;
    v7[3] = &unk_4592D8;
    BOOL v8 = v10;
    v7[4] = self;
    v7[5] = &v11;
    unsigned __int8 v6 = [a4 animateAlongsideTransition:v9 completion:v7];
    *((unsigned char *)v12 + 24) = v6;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    [0 transitionDuration];
    [(THiOSStudyViewController *)self p_layoutViewsWithDuration:"p_layoutViewsWithDuration:"];
  }
}

- (void)p_updateDarkMode
{
  BOOL v3 = (char *)[(THiOSStudyViewController *)self overrideUserInterfaceStyle] == (char *)&dword_0 + 2;
  noteCardsController = self->_noteCardsController;

  [(THNoteCardsController *)noteCardsController setDarkMode:v3];
}

- (void)setTheme:(id)a3
{
  theme = self->_theme;
  if (theme)
  {

    self->_theme = 0;
  }
  self->_theme = (IMTheme *)a3;

  [(THiOSStudyViewController *)self p_updateDarkMode];
}

- (void)done:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  double v5 = (void (*)(void *))sub_E0FB8;
  unsigned __int8 v6 = &unk_456DE0;
  objc_super v7 = self;
  if ([(THiOSStudyViewController *)self optionsPopoverController]) {
    [(THiOSStudyViewController *)self dismissStudyOptionsMenu:0 completion:v4];
  }
  else {
    v5(v4);
  }
}

- (void)doneButtonPressed:(id)a3
{
}

- (void)showOptions:(id)a3
{
  if ([(THiOSStudyViewController *)self optionsPopoverController])
  {
    [(THiOSStudyViewController *)self dismissStudyOptionsMenu:1 completion:0];
  }
  else
  {
    double v5 = [[THStudyOptionsPopoverController alloc] initWithOptions:[(THNoteCardsController *)self->_noteCardsController studyOptions]];
    [(THStudyOptionsPopoverController *)v5 setOverrideUserInterfaceStyle:[(THiOSStudyViewController *)self overrideUserInterfaceStyle]];
    [(THiOSStudyViewController *)self setOptionsPopoverController:v5];
    objc_opt_class();
    +[IMTheme themeWithIdentifier:kIMThemeIdentifierDynamicTheme];
    [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] setTheme:TSUDynamicCast()];
    [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] setDelegate:self];
    id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:[self optionsPopoverController]];
    [v9 setOverrideUserInterfaceStyle:[self overrideUserInterfaceStyle]];
    [v9 setNavigationBarHidden:0];
    [v9 setToolbarHidden:1];
    [v9 setDelegate:[self optionsPopoverController]];
    [v9 setModalPresentationStyle:7];
    id v6 = [v9 popoverPresentationController];
    objc_opt_class();
    uint64_t v7 = TSUDynamicCast();
    if (v7)
    {
      [v6 setBarButtonItem:v7];
    }
    else
    {
      [v6 setSourceView:[a3 superview]];
      [a3 frame];
      [v6 setSourceRect:];
    }
    [v6 setPermittedArrowDirections:15];
    [v6 setDelegate:self];
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
    [(-[THStudyOptionsPopoverController navigationItem](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationItem")) setRightBarButtonItem:v8 animated:0];
    [v6 setPassthroughViews:[NSArray arrayWithObjects:[self optionsButton], [self doneButton], 0]];
    [v6 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v5];
    [(THiOSStudyViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = [a3 presentedViewController];
  if (v4 == [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] navigationController])
  {
    id v5 = [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] navigationItem];
    [v5 setRightBarButtonItem:0 animated:0];
  }
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5 = [a3 presentedViewController];
  if (v5 == [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] navigationController])
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
    [(-[THStudyOptionsPopoverController navigationItem](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationItem")) setRightBarButtonItem:v6 animated:0];
  }
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [a3 presentedViewController];
  if (v4 == [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] navigationController])
  {
    [(THiOSStudyViewController *)self dismissStudyOptionsMenu:1 completion:0];
  }
}

- (int64_t)p_styleForPresentation:(id)a3
{
  if (a3)
  {
    unsigned int v4 = [a3 horizontalSizeClass] == (char *)&dword_0 + 1;
    unsigned int v5 = [a3 verticalSizeClass] == (char *)&dword_0 + 1;
  }
  else
  {
    unsigned int v4 = [(THiOSStudyViewController *)self im_isCompactWidth];
    unsigned int v5 = [(THiOSStudyViewController *)self im_isCompactHeight];
  }
  int64_t v7 = 7;
  if (v5) {
    int64_t v7 = 1;
  }
  if (v4) {
    return 0;
  }
  else {
    return v7;
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4 = [a3 presentedViewController];
  if (v4 != [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] navigationController])return 7; {

  }
  return [(THiOSStudyViewController *)self p_styleForPresentation:0];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = [a3 presentedViewController];
  if (v6 != [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] navigationController])return 7; {

  }
  return [(THiOSStudyViewController *)self p_styleForPresentation:a4];
}

- (void)dismissStudyOptionsMenu:(BOOL)a3 completion:(id)a4
{
  [(THStudyOptionsPopoverController *)[(THiOSStudyViewController *)self optionsPopoverController] dismissViewControllerAnimated:a3 completion:a4];

  [(THiOSStudyViewController *)self setOptionsPopoverController:0];
}

- (void)updateWithNavigationUnit:(id)a3 title:(id)a4
{
  [(THNoteCardsController *)self->_noteCardsController updateWithNavigationUnit:a3 contentNode:0];
  titleLabel = self->_titleLabel;

  [(UILabel *)titleLabel setText:a4];
}

- (void)p_stageTransitionAnimationIn:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [(UIView *)[(THiOSStudyViewController *)self backdrop] setAlpha:v5];
  [(UIButton *)[(THiOSStudyViewController *)self optionsButton] setAlpha:v5];
  [(UIButton *)[(THiOSStudyViewController *)self doneButton] setAlpha:v5];
  [(UILabel *)[(THiOSStudyViewController *)self titleLabel] setAlpha:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(THNoteCardsController *)self->_noteCardsController noteCards];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    if (v3) {
      double v9 = 1.0;
    }
    else {
      double v9 = -2.0;
    }
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 setFlownOut:v3 direction:0.0];
        [v12 updateTransformAnimated:0 duration:0.0];
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  self->_isTransitioningInOut = 1;
}

- (void)transitionInWithCompletion:(id)a3
{
  [(THiOSStudyViewController *)self p_stageTransitionAnimationIn:1];

  [(THiOSStudyViewController *)self p_animateTransitionInWithCompletion:a3];
}

- (void)p_animateTransitionInWithCompletion:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_E1970;
  v9[3] = &unk_456DE0;
  v9[4] = self;
  +[UIView animateWithDuration:0x10000 delay:v9 options:0 animations:0.67 completion:0.0];
  v7[5] = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E19A0;
  v8[3] = &unk_456DE0;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_E1A04;
  v7[3] = &unk_459300;
  v7[4] = self;
  +[UIView animateWithDuration:0x20000 delay:v8 options:v7 animations:0.33 completion:0.67];
  dispatch_time_t v5 = dispatch_time(0, 400000005);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E1A48;
  block[3] = &unk_456DE0;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)transitionOutWithCompletion:(id)a3
{
  [(THiOSStudyViewController *)self p_stageTransitionAnimationIn:0];

  [(THiOSStudyViewController *)self p_animateTransitionOutWithCompletion:a3];
}

- (void)p_animateTransitionOutWithCompletion:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dispatch_time_t v5 = [(THNoteCardsController *)self->_noteCardsController noteCards];
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) setFlownOut:1 direction:1 animated:-2.0 duration:0.0];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_E1DE0;
  v12[3] = &unk_456DE0;
  v12[4] = self;
  +[UIView animateWithDuration:0x10000 delay:v12 options:0 animations:0.33 completion:0.0];
  v10[5] = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_E1E44;
  v11[3] = &unk_456DE0;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_E1E74;
  v10[3] = &unk_459300;
  v10[4] = self;
  +[UIView animateWithDuration:0x20000 delay:v11 options:v10 animations:0.67 completion:0.33];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  [(THiOSStudyViewController *)&v4 viewDidAppear:a3];
  [(THiOSStudyViewController *)self becomeFirstResponder];
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (a3 == 1
    && [(THStudyOptions *)[(THNoteCardsController *)self->_noteCardsController studyOptions] shuffle])
  {
    noteCardsController = self->_noteCardsController;
    [(THNoteCardsController *)noteCardsController shuffleCards];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  [a4 locationInView:[self view]];
  double v7 = v6;
  double v9 = v8;
  unsigned int v10 = -[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:");
  unsigned int v11 = -[THNoteCardsController isBottomCardAtPoint:](self->_noteCardsController, "isBottomCardAtPoint:", v7, v9);
  unsigned int v12 = v11;
  if (self->_tapGR != a3)
  {
    if (self->_panGR == a3 || self->_flickGR == a3) {
      return v10 | v11;
    }
    return 0;
  }
  if (v10)
  {
    BOOL result = [(THNoteCardsController *)self->_noteCardsController canFlipTopCard];
    if (result || ((v12 ^ 1) & 1) != 0) {
      return result;
    }
  }
  else if (!v11)
  {
    return 0;
  }
  noteCardsController = self->_noteCardsController;

  return [(THNoteCardsController *)noteCardsController showingMultipleCards];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_panGR == a3 && ([a4 view], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)p_layoutViewsWithDuration:(double)a3
{
  [(THiOSStudyViewController *)self p_cardEdgeInsets];
  noteCardsController = self->_noteCardsController;
  [self view].bounds;
  -[THNoteCardsController updateFrame:insets:animated:duration:](noteCardsController, "updateFrame:insets:animated:duration:", a3 != 0.0, *(void *)&a3);
  [self view].bounds;
  TSDRectGetMaxPoint();
  TSDPointLength();
  [self view].bounds;
  TSDCenterOfRect();
  TSDRectWithCenterAndSize();
  -[UIView setFrame:]([(THiOSStudyViewController *)self backdrop], "setFrame:", v6, v7, v8, v9);
  if ([(THiOSStudyViewController *)self im_isCompactWidth])
  {
    if ([(THiOSStudyViewController *)self im_isCompactHeight]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  titleLabel = self->_titleLabel;

  [(UILabel *)titleLabel setNumberOfLines:v10];
}

- (BOOL)p_showingMultipleCards
{
  return [(THNoteCardsController *)self->_noteCardsController showingMultipleCards];
}

- (void)p_setupGestureRecognizers
{
  BOOL v3 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"p_handlePanGesture:"];
  self->_panGR = v3;
  [(UIPanGestureRecognizer *)v3 setDelegate:self];
  [(UIPanGestureRecognizer *)self->_panGR setMinimumNumberOfTouches:1];
  [(UIPanGestureRecognizer *)self->_panGR setMaximumNumberOfTouches:1];
  [self.view addGestureRecognizer:self->_panGR];
  objc_super v4 = [[THFlickGestureRecognizer alloc] initWithTarget:self action:"p_handleFlickGesture:"];
  self->_flickGR = v4;
  [(THFlickGestureRecognizer *)v4 setDelegate:self];
  [(THFlickGestureRecognizer *)self->_flickGR setDelaysTouchesBegan:1];
  [self->_flickGR addGestureRecognizer:[self view]];
  dispatch_time_t v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"p_handleTapGesture:"];
  self->_tapGR = v5;
  [(UITapGestureRecognizer *)v5 setDelegate:self];
  [(UITapGestureRecognizer *)self->_tapGR setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_tapGR setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)self->_tapGR setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)self->_tapGR setDelaysTouchesEnded:0];
  [self->_tapGR addGestureRecognizer:[self view]];
  [(UIPanGestureRecognizer *)self->_panGR requireGestureRecognizerToFail:self->_flickGR];
  double v6 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"p_handlePanGesture:"];
  self->_indirectPanGR = v6;
  [(UIPanGestureRecognizer *)v6 setAllowedTouchTypes:&off_499938];
  [(UIPanGestureRecognizer *)self->_indirectPanGR setAllowedScrollTypesMask:3];
  [(UIPanGestureRecognizer *)self->_indirectPanGR setDelegate:self];
  [(UIPanGestureRecognizer *)self->_indirectPanGR setCancelsTouchesInView:0];
  id v7 = [(THiOSStudyViewController *)self view];
  indirectPanGR = self->_indirectPanGR;

  [v7 addGestureRecognizer:indirectPanGR];
}

- (void)p_handleTapGesture:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    [a3 locationInView:[self view]];
    double v6 = v5;
    double v8 = v7;
    unsigned int v9 = -[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:");
    noteCardsController = self->_noteCardsController;
    if (v9)
    {
      [(THNoteCardsController *)noteCardsController flipTopCard];
    }
    else if (-[THNoteCardsController isBottomCardAtPoint:](noteCardsController, "isBottomCardAtPoint:", v6, v8))
    {
      long long v13 = self->_noteCardsController;
      -[THNoteCardsController animateBottomCardToTopInDirection:](v13, "animateBottomCardToTopInDirection:", 1.0, 0.0);
    }
  }
}

- (void)p_handlePanGesture:(id)a3
{
  double v5 = (char *)[a3 state];
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    [a3 locationInView:[self view]];
    self->_dragStartLocation.x = v6;
    self->_dragStartLocation.y = v7;
  }
  else if ((unint64_t)(v5 - 1) > 1)
  {
    if ((unint64_t)(v5 - 3) <= 1)
    {
      if (self->_dragging)
      {
        noteCardsController = self->_noteCardsController;
        [a3 direction];
        -[THNoteCardsController endDragInDirection:](noteCardsController, "endDragInDirection:");
      }
      self->_dragging = 0;
    }
    return;
  }
  [a3 translationInView:[self view]];
  double v9 = v8;
  CGFloat v11 = v10;
  if (-[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:", self->_dragStartLocation.x, self->_dragStartLocation.y))
  {
    id v12 = [(THNoteCardsController *)self->_noteCardsController topScrollView];
    if ([v12 canScroll])
    {
      if (fabs(v9) <= 50.0) {
        return;
      }
      [v12 contentOffset];
      double v14 = v13;
      double v16 = v15;
      [v12 setScrollEnabled:0];
      [v12 setContentOffset:v14, v16];
    }
  }
  if (!self->_dragging)
  {
    self->_dragStartOffset.x = v9;
    self->_dragStartOffset.y = v11;
    v17 = self->_noteCardsController;
    TSDAddPoints();
    -[THNoteCardsController beginDragAtPoint:](v17, "beginDragAtPoint:");
    self->_dragging = 1;
  }
  v18 = self->_noteCardsController;
  TSDSubtractPoints();

  -[THNoteCardsController setDragOffset:](v18, "setDragOffset:");
}

- (void)p_handleFlickGesture:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    [a3 translationInView:[self view]];
    double v6 = v5;
    double v8 = v7;
    [a3 initialLocationInView:[self view]];
    double v10 = v9;
    double v12 = v11;
    unsigned int v13 = -[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:");
    noteCardsController = self->_noteCardsController;
    if (v13)
    {
      -[THNoteCardsController animateTopCardToBottomInDirection:](noteCardsController, "animateTopCardToBottomInDirection:", v6, v8);
    }
    else if (-[THNoteCardsController isBottomCardAtPoint:](noteCardsController, "isBottomCardAtPoint:", v10, v12))
    {
      double v15 = self->_noteCardsController;
      -[THNoteCardsController animateBottomCardToTopInDirection:](v15, "animateBottomCardToTopInDirection:", v6, v8);
    }
  }
}

- (void)_keyLeft:(id)a3
{
}

- (void)_keyRight:(id)a3
{
}

- (void)_keySpace:(id)a3
{
}

- (void)_keyEnter:(id)a3
{
}

- (THiOSStudyViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THiOSStudyViewControllerDelegate *)a3;
}

- (UIView)backdrop
{
  return (UIView *)self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIButton)optionsButton
{
  return self->_optionsButton;
}

- (void)setOptionsButton:(id)a3
{
}

- (THStudyOptionsPopoverController)optionsPopoverController
{
  return self->_optionsPopoverController;
}

- (void)setOptionsPopoverController:(id)a3
{
}

- (IMTheme)theme
{
  return self->_theme;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

@end