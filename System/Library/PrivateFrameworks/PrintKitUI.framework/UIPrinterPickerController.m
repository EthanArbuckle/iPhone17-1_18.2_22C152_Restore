@interface UIPrinterPickerController
+ (UIPrinterPickerController)printerPickerControllerWithInitiallySelectedPrinter:(UIPrinter *)printer;
- (BOOL)_delegateFiltersPrinters;
- (BOOL)_setupPickerPanel:(id)a3;
- (BOOL)_shouldShowPrinter:(id)a3;
- (BOOL)presentAnimated:(BOOL)a3 hostingScene:(id)a4 completionHandler:(id)a5;
- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion;
- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion;
- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion;
- (UIPrinter)selectedPrinter;
- (UIPrinterPickerController)initWithInitiallySelectedPrinter:(id)a3;
- (id)delegate;
- (void)_printerPickerDidDismiss;
- (void)_printerPickerDidPresent;
- (void)_printerPickerWillDismiss;
- (void)dismissAnimated:(BOOL)animated;
- (void)setDelegate:(id)delegate;
- (void)setSelectedPrinter:(id)a3;
@end

@implementation UIPrinterPickerController

+ (UIPrinterPickerController)printerPickerControllerWithInitiallySelectedPrinter:(UIPrinter *)printer
{
  v3 = printer;
  v4 = [[UIPrinterPickerController alloc] initWithInitiallySelectedPrinter:v3];

  return v4;
}

- (UIPrinterPickerController)initWithInitiallySelectedPrinter:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPrinterPickerController;
  id v3 = a3;
  v4 = [(UIPrinterPickerController *)&v6 init];
  -[UIPrinterPickerController setSelectedPrinter:](v4, "setSelectedPrinter:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (BOOL)presentAnimated:(BOOL)a3 hostingScene:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11)
  {
    NSLog(&cfstr_WarningCalling.isa);
    if (!v8)
    {
      v12 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v8 = [v12 _findUISceneForLegacyInterfaceOrientation];
    }
    v13 = [v8 windows];
    WeakRetained = [v13 firstObject];

    [WeakRetained bounds];
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
    double MidX = CGRectGetMidX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    BOOL v20 = -[UIPrinterPickerController presentFromRect:inView:animated:completionHandler:](self, "presentFromRect:inView:animated:completionHandler:", WeakRetained, v6, v9, MidX, CGRectGetMidY(v23), 0.0, 0.0);
  }
  else
  {
    if (![(UIPrinterPickerController *)self _setupPickerPanel:v9])
    {
      BOOL v20 = 0;
      goto LABEL_10;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained printerPickerControllerWillPresent:self];
    }
    [*((id *)self->_state + 1) presentPrinterPickerPanelAnimated:v6 hostingScene:v8];
    BOOL v20 = 1;
  }

LABEL_10:
  return v20;
}

- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion
{
  return [(UIPrinterPickerController *)self presentAnimated:animated hostingScene:0 completionHandler:completion];
}

- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion
{
  BOOL v7 = animated;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  v13 = view;
  UIPrinterPickerCompletionHandler v14 = completion;
  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16)
  {
    if (![(UIPrinterPickerController *)self _setupPickerPanel:v14])
    {
      BOOL v18 = 0;
      goto LABEL_9;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained printerPickerControllerWillPresent:self];
    }
    objc_msgSend(*((id *)self->_state + 1), "presentPrinterPickerPanelFromRect:inView:animated:", v13, v7, x, y, width, height);
    BOOL v18 = 1;
  }
  else
  {
    NSLog(&cfstr_WarningCalling_0.isa);
    WeakRetained = [(UIView *)v13 window];
    v19 = [WeakRetained windowScene];
    BOOL v18 = [(UIPrinterPickerController *)self presentAnimated:v7 hostingScene:v19 completionHandler:v14];
  }
LABEL_9:

  return v18;
}

- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion
{
  BOOL v6 = animated;
  id v8 = item;
  UIPrinterPickerCompletionHandler v9 = completion;
  v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11)
  {
    if (![(UIPrinterPickerController *)self _setupPickerPanel:v9])
    {
      BOOL v13 = 0;
      goto LABEL_9;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained printerPickerControllerWillPresent:self];
    }
    [*((id *)self->_state + 1) presentPrinterPickerPanelFromBarButtonItem:v8 animated:v6];
    BOOL v13 = 1;
  }
  else
  {
    NSLog(&cfstr_WarningCalling_1.isa);
    WeakRetained = [(UIBarButtonItem *)v8 _viewForPresenting];
    UIPrinterPickerCompletionHandler v14 = [WeakRetained window];
    v15 = [v14 windowScene];
    BOOL v13 = [(UIPrinterPickerController *)self presentAnimated:v6 hostingScene:v15 completionHandler:v9];
  }
LABEL_9:

  return v13;
}

- (BOOL)_setupPickerPanel:(id)a3
{
  id v4 = a3;
  if (_UIApplicationIsExtension())
  {
    NSLog(&cfstr_PrintingIsUnav.isa);
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  state = self->_state;
  if (state)
  {
    BOOL v6 = (void *)state[1];
    if (v6) {
      [v6 dismissAnimated:1];
    }
    goto LABEL_6;
  }
  UIPrinterPickerCompletionHandler v9 = objc_alloc_init(UIPrinterPickerControllerInternals);
  id v10 = self->_state;
  self->_state = v9;

  uint64_t v11 = (void *)[v4 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v11;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    UIPrinterPickerCompletionHandler v14 = [WeakRetained printerPickerControllerParentViewController:self];
  }
  else
  {
    UIPrinterPickerCompletionHandler v14 = 0;
  }
  v15 = [[UIPrinterPickerViewController alloc] initWithPrinterPickerController:self inParentController:v14];
  uint64_t v16 = self->_state;
  v17 = (void *)v16[1];
  v16[1] = v15;

  BOOL v18 = [(UIPrinterPickerController *)self selectedPrinter];

  if (v18)
  {
    v19 = [(UIPrinterPickerController *)self selectedPrinter];
    BOOL v20 = [v19 _internalPrinter];
    [*((id *)self->_state + 1) setPrinter:v20];
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (void)_printerPickerDidPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained printerPickerControllerDidPresent:self];
  }
}

- (void)_printerPickerWillDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = objc_opt_respondsToSelector();
  if (v3)
  {
    uint64_t v3 = [*((id *)self->_state + 1) userSelectedPrinter];
    if (v3) {
      uint64_t v3 = [WeakRetained printerPickerControllerDidSelectPrinter:self];
    }
  }
  if (!*((unsigned char *)self->_state + 16))
  {
    uint64_t v3 = objc_opt_respondsToSelector();
    if (v3) {
      uint64_t v3 = [WeakRetained printerPickerControllerWillDismiss:self];
    }
  }
  MEMORY[0x1F4181820](v3);
}

- (void)_printerPickerDidDismiss
{
  state = (id *)self->_state;
  if (state)
  {
    id v4 = [state[1] printer];

    if (v4)
    {
      v5 = [UIPrinter alloc];
      BOOL v6 = [*((id *)self->_state + 1) printer];
      id v7 = [(UIPrinter *)v5 _initWithPrinter:v6];
      [(UIPrinterPickerController *)self setSelectedPrinter:v7];
    }
    uint64_t v8 = [*((id *)self->_state + 1) userSelectedPrinter];
    UIPrinterPickerCompletionHandler v9 = self->_state;
    id v10 = (void *)v9[1];
    v9[1] = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!*((unsigned char *)self->_state + 16) && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained printerPickerControllerDidDismiss:self];
    }
    id completionHandler = (void (**)(id, UIPrinterPickerController *, uint64_t, void))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, self, v8, 0);
      id v12 = self->_completionHandler;
      self->_id completionHandler = 0;
    }
    id v13 = self->_state;
    self->_state = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
  }
}

- (BOOL)_delegateFiltersPrinters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_shouldShowPrinter:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v6 = [WeakRetained printerPickerController:self shouldShowPrinter:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)dismissAnimated:(BOOL)animated
{
  state = self->_state;
  if (state)
  {
    state[16] = 1;
    [*((id *)self->_state + 1) dismissAnimated:animated];
  }
}

- (UIPrinter)selectedPrinter
{
  return self->_selectedPrinter;
}

- (void)setSelectedPrinter:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPrinter, 0);
  objc_storeStrong(&self->_state, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end