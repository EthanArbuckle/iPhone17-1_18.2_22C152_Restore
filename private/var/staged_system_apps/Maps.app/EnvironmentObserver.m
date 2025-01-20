@interface EnvironmentObserver
- (EnvironmentObserver)init;
- (MKMapView)mapView;
- (void)dealloc;
- (void)setMapView:(id)a3;
- (void)updateCurrentEnvironmentName;
@end

@implementation EnvironmentObserver

- (EnvironmentObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)EnvironmentObserver;
  v2 = [(EnvironmentObserver *)&v6 init];
  if (v2)
  {
    v3 = +[GEOPlatform sharedPlatform];
    unsigned int v4 = [v3 isInternalInstall];

    if (v4)
    {
      _GEOConfigAddDelegateListenerForKey();
      _GEOConfigAddDelegateListenerForKey();

      _GEOConfigAddDelegateListenerForKey();
      _GEOConfigAddDelegateListenerForKey();
    }
  }
  return v2;
}

- (void)updateCurrentEnvironmentName
{
  v3 = GEOConfigGetDictionary();
  unsigned int v4 = [v3 objectForKeyedSubscript:GEOResourceManifestEnvironmentKey];
  if (!v4)
  {
    GEOConfigGetValueWithSourceString();
    unsigned int v4 = 0;
  }
  uint64_t Integer = GEOConfigGetInteger();
  if (Integer == 2) {
    goto LABEL_6;
  }
  if (Integer != 1)
  {
    uint64_t BOOL = 0;
    goto LABEL_15;
  }
  if (v4)
  {
LABEL_6:
    uint64_t BOOL = 1;
  }
  else
  {
    v7 = [(EnvironmentObserver *)self mapView];
    if ([v7 _isUsingDevResourceStyleSheet])
    {
      uint64_t BOOL = 1;
    }
    else
    {
      v8 = +[GEOPlatform sharedPlatform];
      if ([v8 isInternalInstall]) {
        uint64_t BOOL = GEOConfigGetBOOL();
      }
      else {
        uint64_t BOOL = 0;
      }
    }
  }
LABEL_15:
  v9 = [(EnvironmentObserver *)self mapView];
  [v9 _setShowsCurrentEnvironmentName:BOOL];
}

- (void)setMapView:(id)a3
{
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)EnvironmentObserver;
  [(EnvironmentObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end