@interface UIAlertController(AlertPresenter)
- (id)actionForButton:()AlertPresenter inAlert:;
- (uint64_t)dismissAlert:()AlertPresenter completionHandler:;
- (void)replaceButtonAtIndex:()AlertPresenter withButton:forAlert:;
- (void)setButtons:()AlertPresenter forAlert:;
@end

@implementation UIAlertController(AlertPresenter)

- (id)actionForButton:()AlertPresenter inAlert:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 style];
  if (v8 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * (v8 == 2);
  }
  objc_initWeak(&location, a1);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke;
  aBlock[3] = &unk_264C50F98;
  objc_copyWeak(&v33, &location);
  id v10 = v7;
  id v31 = v10;
  id v11 = v6;
  id v32 = v11;
  v12 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x263F82400];
    id v14 = [v11 title];
    v18 = [v20 actionWithTitle:v14 style:v9 handler:v12];
    goto LABEL_18;
  }
  id v13 = v11;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke_3;
  v28[3] = &unk_264C50FC0;
  id v14 = v13;
  id v29 = v14;
  v27 = _Block_copy(v28);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v15 = objc_alloc_init(WFRichContentItemCellView);
    [(WFRichContentItemCellView *)v15 setSelectableAlertButton:v14];
    if ([v14 isSelected]) {
      double v16 = 25.0;
    }
    else {
      double v16 = 0.0;
    }
    v17 = +[WFUIAlertControllerAlertPresenter contentViewControllerForContentView:padding:](WFUIAlertControllerAlertPresenter, "contentViewControllerForContentView:padding:", v15, 0.0, 0.0, 0.0, v16);
    v18 = [MEMORY[0x263F82400] _actionWithContentViewController:v17 style:v9 handler:v12];
    v19 = _Block_copy(v27);
    [v18 setValue:v19 forKey:@"shouldDismissHandler"];
  }
  else
  {
    v21 = [v14 subtitle];
    if (v21)
    {
    }
    else
    {
      v22 = [v14 image];

      if (!v22)
      {
        v25 = (void *)MEMORY[0x263F82400];
        v15 = [v14 title];
        v18 = [v25 _actionWithTitle:v15 descriptiveText:0 image:0 style:v9 handler:v12 shouldDismissHandler:v27];
        goto LABEL_17;
      }
    }
    v26 = (void *)MEMORY[0x263F82400];
    v15 = [v14 title];
    v17 = [v14 subtitle];
    v19 = [v14 image];
    v23 = [v19 UIImage];
    v18 = [v26 _actionWithTitle:v15 descriptiveText:v17 image:v23 style:v9 handler:v12 shouldDismissHandler:v27];
  }
LABEL_17:

  objc_msgSend(v18, "_setChecked:", objc_msgSend(v14, "isSelected"));
LABEL_18:

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v18;
}

- (void)replaceButtonAtIndex:()AlertPresenter withButton:forAlert:
{
  id v9 = a4;
  id v6 = objc_msgSend(a1, "actionForButton:inAlert:");
  id v7 = [a1 actions];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if ([v8 count] > a3)
  {
    [v8 replaceObjectAtIndex:a3 withObject:v6];
    [a1 _setActions:v8];
  }
  if ([v9 isPreferred]) {
    [a1 setPreferredAction:v6];
  }
}

- (void)setButtons:()AlertPresenter forAlert:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F33798] processContentAlertButtonSubtitles:v6];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  id v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v13 isPreferred])
        {
          id v14 = v13;

          id v9 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__UIAlertController_AlertPresenter__setButtons_forAlert___block_invoke;
  v17[3] = &unk_264C50F50;
  v17[4] = a1;
  id v15 = v7;
  id v18 = v15;
  v19 = &v20;
  double v16 = objc_msgSend(v8, "if_map:", v17);
  [a1 _setActions:v16];
  [a1 setPreferredAction:v21[5]];

  _Block_object_dispose(&v20, 8);
}

- (uint64_t)dismissAlert:()AlertPresenter completionHandler:
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1);
}

@end