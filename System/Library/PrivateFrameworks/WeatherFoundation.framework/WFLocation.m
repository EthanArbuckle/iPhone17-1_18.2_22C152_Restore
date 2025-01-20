@interface WFLocation
+ (BOOL)supportsSecureCoding;
+ (id)knownKeys;
+ (id)locationsByConsolidatingDuplicates:(id)a3 originalOrder:(id)a4;
+ (id)locationsByConsolidatingDuplicatesInBucket:(id)a3;
+ (id)locationsByFilteringDuplicates:(id)a3;
+ (int64_t)currentArchiveVersion;
- (BOOL)isDay;
- (BOOL)isDayForDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsGeocoding;
- (BOOL)shouldQueryForAirQualityData;
- (CLLocation)geoLocation;
- (NSDate)creationDate;
- (NSString)city;
- (NSString)country;
- (NSString)countryAbbreviation;
- (NSString)county;
- (NSString)displayName;
- (NSString)locationID;
- (NSString)state;
- (NSString)stateAbbreviation;
- (NSString)weatherDisplayName;
- (NSString)weatherLocationName;
- (NSString)wf_weatherChannelGeocodeValue;
- (NSTimeZone)timeZone;
- (WFLocation)initWithCloudDictionaryRepresentation:(id)a3;
- (WFLocation)initWithCoder:(id)a3;
- (WFLocation)initWithLocalDataRepresentation:(id)a3;
- (WFLocation)initWithMapItem:(id)a3;
- (WFLocation)initWithMapItem:(id)a3 isCurrentLocation:(BOOL)a4;
- (WFLocation)initWithPlacemark:(id)a3;
- (WFLocation)initWithSearchResponse:(id)a3;
- (id)_sunAlmanacForDate:(id)a3;
- (id)cloudDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localDataRepresentation;
- (id)summary;
- (id)summaryThatIsCompact:(BOOL)a3;
- (id)sunriseForDate:(id)a3;
- (id)sunsetForDate:(id)a3;
- (int64_t)archiveVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArchiveVersion:(int64_t)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCountryAbbreviation:(id)a3;
- (void)setCounty:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGeoLocation:(id)a3;
- (void)setLocationID:(id)a3;
- (void)setState:(id)a3;
- (void)setStateAbbreviation:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeatherDisplayName:(id)a3;
- (void)setWeatherLocationName:(id)a3;
- (void)sunrise:(id *)a3 andSunset:(id *)a4 forDate:(id)a5;
@end

@implementation WFLocation

+ (int64_t)currentArchiveVersion
{
  return 1;
}

- (WFLocation)initWithSearchResponse:(id)a3
{
  v4 = [a3 mapItems];
  v5 = [v4 firstObject];

  v6 = [(WFLocation *)self initWithMapItem:v5];
  return v6;
}

- (WFLocation)initWithMapItem:(id)a3
{
  return [(WFLocation *)self initWithMapItem:a3 isCurrentLocation:0];
}

- (WFLocation)initWithMapItem:(id)a3 isCurrentLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  v8 = [v6 placemark];
  self = [(WFLocation *)self initWithPlacemark:v8];

  if (self)
  {
    v9 = [v7 timeZone];
    if (!v9 && v4)
    {
      v9 = [MEMORY[0x263EFFA18] localTimeZone];
    }
    objc_storeStrong((id *)&self->_timeZone, v9);
    if (self->_timeZone)
    {
      v10 = [v7 _weatherDisplayName];
      v11 = (NSString *)[v10 copy];
      weatherDisplayName = self->_weatherDisplayName;
      self->_weatherDisplayName = v11;

      v13 = [v7 _weatherLocationName];
      v14 = (NSString *)[v13 copy];
      weatherLocationName = self->_weatherLocationName;
      self->_weatherLocationName = v14;

      goto LABEL_8;
    }

LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
LABEL_8:
  self = self;
  v16 = self;
LABEL_11:

  return v16;
}

