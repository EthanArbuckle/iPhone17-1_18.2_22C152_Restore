@interface SBHIconRootTableViewController
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isEditing;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isScrollTracking;
- (BOOL)isScrolling;
- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (NSSet)presentedIconLocations;
- (SBFolder)folder;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconImageCache)iconImageCache;
- (UIViewController)deepestFolderController;
- (_UILegibilitySettings)legibilitySettings;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)currentPageIndex;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)orientation;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)contentVisibility;
- (void)cancelScrolling;
- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setCurrentPageIndex:(int64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFolder:(id)a3;
- (void)setFolderIconImageCache:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation SBHIconRootTableViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBHIconRootTableViewController;
  [(SBHIconRootTableViewController *)&v5 viewDidLoad];
  v3 = [(SBHIconRootTableViewController *)self tableView];
  v4 = self;
  [v3 registerClass:v4 forCellReuseIdentifier:@"RootIcon"];
}

- (void)setFolder:(id)a3
{
  objc_super v5 = (SBFolder *)a3;
  if (self->_folder != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_folder, a3);
    v6 = [(SBHIconRootTableViewController *)self tableView];
    [v6 reloadData];

    objc_super v5 = v7;
  }
}

- (UIViewController)deepestFolderController
{
  return 0;
}

- (int64_t)orientation
{
  return 1;
}

- (BOOL)isEditing
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconRootTableViewController;
  return [(SBHIconRootTableViewController *)&v3 isEditing];
}

- (void)setEditing:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconRootTableViewController;
  [(SBHIconRootTableViewController *)&v3 setEditing:a3];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBHIconRootTableViewController;
  [(SBHIconRootTableViewController *)&v4 setEditing:a3 animated:a4];
}

- (BOOL)isScrolling
{
  return 0;
}

- (BOOL)isScrollTracking
{
  v2 = [(SBHIconRootTableViewController *)self tableView];
  char v3 = [v2 isTracking];

  return v3;
}

- (void)cancelScrolling
{
  id v2 = [(SBHIconRootTableViewController *)self tableView];
  [v2 cancelTouchTracking];
}

- (int64_t)currentPageIndex
{
  id v2 = [(SBHIconRootTableViewController *)self tableView];
  char v3 = [v2 indexPathsForVisibleRows];

  objc_super v4 = [v3 firstObject];
  int64_t v5 = [v4 section];

  return v5;
}

- (void)setCurrentPageIndex:(int64_t)a3
{
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (**)(void))a5;
  v9 = [(SBHIconRootTableViewController *)self tableView];
  v10 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:a3];
  [v9 rectForRowAtIndexPath:v10];
  objc_msgSend(v9, "setContentOffset:animated:", v5);
  if (v8) {
    v8[2](v8);
  }

  return 1;
}

- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(SBHIconRootTableViewController *)self folder];
  v11 = [v10 indexPathForIcon:v9];

  if (v11)
  {
    uint64_t v12 = SBFolderRelativeListIndex(v11);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__SBHIconRootTableViewController_revealIcon_animated_completionHandler___block_invoke;
    v13[3] = &unk_1E6AAD4C8;
    id v14 = v8;
    [(SBHIconRootTableViewController *)self setCurrentPageIndex:v12 animated:v5 completion:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __72__SBHIconRootTableViewController_revealIcon_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return [a3 isEqualToString:@"SBIconLocationRoot"];
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"SBIconLocationRoot"];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return 0;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  return 0;
}

- (id)firstIconViewForIcon:(id)a3
{
  return 0;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  return 0;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return 0;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return 0;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return 0;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  return 0;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char v3 = [(SBHIconRootTableViewController *)self folder];
  int64_t v4 = [v3 listCount];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v5 = [(SBHIconRootTableViewController *)self folder];
  v6 = [v5 listAtIndex:a4];

  int64_t v7 = [v6 numberOfIcons];
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"RootIcon" forIndexPath:v6];
  id v8 = [(SBHIconRootTableViewController *)self folder];
  id v9 = [v8 iconAtIndexPath:v6];

  v10 = [(SBHIconRootTableViewController *)self traitCollection];
  v11 = [v7 textLabel];
  uint64_t v12 = [v9 displayNameForLocation:@"SBIconLocationRoot"];
  [v11 setText:v12];

  v13 = [v7 imageView];
  id v14 = [(SBHIconRootTableViewController *)self iconImageCache];
  v15 = [v14 imageForIcon:v9 compatibleWithTraitCollection:v10 options:0];
  [v13 setImage:v15];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBHIconRootTableViewController *)self folder];
  id v8 = [v9 iconAtIndexPath:v6];
  [v8 launchFromLocation:@"SBIconLocationRoot" context:0];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (SBFolder)folder
{
  return self->_folder;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)setFolderIconImageCache:(id)a3
{
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  self->_contentVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end