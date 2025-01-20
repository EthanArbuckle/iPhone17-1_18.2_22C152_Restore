@interface NotesApp
+ (id)sharedNotesApp;
- (BOOL)_refreshIsPendingForCollectionWithId:(id)a3;
- (BOOL)_refreshIsPendingForStoresList;
- (BOOL)accountsListNeedsUpdate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)didSetupApplication;
- (BOOL)shouldSetupApplicationWhenEnteringForeground;
- (NSFetchedResultsController)accountsFetchedResultsController;
- (NSFetchedResultsController)storesFetchedResultsController;
- (NoteContext)backgroundNoteContext;
- (NoteContext)noteContext;
- (UINavigationController)detailNavigationController;
- (id)nameOfDefaultImageToUpdateAtSuspension;
- (void)_cancelAllPendingRefreshes;
- (void)_markRefreshAsPendingForCollectionWithId:(id)a3;
- (void)_markRefreshAsPendingForStoresList;
- (void)_performRefreshIfNeededForCollectionWithId:(id)a3;
- (void)_performRefreshIfNeededForOrphanedAccounts;
- (void)_performRefreshIfNeededForStoresList;
- (void)_unmarkRefreshAsPendingForCollectionWithId:(id)a3;
- (void)_unmarkRefreshAsPendingForStoresList;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)refreshNotesIfNeededForCollection:(id)a3;
- (void)refreshOrphanedAccountsIfNeeded;
- (void)refreshStoresListIfNeeded;
- (void)setAccountsFetchedResultsController:(id)a3;
- (void)setAccountsListNeedsUpdate:(BOOL)a3;
- (void)setBackgroundNoteContext:(id)a3;
- (void)setNoteContext:(id)a3;
- (void)setShouldSetupApplicationWhenEnteringForeground:(BOOL)a3;
- (void)setStoresFetchedResultsController:(id)a3;
- (void)setupApplication;
- (void)setupApplicationIfNecessary;
- (void)updateAccountMigrationStates;
@end

@implementation NotesApp

- (void)setupApplication
{
  if (![(NotesApp *)self didSetupApplication])
  {
    self->_didSetupApplication = 1;
    +[UIApplication shouldMakeUIForDefaultPNG];
    id v13 = +[NoteContext sharedContext];
    -[NotesApp setNoteContext:](self, "setNoteContext:");
    v3 = [(NotesApp *)self noteContext];
    [v3 enableChangeLogging:1];

    v4 = [(NotesApp *)self noteContext];
    [v4 setHasPriorityInSaveConflicts:1];

    id v5 = [objc_alloc((Class)NoteContext) initWithPrivateQueue];
    [(NotesApp *)self setBackgroundNoteContext:v5];

    v6 = [(NotesApp *)self backgroundNoteContext];
    id v7 = [v6 newFRCForAccountsWithDelegate:self];
    [(NotesApp *)self setAccountsFetchedResultsController:v7];

    v8 = [(NotesApp *)self backgroundNoteContext];
    id v9 = [v8 newFRCForStoresWithDelegate:self];
    [(NotesApp *)self setStoresFetchedResultsController:v9];

    v10 = +[AccountUtilities sharedAccountUtilities];
    [v10 startKeepingAccountInfosUpToDate];

    v11 = +[UIApplication sharedApplication];
    id v12 = [v11 applicationState];

    if (v12 != (id)2)
    {
      [(NotesApp *)self refreshOrphanedAccountsIfNeeded];
      [(NotesApp *)self refreshStoresListIfNeeded];
    }
  }
}

- (NoteContext)noteContext
{
  [(NotesApp *)self setupApplicationIfNecessary];
  noteContext = self->_noteContext;

  return noteContext;
}

- (void)setupApplicationIfNecessary
{
  if (*((unsigned char *)self + 8))
  {
    [(NotesApp *)self setShouldSetupApplicationWhenEnteringForeground:1];
  }
  else if (![(NotesApp *)self didSetupApplication])
  {
    [(NotesApp *)self setupApplication];
  }
}

- (BOOL)didSetupApplication
{
  return self->_didSetupApplication;
}

- (NoteContext)backgroundNoteContext
{
  return self->_backgroundNoteContext;
}

+ (id)sharedNotesApp
{
  if (qword_1006AA330 != -1) {
    dispatch_once(&qword_1006AA330, &stru_10062A6E8);
  }
  v2 = (void *)qword_1006AA328;

  return v2;
}

- (void)setStoresFetchedResultsController:(id)a3
{
}

- (void)setNoteContext:(id)a3
{
}

- (void)setBackgroundNoteContext:(id)a3
{
}

- (void)setAccountsFetchedResultsController:(id)a3
{
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if ((+[ICNoteContext legacyNotesDisabled] & 1) == 0) {
    [(NotesApp *)self setupApplication];
  }
  +[UIApplication shouldMakeUIForDefaultPNG];
  return 1;
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)NotesApp;
  [(NotesApp *)&v3 dealloc];
}

- (id)nameOfDefaultImageToUpdateAtSuspension
{
  return @"Default";
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (void)applicationWillEnterForeground:(id)a3
{
  *((unsigned char *)self + 8) &= ~1u;
  if ([(NotesApp *)self shouldSetupApplicationWhenEnteringForeground])
  {
    [(NotesApp *)self setupApplication];
    [(NotesApp *)self setShouldSetupApplicationWhenEnteringForeground:0];
  }
  if ([(NotesApp *)self didSetupApplication])
  {
    [(NotesApp *)self refreshOrphanedAccountsIfNeeded];
    [(NotesApp *)self refreshStoresListIfNeeded];
    v4 = [(NotesApp *)self noteContext];
    [v4 resetNotificationCount];

    [(NotesApp *)self updateAccountMigrationStates];
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v8 = a3;
  id v7 = v8;
  performBlockOnMainThread();
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  performBlockOnMainThread();
}

- (void)_unmarkRefreshAsPendingForCollectionWithId:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_collectionIDsPendingRefresh, "removeObject:");
  }
  else {
    *((unsigned char *)self + 8) &= ~4u;
  }
}