- (WFLocation)initWithPlacemark:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v32.receiver = self;
    v32.super_class = (Class)WFLocation;
    v5 = [(WFLocation *)&v32 init];
    if (v5)
    {
      id v6 = [v4 location];
      uint64_t v7 = [v6 copy];
      geoLocation = v5->_geoLocation;
      v5->_geoLocation = (CLLocation *)v7;

      uint64_t v9 = WFLocationNameForPlacemark(v4);
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v9;

      v11 = [v4 locality];
      uint64_t v12 = [v11 copy];
      city = v5->_city;
      v5->_city = (NSString *)v12;

      v14 = [v4 subAdministrativeArea];
      uint64_t v15 = [v14 copy];
      county = v5->_county;
      v5->_county = (NSString *)v15;

      v17 = [v4 administrativeArea];
      uint64_t v18 = [v17 copy];
      state = v5->_state;
      v5->_state = (NSString *)v18;

      v20 = [v4 country];
      uint64_t v21 = [v20 copy];
      country = v5->_country;
      v5->_country = (NSString *)v21;

      v23 = [v4 ISOcountryCode];
      uint64_t v24 = [v23 copy];
      countryAbbreviation = v5->_countryAbbreviation;
      v5->_countryAbbreviation = (NSString *)v24;

      v5->_archiveVersion = [(id)objc_opt_class() currentArchiveVersion];
      uint64_t v26 = [MEMORY[0x263EFF910] date];
      creationDate = v5->_creationDate;
      v5->_creationDate = (NSDate *)v26;

      v28 = WFLogForCategory(3uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(WFLocation *)v5 description];
        *(_DWORD *)buf = 138412290;
        v34 = v29;
        _os_log_impl(&dword_21C988000, v28, OS_LOG_TYPE_DEFAULT, "Initialized a new location: %@", buf, 0xCu);
      }
    }
    self = v5;
    v30 = self;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(WFLocation *)self city];
    uint64_t v7 = [v5 city];
    if ([v6 isEqualToString:v7])
    {
      double v8 = 30000.0;
    }
    else
    {
      v10 = [(WFLocation *)self city];
      if (v10)
      {
        double v8 = 5000.0;
      }
      else
      {
        v11 = [v5 city];
        double v8 = dbl_21C9D8E30[v11 == 0];
      }
    }

    uint64_t v12 = [(WFLocation *)self geoLocation];
    v13 = [v5 geoLocation];
    char v9 = objc_msgSend(v12, "wf_isEquivalentToLocation:tolerance:", v13, v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(WFLocation *)self geoLocation];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)knownKeys
{
  return &unk_26CD65318;
}

