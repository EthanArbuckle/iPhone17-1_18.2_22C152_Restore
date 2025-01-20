@interface ICPrintNoteActivity
- (ICNote)note;
- (ICPrintNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICPrintNoteActivity

- (ICPrintNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPrintNoteActivity;
  v9 = [(ICPrintNoteActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Print" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"printer"];
}

- (id)activityType
{
  return UIActivityTypePrint;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICPrintNoteActivity *)self presentingViewController];
  v6 = [v5 view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  v11 = [(ICPrintNoteActivity *)self presentingViewController];
  objc_super v12 = [v11 traitCollection];
  v13 = [v12 traitCollectionByModifyingTraits:&stru_100626B00];

  id v14 = objc_alloc_init((Class)ICTextController);
  v15 = [(ICPrintNoteActivity *)self note];
  id v16 = +[ICTextViewController createTextViewUsingTextController:v14 stylingTextUsingSeparateTextStorageForRendering:0 note:v15 containerWidth:0 forManualRendering:0 scrollState:v13 traitCollection:v8];

  v17 = [(ICPrintNoteActivity *)self note];
  v18 = +[ICTextViewController printFormatterForNote:withSize:traitCollection:](ICTextViewController, "printFormatterForNote:withSize:traitCollection:", v17, v13, v8, v10);

  v19 = +[UIPrintInfo printInfo];
  v20 = [(ICPrintNoteActivity *)self note];
  v21 = [v20 title];
  [v19 setJobName:v21];

  v22 = +[UIPrintInteractionController sharedPrintController];
  [v22 setPrintFormatter:v18];
  [v22 setPrintInfo:v19];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10006E308;
  v27 = &unk_100626B28;
  v28 = self;
  id v29 = v4;
  id v23 = v4;
  [v22 presentAnimated:1 completionHandler:&v24];
  -[ICPrintNoteActivity activityDidFinish:](self, "activityDidFinish:", 1, v24, v25, v26, v27, v28);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end