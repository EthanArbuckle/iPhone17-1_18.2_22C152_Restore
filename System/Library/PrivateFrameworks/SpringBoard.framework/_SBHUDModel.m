@interface _SBHUDModel
+ (id)HUDModelForController:(id)a3 viewController:(id)a4 identifier:(id)a5;
- (BOOL)_shouldIgnoreDropletAttachment;
- (BOOL)isDismissalScheduled;
- (BOOL)isDismissed;
- (BOOL)isDismissing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPresented;
- (BOOL)isPresenting;
- (BOOL)isVisible;
- (BSInvalidatable)dropletLayoutAssertion;
- (NSString)description;
- (NSString)identifier;
- (SBHUDController)HUDController;
- (SBHUDViewControlling)HUDViewController;
- (double)dismissalInterval;
- (void)_handleDropletLayoutCallback:(double)a3;
- (void)_setupDropletLayout;
- (void)_teardownDropletLayout;
- (void)dealloc;
- (void)dismiss;
- (void)dismissAnimated:(BOOL)a3;
- (void)hudViewController:(id)a3 didDismissHUD:(id)a4;
- (void)hudViewController:(id)a3 didPresentHUD:(id)a4;
- (void)hudViewController:(id)a3 willDismissHUD:(id)a4;
- (void)hudViewController:(id)a3 willPresentHUD:(id)a4;
- (void)invalidateDismissalTimer;
- (void)presentWithDismissalInterval:(double)a3;
- (void)presentWithDismissalInterval:(double)a3 animated:(BOOL)a4;
- (void)rescheduleDismissalTimer;
- (void)scheduleDismissalTimer;
- (void)setDismissed:(BOOL)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setPresented:(BOOL)a3;
- (void)setPresenting:(BOOL)a3;
- (void)updateAttachmentStateForHUDViewController:(id)a3;
@end

@implementation _SBHUDModel

+ (id)HUDModelForController:(id)a3 viewController:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"SBHUDController.m", 527, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"SBHUDController.m", 526, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v9) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"SBHUDController.m", 528, @"Invalid parameter not satisfying: %@", @"HUDController" object file lineNumber description];

LABEL_4:
  v13 = objc_opt_new();
  v14 = (void *)v13[4];
  v13[4] = v9;
  id v15 = v9;

  v16 = (void *)v13[3];
  v13[3] = v10;
  id v17 = v10;

  v18 = (void *)v13[6];
  v13[6] = v12;

  return v13;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_dropletLayoutAssertion invalidate];
  dropletLayoutAssertion = self->_dropletLayoutAssertion;
  self->_dropletLayoutAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)_SBHUDModel;
  [(_SBHUDModel *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = SBSafeCast(v5, v4);

  if (v6)
  {
    v7 = [(_SBHUDModel *)self identifier];
    v8 = [v6 identifier];
    char v9 = [v7 isEqual:v8];

    id v10 = [v6 HUDViewController];
    uint64_t v11 = [(_SBHUDModel *)self HUDViewController];
    char v12 = [v10 isEqual:v11];

    v13 = [v6 HUDController];
    v14 = [(_SBHUDModel *)self HUDController];
    LOBYTE(v11) = [v13 isEqual:v14];

    char v15 = v11 & v9 & v12;
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(_SBHUDModel *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isPresenting](self, "isPresenting"), @"isPresenting");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isPresented](self, "isPresented"), @"isPresented");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isDismissing](self, "isDismissing"), @"isDismissing");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isDismissed](self, "isDismissed"), @"isDismissing");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isDismissalScheduled](self, "isDismissalScheduled"), @"isDismissalScheduled");
  uint64_t v11 = [v3 build];

  return (NSString *)v11;
}

- (BOOL)isDismissalScheduled
{
  return self->_dismissalTimer != 0;
}

- (BOOL)isVisible
{
  if ([(_SBHUDModel *)self isPresenting] || [(_SBHUDModel *)self isPresented]) {
    return 1;
  }
  return [(_SBHUDModel *)self isDismissing];
}

- (void)presentWithDismissalInterval:(double)a3
{
}

- (void)presentWithDismissalInterval:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(_SBHUDModel *)self invalidateDismissalTimer];
  self->_dismissalInterval = a3;
  id v7 = [(_SBHUDModel *)self HUDController];
  [v7 _presentHUD:self animated:v4];
}

- (void)dismiss
{
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(_SBHUDModel *)self invalidateDismissalTimer];
  id v5 = [(_SBHUDModel *)self HUDController];
  [v5 _dismissHUD:self animated:v3];
}

- (void)invalidateDismissalTimer
{
  dismissalTimer = self->_dismissalTimer;
  if (dismissalTimer)
  {
    [(NSTimer *)dismissalTimer invalidate];
    BOOL v4 = self->_dismissalTimer;
    self->_dismissalTimer = 0;
  }
}

- (void)scheduleDismissalTimer
{
  [(_SBHUDModel *)self dismissalInterval];
  double v5 = v4;
  if (BSFloatGreaterThanFloat())
  {
    if (self->_dismissalTimer)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBHUDController.m" lineNumber:614 description:@"Dismissal Timer already set! Something is messed up!"];
    }
    id v6 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_dismiss selector:0 userInfo:0 repeats:v5];
    dismissalTimer = self->_dismissalTimer;
    self->_dismissalTimer = v6;

    id v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v9 addTimer:self->_dismissalTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)rescheduleDismissalTimer
{
  [(_SBHUDModel *)self invalidateDismissalTimer];
  [(_SBHUDModel *)self scheduleDismissalTimer];
}

