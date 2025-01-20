@interface WFURLComponents
+ (BOOL)supportsSecureCoding;
+ (id)componentsForLocation:(id)a3;
+ (id)componentsForURL:(id)a3;
+ (void)locationForURL:(id)a3 completion:(id)a4;
+ (void)locationForURLComponents:(id)a3 completion:(id)a4;
- (BOOL)_canBuildURLWithProvidedComponents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponents:(id)a3;
- (BOOL)isLocalWeatherCity;
- (BOOL)showHourlyWeatherOnly;
- (CLLocation)location;
- (NSLocale)locale;
- (NSString)locationName;
- (NSString)platform;
- (NSURL)URL;
- (WFURLComponents)init;
- (WFURLComponents)initWithCoder:(id)a3;
- (WFURLComponents)initWithLocation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cityIndex;
- (unint64_t)destination;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCityIndex:(unint64_t)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setIsLocalWeatherCity:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setShowHourlyWeatherOnly:(BOOL)a3;
@end

@implementation WFURLComponents

+ (void)locationForURLComponents:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v5 cityIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = [WFGeocodeRequest alloc];
      v8 = [v5 location];
      [v8 coordinate];
      double v10 = v9;
      double v12 = v11;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __55__WFURLComponents_locationForURLComponents_completion___block_invoke;
      v18 = &unk_264431C50;
      id v20 = v6;
      id v19 = v5;
      v13 = -[WFGeocodeRequest initWithCoordinate:resultHandler:](v7, "initWithCoordinate:resultHandler:", &v15, v10, v12);

      [(WFTask *)v13 start];
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
    }
  }
}

void __55__WFURLComponents_locationForURLComponents_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (a3)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) locationName];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) locationName];
      [v9 setDisplayName:v7];
    }
    v8 = [*(id *)(a1 + 32) location];
    [v9 setGeoLocation:v8];

    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

+ (void)locationForURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  id v8 = +[WFURLComponents componentsForURL:v6];

  [v7 locationForURLComponents:v8 completion:v5];
}

+ (id)componentsForURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 host];
  char v6 = [v5 isEqualToString:@"weather.apple.com"];

  if (v6)
  {
    uint64_t v7 = 1;
LABEL_4:
    [v4 setDestination:v7];
    double v11 = [MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    uint64_t v23 = 0;
    v24 = (CLLocationCoordinate2D *)&v23;
    uint64_t v25 = 0x3010000000;
    v26 = &unk_21C9E3772;
    long long v27 = *MEMORY[0x263F00B58];
    double v12 = [v11 queryItems];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    id v19 = __36__WFURLComponents_componentsForURL___block_invoke;
    id v20 = &unk_264431C78;
    v22 = &v23;
    id v13 = v4;
    id v21 = v13;
    [v12 enumerateObjectsUsingBlock:&v17];

    if (CLLocationCoordinate2DIsValid(v24[2]))
    {
      id v14 = objc_alloc(MEMORY[0x263F00A50]);
      uint64_t v15 = objc_msgSend(v14, "initWithLatitude:longitude:", v24[2].latitude, v24[2].longitude, v17, v18, v19, v20);
      [v13 setLocation:v15];

      id v10 = v13;
    }
    else
    {
      id v10 = 0;
    }

    _Block_object_dispose(&v23, 8);
    goto LABEL_8;
  }
  id v8 = [v3 host];
  int v9 = [v8 hasSuffix:@"weather.com"];

  uint64_t v7 = 0;
  id v10 = 0;
  if (v9) {
    goto LABEL_4;
  }
LABEL_8:

  return v10;
}

