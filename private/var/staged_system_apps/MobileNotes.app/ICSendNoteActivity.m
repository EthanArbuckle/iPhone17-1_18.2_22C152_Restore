@interface ICSendNoteActivity
- (CGRect)presentingSourceRect;
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICSendNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5;
- (ICSendNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 presentingSourceRect:(CGRect)a7 eventReporter:(id)a8;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)performActivityWithExcludedTypes:(id)a3 completion:(id)a4;
- (void)setEventReporter:(id)a3;
- (void)setNote:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingSourceRect:(CGRect)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICSendNoteActivity

- (ICSendNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 presentingSourceRect:(CGRect)a7 eventReporter:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v25 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  v26.receiver = self;
  v26.super_class = (Class)ICSendNoteActivity;
  v22 = [(ICSendNoteActivity *)&v26 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_note, a3);
    objc_storeStrong((id *)&v23->_presentingViewController, a4);
    objc_storeStrong((id *)&v23->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v23->_presentingSourceView, a6);
    v23->_presentingSourceRect.origin.CGFloat x = x;
    v23->_presentingSourceRect.origin.CGFloat y = y;
    v23->_presentingSourceRect.size.CGFloat width = width;
    v23->_presentingSourceRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v23->_eventReporter, a8);
  }

  return v23;
}

- (ICSendNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5
{
  return -[ICSendNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](self, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", a3, a4, 0, 0, a5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Share" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.sendNote";
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"square.and.arrow.up"];
}

- (void)performActivityWithCompletion:(id)a3
{
}

- (void)performActivityWithExcludedTypes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v23 = +[ICCollaborationUIController sharedInstance];
  id v25 = [(ICSendNoteActivity *)self presentingViewController];
  v24 = [v25 view];
  v8 = [v24 window];
  v9 = [(ICSendNoteActivity *)self presentingViewController];
  v10 = [(ICSendNoteActivity *)self presentationSourceItem];
  v11 = [(ICSendNoteActivity *)self presentingSourceView];
  [(ICSendNoteActivity *)self presentingSourceRect];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(ICSendNoteActivity *)self note];
  id v21 = [(ICSendNoteActivity *)self eventReporter];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10006466C;
  v26[3] = &unk_100625B40;
  v26[4] = self;
  id v27 = v6;
  id v22 = v6;
  [v23 presentSendNoteActivityViewControllerWithPresentingWindow:v8 presentingViewController:v9 sourceItem:v10 sourceView:v11 sourceRect:v20 note:v7 excludedTypes:v13 eventReporter:v15 didPresentActivityHandler:v17];
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

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
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

- (CGRect)presentingSourceRect
{
  double x = self->_presentingSourceRect.origin.x;
  double y = self->_presentingSourceRect.origin.y;
  double width = self->_presentingSourceRect.size.width;
  double height = self->_presentingSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentingSourceRect:(CGRect)a3
{
  self->_presentingSourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);

  objc_storeStrong((id *)&self->_note, 0);
}

@end