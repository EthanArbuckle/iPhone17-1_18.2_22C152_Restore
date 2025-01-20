@interface SUBarButtonItem
+ (Class)classForNavigationButton;
- (BOOL)isLoading;
- (BOOL)isShowingConfirmation;
- (UIEdgeInsets)accessoryViewInsets;
- (UIView)accessoryView;
- (id)_navigationButton;
- (id)createViewForNavigationItem:(id)a3;
- (void)_addTouchCaptureViewForNavigationButton:(id)a3;
- (void)_removeTouchCaptureView;
- (void)_setTitle:(id)a3 isConfirmation:(BOOL)a4 appearance:(id)a5 animated:(BOOL)a6;
- (void)_touchCaptureAction:(id)a3;
- (void)_updateViewForAccessoryChange;
- (void)configureFromScriptButton:(id)a3;
- (void)dealloc;
- (void)hideConfirmationWithAppearance:(id)a3 animated:(BOOL)a4;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewInsets:(UIEdgeInsets)a3;
- (void)setLoading:(BOOL)a3;
- (void)showConfirmationWithTitle:(id)a3 appearance:(id)a4 animated:(BOOL)a5;
@end

@implementation SUBarButtonItem

- (void)dealloc
{
  [(SUBarButtonItem *)self _removeTouchCaptureView];

  v3.receiver = self;
  v3.super_class = (Class)SUBarButtonItem;
  [(SUBarButtonItem *)&v3 dealloc];
}

- (void)hideConfirmationWithAppearance:(id)a3 animated:(BOOL)a4
{
  preConfirmationTitle = self->_preConfirmationTitle;
  if (preConfirmationTitle)
  {
    [(SUBarButtonItem *)self _setTitle:preConfirmationTitle isConfirmation:0 appearance:a3 animated:a4];

    self->_confirmationAppearance = 0;
    self->_preConfirmationTitle = 0;
  }
}

- (BOOL)isLoading
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isShowingConfirmation
{
  return self->_preConfirmationTitle != 0;
}

- (void)setAccessoryView:(id)a3
{
  accessoryView = self->_accessoryView;
  if (accessoryView != a3)
  {

    self->_accessoryView = (UIView *)a3;
  }
  objc_msgSend(-[SUBarButtonItem _navigationButton](self, "_navigationButton"), "setAccessoryView:", a3);

  [(SUBarButtonItem *)self _updateViewForAccessoryChange];
}

- (void)setAccessoryViewInsets:(UIEdgeInsets)a3
{
  self->_accessoryViewInsets = a3;
  objc_msgSend(-[SUBarButtonItem _navigationButton](self, "_navigationButton"), "setAccessoryViewInsets:", a3.top, a3.left, a3.bottom, a3.right);

  [(SUBarButtonItem *)self _updateViewForAccessoryChange];
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:1];
    [v4 sizeToFit];
    [v4 startAnimating];
    [(SUBarButtonItem *)self setAccessoryView:v4];
    -[SUBarButtonItem setAccessoryViewInsets:](self, "setAccessoryViewInsets:", 0.0, 0.0, 0.0, 10.0);
  }
  else
  {
    [(SUBarButtonItem *)self setAccessoryView:0];
  }
}

- (void)showConfirmationWithTitle:(id)a3 appearance:(id)a4 animated:(BOOL)a5
{
  if (!self->_preConfirmationTitle)
  {
    BOOL v5 = a5;

    self->_confirmationAppearance = (SUUIAppearance *)[a4 copy];
    self->_preConfirmationTitle = (NSString *)(id)[(SUBarButtonItem *)self title];
    [(SUBarButtonItem *)self _setTitle:a3 isConfirmation:1 appearance:a4 animated:v5];
  }
}

+ (Class)classForNavigationButton
{
  return (Class)objc_opt_class();
}

- (void)configureFromScriptButton:(id)a3
{
  -[SUBarButtonItem setLoading:](self, "setLoading:", [a3 loading]);
  v5.receiver = self;
  v5.super_class = (Class)SUBarButtonItem;
  [(UIBarButtonItem *)&v5 configureFromScriptButton:a3];
}

- (id)createViewForNavigationItem:(id)a3
{
  self->_lastNavigationItem = (UINavigationItem *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SUBarButtonItem;
  id v5 = [(SUBarButtonItem *)&v7 createViewForNavigationItem:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setAccessoryView:self->_accessoryView];
    objc_msgSend(v5, "setAccessoryViewInsets:", self->_accessoryViewInsets.top, self->_accessoryViewInsets.left, self->_accessoryViewInsets.bottom, self->_accessoryViewInsets.right);
    [v5 sizeToFit];
  }
  return v5;
}

