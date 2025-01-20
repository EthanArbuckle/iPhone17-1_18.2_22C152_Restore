@interface UIViewController
- (BKRootBarCoordinating)bk_rootBarCoordinator;
- (id)_bk_sceneController;
- (void)_bk_setSceneController:(id)a3;
- (void)bk_presentCollectionWithID:(id)a3;
- (void)bk_presentCollectionWithID:(id)a3 replaceExistingPresentedCollection:(BOOL)a4;
- (void)doneButtonPressed;
@end

@implementation UIViewController

- (void)_bk_setSceneController:(id)a3
{
  id v4 = a3;
  value = [[_BKSceneControllerWrapper alloc] initWithSceneController:v4];

  objc_setAssociatedObject(self, &off_100A4A0E0, value, (void *)1);
}

- (void)bk_presentCollectionWithID:(id)a3
{
}

- (void)bk_presentCollectionWithID:(id)a3 replaceExistingPresentedCollection:(BOOL)a4
{
  BOOL v34 = a4;
  id v5 = a3;
  v36 = v5;
  if ([v5 isEqualToString:kBKCollectionDefaultIDFinished])
  {
    v6 = BKLibraryBookshelfLibraryFinishedViewConfiguration;
LABEL_7:
    id v7 = objc_alloc_init(v6);
    v8 = +[BKLibraryBookshelfController setupBookshelfWithConfig:v7];
    v9 = +[BCCollection titleForDefaultCollectionID:v5];
    [v8 setTitle:v9];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:kBKCollectionDefaultIDWantToRead])
  {
    v6 = BKLibraryBookshelfLibraryWantToReadViewConfiguration;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:kBKCollectionDefaultIDSamples])
  {
    v6 = BKLibraryBookshelfLibrarySamplesViewConfiguration;
    goto LABEL_7;
  }
  v29 = +[BKLibraryManager defaultManager];
  v30 = [v29 collectionController];
  v31 = +[BKLibraryManager defaultManager];
  v32 = [v31 uiChildContext];
  id v7 = [v30 mutableCollectionWithCollectionID:v5 inManagedObjectContext:v32 error:0];

  v9 = [[BKLibraryBookshelfLibraryCollectionViewConfiguration alloc] initWithCollection:v7];
  v8 = +[BKLibraryBookshelfController setupBookshelfWithConfig:v9];
  v33 = [v7 localizedTitle];
  [v8 setTitle:v33];

LABEL_8:
  objc_opt_class();
  v10 = [(UIViewController *)self im_ancestorFlowControllerConformingToProtocol:&OBJC_PROTOCOL___BKPrimaryScenePresenting];
  v11 = BUDynamicCast();

  v35 = v11;
  v12 = [v11 rootBarCoordinator];
  v13 = [v12 selectedNavigationController];

  v14 = [v13 viewControllers];
  if ((unint64_t)[v14 count] < 2)
  {
    v16 = 0;
  }
  else
  {
    objc_opt_class();
    v15 = [v14 lastObject];
    v16 = BUDynamicCast();
  }
  objc_opt_class();
  v17 = BUDynamicCast();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v14;
  v19 = (char *)[v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v19)
  {
    v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_opt_class();
        v23 = BUDynamicCast();
        [v23 dismissReadingListPopover];
      }
      v20 = (char *)[v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v20);
  }

  v24 = [v16 collectionID];
  v25 = [v17 collectionID];
  unsigned __int8 v26 = [v24 isEqualToString:v25];

  if ((v26 & 1) == 0)
  {
    if (v34 && v16)
    {
      id v27 = [v18 mutableCopy];
      [v27 removeLastObject];
      [v27 addObject:v8];
      id v28 = [v27 copy];
      [v13 setViewControllers:v28 animated:1];
    }
    else
    {
      [v13 pushViewController:v8 animated:1];
    }
  }
}

- (id)_bk_sceneController
{
  v2 = objc_getAssociatedObject(self, &off_100A4A0E0);
  v3 = [v2 sceneController];

  return v3;
}

- (BKRootBarCoordinating)bk_rootBarCoordinator
{
  v2 = self;
  v3 = [(UIViewController *)v2 splitViewController];
  if (!v3) {
    v3 = [(UIViewController *)v2 tabBarController];
  }
  id v4 = [(UISplitViewController *)v3 bk_rootBarCoordinator];

  return (BKRootBarCoordinating *)v4;
}

- (void)doneButtonPressed
{
}

@end