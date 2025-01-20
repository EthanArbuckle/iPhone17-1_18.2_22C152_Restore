@interface PXDebugCMMIncomingTableViewController
- (PXCMMInvitationsDataSource)dataSource;
- (PXCMMInvitationsDataSourceManager)dataSourceManager;
- (PXDebugCMMIncomingTableViewController)initWithDataSourceManager:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXDebugCMMIncomingTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (void)setDataSource:(id)a3
{
}

- (PXCMMInvitationsDataSource)dataSource
{
  return self->_dataSource;
}

- (PXCMMInvitationsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXDataSourceManagerObservationContext == a5)
  {
    v6 = [(PXDebugCMMIncomingTableViewController *)self tableView];
    v7 = [(PXDebugCMMIncomingTableViewController *)self dataSource];
    v8 = [(PXDebugCMMIncomingTableViewController *)self dataSourceManager];
    v9 = [v8 dataSource];

    v10 = [(PXDebugCMMIncomingTableViewController *)self dataSourceManager];
    v11 = [v10 changeHistory];
    v12 = objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v7, "identifier"), objc_msgSend(v9, "identifier"));

    if ([v12 count] == 1)
    {
      v13 = [v12 firstObject];
    }
    else
    {
      v13 = 0;
    }
    v14 = [v13 itemChangesInSection:0];
    v15 = v14;
    if (v14 && [v14 hasIncrementalChanges])
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke;
      v19[3] = &unk_1E5DCAEC8;
      v19[4] = self;
      id v20 = v9;
      id v21 = v15;
      id v22 = v6;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke_2;
      v16[3] = &unk_1E5DD0058;
      id v17 = v21;
      id v18 = v22;
      [v18 performBatchUpdates:v19 completion:v16];
    }
    else
    {
      [(PXDebugCMMIncomingTableViewController *)self setDataSource:v9];
      [v6 reloadData];
    }
  }
}

void __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 48) removedIndexes];
  if ([v7 count])
  {
    v2 = *(void **)(a1 + 56);
    v3 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v7, 0);
    [v2 deleteRowsAtIndexPaths:v3 withRowAnimation:100];
  }
  v4 = [*(id *)(a1 + 48) insertedIndexes];
  if ([v4 count])
  {
    v5 = *(void **)(a1 + 56);
    v6 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v4, 0);
    [v5 insertRowsAtIndexPaths:v6 withRowAnimation:100];
  }
}

void __70__PXDebugCMMIncomingTableViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) changedIndexes];
  if ([v4 count])
  {
    v2 = *(void **)(a1 + 40);
    v3 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v4, 0);
    [v2 reloadRowsAtIndexPaths:v3 withRowAnimation:100];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(PXDebugCMMIncomingTableViewController *)self dataSource];
  int64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PXDebugCMMIncomingTableViewController *)self dataSource];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PXDebugCMMIncomingTableViewController;
  [(PXDebugCMMIncomingTableViewController *)&v5 viewDidLoad];
  v3 = [(PXDebugCMMIncomingTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXDebugCMMIncomingTableViewCellReuseIdentifier"];

  int64_t v4 = [(UIViewController *)self px_extendedTraitCollection];
  [v4 registerChangeObserver:self context:PXExtendedTraitCollectionObservationContext_79001];
}

- (PXDebugCMMIncomingTableViewController)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXDebugCMMIncomingTableViewController;
  int64_t v6 = [(PXDebugCMMIncomingTableViewController *)&v11 initWithStyle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    [(PXSectionedDataSourceManager *)v7->_dataSourceManager registerChangeObserver:v7 context:PXDataSourceManagerObservationContext];
    uint64_t v8 = [v5 dataSource];
    dataSource = v7->_dataSource;
    v7->_dataSource = (PXCMMInvitationsDataSource *)v8;

    [(UIViewController *)v7 px_enableExtendedTraitCollection];
  }

  return v7;
}

@end