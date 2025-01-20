@interface FMDRequestTrackedLocations
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (FMDAccount)account;
- (FMDLocation)currentLocation;
- (FMDLocationTracker)locationTracker;
- (FMDRequestTrackedLocations)initWithAccount:(id)a3 currentLocation:(id)a4 trackedLocations:(id)a5 locationTracker:(id)a6;
- (NSArray)trackedLocations;
- (id)requestBody;
- (id)urlTemplateType;
- (void)setAccount:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setLocationTracker:(id)a3;
- (void)setTrackedLocations:(id)a3;
@end

@implementation FMDRequestTrackedLocations

- (FMDRequestTrackedLocations)initWithAccount:(id)a3 currentLocation:(id)a4 trackedLocations:(id)a5 locationTracker:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMDRequestTrackedLocations;
  v14 = [(FMDRequest *)&v17 initWithAccount:v10];
  v15 = v14;
  if (v14)
  {
    [(FMDRequestTrackedLocations *)v14 setAccount:v10];
    [(FMDRequestTrackedLocations *)v15 setCurrentLocation:v11];
    [(FMDRequestTrackedLocations *)v15 setTrackedLocations:v12];
    [(FMDRequestTrackedLocations *)v15 setLocationTracker:v13];
  }

  return v15;
}

- (id)urlTemplateType
{
  return @"trackedLocations";
}

- (id)requestBody
{
  v9.receiver = self;
  v9.super_class = (Class)FMDRequestTrackedLocations;
  v3 = [(FMDRequest *)&v9 requestBody];
  v4 = [(FMDRequestTrackedLocations *)self trackedLocations];
  [v3 fm_safelyMapKey:@"trackedLocations" toObject:v4];

  v5 = [(FMDRequestTrackedLocations *)self currentLocation];

  if (v5)
  {
    v6 = [(FMDRequestTrackedLocations *)self currentLocation];
    v7 = [v6 dictionaryValue];

    [v3 setObject:v7 forKeyedSubscript:@"currentLocation"];
  }

  return v3;
}

- (BOOL)canRequestBeRetriedNow
{
  v3 = [(FMDRequestTrackedLocations *)self locationTracker];
  unsigned int v4 = [v3 isTrackingOn];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestTrackedLocations;
  return [(FMDRequest *)&v6 canRequestBeRetriedNow];
}

- (BOOL)canReplace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FMDLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (NSArray)trackedLocations
{
  return self->_trackedLocations;
}

- (void)setTrackedLocations:(id)a3
{
}

- (FMDLocationTracker)locationTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationTracker);

  return (FMDLocationTracker *)WeakRetained;
}

- (void)setLocationTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationTracker);
  objc_storeStrong((id *)&self->_trackedLocations, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end