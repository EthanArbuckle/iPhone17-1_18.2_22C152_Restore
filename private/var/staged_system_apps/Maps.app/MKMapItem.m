@interface MKMapItem
+ (id)_maps_markerImageForMapItem:(id)a3 scale:(double)a4 size:(unint64_t)a5 useMarkerFallback:(BOOL)a6;
+ (id)carMapItemFromDestination:(id)a3;
+ (id)searchResultsForMapItems:(id)a3;
+ (id)searchResultsForMapItems:(id)a3 options:(id)a4;
- (BOOL)_maps_canAddToCollections;
- (BOOL)_maps_canRenameCollectionItem;
- (BOOL)_maps_isEVChargingStation;
- (BOOL)_maps_isHome;
- (BOOL)_maps_isHomeWorkOrSchool;
- (BOOL)_maps_isIncompleteVenueSearchResult;
- (BOOL)_maps_isLargeAreaPlace;
- (BOOL)_maps_isParkedCar;
- (BOOL)_maps_isSchool;
- (BOOL)_maps_isVenueOrBuilding;
- (BOOL)_maps_isWork;
- (BOOL)needsAdditionalNavData;
- (CLLocationCoordinate2D)closeUpViewCoordinate;
- (NSArray)venueAreaIdentifiers;
- (NSUUID)locationOfInterestIdentifier;
- (PersonalizedCompoundItem)personalizedCompoundItem;
- (id)_car_addressFormattedAsStreetOnly;
- (id)_flyoverAnnouncementMessageWithDefaultTitle:(id)a3;
- (id)_maps_defaultCollectionItemTitle;
- (id)_maps_detourTextForIdiom:(int64_t)a3;
- (id)_maps_detourTextForIdiom:(int64_t)a3 travelTime:(double)a4;
- (id)_maps_diffableDataSourceIdentifier;
- (id)_maps_distanceStringFromDetourInformation;
- (id)_maps_externalDeviceDictionaryRepresentation;
- (id)_maps_intentsRestaurant;
- (id)_maps_placeAreaNameWithDefaultName:(id)a3;
- (id)_maps_placeTitleWithDefaultTitle:(id)a3;
- (id)_maps_stateAndCountry;
- (id)_maps_styleAttributesForMapItem;
- (id)notificationDisplayName;
- (void)setPersonalizedCompoundItem:(id)a3;
- (void)updateModel:(id)a3;
@end

@implementation MKMapItem

- (PersonalizedCompoundItem)personalizedCompoundItem
{
  v2 = objc_getAssociatedObject(self, &off_1015E19B0);
  v3 = [v2 item];

  return (PersonalizedCompoundItem *)v3;
}

- (void)setPersonalizedCompoundItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    value = objc_alloc_init(_WeakPersonalizedCompoundItem);
    [(_WeakPersonalizedCompoundItem *)value setItem:v4];
  }
  else
  {
    value = 0;
  }
  objc_setAssociatedObject(self, &off_1015E19B0, value, (void *)1);
}

- (void)updateModel:(id)a3
{
  id v8 = a3;
  id v4 = [(MKMapItem *)self name];
  [v8 setFirstLine:v4];

  if ([(MKMapItem *)self _hasUserRatingScore])
  {
    [(MKMapItem *)self _normalizedUserRatingScore];
    v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v8 setRating:v5];
  }
  else
  {
    [v8 setRating:0];
  }
  if ([(MKMapItem *)self _hasChargerNumberString])
  {
    v6 = [(MKMapItem *)self _chargerNumberString];
    [v8 setChargerNumberString:v6];
  }
  else
  {
    [v8 setChargerNumberString:0];
  }
  v7 = [(MKMapItem *)self _car_addressFormattedAsStreetOnly];
  [v8 setSecondLine:v7];

  [v8 setMapItem:self];
  [v8 setDebugSubtitle:@"[MapItem]"];
}

