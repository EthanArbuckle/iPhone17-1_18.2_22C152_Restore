@interface ICDeleteFolderActivity
- (ICDeleteFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 sender:(id)a5;
- (ICFolder)folder;
- (UIViewController)presentingViewController;
- (id)actionWithCompletion:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)sender;
- (void)performActivityWithCompletion:(id)a3;
- (void)setFolder:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICDeleteFolderActivity

- (ICDeleteFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 sender:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICDeleteFolderActivity;
  v12 = [(ICDeleteFolderActivity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_folder, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong(&v13->_sender, a5);
  }

  return v13;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Delete" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.deleteFolder";
}

- (id)actionWithCompletion:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDeleteFolderActivity;
  v3 = [(ICDeleteFolderActivity *)&v5 actionWithCompletion:a3];
  [v3 setIc_destructive:1];

  return v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICDeleteFolderActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [ICDeleteDecisionController alloc];
    v7 = [(ICDeleteFolderActivity *)self folder];
    v20 = v7;
    v8 = +[NSArray arrayWithObjects:&v20 count:1];
    id v9 = [(ICDeleteFolderActivity *)self presentingViewController];
    id v10 = [v9 view];
    id v11 = [v10 window];
    v12 = [(ICDeleteFolderActivity *)self sender];
    v13 = [(ICDeleteDecisionController *)v6 initWithSourceObjects:v8 window:v11 sender:v12 eventReporter:0];

    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_1000D491C;
    v17 = &unk_100629310;
    v18 = self;
    id v19 = v4;
    [(ICDeleteDecisionController *)v13 performDecisionWithCompletion:&v14];
  }
  -[ICDeleteFolderActivity activityDidFinish:](self, "activityDidFinish:", 1, v14, v15, v16, v17);
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

- (id)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end