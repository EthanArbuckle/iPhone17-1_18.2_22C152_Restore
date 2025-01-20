@interface ICBrowseAttachmentsBaseCell
+ (void)initialize;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isAccessibilityElement;
- (ICAttachment)attachment;
- (ICBrowseAttachmentsCellDelegate)delegate;
- (ICBrowseAttachmentsCollectionController)collectionController;
- (ICNAEventReporter)eventReporter;
- (NSString)itemNumberAccessibilityString;
- (UICollectionView)collectionView;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)dragItemForAttachment;
- (id)previewActionsForViewControllerManager:(id)a3 fromView:(id)a4;
- (int64_t)countOfItemsInSection;
- (int64_t)indexInSection;
- (void)dealloc;
- (void)eventReporterLostSession:(id)a3;
- (void)openAttachment:(id)a3;
- (void)openAttachmentInspector:(id)a3;
- (void)prepareForReuse;
- (void)setAttachment:(id)a3;
- (void)setCollectionController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragging:(BOOL)a3;
- (void)setEventReporter:(id)a3;
- (void)shareAttachment:(id)a3;
- (void)showInNote:(id)a3;
@end

@implementation ICBrowseAttachmentsBaseCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"attachment" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)accessibilityHint
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Double tap to view attachment" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc((Class)UIAccessibilityCustomAction);
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Show in Note" value:&stru_10063F3D8 table:0];
  id v6 = [v3 initWithName:v5 target:self selector:"showInNote:"];

  id v9 = v6;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

+ (void)initialize
{
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsBaseCell;
  [(ICBrowseAttachmentsBaseCell *)&v4 dealloc];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsBaseCell;
  [(ICBrowseAttachmentsBaseCell *)&v4 prepareForReuse];
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("showInNote:" == a3 || "openAttachment:" == a3) {
    return 1;
  }
  BOOL result = ICDebugModeEnabled();
  if ("openAttachmentInspector:" != a3) {
    return 0;
  }
  return result;
}

- (void)showInNote:(id)a3
{
  id v7 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  objc_super v4 = [(ICBrowseAttachmentsBaseCell *)self ic_viewControllerManager];
  v5 = [v7 objectID];
  [v4 selectAttachmentWithObjectID:v5 animated:1];

  id v6 = [(ICBrowseAttachmentsBaseCell *)self eventReporter];
  [v6 submitAttachmentBrowserActionEventForType:3];
}

- (void)openAttachment:(id)a3
{
  id v5 = [(ICBrowseAttachmentsBaseCell *)self delegate];
  objc_super v4 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  [v5 browseAttachmentsCell:self didSelectAttachment:v4];
}

- (void)shareAttachment:(id)a3
{
  id v5 = [(ICBrowseAttachmentsBaseCell *)self delegate];
  objc_super v4 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  [v5 browseAttachmentsCell:self shouldShareAttachment:v4];
}

- (void)openAttachmentInspector:(id)a3
{
  objc_super v4 = [(ICBrowseAttachmentsBaseCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(ICBrowseAttachmentsBaseCell *)self delegate];
    id v6 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v7 browseAttachmentsCell:self shouldInspectAttachment:v6];
  }
}

- (UICollectionView)collectionView
{
  v2 = [(ICBrowseAttachmentsBaseCell *)self collectionController];
  id v3 = [v2 collectionView];

  return (UICollectionView *)v3;
}

- (int64_t)indexInSection
{
  id v3 = [(ICBrowseAttachmentsBaseCell *)self collectionView];
  objc_super v4 = [v3 indexPathForCell:self];
  id v5 = [v4 item];

  return (int64_t)v5;
}

- (int64_t)countOfItemsInSection
{
  id v3 = [(ICBrowseAttachmentsBaseCell *)self collectionView];
  objc_super v4 = [v3 indexPathForCell:self];

  id v5 = [(ICBrowseAttachmentsBaseCell *)self collectionView];
  id v6 = [v5 dataSource];
  id v7 = [(ICBrowseAttachmentsBaseCell *)self collectionView];
  id v8 = [v6 collectionView:v7 numberOfItemsInSection:[v4 section]];

  return (int64_t)v8;
}

