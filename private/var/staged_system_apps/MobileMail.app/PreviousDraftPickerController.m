@interface PreviousDraftPickerController
+ (OS_os_log)log;
- (BOOL)hasDrafts;
- (EFCancelable)tableViewObserver;
- (EMMessageList)messageList;
- (EMMessageRepository)messageRepository;
- (EMObjectID)composeSectionObjectID;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (MessageListCollectionHelper)collectionHelper;
- (NSArray)mailboxes;
- (NSDirectionalEdgeInsets)mf_extraContentMargins;
- (PreviousDraftPickerController)initWithMessageRepository:(id)a3;
- (PreviousDraftPickerHeaderView)headerView;
- (UITableViewDiffableDataSource)tableViewDataSource;
- (double)draftRowHeight;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)actionBlock;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_cancel:(id)a3;
- (void)_configureCell:(id)a3 itemID:(id)a4;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 completionHandler:(id)a5;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completionHandler:(id)a6;
- (void)_reloadDataSource;
- (void)_updateHeaderViewDraftsState;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setCollectionHelper:(id)a3;
- (void)setComposeSectionObjectID:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLayoutValuesHelper:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setMessageList:(id)a3;
- (void)setMessageRepository:(id)a3;
- (void)setTableViewDataSource:(id)a3;
- (void)setTableViewObserver:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PreviousDraftPickerController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020C584;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699E78 != -1) {
    dispatch_once(&qword_100699E78, block);
  }
  v2 = (void *)qword_100699E70;

  return (OS_os_log *)v2;
}

- (PreviousDraftPickerController)initWithMessageRepository:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PreviousDraftPickerController;
  v6 = [(PreviousDraftPickerController *)&v26 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageRepository, a3);
    v8 = (MessageListCollectionHelper *)[objc_alloc((Class)MessageListCollectionHelper) initWithLoggableClient:v7 updateQueueName:@"com.apple.mobilemail.PreviousDraftPickerController.tableViewUpdate" sectionObjectID:0];
    collectionHelper = v7->_collectionHelper;
    v7->_collectionHelper = v8;

    v10 = (MessageListCellLayoutValuesHelper *)objc_alloc_init((Class)MessageListCellLayoutValuesHelper);
    layoutValuesHelper = v7->_layoutValuesHelper;
    v7->_layoutValuesHelper = v10;

    v12 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
    [(MessageListCellLayoutValuesHelper *)v7->_layoutValuesHelper setDefaultBackgroundConfiguration:v12];

    v13 = +[LocalAccount localAccount];
    v14 = [v13 transientDraftsFolder];
    v15 = [v14 URL];

    v16 = +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxWithURL:v15];
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"PREVIOUS_DRAFT_PICKER_TITLE" value:&stru_100619928 table:@"Main"];
    v19 = +[EMSmartMailbox unifiedMailboxOfType:5 name:v18 additionalPredicate:v16];
    v27 = v19;
    uint64_t v20 = +[NSArray arrayWithObjects:&v27 count:1];
    mailboxes = v7->_mailboxes;
    v7->_mailboxes = (NSArray *)v20;

    v22 = (EMObjectID *)[objc_alloc((Class)EMObjectID) initAsEphemeralID:1];
    composeSectionObjectID = v7->_composeSectionObjectID;
    v7->_composeSectionObjectID = v22;

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v7 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PreviousDraftPickerController;
  [(PreviousDraftPickerController *)&v12 traitCollectionDidChange:v4];
  id v5 = [(PreviousDraftPickerController *)self traitCollection];
  id v6 = [(PreviousDraftPickerController *)self mf_supportsPopoverPresentation];
  v7 = [(PreviousDraftPickerController *)self layoutValuesHelper];
  [v7 setSupportsPopover:v6];

  if (objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4))
  {
    v8 = [(PreviousDraftPickerController *)self layoutValuesHelper];
    [v8 setTraitCollection:v5];
  }
  v9 = [(PreviousDraftPickerController *)self tableView];
  v10 = +[NSIndexPath indexPathForRow:0 inSection:0];
  v11 = [v9 cellForRowAtIndexPath:v10];

  if (v11) {
    [v11 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)PreviousDraftPickerController;
  [(PreviousDraftPickerController *)&v12 viewLayoutMarginsDidChange];
  [(PreviousDraftPickerController *)self systemMinimumLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PreviousDraftPickerController *)self layoutValuesHelper];
  [v11 setSystemLayoutMargins:v4, v6, v8, v10];
}

