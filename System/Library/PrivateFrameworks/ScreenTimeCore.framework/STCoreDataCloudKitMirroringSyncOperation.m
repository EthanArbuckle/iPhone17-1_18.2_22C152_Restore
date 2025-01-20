@interface STCoreDataCloudKitMirroringSyncOperation
- (STCoreDataCloudKitMirroringSyncOperation)initWithPersistenceController:(id)a3;
- (void)_exportWithCompletionHandler:(id)a3;
- (void)_importWithCompletionHandler:(id)a3;
- (void)_migrateWithExportNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_reconcileWithCompletionHandler:(id)a3;
- (void)main;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation STCoreDataCloudKitMirroringSyncOperation

- (STCoreDataCloudKitMirroringSyncOperation)initWithPersistenceController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STCoreDataCloudKitMirroringSyncOperation;
  return [(STPersistenceOperation *)&v4 initWithPersistenceController:a3];
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100025A80;
  v4[3] = &unk_1002FC018;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(STCoreDataCloudKitMirroringSyncOperation *)v5 _importWithCompletionHandler:v4];
}

- (void)_importWithCompletionHandler:(id)a3
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100025E48;
  v13[3] = &unk_1002FC040;
  id v4 = a3;
  id v14 = v4;
  v5 = objc_retainBlock(v13);
  id v6 = [objc_alloc((Class)NSCloudKitMirroringImportRequest) initWithOptions:0 completionBlock:v5];
  v7 = [(STPersistenceOperation *)self persistenceController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025FC0;
  v10[3] = &unk_1002FB500;
  id v11 = v6;
  id v12 = v4;
  id v8 = v6;
  id v9 = v4;
  [v7 performBackgroundTask:v10];
}

- (void)_reconcileWithCompletionHandler:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026314;
  v10[3] = &unk_1002FB3D8;
  id v11 = a3;
  id v4 = v11;
  v5 = objc_retainBlock(v10);
  id v6 = [(STPersistenceOperation *)self persistenceController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026414;
  v8[3] = &unk_1002FC068;
  id v9 = v5;
  v7 = v5;
  [v6 performBackgroundTask:v8];
}

- (void)_migrateWithExportNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  [(STPersistenceOperation *)self persistenceController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000264E4;
  v8[3] = &unk_1002FC090;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = v5;
  id v7 = v9;
  [v7 performBackgroundTask:v8];
}

- (void)_exportWithCompletionHandler:(id)a3
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100026708;
  v13[3] = &unk_1002FC040;
  id v4 = a3;
  id v14 = v4;
  id v5 = objc_retainBlock(v13);
  id v6 = [objc_alloc((Class)NSCloudKitMirroringExportRequest) initWithOptions:0 completionBlock:v5];
  id v7 = [(STPersistenceOperation *)self persistenceController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026880;
  v10[3] = &unk_1002FB500;
  id v11 = v6;
  id v12 = v4;
  id v8 = v6;
  id v9 = v4;
  [v7 performBackgroundTask:v10];
}

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STCoreDataCloudKitMirroringSyncOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &state);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026BA8;
  v5[3] = &unk_1002FC0B8;
  v5[4] = self;
  [(STCoreDataCloudKitMirroringSyncOperation *)self synchronizeWithCompletionHandler:v5];
  os_activity_scope_leave(&state);
}

@end