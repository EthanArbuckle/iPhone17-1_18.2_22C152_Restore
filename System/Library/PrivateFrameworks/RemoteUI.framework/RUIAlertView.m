@interface RUIAlertView
+ (void)_enableTestMode;
- (NSString)message;
- (NSString)title;
- (RUIAlertView)initWithAttributes:(id)a3 parent:(id)a4;
- (RUIAlertViewDelegate)objectModel;
- (UIColor)tintColor;
- (id)alertController;
- (id)completion;
- (int64_t)buttonIndex;
- (void)_dismissAlertController;
- (void)addButtonWithTitle:(id)a3 URL:(id)a4 style:(int64_t)a5 attributes:(id)a6;
- (void)dealloc;
- (void)runAlertInController:(id)a3 completion:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setMessage:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RUIAlertView

+ (void)_enableTestMode
{
  _testMode = 1;
}

- (RUIAlertView)initWithAttributes:(id)a3 parent:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RUIAlertView;
  v7 = [(RUIElement *)&v12 initWithAttributes:v6 parent:a4];
  v8 = v7;
  if (v7)
  {
    v7->_buttonIndex = 0;
    v9 = [v6 objectForKey:@"tintColor"];
    if (v9)
    {
      v10 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v9);
      [(RUIAlertView *)v8 setTintColor:v10];
    }
  }

  return v8;
}

- (void)dealloc
{
  [(RUIAlertView *)self _dismissAlertController];
  v3.receiver = self;
  v3.super_class = (Class)RUIAlertView;
  [(RUIElement *)&v3 dealloc];
}

- (void)setTitle:(id)a3
{
  v4 = (NSString *)a3;
  [(UIAlertController *)self->_alertController setTitle:v4];
  title = self->_title;
  self->_title = v4;
}

- (void)setMessage:(id)a3
{
  v4 = (NSString *)a3;
  [(UIAlertController *)self->_alertController setMessage:v4];
  message = self->_message;
  self->_message = v4;
}

- (void)setTintColor:(id)a3
{
  v4 = (UIColor *)a3;
  v5 = [(UIAlertController *)self->_alertController view];
  [v5 setTintColor:v4];

  tintColor = self->_tintColor;
  self->_tintColor = v4;
}

- (void)addButtonWithTitle:(id)a3 URL:(id)a4 style:(int64_t)a5 attributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5 == 1)
  {
    int64_t buttonIndex = -1;
  }
  else
  {
    int64_t buttonIndex = self->_buttonIndex;
    self->_int64_t buttonIndex = buttonIndex + 1;
  }
  objc_initWeak(&location, self);
  v14 = [(RUIAlertView *)self alertController];
  v15 = (void *)MEMORY[0x263F82400];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __56__RUIAlertView_addButtonWithTitle_URL_style_attributes___block_invoke;
  v29 = &unk_264212098;
  objc_copyWeak(v31, &location);
  v31[1] = (id)buttonIndex;
  id v16 = v12;
  id v30 = v16;
  v17 = [v15 actionWithTitle:v10 style:a5 handler:&v26];
  objc_msgSend(v14, "addAction:", v17, v26, v27, v28, v29);

  v18 = [(RUIElement *)self attributes];
  v19 = [v18 objectForKeyedSubscript:@"preferredButton"];
  v20 = [v16 objectForKeyedSubscript:@"id"];
  int v21 = [v19 isEqualToString:v20];

  if (v21)
  {
    v22 = [(RUIAlertView *)self alertController];
    v23 = [(RUIAlertView *)self alertController];
    v24 = [v23 actions];
    v25 = [v24 lastObject];
    [v22 setPreferredAction:v25];
  }
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __56__RUIAlertView_addButtonWithTitle_URL_style_attributes___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained(WeakRetained + 10);
    objc_super v3 = [WeakRetained completion];

    if (v3)
    {
      v4 = [WeakRetained completion];
      v4[2](v4, *(void *)(a1 + 48));
    }
    [WeakRetained _dismissAlertController];
    v5 = [(RUIElement *)[RUIAlertButton alloc] initWithAttributes:*(void *)(a1 + 32) parent:WeakRetained];
    [v2 alertView:WeakRetained pressedButton:v5 completion:0];
  }
}

- (id)alertController
{
  alertController = self->_alertController;
  if (!alertController)
  {
    v4 = [MEMORY[0x263F82438] sharedApplication];
    v5 = [v4 keyWindow];
    id v6 = [v5 rootViewController];
    v7 = [v6 traitCollection];

    uint64_t v8 = [v7 horizontalSizeClass];
    if (v7) {
      BOOL v9 = v8 == 1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      id v10 = [(RUIElement *)self attributes];
      id v11 = [v10 objectForKeyedSubscript:@"style"];
      uint64_t v12 = [v11 isEqualToString:@"sheet"] ^ 1;
    }
    else
    {
      uint64_t v12 = 1;
    }
    v13 = (void *)MEMORY[0x263F82418];
    v14 = [(RUIAlertView *)self title];
    v15 = [(RUIAlertView *)self message];
    id v16 = [v13 alertControllerWithTitle:v14 message:v15 preferredStyle:v12];
    v17 = self->_alertController;
    self->_alertController = v16;

    v18 = [(RUIAlertView *)self tintColor];
    v19 = [(UIAlertController *)self->_alertController view];
    [v19 setTintColor:v18];

    alertController = self->_alertController;
  }
  return alertController;
}

- (void)_dismissAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContext);
  v4 = self->_alertController;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __39__RUIAlertView__dismissAlertController__block_invoke;
  id v11 = &unk_264211888;
  uint64_t v12 = v4;
  id v5 = WeakRetained;
  id v13 = v5;
  id v6 = v4;
  v7 = (void (**)(void))_Block_copy(&v8);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v8, v9, v10, v11)) {
    v7[2](v7);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __39__RUIAlertView__dismissAlertController__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v3 = *(void **)(a1 + 40);
    return [v3 ruiDidDismissAlertController:v4];
  }
  return result;
}

- (void)runAlertInController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v8 = WeakRetained;
  id v18 = [v8 delegate];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__RUIAlertView_runAlertInController_completion___block_invoke;
  v13[3] = &unk_2642120C0;
  id v9 = v7;
  id v14 = v9;
  v15 = v19;
  id v16 = v17;
  [(RUIAlertView *)self setCompletion:v13];
  if ([v6 conformsToProtocol:&unk_26C591348])
  {
    id v10 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(RUIAlertView *)self alertController];
      [v10 ruiPresentAlertController:v11];
    }
    objc_storeWeak((id *)&self->_presentationContext, v10);
  }
  else
  {
    uint64_t v12 = [(RUIAlertView *)self alertController];
    [v12 dismissViewControllerAnimated:0 completion:0];

    objc_storeWeak((id *)&self->_presentationContext, 0);
    id v10 = [(RUIAlertView *)self alertController];
    [v6 presentViewController:v10 animated:(_testMode & 1) == 0 completion:0];
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __48__RUIAlertView_runAlertInController_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (RUIAlertViewDelegate)objectModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  return (RUIAlertViewDelegate *)WeakRetained;
}

- (void)setObjectModel:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)buttonIndex
{
  return self->_buttonIndex;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_destroyWeak((id *)&self->_presentationContext);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end