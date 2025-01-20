@interface ICSortQueryActivity
- (ICNAEventReporter)eventReporter;
- (ICSortQueryActivity)initWithPresentingViewController:(id)a3 noteContainerViewMode:(int64_t)a4 eventReporter:(id)a5;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)menuWithCompletion:(id)a3;
- (int64_t)noteContainerViewMode;
- (void)activityDidFinish:(BOOL)a3;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICSortQueryActivity

- (ICSortQueryActivity)initWithPresentingViewController:(id)a3 noteContainerViewMode:(int64_t)a4 eventReporter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICSortQueryActivity;
  v10 = [(ICSortQueryActivity *)&v13 init];
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
  return +[UIImage systemImageNamed:@"arrow.up.arrow.down"];
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Sort By" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.sortquery";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICSortQueryActivity *)self presentingViewController];
  v6 = [v5 presentedViewController];

  if (v6)
  {
    v7 = [(ICSortQueryActivity *)self presentingViewController];
    id v8 = [v7 presentedViewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100076C48;
    v10[3] = &unk_100625B40;
    v10[4] = self;
    id v11 = v4;
    [v8 dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    [(ICSortQueryActivity *)self activityDidFinish:0];
    if (v4)
    {
      id v9 = [(ICSortQueryActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
}

- (void)activityDidFinish:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSortQueryActivity;
  [(ICSortQueryActivity *)&v7 activityDidFinish:a3];
  id v4 = [(ICSortQueryActivity *)self eventReporter];
  uint64_t v5 = sub_10008A418([(ICSortQueryActivity *)self noteContainerViewMode]);
  v6 = [(ICSortQueryActivity *)self activityType];
  [v4 submitNoteActionMenuEventForNoteBrowserWithUsageType:3 layout:v5 activityType:v6 isTimelineView:[ICDateHeadersUtilities showsQueryDateHeaders]];
}

- (id)menuWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICFolderCustomNoteSortType querySortType];
  v6 = [ICSortMenu alloc];
  objc_super v7 = [(ICSortQueryActivity *)self activityTitle];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076EA4;
  v13[3] = &unk_100626D30;
  id v14 = v5;
  v15 = self;
  id v16 = v4;
  id v8 = v4;
  id v9 = v5;
  v10 = [(ICSortMenu *)v6 initWithTitle:v7 sortType:v9 selectedSortTypeHandler:v13];

  id v11 = [(ICSortMenu *)v10 createMenu];

  return v11;
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end