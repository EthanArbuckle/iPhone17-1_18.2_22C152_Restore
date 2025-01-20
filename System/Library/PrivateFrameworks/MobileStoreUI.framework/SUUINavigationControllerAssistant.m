@interface SUUINavigationControllerAssistant
+ (id)assistantForNavigationController:(id)a3 clientContext:(id)a4;
+ (id)existingAssistantForNavigationController:(id)a3;
- (BOOL)hidesShadow;
- (SUUIClientContext)clientContext;
- (SUUIStatusOverlayProvider)statusOverlayProvider;
- (UINavigationController)navigationController;
- (UIView)childPaletteView;
- (UIViewController)statusOverlayViewController;
- (_UINavigationControllerPalette)paletteBackgroundView;
- (id)_initWithNavigationController:(id)a3 clientContext:(id)a4;
- (void)_hideChildPaletteView:(id)a3 animated:(BOOL)a4;
- (void)_hideOverlayView:(id)a3 animated:(BOOL)a4;
- (void)_previewDocumentChangeNotification:(id)a3;
- (void)_setStatusOverlayProvider:(id)a3 animated:(BOOL)a4;
- (void)_showOverlayView:(id)a3 previousOverlayView:(id)a4 animated:(BOOL)a5;
- (void)_transitionToPaletteView:(id)a3 animated:(BOOL)a4 operation:(int64_t)a5;
- (void)dealloc;
- (void)setChildPaletteView:(id)a3;
- (void)setHidesShadow:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setPaletteBackgroundView:(id)a3;
- (void)setPalettePinningBarHidden:(BOOL)a3;
- (void)setPaletteView:(id)a3 animated:(BOOL)a4;
- (void)setStatusOverlayProvider:(id)a3;
- (void)setStatusOverlayViewController:(id)a3;
- (void)willShowViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation SUUINavigationControllerAssistant

- (id)_initWithNavigationController:(id)a3 clientContext:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUUINavigationControllerAssistant;
  v7 = [(SUUINavigationControllerAssistant *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_clientContext, a4);
    id v9 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v8->_navigationController, v9);

    id WeakRetained = objc_loadWeakRetained((id *)&v8->_navigationController);
    uint64_t v11 = [WeakRetained existingPaletteForEdge:2];
    paletteBackgroundView = v8->_paletteBackgroundView;
    v8->_paletteBackgroundView = (_UINavigationControllerPalette *)v11;

    if (!v8->_paletteBackgroundView)
    {
      id v13 = objc_loadWeakRetained((id *)&v8->_navigationController);
      uint64_t v14 = objc_msgSend(v13, "paletteForEdge:size:", 2, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      v15 = v8->_paletteBackgroundView;
      v8->_paletteBackgroundView = (_UINavigationControllerPalette *)v14;
    }
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v8 selector:sel__previewDocumentChangeNotification_ name:@"SUUIApplicationControllerPreviewOverlayDidChangeNotification" object:0];
  }
  objc_destroyWeak(&location);
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUUIApplicationControllerPreviewOverlayDidChangeNotification" object:0];
  [v3 removeObserver:self name:0x2704F80F0 object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUINavigationControllerAssistant;
  [(SUUINavigationControllerAssistant *)&v4 dealloc];
}

+ (id)assistantForNavigationController:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v5 _outermostNavigationController];

    id v5 = (id)v7;
  }
  objc_getAssociatedObject(v5, "com.apple.iTunesStoreUI.SUUINavigationControllerAssistant");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v8 = [[SUUINavigationControllerAssistant alloc] _initWithNavigationController:v5 clientContext:v6];
    objc_setAssociatedObject(v5, "com.apple.iTunesStoreUI.SUUINavigationControllerAssistant", v8, (void *)1);
  }

  return v8;
}

+ (id)existingAssistantForNavigationController:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 _outermostNavigationController];

    id v3 = (id)v4;
  }
  id v5 = objc_getAssociatedObject(v3, "com.apple.iTunesStoreUI.SUUINavigationControllerAssistant");

  return v5;
}

