@interface ICMoveNoteActivity
- (ICMoveNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4;
- (ICNote)note;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setNote:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICMoveNoteActivity

- (ICMoveNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICMoveNoteActivity;
  v9 = [(ICMoveNoteActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Move Note" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.moveNote";
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"folder"];
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICMoveNoteActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [(ICMoveNoteActivity *)self presentingViewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10013810C;
    v8[3] = &unk_100625B40;
    v8[4] = self;
    id v9 = v4;
    [v6 ic_dismissPresentedViewControllerAnimated:1 completion:v8];
  }
  else
  {
    [(ICMoveNoteActivity *)self activityDidFinish:0];
    if (v4)
    {
      id v7 = [(ICMoveNoteActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
    }
  }
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
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

  objc_storeStrong((id *)&self->_note, 0);
}

@end