@interface SUWebViewRotationController
- (void)finishRotationFromInterfaceOrientation:(int64_t)a3;
- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3;
@end

@implementation SUWebViewRotationController

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  if (![(SUViewController *)self->super._viewController _isEnteringForeground])
  {
    v4 = (void *)[(SUViewController *)self->super._viewController webView];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom")
      || ([v4 frame], !CGRectEqualToRect(v8, *MEMORY[0x263F001A8])))
    {
      [v4 endSynchronousLayout];
    }
    if ([v4 superview])
    {
      objc_msgSend((id)objc_msgSend(v4, "superview"), "bounds");
      objc_msgSend(v4, "setFrame:");
    }
    viewController = self->super._viewController;
    uint64_t v6 = [(SUViewController *)viewController interfaceOrientation];
    [(SUViewController *)viewController _setLastKnownOrientation:v6];
  }
}

- (void)prepareToRotateToInterfaceOrientation:(int64_t)a3
{
  BOOL v5 = [(SUViewController *)self->super._viewController _isEnteringForeground];
  viewController = self->super._viewController;
  v7 = (void *)[(SUViewController *)viewController webView];
  CGRect v8 = v7;
  if (v5)
  {
    [v7 setHidden:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__SUWebViewRotationController_prepareToRotateToInterfaceOrientation___block_invoke;
    v10[3] = &unk_264812A50;
    v10[4] = viewController;
    v10[5] = a3;
    dispatch_after(0, MEMORY[0x263EF83A0], v10);
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") {
         || ([v8 frame], !CGRectEqualToRect(v12, *MEMORY[0x263F001A8])))
  }
  {
    [v8 beginSynchronousLayout];
    v9 = self->super._viewController;
    [(SUViewController *)v9 _sendOrientationWillChangeToInterfaceOrientation:a3];
  }
}

uint64_t __69__SUWebViewRotationController_prepareToRotateToInterfaceOrientation___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) webView];
  [MEMORY[0x263F158F8] begin];
  [v2 beginSynchronousLayout];
  [*(id *)(a1 + 32) _sendOrientationWillChangeToInterfaceOrientation:*(void *)(a1 + 40)];
  [v2 endSynchronousLayout];
  [v2 setHidden:0];
  v3 = (void *)MEMORY[0x263F158F8];

  return [v3 commit];
}

@end