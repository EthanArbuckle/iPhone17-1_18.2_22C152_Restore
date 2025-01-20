@interface ICHandwritingFeedbackNoteActivity
- (ICHandwritingFeedbackNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4;
- (ICNote)note;
- (PKHandwritingFeedbackActivity)pencilKitActivity;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setNote:(id)a3;
- (void)setPencilKitActivity:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICHandwritingFeedbackNoteActivity

- (ICHandwritingFeedbackNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICHandwritingFeedbackNoteActivity;
  v9 = [(ICHandwritingFeedbackNoteActivity *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    v11 = (PKHandwritingFeedbackActivity *)[objc_alloc((Class)PKHandwritingFeedbackActivity) initWithBlock:0];
    pencilKitActivity = v10->_pencilKitActivity;
    v10->_pencilKitActivity = v11;

    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = [(ICHandwritingFeedbackNoteActivity *)self pencilKitActivity];
  v3 = [v2 activityTitle];

  return v3;
}

- (id)activityType
{
  v2 = [(ICHandwritingFeedbackNoteActivity *)self pencilKitActivity];
  v3 = [v2 activityType];

  return v3;
}

- (id)activityImage
{
  v2 = [(ICHandwritingFeedbackNoteActivity *)self pencilKitActivity];
  v3 = [v2 activityImage];

  return v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICHandwritingFeedbackNoteActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [(ICHandwritingFeedbackNoteActivity *)self presentingViewController];
    id v7 = [v6 view];
    id v8 = [v7 subviews];
    v9 = [v8 ic_objectsOfClass:objc_opt_class()];
    v10 = [v9 firstObject];

    v11 = [v10 ic_pkTiledView];
    v12 = [(ICHandwritingFeedbackNoteActivity *)self presentingViewController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BF514;
    v15[3] = &unk_100625888;
    v15[4] = self;
    id v16 = v11;
    id v17 = v4;
    id v13 = v11;
    [v12 ic_dismissPresentedViewControllerAnimated:1 completion:v15];
  }
  else
  {
    [(ICHandwritingFeedbackNoteActivity *)self activityDidFinish:0];
    if (v4)
    {
      objc_super v14 = [(ICHandwritingFeedbackNoteActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v14);
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

- (PKHandwritingFeedbackActivity)pencilKitActivity
{
  return self->_pencilKitActivity;
}

- (void)setPencilKitActivity:(id)a3
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
  objc_storeStrong((id *)&self->_pencilKitActivity, 0);

  objc_storeStrong((id *)&self->_note, 0);
}

@end