@interface TSKPopoverController
+ (BOOL)anyPopoversVisible;
+ (double)defaultPopoverPlacementPadding;
- (BOOL)dismissAnimatedOnOrientationChange;
- (BOOL)dismissOnMoviePlayback;
- (BOOL)dismissOnUndo;
- (BOOL)popoverControllerShouldDismissPopover:(id)a3;
- (TSKPopoverController)initWithContentViewController:(id)a3;
- (void)dealloc;
- (void)moviePlaybackWillBegin:(id)a3;
- (void)p_applicationDidEnterBackground:(id)a3;
- (void)p_dismissPopoverAnimated:(BOOL)a3;
- (void)p_orientationWillChange:(id)a3;
- (void)p_sendPopoverHidDelegateMessage;
- (void)p_willShowPopoverNotification:(id)a3;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6 constrainToView:(BOOL)a7 withPadding:(double)a8;
- (void)setDelegate:(id)a3;
- (void)setDismissAnimatedOnOrientationChange:(BOOL)a3;
- (void)setDismissOnMoviePlayback:(BOOL)a3;
- (void)setDismissOnUndo:(BOOL)a3;
@end

@implementation TSKPopoverController

+ (BOOL)anyPopoversVisible
{
  BOOL result = gVisiblePopovers;
  if (gVisiblePopovers) {
    return CFArrayGetCount((CFArrayRef)gVisiblePopovers) > 0;
  }
  return result;
}

+ (double)defaultPopoverPlacementPadding
{
  return 30.0;
}

- (TSKPopoverController)initWithContentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSKPopoverController;
  v3 = [(TSKPopoverController *)&v7 initWithContentViewController:a3];
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_p_orientationWillChange_, @"TSKWillRotateToInterfaceOrientation", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_p_willShowPopoverNotification_, @"TSKPopoverControllerWillShowPopoverNotification", 0);
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_p_applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
    [(TSKPopoverController *)v3 setDismissOnMoviePlayback:1];
    [(TSKPopoverController *)v3 setDismissAnimatedOnOrientationChange:1];
    v6.receiver = v3;
    v6.super_class = (Class)TSKPopoverController;
    [(TSKPopoverController *)&v6 setDelegate:v3];
    -[TSKPopoverController setBackgroundColor:](v3, "setBackgroundColor:", [MEMORY[0x263F1C550] whiteColor]);
  }
  return v3;
}

