@interface ICDumpStateActivity
- (ICDumpStateActivity)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICDumpStateActivity

- (ICDumpStateActivity)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDumpStateActivity;
  v5 = [(ICDumpStateActivity *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"arrow.up.doc"];
}

- (id)activityTitle
{
  return @"Send State Dump (Internal)";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.dumpState";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICDumpStateActivity *)self presentingViewController];

  if (v5)
  {
    v6 = +[UIAlertController alertControllerWithTitle:@"About State Dumps" message:@"State dumps contain only metadata useful for debugging issues in Notes. No note content or attachments are included." preferredStyle:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008BE18;
    v12[3] = &unk_100626AC0;
    v12[4] = self;
    v7 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:v12];
    [v6 addAction:v7];

    objc_super v8 = [(ICDumpStateActivity *)self presentingViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008C2B8;
    v10[3] = &unk_100625B40;
    v10[4] = self;
    id v11 = v4;
    [v8 presentViewController:v6 animated:1 completion:v10];
  }
  else
  {
    [(ICDumpStateActivity *)self activityDidFinish:0];
    if (v4)
    {
      v9 = [(ICDumpStateActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
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

- (void).cxx_destruct
{
}

@end