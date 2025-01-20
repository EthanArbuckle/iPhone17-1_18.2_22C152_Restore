@interface NADaemon
+ (id)sharedDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NADaemon)init;
- (void)migrateFixedLibraryPathIfNeeded;
- (void)registerForLaunchEvents;
- (void)setup;
- (void)start;
- (void)startSyncControllerIfNeeded;
@end

@implementation NADaemon

+ (id)sharedDaemon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C31C;
  block[3] = &unk_100018688;
  block[4] = a1;
  if (qword_100021278 != -1) {
    dispatch_once(&qword_100021278, block);
  }
  v2 = (void *)qword_100021270;

  return v2;
}

- (NADaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)NADaemon;
  v2 = [(NADaemon *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanoappregistry.eventqueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)setup
{
  dispatch_queue_t v3 = nar_workspace_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setup NADaemon", v8, 2u);
  }

  [(NADaemon *)self registerForLaunchEvents];
  [(NADaemon *)self migrateFixedLibraryPathIfNeeded];
  v4 = +[NADApplicationStore defaultStore];
  applicationStore = self->_applicationStore;
  self->_applicationStore = v4;

  objc_super v6 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanoappregistry.workspace"];
  workspaceListener = self->_workspaceListener;
  self->_workspaceListener = v6;

  [(NSXPCListener *)self->_workspaceListener setDelegate:self];
  [(NADaemon *)self startSyncControllerIfNeeded];
}

- (void)start
{
}

- (void)startSyncControllerIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C51C;
  block[3] = &unk_100018598;
  block[4] = self;
  if (qword_100021280 != -1) {
    dispatch_once(&qword_100021280, block);
  }
}

- (void)registerForLaunchEvents
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  workspaceListener = self->_workspaceListener;
  if (workspaceListener == a3)
  {
    id v7 = a4;
    v8 = NARWorkspaceServiceInterface();
    [v7 setExportedInterface:v8];

    v9 = [[NADWorkspaceConnection alloc] initWithApplicationStore:self->_applicationStore];
    [v7 setExportedObject:v9];

    [v7 resume];
  }
  return workspaceListener == a3;
}

- (void)migrateFixedLibraryPathIfNeeded
{
  v2 = [NADLibraryPathMigrator alloc];
  dispatch_queue_t v3 = +[NADApplicationStore legacyDefaultURL];
  v4 = +[NADApplicationStore defaultURL];
  v5 = [(NADLibraryPathMigrator *)v2 initWithSourceURL:v3 destinationURL:v4];

  [(NADLibraryPathMigrator *)v5 migrate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStore, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_workspaceListener, 0);
}

@end