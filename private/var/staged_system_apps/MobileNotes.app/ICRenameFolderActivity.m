@interface ICRenameFolderActivity
- (ICFolder)folder;
- (ICRenameFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4;
- (UIAlertAction)saveAction;
- (UITextField)textField;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setFolder:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSaveAction:(id)a3;
- (void)setTextField:(id)a3;
- (void)textChanged:(id)a3;
@end

@implementation ICRenameFolderActivity

- (ICRenameFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICRenameFolderActivity;
  v9 = [(ICRenameFolderActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Rename" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"pencil"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.renameFolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICRenameFolderActivity *)self presentingViewController];

  if (v5)
  {
    v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Rename Folder" value:&stru_10063F3D8 table:0];
    id v8 = +[UIAlertController alertControllerWithTitle:v7 message:0 preferredStyle:1];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D4F04;
    v24[3] = &unk_1006264A0;
    v24[4] = self;
    [v8 addTextFieldWithConfigurationHandler:v24];
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D5068;
    v22[3] = &unk_1006264F0;
    v22[4] = self;
    id v11 = v4;
    id v23 = v11;
    objc_super v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v22];

    [v8 addAction:v12];
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Save" value:&stru_10063F3D8 table:0];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000D50F0;
    v20[3] = &unk_1006264F0;
    v20[4] = self;
    id v21 = v11;
    v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v20];
    [(ICRenameFolderActivity *)self setSaveAction:v15];

    v16 = [(ICRenameFolderActivity *)self saveAction];
    [v8 addAction:v16];

    v17 = [(ICRenameFolderActivity *)self presentingViewController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000D53F8;
    v19[3] = &unk_100625AF0;
    v19[4] = self;
    [v17 presentViewController:v8 animated:1 completion:v19];
  }
  else
  {
    [(ICRenameFolderActivity *)self activityDidFinish:0];
    if (v4)
    {
      v18 = [(ICRenameFolderActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v18);
    }
  }
}

- (void)textChanged:(id)a3
{
  id v4 = [(ICRenameFolderActivity *)self textField];
  v5 = [v4 text];
  v6 = [v5 ic_trimmedString];
  BOOL v7 = [v6 length] != 0;

  id v8 = [(ICRenameFolderActivity *)self saveAction];
  [v8 setEnabled:v7];
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

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (UIAlertAction)saveAction
{
  return self->_saveAction;
}

- (void)setSaveAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveAction, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end