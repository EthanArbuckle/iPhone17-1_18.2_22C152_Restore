@interface PRXAction
+ (PRXAction)actionWithTitle:(id)a3 customColors:(id)a4 handler:(id)a5;
+ (PRXAction)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
+ (id)defaultDismissalActionForViewController:(id)a3;
+ (id)dismissalConfirmationActionForViewController:(id)a3 withTitle:(id)a4 message:(id)a5 confirmButtonTitle:(id)a6 cancelButtonTitle:(id)a7;
- (BOOL)isEnabled;
- (BOOL)usesLegacyStyling;
- (NSString)title;
- (PRXAction)initWithTitle:(id)a3 style:(int64_t)a4 customColors:(id)a5 handler:(id)a6;
- (PRXActionCustomColors)customColors;
- (UIButton)button;
- (int64_t)style;
- (void)_callHandler;
- (void)setButton:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setUsesLegacyStyling:(BOOL)a3;
@end

@implementation PRXAction

- (PRXAction)initWithTitle:(id)a3 style:(int64_t)a4 customColors:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRXAction;
  v13 = [(PRXAction *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v13->_style = a4;
    uint64_t v16 = MEMORY[0x21D4ADD80](v12);
    id handler = v13->_handler;
    v13->_id handler = (id)v16;

    objc_storeStrong((id *)&v13->_customColors, a5);
    v13->_enabled = 1;
    v18 = v13;
  }

  return v13;
}

+ (PRXAction)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 style:a4 customColors:0 handler:v8];

  return (PRXAction *)v10;
}

+ (PRXAction)actionWithTitle:(id)a3 customColors:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithTitle:v10 style:2 customColors:v9 handler:v8];

  return (PRXAction *)v11;
}

- (void)_callHandler
{
  p_button = &self->_button;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained((id *)p_button);
    [v6 toggleActive];
  }
  id handler = self->_handler;
  if (handler)
  {
    id v8 = (void (*)(void))*((void *)handler + 2);
    v8();
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    [WeakRetained setEnabled:v3];
  }
}

- (void)setButton:(id)a3
{
  id obj = a3;
  p_button = &self->_button;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);

  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_button);
    [v6 removeTarget:self action:sel__callHandler forControlEvents:0x2000];

    id v7 = objc_storeWeak((id *)&self->_button, obj);
    [obj setTitle:self->_title forState:0];

    id v8 = objc_loadWeakRetained((id *)&self->_button);
    [v8 addTarget:self action:sel__callHandler forControlEvents:0x2000];

    BOOL enabled = self->_enabled;
    id v10 = objc_loadWeakRetained((id *)p_button);
    [v10 setEnabled:enabled];
  }
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (PRXActionCustomColors)customColors
{
  return self->_customColors;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)usesLegacyStyling
{
  return self->_usesLegacyStyling;
}

- (void)setUsesLegacyStyling:(BOOL)a3
{
  self->_usesLegacyStyling = a3;
}

- (UIButton)button
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  return (UIButton *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_customColors, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

+ (id)dismissalConfirmationActionForViewController:(id)a3 withTitle:(id)a4 message:(id)a5 confirmButtonTitle:(id)a6 cancelButtonTitle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id location = 0;
  objc_initWeak(&location, v12);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke;
  v23[3] = &unk_264418398;
  objc_copyWeak(&v28, &location);
  id v17 = v13;
  id v24 = v17;
  id v18 = v14;
  id v25 = v18;
  id v19 = v15;
  id v26 = v19;
  id v20 = v16;
  id v27 = v20;
  v21 = [a1 actionWithTitle:&stru_26CCF1BC8 style:0 handler:v23];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v21;
}

void __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
    id v6 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke_2;
    v10[3] = &unk_264418370;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    id v8 = [v6 actionWithTitle:v7 style:0 handler:v10];
    [v5 addAction:v8];
    id v9 = [MEMORY[0x263F1C3F0] actionWithTitle:*(void *)(a1 + 56) style:1 handler:0];
    [v5 addAction:v9];

    [v5 setPreferredAction:v8];
    [WeakRetained presentViewController:v5 animated:1 completion:0];

    objc_destroyWeak(&v11);
  }
}

void __136__PRXAction_ViewControllerActions__dismissalConfirmationActionForViewController_withTitle_message_confirmButtonTitle_cancelButtonTitle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

+ (id)defaultDismissalActionForViewController:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, v4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__PRXAction_ViewControllerActions__defaultDismissalActionForViewController___block_invoke;
  v7[3] = &unk_2644182D0;
  objc_copyWeak(&v8, &location);
  v5 = [a1 actionWithTitle:&stru_26CCF1BC8 style:0 handler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __76__PRXAction_ViewControllerActions__defaultDismissalActionForViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

@end