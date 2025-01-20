@interface PTEditStringRow(PXEditStringRow)
+ (id)px_rowWithTitle:()PXEditStringRow valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:;
+ (void)_px_configureTextField:()PXEditStringRow withTextPlaceholder:saveAction:forRow:;
- (id)_px_editStringRowTextFieldAction;
- (id)_px_editStringRowTextValidationAction;
- (id)_px_validatedTextFromText:()PXEditStringRow;
- (void)_px_setEditStringRowTextFieldAction:()PXEditStringRow;
- (void)_px_setEditStringRowTextValidationAction:()PXEditStringRow;
- (void)_px_updateSaveActionFromTextField;
- (void)setValue:()PXEditStringRow;
@end

@implementation PTEditStringRow(PXEditStringRow)

- (void)setValue:()PXEditStringRow
{
  v2 = objc_msgSend(a1, "_px_validatedTextFromText:");
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F04BE138;
  objc_msgSendSuper2(&v3, sel_setValue_, v2);
}

- (void)_px_updateSaveActionFromTextField
{
  objc_msgSend(a1, "_px_editStringRowTextFieldAction");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();
}

- (void)_px_setEditStringRowTextFieldAction:()PXEditStringRow
{
  v4 = (const void *)_PXPTEditStringRowTextFieldActionAssociationKey;
  id v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)1);
}

- (id)_px_editStringRowTextFieldAction
{
  v1 = objc_getAssociatedObject(a1, (const void *)_PXPTEditStringRowTextFieldActionAssociationKey);
  v2 = _Block_copy(v1);

  return v2;
}

- (id)_px_validatedTextFromText:()PXEditStringRow
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_px_editStringRowTextValidationAction");

  if (v5)
  {
    objc_msgSend(a1, "_px_editStringRowTextValidationAction");
    v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v6)[2](v6, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (void)_px_setEditStringRowTextValidationAction:()PXEditStringRow
{
  id v4 = (const void *)_PXPTEditStringRowTextValidationActionAssociationKey;
  id v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)1);
}

- (id)_px_editStringRowTextValidationAction
{
  v1 = objc_getAssociatedObject(a1, (const void *)_PXPTEditStringRowTextValidationActionAssociationKey);
  v2 = _Block_copy(v1);

  return v2;
}

+ (void)_px_configureTextField:()PXEditStringRow withTextPlaceholder:saveAction:forRow:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v9 setAutocapitalizationType:0];
  [v9 setAutocorrectionType:1];
  [v9 setEnablesReturnKeyAutomatically:1];
  [v9 setPlaceholder:v10];
  v13 = [v12 value];
  [v9 setText:v13];

  objc_initWeak(&location, v9);
  objc_initWeak(&v22, v11);
  objc_initWeak(&from, v12);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __97__PTEditStringRow_PXEditStringRow___px_configureTextField_withTextPlaceholder_saveAction_forRow___block_invoke;
  v17 = &unk_1E5DCB9A0;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &v22);
  objc_msgSend(v12, "_px_setEditStringRowTextFieldAction:", &v14);
  objc_msgSend(v12, "_px_updateSaveActionFromTextField", v14, v15, v16, v17);
  [v9 addTarget:v12 action:sel__px_updateSaveActionFromTextField forControlEvents:0x20000];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

+ (id)px_rowWithTitle:()PXEditStringRow valueKeyPath:alertTitle:alertMessage:textPlaceholder:textValidator:condition:
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = [a1 rowWithTitle:a3 valueKeyPath:a4];
  [v20 setCondition:v19];

  v21 = (void *)MEMORY[0x1E4F94190];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __129__PTEditStringRow_PXEditStringRow__px_rowWithTitle_valueKeyPath_alertTitle_alertMessage_textPlaceholder_textValidator_condition___block_invoke;
  v28[3] = &unk_1E5DB55F8;
  id v29 = v15;
  id v30 = v16;
  id v32 = v18;
  v33 = a1;
  id v31 = v17;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v18;
  v26 = [v21 actionWithHandler:v28];
  [v20 setAction:v26];

  return v20;
}

@end