- (id)summaryThatIsCompact:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F089D8] string];
  id v6 = [NSString stringWithFormat:@"%@ <0x%x>", objc_opt_class(), self];
  [v5 appendString:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(id)objc_opt_class() knownKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    if (v3) {
      v11 = @" %@:%@";
    }
    else {
      v11 = @"\n      %@ : %@";
    }
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [(WFLocation *)self valueForKey:v13];
        uint64_t v15 = (void *)v14;
        if (v14) {
          objc_msgSend(v5, "appendFormat:", v11, v13, v14, (void)v17);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v5;
}

- (BOOL)needsGeocoding
{
  BOOL v3 = [(WFLocation *)self countryAbbreviation];
  if (v3)
  {
    id v4 = [(WFLocation *)self timeZone];
    if (v4)
    {
      id v5 = [(WFLocation *)self weatherDisplayName];
      if (v5)
      {
        id v6 = [(WFLocation *)self weatherLocationName];
        BOOL v7 = v6 == 0;
      }
      else
      {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)summary
{
  return [(WFLocation *)self summaryThatIsCompact:0];
}

- (id)description
{
  return [(WFLocation *)self summaryThatIsCompact:1];
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = [(WFLocation *)self city];
  [v17 encodeObject:v4 forKey:@"WFLocationCodingCity"];

  id v5 = [(WFLocation *)self county];
  [v17 encodeObject:v5 forKey:@"WFLocationCodingCounty"];

  id v6 = [(WFLocation *)self state];
  [v17 encodeObject:v6 forKey:@"WFLocationCodingState"];

  BOOL v7 = [(WFLocation *)self stateAbbreviation];
  [v17 encodeObject:v7 forKey:@"WFLocationCodingStateAbbreviation"];

  uint64_t v8 = [(WFLocation *)self country];
  [v17 encodeObject:v8 forKey:@"WFLocationCodingCountry"];

  uint64_t v9 = [(WFLocation *)self countryAbbreviation];
  [v17 encodeObject:v9 forKey:@"WFLocationCodingCountryAbbreviation"];

  uint64_t v10 = [(WFLocation *)self geoLocation];
  [v17 encodeObject:v10 forKey:@"WFLocationCodingGeoLocation"];

  v11 = [(WFLocation *)self locationID];
  [v17 encodeObject:v11 forKey:@"WFLocationCodingLocationID"];

  uint64_t v12 = [(WFLocation *)self timeZone];
  [v17 encodeObject:v12 forKey:@"WFLocationCodingTimeZone"];

  uint64_t v13 = [(WFLocation *)self creationDate];
  [v17 encodeObject:v13 forKey:@"WFLocationCodingCreationDate"];

  uint64_t v14 = [(WFLocation *)self displayName];
  [v17 encodeObject:v14 forKey:@"WFLocationDisplayName"];

  uint64_t v15 = [(WFLocation *)self weatherDisplayName];
  [v17 encodeObject:v15 forKey:@"WFLocationWeatherDisplayNameKey"];

  v16 = [(WFLocation *)self weatherLocationName];
  [v17 encodeObject:v16 forKey:@"WFLocationWeatherLacationName"];

  objc_msgSend(v17, "encodeInteger:forKey:", -[WFLocation archiveVersion](self, "archiveVersion"), @"WFLocationArchiveVersion");
}

- (WFLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)WFLocation;
  id v5 = [(WFLocation *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingCity"];
    city = v5->_city;
    v5->_city = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingCounty"];
    county = v5->_county;
    v5->_county = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingState"];
    state = v5->_state;
    v5->_state = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingStateAbbreviation"];
    stateAbbreviation = v5->_stateAbbreviation;
    v5->_stateAbbreviation = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingCountry"];
    country = v5->_country;
    v5->_country = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingCountryAbbreviation"];
    countryAbbreviation = v5->_countryAbbreviation;
    v5->_countryAbbreviation = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingGeoLocation"];
    geoLocation = v5->_geoLocation;
    v5->_geoLocation = (CLLocation *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingLocationID"];
    locationID = v5->_locationID;
    v5->_locationID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingTimeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationCodingCreationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationDisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationWeatherDisplayNameKey"];
    weatherDisplayName = v5->_weatherDisplayName;
    v5->_weatherDisplayName = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFLocationWeatherLacationName"];
    weatherLocationName = v5->_weatherLocationName;
    v5->_weatherLocationName = (NSString *)v30;

    uint64_t v32 = [v4 decodeIntegerForKey:@"WFLocationArchiveVersion"];
    v5->_archiveVersion = v32;
    if (!v32) {
      uint64_t v32 = [(id)objc_opt_class() currentArchiveVersion];
    }
    v5->_archiveVersion = v32;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  id v5 = [(WFLocation *)self city];
  [v4 setCity:v5];

  uint64_t v6 = [(WFLocation *)self state];
  [v4 setState:v6];

  BOOL v7 = [(WFLocation *)self county];
  [v4 setCounty:v7];

  uint64_t v8 = [(WFLocation *)self country];
  [v4 setCountry:v8];

  uint64_t v9 = [(WFLocation *)self stateAbbreviation];
  [v4 setStateAbbreviation:v9];

  uint64_t v10 = [(WFLocation *)self countryAbbreviation];
  [v4 setCountryAbbreviation:v10];

  v11 = [(WFLocation *)self displayName];
  [v4 setDisplayName:v11];

  uint64_t v12 = [(WFLocation *)self weatherDisplayName];
  [v4 setWeatherDisplayName:v12];

  uint64_t v13 = [(WFLocation *)self weatherLocationName];
  [v4 setWeatherLocationName:v13];

  uint64_t v14 = [(WFLocation *)self creationDate];
  [v4 setCreationDate:v14];

  uint64_t v15 = [(WFLocation *)self geoLocation];
  [v4 setGeoLocation:v15];

  uint64_t v16 = [(WFLocation *)self locationID];
  [v4 setLocationID:v16];

  id v17 = [(WFLocation *)self timeZone];
  [v4 setTimeZone:v17];

  objc_msgSend(v4, "setArchiveVersion:", -[WFLocation archiveVersion](self, "archiveVersion"));
  return v4;
}

- (NSString)locationID
{
  locationID = self->_locationID;
  if (!locationID)
  {
    id v4 = [(WFLocation *)self geoLocation];
    id v5 = v4;
    if (!v4
      || ([v4 coordinate],
          NSStringFromCLLocationCoordinate2D(v6, v7),
          (uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v9 = [MEMORY[0x263F08C38] UUID];
      uint64_t v8 = [v9 UUIDString];
    }
    uint64_t v10 = self->_locationID;
    self->_locationID = v8;

    locationID = self->_locationID;
  }
  return locationID;
}

- (void)setGeoLocation:(id)a3
{
  id v4 = (CLLocation *)[a3 copy];
  geoLocation = self->_geoLocation;
  self->_geoLocation = v4;

  locationID = self->_locationID;
  self->_locationID = 0;
}

+ (id)locationsByFilteringDuplicates:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "city", (void)v17);
        uint64_t v13 = [v5 objectForKey:v12];

        if (!v13)
        {
          uint64_t v13 = [MEMORY[0x263EFF980] array];
        }
        [v13 addObject:v11];
        uint64_t v14 = [v11 city];
        [v5 setObject:v13 forKey:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [a1 locationsByConsolidatingDuplicates:v5 originalOrder:v6];

  return v15;
}

+ (id)locationsByConsolidatingDuplicates:(id)a3 originalOrder:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v16 = a4;
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke;
  v24[3] = &unk_264432448;
  id v7 = v6;
  uint64_t v26 = &v28;
  id v27 = a1;
  id v25 = v7;
  [v17 enumerateKeysAndObjectsUsingBlock:v24];
  if (*((unsigned char *)v29 + 24))
  {
    id v18 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v16;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke_2;
          v19[3] = &unk_264432470;
          v19[4] = v12;
          uint64_t v13 = [v7 indexOfObjectPassingTest:v19];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v14 = [v7 objectAtIndex:v13];
            [v18 addObject:v14];
            [v7 removeObject:v14];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v18 = [MEMORY[0x263EFF980] arrayWithArray:v16];
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 count] == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v7 firstObject];
    [v4 addObject:v5];
  }
  else
  {
    id v5 = [*(id *)(a1 + 48) locationsByConsolidatingDuplicatesInBucket:v7];
    [*(id *)(a1 + 32) addObjectsFromArray:v5];
    uint64_t v6 = [v5 count];
    if (v6 != [v7 count]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

uint64_t __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

+ (id)locationsByConsolidatingDuplicatesInBucket:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 firstObject];
  [v4 addObject:v5];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = 0;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        char v16 = 1;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __57__WFLocation_locationsByConsolidatingDuplicatesInBucket___block_invoke;
        v12[3] = &unk_264432498;
        v12[4] = v9;
        v12[5] = &v13;
        [v4 enumerateObjectsUsingBlock:v12];
        if (!*((unsigned char *)v14 + 24)) {
          [v4 addObject:v9];
        }
        _Block_object_dispose(&v13, 8);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

uint64_t __57__WFLocation_locationsByConsolidatingDuplicatesInBucket___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDay
{
  id v3 = [MEMORY[0x263EFF910] date];
  LOBYTE(self) = [(WFLocation *)self isDayForDate:v3];

  return (char)self;
}

- (BOOL)isDayForDate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (objc_class *)MEMORY[0x263F41718];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(WFLocation *)self geoLocation];
  [v7 coordinate];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v6, "calculateAstronomicalTimeForLocation:", v9, v11);
  [v5 timeIntervalSinceReferenceDate];
  double v13 = v12;

  LOBYTE(v7) = [v6 isDayLightForTime:v13];
  return (char)v7;
}

- (id)_sunAlmanacForDate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F41718];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(WFLocation *)self geoLocation];
  [v7 coordinate];
  double v9 = v8;
  double v11 = v10;

  [v5 timeIntervalSinceReferenceDate];
  double v13 = v12;

  objc_msgSend(v6, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:options:", 2, v9, v11, v13, *MEMORY[0x263F41638]);
  return v6;
}

- (void)sunrise:(id *)a3 andSunset:(id *)a4 forDate:(id)a5
{
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    uint64_t v7 = [(WFLocation *)self _sunAlmanacForDate:a5];
    id v8 = v7;
    if (a3)
    {
      *a3 = [v7 sunrise];
      uint64_t v7 = v8;
    }
    if (a4)
    {
      *a4 = [v8 sunset];
      uint64_t v7 = v8;
    }
  }
}