- (void)setHidesShadow:(BOOL)a3
{
  if (self->_hidesShadow != a3)
  {
    BOOL v3 = a3;
    self->_hidesShadow = a3;
    uint64_t v4 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    id v5 = v4;
    if (v3) {
      objc_msgSend(v4, "SUUI_beginHidingPaletteShadow");
    }
    else {
      objc_msgSend(v4, "SUUI_endHidingPaletteShadow");
    }
  }
}

- (void)setPalettePinningBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    [v7 _setPalettePinningBarHidden:v3];
  }
}

- (void)setPaletteView:(id)a3 animated:(BOOL)a4
{
}

- (void)setStatusOverlayProvider:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F82E00];
  id v5 = a3;
  -[SUUINavigationControllerAssistant setStatusOverlayProvider:animated:](self, "setStatusOverlayProvider:animated:", v5, [v4 _isInAnimationBlock]);
}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SUUINavigationControllerAssistant *)self childPaletteView];
  if ([v6 conformsToProtocol:&unk_270691FD8])
  {
    id v8 = [v6 navigationPaletteView];
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v8 = 0;
  if (v4)
  {
LABEL_5:
    id v9 = [v6 navigationController];
    v10 = [v9 viewControllers];
    id v11 = [v10 firstObject];
    BOOL v4 = v11 != v6;
  }
LABEL_6:
  v12 = [(SUUINavigationControllerAssistant *)self navigationController];
  -[SUUINavigationControllerAssistant _transitionToPaletteView:animated:operation:](self, "_transitionToPaletteView:animated:operation:", v8, v4, [v12 lastOperation]);

  id v13 = [(SUUINavigationControllerAssistant *)self navigationController];
  uint64_t v14 = [v13 topViewController];
  v15 = [v14 transitionCoordinator];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__SUUINavigationControllerAssistant_willShowViewController_animated___block_invoke;
  v17[3] = &unk_265406818;
  v17[4] = self;
  id v18 = v7;
  id v16 = v7;
  [v15 notifyWhenInteractionEndsUsingBlock:v17];
}

void __69__SUUINavigationControllerAssistant_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [v4 navigationController];
    objc_msgSend(v4, "_transitionToPaletteView:animated:operation:", v3, 0, objc_msgSend(v5, "lastOperation"));
  }
}

- (_UINavigationControllerPalette)paletteBackgroundView
{
  if (([(_UINavigationControllerPalette *)self->_paletteBackgroundView isAttached] & 1) == 0)
  {
    uint64_t v3 = [(SUUINavigationControllerAssistant *)self navigationController];
    [v3 attachPalette:self->_paletteBackgroundView isPinned:1];
  }
  paletteBackgroundView = self->_paletteBackgroundView;
  return paletteBackgroundView;
}

- (void)_previewDocumentChangeNotification:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(SUUINavigationControllerAssistant *)self statusOverlayProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = v11;
  if (isKindOfClass)
  {
    id v7 = [v11 object];
    id v8 = [v7 _previewOverlayDocumentController];
    if (([v8 isPreviewActive] & 1) == 0)
    {

      id v8 = 0;
    }
    id v9 = [(SUUINavigationControllerAssistant *)self navigationController];
    uint64_t IsVisible = SUUIViewControllerIsVisible(v9);

    [(SUUINavigationControllerAssistant *)self _setStatusOverlayProvider:v8 animated:IsVisible];
    id v6 = v11;
  }
}

