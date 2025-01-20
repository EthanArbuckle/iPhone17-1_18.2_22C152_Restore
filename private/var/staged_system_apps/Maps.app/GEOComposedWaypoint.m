@interface GEOComposedWaypoint
- (AddressBookAddress)addressBookAddress;
- (BOOL)needsAdditionalNavData;
- (BOOL)shouldOfferAlternateChargersAtArrival;
- (CNContact)contact;
- (GEOComposedWaypoint)initWithSearchResult:(id)a3;
- (MKMapItem)mkMapItem;
- (NSString)arrivingDisplayName;
- (NSString)parkingDisplayName;
- (_TtC4Maps16MapsFindMyHandle)findMyHandle;
- (id)_addressBookAttributes;
- (id)hawkQueryRepresentation;
- (id)shortDescription;
- (void)clearFindMyData;
- (void)setAddressBookContactName:(id)a3;
- (void)setAddressBookContactSpokenName:(id)a3;
- (void)setUserValuesName:(id)a3;
@end

@implementation GEOComposedWaypoint

- (GEOComposedWaypoint)initWithSearchResult:(id)a3
{
  id v4 = a3;
  if ([v4 hasExplicitlyProvidedComposedWaypoint])
  {
    id v5 = [v4 composedWaypoint];
    v6 = (GEOComposedWaypoint *)[v5 copy];

    self = v6;
  }
  else if ([v4 type] == 3)
  {
    [v4 coordinate];
    double v8 = v7;
    [v4 coordinate];
    id v5 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:v8, v9];
    v10 = [v4 mapItem];

    if (v10)
    {
      v11 = [v4 mapItem];
      v12 = [v11 _geoMapItemStorageForPersistence];
      self = [(GEOComposedWaypoint *)self initWithMapItem:v12];
    }
    else
    {
      self = [(GEOComposedWaypoint *)self initWithLocation:v5 isCurrentLocation:0];
    }
    [(GEOComposedWaypoint *)self setType:1];
    [(GEOComposedWaypoint *)self setLocation:v5];
    v16 = [v5 latLng];
    [(GEOComposedWaypoint *)self setLatLng:v16];

    id v17 = objc_alloc_init((Class)GEOWaypointTyped);
    [v17 setWaypointType:4];
    id v18 = objc_alloc_init((Class)GEOWaypointLocation);
    [v17 setWaypointLocation:v18];

    v19 = [v17 waypointLocation];
    [v19 setLocation:v5];

    [(GEOComposedWaypoint *)self setWaypoint:v17];
  }
  else
  {
    v13 = [v4 mapItem];

    if (v13)
    {
      v14 = [v4 mapItem];
      uint64_t v15 = [v14 _geoMapItemStorageForPersistence];
    }
    else
    {
      v20 = [v4 place];

      if (!v20) {
        goto LABEL_14;
      }
      v14 = [v4 place];
      uint64_t v15 = +[GEOMapItemStorage mapItemStorageForPlace:v14];
    }
    id v5 = (id)v15;

    self = [(GEOComposedWaypoint *)self initWithMapItem:v5];
  }

LABEL_14:
  if ([v4 type] == 4)
  {
    [(GEOComposedWaypoint *)self setIsCurrentLocation:1];
    [(GEOComposedWaypoint *)self recomputeGeoWaypointTyped];
  }

  return self;
}

- (BOOL)shouldOfferAlternateChargersAtArrival
{
  v3 = [(GEOComposedWaypoint *)self chargingInfo];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(GEOComposedWaypoint *)self geoMapItem];
    v6 = [v5 _poiCategory];
    BOOL v4 = v6 == (void *)GEOPOICategoryEVCharger;
  }
  return v4;
}

- (id)shortDescription
{
  uint64_t v16 = objc_opt_class();
  id v15 = [(GEOComposedWaypoint *)self muid];
  v3 = [(GEOComposedWaypoint *)self timezone];
  BOOL v4 = [(GEOComposedWaypoint *)self location];
  id v5 = [(GEOComposedWaypoint *)self name];
  v6 = [(GEOComposedWaypoint *)self navDisplayName];
  double v7 = [(GEOComposedWaypoint *)self navDisplayAddress];
  double v8 = [(GEOComposedWaypoint *)self directionsListAddress];
  id v9 = [(GEOComposedWaypoint *)self waypointCategory];
  if (v9 >= 0xE)
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", v9];
  }
  else
  {
    v10 = *(&off_1012F7C98 + (int)v9);
  }
  id v11 = [(GEOComposedWaypoint *)self type];
  if (v11 >= 4)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
  }
  else
  {
    v12 = *(&off_1012F7D08 + (int)v11);
  }
  v13 = +[NSString stringWithFormat:@"<%@:%p, muid: %llu, timezone: %@, location: %@, name: %@, navDisplayName: %@, navDisplayAddress: %@, directionsListAddress: %@, waypointCategory: %@, waypointType: %@, isCurrentLocation: %d, isServerProvidedWaypoint: %d>", v16, self, v15, v3, v4, v5, v6, v7, v8, v10, v12, [(GEOComposedWaypoint *)self isCurrentLocation], [(GEOComposedWaypoint *)self isServerProvidedWaypoint]];

  return v13;
}

