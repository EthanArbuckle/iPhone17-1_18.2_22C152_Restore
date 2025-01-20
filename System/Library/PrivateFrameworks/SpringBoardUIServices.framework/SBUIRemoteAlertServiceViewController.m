@interface SBUIRemoteAlertServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_selectorIsOverriden:(SEL)a3;
- (SBUIRemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)sb_dismissForAlertAnimated:(BOOL)a3 completion:(id)a4;
- (void)sb_presentForAlertAnimated:(BOOL)a3 completion:(id)a4;
- (void)sb_preserveInputViewsAnimated:(BOOL)a3;
- (void)sb_restoreInputViewsAnimated:(BOOL)a3;
- (void)synchronizeAnimationsInActions:(id)a3;
@end

@implementation SBUIRemoteAlertServiceViewController

- (SBUIRemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIRemoteAlertServiceViewController;
  return [(SBUIRemoteAlertServiceViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)dealloc
{
  if (self->_hasPreservedInputViews) {
    [(SBUIRemoteAlertServiceViewController *)self sb_restoreInputViewsAnimated:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBUIRemoteAlertServiceViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 dealloc];
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v7 = (uint64_t (**)(id))a4;
  uint64_t v5 = [(SBUIRemoteAlertServiceViewController *)self _selectorIsOverriden:sel_prepareForActivationWithContext_completion_];
  v6 = v7;
  if (v7 && (v5 & 1) == 0)
  {
    uint64_t v5 = v7[2](v7);
    v6 = v7;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBUIRemoteAlertServiceViewController *)self _selectorIsOverriden:sel_handleButtonActions_])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v6) {
      goto LABEL_23;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "events", (void)v13);
        char v11 = v10;
        if (v10)
        {
          [(SBUIRemoteAlertServiceViewController *)self handleLockButtonPressed];
          if ((v11 & 2) == 0)
          {
LABEL_9:
            if ((v11 & 4) == 0) {
              goto LABEL_10;
            }
            goto LABEL_18;
          }
        }
        else if ((v10 & 2) == 0)
        {
          goto LABEL_9;
        }
        [(SBUIRemoteAlertServiceViewController *)self handleVolumeUpButtonPressed];
        if ((v11 & 4) == 0)
        {
LABEL_10:
          if ((v11 & 8) == 0) {
            goto LABEL_11;
          }
          goto LABEL_19;
        }
LABEL_18:
        [(SBUIRemoteAlertServiceViewController *)self handleVolumeDownButtonPressed];
        if ((v11 & 8) == 0)
        {
LABEL_11:
          if ((v11 & 0x20) == 0) {
            goto LABEL_12;
          }
          goto LABEL_20;
        }
LABEL_19:
        [(SBUIRemoteAlertServiceViewController *)self handleHeadsetButtonPressed:0];
        if ((v11 & 0x20) == 0)
        {
LABEL_12:
          if ((v11 & 0x10) == 0) {
            goto LABEL_14;
          }
LABEL_13:
          [(SBUIRemoteAlertServiceViewController *)self handleHomeButtonPressed];
          goto LABEL_14;
        }
LABEL_20:
        [(SBUIRemoteAlertServiceViewController *)self handleHeadsetButtonPressed:1];
        if ((v11 & 0x10) != 0) {
          goto LABEL_13;
        }
LABEL_14:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v12;
      if (!v12)
      {
LABEL_23:

        break;
      }
    }
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)synchronizeAnimationsInActions:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = (void *)MEMORY[0x1AD0CEF60]();
  if ([(SBUIRemoteAlertServiceViewController *)self _appearState])
  {
    if (self->_hasSentAnimationFence)
    {
      [MEMORY[0x1E4F42D58] _synchronizeDrawing];
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
    }
    self->_hasSentAnimationFence = 1;
    uint64_t v7 = (void *)*MEMORY[0x1E4F43630];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__SBUIRemoteAlertServiceViewController_synchronizeAnimationsInActions___block_invoke;
    v9[3] = &unk_1E5CCC580;
    v9[4] = self;
    [v7 _performBlockAfterCATransactionCommits:v9];
    uint64_t v8 = [(SBUIRemoteAlertServiceViewController *)self _remoteViewControllerProxy];
    [v8 _participateInSystemAnimationFence:v6];
  }
  v4[2](v4);
}

uint64_t __71__SBUIRemoteAlertServiceViewController_synchronizeAnimationsInActions___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 977) = 0;
  return result;
}

- (void)sb_preserveInputViewsAnimated:(BOOL)a3
{
  if (!self->_hasPreservedInputViews)
  {
    BOOL v3 = a3;
    self->_hasPreservedInputViews = 1;
    id v6 = [MEMORY[0x1E4F42C68] sharedInstance];
    id v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v6 _preserveInputViewsWithId:v5 animated:v3];
  }
}

- (void)sb_restoreInputViewsAnimated:(BOOL)a3
{
  if (self->_hasPreservedInputViews)
  {
    BOOL v3 = a3;
    self->_hasPreservedInputViews = 0;
    id v6 = [MEMORY[0x1E4F42C68] sharedInstance];
    id v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v6 _restoreInputViewsWithId:v5 animated:v3];
  }
}

- (void)sb_presentForAlertAnimated:(BOOL)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)sb_dismissForAlertAnimated:(BOOL)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD5B1A0];
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD3F240];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_handleButtonActions_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v8 forSelector:sel_prepareForActivationWithContext_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

- (BOOL)_selectorIsOverriden:(SEL)a3
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a3];
  return v4 != [(id)objc_opt_class() instanceMethodForSelector:a3];
}

@end