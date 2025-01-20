@interface MOEventRoutine
+ (BOOL)supportsSecureCoding;
+ (id)descriptionOfMode:(unint64_t)a3;
+ (id)stringOfMapItemPlaceType:(unint64_t)a3;
+ (id)stringOfPlaceInferencePlaceType:(unint64_t)a3;
+ (id)stringOfPlaceUserType:(unint64_t)a3;
- (BOOL)isHighConfidence;
- (BOOL)isInvalid;
- (BOOL)isPreOnboardedVisit;
- (GEOAddressObject)geoAddressObject;
- (MOEventRoutine)init;
- (MOEventRoutine)initWithCoder:(id)a3;
- (MOWeather)predominantWeather;
- (NSData)placeMapItem;
- (NSString)placeName;
- (NSString)poiCategory;
- (RTAddress)address;
- (RTLocation)location;
- (RTLocation)mapItemLocation;
- (double)distanceFromVisitToPlace;
- (double)familiarityIndexLOI;
- (double)placeNameConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formatAddressCurrentFormatWithFallback:(BOOL)a3;
- (id)formatAddressParkingDisplayNameWithFallback:(BOOL)a3;
- (id)formatAddressWithFormatOption:(id)a3;
- (id)formatAdministrativeAreaWithFormatOption:(id)a3;
- (id)formatCountryWithFormatOption:(id)a3;
- (id)formatLocalityWithFormatOption:(id)a3;
- (unint64_t)mapItemID;
- (unint64_t)mapItemPlaceType;
- (unint64_t)mode;
- (unint64_t)placeDiscovery;
- (unint64_t)placeSource;
- (unint64_t)placeType;
- (unint64_t)placeUserType;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setDistanceFromVisitToPlace:(double)a3;
- (void)setFamiliarityIndexLOI:(double)a3;
- (void)setGeoAddressObject:(id)a3;
- (void)setIsHighConfidence:(BOOL)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setIsPreOnboardedVisit:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMapItemID:(unint64_t)a3;
- (void)setMapItemLocation:(id)a3;
- (void)setMapItemPlaceType:(unint64_t)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPlaceDiscovery:(unint64_t)a3;
- (void)setPlaceMapItem:(id)a3;
- (void)setPlaceName:(id)a3;
- (void)setPlaceNameConfidence:(double)a3;
- (void)setPlaceSource:(unint64_t)a3;
- (void)setPlaceType:(unint64_t)a3;
- (void)setPlaceUserType:(unint64_t)a3;
- (void)setPoiCategory:(id)a3;
- (void)setPredominantWeather:(id)a3;
@end

@implementation MOEventRoutine

- (MOEventRoutine)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOEventRoutine;
  result = [(MOEventRoutine *)&v3 init];
  if (result) {
    result->_isInvalid = 0;
  }
  return result;
}

+ (id)descriptionOfMode:(unint64_t)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"Local";
  }
  if (a3 == 2) {
    return @"Tourist";
  }
  else {
    return (id)v3;
  }
}

+ (id)stringOfPlaceUserType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id result = @"Home";
      break;
    case 2uLL:
      id result = @"Work";
      break;
    case 3uLL:
      id result = @"School";
      break;
    case 4uLL:
      id result = @"Gym";
      break;
    default:
      if (a3 == 100) {
        id result = @"Outing";
      }
      else {
        id result = @"Unknown";
      }
      break;
  }
  return result;
}

