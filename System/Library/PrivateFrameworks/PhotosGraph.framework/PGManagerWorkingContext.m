@interface PGManagerWorkingContext
- (BOOL)isGraphReady;
- (CLSLocationCache)locationCache;
- (CLSServiceManager)serviceManager;
- (CPAnalytics)analytics;
- (OS_os_log)loggingConnection;
- (PGCurationManager)curationManager;
- (PGManagerWorkingContext)initWithManager:(id)a3 loggingConnection:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (id)musicCuratorContextWithCurationOptions:(id)a3 error:(id *)a4;
- (id)musicCuratorContextWithRecentlyUsedSongAdamIDs:(id)a3 error:(id *)a4;
- (void)performSynchronousConcurrentGraphReadUsingBlock:(id)a3;
@end

@implementation PGManagerWorkingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (CLSLocationCache)locationCache
{
  return (CLSLocationCache *)objc_getProperty(self, a2, 32, 1);
}

- (CPAnalytics)analytics
{
  return (CPAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)performSynchronousConcurrentGraphReadUsingBlock:(id)a3
{
  p_manager = &self->_manager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manager);
  [WeakRetained performSynchronousConcurrentGraphReadUsingBlock:v4];
}

- (BOOL)isGraphReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  char v3 = [WeakRetained isReady];

  return v3;
}

- (CLSServiceManager)serviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  char v3 = [WeakRetained serviceManager];

  return (CLSServiceManager *)v3;
}

- (PGCurationManager)curationManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  char v3 = [WeakRetained curationManager];

  return (PGCurationManager *)v3;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  char v3 = [WeakRetained photoLibrary];

  return (PHPhotoLibrary *)v3;
}

- (PGManagerWorkingContext)initWithManager:(id)a3 loggingConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGManagerWorkingContext;
  v8 = [(PGManagerWorkingContext *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    objc_storeStrong((id *)&v9->_loggingConnection, a4);
    uint64_t v10 = [v6 analytics];
    analytics = v9->_analytics;
    v9->_analytics = (CPAnalytics *)v10;

    uint64_t v12 = [v6 locationCache];
    locationCache = v9->_locationCache;
    v9->_locationCache = (CLSLocationCache *)v12;
  }
  return v9;
}

- (id)musicCuratorContextWithCurationOptions:(id)a3 error:(id *)a4
{
  p_manager = &self->_manager;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manager);
  v8 = [WeakRetained musicCuratorContextWithCurationOptions:v6 error:a4];

  return v8;
}

- (id)musicCuratorContextWithRecentlyUsedSongAdamIDs:(id)a3 error:(id *)a4
{
  p_manager = &self->_manager;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_manager);
  v8 = [WeakRetained musicCuratorContextWithRecentlyUsedSongAdamIDs:v6 error:a4];

  return v8;
}

@end