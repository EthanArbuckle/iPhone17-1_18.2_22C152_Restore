@interface RideBookingApplicationFinder
- (BOOL)readyToLoadApps;
- (BOOL)waitingForExtensionManagerToLoad;
- (MapsSuggestionsAppGuardian)appGuardian;
- (NSArray)applications;
- (OS_dispatch_queue)queue;
- (RideBookingApplicationFinder)init;
- (RideBookingApplicationFinderDelegate)delegate;
- (_MXExtensionManager)extensionManager;
- (void)_setupExtensionManager;
- (void)dealloc;
- (void)didChangeProtectionStatusForBundleId:(id)a3;
- (void)extensionManager:(id)a3 didFailWithError:(id)a4;
- (void)extensionManager:(id)a3 didUpdateAvailableExtensions:(id)a4;
- (void)setAppGuardian:(id)a3;
- (void)setApplications:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWaitingForExtensionManagerToLoad:(BOOL)a3;
@end

@implementation RideBookingApplicationFinder

- (void)_setupExtensionManager
{
  id v5 = +[_MXExtensionManager _lookupPolicyWithBlock:&stru_10131B608];
  self->_waitingForExtensionManagerToLoad = 1;
  v3 = +[_MXExtensionManager managerWithLookupPolicy:v5 delegate:self];
  extensionManager = self->_extensionManager;
  self->_extensionManager = v3;
}

- (RideBookingApplicationFinder)init
{
  v10.receiver = self;
  v10.super_class = (Class)RideBookingApplicationFinder;
  v2 = [(RideBookingApplicationFinder *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("RideBookingApplicationFinderQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(RideBookingApplicationFinder *)v2 _setupExtensionManager];
    v6 = sub_100018584();
    uint64_t v7 = [v6 oneAppGuardian];
    appGuardian = v2->_appGuardian;
    v2->_appGuardian = (MapsSuggestionsAppGuardian *)v7;
  }
  return v2;
}

- (void)extensionManager:(id)a3 didUpdateAvailableExtensions:(id)a4
{
  id v5 = a4;
  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplicationFinder.m");
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Updated extensions: %@", v5];
    *(_DWORD *)buf = 136315394;
    v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  uint64_t v9 = [(RideBookingApplicationFinder *)self delegate];
  if (v9)
  {
    objc_super v10 = (void *)v9;
    v11 = [(RideBookingApplicationFinder *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000821EC;
      block[3] = &unk_1012E5D58;
      block[4] = self;
      id v15 = v5;
      dispatch_async(queue, block);
    }
  }
}

- (RideBookingApplicationFinderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (RideBookingApplicationFinderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)extensionManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C060A8;
  v8[3] = &unk_1012E5D58;
  id v9 = v5;
  objc_super v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (BOOL)readyToLoadApps
{
  return !self->_waitingForExtensionManagerToLoad;
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  extensionManager = self->_extensionManager;
  self->_extensionManager = 0;

  [(RideBookingApplicationFinder *)self _setupExtensionManager];
}

- (void)dealloc
{
  [(MapsSuggestionsAppGuardian *)self->_appGuardian unregisterAppTracker:self];
  v3.receiver = self;
  v3.super_class = (Class)RideBookingApplicationFinder;
  [(RideBookingApplicationFinder *)&v3 dealloc];
}

- (_MXExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
}

- (BOOL)waitingForExtensionManagerToLoad
{
  return self->_waitingForExtensionManagerToLoad;
}

- (void)setWaitingForExtensionManagerToLoad:(BOOL)a3
{
  self->_waitingForExtensionManagerToLoad = a3;
}

- (NSArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MapsSuggestionsAppGuardian)appGuardian
{
  return self->_appGuardian;
}

- (void)setAppGuardian:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appGuardian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end