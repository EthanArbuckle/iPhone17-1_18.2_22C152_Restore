@interface ICCollaborationNoteActivity
- (ICCollaborationNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 eventReporter:(id)a7;
- (ICCollaborationUIController)collaborationUIController;
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICNoteContext)noteContext;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setNote:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICCollaborationNoteActivity

- (ICCollaborationNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 eventReporter:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICCollaborationNoteActivity;
  v17 = [(ICCollaborationNoteActivity *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_note, a3);
    objc_storeStrong((id *)&v18->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v18->_presentingSourceView, a6);
    objc_storeStrong((id *)&v18->_presentingViewController, a4);
    objc_storeStrong((id *)&v18->_eventReporter, a7);
  }

  return v18;
}

- (id)activityTitle
{
  v2 = [(ICCollaborationNoteActivity *)self note];
  v3 = [v2 shareViaICloudManageActionTitle];

  return v3;
}

- (id)activityImage
{
  v2 = [(ICCollaborationNoteActivity *)self note];
  v3 = [v2 shareViaICloudSystemImageName];

  v4 = +[UIImage systemImageNamed:v3];

  return v4;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.collaborationNote";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICCollaborationNoteActivity *)self note];
  if ([v5 canBeSharedViaICloud])
  {
    v6 = [(ICCollaborationNoteActivity *)self note];
    unsigned int v7 = [v6 isEmpty];

    if (!v7)
    {
      if ([(ICCollaborationNoteActivity *)self contextPathEnum])
      {
        v8 = [(ICCollaborationNoteActivity *)self eventReporter];
        [v8 pushContextPathDataWithContextPathEnum:[self contextPathEnum]];
      }
      v9 = [(ICCollaborationNoteActivity *)self presentingViewController];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000ED070;
      v12[3] = &unk_100625B40;
      v12[4] = self;
      id v13 = v4;
      [v9 ic_dismissPresentedViewControllerAnimated:1 completion:v12];

      goto LABEL_11;
    }
  }
  else
  {
  }
  v10 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1004DB868(v10);
  }

  [(ICCollaborationNoteActivity *)self activityDidFinish:0];
  if (v4)
  {
    v11 = [(ICCollaborationNoteActivity *)self activityType];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
LABEL_11:
}

- (ICCollaborationUIController)collaborationUIController
{
  return +[ICCollaborationUIController sharedInstance];
}

- (ICNoteContext)noteContext
{
  return (ICNoteContext *)+[ICNoteContext sharedContext];
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (UIView)presentingSourceView
{
  return self->_presentingSourceView;
}

- (void)setPresentingSourceView:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
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
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);

  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
}

@end