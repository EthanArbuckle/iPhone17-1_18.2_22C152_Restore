@interface ICImportArchiveActivity
- (ICImportArchiveActivity)initWithNoteContainer:(id)a3 presentingViewController:(id)a4;
- (ICImportArchiveController)importArchiveController;
- (ICNoteContainer)noteContainer;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setImportArchiveController:(id)a3;
@end

@implementation ICImportArchiveActivity

- (ICImportArchiveActivity)initWithNoteContainer:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICImportArchiveActivity;
  v9 = [(ICImportArchiveActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_noteContainer, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Import Archive…" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"square.and.arrow.down.on.square"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.importArchive";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICImportArchiveActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [ICImportArchiveController alloc];
    id v7 = [(ICImportArchiveActivity *)self presentingViewController];
    id v8 = [(ICImportArchiveController *)v6 initForPresentingInViewController:v7];
    [(ICImportArchiveActivity *)self setImportArchiveController:v8];

    v9 = [(ICImportArchiveActivity *)self importArchiveController];
    v10 = [(ICImportArchiveActivity *)self noteContainer];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100037854;
    v12[3] = &unk_100625230;
    v12[4] = self;
    id v13 = v4;
    [v9 importIntoNoteContainer:v10 completion:v12];
  }
  else
  {
    [(ICImportArchiveActivity *)self activityDidFinish:0];
    if (v4)
    {
      v11 = [(ICImportArchiveActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
    }
  }
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (ICImportArchiveController)importArchiveController
{
  return self->_importArchiveController;
}

- (void)setImportArchiveController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importArchiveController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_noteContainer, 0);
}

@end