- (void)_setupDropletLayout
{
  uint64_t v3 = [(SBHUDViewControlling *)self->_HUDViewController triggerButton];
  if (v3) {
    BOOL v4 = v3 == 9;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v5 = v3;
    id v6 = [(SBHUDController *)self->_HUDController windowScene];
    id v7 = [v6 hardwareButtonBezelEffectsCoordinator];

    char v8 = [v7 hintDropletsEnabled];
    HUDViewController = self->_HUDViewController;
    if (v8)
    {
      [(SBHUDViewControlling *)HUDViewController setAttachmentDelegate:self];
      objc_initWeak(&location, self);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      char v15 = __34___SBHUDModel__setupDropletLayout__block_invoke;
      v16 = &unk_1E6B00380;
      objc_copyWeak(&v17, &location);
      id v10 = (void *)MEMORY[0x1D948C7A0](&v13);
      [(BSInvalidatable *)self->_dropletLayoutAssertion invalidate];
      uint64_t v11 = [v7 setDropletLayoutCallback:v10 forButton:v5];
      dropletLayoutAssertion = self->_dropletLayoutAssertion;
      self->_dropletLayoutAssertion = v11;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      [(SBHUDViewControlling *)HUDViewController setAttachmentDelegate:0];
    }
  }
}

- (void)_teardownDropletLayout
{
  dropletLayoutAssertion = self->_dropletLayoutAssertion;
  if (dropletLayoutAssertion)
  {
    [(BSInvalidatable *)dropletLayoutAssertion invalidate];
    BOOL v4 = self->_dropletLayoutAssertion;
    self->_dropletLayoutAssertion = 0;
  }
}

- (BOOL)_shouldIgnoreDropletAttachment
{
  uint64_t v3 = [(SBHUDViewControlling *)self->_HUDViewController attachmentIgnoredOrientations];
  uint64_t v4 = [(SBHUDViewControlling *)self->_HUDViewController interfaceOrientation];
  return MEMORY[0x1F410C3B8](v3, v4);
}

- (void)_handleDropletLayoutCallback:(double)a3
{
  BOOL v5 = [(_SBHUDModel *)self _shouldIgnoreDropletAttachment];
  HUDViewController = self->_HUDViewController;
  if (v5)
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    uint64_t v9 = [(SBHUDViewControlling *)HUDViewController interfaceOrientation];
    double v8 = 0.0;
    if ((unint64_t)(v9 - 3) >= 2) {
      double v7 = a3;
    }
    else {
      double v7 = 0.0;
    }
    if ((unint64_t)(v9 - 3) < 2) {
      double v8 = a3;
    }
    HUDViewController = self->_HUDViewController;
  }
  -[SBHUDViewControlling setPositionOffset:](HUDViewController, "setPositionOffset:", v7, v8);
}

- (void)updateAttachmentStateForHUDViewController:(id)a3
{
  uint64_t v4 = [(SBHUDViewControlling *)self->_HUDViewController triggerButton];
  if (v4 && self->_dropletLayoutAssertion)
  {
    uint64_t v5 = v4;
    int v6 = [(SBHUDViewControlling *)self->_HUDViewController isHUDAttached];
    uint64_t v7 = v6 & ~[(_SBHUDModel *)self _shouldIgnoreDropletAttachment];
    id v9 = [(SBHUDController *)self->_HUDController windowScene];
    double v8 = [v9 hardwareButtonBezelEffectsCoordinator];
    [v8 updateHintContentVisibility:v7 forButton:v5 animationSettings:0];
  }
}

- (void)hudViewController:(id)a3 willDismissHUD:(id)a4
{
  -[_SBHUDModel setPresented:](self, "setPresented:", 1, a4);
  [(_SBHUDModel *)self setPresenting:0];
  [(_SBHUDModel *)self setDismissing:1];
  [(_SBHUDModel *)self setDismissed:0];
}

- (void)hudViewController:(id)a3 didDismissHUD:(id)a4
{
  -[_SBHUDModel setPresented:](self, "setPresented:", 0, a4);
  [(_SBHUDModel *)self setPresenting:0];
  [(_SBHUDModel *)self setDismissing:0];
  [(_SBHUDModel *)self setDismissed:1];
  [(_SBHUDModel *)self _teardownDropletLayout];
}

- (void)hudViewController:(id)a3 willPresentHUD:(id)a4
{
  [(_SBHUDModel *)self _setupDropletLayout];
  [(_SBHUDModel *)self setPresenting:1];
  [(_SBHUDModel *)self setPresented:0];
  [(_SBHUDModel *)self setDismissing:0];
  [(_SBHUDModel *)self setDismissed:0];
}

- (void)hudViewController:(id)a3 didPresentHUD:(id)a4
{
  -[_SBHUDModel setPresenting:](self, "setPresenting:", 0, a4);
  [(_SBHUDModel *)self setPresented:1];
  [(_SBHUDModel *)self setDismissing:0];
  [(_SBHUDModel *)self setDismissed:0];
}

- (SBHUDViewControlling)HUDViewController
{
  return self->_HUDViewController;
}

- (SBHUDController)HUDController
{
  return self->_HUDController;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (double)dismissalInterval
{
  return self->_dismissalInterval;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BSInvalidatable)dropletLayoutAssertion
{
  return self->_dropletLayoutAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropletLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
  objc_storeStrong((id *)&self->_HUDViewController, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
}

@end