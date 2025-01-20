@interface TSAViewController
- (BOOL)coachingTipsWereShowingBeforeRotation;
- (BOOL)firstLaunchCoachingTipsWereShowingBeforeRotation;
- (BOOL)isFirstLaunchCoachingTipShowing;
- (BOOL)isLayoutBelowApplicationToolbar;
- (BOOL)isPresentingModalViewController;
- (BOOL)isViewVisible;
- (BOOL)modalToolbarSupportsUndo;
- (BOOL)shouldShowHelpOnAppear;
- (BOOL)showFirstLaunchCoachingTipAfterViewAppears;
- (BOOL)viewDidAppear;
- (NSArray)leftApplicationToolbarItems;
- (NSArray)rightApplicationToolbarItems;
- (NSString)toolbarButtonModalGearImageName;
- (UIColor)applicationBackgroundColor;
- (UIColor)applicationToolbarBackgroundColor;
- (UIColor)applicationToolbarTintColor;
- (UIColor)applicationToolbarTitleColor;
- (double)leftToolbarItemsInset;
- (double)leftToolbarItemsMaximumWidth;
- (double)rightToolbarItemsInset;
- (double)rightToolbarItemsMaximumWidth;
- (id)coachingTipsButton;
- (id)firstLaunchCoachingTipShownUserDefaultKey;
- (id)imageViewFromSnapshotOfView:(id)a3;
- (id)toolbarButtonForCoachingTipsWithTarget:(id)a3 action:(SEL)a4;
- (id)toolbarButtonForModalDone;
- (id)toolbarButtonForModalDoneWithTarget:(id)a3 action:(SEL)a4;
- (id)toolbarButtonForUndoWithIsModal:(BOOL)a3;
- (id)toolbarButtonItemForCoachingTipsWithTarget:(id)a3 action:(SEL)a4;
- (id)toolbarButtonWithImageName:(id)a3 disabledImageName:(id)a4 target:(id)a5 action:(SEL)a6;
- (id)toolbarButtonWithImageName:(id)a3 target:(id)a4 action:(SEL)a5;
- (id)toolbarButtonWithTitle:(id)a3 target:(id)a4 action:(SEL)a5 isModal:(BOOL)a6;
- (void)dealloc;
- (void)dismissHelpWithCompletion:(id)a3;
- (void)p_startListeningForVoiceOverNotifications;
- (void)p_stopListeningForVoiceOverNotifications;
- (void)p_voiceOverStatusDidChange;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setCoachingTipsWereShowingBeforeRotation:(BOOL)a3;
- (void)setFirstLaunchCoachingTipsWereShowingBeforeRotation:(BOOL)a3;
- (void)setLeftApplicationToolbarItems:(id)a3;
- (void)setLeftToolbarItemsMaximumWidth:(double)a3;
- (void)setRightApplicationToolbarItems:(id)a3;
- (void)setRightToolbarItemsMaximumWidth:(double)a3;
- (void)setShouldShowHelpOnAppear:(BOOL)a3;
- (void)setShowFirstLaunchCoachingTipAfterViewAppears:(BOOL)a3;
- (void)setViewDidAppear:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSAViewController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSAViewController;
  [(TSAViewController *)&v3 dealloc];
}

- (BOOL)isViewVisible
{
  int v3 = [(TSAViewController *)self isViewLoaded];
  if (v3) {
    LOBYTE(v3) = objc_msgSend((id)-[TSAViewController view](self, "view"), "superview") != 0;
  }
  return v3;
}

- (BOOL)isLayoutBelowApplicationToolbar
{
  return 1;
}

- (UIColor)applicationBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithWhite:0.870588243 alpha:1.0];
}

- (UIColor)applicationToolbarTitleColor
{
  return 0;
}

- (UIColor)applicationToolbarTintColor
{
  return 0;
}

- (UIColor)applicationToolbarBackgroundColor
{
  return 0;
}

- (id)toolbarButtonWithTitle:(id)a3 target:(id)a4 action:(SEL)a5 isModal:(BOOL)a6
{
  v9 = objc_msgSend(MEMORY[0x263F1C488], "buttonWithType:", 1, a4, a5, a6);
  [v9 setExclusiveTouch:1];
  objc_msgSend((id)objc_msgSend(v9, "titleLabel"), "setFont:", objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 17.0));
  [v9 setTitle:a3 forState:0];
  [v9 sizeToFit];
  if (a5) {
    [v9 addTarget:a4 action:a5 forControlEvents:64];
  }
  return v9;
}