- (void)_hideChildPaletteView:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(SUUINavigationControllerAssistant *)self statusOverlayViewController];
  v15 = [v14 view];

  if (v15)
  {
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v20 = v18;
  }
  else
  {
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v20 = 0.0;
  }
  uint64_t v22 = *MEMORY[0x263F00148];
  uint64_t v21 = *(void *)(MEMORY[0x263F00148] + 8);
  if (a4)
  {
    v23 = (void *)MEMORY[0x263F82E00];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __68__SUUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke;
    v28[3] = &unk_265406840;
    id v29 = v6;
    uint64_t v32 = v22;
    uint64_t v33 = v21;
    double v34 = v17;
    double v35 = v19;
    id v30 = v15;
    v31 = self;
    double v36 = v9;
    double v37 = v11;
    double v38 = v13;
    double v39 = v20;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __68__SUUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke_2;
    v26[3] = &unk_265406868;
    v26[4] = self;
    id v27 = v29;
    [v23 animateWithDuration:0 delay:v28 usingSpringWithDamping:v26 initialSpringVelocity:0.35 options:0.0 animations:0.7 completion:0.0];
  }
  else
  {
    objc_msgSend(v15, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v17, v19);
    v24 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    objc_msgSend(v24, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x263F82E00], "_isInAnimationBlockWithAnimationsEnabled"), v9, v11, v13, v20);

    v25 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    objc_msgSend(v25, "setPinningBarShadowIsHidden:", objc_msgSend(MEMORY[0x263F82E00], "_isInAnimationBlockWithAnimationsEnabled"));

    [v6 removeFromSuperview];
  }
}

void __68__SUUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v2 = [*(id *)(a1 + 48) paletteBackgroundView];
  objc_msgSend(v2, "setFrame:isAnimating:", 1, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

uint64_t __68__SUUINavigationControllerAssistant__hideChildPaletteView_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) paletteBackgroundView];
  [v2 setPinningBarShadowIsHidden:0];

  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 removeFromSuperview];
}

- (void)_hideOverlayView:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(SUUINavigationControllerAssistant *)self childPaletteView];

  if (v14)
  {
    v15 = [(SUUINavigationControllerAssistant *)self childPaletteView];
    [v15 bounds];
    double v17 = v16;
  }
  else
  {
    double v17 = 0.0;
  }
  if (a4)
  {
    double v18 = [(SUUINavigationControllerAssistant *)self childPaletteView];

    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x263F82E00]);
      [v6 frame];
      double v18 = objc_msgSend(v19, "initWithFrame:");
      double v20 = [MEMORY[0x263F825C8] clearColor];
      [v18 setBackgroundColor:v20];

      [v18 setClipsToBounds:1];
      uint64_t v21 = [v6 superview];
      uint64_t v22 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v21 insertSubview:v18 belowSubview:v22];

      [v18 bounds];
      objc_msgSend(v6, "setFrame:");
      [v18 addSubview:v6];
    }
    v23 = (void *)MEMORY[0x263F82E00];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __63__SUUINavigationControllerAssistant__hideOverlayView_animated___block_invoke;
    v31[3] = &unk_265403B48;
    id v32 = v6;
    uint64_t v33 = self;
    double v34 = v9;
    double v35 = v11;
    double v36 = v13;
    double v37 = v17;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __63__SUUINavigationControllerAssistant__hideOverlayView_animated___block_invoke_2;
    v28[3] = &unk_2654059B8;
    void v28[4] = self;
    id v29 = v32;
    id v30 = v18;
    id v24 = v18;
    [v23 animateWithDuration:0 delay:v31 usingSpringWithDamping:v28 initialSpringVelocity:0.35 options:0.0 animations:0.7 completion:0.0];
  }
  else
  {
    v25 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    objc_msgSend(v25, "setFrame:isAnimating:", 0, v9, v11, v13, v17);

    v26 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    id v27 = [(SUUINavigationControllerAssistant *)self childPaletteView];
    [v26 setPinningBarShadowIsHidden:v27 != 0];

    [v6 removeFromSuperview];
  }
}

void __63__SUUINavigationControllerAssistant__hideOverlayView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  id v2 = [*(id *)(a1 + 40) paletteBackgroundView];
  objc_msgSend(v2, "setFrame:isAnimating:", 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __63__SUUINavigationControllerAssistant__hideOverlayView_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) paletteBackgroundView];
  uint64_t v3 = [*(id *)(a1 + 32) childPaletteView];
  [v2 setPinningBarShadowIsHidden:v3 != 0];

  [*(id *)(a1 + 40) removeFromSuperview];
  BOOL v4 = *(void **)(a1 + 48);
  return [v4 removeFromSuperview];
}

