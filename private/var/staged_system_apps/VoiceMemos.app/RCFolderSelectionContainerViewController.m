@interface RCFolderSelectionContainerViewController
- (RCFolderSelectionCollectionViewController)collectionViewController;
- (RCFolderSelectionContainerViewController)initWithCollectionViewController:(id)a3;
@end

@implementation RCFolderSelectionContainerViewController

- (RCFolderSelectionContainerViewController)initWithCollectionViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCFolderSelectionContainerViewController;
  v6 = [(RCFolderSelectionContainerViewController *)&v9 initWithRootViewController:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionViewController, a3);
  }

  return v7;
}

- (RCFolderSelectionCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void).cxx_destruct
{
}

@end