- (NSString)itemNumberAccessibilityString
{
  id v3 = [(ICBrowseAttachmentsBaseCell *)self collectionView];

  if (v3)
  {
    objc_super v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"%ld of %ld" value:&stru_10063F3D8 table:0];

    id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, (char *)[(ICBrowseAttachmentsBaseCell *)self indexInSection] + 1, [(ICBrowseAttachmentsBaseCell *)self countOfItemsInSection]);
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setDragging:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ICBrowseAttachmentsBaseCell *)self isDragging];
  v6.receiver = self;
  v6.super_class = (Class)ICBrowseAttachmentsBaseCell;
  [(ICBrowseAttachmentsBaseCell *)&v6 setDragging:v3];
  if (v5 != v3) {
    [(ICBrowseAttachmentsBaseCell *)self updateAppearanceForDragging:v3];
  }
}

- (id)dragItemForAttachment
{
  BOOL v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  objc_super v4 = [v3 attachmentModel];
  unsigned int v5 = [v4 itemProvider];

  if (v5)
  {
    id v6 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v5];
    id v7 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    unsigned __int8 v8 = [v7 isChildOfDocumentGallery];

    if ((v8 & 1) == 0)
    {
      id v9 = [(ICBrowseAttachmentsBaseCell *)self attachment];
      v10 = [v9 attachmentModel];
      [v6 setLocalObject:v10];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)previewActionsForViewControllerManager:(id)a3 fromView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  unsigned __int8 v8 = +[NSMutableArray array];
  id v9 = objc_alloc((Class)ICAttachmentView);
  v10 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  v11 = [(ICBrowseAttachmentsBaseCell *)self window];
  id v12 = [v9 initWithAttachment:v10 textContainer:0 actionWindow:v11];

  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Copy" value:&stru_10063F3D8 table:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C322C;
  v34[3] = &unk_100628CC8;
  objc_copyWeak(&v36, location);
  id v15 = v12;
  id v35 = v15;
  v16 = +[UIAction ic_actionWithTitle:v14 imageName:@"doc.on.doc" handler:v34];
  v27 = v7;

  [v8 addObject:v16];
  v26 = v6;
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Share" value:&stru_10063F3D8 table:0];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C3280;
  v32[3] = &unk_100627240;
  objc_copyWeak(&v33, location);
  v19 = +[UIAction ic_actionWithTitle:v18 imageName:@"square.and.arrow.up" handler:v32];

  [v8 addObject:v19];
  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"Show in Note" value:&stru_10063F3D8 table:0];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C32C4;
  v30[3] = &unk_100627240;
  objc_copyWeak(&v31, location);
  v22 = +[UIAction ic_actionWithTitle:v21 imageName:@"arrow.up.backward" handler:v30];

  [v8 addObject:v22];
  if (ICDebugModeEnabled())
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000C3308;
    v28[3] = &unk_100627240;
    objc_copyWeak(&v29, location);
    v23 = +[UIAction ic_actionWithTitle:@"Inspect Attachment" imageName:@"magnifyingglass" handler:v28];
    [v8 addObject:v23];

    objc_destroyWeak(&v29);
  }
  id v24 = [v8 copy];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(location);

  return v24;
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAEventReporter);
    objc_super v4 = (objc_class *)objc_opt_class();
    unsigned int v5 = NSStringFromClass(v4);
    id v6 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 view:self];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    unsigned __int8 v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
  }
  id v9 = self->_eventReporter;

  return v9;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (ICBrowseAttachmentsCollectionController)collectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionController);

  return (ICBrowseAttachmentsCollectionController *)WeakRetained;
}

- (void)setCollectionController:(id)a3
{
}

- (ICBrowseAttachmentsCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICBrowseAttachmentsCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionController);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end