@interface DefaultSpamFilterListController
- (BOOL)canEditExtensions;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CXCallDirectoryNSExtensionManager)nsExtensionManager;
- (DefaultSpamFilterListController)initWithNibName:(id)a3 bundle:(id)a4;
- (DefaultSpamFilterListControllerDelegate)delegate;
- (NSMutableSet)appsWithExtensions;
- (PHCallDirectorySettingsController)callDirectorySettingsController;
- (PHLiveLookupSettingsController)liveLookupSettingsController;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)callDirectoryIdentificationIndex;
- (int64_t)extensionCount;
- (int64_t)liveLookupIdentificationIndex;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_updateExtensions;
- (void)addCallDirectorySpecifierIfNecessary:(id)a3;
- (void)addLiveLookupSpecifierIfNecessary:(id)a3;
- (void)refreshView;
- (void)reloadSpecifiers;
- (void)setAppsWithExtensions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DefaultSpamFilterListController

- (DefaultSpamFilterListController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)DefaultSpamFilterListController;
  v4 = [(DefaultSpamFilterListController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[PHCallDirectorySettingsController alloc] initWithParent:v4];
    callDirectorySettingsController = v4->_callDirectorySettingsController;
    v4->_callDirectorySettingsController = v5;

    v7 = [[PHLiveLookupSettingsController alloc] initWithParent:v4];
    liveLookupSettingsController = v4->_liveLookupSettingsController;
    v4->_liveLookupSettingsController = v7;

    v9 = (CXCallDirectoryNSExtensionManager *)objc_alloc_init(MEMORY[0x1E4F19190]);
    nsExtensionManager = v4->_nsExtensionManager;
    v4->_nsExtensionManager = v9;
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DefaultSpamFilterListController;
  [(DefaultSpamFilterListController *)&v4 viewWillAppear:a3];
  [(DefaultSpamFilterListController *)self refreshView];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  if (v6 == [(DefaultSpamFilterListController *)self callDirectoryIdentificationIndex])
  {
    v7 = &OBJC_IVAR___DefaultSpamFilterListController__callDirectorySettingsController;
  }
  else
  {
    uint64_t v8 = [v5 section];
    if (v8 != [(DefaultSpamFilterListController *)self liveLookupIdentificationIndex])
    {
      char v9 = 0;
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___DefaultSpamFilterListController__liveLookupSettingsController;
  }
  char v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v7) canEditExtensions];
LABEL_7:

  return v9;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 section];
  if (v10 == [v9 section])
  {
    uint64_t v11 = [v8 section];
    if (v11 == [(DefaultSpamFilterListController *)self callDirectoryIdentificationIndex])
    {
      objc_super v12 = [(DefaultSpamFilterListController *)self callDirectorySettingsController];
    }
    else
    {
      uint64_t v13 = [v8 section];
      if (v13 != [(DefaultSpamFilterListController *)self liveLookupIdentificationIndex])goto LABEL_7; {
      objc_super v12 = [(DefaultSpamFilterListController *)self liveLookupSettingsController];
      }
    }
    v14 = v12;
    [v12 tableView:v15 moveRowAtIndexPath:v8 toIndexPath:v9];
  }
LABEL_7:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = v6;
  uint64_t v9 = [v8 section];
  id v10 = v8;
  if (v9 == [v7 section])
  {
    id v10 = v7;
  }
  return v10;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(DefaultSpamFilterListController *)self loadSpecifiersFromPlistName:@"CallDirectorySettings" target:self];
    [(DefaultSpamFilterListController *)self addCallDirectorySpecifierIfNecessary:v5];
    [(DefaultSpamFilterListController *)self addLiveLookupSpecifierIfNecessary:v5];
    if (![v5 count])
    {
      id v6 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"CallFilteringSettingsGroup" name:0];
      id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"DEFAULT_CALL_FILTER_EMPTY_FOOTER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
      [v6 setProperty:v8 forKey:*MEMORY[0x1E4F93170]];

      [v5 addObject:v6];
    }
    uint64_t v9 = (objc_class *)[v5 copy];
    id v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DefaultSpamFilterListController;
  -[DefaultSpamFilterListController setEditing:animated:](&v8, sel_setEditing_animated_);
  id v7 = [(DefaultSpamFilterListController *)self table];
  [v7 setEditing:v5 animated:v4];

  [(DefaultSpamFilterListController *)self setNavigationItemsForEditing:v5 animated:v4];
  if (!v5) {
    [(DefaultSpamFilterListController *)self refreshView];
  }
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)DefaultSpamFilterListController;
  [(DefaultSpamFilterListController *)&v3 reloadSpecifiers];
  [(DefaultSpamFilterListController *)self setNavigationItemsForEditing:[(DefaultSpamFilterListController *)self isEditing] animated:0];
}

- (void)addCallDirectorySpecifierIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Call Directory addCallDirectorySpecifierIfNecessary", v7, 2u);
  }

  id v6 = [(PHCallDirectorySettingsController *)self->_callDirectorySettingsController specifiers];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
}

- (void)addLiveLookupSpecifierIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "live lookup addLiveLookupSpecifierIfNecessary", v7, 2u);
  }

  id v6 = [(PHLiveLookupSettingsController *)self->_liveLookupSettingsController specifiers];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
}

- (BOOL)canEditExtensions
{
  objc_super v3 = [(DefaultSpamFilterListController *)self callDirectorySettingsController];
  if ([v3 canEditExtensions])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(DefaultSpamFilterListController *)self liveLookupSettingsController];
    char v4 = [v5 canEditExtensions];
  }
  return v4;
}

- (void)refreshView
{
  if (([(DefaultSpamFilterListController *)self isEditing] & 1) == 0
    && [(DefaultSpamFilterListController *)self isViewLoaded])
  {
    [(DefaultSpamFilterListController *)self reloadSpecifiers];
    uint64_t v3 = [(DefaultSpamFilterListController *)self isEditing];
    [(DefaultSpamFilterListController *)self setNavigationItemsForEditing:v3 animated:0];
  }
}

- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = [(DefaultSpamFilterListController *)self navigationItem];
  if (v10 && [(DefaultSpamFilterListController *)self isViewLoaded])
  {
    if ([(DefaultSpamFilterListController *)self canEditExtensions])
    {
      id v6 = [(DefaultSpamFilterListController *)self editButtonItem];
    }
    else
    {
      id v6 = 0;
    }
    id v7 = [v10 leftBarButtonItem];

    if (v7) {
      [v10 setLeftBarButtonItem:0 animated:v4];
    }
    objc_super v8 = [v10 rightBarButtonItem];

    if (v8 != v6) {
      [v10 setRightBarButtonItem:v6 animated:v4];
    }
  }
  uint64_t v9 = [(DefaultSpamFilterListController *)self delegate];
  objc_msgSend(v9, "canEditExtensionsDidChangeForController:canEditExtensions:", self, -[DefaultSpamFilterListController canEditExtensions](self, "canEditExtensions"));
}

- (int64_t)callDirectoryIdentificationIndex
{
  return [(PHCallDirectorySettingsController *)self->_callDirectorySettingsController hasExtensions]
       - 1;
}

- (int64_t)liveLookupIdentificationIndex
{
  int64_t v3 = [(DefaultSpamFilterListController *)self callDirectoryIdentificationIndex];
  return v3 + [(PHLiveLookupSettingsController *)self->_liveLookupSettingsController hasExtensions];
}

- (void)_updateExtensions
{
  nsExtensionManager = self->_nsExtensionManager;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__DefaultSpamFilterListController__updateExtensions__block_invoke;
  v3[3] = &unk_1E6EB21A8;
  v3[4] = self;
  [(CXCallDirectoryNSExtensionManager *)nsExtensionManager extensionsWithCompletionHandler:v3];
}

void __52__DefaultSpamFilterListController__updateExtensions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "localizedContainingAppName", (void)v11);
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 32) setAppsWithExtensions:v4];
    [*(id *)(a1 + 32) refreshView];
  }
}

- (int64_t)extensionCount
{
  return [(NSMutableSet *)self->_appsWithExtensions count];
}

- (DefaultSpamFilterListControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (PHCallDirectorySettingsController)callDirectorySettingsController
{
  return self->_callDirectorySettingsController;
}

- (PHLiveLookupSettingsController)liveLookupSettingsController
{
  return self->_liveLookupSettingsController;
}

- (CXCallDirectoryNSExtensionManager)nsExtensionManager
{
  return self->_nsExtensionManager;
}

- (NSMutableSet)appsWithExtensions
{
  return self->_appsWithExtensions;
}

- (void)setAppsWithExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsWithExtensions, 0);
  objc_storeStrong((id *)&self->_nsExtensionManager, 0);
  objc_storeStrong((id *)&self->_liveLookupSettingsController, 0);
  objc_storeStrong((id *)&self->_callDirectorySettingsController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end