- (void)_setStatusOverlayProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (SUUIStatusOverlayProvider *)a3;
  if (self->_statusOverlayProvider != v7)
  {
    double v16 = v7;
    double v8 = [(SUUINavigationControllerAssistant *)self statusOverlayViewController];
    double v9 = [v8 view];

    objc_storeStrong((id *)&self->_statusOverlayProvider, a3);
    double v10 = [MEMORY[0x263F82B60] mainScreen];
    double v11 = [v10 traitCollection];

    uint64_t v12 = [v11 userInterfaceStyle];
    if (objc_opt_respondsToSelector())
    {
      double v13 = [(SUUIStatusOverlayProvider *)self->_statusOverlayProvider overlayViewControllerWithBackgroundStyle:v12 != 1];
      [(SUUINavigationControllerAssistant *)self setStatusOverlayViewController:v13];
    }
    else
    {
      [(SUUINavigationControllerAssistant *)self setStatusOverlayViewController:0];
    }
    uint64_t v14 = [(SUUINavigationControllerAssistant *)self statusOverlayViewController];
    v15 = [v14 view];

    if (v15)
    {
      [(SUUINavigationControllerAssistant *)self _showOverlayView:v15 previousOverlayView:v9 animated:v4];
    }
    else if (v9)
    {
      [(SUUINavigationControllerAssistant *)self _hideOverlayView:v9 animated:v4];
    }

    id v7 = v16;
  }
}

- (void)_showOverlayView:(id)a3 previousOverlayView:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x4010000000;
  v65 = "";
  long long v66 = 0u;
  long long v67 = 0u;
  [v8 frame];
  *(void *)&long long v66 = v10;
  *((void *)&v66 + 1) = v11;
  *(void *)&long long v67 = v12;
  *((void *)&v67 + 1) = v13;
  *((_OWORD *)v63 + 2) = *MEMORY[0x263F00148];
  uint64_t v14 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  [v14 bounds];
  v63[6] = v15;

  double v16 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = *((double *)v63 + 7);
  id v24 = [(SUUINavigationControllerAssistant *)self childPaletteView];

  if (v24)
  {
    v25 = [(SUUINavigationControllerAssistant *)self childPaletteView];
    [v25 frame];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    double v33 = v32;

    v68.origin.x = v27;
    v68.origin.y = v29;
    v68.size.width = v31;
    v68.size.height = v33;
    *((CGFloat *)v63 + 5) = CGRectGetMaxY(v68);
    double v23 = v23 + v33;
  }
  [v8 setAutoresizingMask:2];
  objc_msgSend(v8, "setFrame:", *((double *)v63 + 4), *((double *)v63 + 5), *((double *)v63 + 6), *((double *)v63 + 7));
  [v8 layoutIfNeeded];
  double v34 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  [v34 addSubview:v8];

  double v35 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
  double v36 = [(SUUINavigationControllerAssistant *)self childPaletteView];
  [v35 setPinningBarShadowIsHidden:v36 != 0];

  [v9 removeFromSuperview];
  if (a5)
  {
    double v37 = [(SUUINavigationControllerAssistant *)self childPaletteView];

    if (v37)
    {
      id v38 = objc_alloc(MEMORY[0x263F82E00]);
      double v37 = objc_msgSend(v38, "initWithFrame:", *((double *)v63 + 4), *((double *)v63 + 5), *((double *)v63 + 6), *((double *)v63 + 7));
      double v39 = [MEMORY[0x263F825C8] clearColor];
      [v37 setBackgroundColor:v39];

      [v37 setClipsToBounds:1];
      v40 = [v8 superview];
      v41 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v40 insertSubview:v37 belowSubview:v41];

      [v37 bounds];
      objc_msgSend(v8, "setFrame:");
      [v37 addSubview:v8];
    }
    [v8 frame];
    v42 = (double *)v63;
    v63[6] = v43;
    v42[7] = v44;
    *((void *)v42 + 4) = v46;
    v42[5] = v45 - v44;
    objc_msgSend(v8, "setFrame:");
    v47 = (void *)MEMORY[0x263F82E00];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __83__SUUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke;
    v54[3] = &unk_265406890;
    v57 = &v62;
    id v55 = v8;
    v56 = self;
    double v58 = v18;
    double v59 = v20;
    double v60 = v22;
    double v61 = v23;
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __83__SUUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke_2;
    v49[3] = &unk_2654068B8;
    id v48 = v37;
    id v50 = v48;
    id v51 = v55;
    v52 = self;
    v53 = &v62;
    [v47 animateWithDuration:0 delay:v54 usingSpringWithDamping:v49 initialSpringVelocity:0.35 options:0.0 animations:0.7 completion:0.0];
  }
  else
  {
    id v48 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    objc_msgSend(v48, "setFrame:isAnimating:", 0, v18, v20, v22, v23);
  }

  _Block_object_dispose(&v62, 8);
}

