@interface ICLegacyImportManager
+ (id)sharedLegacyImportManager;
- (BOOL)hasPendingOperations;
- (ICLegacyImportManager)init;
- (NSOperationQueue)operationQueue;
- (void)moveLegacyNotes:(id)a3 toFolder:(id)a4;
- (void)setOperationQueue:(id)a3;
@end

@implementation ICLegacyImportManager

+ (id)sharedLegacyImportManager
{
  if (qword_1006AA320 != -1) {
    dispatch_once(&qword_1006AA320, &stru_10062A658);
  }
  v2 = (void *)qword_1006AA318;

  return v2;
}

- (ICLegacyImportManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICLegacyImportManager;
  v2 = [(ICLegacyImportManager *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(ICLegacyImportManager *)v2 setOperationQueue:v3];

    v4 = [(ICLegacyImportManager *)v2 operationQueue];
    [v4 setName:@"com.apple.notes.move-HTML-notes-to-modern-account-queue"];

    v5 = [(ICLegacyImportManager *)v2 operationQueue];
    [v5 setMaxConcurrentOperationCount:1];

    v6 = [(ICLegacyImportManager *)v2 operationQueue];
    [v6 setQualityOfService:25];
  }
  return v2;
}

- (void)moveLegacyNotes:(id)a3 toFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [[ICImportLegacyNotesOperation alloc] initWithLegacyNotes:v6 destinationFolder:v7 deleteLegacyNotesAfterImport:1];
  objc_initWeak(&location, v8);
  v9 = +[NSString stringWithFormat:@"Move legacy notes %@", v8];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v10 = +[UIApplication sharedApplication];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011C8F4;
  v18[3] = &unk_10062A680;
  id v11 = v9;
  id v19 = v11;
  objc_copyWeak(&v21, &location);
  v20 = &v22;
  id v12 = [v10 beginBackgroundTaskWithName:v11 expirationHandler:v18];

  v23[3] = (uint64_t)v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10011C9FC;
  v16[3] = &unk_10062A6A8;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  v16[5] = &v22;
  [(ICImportLegacyNotesOperation *)v8 setCompletionBlock:v16];
  v13 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding move legacy notes operation: %@", buf, 0xCu);
  }

  v14 = [(ICLegacyImportManager *)self operationQueue];
  [v14 addOperation:v8];

  v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"ICLegacyImportManagerOperationsDidChangeNotification" object:self];

  objc_destroyWeak(&v17);
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

- (BOOL)hasPendingOperations
{
  v2 = [(ICLegacyImportManager *)self operationQueue];
  BOOL v3 = [v2 operationCount] != 0;

  return v3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end