- (id)hawkQueryRepresentation
{
  v3 = [(GEOComposedWaypoint *)self navDisplayAddress];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(GEOComposedWaypoint *)self bestLatLng];
    double v7 = v6;
    if (v6)
    {
      [v6 coordinate];
      double v9 = v8;
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v11 = +[NSNumber numberWithDouble:v9];
      id v12 = +[NSString stringWithFormat:@"%@, %@", v10, v11];
    }
    id v5 = @"<invalid>";
  }

  return v5;
}

- (BOOL)needsAdditionalNavData
{
  v3 = [(GEOComposedWaypoint *)self geoMapItem];
  BOOL v4 = [v3 _place];

  id v5 = [v4 address];
  v6 = [v5 structuredAddress];

  if ([v6 hasSubThoroughfare]) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = [v6 hasFullThoroughfare];
  }
  double v8 = [(GEOComposedWaypoint *)self geoMapItem];
  if ([v8 _hasMUID]) {
    unsigned int v9 = [v4 hasSpokenName] ^ 1;
  }
  else {
    LOBYTE(v9) = 0;
  }

  v10 = [(GEOComposedWaypoint *)self geoMapItem];
  [v10 coordinate];
  double v12 = v11;
  double v14 = v13;

  if (v7)
  {
    unsigned int v15 = [v4 hasSpokenAddress] ^ 1;
    uint64_t v16 = [v4 entryPoints];
    id v17 = [v16 count];

    if (v17) {
      char v18 = v15;
    }
    else {
      char v18 = 1;
    }
  }
  else
  {
    char v18 = 0;
  }
  BOOL v19 = v14 < -180.0;
  if (v14 > 180.0) {
    BOOL v19 = 1;
  }
  char v20 = v9 | v19;
  if (v12 < -90.0) {
    char v20 = 1;
  }
  if (v12 > 90.0) {
    char v20 = 1;
  }
  char v21 = v20 | v18;

  return v21;
}

- (NSString)arrivingDisplayName
{
  v3 = [(GEOComposedWaypoint *)self navDisplayName];
  BOOL v4 = [(GEOComposedWaypoint *)self findMyHandleID];

  if (v4)
  {
    id v5 = [(GEOComposedWaypoint *)self findMyHandle];
    uint64_t v6 = [v5 displayName];
LABEL_5:
    double v8 = (void *)v6;
    if (v6) {
      unsigned int v9 = (void *)v6;
    }
    else {
      unsigned int v9 = v3;
    }
    id v10 = v9;

    v3 = v10;
    goto LABEL_9;
  }
  unsigned int v7 = [(GEOComposedWaypoint *)self addressBookAddress];

  if (v7)
  {
    id v5 = [(GEOComposedWaypoint *)self addressBookAddress];
    uint64_t v6 = [v5 waypointCompositeName];
    goto LABEL_5;
  }
LABEL_9:

  return (NSString *)v3;
}

- (NSString)parkingDisplayName
{
  v3 = [(GEOComposedWaypoint *)self arrivingDisplayName];
  BOOL v4 = +[MNNavigationService sharedService];
  id v5 = [v4 lastLocation];

  if (v5)
  {
    [v5 coordinate];
    [(GEOComposedWaypoint *)self coordinate];
    GEOCalculateDistance();
    uint64_t v6 = +[NSString _navigation_localizedStringForDistance:context:extraDetail:](NSString, "_navigation_localizedStringForDistance:context:extraDetail:", 1, 0);
    unsigned int v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"Parking Display Address [Nav Tray Header]" value:@"localized string not found" table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6, v3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v3;
  }

  return (NSString *)v9;
}