void __83__SUUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 56)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 40);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  id v2 = [*(id *)(a1 + 40) paletteBackgroundView];
  objc_msgSend(v2, "setFrame:isAnimating:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __83__SUUINavigationControllerAssistant__showOverlayView_previousOverlayView_animated___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 40);
    uint64_t v3 = [*(id *)(result + 48) paletteBackgroundView];
    objc_msgSend(v3, "convertRect:fromView:", *(void *)(v1 + 32), *(double *)(*(void *)(*(void *)(v1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(v1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(v1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(v1 + 56) + 8) + 56));
    objc_msgSend(v2, "setFrame:");

    BOOL v4 = [*(id *)(v1 + 48) paletteBackgroundView];
    [v4 addSubview:*(void *)(v1 + 40)];

    id v5 = *(void **)(v1 + 32);
    return [v5 removeFromSuperview];
  }
  return result;
}

- (void)_transitionToPaletteView:(id)a3 animated:(BOOL)a4 operation:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(SUUINavigationControllerAssistant *)self childPaletteView];

  uint64_t v10 = [(SUUINavigationControllerAssistant *)self childPaletteView];
  uint64_t v11 = v10;
  if (v9 != v8)
  {
    [(SUUINavigationControllerAssistant *)self setChildPaletteView:v8];
    uint64_t v12 = [(SUUINavigationControllerAssistant *)self childPaletteView];

    if (v12)
    {
      uint64_t v13 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      [v13 bounds];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      double v19 = v18;
      double v21 = v20;

      uint64_t v75 = 0;
      v76 = (double *)&v75;
      uint64_t v77 = 0x4010000000;
      v78 = "";
      long long v79 = 0u;
      long long v80 = 0u;
      double v22 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v22 frame];
      *(void *)&long long v79 = v23;
      *((void *)&v79 + 1) = v24;
      *(void *)&long long v80 = v25;
      *((void *)&v80 + 1) = v26;

      CGFloat v27 = v76;
      v76[4] = 0.0;
      v27[5] = v21 - v27[7];
      v27[6] = v19;
      if (!v11) {
        goto LABEL_12;
      }
      if (a5 == 2)
      {
        double MaxX = -v19;
      }
      else
      {
        if (a5 != 1) {
          goto LABEL_12;
        }
        v81.origin.double x = v15;
        v81.origin.double y = v17;
        v81.size.double width = v19;
        v81.size.double height = v21;
        double MaxX = CGRectGetMaxX(v81);
        CGFloat v27 = v76;
      }
      v27[4] = MaxX;
LABEL_12:
      CGFloat v29 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v29 setAutoresizingMask:2];

      double v30 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      objc_msgSend(v30, "setFrame:", v76[4], v76[5], v76[6], v76[7]);

      CGFloat v31 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v31 layoutIfNeeded];

      double v32 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      double v33 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v32 addSubview:v33];

      double v34 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      [v34 setPinningBarShadowIsHidden:1];

      double v35 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      [v35 frame];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;

      v42 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      [v42 bounds];
      double MaxY = v43;

      double v45 = [(SUUINavigationControllerAssistant *)self statusOverlayViewController];
      uint64_t v46 = [v45 view];

      if (v46)
      {
        [v46 frame];
        v82.origin.double y = v76[7];
        double y = v82.origin.y;
        double x = v82.origin.x;
        double height = v82.size.height;
        double width = v82.size.width;
        double MaxY = CGRectGetMaxY(v82);
        if (v6)
        {
LABEL_14:
          v47 = (void *)MEMORY[0x263F82E00];
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __81__SUUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke;
          v58[3] = &unk_2654068E0;
          double v61 = &v75;
          v58[4] = self;
          id v59 = v11;
          int64_t v62 = a5;
          CGFloat v63 = v15;
          CGFloat v64 = v17;
          double v65 = v19;
          double v66 = v21;
          double v67 = v37;
          double v68 = v39;
          double v69 = v41;
          double v70 = MaxY;
          id v60 = v46;
          double v71 = x;
          double v72 = y;
          double v73 = width;
          double v74 = height;
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __81__SUUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke_2;
          v56[3] = &unk_265400AC8;
          id v57 = v59;
          [v47 animateWithDuration:0 delay:v58 usingSpringWithDamping:v56 initialSpringVelocity:0.35 options:0.0 animations:0.7 completion:0.0];

LABEL_17:
          _Block_object_dispose(&v75, 8);
          goto LABEL_18;
        }
      }
      else
      {
        double y = *(double *)(MEMORY[0x263F001A8] + 8);
        double x = *MEMORY[0x263F001A8];
        double height = *(double *)(MEMORY[0x263F001A8] + 24);
        double width = *(double *)(MEMORY[0x263F001A8] + 16);
        if (v6) {
          goto LABEL_14;
        }
      }
      *((_OWORD *)v76 + 2) = *MEMORY[0x263F00148];
      id v48 = [(SUUINavigationControllerAssistant *)self childPaletteView];
      objc_msgSend(v48, "setFrame:", v76[4], v76[5], v76[6], v76[7]);

      objc_msgSend(v46, "setFrame:", x, y, width, height);
      v49 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      objc_msgSend(v49, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x263F82E00], "_isInAnimationBlockWithAnimationsEnabled"), v37, v39, v41, MaxY);

      [v11 removeFromSuperview];
      id v50 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      [v50 setHidden:0];

      id v51 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
      [v51 setAlpha:1.0];

      goto LABEL_17;
    }
    [(SUUINavigationControllerAssistant *)self _hideChildPaletteView:v11 animated:v6];