- (NSDirectionalEdgeInsets)mf_extraContentMargins
{
  v2 = [(PreviousDraftPickerController *)self traitCollection];
  [v2 mf_leadingEdgeToBackButtonText];
  double v4 = v3;

  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v8;
  result.top = v5;
  return result;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PreviousDraftPickerController;
  [(PreviousDraftPickerController *)&v12 viewDidLoad];
  double v3 = +[NSBundle mainBundle];
  double v4 = [v3 localizedStringForKey:@"PREVIOUS_DRAFT_PICKER_TITLE" value:&stru_100619928 table:@"Main"];
  [(PreviousDraftPickerController *)self setTitle:v4];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancel:"];
  double v6 = [(PreviousDraftPickerController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  double v7 = [(PreviousDraftPickerController *)self tableView];
  uint64_t v8 = objc_opt_class();
  double v9 = +[MessageListTableViewCell reusableIdentifier];
  [v7 registerClass:v8 forCellReuseIdentifier:v9];

  double v10 = [(PreviousDraftPickerController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"PreviousDraftPickerNewMessageCellIdentifier"];

  [(PreviousDraftPickerController *)self _reloadDataSource];
  v11 = [(PreviousDraftPickerController *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(PreviousDraftPickerController *)self setTableViewObserver:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PreviousDraftPickerController;
  [(PreviousDraftPickerController *)&v6 viewWillAppear:a3];
  double v4 = [(PreviousDraftPickerController *)self layoutValuesHelper];
  id v5 = [(PreviousDraftPickerController *)self traitCollection];
  [v4 setTraitCollection:v5];

  [(PreviousDraftPickerController *)self systemMinimumLayoutMargins];
  [v4 setSystemLayoutMargins:];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PreviousDraftPickerController;
  [(PreviousDraftPickerController *)&v4 viewDidAppear:a3];
  [(PreviousDraftPickerController *)self mf_updateAlertSuppressionContextsForReason:@"showed previous drafts picker"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PreviousDraftPickerController;
  [(PreviousDraftPickerController *)&v3 viewWillDisappear:a3];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  headerView = self->_headerView;
  if (!headerView)
  {
    uint64_t v8 = [PreviousDraftPickerHeaderView alloc];
    [(PreviousDraftPickerController *)self tableView:v6 heightForHeaderInSection:a4];
    double v10 = -[PreviousDraftPickerHeaderView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0, 320.0, v9);
    v11 = self->_headerView;
    self->_headerView = v10;

    [(PreviousDraftPickerHeaderView *)self->_headerView setHasDrafts:[(PreviousDraftPickerController *)self hasDrafts]];
    headerView = self->_headerView;
  }
  objc_super v12 = headerView;

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 36.0;
  if (a4 != 1) {
    return 20.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == (id)1)
  {
    [(PreviousDraftPickerController *)self draftRowHeight];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (IsAccessibilityCategory) {
      double v7 = UITableViewAutomaticDimension;
    }
    else {
      double v7 = 44.0;
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(PreviousDraftPickerController *)self actionBlock];

  if (v6)
  {
    if ([v5 section])
    {
      double v7 = [(PreviousDraftPickerController *)self tableViewDataSource];
      uint64_t v8 = [v7 itemIdentifierForIndexPath:v5];

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      double v9 = [(PreviousDraftPickerController *)self messageList];
      double v10 = [v9 messageListItemForItemID:v8];
      v11 = +[EFScheduler mainThreadScheduler];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10020D238;
      v12[3] = &unk_100604D68;
      objc_copyWeak(&v13, &location);
      [v10 onScheduler:v11 addSuccessBlock:v12];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v8 = [(PreviousDraftPickerController *)self actionBlock];
      v8[2](v8, 0, 0);
    }
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(PreviousDraftPickerController *)self tableViewDataSource];
  double v7 = [v6 itemIdentifierForIndexPath:v5];

  uint64_t v8 = [(PreviousDraftPickerController *)self messageList];
  double v9 = [v8 messageListItemForItemID:v7];
  double v10 = [v9 result];

  if (v10)
  {
    v21 = v10;
    v11 = +[NSArray arrayWithObjects:&v21 count:1];
    objc_super v12 = [(PreviousDraftPickerController *)self undoManager];
    id v13 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v11 undoManager:v12 origin:5 actor:2];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10020D588;
    v18[3] = &unk_100605118;
    v18[4] = self;
    id v19 = v7;
    v14 = [v13 swipeActionWithPreparation:v18 completion:0];
    uint64_t v20 = v14;
    v15 = +[NSArray arrayWithObjects:&v20 count:1];
    v16 = +[UISwipeActionsConfiguration configurationWithActions:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (double)draftRowHeight
{
  v2 = [(PreviousDraftPickerController *)self layoutValuesHelper];
  objc_super v3 = [v2 defaultLayoutValues];
  [v3 defaultRowHeight];
  double v5 = v4;

  return v5;
}

- (void)_reloadDataSource
{
  objc_super v3 = [(PreviousDraftPickerController *)self mailboxes];
  double v4 = [(PreviousDraftPickerController *)self messageRepository];
  double v5 = +[EMMessageList simpleMessageListForMailboxes:v3 withRepository:v4 additionalQueryOptions:0 shouldUpdateDisplayDate:0];
  [(PreviousDraftPickerController *)self setMessageList:v5];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10020D9B0;
  v14[3] = &unk_10060DCE0;
  objc_copyWeak(&v15, &location);
  double v6 = objc_retainBlock(v14);
  id v7 = objc_alloc((Class)UITableViewDiffableDataSource);
  uint64_t v8 = [(PreviousDraftPickerController *)self tableView];
  id v9 = [v7 initWithTableView:v8 cellProvider:v6];
  [(PreviousDraftPickerController *)self setTableViewDataSource:v9];

  double v10 = [(PreviousDraftPickerController *)self collectionHelper];
  v11 = [v10 updateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10020DC04;
  block[3] = &unk_1006047A0;
  block[4] = self;
  dispatch_sync(v11, block);

  objc_super v12 = [(PreviousDraftPickerController *)self messageList];
  [v12 beginObserving:self];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_configureCell:(id)a3 itemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PreviousDraftPickerController.m" lineNumber:351 description:@"cell must be an instance of [MessageListTableViewCell class]"];
    }
  }
  id v9 = v7;
  double v10 = [v9 cellHelper];
  v11 = [(PreviousDraftPickerController *)self layoutValuesHelper];
  objc_super v12 = [v10 cellView];
  [v12 setLayoutValuesHelper:v11];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10020E150;
  v25[3] = &unk_10060BBA0;
  id v13 = v8;
  id v26 = v13;
  id v14 = v10;
  id v27 = v14;
  id v15 = objc_retainBlock(v25);
  v16 = [(PreviousDraftPickerController *)self messageList];
  v17 = [v16 messageListItemForItemID:v13];
  v18 = [v17 resultIfAvailable];
  if (v18)
  {
    ((void (*)(void *, void *))v15[2])(v15, v18);
  }
  else
  {
    [v14 setMessageListItem:0 style:0];
    id v19 = +[EFScheduler mainThreadScheduler];
    [v17 onScheduler:v19 addSuccessBlock:v15];

    uint64_t v20 = +[EFScheduler mainThreadScheduler];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10020E22C;
    v22[3] = &unk_100605C50;
    id v23 = v13;
    id v24 = v16;
    [v17 onScheduler:v20 addFailureBlock:v22];
  }
}

- (void)_updateHeaderViewDraftsState
{
  headerView = self->_headerView;
  BOOL v3 = [(PreviousDraftPickerController *)self hasDrafts];

  [(PreviousDraftPickerHeaderView *)headerView setHasDrafts:v3];
}

- (void)_cancel:(id)a3
{
  double v4 = [(PreviousDraftPickerController *)self actionBlock];

  if (v4)
  {
    double v5 = [(PreviousDraftPickerController *)self actionBlock];
    v5[2](v5, 2, 0);
  }
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  id v4 = [(PreviousDraftPickerController *)self layoutValuesHelper];
  [v4 invalidate];

  id v5 = [(PreviousDraftPickerController *)self tableView];
  [v5 reloadData];
}

- (BOOL)hasDrafts
{
  BOOL v3 = [(PreviousDraftPickerController *)self tableViewDataSource];
  id v4 = [v3 snapshot];

  id v5 = [(PreviousDraftPickerController *)self collectionHelper];
  double v6 = [v5 sectionObjectID];
  BOOL v7 = (uint64_t)[v4 numberOfItemsInSection:v6] > 0;

  return v7;
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10020E5F0;
  v9[3] = &unk_100604ED0;
  double v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(PreviousDraftPickerController *)v10 _performDataSourceUpdateAnimated:1 collection:a3 update:v9];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10020E790;
  v9[3] = &unk_100604ED0;
  double v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(PreviousDraftPickerController *)v10 _performDataSourceUpdateAnimated:1 collection:a3 update:v9];
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020E8F8;
  v7[3] = &unk_100604C28;
  id v8 = a4;
  id v6 = v8;
  [(PreviousDraftPickerController *)self _performDataSourceUpdateAnimated:1 collection:a3 update:v7];
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10020EA10;
  v10[3] = &unk_100604ED0;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [(PreviousDraftPickerController *)self _performDataSourceUpdateAnimated:1 collection:a3 update:v10];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10020EC7C;
  v10[3] = &unk_100604ED0;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [(PreviousDraftPickerController *)self _performDataSourceUpdateAnimated:1 collection:a3 update:v10];
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10020EE94;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  BOOL v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10020EFC8;
  v9[3] = &unk_100604C28;
  id v10 = a3;
  id v8 = v10;
  [(PreviousDraftPickerController *)self _performDataSourceUpdateAnimated:1 collection:a4 update:v9 completionHandler:a5];
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5
{
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10020F23C;
  v17[3] = &unk_100604C50;
  id v13 = v10;
  id v18 = v13;
  id v19 = self;
  id v14 = v11;
  id v20 = v14;
  BOOL v22 = a3;
  id v15 = v12;
  id v21 = v15;
  v16 = +[EFScheduler mainThreadScheduler];
  [v16 performBlock:v17];
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (PreviousDraftPickerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
}

- (MessageListCollectionHelper)collectionHelper
{
  return self->_collectionHelper;
}

- (void)setCollectionHelper:(id)a3
{
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (EMObjectID)composeSectionObjectID
{
  return self->_composeSectionObjectID;
}

- (void)setComposeSectionObjectID:(id)a3
{
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (void)setLayoutValuesHelper:(id)a3
{
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_composeSectionObjectID, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_collectionHelper, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong(&self->_actionBlock, 0);
}

@end