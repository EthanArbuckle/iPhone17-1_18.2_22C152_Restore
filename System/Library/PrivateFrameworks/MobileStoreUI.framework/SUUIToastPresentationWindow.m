@interface SUUIToastPresentationWindow
- (BOOL)isInternalWindow;
- (SUUIToastPresentationWindow)init;
- (id)_presentationViewController;
- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SUUIToastPresentationWindow

- (SUUIToastPresentationWindow)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIToastPresentationWindow;
  v2 = [(UIApplicationRotationFollowingWindow *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(SUUIToastPresentationWindow *)v2 setOpaque:0];
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIToastPresentationWindow *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F82B60] mainScreen];
    [(SUUIToastPresentationWindow *)v3 setScreen:v5];

    [(SUUIToastPresentationWindow *)v3 setWindowLevel:*MEMORY[0x263F83C48]];
    [(SUUIToastPresentationWindow *)v3 setHidden:1];
  }
  return v3;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(SUUIToastPresentationWindow *)self _presentationViewController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__SUUIToastPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_265403930;
  id v13 = v8;
  id v11 = v8;
  [v10 presentViewController:v9 animated:v5 completion:v12];
}

uint64_t __73__SUUIToastPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v13 = (void (**)(id, BOOL))a5;
  id v9 = a3;
  v10 = [(SUUIToastPresentationWindow *)self _presentationViewController];
  id v11 = [v10 presentedViewController];
  if (v11)
  {

    if (v11 != v9)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"SUUIToastPresentationWindow.m", 48, @"Multiple alert controllers assigned to the same window: %@", self object file lineNumber description];
    }
    if (v13) {
      v13[2](v13, v11 == v9);
    }
  }
  else
  {
    [(SUUIToastPresentationWindow *)self presentViewController:v9 animated:v5 completion:v13];
  }
}

- (id)_presentationViewController
{
  v3 = [(SUUIToastPresentationWindow *)self rootViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F82440]);
    [v4 setSizesWindowToScene:1];
    [(SUUIToastPresentationWindow *)self setRootViewController:v4];
  }
  return (id)[(SUUIToastPresentationWindow *)self rootViewController];
}

@end