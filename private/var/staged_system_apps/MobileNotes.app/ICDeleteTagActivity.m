@interface ICDeleteTagActivity
- (ICDeleteTagActivity)initWithPresentingViewController:(id)a3 tagSelection:(id)a4 eventReporter:(id)a5;
- (ICNAEventReporter)eventReporter;
- (ICTagSelection)tagSelection;
- (UIViewController)presentingViewController;
- (id)actionWithCompletion:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTagSelection:(id)a3;
@end

@implementation ICDeleteTagActivity

- (ICDeleteTagActivity)initWithPresentingViewController:(id)a3 tagSelection:(id)a4 eventReporter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICDeleteTagActivity;
  v11 = [(ICDeleteTagActivity *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_presentingViewController, v8);
    objc_storeStrong((id *)&v12->_tagSelection, a4);
    objc_storeStrong((id *)&v12->_eventReporter, a5);
  }

  return v12;
}

- (id)activityTitle
{
  v2 = [(ICDeleteTagActivity *)self tagSelection];
  v3 = [v2 objectIDs];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = +[NSBundle mainBundle];
    if (v4 == (id)1)
    {
      id v4 = [v5 localizedStringForKey:@"Delete Tag" value:&stru_10063F3D8 table:0];
    }
    else
    {
      v6 = [v5 localizedStringForKey:@"DELETE_%lu_TAGS" value:&stru_10063F3D8 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.deleteTag";
}

- (id)actionWithCompletion:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDeleteTagActivity;
  v3 = [(ICDeleteTagActivity *)&v5 actionWithCompletion:a3];
  [v3 setIc_destructive:1];

  return v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICDeleteTagActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [(ICDeleteTagActivity *)self tagSelection];
    v7 = [v6 objectIDs];
    id v8 = [v7 allObjects];

    v23 = v8;
    v24 = [v8 ic_compactMap:&stru_1006272F0];
    id v9 = [_TtC11MobileNotes26TagDeletionAlertController alloc];
    id v10 = [(ICDeleteTagActivity *)self activityViewController];
    v11 = [v10 view];
    v12 = [v11 ic_viewControllerManager];
    v13 = [(ICDeleteTagActivity *)self presentingViewController];
    objc_super v14 = [v13 view];
    v15 = [v14 window];
    v16 = [(ICDeleteTagActivity *)self eventReporter];
    v17 = [(TagDeletionAlertController *)v9 initWithViewControllerManager:v12 window:v15 eventReporter:v16 deletionMethod:2];

    v18 = [(TagDeletionAlertController *)v17 makeDeleteTagAlertControllerWithTags:v24 sendNotification:1];
    if (v18)
    {
      v19 = [(ICDeleteTagActivity *)self presentingViewController];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100080254;
      v25[3] = &unk_100625B40;
      v25[4] = self;
      id v26 = v4;
      [v19 presentViewController:v18 animated:1 completion:v25];

      v20 = v23;
    }
    else
    {
      [(ICDeleteTagActivity *)self activityDidFinish:0];
      v20 = v23;
      if (v4)
      {
        v22 = [(ICDeleteTagActivity *)self activityType];
        (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v22);
      }
    }
  }
  else
  {
    [(ICDeleteTagActivity *)self activityDidFinish:0];
    if (v4)
    {
      v21 = [(ICDeleteTagActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v21);
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

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (void)setTagSelection:(id)a3
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
  objc_storeStrong((id *)&self->_tagSelection, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end