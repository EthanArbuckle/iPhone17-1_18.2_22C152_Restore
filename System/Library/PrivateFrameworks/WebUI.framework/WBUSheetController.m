@interface WBUSheetController
+ (id)alertControllerForAlert:(id)a3 automaticallyDismiss:(BOOL)a4 withCompletionHandler:(id)a5;
- (WBUSheetController)initWithDelegate:(id)a3;
- (void)_alertDidDismissWithAction:(int)a3;
- (void)hideSheet;
- (void)setDelegate:(id)a3;
- (void)showSheetForAlert:(id)a3;
@end

@implementation WBUSheetController

- (WBUSheetController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBUSheetController;
  v6 = [(WBUSheetController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_delegate, a3);
    v8 = v7;
  }

  return v7;
}

- (void)showSheetForAlert:(id)a3
{
  id v6 = a3;
  if (self->_alertController)
  {
    if (!self->_alertInvocationQueue)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      alertInvocationQueue = self->_alertInvocationQueue;
      self->_alertInvocationQueue = v7;
    }
    id v20 = v6;
    v9 = (void *)MEMORY[0x263EFF958];
    objc_super v10 = [(WBUSheetController *)self methodSignatureForSelector:a2];
    v11 = [v9 invocationWithMethodSignature:v10];

    [v11 setSelector:a2];
    [v11 setTarget:self];
    [v11 setArgument:&v20 atIndex:2];
    [(NSMutableArray *)self->_alertInvocationQueue addObject:v11];
  }
  else
  {
    objc_storeStrong((id *)&self->_alert, a3);
    v12 = objc_opt_class();
    alert = self->_alert;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __40__WBUSheetController_showSheetForAlert___block_invoke;
    v19[3] = &unk_2643EFF78;
    v19[4] = self;
    v14 = [v12 alertControllerForAlert:alert automaticallyDismiss:1 withCompletionHandler:v19];
    alertController = self->_alertController;
    self->_alertController = v14;

    v16 = [self->_delegate sheetController:self viewControllerForAlert:self->_alert];
    v17 = self->_alertController;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__WBUSheetController_showSheetForAlert___block_invoke_2;
    v18[3] = &unk_2643EFFA0;
    v18[4] = self;
    [v16 presentViewController:v17 animated:1 completion:v18];
  }
}

uint64_t __40__WBUSheetController_showSheetForAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _alertDidDismissWithAction:a2];
}

uint64_t __40__WBUSheetController_showSheetForAlert___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "sheetControllerDidShowSheet:");
}

- (void)hideSheet
{
  alertController = self->_alertController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__WBUSheetController_hideSheet__block_invoke;
  v3[3] = &unk_2643EFFA0;
  v3[4] = self;
  [(UIAlertController *)alertController dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __31__WBUSheetController_hideSheet__block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = [v1[2] hideAction];
  return [v1 _alertDidDismissWithAction:v2];
}

- (void)setDelegate:(id)a3
{
}

- (void)_alertDidDismissWithAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v10 = self->_alert;
  alertController = self->_alertController;
  self->_alertController = 0;

  alert = self->_alert;
  self->_alert = 0;

  v7 = [(WebUIAlert *)v10 actionHandler];

  if (v7)
  {
    v8 = [(WebUIAlert *)v10 actionHandler];
    ((void (**)(void, WebUIAlert *, uint64_t))v8)[2](v8, v10, v3);
  }
  [self->_delegate sheetController:self performAction:v3 forAlert:v10];
  [self->_delegate sheetControllerDidHideSheet:self];
  if ([(NSMutableArray *)self->_alertInvocationQueue count])
  {
    v9 = [(NSMutableArray *)self->_alertInvocationQueue objectAtIndex:0];
    [v9 invoke];

    [(NSMutableArray *)self->_alertInvocationQueue removeObjectAtIndex:0];
  }
}

+ (id)alertControllerForAlert:(id)a3 automaticallyDismiss:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [[WBUAlertController alloc] initWithAlert:v8 automaticallyDismiss:v5 completionHandler:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_alertInvocationQueue, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end