LABEL_18:

    goto LABEL_19;
  }

  if (v11)
  {
    uint64_t v11 = [(SUUINavigationControllerAssistant *)self paletteBackgroundView];
    [v11 resetBackgroundConstraints];
    goto LABEL_18;
  }
LABEL_19:
}

void __81__SUUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *MEMORY[0x263F00148];
  id v2 = [*(id *)(a1 + 32) childPaletteView];
  objc_msgSend(v2, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));

  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9 == 2)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 72));
    }
    else if (v9 == 1)
    {
      double MaxX = MaxX - v5;
    }
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", MaxX, *(double *)(a1 + 128) - v8, v6, v8);
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  id v10 = [*(id *)(a1 + 32) paletteBackgroundView];
  objc_msgSend(v10, "setFrame:isAnimating:", objc_msgSend(MEMORY[0x263F82E00], "_isInAnimationBlockWithAnimationsEnabled"), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

uint64_t __81__SUUINavigationControllerAssistant__transitionToPaletteView_animated_operation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (BOOL)hidesShadow
{
  return self->_hidesShadow;
}

- (SUUIStatusOverlayProvider)statusOverlayProvider
{
  return self->_statusOverlayProvider;
}

- (UIView)childPaletteView
{
  return self->_childPaletteView;
}

- (void)setChildPaletteView:(id)a3
{
}

- (void)setPaletteBackgroundView:(id)a3
{
}

- (UIViewController)statusOverlayViewController
{
  return self->_statusOverlayViewController;
}

- (void)setStatusOverlayViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusOverlayViewController, 0);
  objc_storeStrong((id *)&self->_paletteBackgroundView, 0);
  objc_storeStrong((id *)&self->_childPaletteView, 0);
  objc_storeStrong((id *)&self->_statusOverlayProvider, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_navigationController);
}

@end