+ (id)stringOfPlaceInferencePlaceType:(unint64_t)a3
{
  id result = @"Unknown";
  if ((uint64_t)a3 > 99)
  {
    CFStringRef v4 = @"State";
    CFStringRef v5 = @"Country";
    if (a3 != 102) {
      CFStringRef v5 = @"Unknown";
    }
    if (a3 != 101) {
      CFStringRef v4 = v5;
    }
    if (a3 == 100) {
      return @"City";
    }
    else {
      return (id)v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        id result = @"NonClassified";
        break;
      case 2uLL:
        id result = @"AreaOfInterest";
        break;
      case 3uLL:
        id result = @"PointOfInterest";
        break;
      case 4uLL:
        id result = @"Address";
        break;
      case 5uLL:
        id result = @"CoarseAddress";
        break;
      case 6uLL:
        id result = @"Custom";
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)stringOfMapItemPlaceType:(unint64_t)a3
{
  id result = @"AreaOfInterest";
  switch(a3)
  {
    case 0uLL:
      id result = @"Unknown";
      break;
    case 1uLL:
      return result;
    case 2uLL:
      id result = @"PointOfInterest";
      break;
    case 3uLL:
      id result = @"Address";
      break;
    case 4uLL:
    case 5uLL:
      id result = @"Country";
      break;
    case 6uLL:
      id result = @"AdministrativeArea";
      break;
    case 7uLL:
      id result = @"Locality";
      break;
    case 8uLL:
      id result = @"TimeZone";
      break;
    case 9uLL:
      id result = @"SubLocality";
      break;
    case 0xAuLL:
      id result = @"Ocean";
      break;
    case 0xBuLL:
      id result = @"InlandWater";
      break;
    case 0xCuLL:
      id result = @"Island";
      break;
    case 0xDuLL:
      id result = @"Street";
      break;
    case 0xEuLL:
      id result = @"Admin";
      break;
    case 0xFuLL:
      id result = @"Postal";
      break;
    case 0x10uLL:
      id result = @"Intersection";
      break;
    case 0x11uLL:
      id result = @"Building";
      break;
    case 0x12uLL:
      id result = @"Continent";
      break;
    case 0x13uLL:
      id result = @"Region";
      break;
    case 0x14uLL:
      id result = @"Division";
      break;
    default:
      if (a3 == 1000) {
        id result = @"Undefined";
      }
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isInvalid = self->_isInvalid;
  id v6 = a3;
  [v6 encodeBool:isInvalid forKey:@"isInvalid"];
  [v6 encodeBool:self->_isHighConfidence forKey:@"isHighConfidence"];
  [v6 encodeObject:self->_placeName forKey:@"placeName"];
  [v6 encodeObject:self->_location forKey:@"location"];
  [v6 encodeInteger:self->_placeType forKey:@"placeType"];
  [v6 encodeInteger:self->_placeUserType forKey:@"placeUserType"];
  [v6 encodeInteger:self->_mode forKey:@"mode"];
  [v6 encodeInteger:self->_placeDiscovery forKey:@"placeDiscovery"];
  [v6 encodeObject:self->_address forKey:@"address"];
  [v6 encodeObject:self->_geoAddressObject forKey:@"geoAddressObject"];
  double placeNameConfidence = self->_placeNameConfidence;
  *(float *)&double placeNameConfidence = placeNameConfidence;
  [v6 encodeFloat:@"placeNameConfidence" forKey:placeNameConfidence];
  [v6 encodeObject:self->_placeMapItem forKey:@"placeMapItem"];
  [v6 encodeObject:self->_poiCategory forKey:@"poiCategory"];
  [v6 encodeDouble:@"familiarityIndexLOI" forKey:self->_familiarityIndexLOI];
  [v6 encodeInteger:self->_placeSource forKey:@"placeSource"];
  [v6 encodeObject:self->_predominantWeather forKey:@"predominantWeather"];
  [v6 encodeBool:self->_isPreOnboardedVisit forKey:@"isPreOnboardedVisit"];
  [v6 encodeObject:self->_mapItemLocation forKey:@"mapItemLocation"];
  [v6 encodeInteger:self->_mapItemID forKey:@"mapItemID"];
}

- (MOEventRoutine)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MOEventRoutine;
  CFStringRef v5 = [(MOEventRoutine *)&v25 init];
  if (v5)
  {
    v5->_BOOL isInvalid = [v4 decodeBoolForKey:@"isInvalid"];
    v5->_isHighConfidence = [v4 decodeBoolForKey:@"isHighConfidence"];
    v5->_isPreOnboardedVisit = [v4 decodeBoolForKey:@"isPreOnboardedVisit"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeName"];
    placeName = v5->_placeName;
    v5->_placeName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (RTLocation *)v8;

    v5->_placeType = (unint64_t)[v4 decodeIntegerForKey:@"placeType"];
    v5->_placeUserType = (unint64_t)[v4 decodeIntegerForKey:@"placeUserType"];
    v5->_mode = (unint64_t)[v4 decodeIntegerForKey:@"mode"];
    v5->_placeDiscovery = (int)[v4 decodeIntForKey:@"placeDiscovery"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (RTAddress *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoAddressObject"];
    geoAddressObject = v5->_geoAddressObject;
    v5->_geoAddressObject = (GEOAddressObject *)v12;

    [v4 decodeFloatForKey:@"placeNameConfidence"];
    v5->_double placeNameConfidence = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeMapItem"];
    placeMapItem = v5->_placeMapItem;
    v5->_placeMapItem = (NSData *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"poiCategory"];
    poiCategory = v5->_poiCategory;
    v5->_poiCategory = (NSString *)v17;

    [v4 decodeDoubleForKey:@"familiarityIndexLOI"];
    v5->_familiarityIndexLOI = v19;
    v5->_placeSource = (unint64_t)[v4 decodeIntegerForKey:@"placeSource"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predominantWeather"];
    predominantWeather = v5->_predominantWeather;
    v5->_predominantWeather = (MOWeather *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItemLocation"];
    mapItemLocation = v5->_mapItemLocation;
    v5->_mapItemLocation = (RTLocation *)v22;

    v5->_mapItemID = (unint64_t)[v4 decodeIntegerForKey:@"mapItemID"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventRoutine);
  v4->_BOOL isInvalid = self->_isInvalid;
  v4->_isHighConfidence = self->_isHighConfidence;
  objc_storeStrong((id *)&v4->_address, self->_address);
  objc_storeStrong((id *)&v4->_geoAddressObject, self->_geoAddressObject);
  v4->_mode = self->_mode;
  objc_storeStrong((id *)&v4->_location, self->_location);
  objc_storeStrong((id *)&v4->_placeName, self->_placeName);
  v4->_placeType = self->_placeType;
  v4->_placeSource = self->_placeSource;
  objc_storeStrong((id *)&v4->_poiCategory, self->_poiCategory);
  v4->_placeDiscovery = self->_placeDiscovery;
  objc_storeStrong((id *)&v4->_placeMapItem, self->_placeMapItem);
  v4->_placeUserType = self->_placeUserType;
  objc_storeStrong((id *)&v4->_predominantWeather, self->_predominantWeather);
  v4->_familiarityIndexLOI = self->_familiarityIndexLOI;
  v4->_double placeNameConfidence = self->_placeNameConfidence;
  v4->_isPreOnboardedVisit = self->_isPreOnboardedVisit;
  objc_storeStrong((id *)&v4->_mapItemLocation, self->_mapItemLocation);
  v4->_mapItemID = self->_mapItemID;
  return v4;
}

- (id)description
{
  id v16 = objc_alloc((Class)NSString);
  uint64_t v15 = [(NSString *)self->_placeName mask];
  double placeNameConfidence = self->_placeNameConfidence;
  id v4 = +[MOEventRoutine descriptionOfMode:[(MOEventRoutine *)self mode]];
  unint64_t placeDiscovery = self->_placeDiscovery;
  BOOL isHighConfidence = self->_isHighConfidence;
  BOOL isInvalid = self->_isInvalid;
  BOOL isPreOnboardedVisit = self->_isPreOnboardedVisit;
  poiCategory = self->_poiCategory;
  unint64_t placeSource = self->_placeSource;
  v11 = [(id)objc_opt_class() stringOfPlaceInferencePlaceType:self->_placeType];
  uint64_t v12 = [(id)objc_opt_class() stringOfMapItemPlaceType:self->_mapItemPlaceType];
  id v13 = [v16 initWithFormat:@"placeName, %@, confidence, %f, locationMode, %@, new place, %lu, isHighConfidence, %d, isInvalid, %d, isPreOnboardedVisit, %d, poiCategory, %@, placeSource, %lu, placeType, %@, mapItemPlaceType, %@, userType, %lu, predominantWeather %@,familiarityIndexLOI, %.2f, mapItem, %lu", v15, *(void *)&placeNameConfidence, v4, placeDiscovery, isHighConfidence, isInvalid, isPreOnboardedVisit, poiCategory, placeSource, v11, v12, self->_placeUserType, self->_predominantWeather, *(void *)&self->_familiarityIndexLOI, self->_mapItemID];

  return v13;
}

- (id)formatAddressCurrentFormatWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = [(RTAddress *)self->_address countryCode];
  unsigned int v7 = [v6 containsString:@"US"];

  if (v7)
  {
    uint64_t v8 = [(RTAddress *)self->_address getPreferredName];
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    uint64_t v10 = NSStringFromSelector(a2);
    v11 = [(RTAddress *)self->_address countryCode];
    int v16 = 138412802;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    double v19 = v11;
    __int16 v20 = 2112;
    v21 = v8;
    uint64_t v12 = "%@, country code, %@, using current format output string, %@";
    id v13 = v9;
    uint32_t v14 = 32;
  }
  else
  {
    uint64_t v8 = [(MOEventRoutine *)self formatAddressParkingDisplayNameWithFallback:v3];
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    uint64_t v10 = NSStringFromSelector(a2);
    v11 = [(RTAddress *)self->_address countryCode];
    int v16 = 138413058;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    double v19 = v11;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v3;
    uint64_t v12 = "%@, country code, %@, using parking display name output string, %@, fallback, %i";
    id v13 = v9;
    uint32_t v14 = 38;
  }
  _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v16, v14);

LABEL_5:

  return v8;
}

- (id)formatAddressParkingDisplayNameWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = [(GEOAddressObject *)self->_geoAddressObject parkingDisplayName];
  unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint32_t v14 = NSStringFromSelector(a2);
    int v16 = 138412802;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    double v19 = v6;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, parkingDisplayName output string, %@, fallback, %i", (uint8_t *)&v16, 0x1Cu);
  }
  if ([v6 length]) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v3;
  }
  if (v8)
  {
    v9 = v6;
  }
  else
  {
    v9 = [(GEOAddressObject *)self->_geoAddressObject shortAddress];

    uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(MOEventRoutine *)a2 formatAddressParkingDisplayNameWithFallback:v10];
    }
  }
  uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = NSStringFromSelector(a2);
    int v16 = 138412802;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    double v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@, output string, %@, fallback, %i", (uint8_t *)&v16, 0x1Cu);
  }

  return v9;
}

