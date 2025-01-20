@interface EnvironmentalFeatureDiscoverySource
- (BOOL)isAvailable;
- (BOOL)wantsAllRouteCollectionChanges;
- (EnvironmentalFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4;
- (FeatureDiscoveryModel)model;
- (FeatureDiscoverySourceDelegate)delegate;
- (id)_bestModelForCurrentState;
- (int64_t)priority;
- (int64_t)transportType;
- (void)_dismiss;
- (void)_performActionHandler;
- (void)_reloadAvailability;
- (void)markAsShown;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4;
@end

@implementation EnvironmentalFeatureDiscoverySource

- (EnvironmentalFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EnvironmentalFeatureDiscoverySource;
  v7 = [(EnvironmentalFeatureDiscoverySource *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 1;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (FeatureDiscoveryModel)model
{
  model = self->_model;
  if (!model)
  {
    v4 = [(EnvironmentalFeatureDiscoverySource *)self _bestModelForCurrentState];
    v5 = self->_model;
    self->_model = v4;

    model = self->_model;
  }

  return model;
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  self->_transportType = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [a4 currentRoute];
  id v6 = [v5 waypoints];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) mapItemStorage];
        v12 = [v11 _bestAvailableCountryCode];
        unsigned int v13 = [v12 isEqual:@"FR"];

        if (!v13)
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_11:

  self->_areRoutesImpacted = v14;
  [(EnvironmentalFeatureDiscoverySource *)self _reloadAvailability];
}

- (void)_reloadAvailability
{
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"EnvironmentalFeatureDiscoverySourceShown"];

  int available = self->_available;
  if ((v4 & 1) != 0 || self->_dismissed || self->_transportType != 1)
  {
    int areRoutesImpacted = 0;
  }
  else
  {
    int areRoutesImpacted = self->_areRoutesImpacted;
    if (self->_areRoutesImpacted) {
      int areRoutesImpacted = GEOConfigGetBOOL() ^ 1;
    }
  }
  self->_int available = areRoutesImpacted;
  if (available != areRoutesImpacted)
  {
    if ((areRoutesImpacted & 1) == 0)
    {
      model = self->_model;
      self->_model = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained source:self didUpdateAvailability:self->_available];
  }
}

- (id)_bestModelForCurrentState
{
  if (self->_available)
  {
    v3 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:30.0];
    unsigned __int8 v4 = +[UIImage systemImageNamed:@"leaf.circle.fill" withConfiguration:v3];
    v5 = +[UIColor systemGreenColor];
    id v6 = [v4 _flatImageWithColor:v5];
    id v7 = [v6 imageWithRenderingMode:1];

    id v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"[Feature Discovery] Reducing Climate Impact" value:@"localized string not found" table:0];

    objc_super v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"[Feature Discovery] Climate Impact Description" value:@"localized string not found" table:0];

    objc_initWeak(&location, self);
    v12 = [FeatureDiscoveryModel alloc];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100792D08;
    v16[3] = &unk_1012E6708;
    objc_copyWeak(&v17, &location);
    LOBYTE(v15) = 1;
    unsigned int v13 = [(FeatureDiscoveryModel *)v12 initWithImage:v7 title:v9 subtitle:v11 actionTitle:0 actionHandler:0 bodyTapHandler:0 displayedHandler:0 dismissHandler:v16 disableAffordanceAfterAction:v15];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (void)_performActionHandler
{
  v2 = +[UIApplication sharedMapsDelegate];
  v3 = [v2 appCoordinator];
  id v4 = [v3 baseActionCoordinator];

  [v4 switchRoutePlanningTransportTypeToType:3];
}

- (void)_dismiss
{
  self->_dismissed = 1;
  [(EnvironmentalFeatureDiscoverySource *)self _reloadAvailability];
}

- (void)markAsShown
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"EnvironmentalFeatureDiscoverySourceShown"];
}

- (FeatureDiscoverySourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FeatureDiscoverySourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end