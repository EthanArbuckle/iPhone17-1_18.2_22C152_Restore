@interface ICAddFolderActivity
- (ICAddFolderActivity)initWithPresentingViewController:(id)a3 presentingBarButtonItem:(id)a4 parentFolder:(id)a5 eventReporter:(id)a6;
- (ICFolder)parentFolder;
- (ICFolderCreationController)folderCreationController;
- (ICNAEventReporter)eventReporter;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFolderCreationController:(id)a3;
- (void)setParentFolder:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICAddFolderActivity

- (ICAddFolderActivity)initWithPresentingViewController:(id)a3 presentingBarButtonItem:(id)a4 parentFolder:(id)a5 eventReporter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ICAddFolderActivity;
  v14 = [(ICAddFolderActivity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_presentingViewController, v10);
    objc_storeStrong((id *)&v15->_presentingBarButtonItem, a4);
    objc_storeStrong((id *)&v15->_eventReporter, a6);
    objc_storeStrong((id *)&v15->_parentFolder, a5);
  }

  return v15;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Add Folder" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"folder.badge.plus"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.addFolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICAddFolderActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [ICFolderCreationController alloc];
    v7 = [(ICAddFolderActivity *)self presentingViewController];
    v8 = [(ICAddFolderActivity *)self parentFolder];
    v9 = [(ICFolderCreationController *)v6 initWithViewController:v7 noteContainer:v8 creationApproach:1];
    [(ICAddFolderActivity *)self setFolderCreationController:v9];

    id v10 = [(ICAddFolderActivity *)self folderCreationController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DE640;
    v12[3] = &unk_100629738;
    v12[4] = self;
    id v13 = v4;
    [v10 promptToAddFolderAllowingSmartFolder:1 withCompletionHandler:v12];
  }
  else
  {
    [(ICAddFolderActivity *)self activityDidFinish:0];
    if (v4)
    {
      id v11 = [(ICAddFolderActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    }
  }
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICFolder)parentFolder
{
  return self->_parentFolder;
}

- (void)setParentFolder:(id)a3
{
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_storeStrong((id *)&self->_parentFolder, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end