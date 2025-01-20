@interface ICSelectNotesActivity
- (ICSelectNotesActivity)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICSelectNotesActivity

- (ICSelectNotesActivity)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSelectNotesActivity;
  v5 = [(ICSelectNotesActivity *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Select Notes" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"checkmark.circle"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.selectNotesFolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v8 = a3;
  id v4 = [(ICSelectNotesActivity *)self presentingViewController];

  if (v4)
  {
    v5 = [(ICSelectNotesActivity *)self presentingViewController];
    [v5 setEditing:1 animated:1];

    [(ICSelectNotesActivity *)self activityDidFinish:1];
    v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
  }
  else
  {
    [(ICSelectNotesActivity *)self activityDidFinish:0];
    v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
  }
  v7 = [(ICSelectNotesActivity *)self activityType];
  (*((void (**)(void))v8 + 2))();

  v6 = v8;
LABEL_6:
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