- (id)_car_addressFormattedAsStreetOnly
{
  v3 = [(MKMapItem *)self _addressFormattedAsStreetOnly];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MKMapItem *)self _addressFormattedAsName];
  }
  v6 = v5;

  return v6;
}

- (id)_maps_externalDeviceDictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MKMapItem *)self name];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"DisplayName"];
  }
  uint64_t v5 = [(MKMapItem *)self placemark];
  if (v5
    && (v6 = (void *)v5,
        [(MKMapItem *)self placemark],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 coordinate],
        BOOL v8 = CLLocationCoordinate2DIsValid(v51),
        v7,
        v6,
        v8))
  {
    v9 = [(MKMapItem *)self placemark];
    [v9 coordinate];
    CLLocationDegrees v11 = v10;
    CLLocationDegrees v13 = v12;
  }
  else
  {
    [(MKMapItem *)self _coordinate];
    CLLocationDegrees v11 = v14;
    CLLocationDegrees v13 = v15;
  }
  v52.latitude = v11;
  v52.longitude = v13;
  if (CLLocationCoordinate2DIsValid(v52))
  {
    v16 = [(MKMapItem *)self placemark];
    [v16 coordinate];
    v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v49[0] = v17;
    v18 = [(MKMapItem *)self placemark];
    [v18 coordinate];
    v20 = +[NSNumber numberWithDouble:v19];
    v49[1] = v20;
    v21 = +[NSArray arrayWithObjects:v49 count:2];

    [v3 setObject:v21 forKeyedSubscript:@"CenterCoordinate"];
  }
  v41 = [(MKMapItem *)self _geoAddress];
  uint64_t v22 = [v41 formattedAddressLines];
  if (v22) {
    [v3 setObject:v22 forKeyedSubscript:@"Address"];
  }
  v42 = v3;
  v23 = [(MKMapItem *)self place];
  v24 = [v23 entryPoints];

  v25 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v24 count]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v26 = v24;
  id v27 = [v26 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        [v31 lat];
        v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v47[0] = v32;
        [v31 lng];
        v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v47[1] = v33;
        v34 = +[NSArray arrayWithObjects:v47 count:2];
        [v25 addObject:v34];
      }
      id v28 = [v26 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v28);
  }

  [v42 setObject:v25 forKeyedSubscript:@"EntryPoints"];
  v35 = +[NSLocale currentLocale];
  v36 = [v35 objectForKey:NSLocaleLanguageCode];
  [v42 setObject:v36 forKeyedSubscript:@"Locale"];
  GEOConfigGetDouble();
  v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v42 setObject:v37 forKeyedSubscript:@"CoordinateThreshold"];

  id v38 = [v42 copy];

  return v38;
}

- (id)notificationDisplayName
{
  v3 = +[NSMutableArray arrayWithCapacity:2];
  id v4 = [(MKMapItem *)self placemark];
  uint64_t v5 = [v4 name];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(MKMapItem *)self placemark];
    BOOL v8 = [v7 locality];

    if (v8)
    {
      v9 = [(MKMapItem *)self placemark];
      double v10 = [v9 name];
      [v3 addObject:v10];

      CLLocationDegrees v11 = [(MKMapItem *)self placemark];
      double v12 = [v11 locality];
      [v3 addObject:v12];

      goto LABEL_14;
    }
  }
  else
  {
  }
  CLLocationDegrees v13 = [(MKMapItem *)self placemark];
  double v14 = [v13 name];

  if (v14)
  {
    double v15 = [(MKMapItem *)self placemark];
    v16 = [v15 name];
    [v3 addObject:v16];
  }
  v17 = [(MKMapItem *)self placemark];
  v18 = [v17 thoroughfare];

  if (v18)
  {
    double v19 = [(MKMapItem *)self placemark];
    v20 = [v19 thoroughfare];
    [v3 addObject:v20];
  }
  v21 = [(MKMapItem *)self placemark];
  uint64_t v22 = [v21 locality];

  if (v22)
  {
    v23 = [(MKMapItem *)self placemark];
    v24 = [v23 locality];
    [v3 addObject:v24];
  }
  v25 = [(MKMapItem *)self placemark];
  id v26 = [v25 administrativeArea];

  if (v26)
  {
    id v27 = [(MKMapItem *)self placemark];
    id v28 = [v27 administrativeArea];
    [v3 addObject:v28];
  }
  [v3 trimToLength:2];
