@interface ICMoveFolderActivity
+ (BOOL)canShowMoveActionForFolder:(id)a3 viewControllerManager:(id)a4;
- (ICFolder)folder;
- (ICMoveFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setFolder:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICMoveFolderActivity

- (ICMoveFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICMoveFolderActivity;
  v9 = [(ICMoveFolderActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

+ (BOOL)canShowMoveActionForFolder:(id)a3 viewControllerManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMovable])
  {
    unsigned int v7 = [v6 hasMultipleModernAccounts];
    unsigned int v8 = [v5 isSmartFolder] ^ 1 | v7;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Move This Folder" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"folder"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.moveFolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICMoveFolderActivity *)self presentingViewController];

  if (v5)
  {
    id v6 = [ICMoveDecisionController alloc];
    unsigned int v7 = [(ICMoveFolderActivity *)self folder];
    v14 = v7;
    unsigned int v8 = +[NSArray arrayWithObjects:&v14 count:1];
    v9 = [(ICMoveFolderActivity *)self presentingViewController];
    v10 = [(ICMoveDecisionController *)v6 initWithSourceObjects:v8 presentingViewController:v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000966D0;
    v12[3] = &unk_100627A30;
    v12[4] = self;
    id v13 = v4;
    [(ICMoveDecisionController *)v10 performDecisionWithCompletion:v12];
  }
  else
  {
    [(ICMoveFolderActivity *)self activityDidFinish:0];
    if (v4)
    {
      v11 = [(ICMoveFolderActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    }
  }
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end