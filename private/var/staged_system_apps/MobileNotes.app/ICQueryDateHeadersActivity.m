@interface ICQueryDateHeadersActivity
- (ICNAEventReporter)eventReporter;
- (ICQueryDateHeadersActivity)initWithPresentingViewController:(id)a3 noteContainerViewMode:(int64_t)a4 eventReporter:(id)a5;
- (UIViewController)presentingViewController;
- (id)actionForDateHeadersType:(int)a3 completion:(id)a4;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)menu;
- (id)menuWithCompletion:(id)a3;
- (int64_t)noteContainerViewMode;
- (void)activityDidFinish:(BOOL)a3;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICQueryDateHeadersActivity

- (ICQueryDateHeadersActivity)initWithPresentingViewController:(id)a3 noteContainerViewMode:(int64_t)a4 eventReporter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICQueryDateHeadersActivity;
  v10 = [(ICQueryDateHeadersActivity *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
    v11->_noteContainerViewMode = a4;
    objc_storeStrong((id *)&v11->_eventReporter, a5);
  }

  return v11;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"calendar"];
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Group By Date" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.dateheaders";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICQueryDateHeadersActivity *)self presentingViewController];
  v6 = [v5 presentedViewController];

  if (v6)
  {
    v7 = [(ICQueryDateHeadersActivity *)self presentingViewController];
    id v8 = [v7 presentedViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C0F8C;
    v10[3] = &unk_100625B40;
    v10[4] = self;
    id v11 = v4;
    [v8 dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    [(ICQueryDateHeadersActivity *)self activityDidFinish:0];
    if (v4)
    {
      id v9 = [(ICQueryDateHeadersActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
}

- (void)activityDidFinish:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQueryDateHeadersActivity;
  [(ICQueryDateHeadersActivity *)&v7 activityDidFinish:a3];
  id v4 = [(ICQueryDateHeadersActivity *)self eventReporter];
  uint64_t v5 = sub_10008A418([(ICQueryDateHeadersActivity *)self noteContainerViewMode]);
  v6 = [(ICQueryDateHeadersActivity *)self activityType];
  [v4 submitNoteActionMenuEventForNoteBrowserWithUsageType:3 layout:v5 activityType:v6 isTimelineView:[ICDateHeadersUtilities showsQueryDateHeaders]];
}

- (id)menu
{
  return [(ICQueryDateHeadersActivity *)self menuWithCompletion:0];
}

- (id)menuWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICQueryDateHeadersActivity *)self activityTitle];
  v6 = [(ICQueryDateHeadersActivity *)self activityImage];
  objc_super v7 = [(ICQueryDateHeadersActivity *)self actionForDateHeadersType:0 completion:v4];
  id v8 = -[ICQueryDateHeadersActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 2, v4, v7);
  v14[1] = v8;
  id v9 = [(ICQueryDateHeadersActivity *)self actionForDateHeadersType:1 completion:v4];

  v14[2] = v9;
  v10 = +[NSArray arrayWithObjects:v14 count:3];
  id v11 = +[UIMenu menuWithTitle:v5 image:v6 identifier:0 options:0 children:v10];

  v12 = +[ICDateHeadersUtilities actionItemTitleWithDateHeadersType:](ICDateHeadersUtilities, "actionItemTitleWithDateHeadersType:", +[ICDateHeadersUtilities queryDateHeadersType]);
  [v11 setSubtitle:v12];

  return v11;
}

- (id)actionForDateHeadersType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_super v7 = +[ICDateHeadersUtilities actionItemTitleWithDateHeadersType:v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C1364;
  v11[3] = &unk_100628CA0;
  int v13 = v4;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = +[UIAction ic_actionWithTitle:v7 handler:v11];
  [v9 setState:[+[ICDateHeadersUtilities queryDateHeadersType](ICDateHeadersUtilities, "queryDateHeadersType") == v4]];

  return v9;
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
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

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end