LABEL_14:
  if (![v3 count])
  {
    uint64_t v29 = +[NSBundle mainBundle];
    v30 = [v29 localizedStringForKey:@"Unknown Location [Report an Issue notification]" value:@"localized string not found" table:0];
    [v3 addObject:v30];
  }
  v31 = [v3 componentsJoinedByString:@",\n"];

  return v31;
}

- (NSArray)venueAreaIdentifiers
{
  v2 = [(MKMapItem *)self _geoMapItem];
  v3 = [v2 _venueInfo];

  id v4 = [v3 venueIdentifier];
  if (v4)
  {
    uint64_t v22 = v3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v4;
    id obj = [v4 componentIdentifiers];
    id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          CLLocationDegrees v11 = [v10 floorInfo];

          if (v11)
          {
            if ([v10 _hasBuildingID])
            {
              double v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 buildingID]);
            }
            else
            {
              double v12 = 0;
            }
            CLLocationDegrees v13 = [v10 floorInfo];
            double v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v13 levelID]);

            double v15 = [v10 floorInfo];
            v16 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v15 ordinal]);

            v17 = -[VenueAreaIdentifier initWithVenueID:buildingID:levelID:floorOrdinal:]([VenueAreaIdentifier alloc], "initWithVenueID:buildingID:levelID:floorOrdinal:", [v24 venueID], v12, v14, v16);
            v18 = v17;
            if (v7)
            {
              [v7 addObject:v17];
            }
            else
            {
              uint64_t v29 = v17;
              double v19 = +[NSArray arrayWithObjects:&v29 count:1];
              id v7 = [v19 mutableCopy];
            }
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    id v20 = [v7 copy];
    v3 = v22;
    id v4 = v24;
  }
  else
  {
    id v7 = 0;
    id v20 = 0;
  }

  return (NSArray *)v20;
}

- (BOOL)_maps_isVenueOrBuilding
{
  unint64_t v2 = (unint64_t)[(MKMapItem *)self _venueFeatureType];
  return (v2 > 4) | (6u >> v2) & 1;
}

- (BOOL)_maps_isIncompleteVenueSearchResult
{
  return [(MKMapItem *)self _responseStatusIsIncomplete];
}

- (BOOL)_maps_isLargeAreaPlace
{
  unint64_t v2 = [(MKMapItem *)self place];
  unsigned int v3 = [v2 type];

  return (v3 < 0x3E) & (0x2001580000010016uLL >> v3);
}

- (BOOL)_maps_isEVChargingStation
{
  unint64_t v2 = [(MKMapItem *)self _geoMapItem];
  unsigned int v3 = [v2 _poiCategory];
  unsigned __int8 v4 = [v3 isEqual:GEOPOICategoryEVCharger];

  return v4;
}

- (id)_maps_placeTitleWithDefaultTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapItem *)self place];
  unsigned int v6 = [v5 type];

  id v7 = [(MKMapItem *)self place];
  uint64_t v8 = [v7 address];
  v9 = [v8 structuredAddress];

  if (v6 == 43)
  {
    uint64_t v10 = [v9 subLocality];
    goto LABEL_5;
  }
  if (v6 == 16)
  {
    uint64_t v10 = [(MKMapItem *)self _addressFormattedAsCity];
LABEL_5:
    CLLocationDegrees v11 = (void *)v10;
    goto LABEL_7;
  }
  CLLocationDegrees v11 = 0;
