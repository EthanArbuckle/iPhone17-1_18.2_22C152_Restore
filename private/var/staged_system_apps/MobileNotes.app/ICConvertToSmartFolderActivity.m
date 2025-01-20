@interface ICConvertToSmartFolderActivity
- (ICConvertToSmartFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 sender:(id)a6;
- (ICFolder)folder;
- (NSAttributedString)footerAttributedString;
- (UIBarButtonItem)presentingBarButtonItem;
- (UICollectionViewCell)folderCell;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)sender;
- (void)performActivityWithCompletion:(id)a3;
- (void)setFolder:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICConvertToSmartFolderActivity

- (ICConvertToSmartFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 sender:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICConvertToSmartFolderActivity;
  v15 = [(ICConvertToSmartFolderActivity *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_folder, a3);
    objc_storeStrong((id *)&v16->_presentingViewController, a4);
    objc_storeStrong((id *)&v16->_presentingBarButtonItem, a5);
    objc_storeStrong(&v16->_sender, a6);
  }

  return v16;
}

- (NSAttributedString)footerAttributedString
{
  id v2 = objc_alloc((Class)NSMutableAttributedString);
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Use Smart Folders to automatically organize notes by tags. " value:&stru_10063F3D8 table:0];
  NSAttributedStringKey v18 = NSForegroundColorAttributeName;
  v5 = +[UIColor secondaryLabelColor];
  v19 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v7 = [v2 initWithString:v4 attributes:v6];

  id v8 = objc_alloc((Class)NSAttributedString);
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Learn More…" value:&stru_10063F3D8 table:0];
  NSAttributedStringKey v16 = NSLinkAttributeName;
  id v11 = +[ICAppURLUtilities appURLForShowSmartFoldersHelp];
  v17 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v13 = [v8 initWithString:v10 attributes:v12];

  [v7 appendAttributedString:v13];
  id v14 = [v7 copy];

  return (NSAttributedString *)v14;
}

- (id)activityTitle
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"CONVERT_TO_SMART_FOLDER_ACTIVITY" value:@"Convert to Smart Folder" table:@"Localizable"];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"gearshape"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.convertToSmartFolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICConvertToSmartFolderActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [ICConvertToSmartFolderDecisionController alloc];
    id v7 = [(ICConvertToSmartFolderActivity *)self folder];
    id v8 = [(ICConvertToSmartFolderActivity *)self presentingViewController];
    v9 = [(ICConvertToSmartFolderDecisionController *)v6 initWithSourceFolder:v7 presentingViewController:v8];

    v10 = [(ICConvertToSmartFolderActivity *)self presentingViewController];
    id v11 = [v10 ic_viewControllerManager];

    id v12 = [v11 folderListViewController];
    id v13 = [(ICConvertToSmartFolderActivity *)self folderCell];
    [(ICConvertToSmartFolderDecisionController *)v9 setFolderSourceView:v13];

    id v14 = [(ICConvertToSmartFolderActivity *)self presentingBarButtonItem];
    [(ICConvertToSmartFolderDecisionController *)v9 setPresentingBarButtonItem:v14];

    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1000DE028;
    v20 = &unk_100629710;
    id v21 = v12;
    id v22 = v11;
    v23 = self;
    id v24 = v4;
    id v15 = v11;
    id v16 = v12;
    [(ICConvertToSmartFolderDecisionController *)v9 performDecisionWithCompletion:&v17];
  }
  -[ICConvertToSmartFolderActivity activityDidFinish:](self, "activityDidFinish:", 1, v17, v18, v19, v20);
}

- (UICollectionViewCell)folderCell
{
  v3 = [(ICConvertToSmartFolderActivity *)self presentingViewController];
  id v4 = [v3 ic_viewControllerManager];

  if ([v4 isPrimaryContentVisible])
  {
    v5 = [v4 folderListViewController];
    v6 = [v5 dataSource];
    id v7 = [v6 collectionViewDiffableDataSource];

    id v8 = [(ICConvertToSmartFolderActivity *)self folder];
    v9 = [v8 objectID];

    v10 = [v7 indexPathForItemIdentifier:v9];
    id v11 = [v5 collectionView];
    id v12 = [v11 cellForItemAtIndexPath:v10];
  }
  else
  {
    id v12 = 0;
  }

  return (UICollectionViewCell *)v12;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (id)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end