- (void)_touchCaptureAction:(id)a3
{
  if ([(SUBarButtonItem *)self isShowingConfirmation])
  {
    confirmationAppearance = self->_confirmationAppearance;
    [(SUBarButtonItem *)self hideConfirmationWithAppearance:confirmationAppearance animated:1];
  }
  else
  {
    [(SUBarButtonItem *)self _removeTouchCaptureView];
  }
}

- (void)_addTouchCaptureViewForNavigationButton:(id)a3
{
  if (!self->_touchCaptureView)
  {
    id v5 = (SUTouchCaptureView *)(id)objc_msgSend((id)objc_msgSend(a3, "window"), "addTouchCaptureViewWithTag:", 1651078243);
    self->_touchCaptureView = v5;
    [(SUTouchCaptureView *)v5 addTarget:self action:sel__touchCaptureAction_ forControlEvents:64];
    touchCaptureView = self->_touchCaptureView;
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);
    [(SUTouchCaptureView *)touchCaptureView setPassThroughViews:v7];
  }
}

- (id)_navigationButton
{
  objc_super v3 = [(UINavigationItem *)self->_lastNavigationItem leftBarButtonItem];
  lastNavigationItem = self->_lastNavigationItem;
  if (v3 == self)
  {
    uint64_t v6 = [(UINavigationItem *)lastNavigationItem customLeftView];
  }
  else
  {
    if ((SUBarButtonItem *)[(UINavigationItem *)lastNavigationItem rightBarButtonItem] != self)
    {
      id v5 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = [(UINavigationItem *)self->_lastNavigationItem customRightView];
  }
  id v5 = (void *)v6;
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)_removeTouchCaptureView
{
  touchCaptureView = self->_touchCaptureView;
  if (touchCaptureView)
  {
    objc_msgSend((id)-[SUTouchCaptureView window](touchCaptureView, "window"), "removeTouchCaptureViewWithTag:", -[SUTouchCaptureView tag](self->_touchCaptureView, "tag"));
    [(SUTouchCaptureView *)self->_touchCaptureView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

    self->_touchCaptureView = 0;
  }
}

- (void)_setTitle:(id)a3 isConfirmation:(BOOL)a4 appearance:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v11 = [(SUBarButtonItem *)self _navigationButton];
  uint64_t v12 = [v11 superviewOfClass:objc_opt_class()];
  if (v12)
  {
    v13 = (void *)v12;
    [v11 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = [(SUBarButtonItem *)self title];
    [(SUBarButtonItem *)self setTitle:a3];
    [v13 layoutIfNeeded];
    [v11 frame];
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    [(SUBarButtonItem *)self setTitle:v22];
    [v13 layoutIfNeeded];
    if (a5)
    {
      if (v8) {
        [a5 styleConfirmationButtonItem:self];
      }
      else {
        [a5 styleBarButtonItem:self];
      }
    }
    [(SUBarButtonItem *)self setTitle:&stru_26DB8C5F8];
    objc_msgSend(v11, "setFrame:", v15, v17, v19, v21);
    double v31 = 0.35;
    if (!v6) {
      double v31 = 0.0;
    }
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke;
    v34[3] = &unk_264814240;
    v34[6] = v24;
    v34[7] = v26;
    v34[8] = v28;
    v34[9] = v30;
    v34[4] = v11;
    v34[5] = v13;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke_2;
    v32[3] = &unk_264814268;
    BOOL v33 = v8;
    v32[4] = self;
    v32[5] = v11;
    v32[6] = a3;
    [MEMORY[0x263F1CB60] animateWithDuration:v34 animations:v32 completion:v31];
  }
}

uint64_t __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

uint64_t __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  objc_super v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _addTouchCaptureViewForNavigationButton:*(void *)(a1 + 40)];
  }
  else {
    [v3 _removeTouchCaptureView];
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v4 setTitle:v5];
}

- (void)_updateViewForAccessoryChange
{
  objc_msgSend(-[SUBarButtonItem _navigationButton](self, "_navigationButton"), "sizeToFit");
  objc_super v3 = (void *)[(UINavigationItem *)self->_lastNavigationItem navigationBar];

  [v3 setNeedsLayout];
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIEdgeInsets)accessoryViewInsets
{
  double top = self->_accessoryViewInsets.top;
  double left = self->_accessoryViewInsets.left;
  double bottom = self->_accessoryViewInsets.bottom;
  double right = self->_accessoryViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end