@interface ICViewAttachmentsActivity
- (ICNAEventReporter)eventReporter;
- (ICViewAttachmentsActivity)initWithPresentingViewController:(id)a3 eventReporter:(id)a4;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityUserInitiated:(BOOL)a3 completion:(id)a4;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICViewAttachmentsActivity

- (ICViewAttachmentsActivity)initWithPresentingViewController:(id)a3 eventReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICViewAttachmentsActivity;
  v8 = [(ICViewAttachmentsActivity *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    objc_storeStrong((id *)&v9->_eventReporter, a4);
  }

  return v9;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"View Attachments" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"paperclip"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.viewAttachments";
}

- (void)performActivityWithCompletion:(id)a3
{
}

- (void)performActivityUserInitiated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (+[UIDevice ic_isVision]) {
    id v7 = [[ICBrowseAttachmentsCollectionController alloc] initWithAttachmentSection:1];
  }
  else {
    id v7 = objc_alloc_init(ICBrowseAttachmentsCollectionController);
  }
  v8 = v7;
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [v9 setModalPresentationStyle:+[UIDevice ic_isVision](UIDevice, "ic_isVision") ^ 1];
  v10 = [(ICViewAttachmentsActivity *)self presentingViewController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EC7F4;
  v12[3] = &unk_100629B00;
  v12[4] = self;
  id v13 = v6;
  BOOL v14 = v4;
  id v11 = v6;
  [v10 presentViewController:v9 animated:v4 completion:v12];
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
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

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end