@interface BKApplicationShortcutController
+ (void)performUpdate;
+ (void)preWarmWithLibrary:(id)a3 annotationProvider:(id)a4;
- (AEAnnotationProvider)annotationProvider;
- (BKApplicationShortcutController)initWithLibrary:(id)a3;
- (BKLibraryAssetProvider)mainLibrary;
- (BUCoalescingCallBlock)coalescedUpdate;
- (NSArray)currentBookShortcuts;
- (OS_dispatch_queue)shortcutIconGenerationSerialQueue;
- (void)_performUpdateShortCutsWithCompletion:(id)a3;
- (void)_updateShortcuts;
- (void)dealloc;
- (void)managedObjectContextDidSave:(id)a3;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)setAnnotationProvider:(id)a3;
- (void)setCoalescedUpdate:(id)a3;
- (void)setCurrentBookShortcuts:(id)a3;
- (void)setMainLibrary:(id)a3;
- (void)setShortcutIconGenerationSerialQueue:(id)a3;
@end

@implementation BKApplicationShortcutController

+ (void)preWarmWithLibrary:(id)a3 annotationProvider:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E81B0;
  v8[3] = &unk_100A43DD8;
  id v9 = a3;
  id v10 = a4;
  uint64_t v5 = qword_100B4A610;
  id v6 = v10;
  id v7 = v9;
  if (v5 != -1) {
    dispatch_once(&qword_100B4A610, v8);
  }
}

+ (void)performUpdate
{
}

- (BKApplicationShortcutController)initWithLibrary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKApplicationShortcutController;
  uint64_t v5 = [(BKApplicationShortcutController *)&v22 init];
  id v6 = v5;
  if (v5)
  {
    [(BKApplicationShortcutController *)v5 setMainLibrary:v4];
    objc_initWeak(&location, v6);
    id v7 = objc_alloc((Class)BUCoalescingCallBlock);
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1001E8408;
    v19 = &unk_100A451B8;
    objc_copyWeak(&v20, &location);
    id v8 = [v7 initWithNotifyBlock:&v16 blockDescription:@"BKApplicationShortcutController"];
    -[BKApplicationShortcutController setCoalescedUpdate:](v6, "setCoalescedUpdate:", v8, v16, v17, v18, v19);

    id v9 = [(BKApplicationShortcutController *)v6 coalescedUpdate];
    [v9 setCoalescingDelay:1.0];

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("BKApplicationShortcutController.shortcutIconCreationQueue", v10);
    shortcutIconGenerationSerialQueue = v6->_shortcutIconGenerationSerialQueue;
    v6->_shortcutIconGenerationSerialQueue = (OS_dispatch_queue *)v11;

    v13 = +[BURestrictionsProvider sharedInstance];
    [v13 addObserver:v6];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v6 selector:"managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[BURestrictionsProvider sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BKApplicationShortcutController;
  [(BKApplicationShortcutController *)&v5 dealloc];
}

- (void)_updateShortcuts
{
  id v2 = [(BKApplicationShortcutController *)self coalescedUpdate];
  [v2 signalWithCompletion:&stru_100A4B010];
}

- (void)_performUpdateShortCutsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKApplicationShortcutController *)self mainLibrary];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E87BC;
  v7[3] = &unk_100A47010;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBackgroundReadOnlyBlock:v7];
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v13 = [a3 userInfo];
  id v4 = [v13 objectForKey:NSInsertedObjectsKey];
  objc_super v5 = +[NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", objc_opt_class()];
  id v6 = [v4 filteredSetUsingPredicate:v5];

  id v7 = [v13 objectForKey:NSDeletedObjectsKey];
  id v8 = +[NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", objc_opt_class()];
  id v9 = [v7 filteredSetUsingPredicate:v8];

  id v10 = [v13 objectForKey:NSUpdatedObjectsKey];
  dispatch_queue_t v11 = +[NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", objc_opt_class()];
  v12 = [v10 filteredSetUsingPredicate:v11];

  if ([v6 count] || objc_msgSend(v9, "count") || objc_msgSend(v12, "count")) {
    [(BKApplicationShortcutController *)self _updateShortcuts];
  }
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
}

- (AEAnnotationProvider)annotationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationProvider);

  return (AEAnnotationProvider *)WeakRetained;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (NSArray)currentBookShortcuts
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentBookShortcuts:(id)a3
{
}

- (BKLibraryAssetProvider)mainLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainLibrary);

  return (BKLibraryAssetProvider *)WeakRetained;
}

- (void)setMainLibrary:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedUpdate
{
  return self->_coalescedUpdate;
}

- (void)setCoalescedUpdate:(id)a3
{
}

- (OS_dispatch_queue)shortcutIconGenerationSerialQueue
{
  return self->_shortcutIconGenerationSerialQueue;
}

- (void)setShortcutIconGenerationSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIconGenerationSerialQueue, 0);
  objc_storeStrong((id *)&self->_coalescedUpdate, 0);
  objc_destroyWeak((id *)&self->_mainLibrary);
  objc_storeStrong((id *)&self->_currentBookShortcuts, 0);

  objc_destroyWeak((id *)&self->_annotationProvider);
}

@end