LABEL_7:
  if ([v11 length]) {
    double v12 = v11;
  }
  else {
    double v12 = v4;
  }
  id v13 = v12;

  return v13;
}

- (id)_maps_placeAreaNameWithDefaultName:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapItem *)self place];
  unsigned int v6 = [v5 type];
  id v7 = 0;
  if (v6 <= 0x2B)
  {
    if (((1 << v6) & 0x80000010010) != 0)
    {
      id v7 = [(MKMapItem *)self _maps_stateAndCountry];
    }
    else if (((1 << v6) & 6) != 0)
    {
      uint64_t v8 = [v5 address];
      v9 = [v8 structuredAddress];
      id v7 = [v9 country];

      if (![v7 length])
      {
        uint64_t v10 = [v5 address];
        CLLocationDegrees v11 = [v10 structuredAddress];
        uint64_t v12 = [v11 countryCode];

        id v7 = (void *)v12;
      }
    }
  }
  if ([v7 length]) {
    id v13 = v7;
  }
  else {
    id v13 = v4;
  }
  id v14 = v13;

  return v14;
}

- (id)_maps_stateAndCountry
{
  unint64_t v2 = [(MKMapItem *)self place];
  unsigned int v3 = [v2 address];
  id v4 = [v3 structuredAddress];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v6 = [v4 administrativeArea];
  if (![v6 length])
  {
    uint64_t v7 = [v4 administrativeAreaCode];

    unsigned int v6 = (void *)v7;
  }
  if ([v6 length]) {
    [v5 setObject:v6 forKeyedSubscript:@"State"];
  }
  if (!qword_10160F888)
  {
    CFLocaleRef v8 = CFLocaleCopyCurrent();
    uint64_t v9 = [CFLocaleGetValue(v8, kCFLocaleCountryCode) lowercaseString];
    uint64_t v10 = (void *)qword_10160F888;
    qword_10160F888 = v9;

    CFRelease(v8);
  }
  CLLocationDegrees v11 = [v4 countryCode];
  uint64_t v12 = [v11 lowercaseString];

  if (([v12 isEqualToString:qword_10160F888] & 1) == 0)
  {
    id v13 = [v4 country];
    if ([v13 length]) {
      [v5 setObject:v13 forKeyedSubscript:@"Country"];
    }
  }
  id v14 = MKAddressStringForAddressDictionary();

  return v14;
}

- (id)_maps_detourTextForIdiom:(int64_t)a3
{
  id v5 = [(MKMapItem *)self _detourInfo];
  [v5 detourTime];
  double v6 = 60.0;
  if (v7 > 60.0)
  {
    CFLocaleRef v8 = [(MKMapItem *)self _detourInfo];
    [v8 detourTime];
    double v6 = v9;
  }
  uint64_t v10 = [(MKMapItem *)self _detourInfo];

  if (v10)
  {
    CLLocationDegrees v11 = [(MKMapItem *)self _maps_detourTextForIdiom:a3 travelTime:v6];
  }
  else
  {
    CLLocationDegrees v11 = 0;
  }

  return v11;
}

- (id)_maps_detourTextForIdiom:(int64_t)a3 travelTime:(double)a4
{
  id v4 = +[NSString _navigation_stringForExpectedTravelTime:2 dateUnitStyle:a4];
  id v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"Adds %@" value:@"localized string not found" table:0];
  double v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4);

  return v7;
}

