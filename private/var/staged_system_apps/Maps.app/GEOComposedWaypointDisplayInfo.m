@interface GEOComposedWaypointDisplayInfo
- (void)_routeCreation_setEndWaypointCaption;
- (void)_routeCreation_setMyLocationName;
- (void)_routeCreation_setStartEndWaypointCaption;
- (void)_routeCreation_setStartWaypointCaption;
@end

@implementation GEOComposedWaypointDisplayInfo

- (void)_routeCreation_setStartWaypointCaption
{
  v3 = +[NSBundle mainBundle];
  id v5 = [v3 localizedStringForKey:@"[Route Creation] Start Anchor Caption" value:@"localized string not found" table:0];

  id v4 = [objc_alloc((Class)GEOComposedString) initWithString:v5];
  [(GEOComposedWaypointDisplayInfo *)self setWaypointCaption:v4];
}

- (void)_routeCreation_setEndWaypointCaption
{
  v3 = +[NSBundle mainBundle];
  id v5 = [v3 localizedStringForKey:@"[Route Creation] End Anchor Caption" value:@"localized string not found" table:0];

  id v4 = [objc_alloc((Class)GEOComposedString) initWithString:v5];
  [(GEOComposedWaypointDisplayInfo *)self setWaypointCaption:v4];
}

- (void)_routeCreation_setStartEndWaypointCaption
{
  v3 = +[NSBundle mainBundle];
  id v5 = [v3 localizedStringForKey:@"[Route Creation] Combined Start End Anchor Caption" value:@"localized string not found" table:0];

  id v4 = [objc_alloc((Class)GEOComposedString) initWithString:v5];
  [(GEOComposedWaypointDisplayInfo *)self setWaypointCaption:v4];
}

- (void)_routeCreation_setMyLocationName
{
  MKLocalizedStringForCurrentLocation();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(GEOComposedWaypointDisplayInfo *)self setName:v3];
}

@end