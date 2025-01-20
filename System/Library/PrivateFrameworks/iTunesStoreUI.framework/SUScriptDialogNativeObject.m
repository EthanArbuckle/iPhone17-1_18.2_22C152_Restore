@interface SUScriptDialogNativeObject
- (id)_makeAlertControllerForDialog:(id)a3 style:(int64_t)a4;
- (void)_showSheetInView:(id)a3 fromViewController:(id)a4;
- (void)_tearDownForDismissWithButtonIndex:(int64_t)a3;
- (void)dismiss;
- (void)show;
- (void)showFromRect:(CGRect)a3 inView:(id)a4;
- (void)showSheet;
- (void)showSheetInViewController:(id)a3;
@end

@implementation SUScriptDialogNativeObject

- (void)dismiss
{
  id v2 = [(SUScriptNativeObject *)self object];

  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)show
{
  v3 = [(SUScriptNativeObject *)self scriptObject];
  if (![(SUScriptNativeObject *)self object] && v3)
  {
    id v4 = [(SUScriptDialogNativeObject *)self _makeAlertControllerForDialog:v3 style:1];
    [(SUScriptNativeObject *)self setObject:v4];
    for (id i = [(SUScriptObject *)v3 parentViewController];
          ;
          id i = (id)[v6 presentedViewController])
    {
      v6 = i;
      if (![i presentedViewController]) {
        break;
      }
    }
    [v6 presentViewController:v4 animated:1 completion:0];
  }
}

- (void)showFromRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = [(SUScriptNativeObject *)self scriptObject];
  if (![(SUScriptNativeObject *)self object])
  {
    if (v10)
    {
      id v11 = [(SUScriptDialogNativeObject *)self _makeAlertControllerForDialog:v10 style:0];
      [(SUScriptNativeObject *)self setObject:v11];
      objc_msgSend(-[SUScriptObject parentViewController](v10, "parentViewController"), "presentViewController:animated:completion:", v11, 1, 0);
      v12 = (void *)[v11 popoverPresentationController];
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v12, "setSourceRect:", x, y, width, height);
        [v13 setSourceView:a4];
        [v13 setPermittedArrowDirections:15];
      }
    }
  }
}

- (void)showSheet
{
  v3 = [(SUScriptNativeObject *)self scriptObject];
  id v4 = [(SUScriptNativeObject *)self object];
  id v5 = [(SUScriptObject *)v3 parentViewController];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "view"), "window");
  if (!v4)
  {
    if (v3)
    {
      uint64_t v7 = v6;
      if (v6)
      {
        do
        {
          id v8 = v5;
          id v5 = (id)[v5 parentViewController];
        }
        while (v5);
        [(SUScriptDialogNativeObject *)self _showSheetInView:v7 fromViewController:v8];
      }
    }
  }
}

- (void)showSheetInViewController:(id)a3
{
  id v5 = [(SUScriptNativeObject *)self scriptObject];
  if (![(SUScriptNativeObject *)self object] && v5)
  {
    uint64_t v6 = [a3 view];
    [(SUScriptDialogNativeObject *)self _showSheetInView:v6 fromViewController:a3];
  }
}

- (id)_makeAlertControllerForDialog:(id)a3 style:(int64_t)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a3 title];
  if (a4) {
    uint64_t v8 = [a3 body];
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = +[SUScriptDialogAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:a4];
  v10 = (void *)[a3 buttons];
  id v11 = (void *)[a3 cancelButtonIndex];
  id v30 = a3;
  v12 = (void *)[a3 destructiveButtonIndex];
  uint64_t v32 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v17 title];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = [v17 title];
        }
        uint64_t v19 = v15 + i;
        if (v11)
        {
          uint64_t v20 = [v11 integerValue];
          uint64_t v21 = v19 == v20;
          if (v19 == v20 || !v12) {
            goto LABEL_19;
          }
LABEL_17:
          uint64_t v21 = 2 * (v19 == [v12 integerValue]);
          goto LABEL_19;
        }
        if (v12) {
          goto LABEL_17;
        }
        uint64_t v21 = 0;
LABEL_19:
        if (v18) {
          v22 = (__CFString *)v18;
        }
        else {
          v22 = &stru_26DB8C5F8;
        }
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke;
        v38[3] = &unk_2648134F8;
        v38[4] = v32;
        v38[5] = v15 + i;
        -[SUScriptDialogAlertController addAction:](v9, "addAction:", [MEMORY[0x263F1C3F0] actionWithTitle:v22 style:v21 handler:v38]);
        [v17 setShouldPerformDefaultAction:0];
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
      v15 += i;
    }
    while (v14);
  }
  v23 = (void *)[v30 textFields];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke_2;
        v33[3] = &unk_264813520;
        v33[4] = v28;
        [(SUScriptDialogAlertController *)v9 addTextFieldWithConfigurationHandler:v33];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v25);
  }
  return v9;
}

uint64_t __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _tearDownForDismissWithButtonIndex:v3];
}

uint64_t __66__SUScriptDialogNativeObject__makeAlertControllerForDialog_style___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 configureFromScriptTextField:*(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 32);

  return [v4 setNativeObjectWithTextField:a2];
}

- (void)_showSheetInView:(id)a3 fromViewController:(id)a4
{
  uint64_t v7 = [(SUScriptNativeObject *)self scriptObject];
  if (![(SUScriptNativeObject *)self object])
  {
    if (v7)
    {
      id v8 = [(SUScriptDialogNativeObject *)self _makeAlertControllerForDialog:v7 style:0];
      [(SUScriptNativeObject *)self setObject:v8];
      [a4 presentViewController:v8 animated:1 completion:0];
      uint64_t v9 = [v8 popoverPresentationController];
      if (v9)
      {
        v10 = (void *)v9;
        [a3 bounds];
        CGFloat x = v19.origin.x;
        CGFloat y = v19.origin.y;
        CGFloat width = v19.size.width;
        CGFloat height = v19.size.height;
        double MinX = CGRectGetMinX(v19);
        v20.origin.CGFloat x = x;
        v20.origin.CGFloat y = y;
        v20.size.CGFloat width = width;
        v20.size.CGFloat height = height;
        double v16 = MinX + floor(CGRectGetWidth(v20) * 0.5);
        v21.origin.CGFloat x = x;
        v21.origin.CGFloat y = y;
        v21.size.CGFloat width = width;
        v21.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v21);
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        objc_msgSend(v10, "setSourceRect:", v16, MinY + floor(CGRectGetHeight(v22) * 0.5), 1.0, 1.0);
        [v10 setSourceView:a3];
        [v10 setPermittedArrowDirections:0];
      }
    }
  }
}

- (void)_tearDownForDismissWithButtonIndex:(int64_t)a3
{
  id v5 = [(SUScriptNativeObject *)self scriptObject];
  uint64_t v6 = (void *)[(SUScriptObject *)v5 buttons];
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = v6;
    if ([v6 count] > (unint64_t)a3)
    {
      id v8 = (void *)[v7 objectAtIndex:a3];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v8, v5, 0);
      [v8 performActionWithArguments:v9];
    }
  }

  [(SUScriptNativeObject *)self destroyNativeObject];
}

@end