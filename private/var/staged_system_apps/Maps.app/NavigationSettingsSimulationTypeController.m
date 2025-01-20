@interface NavigationSettingsSimulationTypeController
+ (id)_descriptionForSimulationType:(int64_t)a3;
+ (id)navigationDestinationTitle;
- (void)prepareContent;
@end

@implementation NavigationSettingsSimulationTypeController

+ (id)navigationDestinationTitle
{
  return @"Simulation Options";
}

+ (id)_descriptionForSimulationType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 5) {
    return 0;
  }
  else {
    return *(&off_101302280 + a3 + 1);
  }
}

- (void)prepareContent
{
  Integer = (void *)GEOConfigGetInteger();
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10091A5C0;
  v14[3] = &unk_101302058;
  objc_copyWeak(v15, &location);
  v15[1] = Integer;
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Simulation Type" content:v14];
  if (Integer == (void *)4) {
    id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Follow Current Route => Off Route" content:&stru_101302078];
  }
  id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Search for Parking" content:&stru_101302098];
  id v7 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_1013020D8];
  id v8 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_1013020F8];
  id v9 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_101302118];
  v10 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_101302138];
  [v10 setFooter:@"These settings only apply if \"Override Simulation Speed\" is unset."];

  v11 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:&stru_101302178];
  [v11 setFooter:@"Overrides the default simulation speed derived from Routing's estimates with a fixed speed."];

  v12 = objc_alloc_init(MapsDebugTableSection);
  id v13 = [(MapsDebugTableSection *)v12 addSwitchRowWithTitle:@"Simulate geofences for transit routes", NavigationConfig_SimulationSimulateGeoFences[0], NavigationConfig_SimulationSimulateGeoFences[1], 1, &stru_1013021B8 geoConfigKey switchOnStateIfUnset changeHandler];
  [(MapsDebugTableSection *)v12 setVisible:GEOConfigGetInteger() != -1];
  [(MapsDebugValuesViewController *)self addSection:v12];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

@end