- (id)_maps_distanceStringFromDetourInformation
{
  unsigned int v3 = [(MKMapItem *)self _detourInfo];

  if (v3)
  {
    id v4 = [(MKMapItem *)self _detourInfo];
    [v4 distanceToPlace];
    double v6 = v5;

    if (v6 <= 50.0)
    {
      CFLocaleRef v8 = +[NSBundle mainBundle];
      double v9 = [v8 localizedStringForKey:@"Less than %@" value:@"localized string not found" table:0];
      uint64_t v10 = +[NSString _navigation_localizedStringForDistance:0 detail:1 unitFormat:0 locale:0 useMetric:0 useYards:50.0];
      double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
    }
    else
    {
      double v7 = +[NSString _navigation_localizedStringForDistance:0 detail:1 unitFormat:0 locale:0 useMetric:0 useYards:v6];
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (NSUUID)locationOfInterestIdentifier
{
  unint64_t v2 = [(MKMapItem *)self _geoMapItem];
  unsigned int v3 = [v2 _clientAttributes];
  id v4 = [v3 routineAttributes];
  double v5 = [v4 loiIdentifier];

  return (NSUUID *)v5;
}

+ (id)_maps_markerImageForMapItem:(id)a3 scale:(double)a4 size:(unint64_t)a5 useMarkerFallback:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  uint64_t v10 = +[MKIconManager imageForMapItem:v9 size:a5 forScale:0 format:0 fallbackToBundleIcon:a4];
  if (!v10)
  {
    CLLocationDegrees v11 = [v9 _maps_styleAttributesForMapItem];
    uint64_t v10 = +[MKIconManager imageForStyle:v11 size:a5 forScale:0 format:a4];

    if (v10) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = !v6;
    }
    if (!v12)
    {
      id v13 = +[GEOFeatureStyleAttributes markerStyleAttributes];
      uint64_t v10 = +[MKIconManager imageForStyle:v13 size:a5 forScale:0 format:a4];
    }
    if (!v10 && v6)
    {
      uint64_t v10 = +[UIImage imageNamed:@"Pin-Circle"];
    }
  }

  return v10;
}

- (id)_maps_styleAttributesForMapItem
{
  if ([(MKMapItem *)self _maps_isParkedCar])
  {
    unsigned int v3 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
  }
  else if ([(MKMapItem *)self _maps_isHome])
  {
    unsigned int v3 = +[GEOFeatureStyleAttributes homeStyleAttributes];
  }
  else if ([(MKMapItem *)self _maps_isWork])
  {
    unsigned int v3 = +[GEOFeatureStyleAttributes workStyleAttributes];
  }
  else
  {
    if ([(MKMapItem *)self _maps_isSchool]) {
      +[GEOFeatureStyleAttributes schoolStyleAttributes];
    }
    else {
    unsigned int v3 = [(MKMapItem *)self _styleAttributes];
    }
  }

  return v3;
}

- (BOOL)_maps_isHomeWorkOrSchool
{
  if ([(MKMapItem *)self _maps_isHome] || [(MKMapItem *)self _maps_isWork]) {
    return 1;
  }

  return [(MKMapItem *)self _maps_isSchool];
}

- (BOOL)_maps_isHome
{
  id v4 = [(MKMapItem *)self _geoMapItem];
  double v5 = [v4 _clientAttributes];

  if (!v5) {
    goto LABEL_14;
  }
  BOOL v6 = [v5 addressBookAttributes];
  unsigned int v7 = [v6 isMe];
  if (!v7
    || ([v5 addressBookAttributes],
        unint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 addressType] != 1))
  {
    CFLocaleRef v8 = [v5 mapsSyncAttributes];
    if (v8)
    {
      unsigned int v3 = [v5 mapsSyncAttributes];
      if ([v3 secondaryObjectType] == 1)
      {
        BOOL v9 = 1;
        goto LABEL_10;
      }
    }
    uint64_t v10 = [v5 routineAttributes];
    if (v10)
    {
      CLLocationDegrees v11 = (void *)v10;
      BOOL v12 = [v5 routineAttributes];
      BOOL v9 = [v12 loiType] == 1;

      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v9 = 0;
      if (v8)
      {
LABEL_10:

        if ((v7 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    if (!v7)
    {
LABEL_12:

      if (v9) {
        goto LABEL_13;
      }
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
LABEL_11:

    goto LABEL_12;
  }

LABEL_13:
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)_maps_isWork
{
  id v4 = [(MKMapItem *)self _geoMapItem];
  double v5 = [v4 _clientAttributes];

  if (!v5) {
    goto LABEL_14;
  }
  BOOL v6 = [v5 addressBookAttributes];
  unsigned int v7 = [v6 isMe];
  if (!v7
    || ([v5 addressBookAttributes],
        unint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 addressType] != 2))
  {
    CFLocaleRef v8 = [v5 mapsSyncAttributes];
    if (v8)
    {
      unsigned int v3 = [v5 mapsSyncAttributes];
      if ([v3 secondaryObjectType] == 2)
      {
        BOOL v9 = 1;
        goto LABEL_10;
      }
    }
    uint64_t v10 = [v5 routineAttributes];
    if (v10)
    {
      CLLocationDegrees v11 = (void *)v10;
      BOOL v12 = [v5 routineAttributes];
      BOOL v9 = [v12 loiType] == 2;

      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v9 = 0;
      if (v8)
      {
LABEL_10:

        if ((v7 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    if (!v7)
    {
LABEL_12:

      if (v9) {
        goto LABEL_13;
      }
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
LABEL_11:

    goto LABEL_12;
  }

LABEL_13:
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)_maps_isSchool
{
  id v4 = [(MKMapItem *)self _geoMapItem];
  double v5 = [v4 _clientAttributes];

  if (!v5) {
    goto LABEL_14;
  }
  BOOL v6 = [v5 addressBookAttributes];
  unsigned int v7 = [v6 isMe];
  if (!v7
    || ([v5 addressBookAttributes],
        unint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 addressType] != 3))
  {
    CFLocaleRef v8 = [v5 mapsSyncAttributes];
    if (v8)
    {
      unsigned int v3 = [v5 mapsSyncAttributes];
      if ([v3 secondaryObjectType] == 3)
      {
        BOOL v9 = 1;
        goto LABEL_10;
      }
    }
    uint64_t v10 = [v5 routineAttributes];
    if (v10)
    {
      CLLocationDegrees v11 = (void *)v10;
      BOOL v12 = [v5 routineAttributes];
      BOOL v9 = [v12 loiType] == 3;

      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v9 = 0;
      if (v8)
      {
LABEL_10:

        if ((v7 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    if (!v7)
    {
LABEL_12:

      if (v9) {
        goto LABEL_13;
      }
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
LABEL_11:

    goto LABEL_12;
  }

LABEL_13:
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)_maps_isParkedCar
{
  unsigned int v3 = +[ParkedCarManager sharedManager];
  id v4 = [v3 parkedCar];

  if (v4)
  {
    double v5 = [v4 mapItem];
    BOOL v6 = [v5 _geoMapItem];
    unsigned int v7 = [(MKMapItem *)self _geoMapItem];
    char IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();
  }
  else
  {
    char IsEqualToMapItemForPurpose = 0;
  }

  return IsEqualToMapItemForPurpose;
}

- (BOOL)_maps_canAddToCollections
{
  if ([(MKMapItem *)self _hasMUID] && [(MKMapItem *)self _muid]) {
    return 1;
  }
  id v4 = [(MKMapItem *)self _styleAttributes];
  unsigned __int8 v5 = [v4 isLabelPOI];

  return v5 ^ 1;
}

- (BOOL)_maps_canRenameCollectionItem
{
  unsigned int v3 = [(MKMapItem *)self _styleAttributes];
  unsigned __int8 v4 = [v3 isLabelPOI];

  if (v4) {
    return 0;
  }
  if (([(MKMapItem *)self _isMapItemTypeAddress] & 1) != 0
    || ([(MKMapItem *)self _isMapItemTypeSettlement] & 1) != 0)
  {
    return 1;
  }

  return [(MKMapItem *)self _isMapItemTypeUnknown];
}

- (id)_maps_defaultCollectionItemTitle
{
  unsigned int v3 = [(MKMapItem *)self _styleAttributes];
  unsigned int v4 = [v3 isLabelPOI];

  if (v4) {
    [(MKMapItem *)self _addressFormattedAsName];
  }
  else {
  unsigned __int8 v5 = [(MKMapItem *)self name];
  }

  return v5;
}

- (id)_maps_intentsRestaurant
{
  unsigned int v3 = objc_opt_new();
  unsigned int v4 = [(MKMapItem *)self _restaurantLink_firstVendorID];
  [v3 setVendorIdentifier:v4];

  unsigned __int8 v5 = [(MKMapItem *)self _restaurantLink_firstProviderPlaceIdentifier];
  [v3 setRestaurantIdentifier:v5];

  BOOL v6 = [(MKMapItem *)self name];
  [v3 setName:v6];

  unsigned int v7 = [(MKMapItem *)self placemark];
  CFLocaleRef v8 = [v7 location];
  [v3 setLocation:v8];

  return v3;
}

- (BOOL)needsAdditionalNavData
{
  unsigned int v3 = [(MKMapItem *)self place];
  unsigned int v4 = [v3 address];
  unsigned __int8 v5 = [v4 structuredAddress];

  if ([v5 hasSubThoroughfare]) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = [v5 hasFullThoroughfare];
  }
  if ([(MKMapItem *)self _hasMUID]) {
    unsigned int v7 = [v3 hasSpokenName] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }
  [(MKMapItem *)self _coordinate];
  double v9 = v8;
  double v11 = v10;
  if (v6)
  {
    unsigned int v12 = [v3 hasSpokenAddress] ^ 1;
    BOOL v13 = [v3 entryPoints];
    id v14 = [v13 count];

    if (v14) {
      char v15 = v12;
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
    char v15 = 0;
  }
  BOOL v16 = v11 < -180.0;
  if (v11 > 180.0) {
    BOOL v16 = 1;
  }
  char v17 = v7 | v16;
  if (v9 < -90.0) {
    char v17 = 1;
  }
  if (v9 > 90.0) {
    char v17 = 1;
  }
  char v18 = v17 | v15;

  return v18;
}

+ (id)searchResultsForMapItems:(id)a3
{
  return +[MKMapItem searchResultsForMapItems:a3 options:0];
}

+ (id)searchResultsForMapItems:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    uint64_t v25 = MKLaunchOptionsURLKey;
    uint64_t v11 = MKLaunchOptionsReferralIdentifierKey;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v13, "isCurrentLocation", v25))
        {
          id v14 = +[SearchResult currentLocationSearchResult];
          if (v14) {
            goto LABEL_15;
          }
        }
        else
        {
          char v15 = [v13 _geoMapItem];
          BOOL v16 = [v15 addressObject];

          id v17 = v13;
          if (v16)
          {
            char v18 = +[AddressBookManager sharedManager];
            double v19 = [v18 addressForAddressObject:v16];

            if (v19)
            {
              id v20 = [v19 geocodedMapItem];

              if (v20)
              {
                uint64_t v21 = [v19 geocodedMapItem];

                id v17 = (id)v21;
              }
            }
          }
          id v14 = [[SearchResult alloc] initWithMapItem:v17];
          [(SearchResult *)v14 setOriginatedFromExternal:1];
          uint64_t v22 = [v6 objectForKeyedSubscript:v25];
          [(SearchResult *)v14 setSourceURL:v22];

          v23 = [v6 objectForKeyedSubscript:v11];
          [(SearchResult *)v14 setSourceApplication:v23];

          if (v14) {
LABEL_15:
          }
            [v7 addObject:v14];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  return v7;
}

- (CLLocationCoordinate2D)closeUpViewCoordinate
{
  [(MKMapItem *)self _coordinate];
  CLLocationDegrees latitude = v3;
  CLLocationDegrees longitude = v5;
  if ([(MKMapItem *)self _hasLookAroundStorefront])
  {
    unsigned int v7 = [(MKMapItem *)self _geoMapItem];
    id v8 = [v7 _storefrontPresentationInfo];

    id v9 = [v8 closeUpView];
    uint64_t v10 = v9;
    if (v9) {
      [v9 lookAt];
    }
    GEOLocationCoordinate2DFromOrientedPosition();
    CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
    CLLocationDegrees latitude = v13.latitude;
    CLLocationDegrees longitude = v13.longitude;
  }
  double v14 = latitude;
  double v15 = longitude;
  result.CLLocationDegrees longitude = v15;
  result.CLLocationDegrees latitude = v14;
  return result;
}

+ (id)carMapItemFromDestination:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 mapItem];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    id v5 = [v7 MKMapItem];

    if (v5)
    {
      id v8 = [[MapsLocationOfInterest alloc] initWithMapsSuggestionEntry:v7];
LABEL_15:
      id v9 = v8;
      id v5 = [(MapsLocationOfInterest *)v8 mapItem];
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    id v5 = [v7 mkMapItem];

    if (v5)
    {
      id v8 = [[MapsLocationOfInterest alloc] initWithMapsFavoriteItem:v7];
      goto LABEL_15;
    }
LABEL_17:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 geocodedMapItem];
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([v3 conformsToProtocol:&OBJC_PROTOCOL___GEOMapItem])
    {
      id v4 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v3 isPlaceHolderPlace:0];
      goto LABEL_5;
    }
    id v13 = v3;
    double v14 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
    objc_opt_class();
    id v7 = v13;
    if (objc_opt_isKindOfClass()) {
      double v15 = v7;
    }
    else {
      double v15 = 0;
    }
    id v16 = v15;

    if (v16
      && ([v16 historyEntry],
          id v17 = objc_claimAutoreleasedReturnValue(),
          unsigned int v18 = [v17 conformsToProtocol:v14],
          v17,
          v18))
    {
      id v9 = (MapsLocationOfInterest *)v7;
    }
    else
    {
      id v9 = 0;
    }

    if (v9)
    {
      id v21 = 0;
      double v19 = [(MapsLocationOfInterest *)v9 historyEntry];
      +[SearchResult newStartWaypointSearchResult:0 endWaypointSearchResult:&v21 forRouteHistoryEntry:v19];
      id v20 = v21;

      id v5 = [v20 mapItem];
    }
    else
    {
      id v5 = 0;
    }
    goto LABEL_16;
  }
  id v10 = v3;
  id v11 = objc_alloc((Class)MKMapItem);
  CLLocationDegrees v12 = [v10 geoMapItem];

  id v5 = [v11 initWithGeoMapItem:v12 isPlaceHolderPlace:0];
LABEL_6:

  return v5;
}

- (id)_maps_diffableDataSourceIdentifier
{
  if ([(MKMapItem *)self isCurrentLocation])
  {
    id v3 = @"CurrentLocation";
  }
  else
  {
    id v4 = [(MKMapItem *)self _identifier];
    id v5 = v4;
    if (v4)
    {
      [v4 _maps_diffableDataSourceIdentifier];
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [(MKMapItem *)self _coordinate];
      id v3 = 0;
      if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
      {
        id v8 = +[NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&v6, *(void *)&v7];
        id v3 = +[NSString stringWithFormat:@"MarkedLocation(%@)", v8];
      }
    }
  }

  return v3;
}

- (id)_flyoverAnnouncementMessageWithDefaultTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapItem *)self _flyoverAnnouncementMessage];
  if (!v5)
  {
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"3D Flyover Tour" value:@"localized string not found" table:0];
    id v5 = +[NSString stringWithFormat:@"%@ - %@", v7, v4];
  }

  return v5;
}

@end