- (MKMapItem)mkMapItem
{
  BOOL v4 = objc_getAssociatedObject(self, a2);
  if (!v4)
  {
    unsigned int v5 = [(GEOComposedWaypoint *)self isCurrentLocation];
    id v6 = objc_alloc((Class)MKMapItem);
    unsigned int v7 = [(GEOComposedWaypoint *)self geoMapItem];
    if (v5) {
      id v8 = [v6 initWithGeoMapItemAsCurrentLocation:v7];
    }
    else {
      id v8 = [v6 initWithGeoMapItem:v7 isPlaceHolderPlace:0];
    }
    BOOL v4 = v8;

    objc_setAssociatedObject(self, a2, v4, (void *)1);
  }
  id v9 = v4;

  return (MKMapItem *)v9;
}

- (CNContact)contact
{
  v3 = [(GEOComposedWaypoint *)self addressBookAddress];
  BOOL v4 = [v3 contact];

  if (!v4)
  {
    unsigned int v5 = [(GEOComposedWaypoint *)self findMyHandle];
    BOOL v4 = [v5 contact];
  }

  return (CNContact *)v4;
}

- (AddressBookAddress)addressBookAddress
{
  BOOL v4 = [(GEOComposedWaypoint *)self mapItemStorage];
  unsigned int v5 = [v4 clientAttributes];
  id v6 = [v5 addressBookAttributes];
  unsigned int v7 = [v6 contactIdentifier];

  id v8 = [(GEOComposedWaypoint *)self mapItemStorage];
  id v9 = [v8 clientAttributes];
  id v10 = [v9 addressBookAttributes];
  double v11 = [v10 addressIdentifier];

  double v12 = 0;
  if (v7 && v11)
  {
    objc_getAssociatedObject(self, a2);
    double v13 = (AddressBookAddress *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      double v13 = [[AddressBookAddress alloc] initWithCNContactIdentifier:v7 addressIdentifier:v11];
      objc_setAssociatedObject(self, a2, v13, (void *)1);
    }
    double v12 = v13;
  }

  return v12;
}

- (_TtC4Maps16MapsFindMyHandle)findMyHandle
{
  BOOL v4 = [(GEOComposedWaypoint *)self findMyHandleID];

  if (v4)
  {
    objc_getAssociatedObject(self, a2);
    unsigned int v5 = (_TtC4Maps16MapsFindMyHandle *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      id v6 = [_TtC4Maps16MapsFindMyHandle alloc];
      unsigned int v7 = [(GEOComposedWaypoint *)self findMyHandleID];
      unsigned int v5 = [(MapsFindMyHandle *)v6 initWithIdentifier:v7];

      objc_setAssociatedObject(self, a2, v5, (void *)1);
    }
    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)clearFindMyData
{
  [(GEOComposedWaypoint *)self setFindMyHandleID:0];
  [(GEOComposedWaypoint *)self setStyleAttributes:0];
  v3 = [(GEOComposedWaypoint *)self mapItemStorage];
  BOOL v4 = [v3 userValues];
  [v4 setName:0];

  unsigned int v5 = [(GEOComposedWaypoint *)self mapItemStorage];
  id v6 = [v5 clientAttributes];
  [v6 setAddressBookAttributes:0];

  [(GEOComposedWaypoint *)self recomputeGeoWaypointTyped];

  objc_setAssociatedObject(self, "findMyHandle", 0, (void *)1);
}

- (void)setUserValuesName:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(GEOComposedWaypoint *)self mapItemStorage];
  unsigned int v5 = v4;
  if (v4)
  {
    id v6 = [v4 userValues];
    unsigned int v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    id v9 = v8;

    id v10 = [v11 copy];
    [v9 setName:v10];

    [v5 setUserValues:v9];
  }
}

- (void)setAddressBookContactName:(id)a3
{
  id v5 = [a3 copy];
  BOOL v4 = [(GEOComposedWaypoint *)self _addressBookAttributes];
  [v4 setName:v5];
}

- (void)setAddressBookContactSpokenName:(id)a3
{
  id v5 = [a3 copy];
  BOOL v4 = [(GEOComposedWaypoint *)self _addressBookAttributes];
  [v4 setSpokenName:v5];
}

- (id)_addressBookAttributes
{
  v2 = [(GEOComposedWaypoint *)self mapItemStorage];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 clientAttributes];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (id)objc_opt_new();
    }
    id v8 = v6;

    id v9 = [v8 addressBookAttributes];
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_opt_new();
    }
    unsigned int v7 = v11;

    [v8 setAddressBookAttributes:v7];
    [v3 setClientAttributes:v8];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

@end