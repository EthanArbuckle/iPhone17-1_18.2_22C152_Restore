@interface TSWPEditMenuController
+ (BOOL)isAnimating;
+ (id)p_sharedEditMenuController;
+ (int)menuState;
+ (void)hideEditMenu;
+ (void)showEditMenuAtTargetRect:(CGRect)a3 canCenterHUD:(BOOL)a4 interactiveCanvasController:(id)a5;
- (BOOL)isBeginningEditing;
- (BOOL)showMenuOnKeyboard;
- (CGRect)targetRect;
- (TSWPEditMenuController)init;
- (UIView)targetView;
- (void)dealloc;
- (void)p_clearIsBeginningEditing;
- (void)p_didAnimateKeyboard;
- (void)p_didHideMenu:(id)a3;
- (void)p_didShowMenu:(id)a3;
- (void)p_setMenuVisible:(id)a3;
- (void)p_willHideMenu:(id)a3;
- (void)p_willShowMenu:(id)a3;
- (void)setIsBeginningEditing:(BOOL)a3;
- (void)setShowMenuOnKeyboard:(BOOL)a3;
- (void)setTargetRect:(CGRect)a3;
- (void)setTargetView:(id)a3;
@end

@implementation TSWPEditMenuController

+ (id)p_sharedEditMenuController
{
  if (+[TSWPEditMenuController p_sharedEditMenuController]::onceToken != -1) {
    dispatch_once(&+[TSWPEditMenuController p_sharedEditMenuController]::onceToken, &__block_literal_global_59);
  }
  v2 = (void *)+[TSWPEditMenuController p_sharedEditMenuController]::sSharedEditMenuController;

  return v2;
}

uint64_t __52__TSWPEditMenuController_p_sharedEditMenuController__block_invoke()
{
  +[TSWPEditMenuController p_sharedEditMenuController]::sSharedEditMenuController = objc_alloc_init(TSWPEditMenuController);

  return MEMORY[0x270F9A758]();
}

+ (int)menuState
{
  objc_msgSend(a1, "p_sharedEditMenuController");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  int v3 = v2[2];

  return v3;
}

+ (void)showEditMenuAtTargetRect:(CGRect)a3 canCenterHUD:(BOOL)a4 interactiveCanvasController:(id)a5
{
  BOOL v5 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v38 = a5;
  v11 = [MEMORY[0x263F1C7B0] sharedMenuController];
  [v38 visibleBoundsRectClippedToWindow];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  v51.origin.CGFloat x = v13;
  v51.origin.CGFloat y = v15;
  v51.size.CGFloat width = v17;
  v51.size.CGFloat height = v19;
  CGRect v43 = CGRectIntersection(v42, v51);
  CGFloat v39 = v43.origin.x;
  CGFloat v40 = v43.size.height;
  CGFloat v20 = v43.origin.y;
  double v21 = v43.size.width;
  [v11 setArrowDirection:0];
  v44.origin.CGFloat x = v39;
  v44.size.CGFloat height = v40;
  v44.origin.CGFloat y = v20;
  v44.size.CGFloat width = v21;
  double MinY = CGRectGetMinY(v44);
  v45.origin.CGFloat x = v13;
  v45.origin.CGFloat y = v15;
  v45.size.CGFloat width = v17;
  v45.size.CGFloat height = v19;
  double v23 = CGRectGetMinY(v45);
  v46.origin.CGFloat x = v13;
  v46.origin.CGFloat y = v15;
  v46.size.CGFloat width = v17;
  v46.size.CGFloat height = v19;
  double MaxY = CGRectGetMaxY(v46);
  v47.origin.CGFloat x = v39;
  v47.size.CGFloat height = v40;
  v47.origin.CGFloat y = v20;
  v47.size.CGFloat width = v21;
  CGFloat v25 = CGRectGetMaxY(v47);
  double v26 = MinY - v23;
  double v27 = MaxY - v25;
  if (MinY - v23 < 55.0 || v27 < 55.0)
  {
    if (v26 >= 55.0 || v27 >= 55.0)
    {
      if (v26 < 55.0) {
        uint64_t v31 = 1;
      }
      else {
        uint64_t v31 = 2;
      }
      [v11 setArrowDirection:v31];
    }
    else if (v5)
    {
      double v28 = TSDCenterOfRect(v39, v20, v21, v40);
      v48.origin.CGFloat x = TSDRectWithOriginAndSize(v29, v28, v30, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      CGRect v49 = CGRectInset(v48, -0.5, -0.5);
      CGFloat v39 = v49.origin.x;
      CGFloat v40 = v49.size.height;
      CGFloat v20 = v49.origin.y;
      double v21 = v49.size.width;
    }
  }
  v50.origin.CGFloat x = v39;
  v50.size.CGFloat height = v40;
  v50.origin.CGFloat y = v20;
  v50.size.CGFloat width = v21;
  if (CGRectGetHeight(v50) != 0.0)
  {
    if (v21 == 0.0) {
      double v21 = 1.0;
    }
    v32 = [v38 layerHost];
    v33 = [v32 asiOSCVC];

    v34 = [v33 extraMenuItems];
    [v11 setMenuItems:v34];

    v35 = [v38 layerHost];
    v36 = [v35 canvasView];

    v37 = objc_msgSend(a1, "p_sharedEditMenuController");
    objc_msgSend(v37, "setTargetRect:", v39, v20, v21, v40);
    [v37 setTargetView:v36];
    objc_msgSend(v37, "p_setMenuVisible:", MEMORY[0x263EFFA88]);
  }
}

+ (void)hideEditMenu
{
  objc_msgSend(a1, "p_sharedEditMenuController");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "p_setMenuVisible:", MEMORY[0x263EFFA80]);
}

