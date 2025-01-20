@interface RideBookingRideOptionState
+ (RideBookingRideOptionState)stateWithRideOptionStatusMap:(id)a3 appStoreSuggestions:(id)a4 installedSuggestions:(id)a5;
- (BOOL)loadingAppStoreSuggestions;
- (BOOL)noAppStoreSuggestionsAvailable;
- (BOOL)noRideOptionsAvailable;
- (NSArray)appStoreSuggestions;
- (NSArray)installedSuggestions;
- (NSDictionary)rideOptionStatusMap;
- (id)description;
- (void)setAppStoreSuggestions:(id)a3;
- (void)setInstalledSuggestions:(id)a3;
- (void)setLoadingAppStoreSuggestions:(BOOL)a3;
- (void)setNoAppStoreSuggestionsAvailable:(BOOL)a3;
- (void)setNoRideOptionsAvailable:(BOOL)a3;
- (void)setRideOptionStatusMap:(id)a3;
@end

@implementation RideBookingRideOptionState

+ (RideBookingRideOptionState)stateWithRideOptionStatusMap:(id)a3 appStoreSuggestions:(id)a4 installedSuggestions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  id v12 = [v10 copy];

  [v11 setRideOptionStatusMap:v12];
  [v11 setAppStoreSuggestions:v9];

  [v11 setInstalledSuggestions:v8];
  v13 = [v11 appStoreSuggestions];

  if (!v13) {
    [v11 setLoadingAppStoreSuggestions:1];
  }
  v14 = [v11 appStoreSuggestions];
  if ([v14 count]) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = [v11 loadingAppStoreSuggestions] ^ 1;
  }
  [v11 setNoAppStoreSuggestionsAvailable:v15];

  v16 = [v11 rideOptionStatusMap];
  v17 = [v16 allValues];
  [v11 setNoRideOptionsAvailable:[v17 count] == 0];

  return (RideBookingRideOptionState *)v11;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@", self->_rideOptionStatusMap];
}

- (NSDictionary)rideOptionStatusMap
{
  return self->_rideOptionStatusMap;
}

- (void)setRideOptionStatusMap:(id)a3
{
}

- (NSArray)installedSuggestions
{
  return self->_installedSuggestions;
}

- (void)setInstalledSuggestions:(id)a3
{
}

- (NSArray)appStoreSuggestions
{
  return self->_appStoreSuggestions;
}

- (void)setAppStoreSuggestions:(id)a3
{
}

- (BOOL)loadingAppStoreSuggestions
{
  return self->_loadingAppStoreSuggestions;
}

- (void)setLoadingAppStoreSuggestions:(BOOL)a3
{
  self->_loadingAppStoreSuggestions = a3;
}

- (BOOL)noAppStoreSuggestionsAvailable
{
  return self->_noAppStoreSuggestionsAvailable;
}

- (void)setNoAppStoreSuggestionsAvailable:(BOOL)a3
{
  self->_noAppStoreSuggestionsAvailable = a3;
}

- (BOOL)noRideOptionsAvailable
{
  return self->_noRideOptionsAvailable;
}

- (void)setNoRideOptionsAvailable:(BOOL)a3
{
  self->_noRideOptionsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreSuggestions, 0);
  objc_storeStrong((id *)&self->_installedSuggestions, 0);

  objc_storeStrong((id *)&self->_rideOptionStatusMap, 0);
}

@end