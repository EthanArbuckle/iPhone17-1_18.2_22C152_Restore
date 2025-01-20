@interface WBUAlertController
- (WBUAlertController)initWithAlert:(id)a3 automaticallyDismiss:(BOOL)a4 completionHandler:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setUpAlert;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WBUAlertController

- (WBUAlertController)initWithAlert:(id)a3 automaticallyDismiss:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(WBUAlertController *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_alert, a3);
    v12->_automaticallyDismiss = a4;
    uint64_t v13 = MEMORY[0x21D4A5780](v10);
    id handler = v12->_handler;
    v12->_id handler = (id)v13;

    [(WBUAlertController *)v12 _setUpAlert];
    v15 = v12;
  }

  return v12;
}

- (void)_setUpAlert
{
  objc_initWeak(&location, self);
  v3 = [(WebUIAlert *)self->_alert buttonTitles];
  uint64_t v4 = [v3 count];
  v5 = [v3 objectAtIndexedSubscript:0];
  if (v4 == 2)
  {
    v6 = [v3 objectAtIndexedSubscript:1];
  }
  else if (v4 == 1 && [(WebUIAlert *)self->_alert defaultAction] != 4)
  {

    v6 = [v3 objectAtIndexedSubscript:0];
    v5 = 0;
  }
  else
  {
    v6 = 0;
  }
  [(WBUAlertController *)self setPreferredStyle:1];
  v7 = [(WebUIAlert *)self->_alert titles];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F1CA58]) initWithStyle:0];
    [(WBUAlertController *)self setContentViewController:v8];
    id v9 = [v8 tableView];
    tableView = self->_tableView;
    self->_tableView = v9;

    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView setDataSource:self];
    v11 = self->_tableView;
    v12 = [(UITableView *)v11 indexPathForSelectedRow];
    [(UITableView *)v11 deselectRowAtIndexPath:v12 animated:0];
  }
  uint64_t v13 = [(WebUIAlert *)self->_alert title];
  [(WBUAlertController *)self setTitle:v13];

  v14 = [(WebUIAlert *)self->_alert bodyText];
  [(WBUAlertController *)self setMessage:v14];

  BOOL automaticallyDismiss = self->_automaticallyDismiss;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __33__WBUAlertController__setUpAlert__block_invoke;
  v26[3] = &__block_descriptor_33_e5_B8__0l;
  BOOL v27 = automaticallyDismiss;
  v16 = (void *)MEMORY[0x21D4A5780](v26);
  if (v5)
  {
    v17 = (void *)MEMORY[0x263F1C3F0];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __33__WBUAlertController__setUpAlert__block_invoke_2;
    v24[3] = &unk_2643EFFE8;
    objc_copyWeak(&v25, &location);
    v18 = [v17 _actionWithTitle:v5 image:0 style:1 handler:v24 shouldDismissHandler:v16];
    [(WBUAlertController *)self addAction:v18];

    objc_destroyWeak(&v25);
  }
  if (v6)
  {
    v19 = (void *)MEMORY[0x263F1C3F0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __33__WBUAlertController__setUpAlert__block_invoke_3;
    v21[3] = &unk_2643F0010;
    objc_copyWeak(&v23, &location);
    id v22 = v5;
    v20 = [v19 _actionWithTitle:v6 image:0 style:0 handler:v21 shouldDismissHandler:v16];
    [(WBUAlertController *)self addAction:v20];

    objc_destroyWeak(&v23);
  }

  objc_destroyWeak(&location);
}

uint64_t __33__WBUAlertController__setUpAlert__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

void __33__WBUAlertController__setUpAlert__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    (*((void (**)(id, uint64_t))WeakRetained[167] + 2))(WeakRetained[167], [WeakRetained[164] actionForButtonTag:0]);
    WeakRetained = v2;
  }
}

void __33__WBUAlertController__setUpAlert__block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*((void (**)(id, uint64_t))WeakRetained[167] + 2))(WeakRetained[167], [WeakRetained[164] actionForButtonTag:*(void *)(a1 + 32) != 0]);
    WeakRetained = v3;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(WebUIAlert *)self->_alert identities];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(WebUIAlert *)self->_alert titles];
  id v7 = objc_alloc_init(MEMORY[0x263F1CA48]);
  uint64_t v8 = [v5 row];
  if (v8 < [v6 count])
  {
    id v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    id v10 = [v7 textLabel];
    [v10 setText:v9];
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(WebUIAlert *)self->_alert titles];
  uint64_t v7 = [v5 row];
  if (v7 < [v6 count])
  {
    -[WebUIAlert setSelectedTableItemIndex:](self->_alert, "setSelectedTableItemIndex:", [v5 row]);
    if (self->_automaticallyDismiss)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __56__WBUAlertController_tableView_didSelectRowAtIndexPath___block_invoke;
      v9[3] = &unk_2643EFFA0;
      v9[4] = self;
      [(WBUAlertController *)self dismissViewControllerAnimated:1 completion:v9];
    }
    else
    {
      id handler = (void (**)(id, void))self->_handler;
      if (handler) {
        handler[2](handler, [(WebUIAlert *)self->_alert tableAction]);
      }
    }
  }
}

uint64_t __56__WBUAlertController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 1336);
  if (v2)
  {
    uint64_t v3 = [*(id *)(v1 + 1312) tableAction];
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end