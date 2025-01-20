@interface ICDateHeadersNoteContainerActivity
- (ICDateHeadersNoteContainerActivity)initWithContainer:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 noteContainerViewMode:(int64_t)a6;
- (ICDateHeadersNoteContainerActivity)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 noteContainerViewMode:(int64_t)a6;
- (ICNAEventReporter)eventReporter;
- (ICNoteContainer)noteContainer;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
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
- (void)setNoteContainer:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setVirtualSmartFolder:(id)a3;
@end

@implementation ICDateHeadersNoteContainerActivity

- (ICDateHeadersNoteContainerActivity)initWithContainer:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 noteContainerViewMode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICDateHeadersNoteContainerActivity;
  v14 = [(ICDateHeadersNoteContainerActivity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_noteContainer, a3);
    objc_storeWeak((id *)&v15->_presentingViewController, v12);
    objc_storeStrong((id *)&v15->_eventReporter, a5);
    v15->_noteContainerViewMode = a6;
  }

  return v15;
}

- (ICDateHeadersNoteContainerActivity)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 noteContainerViewMode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICDateHeadersNoteContainerActivity;
  v14 = [(ICDateHeadersNoteContainerActivity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_virtualSmartFolder, a3);
    objc_storeWeak((id *)&v15->_presentingViewController, v12);
    objc_storeStrong((id *)&v15->_eventReporter, a5);
    v15->_noteContainerViewMode = a6;
  }

  return v15;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Group By Date" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"calendar"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.dateHeaderNoteContainer";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICDateHeadersNoteContainerActivity *)self presentingViewController];
  v6 = [v5 presentedViewController];

  if (v6)
  {
    v7 = [(ICDateHeadersNoteContainerActivity *)self presentingViewController];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_10010C590;
    id v12 = &unk_100627178;
    id v13 = self;
    id v14 = v4;
    [v7 dismissViewControllerAnimated:1 completion:&v9];
  }
  else if (v4)
  {
    v8 = [(ICDateHeadersNoteContainerActivity *)self activityType];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
  -[ICDateHeadersNoteContainerActivity activityDidFinish:](self, "activityDidFinish:", 1, v9, v10, v11, v12);
}

- (void)activityDidFinish:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICDateHeadersNoteContainerActivity;
  [(ICDateHeadersNoteContainerActivity *)&v8 activityDidFinish:a3];
  id v4 = [(ICDateHeadersNoteContainerActivity *)self eventReporter];
  uint64_t v5 = sub_10008A418([(ICDateHeadersNoteContainerActivity *)self noteContainerViewMode]);
  v6 = [(ICDateHeadersNoteContainerActivity *)self activityType];
  v7 = [(ICDateHeadersNoteContainerActivity *)self noteContainer];
  [v4 submitNoteActionMenuEventForNoteBrowserWithUsageType:3 layout:v5 activityType:v6 isTimelineView:[v7 isShowingDateHeaders]];
}

- (id)menu
{
  return [(ICDateHeadersNoteContainerActivity *)self menuWithCompletion:0];
}

- (id)menuWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICDateHeadersNoteContainerActivity *)self activityTitle];
  v6 = [(ICDateHeadersNoteContainerActivity *)self activityImage];
  v7 = [(ICDateHeadersNoteContainerActivity *)self actionForDateHeadersType:0 completion:v4];
  objc_super v8 = -[ICDateHeadersNoteContainerActivity actionForDateHeadersType:completion:](self, "actionForDateHeadersType:completion:", 2, v4, v7);
  v18[1] = v8;
  v9 = [(ICDateHeadersNoteContainerActivity *)self actionForDateHeadersType:1 completion:v4];

  v18[2] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v18 count:3];
  id v11 = +[UIMenu menuWithTitle:v5 image:v6 identifier:0 options:0 children:v10];

  id v12 = [(ICDateHeadersNoteContainerActivity *)self noteContainer];

  if (v12)
  {
    id v13 = [(ICDateHeadersNoteContainerActivity *)self noteContainer];
  }
  else
  {
    id v14 = [(ICDateHeadersNoteContainerActivity *)self virtualSmartFolder];

    if (!v14) {
      goto LABEL_6;
    }
    id v13 = [(ICDateHeadersNoteContainerActivity *)self virtualSmartFolder];
  }
  v15 = v13;
  v16 = +[ICDateHeadersUtilities actionItemTitleWithDateHeadersType:](ICDateHeadersUtilities, "actionItemTitleWithDateHeadersType:", [v13 dateHeadersType]);
  [v11 setSubtitle:v16];

LABEL_6:

  return v11;
}

- (id)actionForDateHeadersType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = +[ICDateHeadersUtilities stringForDateHeadersType:v4];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010CA0C;
  v15[3] = &unk_100628CA0;
  int v17 = v4;
  v15[4] = self;
  id v16 = v6;
  id v8 = v6;
  v9 = +[UIAction ic_actionWithTitle:v7 handler:v15];

  uint64_t v10 = [(ICDateHeadersNoteContainerActivity *)self noteContainer];

  if (v10)
  {
    id v11 = [(ICDateHeadersNoteContainerActivity *)self noteContainer];
  }
  else
  {
    id v12 = [(ICDateHeadersNoteContainerActivity *)self virtualSmartFolder];

    if (!v12) {
      goto LABEL_6;
    }
    id v11 = [(ICDateHeadersNoteContainerActivity *)self virtualSmartFolder];
  }
  id v13 = v11;
  objc_msgSend(v9, "setState:", objc_msgSend(v11, "dateHeadersType") == v4);

LABEL_6:

  return v9;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (void)setVirtualSmartFolder:(id)a3
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
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);

  objc_storeStrong((id *)&self->_noteContainer, 0);
}

@end