@interface ICNoteContainerViewModeActivity
- (ICNoteContainerViewModeActivity)initWithPresentingViewController:(id)a3 viewControllerManager:(id)a4;
- (ICViewControllerManager)viewControllerManager;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (int64_t)targetNoteViewMode;
- (void)performActivityWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTargetNoteViewMode:(int64_t)a3;
- (void)setViewControllerManager:(id)a3;
@end

@implementation ICNoteContainerViewModeActivity

- (ICNoteContainerViewModeActivity)initWithPresentingViewController:(id)a3 viewControllerManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteContainerViewModeActivity;
  v8 = [(ICNoteContainerViewModeActivity *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    objc_storeStrong((id *)&v9->_viewControllerManager, a4);
    v9->_targetNoteViewMode = [v7 noteContainerViewMode] != (id)1;
  }

  return v9;
}

- (id)activityImage
{
  int64_t v2 = [(ICNoteContainerViewModeActivity *)self targetNoteViewMode];
  switch(v2)
  {
    case -1:
      v4 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_1004D514C(v4);
      }

      goto LABEL_8;
    case 0:
LABEL_8:
      CFStringRef v3 = @"list.bullet";
      goto LABEL_9;
    case 1:
      CFStringRef v3 = @"square.grid.2x2";
LABEL_9:
      v5 = +[UIImage systemImageNamed:v3];
      goto LABEL_11;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (id)activityTitle
{
  int64_t v2 = [(ICNoteContainerViewModeActivity *)self targetNoteViewMode];
  if (v2 == -1)
  {
    v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1004D514C(v4);
    }
  }
  else
  {
    if (v2 == 1)
    {
      v5 = +[NSBundle mainBundle];
      id v6 = v5;
      CFStringRef v7 = @"View as Gallery";
      goto LABEL_10;
    }
    if (v2)
    {
      CFStringRef v3 = 0;
      goto LABEL_11;
    }
  }
  v5 = +[NSBundle mainBundle];
  id v6 = v5;
  CFStringRef v7 = @"View as List";
LABEL_10:
  CFStringRef v3 = [v5 localizedStringForKey:v7 value:&stru_10063F3D8 table:0];

LABEL_11:

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.noteContainerViewMode";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteContainerViewModeActivity *)self presentingViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006BBC0;
  v7[3] = &unk_100625B40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

- (int64_t)targetNoteViewMode
{
  return self->_targetNoteViewMode;
}

- (void)setTargetNoteViewMode:(int64_t)a3
{
  self->_targetNoteViewMode = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerManager, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end