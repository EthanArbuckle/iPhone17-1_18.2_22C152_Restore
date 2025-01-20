@interface ICRenameTagActivity
- (ICNAEventReporter)eventReporter;
- (ICRenameTagActivity)initWithPresentingViewController:(id)a3 viewControllerManager:(id)a4 tagObjectID:(id)a5 eventReporter:(id)a6;
- (ICViewControllerManager)viewControllerManager;
- (NSManagedObjectID)tagObjectID;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTagObjectID:(id)a3;
- (void)setViewControllerManager:(id)a3;
@end

@implementation ICRenameTagActivity

- (ICRenameTagActivity)initWithPresentingViewController:(id)a3 viewControllerManager:(id)a4 tagObjectID:(id)a5 eventReporter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ICRenameTagActivity;
  v14 = [(ICRenameTagActivity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_presentingViewController, v10);
    objc_storeStrong((id *)&v15->_viewControllerManager, a4);
    objc_storeStrong((id *)&v15->_tagObjectID, a5);
    objc_storeStrong((id *)&v15->_eventReporter, a6);
  }

  return v15;
}

- (id)activityTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"RENAME_TAG_MENU" value:@"Rename Tag" table:@"Localizable"];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"pencil"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.renameTag";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICRenameTagActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [_TtC11MobileNotes32TagCreateOrRenameAlertController alloc];
    v7 = [(ICRenameTagActivity *)self tagObjectID];
    v8 = [(ICRenameTagActivity *)self presentingViewController];
    v9 = [(ICRenameTagActivity *)self eventReporter];
    id v10 = [(TagCreateOrRenameAlertController *)v6 initWithTagObjectID:v7 presentingViewController:v8 eventReporter:v9 renameMethod:2];

    id v11 = [(TagCreateOrRenameAlertController *)v10 makeAlertController];
    if (v11)
    {
      id v12 = [(ICRenameTagActivity *)self presentingViewController];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10010D280;
      v15[3] = &unk_100625888;
      v16 = v10;
      objc_super v17 = self;
      id v18 = v4;
      [v12 presentViewController:v11 animated:1 completion:v15];
    }
    else
    {
      [(ICRenameTagActivity *)self activityDidFinish:0];
      if (v4)
      {
        v14 = [(ICRenameTagActivity *)self activityType];
        (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v14);
      }
    }
  }
  else
  {
    [(ICRenameTagActivity *)self activityDidFinish:0];
    if (v4)
    {
      id v13 = [(ICRenameTagActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v13);
    }
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (void)setViewControllerManager:(id)a3
{
}

- (NSManagedObjectID)tagObjectID
{
  return self->_tagObjectID;
}

- (void)setTagObjectID:(id)a3
{
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_tagObjectID, 0);
  objc_storeStrong((id *)&self->_viewControllerManager, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end