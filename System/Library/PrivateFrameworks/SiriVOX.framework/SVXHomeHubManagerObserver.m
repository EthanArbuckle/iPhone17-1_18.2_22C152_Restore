@interface SVXHomeHubManagerObserver
- (SVXHomeHubManagerObserver)initWithRemoraVirtualDeviceManager:(id)a3 platformDependenciesTracker:(id)a4;
@end

@implementation SVXHomeHubManagerObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformDependenciesTracker, 0);
  objc_storeStrong((id *)&self->_remoraVirtualDeviceManager, 0);

  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);
}

- (SVXHomeHubManagerObserver)initWithRemoraVirtualDeviceManager:(id)a3 platformDependenciesTracker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SVXHomeHubManagerObserver;
  v9 = [(SVXHomeHubManagerObserver *)&v13 init];
  if (v9)
  {
    uint64_t v10 = +[SVXQueuePerformer sharedMainQueuePerformer];
    mainQueuePerformer = v9->_mainQueuePerformer;
    v9->_mainQueuePerformer = (SVXQueuePerformer *)v10;

    objc_storeStrong((id *)&v9->_remoraVirtualDeviceManager, a3);
    objc_storeStrong((id *)&v9->_platformDependenciesTracker, a4);
  }

  return v9;
}

@end