@interface ICSortFolderActivity
- (ICFolder)folder;
- (ICNAEventReporter)eventReporter;
- (ICSortFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 eventReporter:(id)a6 noteContainerViewMode:(int64_t)a7;
- (ICSortFolderActivity)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 eventReporter:(id)a6 noteContainerViewMode:(int64_t)a7;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)menuWithCompletion:(id)a3;
- (int64_t)noteContainerViewMode;
- (void)activityDidFinish:(BOOL)a3;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFolder:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICSortFolderActivity

- (ICSortFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 eventReporter:(id)a6 noteContainerViewMode:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICSortFolderActivity;
  v17 = [(ICSortFolderActivity *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_folder, a3);
    objc_storeWeak((id *)&v18->_presentingViewController, v14);
    objc_storeStrong((id *)&v18->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v18->_eventReporter, a6);
    v18->_noteContainerViewMode = a7;
  }

  return v18;
}

- (ICSortFolderActivity)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 eventReporter:(id)a6 noteContainerViewMode:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICSortFolderActivity;
  v17 = [(ICSortFolderActivity *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_virtualSmartFolder, a3);
    objc_storeWeak((id *)&v18->_presentingViewController, v14);
    objc_storeStrong((id *)&v18->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v18->_eventReporter, a6);
    v18->_noteContainerViewMode = a7;
  }

  return v18;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Sort By" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"arrow.up.arrow.down"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.sortFolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICSortFolderActivity *)self presentingViewController];
  v6 = [v5 presentedViewController];

  if (v6)
  {
    v7 = [(ICSortFolderActivity *)self presentingViewController];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_100092608;
    v12 = &unk_100627178;
    id v13 = self;
    id v14 = v4;
    [v7 dismissViewControllerAnimated:1 completion:&v9];
  }
  else if (v4)
  {
    v8 = [(ICSortFolderActivity *)self activityType];
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v8);
  }
  -[ICSortFolderActivity activityDidFinish:](self, "activityDidFinish:", 1, v9, v10, v11, v12);
}

- (void)activityDidFinish:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICSortFolderActivity;
  [(ICSortFolderActivity *)&v8 activityDidFinish:a3];
  id v4 = [(ICSortFolderActivity *)self eventReporter];
  uint64_t v5 = sub_10008A418([(ICSortFolderActivity *)self noteContainerViewMode]);
  v6 = [(ICSortFolderActivity *)self activityType];
  v7 = [(ICSortFolderActivity *)self folder];
  [v4 submitNoteActionMenuEventForNoteBrowserWithUsageType:3 layout:v5 activityType:v6 isTimelineView:[v7 isShowingDateHeaders]];
}

- (id)menuWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICSortFolderActivity *)self folder];
  if (v5)
  {
    v6 = [(ICSortFolderActivity *)self folder];
    [v6 customNoteSortType];
  }
  else
  {
    v6 = [(ICSortFolderActivity *)self virtualSmartFolder];
    [v6 noteSortType];
  v7 = };

  objc_super v8 = [ICSortMenu alloc];
  v9 = [(ICSortFolderActivity *)self activityTitle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000928A0;
  v15[3] = &unk_100626D30;
  id v16 = v7;
  v17 = self;
  id v18 = v4;
  id v10 = v4;
  id v11 = v7;
  v12 = [(ICSortMenu *)v8 initWithTitle:v9 sortType:v11 selectedSortTypeHandler:v15];

  id v13 = [(ICSortMenu *)v12 createMenu];

  return v13;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
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
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);

  objc_storeStrong((id *)&self->_folder, 0);
}

@end