- (id)sunriseForDate:(id)a3
{
  id v3 = [(WFLocation *)self _sunAlmanacForDate:a3];
  id v4 = [v3 sunrise];

  return v4;
}

- (id)sunsetForDate:(id)a3
{
  id v3 = [(WFLocation *)self _sunAlmanacForDate:a3];
  id v4 = [v3 sunset];

  return v4;
}

- (BOOL)shouldQueryForAirQualityData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [(WFLocation *)self countryAbbreviation];
  if (v2)
  {
    id v3 = +[WFSettingsManager sharedInstance];
    id v4 = [v3 settings];

    id v5 = [v4 aqiEnabledCountryCodes];
    id v6 = WFLogForCategory(3uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      double v10 = v2;
      __int16 v11 = 2112;
      double v12 = v5;
      _os_log_impl(&dword_21C988000, v6, OS_LOG_TYPE_DEFAULT, "Current country code=%@; AQI enabled country codes=%@",
        (uint8_t *)&v9,
        0x16u);
    }

    char v7 = [v5 containsObject:v2];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (displayName)
  {
    id v3 = displayName;
  }
  else
  {
    id v5 = [(WFLocation *)self city];
    id v6 = [(WFLocation *)self country];
    char v7 = [(WFLocation *)self countryAbbreviation];
    id v8 = [(WFLocation *)self state];
    int v9 = [(WFLocation *)self stateAbbreviation];
    double v10 = objc_opt_new();
    if ([v5 length]) {
      [v10 addObject:v5];
    }
    uint64_t v11 = [v8 length];
    double v12 = v8;
    if (v11
      || (v13 = objc_msgSend(v9, "length", v8), double v12 = v9, v13)
      || (v14 = objc_msgSend(v6, "length", v9), double v12 = v6, v14)
      || (v15 = objc_msgSend(v7, "length", v6), double v12 = v7, v15))
    {
      [v10 addObject:v12];
    }
    char v16 = [v10 componentsJoinedByString:@", "];
    long long v17 = self->_displayName;
    self->_displayName = v16;

    id v3 = v16;
  }
  return v3;
}