- (void)_performRefreshIfNeededForCollectionWithId:(id)a3
{
  id v6 = a3;
  [(NotesApp *)self _unmarkRefreshAsPendingForCollectionWithId:v6];
  id v4 = +[NotesRefreshController sharedInstance];
  id v5 = v4;
  if (v6)
  {
    if ([v4 notesNeedRefreshForCollectionWithID:v6]) {
      [v5 refreshNotesForCollectionWithID:v6];
    }
  }
  else
  {
    [v4 refreshAllNotesIfNeeded];
  }
}

- (BOOL)_refreshIsPendingForCollectionWithId:(id)a3
{
  if (a3) {
    LOBYTE(v3) = -[NSMutableSet containsObject:](self->_collectionIDsPendingRefresh, "containsObject:");
  }
  else {
    return (*((unsigned __int8 *)self + 8) >> 2) & 1;
  }
  return v3;
}

- (void)_markRefreshAsPendingForCollectionWithId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    collectionIDsPendingRefresh = self->_collectionIDsPendingRefresh;
    id v8 = v4;
    if (!collectionIDsPendingRefresh)
    {
      id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v7 = self->_collectionIDsPendingRefresh;
      self->_collectionIDsPendingRefresh = v6;

      collectionIDsPendingRefresh = self->_collectionIDsPendingRefresh;
    }
    [(NSMutableSet *)collectionIDsPendingRefresh addObject:v8];
    id v4 = v8;
  }
  else
  {
    *((unsigned char *)self + 8) |= 4u;
  }
}

- (void)refreshNotesIfNeededForCollection:(id)a3
{
  id v4 = [a3 objectID];
  if (!-[NotesApp _refreshIsPendingForCollectionWithId:](self, "_refreshIsPendingForCollectionWithId:"))
  {
    [(NotesApp *)self _markRefreshAsPendingForCollectionWithId:v4];
    [(NotesApp *)self performSelector:"_performRefreshIfNeededForCollectionWithId:" withObject:v4 afterDelay:3.0];
  }
}

- (void)_unmarkRefreshAsPendingForStoresList
{
  *((unsigned char *)self + 8) &= ~2u;
}

- (void)_performRefreshIfNeededForStoresList
{
  [(NotesApp *)self _unmarkRefreshAsPendingForStoresList];
  id v2 = +[NotesRefreshController sharedInstance];
  if ([v2 storesListNeedsRefresh]) {
    [v2 refreshStoresList];
  }
}

- (BOOL)_refreshIsPendingForStoresList
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)_markRefreshAsPendingForStoresList
{
  *((unsigned char *)self + 8) |= 2u;
}

- (void)refreshStoresListIfNeeded
{
  if (![(NotesApp *)self _refreshIsPendingForStoresList])
  {
    [(NotesApp *)self _markRefreshAsPendingForStoresList];
    [(NotesApp *)self performSelector:"_performRefreshIfNeededForStoresList" withObject:0 afterDelay:3.0];
  }
}

- (void)_performRefreshIfNeededForOrphanedAccounts
{
  id v2 = +[NotesRefreshController sharedInstance];
  [v2 refreshOrphanedAccounts];
}

- (void)refreshOrphanedAccountsIfNeeded
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_performRefreshIfNeededForOrphanedAccounts" object:0];

  [(NotesApp *)self performSelector:"_performRefreshIfNeededForOrphanedAccounts" withObject:0 afterDelay:3.0];
}

- (void)updateAccountMigrationStates
{
  id v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &stru_10062A730);
}

- (void)_cancelAllPendingRefreshes
{
  if ([(NotesApp *)self _refreshIsPendingForCollectionWithId:0])
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_performRefreshIfNeededForCollectionWithId:" object:0];
    [(NotesApp *)self _unmarkRefreshAsPendingForCollectionWithId:0];
  }
  int v3 = +[NSSet setWithSet:self->_collectionIDsPendingRefresh];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_performRefreshIfNeededForCollectionWithId:" object:v8];
        [(NotesApp *)self _unmarkRefreshAsPendingForCollectionWithId:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  if ([(NotesApp *)self _refreshIsPendingForStoresList])
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_performRefreshIfNeededForStoresList" object:0];
    [(NotesApp *)self _unmarkRefreshAsPendingForStoresList];
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_performRefreshIfNeededForOrphanedAccounts" object:0];
}

- (UINavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (NSFetchedResultsController)accountsFetchedResultsController
{
  return self->_accountsFetchedResultsController;
}

- (NSFetchedResultsController)storesFetchedResultsController
{
  return self->_storesFetchedResultsController;
}

- (BOOL)shouldSetupApplicationWhenEnteringForeground
{
  return self->_shouldSetupApplicationWhenEnteringForeground;
}

- (void)setShouldSetupApplicationWhenEnteringForeground:(BOOL)a3
{
  self->_shouldSetupApplicationWhenEnteringForeground = a3;
}

- (BOOL)accountsListNeedsUpdate
{
  return self->_accountsListNeedsUpdate;
}

- (void)setAccountsListNeedsUpdate:(BOOL)a3
{
  self->_accountsListNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storesFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_accountsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_backgroundNoteContext, 0);
  objc_storeStrong((id *)&self->_noteContext, 0);
  objc_storeStrong((id *)&self->_detailNavigationController, 0);

  objc_storeStrong((id *)&self->_collectionIDsPendingRefresh, 0);
}

@end