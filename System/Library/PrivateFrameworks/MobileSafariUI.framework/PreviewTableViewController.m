@interface PreviewTableViewController
- (LinkPreviewProvider)linkPreviewProvider;
- (PreviewTableViewControllerDelegate)previewDelegate;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setPreviewDelegate:(id)a3;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PreviewTableViewController

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PreviewTableViewController;
  [(PreviewTableViewController *)&v5 viewWillDisappear:a3];
  v4 = [(PreviewTableViewController *)self tableView];
  -[UITableView safari_dismissContextMenu](v4);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E4FB1678];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v17[3] = &unk_1E6D7AF58;
  objc_copyWeak(&v19, &location);
  id v10 = v8;
  id v18 = v10;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v14[3] = &unk_1E6D7AF80;
  objc_copyWeak(&v16, &location);
  id v11 = v10;
  id v15 = v11;
  v12 = [v9 configurationWithIdentifier:v11 previewProvider:v17 actionProvider:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

id __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 128);
    objc_super v5 = [v4 previewTableViewController:v3 URLForRowAtIndexPath:*(void *)(a1 + 32)];

    id v6 = objc_loadWeakRetained(v3 + 129);
    id v7 = [v6 linkPreviewViewControllerForURL:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 128);
    objc_super v5 = [v4 previewTableViewController:v3 menuForRowAtIndexPath:*(void *)(a1 + 32)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [a4 identifier];
  id v7 = [v5 cellForRowAtIndexPath:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7];
  return v8;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 setPreferredCommitStyle:1];
  id v11 = [v10 previewViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__PreviewTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v15[3] = &unk_1E6D78AE8;
  id v16 = v8;
  id v17 = v11;
  id v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  [v10 addAnimations:v15];
}

void __98__PreviewTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 1032));
    [WeakRetained commitLinkPreviewViewController:*(void *)(a1 + 40)];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v3 = *(void *)(a1 + 32);
    WeakRetained = [*(id *)(a1 + 56) identifier];
    [v4 tableView:v3 didSelectRowAtIndexPath:WeakRetained];
  }

LABEL_6:
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  [WeakRetained linkPreviewProviderWillDismissPreview];

  return 0;
}

- (PreviewTableViewControllerDelegate)previewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  return (PreviewTableViewControllerDelegate *)WeakRetained;
}

- (void)setPreviewDelegate:(id)a3
{
}

- (LinkPreviewProvider)linkPreviewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  return (LinkPreviewProvider *)WeakRetained;
}

- (void)setLinkPreviewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_previewDelegate);
}

@end