- (void)dealloc
{
  CFArrayRef v3 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v6.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v6.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v6, self);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)gVisiblePopovers, FirstIndexOfValue);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)TSKPopoverController;
  [(TSKPopoverController *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->mSavedDelegate = (UIPopoverControllerDelegate *)a3;
}

- (void)p_sendPopoverHidDelegateMessage
{
  [(TSKPopoverController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    CFArrayRef v3 = (void *)[(TSKPopoverController *)self delegate];
    [v3 popoverControllerDidDismissPopover:self];
  }
}

- (void)p_dismissPopoverAnimated:(BOOL)a3
{
  if (!self->mIsDismissing)
  {
    BOOL v3 = a3;
    objc_super v5 = self;
    self->mIsDismissing = 1;
    CFArrayRef v6 = (const __CFArray *)gVisiblePopovers;
    if (gVisiblePopovers)
    {
      v8.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
      v8.location = 0;
      LODWORD(v6) = CFArrayGetFirstIndexOfValue(v6, v8, self) != -1;
    }
    if (([(TSKPopoverController *)self isPopoverVisible] & 1) != 0 || v6)
    {
      if ([(TSKPopoverController *)self popoverControllerShouldDismissPopover:self])
      {
        v7.receiver = self;
        v7.super_class = (Class)TSKPopoverController;
        [(TSKPopoverController *)&v7 dismissPopoverAnimated:v3];
        [(TSKPopoverController *)self p_sendPopoverHidDelegateMessage];
      }
    }
    self->mIsDismissing = 0;
  }
}

- (void)p_willShowPopoverNotification:(id)a3
{
  if ((TSKPopoverController *)[a3 object] != self)
  {
    [(TSKPopoverController *)self p_dismissPopoverAnimated:1];
  }
}

- (void)setDismissOnMoviePlayback:(BOOL)a3
{
  self->BOOL mDismissOnMoviePlayback = a3;
  CFArrayRef v3 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v8.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v8.location = 0;
    if (CFArrayGetFirstIndexOfValue(v3, v8, self) != -1)
    {
      BOOL mDismissOnMoviePlayback = self->mDismissOnMoviePlayback;
      CFArrayRef v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      if (mDismissOnMoviePlayback)
      {
        [v6 addObserver:self selector:sel_moviePlaybackWillBegin_ name:@"TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification" object:0];
      }
      else
      {
        [v6 removeObserver:self name:@"TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification" object:0];
      }
    }
  }
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6 constrainToView:(BOOL)a7 withPadding:(double)a8
{
  BOOL v8 = a6;
  double height = a3.size.height;
  double x = a3.origin.x;
  if (a7)
  {
    CGFloat v14 = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    [a4 bounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v21 = x;
    double v23 = v22;
    double v25 = v24;
    [(TSKPopoverController *)self popoverContentSize];
    CGFloat v35 = v21;
    double v36 = v26;
    double v32 = v27;
    v39.origin.double x = v21;
    CGFloat v34 = width;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    double height = v14;
    v39.size.double height = v14;
    v46.origin.double x = v18;
    v46.origin.CGFloat y = v20;
    v46.size.CGFloat width = v23;
    v46.size.double height = v25;
    CGRect v40 = CGRectIntersection(v39, v46);
    CGFloat v28 = v40.origin.x;
    CGFloat v29 = v40.size.width;
    CGFloat v30 = v40.size.height;
    CGFloat rect = v40.origin.y;
    if (CGRectGetMinX(v40) > v36 + a8) {
      goto LABEL_5;
    }
    v41.origin.CGFloat y = rect;
    v41.origin.double x = v28;
    v41.size.CGFloat width = v29;
    v41.size.double height = v30;
    if (v23 - CGRectGetMaxX(v41) > v36 + a8) {
      goto LABEL_5;
    }
    v42.origin.double x = v28;
    v42.origin.CGFloat y = rect;
    v42.size.CGFloat width = v29;
    v42.size.double height = v30;
    if (CGRectGetMinY(v42) <= v32 + a8)
    {
      v43.origin.double x = v28;
      v43.origin.CGFloat y = rect;
      v43.size.CGFloat width = v29;
      v43.size.double height = v30;
      BOOL v31 = v25 - CGRectGetMaxY(v43) <= v32 + a8;
      a3.size.CGFloat width = v34;
      double x = v35;
      a3.origin.CGFloat y = y;
      if (v31)
      {
        v44.origin.double x = v28;
        v44.origin.CGFloat y = rect;
        v44.size.CGFloat width = v29;
        v44.size.double height = v30;
        double x = CGRectGetMidX(v44);
        v45.origin.double x = v28;
        v45.origin.CGFloat y = rect;
        v45.size.CGFloat width = v29;
        v45.size.double height = v30;
        a3.origin.CGFloat y = CGRectGetMidY(v45);
        a3.size.CGFloat width = 1.0;
        double height = 1.0;
      }
    }
    else
    {
LABEL_5:
      a3.size.CGFloat width = v34;
      double x = v35;
      a3.origin.CGFloat y = y;
    }
  }
  -[TSKPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, v8, x, a3.origin.y, a3.size.width, height, a8);
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  CGRect v19 = CGRectIntegral(a3);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKPopoverControllerWillShowPopoverNotification", self);
  CFArrayRef v14 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v18.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v18.location = 0;
    if (CFArrayGetFirstIndexOfValue(v14, v18, self) != -1) {
      goto LABEL_7;
    }
    Mutable = (__CFArray *)gVisiblePopovers;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    gVisiblePopovers = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, self);
  if ([(TSKPopoverController *)self dismissOnMoviePlayback]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_moviePlaybackWillBegin_, @"TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification", 0);
  }
LABEL_7:
  objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "addPopoverController:", self);
  [MEMORY[0x263F158F8] begin];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__TSKPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
  v17[3] = &unk_2646AF7B8;
  v17[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v17];
  v16.receiver = self;
  v16.super_class = (Class)TSKPopoverController;
  -[TSKPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v16, sel_presentPopoverFromRect_inView_permittedArrowDirections_animated_, a4, a5, v6, x, y, width, height);
  [MEMORY[0x263F158F8] commit];
}

uint64_t __88__TSKPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"TSKPopoverControllerDidShowPopoverNotification" object:v3];
}

- (void)moviePlaybackWillBegin:(id)a3
{
  Main = CFRunLoopGetMain();
  objc_super v5 = (const void *)*MEMORY[0x263EFFE78];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TSKPopoverController_moviePlaybackWillBegin___block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  CFRunLoopPerformBlock(Main, v5, block);
  CFRunLoopWakeUp(Main);
}

uint64_t __47__TSKPopoverController_moviePlaybackWillBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_dismissPopoverAnimated:", 1);
}

- (void)p_orientationWillChange:(id)a3
{
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (int v5 = [(UIPopoverControllerDelegate *)self->mSavedDelegate popoverControllerShouldDismissPopover:a3]) != 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKWillDismissPopoverNotification", self);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  CFArrayRef v5 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v10.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v10.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v10, self);
    if (FirstIndexOfValue != -1)
    {
      CFIndex v7 = FirstIndexOfValue;
      if ([(TSKPopoverController *)self dismissOnMoviePlayback]) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification", 0);
      }
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)gVisiblePopovers, v7);
    }
  }
  objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "removePopoverController:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKDidDismissPopover", self);
  if (objc_opt_respondsToSelector())
  {
    mSavedDelegate = self->mSavedDelegate;
    [(UIPopoverControllerDelegate *)mSavedDelegate popoverControllerDidDismissPopover:a3];
  }
}

- (void)p_applicationDidEnterBackground:(id)a3
{
}

- (BOOL)dismissOnUndo
{
  return self->mDismissOnUndo;
}

- (void)setDismissOnUndo:(BOOL)a3
{
  self->mDismissOnUndo = a3;
}

- (BOOL)dismissOnMoviePlayback
{
  return self->mDismissOnMoviePlayback;
}

- (BOOL)dismissAnimatedOnOrientationChange
{
  return self->mDismissAnimatedOnOrientationChange;
}

- (void)setDismissAnimatedOnOrientationChange:(BOOL)a3
{
  self->mDismissAnimatedOnOrientationChange = a3;
}

@end