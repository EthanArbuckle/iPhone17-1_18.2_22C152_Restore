@interface PXTitleEditor
- (BOOL)includesSubtitle;
- (NSString)cancelButtonTitle;
- (NSString)confirmButtonTitle;
- (NSString)message;
- (NSString)subtitle;
- (NSString)subtitlePlaceholder;
- (NSString)title;
- (NSString)titlePlaceholder;
- (PXTitleEditor)init;
- (UIAlertAction)confirmAction;
- (UITextField)subtitleTextField;
- (UITextField)titleTextField;
- (id)completionHandler;
- (id)createAlertController;
- (id)validation;
- (void)_handleSuccess:(BOOL)a3;
- (void)_updateConfirmAction;
- (void)_updateExposedProperties;
- (void)presentFromViewController:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConfirmAction:(id)a3;
- (void)setConfirmButtonTitle:(id)a3;
- (void)setIncludesSubtitle:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitlePlaceholder:(id)a3;
- (void)setSubtitleTextField:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitlePlaceholder:(id)a3;
- (void)setTitleTextField:(id)a3;
- (void)setValidation:(id)a3;
@end

@implementation PXTitleEditor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmAction, 0);
  objc_storeStrong((id *)&self->_subtitleTextField, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_validation, 0);
  objc_storeStrong((id *)&self->_confirmButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_subtitlePlaceholder, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titlePlaceholder, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (UIAlertAction)confirmAction
{
  return self->_confirmAction;
}

- (void)setSubtitleTextField:(id)a3
{
}

- (UITextField)subtitleTextField
{
  return self->_subtitleTextField;
}

- (void)setTitleTextField:(id)a3
{
}

- (UITextField)titleTextField
{
  return self->_titleTextField;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setValidation:(id)a3
{
}

- (id)validation
{
  return self->_validation;
}

- (void)setConfirmButtonTitle:(id)a3
{
}

- (NSString)confirmButtonTitle
{
  return self->_confirmButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSString)subtitlePlaceholder
{
  return self->_subtitlePlaceholder;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setIncludesSubtitle:(BOOL)a3
{
  self->_includesSubtitle = a3;
}

- (BOOL)includesSubtitle
{
  return self->_includesSubtitle;
}

- (void)setTitlePlaceholder:(id)a3
{
}

- (NSString)titlePlaceholder
{
  return self->_titlePlaceholder;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)_updateConfirmAction
{
  [(PXTitleEditor *)self _updateExposedProperties];
  uint64_t v3 = [(PXTitleEditor *)self validation];
  id v6 = (id)v3;
  if (v3) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, PXTitleEditor *))(v3 + 16))(v3, self);
  }
  else {
    uint64_t v4 = 1;
  }
  v5 = [(PXTitleEditor *)self confirmAction];
  [v5 setEnabled:v4];
}

- (id)createAlertController
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v4 = [(PXTitleEditor *)self message];
  v5 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:1];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PXTitleEditor_createAlertController__block_invoke;
  aBlock[3] = &unk_1E5DAE0F0;
  aBlock[4] = self;
  id v6 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__PXTitleEditor_createAlertController__block_invoke_2;
  v19[3] = &unk_1E5DAE118;
  id v7 = v6;
  v19[4] = self;
  id v20 = v7;
  [v5 addTextFieldWithConfigurationHandler:v19];
  if ([(PXTitleEditor *)self includesSubtitle])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __38__PXTitleEditor_createAlertController__block_invoke_3;
    v17[3] = &unk_1E5DAE118;
    v17[4] = self;
    id v18 = v7;
    [v5 addTextFieldWithConfigurationHandler:v17];
  }
  v8 = (void *)MEMORY[0x1E4FB1410];
  v9 = [(PXTitleEditor *)self confirmButtonTitle];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__PXTitleEditor_createAlertController__block_invoke_4;
  v16[3] = &unk_1E5DD0030;
  v16[4] = self;
  v10 = [v8 actionWithTitle:v9 style:0 handler:v16];

  [v5 addAction:v10];
  [(PXTitleEditor *)self setConfirmAction:v10];
  v11 = (void *)MEMORY[0x1E4FB1410];
  v12 = [(PXTitleEditor *)self cancelButtonTitle];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__PXTitleEditor_createAlertController__block_invoke_5;
  v15[3] = &unk_1E5DD0030;
  v15[4] = self;
  v13 = [v11 actionWithTitle:v12 style:1 handler:v15];
  [v5 addAction:v13];

  return v5;
}

void __38__PXTitleEditor_createAlertController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAutocapitalizationType:2];
  [v3 setAutocorrectionType:0];
  [v3 setClearButtonMode:1];
  [v3 setReturnKeyType:9];
  [v3 setEnablesReturnKeyAutomatically:1];
  [v3 addTarget:*(void *)(a1 + 32) action:sel__textFieldDidChange_ forControlEvents:0x20000];
}

void __38__PXTitleEditor_createAlertController__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v7 = a2;
  v4(v3, v7);
  v5 = [*(id *)(a1 + 32) titlePlaceholder];
  [v7 setPlaceholder:v5];

  id v6 = [*(id *)(a1 + 32) title];
  [v7 setText:v6];

  [*(id *)(a1 + 32) setTitleTextField:v7];
}

void __38__PXTitleEditor_createAlertController__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v7 = a2;
  v4(v3, v7);
  v5 = [*(id *)(a1 + 32) subtitlePlaceholder];
  [v7 setPlaceholder:v5];

  id v6 = [*(id *)(a1 + 32) subtitle];
  [v7 setText:v6];

  [*(id *)(a1 + 32) setSubtitleTextField:v7];
}

uint64_t __38__PXTitleEditor_createAlertController__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSuccess:1];
}

uint64_t __38__PXTitleEditor_createAlertController__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSuccess:0];
}

- (void)presentFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PXTitleEditor *)self createAlertController];
  [v4 presentViewController:v5 animated:1 completion:0];
}

- (void)setConfirmAction:(id)a3
{
  id v5 = (UIAlertAction *)a3;
  if (self->_confirmAction != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_confirmAction, a3);
    [(PXTitleEditor *)self _invalidateConfirmAction];
    id v5 = v6;
  }
}

- (void)_handleSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXTitleEditor *)self _updateExposedProperties];
  id v5 = [(PXTitleEditor *)self completionHandler];
  v5[2](v5, self, v3);
}

- (void)_updateExposedProperties
{
  BOOL v3 = [(PXTitleEditor *)self titleTextField];
  id v4 = [v3 text];
  [(PXTitleEditor *)self setTitle:v4];

  id v6 = [(PXTitleEditor *)self subtitleTextField];
  id v5 = [v6 text];
  [(PXTitleEditor *)self setSubtitle:v5];
}

- (void)setSubtitlePlaceholder:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  subtitlePlaceholder = self->_subtitlePlaceholder;
  self->_subtitlePlaceholder = v4;

  [(PXTitleEditor *)self setIncludesSubtitle:1];
}

- (void)setSubtitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  [(PXTitleEditor *)self setIncludesSubtitle:1];
}

- (PXTitleEditor)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXTitleEditor;
  v2 = [(PXTitleEditor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
    cancelButtonTitle = v2->_cancelButtonTitle;
    v2->_cancelButtonTitle = (NSString *)v3;

    uint64_t v5 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
    confirmButtonTitle = v2->_confirmButtonTitle;
    v2->_confirmButtonTitle = (NSString *)v5;

    id completionHandler = v2->_completionHandler;
    v2->_id completionHandler = &__block_literal_global_779;
  }
  return v2;
}

@end