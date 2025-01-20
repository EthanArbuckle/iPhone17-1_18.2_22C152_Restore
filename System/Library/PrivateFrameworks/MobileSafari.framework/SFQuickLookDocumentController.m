@interface SFQuickLookDocumentController
- (SFQuickLookDocumentController)init;
- (UIView)documentView;
- (id)_actionTitleForType:(int64_t)a3 withActionCount:(unint64_t)a4;
- (id)_supportedApplications;
- (id)itemProviderForQuickLookDocumentView:(id)a3;
- (int64_t)dataOwnerForQuickLookDocumentView:(id)a3;
- (void)_updateActionButtons;
- (void)presentDocumentInteractionControllerFromSource:(id)a3;
- (void)quickLookDocumentView:(id)a3 didSelectActionAtIndex:(int64_t)a4;
- (void)updateWithQuickLookDocument:(id)a3;
@end

@implementation SFQuickLookDocumentController

- (SFQuickLookDocumentController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFQuickLookDocumentController;
  v2 = [(SFQuickLookDocumentController *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(SFQuickLookDocumentView);
    documentView = v2->_documentView;
    v2->_documentView = v3;

    [(SFQuickLookDocumentView *)v2->_documentView setQuickLookDocumentViewDelegate:v2];
    v5 = v2;
  }

  return v2;
}

- (void)updateWithQuickLookDocument:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_quickLookDocument, a3);
  [(SFQuickLookDocumentController *)self _updateActionButtons];
  v6 = [(SFQuickLookDocument *)self->_quickLookDocument savedURLWithProperExtension];
  if (v6)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F42980];
    v8 = [v5 sourceURL];
    objc_msgSend(v7, "sf_interactionControllerWithDocumentURL:sourceURL:", v6, v8);
    v9 = (UIDocumentInteractionController *)objc_claimAutoreleasedReturnValue();
    documentInteractionController = self->_documentInteractionController;
    self->_documentInteractionController = v9;

    -[UIDocumentInteractionController setShouldUnzipDocument:](self->_documentInteractionController, "setShouldUnzipDocument:", [v5 shouldUnzipByUIDocumentInteractionController]);
    documentView = self->_documentView;
    v12 = [(UIDocumentInteractionController *)self->_documentInteractionController icons];
    v13 = [v12 lastObject];
    [(SFQuickLookDocumentView *)documentView updateDocumentIcon:v13];

    v14 = self->_documentView;
    v15 = [(SFQuickLookDocument *)self->_quickLookDocument fileName];
    [(SFQuickLookDocumentView *)v14 updateDocumentFileName:v15];

    v16 = self->_documentView;
    v17 = [(SFQuickLookDocument *)self->_quickLookDocument localizedType];
    [(SFQuickLookDocumentView *)v16 updateDocumentFileType:v17];

    unint64_t v18 = [(SFQuickLookDocument *)self->_quickLookDocument fileSize];
    v19 = self->_documentView;
    id v20 = objc_alloc_init(MEMORY[0x1E4F28B68]);
    [v20 setCountStyle:3];
    v21 = [v20 stringFromByteCount:v18];

    [(SFQuickLookDocumentView *)v19 updateDocumentFileSize:v21];
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SFQuickLookDocumentController updateWithQuickLookDocument:](v22);
    }
  }
}

- (void)presentDocumentInteractionControllerFromSource:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke;
  v4[3] = &unk_1E54EC768;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke_2;
  v3[3] = &unk_1E54EC790;
  v3[4] = self;
  _SFPopoverSourceInfoUnwrap(a3, @"quick look document controller", v4, v3, &__block_literal_global_46);
}

uint64_t __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "presentOptionsMenuFromRect:inView:animated:", a2, 1);
}

uint64_t __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) presentOptionsMenuFromBarButtonItem:a2 animated:1];
}

- (void)_updateActionButtons
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(SFQuickLookDocumentController *)self _supportedApplications];
  id v5 = [v4 firstObject];

  if (v5) {
    [v3 addObject:&unk_1EDA42420];
  }
  if (!-[UIDocumentInteractionController sourceIsManaged](self->_documentInteractionController, "sourceIsManaged")|| [v4 count])
  {
    [v3 addObject:&unk_1EDA42438];
  }
  v6 = (NSArray *)[v3 copy];
  buttonActions = self->_buttonActions;
  self->_buttonActions = v6;

  NSUInteger v8 = [(NSArray *)self->_buttonActions count];
  documentView = self->_documentView;
  v10 = self->_buttonActions;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SFQuickLookDocumentController__updateActionButtons__block_invoke;
  v12[3] = &unk_1E54EC7D8;
  v12[4] = self;
  v12[5] = v8;
  v11 = [(NSArray *)v10 safari_mapObjectsUsingBlock:v12];
  [(SFQuickLookDocumentView *)documentView updateActionTitles:v11];
}

uint64_t __53__SFQuickLookDocumentController__updateActionButtons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 _actionTitleForType:v3 withActionCount:v5];
}

- (id)_supportedApplications
{
  uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v4 = [(SFQuickLookDocument *)self->_quickLookDocument documentProxy];
  uint64_t v5 = [v3 applicationsAvailableForOpeningDocument:v4];

  return v5;
}

- (id)_actionTitleForType:(int64_t)a3 withActionCount:(unint64_t)a4
{
  v6 = [(SFQuickLookDocumentController *)self _supportedApplications];
  objc_super v7 = [v6 firstObject];

  if (a3 == 1)
  {
    a4 = _WBSLocalizedString();
  }
  else if (!a3)
  {
    NSUInteger v8 = NSString;
    v9 = _WBSLocalizedString();
    v10 = [v7 localizedName];
    a4 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
  }

  return (id)a4;
}

- (void)quickLookDocumentView:(id)a3 didSelectActionAtIndex:(int64_t)a4
{
  v6 = [(NSArray *)self->_buttonActions objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 integerValue];

  if (v7)
  {
    if (v7 == 1)
    {
      documentInteractionController = self->_documentInteractionController;
      [(SFQuickLookDocumentView *)self->_documentView frameForButtonAtIndex:a4];
      documentView = self->_documentView;
      -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](documentInteractionController, "presentOptionsMenuFromRect:inView:animated:", documentView, 1);
    }
  }
  else
  {
    v10 = self->_documentInteractionController;
    [(UIDocumentInteractionController *)v10 openDocumentWithDefaultApplication];
  }
}

- (id)itemProviderForQuickLookDocumentView:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  objc_msgSend(v4, "safari_registerFileRepresentationForQuickLookDocument:", self->_quickLookDocument);

  return v4;
}

- (int64_t)dataOwnerForQuickLookDocumentView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  uint64_t v5 = [(SFQuickLookDocument *)self->_quickLookDocument sourceURL];
  if ([v4 isURLManaged:v5]) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 3;
  }

  return v6;
}

- (UIView)documentView
{
  return &self->_documentView->super.super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_storeStrong((id *)&self->_documentView, 0);
  objc_storeStrong((id *)&self->_documentInteractionController, 0);

  objc_storeStrong((id *)&self->_buttonActions, 0);
}

- (void)updateWithQuickLookDocument:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Could not get file URL for QuickLook document", v1, 2u);
}

@end