- (id)toolbarButtonWithImageName:(id)a3 target:(id)a4 action:(SEL)a5
{
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSAViewController toolbarButtonWithImageName:target:action:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSAViewController.m"), 245, @"Invalid parameter not satisfying: %s", "imageName");
  }
  v10 = (void *)[MEMORY[0x263F1C488] buttonWithType:1];
  [v10 setExclusiveTouch:1];
  objc_msgSend(v10, "setImage:forState:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:", a3), 0);
  [v10 sizeToFit];
  if (a5) {
    [v10 addTarget:a4 action:a5 forControlEvents:64];
  }
  return v10;
}

- (id)toolbarButtonWithImageName:(id)a3 disabledImageName:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v7 = [(TSAViewController *)self toolbarButtonWithImageName:a3 target:a5 action:a6];
  v8 = v7;
  if (a4)
  {
    [v7 setAdjustsImageWhenDisabled:0];
    objc_msgSend(v8, "setImage:forState:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:", a4), 2);
  }
  return v8;
}

- (NSString)toolbarButtonModalGearImageName
{
  return (NSString *)@"TSA_GearIcon";
}

- (id)toolbarButtonForUndoWithIsModal:(BOOL)a3
{
  int v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSAViewController toolbarButtonForUndoWithIsModal:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSAViewController.m"), 286, @"No undo toolbar button");
  return 0;
}

- (id)toolbarButtonForModalDone
{
  return [(TSAViewController *)self toolbarButtonForModalDoneWithTarget:0 action:0];
}

- (id)toolbarButtonForModalDoneWithTarget:(id)a3 action:(SEL)a4
{
  id v4 = -[TSAViewController toolbarButtonWithTitle:target:action:isModal:](self, "toolbarButtonWithTitle:target:action:isModal:", [(id)TSABundle() localizedStringForKey:@"Done" value:&stru_26D688A48 table:@"TSApplication"], a3, a4, 1);
  objc_msgSend(v4, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 17.0, *MEMORY[0x263F1D330]));
  [v4 sizeToFit];
  return v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSAViewController *)self p_stopListeningForVoiceOverNotifications];
  v5.receiver = self;
  v5.super_class = (Class)TSAViewController;
  [(TSAViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSAViewController;
  [(TSAViewController *)&v4 viewDidAppear:a3];
  [(TSAViewController *)self setViewDidAppear:1];
  if ([(TSAViewController *)self showFirstLaunchCoachingTipAfterViewAppears])
  {
    [(TSAViewController *)self setShowFirstLaunchCoachingTipAfterViewAppears:0];
    [(TSAViewController *)self showFirstLaunchCoachingTipIfNecessary];
  }
  [(TSAViewController *)self p_startListeningForVoiceOverNotifications];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSAViewController *)self setViewDidAppear:0];
  v5.receiver = self;
  v5.super_class = (Class)TSAViewController;
  [(TSAViewController *)&v5 viewDidDisappear:v3];
}

- (void)p_startListeningForVoiceOverNotifications
{
  BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1CF90];

  [v3 addObserver:self selector:sel_p_voiceOverStatusDidChange name:v4 object:0];
}

- (void)p_voiceOverStatusDidChange
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(TSAViewController *)self dismissCoachingTips];
  }
}

- (void)p_stopListeningForVoiceOverNotifications
{
  BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1CF90];

  [v3 removeObserver:self name:v4 object:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  [(TSAViewController *)self dismissCoachingTips];
  v9.receiver = self;
  v9.super_class = (Class)TSAViewController;
  [(TSAViewController *)&v9 presentViewController:a3 animated:v6 completion:a5];
}

- (BOOL)isPresentingModalViewController
{
  return [(TSAViewController *)self presentedViewController] != 0;
}

- (BOOL)modalToolbarSupportsUndo
{
  return 0;
}

