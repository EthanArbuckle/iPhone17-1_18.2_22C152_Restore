@interface PUAirPlayActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isRouteAvailable;
- (NSString)localizedRouteUnavailabilityMessage;
- (PUAirPlayActivity)init;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)_registerForAirPlayNotifications;
- (void)_unregisterForAirPlayNotifications;
- (void)dealloc;
- (void)performActivity;
@end

@implementation PUAirPlayActivity

- (void)_unregisterForAirPlayNotifications
{
  id v3 = +[PHAirPlayScreenController sharedInstance];
  [v3 unregisterRouteObserver:self];
}

- (void)_registerForAirPlayNotifications
{
  id v3 = +[PHAirPlayScreenController sharedInstance];
  [v3 registerRouteObserver:self];
}

- (void)performActivity
{
  BOOL v3 = [(PUAirPlayActivity *)self isRouteAvailable];
  if (v3)
  {
    [(PUAirPlayActivity *)self _unregisterForAirPlayNotifications];
    v4 = +[PHAirPlayScreenController sharedInstance];
    [v4 notifyDidPresentAirPlayRoutesFromShareSheet];
  }
  [(UIActivity *)self activityDidFinish:v3];
}

- (NSString)localizedRouteUnavailabilityMessage
{
  v2 = +[PHAirPlayScreenController sharedInstance];
  uint64_t v3 = [v2 routeUnavailableReason];

  if (v3 == 2) {
    v4 = @"SHARING_AIRPLAY_ERROR_MESSAGE_EXTERNAL_DISPLAY_CONNECTED";
  }
  else {
    v4 = @"SHARING_AIRPLAY_ERROR_MESSAGE";
  }
  v5 = PULocalizedString(v4);
  return (NSString *)v5;
}

- (BOOL)isRouteAvailable
{
  v2 = +[PHAirPlayScreenController sharedInstance];
  char v3 = objc_msgSend(v2, "pu_hasAvailableRoute");

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  char v3 = [(PXActivity *)self itemSourceController];
  char v4 = [v3 isPreparingIndividualItems];

  return v4;
}

- (id)_systemImageName
{
  return @"airplayvideo";
}

- (id)activityTitle
{
  return PULocalizedString(@"PUPHOTOBROWSER_BUTTON_AIRPLAY");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90948];
}

- (void)dealloc
{
  [(PUAirPlayActivity *)self _unregisterForAirPlayNotifications];
  v3.receiver = self;
  v3.super_class = (Class)PUAirPlayActivity;
  [(PUAirPlayActivity *)&v3 dealloc];
}

- (PUAirPlayActivity)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUAirPlayActivity;
  v2 = [(UIActivity *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(PUAirPlayActivity *)v2 _registerForAirPlayNotifications];
  }
  return v3;
}

@end