- (id)formatAddressWithFormatOption:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"currentFormat"])
  {
    uint64_t v6 = [(MOEventRoutine *)self formatAddressCurrentFormatWithFallback:1];
LABEL_7:
    unsigned int v7 = (void *)v6;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"shortAddress"])
  {
    uint64_t v6 = [(GEOAddressObject *)self->_geoAddressObject shortAddress];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"parkingDisplayName"])
  {
    uint64_t v6 = [(MOEventRoutine *)self formatAddressParkingDisplayNameWithFallback:1];
    goto LABEL_7;
  }
  unsigned __int8 v10 = [v5 isEqualToString:@"aboveDoorShortAddress"];
  unsigned int v7 = [(GEOAddressObject *)self->_geoAddressObject aboveDoorShortAddress];
  if ((v10 & 1) == 0)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(a2);
      int v14 = 138412802;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      double v19 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v14, 0x20u);
    }
  }
LABEL_8:
  BOOL v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    double v19 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v14, 0x20u);
  }

  return v7;
}

- (id)formatLocalityWithFormatOption:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"currentFormat"])
  {
    uint64_t v6 = [(RTAddress *)self->_address locality];
    unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
LABEL_13:
    v9 = NSStringFromSelector(a2);
    int v10 = 138412802;
    v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v10, 0x20u);
    goto LABEL_14;
  }
  if (([v5 isEqualToString:@"shortAddress"] & 1) != 0
    || ([v5 isEqualToString:@"parkingDisplayName"] & 1) != 0
    || [v5 isEqualToString:@"aboveDoorShortAddress"])
  {
    uint64_t v6 = [(GEOAddressObject *)self->_geoAddressObject cityDisplayNameWithFallback:1];
    unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  uint64_t v6 = [(GEOAddressObject *)self->_geoAddressObject cityDisplayNameWithFallback:1];
  unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    goto LABEL_8;
  }
  v9 = NSStringFromSelector(a2);
  int v10 = 138412802;
  v11 = v9;
  __int16 v12 = 2112;
  id v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v10, 0x20u);
