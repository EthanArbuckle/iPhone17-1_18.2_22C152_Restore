@interface NTKDSiriDataSourcesObserver
+ (id)sharedInstance;
- (NTKDSiriDataSourcesObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)queue_buildInitialSetOfIdentifiersIfNeeded;
- (void)queue_updateDeviceDataSourcesInNanoPreferences;
- (void)updateDeviceDataSourcesInNanoPreferences;
@end

@implementation NTKDSiriDataSourcesObserver

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006748;
  block[3] = &unk_100060B50;
  block[4] = a1;
  if (qword_1000722C0 != -1) {
    dispatch_once(&qword_1000722C0, block);
  }
  v2 = (void *)qword_1000722B8;

  return v2;
}

- (NTKDSiriDataSourcesObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKDSiriDataSourcesObserver;
  v2 = [(NTKDSiriDataSourcesObserver *)&v9 init];
  v3 = v2;
  if (v2)
  {
    bundleIdentifiers = v2->_bundleIdentifiers;
    v2->_bundleIdentifiers = 0;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanotimekit.upnextobserver", 0);
    bundleQueue = v3->_bundleQueue;
    v3->_bundleQueue = (OS_dispatch_queue *)v5;

    v7 = +[LSApplicationWorkspace defaultWorkspace];
    [v7 addObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKDSiriDataSourcesObserver;
  [(NTKDSiriDataSourcesObserver *)&v4 dealloc];
}

- (void)queue_buildInitialSetOfIdentifiersIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_bundleQueue);
  if (!self->_bundleIdentifiers)
  {
    v3 = +[NSMutableSet set];
    objc_super v4 = +[LSApplicationWorkspace defaultWorkspace];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006964;
    v8[3] = &unk_100060B78;
    dispatch_queue_t v5 = v3;
    objc_super v9 = v5;
    [v4 enumerateBundlesOfType:1 block:v8];

    bundleIdentifiers = self->_bundleIdentifiers;
    self->_bundleIdentifiers = v5;
    v7 = v5;
  }
}

- (void)queue_updateDeviceDataSourcesInNanoPreferences
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_bundleQueue);
  [(NTKDSiriDataSourcesObserver *)self queue_buildInitialSetOfIdentifiersIfNeeded];
  id v4 = [(NSMutableSet *)self->_bundleIdentifiers copy];
  v3 = +[NTKSiriDefaults sharedInstance];
  [v3 setPhoneThirdPartyDataSources:v4];
}

- (void)updateDeviceDataSourcesInNanoPreferences
{
  bundleQueue = self->_bundleQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006BA4;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_sync(bundleQueue, block);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  bundleQueue = self->_bundleQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006C44;
  v7[3] = &unk_100060AB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(bundleQueue, v7);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  bundleQueue = self->_bundleQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006E50;
  v7[3] = &unk_100060AB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(bundleQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_bundleQueue, 0);
}

@end