- (id)imageViewFromSnapshotOfView:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
  objc_super v5 = objc_msgSend((id)objc_msgSend(a3, "window"), "screen");
  if (v5)
  {
    [v5 scale];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
  }
  [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
  [a3 bounds];
  objc_msgSend(a3, "sizeThatFits:", v8, v9);
  double v12 = TSDMultiplySizeScalar(v10, v11, v7);
  double v13 = TSDCeilSize(v12);
  v14 = TSDBitmapContextCreate(11, v13);
  if (v14)
  {
    v15 = v14;
    CGContextScaleCTM(v14, v7, v7);
    objc_msgSend((id)objc_msgSend(a3, "layer"), "renderInContext:", v15);
    Image = CGBitmapContextCreateImage(v15);
    CGContextRelease(v15);
    if (Image)
    {
      uint64_t v17 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image scale:0 orientation:v7];
      CGImageRelease(Image);
      Image = (CGImage *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v17];
      [(CGImage *)Image setContentScaleFactor:v7];
    }
  }
  else
  {
    Image = 0;
  }
  [MEMORY[0x263F1CB60] setAnimationsEnabled:v4];

  return Image;
}

- (id)toolbarButtonForCoachingTipsWithTarget:(id)a3 action:(SEL)a4
{
  return [(TSAViewController *)self toolbarButtonWithImageName:@"help_reg" disabledImageName:0 target:a3 action:a4];
}

- (id)toolbarButtonItemForCoachingTipsWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithCustomView:", -[TSAViewController toolbarButtonForCoachingTipsWithTarget:action:](self, "toolbarButtonForCoachingTipsWithTarget:action:", a3, a4));

  return v4;
}

- (void)dismissHelpWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)isFirstLaunchCoachingTipShowing
{
  return 0;
}

- (id)coachingTipsButton
{
  return 0;
}

- (id)firstLaunchCoachingTipShownUserDefaultKey
{
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);

  return [(NSString *)v3 stringByAppendingString:@"FirstLaunchCoachingTipShownKey"];
}

- (NSArray)leftApplicationToolbarItems
{
  return self->_leftApplicationToolbarItems;
}

- (void)setLeftApplicationToolbarItems:(id)a3
{
}

- (NSArray)rightApplicationToolbarItems
{
  return self->_rightApplicationToolbarItems;
}

- (void)setRightApplicationToolbarItems:(id)a3
{
}

- (double)leftToolbarItemsInset
{
  return self->_leftToolbarItemsInset;
}

- (double)rightToolbarItemsInset
{
  return self->_rightToolbarItemsInset;
}

- (double)leftToolbarItemsMaximumWidth
{
  return self->_leftToolbarItemsMaximumWidth;
}

- (void)setLeftToolbarItemsMaximumWidth:(double)a3
{
  self->_leftToolbarItemsMaximumWidth = a3;
}

- (double)rightToolbarItemsMaximumWidth
{
  return self->_rightToolbarItemsMaximumWidth;
}

- (void)setRightToolbarItemsMaximumWidth:(double)a3
{
  self->_rightToolbarItemsMaximumWidth = a3;
}

- (BOOL)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(BOOL)a3
{
  self->_viewDidAppear = a3;
}

- (BOOL)showFirstLaunchCoachingTipAfterViewAppears
{
  return self->_showFirstLaunchCoachingTipAfterViewAppears;
}

- (void)setShowFirstLaunchCoachingTipAfterViewAppears:(BOOL)a3
{
  self->_showFirstLaunchCoachingTipAfterViewAppears = a3;
}

- (BOOL)firstLaunchCoachingTipsWereShowingBeforeRotation
{
  return self->_firstLaunchCoachingTipsWereShowingBeforeRotation;
}

- (void)setFirstLaunchCoachingTipsWereShowingBeforeRotation:(BOOL)a3
{
  self->_firstLaunchCoachingTipsWereShowingBeforeRotation = a3;
}

- (BOOL)coachingTipsWereShowingBeforeRotation
{
  return self->_coachingTipsWereShowingBeforeRotation;
}

- (void)setCoachingTipsWereShowingBeforeRotation:(BOOL)a3
{
  self->_coachingTipsWereShowingBeforeRotation = a3;
}

- (BOOL)shouldShowHelpOnAppear
{
  return self->_shouldShowHelpOnAppear;
}

- (void)setShouldShowHelpOnAppear:(BOOL)a3
{
  self->_shouldShowHelpOnAppear = a3;
}

@end