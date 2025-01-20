@interface RouteAnnotationsMutableConfiguration
+ (id)_customSelectedRouteTextFromIncidentAlert:(id)a3;
+ (id)navConfigurationWithCurrentRoute:(id)a3 incidentAlert:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)clear;
- (void)filterTransitVehiclePositionsForTripsNotInSet:(id)a3;
- (void)updateNavConfigurationWithCurrentRoute:(id)a3 incidentAlert:(id)a4;
@end

@implementation RouteAnnotationsMutableConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[RouteAnnotationsConfiguration allocWithZone:a3] initWithRoute:0];
  [(RouteAnnotationsConfiguration *)self _copyPropertiesTo:v4];
  return v4;
}

- (void)clear
{
  id v3 = (id)objc_opt_new();
  [v3 _copyPropertiesTo:self];
}

- (void)filterTransitVehiclePositionsForTripsNotInSet:(id)a3
{
  id v4 = a3;
  v5 = [(RouteAnnotationsConfiguration *)self transitVehiclePositions];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v15 = self;
    v7 = [(RouteAnnotationsConfiguration *)self transitVehiclePositions];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 tripID]);
          unsigned __int8 v14 = [v4 containsObject:v13];

          if ((v14 & 1) == 0) {
            [v6 removeObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    self = v15;
  }
  [(RouteAnnotationsConfiguration *)self setTransitVehiclePositions:v6];
}

+ (id)navConfigurationWithCurrentRoute:(id)a3 incidentAlert:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(RouteAnnotationsMutableConfiguration);
  [(RouteAnnotationsMutableConfiguration *)v7 updateNavConfigurationWithCurrentRoute:v6 incidentAlert:v5];

  return v7;
}

- (void)updateNavConfigurationWithCurrentRoute:(id)a3 incidentAlert:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  id v8 = v7;
  if (!v14)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = 2;
    goto LABEL_12;
  }
  [v7 addObject:];
  if (v6)
  {
    id v9 = [v6 alternateRouteToDisplay];
    if (v9)
    {
      [v8 addObject:v9];
      uint64_t v10 = [(id)objc_opt_class() _customSelectedRouteTextFromIncidentAlert:v6];
      if ([v6 isReroute]) {
        uint64_t v11 = (uint64_t)[v8 count] - 1;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = 4;
      goto LABEL_11;
    }
  }
  else
  {
    v13 = +[MNNavigationService sharedService];
    id v9 = [v13 alternateRoutes];

    [v8 addObjectsFromArray:v9];
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 2;
LABEL_11:

LABEL_12:
  [(RouteAnnotationsConfiguration *)self setStyle:v12];
  [(RouteAnnotationsConfiguration *)self setSelectedRouteCustomText:v10];
  [(RouteAnnotationsConfiguration *)self setRoutes:v8];
  [(RouteAnnotationsConfiguration *)self setSelectedRouteIndex:v11];
  [(RouteAnnotationsConfiguration *)self setRouteTrafficFeaturesActive:1];
}

+ (id)_customSelectedRouteTextFromIncidentAlert:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  id v5 = [v3 alertType];
  if (v5 == (id)4)
  {
LABEL_5:
    id v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"RouteCalloutText_New_Route";
    goto LABEL_9;
  }
  if (v5 != (id)3)
  {
    if (v5 == (id)1) {
      goto LABEL_5;
    }
LABEL_6:
    id v9 = 0;
    goto LABEL_11;
  }
  if ([v4 secondsSaved] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = +[NSString _navigation_stringWithSeconds:andAbbreviationType:](NSString, "_navigation_stringWithSeconds:andAbbreviationType:", [v4 secondsSaved], 1);
    uint64_t v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"<# min> faster [Route Label Marker For Traffic Incident Alert]" value:@"localized string not found" table:0];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v7);

    goto LABEL_10;
  }
  id v6 = +[NSBundle mainBundle];
  v7 = v6;
  CFStringRef v8 = @"RouteCalloutText_faster";
LABEL_9:
  id v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];
LABEL_10:

LABEL_11:

  return v9;
}

@end