LABEL_14:

LABEL_8:

  return v6;
}

- (id)formatAdministrativeAreaWithFormatOption:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"currentFormat"])
  {
    uint64_t v6 = [(RTAddress *)self->_address administrativeArea];
    unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  if (([v5 isEqualToString:@"shortAddress"] & 1) == 0
    && ([v5 isEqualToString:@"parkingDisplayName"] & 1) == 0
    && ![v5 isEqualToString:@"aboveDoorShortAddress"])
  {
    uint64_t v6 = [(RTAddress *)self->_address administrativeArea];
    unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v10 = NSStringFromSelector(a2);
    int v11 = 138412802;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v11, 0x20u);
    goto LABEL_16;
  }
  BOOL v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(MOEventRoutine *)a2 formatAdministrativeAreaWithFormatOption:v8];
  }

  uint64_t v6 = [(RTAddress *)self->_address administrativeArea];
  unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
LABEL_15:
    int v10 = NSStringFromSelector(a2);
    int v11 = 138412802;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v11, 0x20u);
LABEL_16:
  }
LABEL_10:

  return v6;
}

- (id)formatCountryWithFormatOption:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"currentFormat"])
  {
    uint64_t v6 = [(RTAddress *)self->_address country];
    unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
LABEL_13:
    v9 = NSStringFromSelector(a2);
    int v11 = 138412802;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    int v10 = "%@, format option, %@, output string, %@";
    goto LABEL_14;
  }
  if (([v5 isEqualToString:@"shortAddress"] & 1) != 0
    || ([v5 isEqualToString:@"parkingDisplayName"] & 1) != 0
    || [v5 isEqualToString:@"aboveDoorShortAddress"])
  {
    uint64_t v6 = [(GEOAddressObject *)self->_geoAddressObject countryName];
    unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  uint64_t v6 = [(GEOAddressObject *)self->_geoAddressObject countryName];
  unsigned int v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_8;
  }
  v9 = NSStringFromSelector(a2);
  int v11 = 138412802;
  __int16 v12 = v9;
  __int16 v13 = 2112;
  id v14 = v5;
  __int16 v15 = 2112;
  __int16 v16 = v6;
  int v10 = "%@, unrecognized format option, %@, will use default, %@";
