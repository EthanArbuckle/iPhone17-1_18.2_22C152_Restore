@interface MapsSuggestionsNavdMapsAppLocationManager
+ (id)sharedLocationManager;
- (BOOL)hasLocationAccess;
- (MapsSuggestionsNavdMapsAppLocationManager)initWithName:(id)a3 queue:(id)a4;
@end

@implementation MapsSuggestionsNavdMapsAppLocationManager

+ (id)sharedLocationManager
{
  if (qword_10160F9A0 != -1) {
    dispatch_once(&qword_10160F9A0, &stru_1012F9250);
  }
  v2 = (void *)qword_10160F998;

  return v2;
}

- (MapsSuggestionsNavdMapsAppLocationManager)initWithName:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsNavdMapsAppLocationManager;
  return [(MapsSuggestionsNavdLocationManager *)&v5 initWithName:a3 locationBundleID:MapsAppBundleId queue:a4];
}

- (BOOL)hasLocationAccess
{
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:MapsAppBundleId]- 3 > 1)return 0; {
  v3 = [(MapsSuggestionsNavdLocationManager *)self locationManager];
  }
  BOOL v4 = [v3 accuracyAuthorization] == 0;

  return v4;
}

@end