void __36__WFURLComponents_componentsForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 name];
  v4 = [v3 value];

  if (([v9 isEqualToString:@"lat"] & 1) != 0
    || [v9 isEqualToString:@"lat"])
  {
    [v4 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v5;
  }
  else if (([v9 isEqualToString:@"long"] & 1) != 0 {
         || ([v9 isEqualToString:@"lon"] & 1) != 0
  }
         || [v9 isEqualToString:@"lng"])
  {
    [v4 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6;
  }
  else if ([v9 isEqualToString:@"city"])
  {
    [*(id *)(a1 + 32) setLocationName:v4];
  }
  else if ([v9 isEqualToString:@"isShowingHourly"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowHourlyWeatherOnly:", objc_msgSend(v4, "BOOLValue"));
  }
  else if ([v9 isEqualToString:@"par"])
  {
    [*(id *)(a1 + 32) setPlatform:v4];
  }
  else if ([v9 isEqualToString:@"locale"])
  {
    uint64_t v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
    if (v7)
    {
      [*(id *)(a1 + 32) setLocale:v7];
    }
    else
    {
      id v8 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
      [*(id *)(a1 + 32) setLocale:v8];
    }
  }
  else if ([v9 isEqualToString:@"isLocal"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsLocalWeatherCity:", objc_msgSend(v4, "BOOLValue"));
  }
  else if ([v9 isEqualToString:@"index"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCityIndex:", objc_msgSend(v4, "integerValue"));
  }
}

+ (id)componentsForLocation:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocation:v3];

  return v4;
}

- (WFURLComponents)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFURLComponents;
  v2 = [(WFURLComponents *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(WFURLComponents *)v2 setLocale:v3];

    v4 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v5 = [v4 processName];
    [(WFURLComponents *)v2 setPlatform:v5];

    [(WFURLComponents *)v2 setCityIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v2;
}

- (WFURLComponents)initWithLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFURLComponents *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 geoLocation];
    [(WFURLComponents *)v5 setLocation:v6];

    objc_super v7 = [v4 displayName];
    [(WFURLComponents *)v5 setLocationName:v7];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFURLComponents)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFURLComponents *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [(WFURLComponents *)v5 setLocation:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationName"];
    [(WFURLComponents *)v5 setLocationName:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    [(WFURLComponents *)v5 setLocale:v8];

    -[WFURLComponents setShowHourlyWeatherOnly:](v5, "setShowHourlyWeatherOnly:", [v4 decodeBoolForKey:@"showHourlyWeatherOnly"]);
    -[WFURLComponents setDestination:](v5, "setDestination:", [v4 decodeIntegerForKey:@"destination"]);
    -[WFURLComponents setIsLocalWeatherCity:](v5, "setIsLocalWeatherCity:", [v4 decodeBoolForKey:@"isLocalWeatherCity"]);
    -[WFURLComponents setCityIndex:](v5, "setCityIndex:", [v4 decodeIntegerForKey:@"cityIndex"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(WFURLComponents *)self location];
  [v7 encodeObject:v4 forKey:@"location"];

  uint64_t v5 = [(WFURLComponents *)self locationName];
  [v7 encodeObject:v5 forKey:@"locationName"];

  uint64_t v6 = [(WFURLComponents *)self locale];
  [v7 encodeObject:v6 forKey:@"locale"];

  objc_msgSend(v7, "encodeBool:forKey:", -[WFURLComponents showHourlyWeatherOnly](self, "showHourlyWeatherOnly"), @"showHourlyWeatherOnly");
  objc_msgSend(v7, "encodeInteger:forKey:", -[WFURLComponents destination](self, "destination"), @"destination");
  objc_msgSend(v7, "encodeBool:forKey:", -[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"), @"isLocalWeatherCity");
  objc_msgSend(v7, "encodeInteger:forKey:", -[WFURLComponents cityIndex](self, "cityIndex"), @"cityIndex");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  uint64_t v5 = [(WFURLComponents *)self location];
  [v4 setLocation:v5];

  uint64_t v6 = [(WFURLComponents *)self locationName];
  [v4 setLocationName:v6];

  id v7 = [(WFURLComponents *)self locale];
  [v4 setLocale:v7];

  objc_msgSend(v4, "setShowHourlyWeatherOnly:", -[WFURLComponents showHourlyWeatherOnly](self, "showHourlyWeatherOnly"));
  objc_msgSend(v4, "setDestination:", -[WFURLComponents destination](self, "destination"));
  objc_msgSend(v4, "setIsLocalWeatherCity:", -[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"));
  objc_msgSend(v4, "setCityIndex:", -[WFURLComponents cityIndex](self, "cityIndex"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(WFURLComponents *)self isEqualToComponents:v4];

  return v5;
}

- (BOOL)isEqualToComponents:(id)a3
{
  id v4 = (WFURLComponents *)a3;
  if (v4 == self
    || (v11.receiver = self,
        v11.super_class = (Class)WFURLComponents,
        [(WFURLComponents *)&v11 isEqual:v4]))
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(WFURLComponents *)self URL];
    id v7 = [v6 absoluteString];
    id v8 = [(WFURLComponents *)v4 URL];
    id v9 = [v8 absoluteString];
    char v5 = [v7 isEqualToString:v9];
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(WFURLComponents *)self URL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSURL)URL
{
  if (![(WFURLComponents *)self _canBuildURLWithProvidedComponents])
  {
    v30 = 0;
    goto LABEL_19;
  }
  unint64_t v3 = [(WFURLComponents *)self destination];
  if (!v3)
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithString:@"https://www.weather.com/wx/today/"];
    char v5 = objc_opt_new();
    v31 = [(WFURLComponents *)self location];
    uint64_t v6 = v31;
    if (v31)
    {
      v32 = (void *)MEMORY[0x263F08BD0];
      v33 = NSString;
      [v31 coordinate];
      v35 = [v33 stringWithFormat:@"%.2f", v34];
      v36 = [v32 queryItemWithName:@"lat" value:v35];
      [v5 addObject:v36];

      v37 = (void *)MEMORY[0x263F08BD0];
      v38 = NSString;
      [v6 coordinate];
      v40 = [v38 stringWithFormat:@"%.2f", v39];
      v41 = [v37 queryItemWithName:@"lon" value:v40];
      [v5 addObject:v41];
    }
    long long v27 = [(WFURLComponents *)self locale];
    v42 = [v27 objectForKey:*MEMORY[0x263EFF4D0]];
    v28 = [v42 uppercaseString];

    v43 = [v27 objectForKey:*MEMORY[0x263EFF508]];
    v44 = [v43 lowercaseString];

    v45 = [NSString stringWithFormat:@"%@_%@", v44, v28];
    v46 = [MEMORY[0x263F08BD0] queryItemWithName:@"locale" value:v45];
    [v5 addObject:v46];

    v47 = (void *)MEMORY[0x263F08BD0];
    v48 = [(WFURLComponents *)self platform];
    v49 = [v47 queryItemWithName:@"par" value:v48];
    [v5 addObject:v49];

    goto LABEL_15;
  }
  if (v3 == 1)
  {
    id v4 = objc_opt_new();
    [v4 setScheme:@"https"];
    [v4 setHost:@"weather.apple.com"];
    [v4 setPath:@"/"];
    char v5 = objc_opt_new();
    if ([(WFURLComponents *)self cityIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [(WFURLComponents *)self location];
      id v7 = (void *)MEMORY[0x263F08BD0];
      id v8 = NSNumber;
      [v6 coordinate];
      id v9 = objc_msgSend(v8, "numberWithDouble:");
      id v10 = [v9 stringValue];
      objc_super v11 = [v7 queryItemWithName:@"lat" value:v10];
      [v5 addObject:v11];

      double v12 = (void *)MEMORY[0x263F08BD0];
      id v13 = NSNumber;
      [v6 coordinate];
      uint64_t v15 = [v13 numberWithDouble:v14];
      uint64_t v16 = [v15 stringValue];
      uint64_t v17 = [v12 queryItemWithName:@"long" value:v16];
      [v5 addObject:v17];

      uint64_t v18 = [(WFURLComponents *)self locationName];

      if (v18)
      {
        id v19 = (void *)MEMORY[0x263F08BD0];
        id v20 = [(WFURLComponents *)self locationName];
        id v21 = [v19 queryItemWithName:@"city" value:v20];
        [v5 addObject:v21];
      }
      v22 = (void *)MEMORY[0x263F08BD0];
      uint64_t v23 = objc_msgSend(NSNumber, "numberWithInt:", -[WFURLComponents showHourlyWeatherOnly](self, "showHourlyWeatherOnly"));
      v24 = [v23 stringValue];
      uint64_t v25 = [v22 queryItemWithName:@"isShowingHourly" value:v24];
      [v5 addObject:v25];

      if (![(WFURLComponents *)self isLocalWeatherCity]) {
        goto LABEL_16;
      }
      v26 = (void *)MEMORY[0x263F08BD0];
      long long v27 = objc_msgSend(NSNumber, "numberWithInt:", -[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"));
      v28 = [v27 stringValue];
      v29 = [v26 queryItemWithName:@"isLocal" value:v28];
      [v5 addObject:v29];
    }
    else
    {
      v50 = (void *)MEMORY[0x263F08BD0];
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFURLComponents cityIndex](self, "cityIndex"));
      long long v27 = [v6 stringValue];
      v28 = [v50 queryItemWithName:@"index" value:v27];
      [v5 addObject:v28];
    }
LABEL_15:

LABEL_16:
    if (v5) {
      [v4 setQueryItems:v5];
    }
    goto LABEL_18;
  }
  id v4 = 0;
  char v5 = 0;
LABEL_18:
  v30 = [v4 URL];

LABEL_19:
  return (NSURL *)v30;
}

- (BOOL)_canBuildURLWithProvidedComponents
{
  unint64_t v3 = [(WFURLComponents *)self destination];
  if (!v3) {
    return 1;
  }
  if (v3 != 1) {
    return 0;
  }
  id v4 = [(WFURLComponents *)self location];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(WFURLComponents *)self cityIndex] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocation:(id)a3
{
}

- (NSString)locationName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocationName:(id)a3
{
}

- (BOOL)showHourlyWeatherOnly
{
  return self->_showHourlyWeatherOnly;
}

- (void)setShowHourlyWeatherOnly:(BOOL)a3
{
  self->_showHourlyWeatherOnly = a3;
}

- (BOOL)isLocalWeatherCity
{
  return self->_isLocalWeatherCity;
}

- (void)setIsLocalWeatherCity:(BOOL)a3
{
  self->_isLocalWeatherCity = a3;
}

- (unint64_t)cityIndex
{
  return self->_cityIndex;
}

- (void)setCityIndex:(unint64_t)a3
{
  self->_cityIndex = a3;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPlatform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end