+ (BOOL)isAnimating
{
  return (+[TSWPEditMenuController menuState] & 0xFFFFFFFD) != 0;
}

- (TSWPEditMenuController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditMenuController;
  id v2 = [(TSWPEditMenuController *)&v5 init];
  if (v2)
  {
    int v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_p_willShowMenu_ name:*MEMORY[0x263F1D4C0] object:0];
    [v3 addObserver:v2 selector:sel_p_didShowMenu_ name:*MEMORY[0x263F1D4B0] object:0];
    [v3 addObserver:v2 selector:sel_p_willHideMenu_ name:*MEMORY[0x263F1D4B8] object:0];
    [v3 addObserver:v2 selector:sel_p_didHideMenu_ name:*MEMORY[0x263F1D4A8] object:0];
    +[TSKKeyboardMonitor addKeyboardObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TSWPEditMenuController;
  [(TSWPEditMenuController *)&v4 dealloc];
}

- (void)p_setMenuVisible:(id)a3
{
  id v7 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_setMenuVisible_ object:0];
  if ((self->_menuState | 2) == 3)
  {
    [(TSWPEditMenuController *)self performSelector:sel_p_setMenuVisible_ withObject:v7 afterDelay:0.1];
    goto LABEL_3;
  }
  if (([v7 BOOLValue] & 1) == 0)
  {
    self->_showMenuOnKeyboard = 0;
    if (!self->_menuState) {
      goto LABEL_3;
    }
    objc_super v5 = [MEMORY[0x263F1C7B0] sharedMenuController];
    [v5 hideMenu];
    goto LABEL_12;
  }
  if (self->_menuState != 2)
  {
    objc_super v4 = [(TSWPEditMenuController *)self targetView];

    if (v4)
    {
      objc_super v5 = [MEMORY[0x263F1C7B0] sharedMenuController];
      v6 = [(TSWPEditMenuController *)self targetView];
      [(TSWPEditMenuController *)self targetRect];
      objc_msgSend(v5, "showMenuFromView:rect:", v6);

LABEL_12:
    }
  }
LABEL_3:
}

- (void)p_willShowMenu:(id)a3
{
  self->_menuState = 1;
}

- (void)p_didShowMenu:(id)a3
{
  self->_menuState = 2;
}

- (void)p_willHideMenu:(id)a3
{
  self->_menuState = 3;
}

- (void)p_didHideMenu:(id)a3
{
  self->_menuState = 0;
}

- (void)p_didAnimateKeyboard
{
  if (self->_showMenuOnKeyboard)
  {
    self->_showMenuOnKeyboard = 0;
    [(TSWPEditMenuController *)self p_setMenuVisible:MEMORY[0x263EFFA88]];
  }
}

- (void)p_clearIsBeginningEditing
{
  self->_isBeginningEditing = 0;
}

- (void)setIsBeginningEditing:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_clearIsBeginningEditing object:0];
  self->_isBeginningEditing = v3;
  if (v3)
  {
    [(TSWPEditMenuController *)self performSelector:sel_p_clearIsBeginningEditing withObject:0 afterDelay:0.25];
  }
}

- (BOOL)showMenuOnKeyboard
{
  return self->_showMenuOnKeyboard;
}

- (void)setShowMenuOnKeyboard:(BOOL)a3
{
  self->_showMenuOnKeyboard = a3;
}

- (BOOL)isBeginningEditing
{
  return self->_isBeginningEditing;
}

- (CGRect)targetRect
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end