LABEL_14:
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v11, 0x20u);

LABEL_8:

  return v6;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_BOOL isInvalid = a3;
}

- (BOOL)isPreOnboardedVisit
{
  return self->_isPreOnboardedVisit;
}

- (void)setIsPreOnboardedVisit:(BOOL)a3
{
  self->_BOOL isPreOnboardedVisit = a3;
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (void)setIsHighConfidence:(BOOL)a3
{
  self->_BOOL isHighConfidence = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (unint64_t)placeUserType
{
  return self->_placeUserType;
}

- (void)setPlaceUserType:(unint64_t)a3
{
  self->_placeUserType = a3;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(double)a3
{
  self->_double placeNameConfidence = a3;
}

- (unint64_t)placeDiscovery
{
  return self->_placeDiscovery;
}

- (void)setPlaceDiscovery:(unint64_t)a3
{
  self->_unint64_t placeDiscovery = a3;
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (RTAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (GEOAddressObject)geoAddressObject
{
  return self->_geoAddressObject;
}

- (void)setGeoAddressObject:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSData)placeMapItem
{
  return self->_placeMapItem;
}

- (void)setPlaceMapItem:(id)a3
{
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
}

- (unint64_t)placeSource
{
  return self->_placeSource;
}

- (void)setPlaceSource:(unint64_t)a3
{
  self->_unint64_t placeSource = a3;
}

- (unint64_t)mapItemPlaceType
{
  return self->_mapItemPlaceType;
}

- (void)setMapItemPlaceType:(unint64_t)a3
{
  self->_mapItemPlaceType = a3;
}

- (RTLocation)mapItemLocation
{
  return self->_mapItemLocation;
}

- (void)setMapItemLocation:(id)a3
{
}

- (unint64_t)mapItemID
{
  return self->_mapItemID;
}

- (void)setMapItemID:(unint64_t)a3
{
  self->_mapItemID = a3;
}

- (double)distanceFromVisitToPlace
{
  return self->_distanceFromVisitToPlace;
}

- (void)setDistanceFromVisitToPlace:(double)a3
{
  self->_distanceFromVisitToPlace = a3;
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  self->_familiarityIndexLOI = a3;
}

- (MOWeather)predominantWeather
{
  return self->_predominantWeather;
}

- (void)setPredominantWeather:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predominantWeather, 0);
  objc_storeStrong((id *)&self->_mapItemLocation, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_placeMapItem, 0);
  objc_storeStrong((id *)&self->_geoAddressObject, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_placeName, 0);
}

- (void)formatAddressParkingDisplayNameWithFallback:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  id v4 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_2();
  __int16 v6 = 1024;
  int v7 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, shortAddress output string, %@, fallback, %i", v5, 0x1Cu);
}

- (void)formatAdministrativeAreaWithFormatOption:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  id v4 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@, short address format doesn't support the administrative area (state), option, %@, will use default", v5, 0x16u);
}

@end