@interface HomeSharedTripsContentInjector
- (BaseModeController)baseModeController;
- (GEOSharedNavState)sharedTrip;
- (HomeSharedTripsContentInjector)initWithSharedTrip:(id)a3;
- (id)updateContentInjection;
- (void)addContentToMapView;
- (void)removeContentFromMapView;
- (void)setBaseModeController:(id)a3;
- (void)setUpdateContentInjection:(id)a3;
@end

@implementation HomeSharedTripsContentInjector

- (HomeSharedTripsContentInjector)initWithSharedTrip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeSharedTripsContentInjector;
  v6 = [(HomeSharedTripsContentInjector *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sharedTrip, a3);
  }

  return v7;
}

- (void)addContentToMapView
{
  id v4 = [(HomeSharedTripsContentInjector *)self baseModeController];
  v3 = [(HomeSharedTripsContentInjector *)self sharedTrip];
  [v4 showSharedTrip:v3];
}

- (void)removeContentFromMapView
{
  v3 = [(HomeSharedTripsContentInjector *)self baseModeController];
  id v4 = [(HomeSharedTripsContentInjector *)self sharedTrip];
  unsigned int v5 = [v3 isShowingSharedTrip:v4];

  if (v5)
  {
    id v6 = [(HomeSharedTripsContentInjector *)self baseModeController];
    [v6 showSharedTrip:0];
  }
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
}

- (BaseModeController)baseModeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseModeController);

  return (BaseModeController *)WeakRetained;
}

- (void)setBaseModeController:(id)a3
{
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_destroyWeak((id *)&self->_baseModeController);

  objc_storeStrong(&self->_updateContentInjection, 0);
}

@end