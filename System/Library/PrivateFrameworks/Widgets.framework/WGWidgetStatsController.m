@interface WGWidgetStatsController
- (BOOL)bootstrapFavoriteWidgets;
- (NCLaunchStats)launchStats;
- (WGWidgetDiscoveryController)discoveryController;
- (WGWidgetStatsController)initWithDiscoveryController:(id)a3;
- (void)_setupLaunchStats;
- (void)_teardownLaunchStats;
- (void)_updateFavoriteWidgetIdentifiers;
- (void)dealloc;
- (void)launchStats:(id)a3 incomingRecommendationForBundleIDs:(id)a4 completion:(id)a5;
- (void)notePreWarmHasEnded:(id)a3 withResult:(int64_t)a4 withTriggerType:(int)a5 withSequence:(unint64_t)a6;
- (void)notePreWarmHasStarted:(id)a3 withTriggerType:(int)a4 withSequence:(unint64_t)a5;
- (void)registerWidgetForPredictionEvents:(id)a3;
- (void)requestRefreshForWidget:(id)a3 afterDate:(id)a4;
- (void)setBootstrapFavoriteWidgets:(BOOL)a3;
- (void)unregisterWidgetForPredictionEvents:(id)a3;
@end

@implementation WGWidgetStatsController

- (WGWidgetStatsController)initWithDiscoveryController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WGWidgetStatsController.m", 26, @"Invalid parameter not satisfying: %@", @"discoveryController" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetStatsController;
  v6 = [(WGWidgetStatsController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_discoveryController, v5);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__favoriteWidgetIdentifiersDidUpdate_ name:@"WGWidgetFavoritesDidChange" object:v5];

    [(WGWidgetStatsController *)v7 _setupLaunchStats];
  }

  return v7;
}

- (void)dealloc
{
  [(WGWidgetStatsController *)self _teardownLaunchStats];
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetStatsController;
  [(WGWidgetStatsController *)&v3 dealloc];
}

- (void)setBootstrapFavoriteWidgets:(BOOL)a3
{
  if (self->_bootstrapFavoriteWidgets != a3)
  {
    self->_bootstrapFavoriteWidgets = a3;
    [(WGWidgetStatsController *)self _updateFavoriteWidgetIdentifiers];
  }
}

- (void)notePreWarmHasStarted:(id)a3 withTriggerType:(int)a4 withSequence:(unint64_t)a5
{
}

- (void)notePreWarmHasEnded:(id)a3 withResult:(int64_t)a4 withTriggerType:(int)a5 withSequence:(unint64_t)a6
{
}

- (void)requestRefreshForWidget:(id)a3 afterDate:(id)a4
{
}

- (void)_teardownLaunchStats
{
  [(NCLaunchStats *)self->_launchStats setNCLaunchRecommendationHandlerWithCompletion:0];
  [(NCLaunchStats *)self->_launchStats setBootstrapWidgetIDs:0];
  launchStats = self->_launchStats;
  self->_launchStats = 0;
}

- (void)_setupLaunchStats
{
  objc_initWeak(&location, self);
  if (!self->_launchStats)
  {
    objc_super v3 = (NCLaunchStats *)objc_alloc_init(MEMORY[0x263F57480]);
    launchStats = self->_launchStats;
    self->_launchStats = v3;

    objc_initWeak(&from, self->_launchStats);
    [(WGWidgetStatsController *)self _updateFavoriteWidgetIdentifiers];
    id v5 = self->_launchStats;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__WGWidgetStatsController__setupLaunchStats__block_invoke;
    v6[3] = &unk_2646771B0;
    objc_copyWeak(&v7, &location);
    objc_copyWeak(&v8, &from);
    [(NCLaunchStats *)v5 setNCLaunchRecommendationHandlerWithCompletion:v6];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
  }
  objc_destroyWeak(&location);
}

void __44__WGWidgetStatsController__setupLaunchStats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained launchStats:v8 incomingRecommendationForBundleIDs:v7 completion:v6];
}

- (void)launchStats:(id)a3 incomingRecommendationForBundleIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(WGWidgetStatsController *)self discoveryController];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke;
  block[3] = &unk_264677200;
  id v14 = v9;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke_2;
  v3[3] = &unk_2646771D8;
  id v4 = *(id *)(a1 + 48);
  [v1 handleWidgetLaunchRecommendation:v2 completion:v3];
}

uint64_t __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)registerWidgetForPredictionEvents:(id)a3
{
}

- (void)unregisterWidgetForPredictionEvents:(id)a3
{
}

- (void)_updateFavoriteWidgetIdentifiers
{
  if (self->_bootstrapFavoriteWidgets)
  {
    objc_super v3 = [(WGWidgetStatsController *)self discoveryController];
    id v7 = [v3 favoriteWidgetIdentifiers];

    launchStats = self->_launchStats;
    id v5 = [MEMORY[0x263EFFA08] setWithArray:v7];
    [(NCLaunchStats *)launchStats setBootstrapWidgetIDs:v5];
  }
  else
  {
    id v6 = self->_launchStats;
    id v7 = [MEMORY[0x263EFFA08] set];
    -[NCLaunchStats setBootstrapWidgetIDs:](v6, "setBootstrapWidgetIDs:");
  }
}

- (WGWidgetDiscoveryController)discoveryController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryController);
  return (WGWidgetDiscoveryController *)WeakRetained;
}

- (BOOL)bootstrapFavoriteWidgets
{
  return self->_bootstrapFavoriteWidgets;
}

- (NCLaunchStats)launchStats
{
  return self->_launchStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchStats, 0);
  objc_destroyWeak((id *)&self->_discoveryController);
}

@end