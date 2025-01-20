@interface ExtensionListViewController
- (ExtensionListViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)extensionItemActivationStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_loadExtensions;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)setExtensionItemActivationStyle:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ExtensionListViewController

- (ExtensionListViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)ExtensionListViewController;
  return [(ExtensionListViewController *)&v3 init];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ExtensionListViewController;
  [(ExtensionListViewController *)&v5 viewDidLoad];
  objc_super v3 = [(ExtensionListViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"extension"];

  v4 = objc_opt_new();
  [v4 addTarget:self action:sel__loadExtensions forControlEvents:4096];
  [(ExtensionListViewController *)self setRefreshControl:v4];
  [(ExtensionListViewController *)self _loadExtensions];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ExtensionListViewController;
  [(ExtensionListViewController *)&v3 viewWillAppear:a3];
}

- (void)_loadExtensions
{
  if (MEMORY[0x1D9433950]("-[ExtensionListViewController _loadExtensions]", a2))
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F25880]) initWithExtensionPointIdentifier:@"com.apple.posterkit.provider"];
    v4 = dispatch_get_global_queue(33, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__ExtensionListViewController__loadExtensions__block_invoke;
    v6[3] = &unk_1E69808E8;
    id v7 = v3;
    v8 = self;
    id v5 = v3;
    dispatch_async(v4, v6);
  }
}

void __46__ExtensionListViewController__loadExtensions__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F25888] executeQuery:*(void *)(a1 + 32)];
  objc_super v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_1];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ExtensionListViewController__loadExtensions__block_invoke_3;
  v5[3] = &unk_1E69808E8;
  v5[4] = *(void *)(a1 + 40);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __46__ExtensionListViewController__loadExtensions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedName];
  id v6 = [v4 localizedName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __46__ExtensionListViewController__loadExtensions__block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 1024);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 32) extensionItemActivationStyle];
  v8 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__ExtensionListViewController__loadExtensions__block_invoke_4;
  v15[3] = &__block_descriptor_40_e30__16__0___EXExtensionIdentity_8l;
  v15[4] = v7;
  uint64_t v9 = objc_msgSend(v8, "bs_map:", v15);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 1024);
  *(void *)(v10 + 1024) = v9;

  v12 = [*(id *)(a1 + 32) tableView];
  [v12 reloadData];

  dispatch_time_t v13 = dispatch_time(0, 800000000);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__ExtensionListViewController__loadExtensions__block_invoke_5;
  v14[3] = &unk_1E69808C0;
  v14[4] = *(void *)(a1 + 32);
  dispatch_after(v13, MEMORY[0x1E4F14428], v14);
}

ExtensionItem *__46__ExtensionListViewController__loadExtensions__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[ExtensionItem itemWithExtension:a2 activationStyle:*(void *)(a1 + 32)];
}

void __46__ExtensionListViewController__loadExtensions__block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) refreshControl];
  [v1 endRefreshing];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_extensions count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"extension" forIndexPath:v6];
  v8 = [v7 defaultContentConfiguration];
  extensions = self->_extensions;
  uint64_t v10 = [v6 row];

  v11 = [(NSArray *)extensions objectAtIndex:v10];
  v12 = [v11 name];
  [v8 setText:v12];

  [v7 setContentConfiguration:v8];
  return v7;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = -[NSArray objectAtIndex:](self->_extensions, "objectAtIndex:", [v7 row]);
  if (![v8 wasEverActivated]) {
    goto LABEL_4;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4FB1688];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__ExtensionListViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v15[3] = &unk_1E6981DA8;
  id v16 = v8;
  id v17 = v6;
  id v18 = v7;
  uint64_t v10 = [v9 contextualActionWithStyle:1 title:@"Invalidate" handler:v15];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4FB1CC0];
    v19[0] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    dispatch_time_t v13 = [v11 configurationWithActions:v12];
  }
  else
  {
LABEL_4:
    dispatch_time_t v13 = 0;
  }

  return v13;
}

void __92__ExtensionListViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)a1[4];
  id v6 = a4;
  [v5 invalidate];
  id v7 = (void *)a1[5];
  v9[0] = a1[6];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:100];

  v6[2](v6, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[NSArray objectAtIndex:](self->_extensions, "objectAtIndex:", [v7 row]);
  uint64_t v9 = [v8 activate];
  uint64_t v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v9 setDelegate:self];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ExtensionListViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v14[3] = &unk_1E69808E8;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [(ExtensionListViewController *)self presentViewController:v9 animated:1 completion:v14];
}

void __65__ExtensionListViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
  id v2 = *(void **)(a1 + 32);
  v4[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 reloadRowsAtIndexPaths:v3 withRowAnimation:100];
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
}

- (int64_t)extensionItemActivationStyle
{
  return self->_extensionItemActivationStyle;
}

- (void)setExtensionItemActivationStyle:(int64_t)a3
{
  self->_extensionItemActivationStyle = a3;
}

- (void).cxx_destruct
{
}

@end