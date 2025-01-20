@interface SUUIStatusBarAlertCenter
+ (id)sharedCenter;
- (BOOL)isVisible;
- (NSString)message;
- (SUUIStatusBarAlertCenter)init;
- (_SUUIClickThroughWindow)window;
- (_SUUIStatusBarAlertViewController)rootViewController;
- (double)duration;
- (id)actionBlock;
- (void)dismiss;
- (void)scheduleDismiss;
- (void)setActionBlock:(id)a3;
- (void)setDuration:(double)a3;
- (void)setVisible:(BOOL)a3;
- (void)showMessage:(id)a3 withStyle:(int64_t)a4 forDuration:(double)a5 actionBlock:(id)a6;
- (void)statusBarAlertViewControllerWasTapped:(id)a3;
- (void)unscheduleDismiss;
@end

@implementation SUUIStatusBarAlertCenter

+ (id)sharedCenter
{
  if (sharedCenter_onceToken != -1) {
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_46);
  }
  v2 = (void *)sharedCenter_sharedHeadsUp;
  return v2;
}

uint64_t __40__SUUIStatusBarAlertCenter_sharedCenter__block_invoke()
{
  v0 = objc_alloc_init(SUUIStatusBarAlertCenter);
  uint64_t v1 = sharedCenter_sharedHeadsUp;
  sharedCenter_sharedHeadsUp = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SUUIStatusBarAlertCenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIStatusBarAlertCenter;
  v2 = [(SUUIStatusBarAlertCenter *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(_SUUIStatusBarAlertViewController);
    rootViewController = v2->_rootViewController;
    v2->_rootViewController = v3;

    [(_SUUIStatusBarAlertViewController *)v2->_rootViewController setDelegate:v2];
    v5 = [_SUUIClickThroughWindow alloc];
    v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 bounds];
    uint64_t v7 = -[_SUUIClickThroughWindow initWithFrame:](v5, "initWithFrame:");
    window = v2->_window;
    v2->_window = (_SUUIClickThroughWindow *)v7;

    [(_SUUIClickThroughWindow *)v2->_window setWindowLevel:*MEMORY[0x263F83C60]];
    [(_SUUIClickThroughWindow *)v2->_window setRootViewController:v2->_rootViewController];
    [(_SUUIClickThroughWindow *)v2->_window _setWindowControlsStatusBarOrientation:0];
    v2->_duration = 3.0;
  }
  return v2;
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(SUUIStatusBarAlertCenter *)self window];
  [v4 setHidden:v3];
}

- (BOOL)isVisible
{
  v2 = [(SUUIStatusBarAlertCenter *)self window];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (NSString)message
{
  v2 = [(SUUIStatusBarAlertCenter *)self rootViewController];
  char v3 = [v2 message];

  return (NSString *)v3;
}

- (void)showMessage:(id)a3 withStyle:(int64_t)a4 forDuration:(double)a5 actionBlock:(id)a6
{
  id v10 = a6;
  if (a5 < 2.22044605e-16) {
    a5 = 3.0;
  }
  id v11 = a3;
  v12 = [(SUUIStatusBarAlertCenter *)self rootViewController];
  [v12 setMessage:v11];

  [(SUUIStatusBarAlertCenter *)self setDuration:a5];
  v13 = [(SUUIStatusBarAlertCenter *)self rootViewController];
  [v13 endAllAnimations];

  if ([(SUUIStatusBarAlertCenter *)self isVisible])
  {
    [(SUUIStatusBarAlertCenter *)self unscheduleDismiss];
    v14 = (void *)MEMORY[0x263F82E00];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke;
    v28[3] = &unk_265406EC8;
    v28[4] = self;
    int64_t v30 = a4;
    id v29 = v10;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_2;
    v27[3] = &unk_265400AC8;
    v27[4] = self;
    [v14 animateWithDuration:v28 animations:v27 completion:0.2];
  }
  else
  {
    v15 = [MEMORY[0x263F82E88] keyWindow];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 rootViewController];
      uint64_t v18 = [v17 supportedInterfaceOrientations];
    }
    else
    {
      v17 = [(SUUIStatusBarAlertCenter *)self rootViewController];
      uint64_t v18 = [v17 defaultInterfaceOrientations];
    }
    uint64_t v19 = v18;
    v20 = [(SUUIStatusBarAlertCenter *)self rootViewController];
    [v20 setSupportedInterfaceOrientations:v19];

    v21 = [(SUUIStatusBarAlertCenter *)self rootViewController];
    [v21 setStyle:a4];

    [(SUUIStatusBarAlertCenter *)self setActionBlock:v10];
    v22 = [(SUUIStatusBarAlertCenter *)self rootViewController];
    v23 = [v22 statusBarView];
    v24 = [(SUUIStatusBarAlertCenter *)self window];
    [v24 setInteractionView:v23];

    [(SUUIStatusBarAlertCenter *)self setVisible:1];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_3;
    v26[3] = &unk_265400980;
    v26[4] = self;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_4;
    v25[3] = &unk_265400AC8;
    v25[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v26 animations:v25 completion:0.2];
  }
}

uint64_t __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rootViewController];
  [v2 setOnScreen:1];

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) rootViewController];
  [v4 setStyle:v3];

  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 setActionBlock:v6];
}

uint64_t __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) scheduleDismiss];
  }
  return result;
}

void __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) rootViewController];
  [v1 setOnScreen:1];
}

uint64_t __74__SUUIStatusBarAlertCenter_showMessage_withStyle_forDuration_actionBlock___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) scheduleDismiss];
  }
  return result;
}

- (void)unscheduleDismiss
{
}

- (void)scheduleDismiss
{
  [(SUUIStatusBarAlertCenter *)self duration];
  -[SUUIStatusBarAlertCenter performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_dismiss, 0);
}

- (void)dismiss
{
  [(SUUIStatusBarAlertCenter *)self unscheduleDismiss];
  if ([(SUUIStatusBarAlertCenter *)self isVisible])
  {
    uint64_t v3 = [(SUUIStatusBarAlertCenter *)self rootViewController];
    [v3 endAllAnimations];

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__SUUIStatusBarAlertCenter_dismiss__block_invoke;
    v5[3] = &unk_265400980;
    v5[4] = self;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __35__SUUIStatusBarAlertCenter_dismiss__block_invoke_2;
    v4[3] = &unk_265400AC8;
    v4[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v5 animations:v4 completion:0.2];
  }
}

void __35__SUUIStatusBarAlertCenter_dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) rootViewController];
  [v1 setOnScreen:0];
}

uint64_t __35__SUUIStatusBarAlertCenter_dismiss__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setVisible:0];
    uint64_t v3 = [*(id *)(v2 + 32) rootViewController];
    [v3 setMessage:0];

    id v4 = *(void **)(v2 + 32);
    return [v4 setActionBlock:0];
  }
  return result;
}

- (void)statusBarAlertViewControllerWasTapped:(id)a3
{
  [(SUUIStatusBarAlertCenter *)self dismiss];
  id v4 = [(SUUIStatusBarAlertCenter *)self actionBlock];

  if (v4)
  {
    v5 = [(SUUIStatusBarAlertCenter *)self actionBlock];
    v5[2]();
  }
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (_SUUIClickThroughWindow)window
{
  return self->_window;
}

- (_SUUIStatusBarAlertViewController)rootViewController
{
  return self->_rootViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end