- (id)localDataRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (WFLocation)initWithLocalDataRepresentation:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  id v11 = 0;
  id v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];

  id v7 = v11;
  if (v7)
  {
    id v8 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WFLocation initWithLocalDataRepresentation:]((uint64_t)v7, v8);
    }

    int v9 = 0;
  }
  else
  {
    int v9 = v6;
  }

  return v9;
}

- (id)cloudDictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(WFLocation *)self city];
  [v3 setObject:v4 forKey:@"CityName"];

  id v5 = NSNumber;
  id v6 = [(WFLocation *)self geoLocation];
  [v6 coordinate];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"Latitude"];

  id v8 = NSNumber;
  int v9 = [(WFLocation *)self geoLocation];
  [v9 coordinate];
  id v11 = [v8 numberWithDouble:v10];
  [v3 setObject:v11 forKey:@"Longitude"];

  return v3;
}

- (WFLocation)initWithCloudDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Longitude", @"Latitude", @"CityName", 0);
  if (![v4 count]) {
    goto LABEL_6;
  }
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [v4 allKeys];
  id v8 = [v6 setWithArray:v7];
  int v9 = [v8 intersectsSet:v5];

  if (v9)
  {
    v27.receiver = self;
    v27.super_class = (Class)WFLocation;
    double v10 = [(WFLocation *)&v27 init];
    if (v10)
    {
      id v11 = [v4 objectForKeyedSubscript:@"Latitude"];
      [v11 doubleValue];
      double v13 = v12;

      uint64_t v14 = [v4 objectForKeyedSubscript:@"Longitude"];
      [v14 doubleValue];
      double v16 = v15;

      long long v17 = (CLLocation *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v13 longitude:v16];
      geoLocation = v10->_geoLocation;
      v10->_geoLocation = v17;
      long long v19 = v17;

      long long v20 = [v4 objectForKeyedSubscript:@"CityName"];
      uint64_t v21 = [v20 copy];
      city = v10->_city;
      v10->_city = (NSString *)v21;

      uint64_t v23 = [MEMORY[0x263EFF910] date];
      creationDate = v10->_creationDate;
      v10->_creationDate = (NSDate *)v23;
    }
    self = v10;
    id v25 = self;
  }
  else
  {
LABEL_6:
    id v25 = 0;
  }

  return v25;
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (void)setLocationID:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)weatherDisplayName
{
  return self->_weatherDisplayName;
}

- (void)setWeatherDisplayName:(id)a3
{
}

- (NSString)weatherLocationName
{
  return self->_weatherLocationName;
}

- (void)setWeatherLocationName:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)county
{
  return self->_county;
}

- (void)setCounty:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)stateAbbreviation
{
  return self->_stateAbbreviation;
}

- (void)setStateAbbreviation:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)countryAbbreviation
{
  return self->_countryAbbreviation;
}

- (void)setCountryAbbreviation:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (int64_t)archiveVersion
{
  return self->_archiveVersion;
}

- (void)setArchiveVersion:(int64_t)a3
{
  self->_archiveVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_countryAbbreviation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_stateAbbreviation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_county, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_weatherLocationName, 0);
  objc_storeStrong((id *)&self->_weatherDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
}

- (NSString)wf_weatherChannelGeocodeValue
{
  id v3 = NSString;
  id v4 = [(WFLocation *)self geoLocation];
  [v4 coordinate];
  uint64_t v6 = v5;
  id v7 = [(WFLocation *)self geoLocation];
  [v7 coordinate];
  int v9 = objc_msgSend(v3, "stringWithFormat:", @"%f,%f", v6, v8);

  return (NSString *)v9;
}

- (void)initWithLocalDataRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Error occured while unarchiving %@", (uint8_t *)&v2, 0xCu);
}

@end