@interface PKPassWeatherInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWeatherInformation:(id)a3;
- (BOOL)isForPastDate;
- (BOOL)isHistoricalEstimate;
- (CLLocation)rawLocation;
- (NSDate)date;
- (NSMeasurement)highTemperature;
- (NSMeasurement)lowTemperature;
- (NSString)cityName;
- (NSString)weatherDescription;
- (NSURL)attributionURL;
- (NSURL)weatherURL;
- (PKPassWeatherInformation)initWithCityName:(id)a3 date:(id)a4 lightSymbol:(id)a5 darkSymbol:(id)a6 weatherDescription:(id)a7 highTemperature:(id)a8 lowTemperature:(id)a9 rawLocation:(id)a10 attributionURL:(id)a11 weatherURL:(id)a12 isHistoricalEstimate:(BOOL)a13 isForPastDate:(BOOL)a14;
- (PKPassWeatherInformation)initWithCoder:(id)a3;
- (PKPassWeatherSymbol)darkSymbol;
- (PKPassWeatherSymbol)lightSymbol;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassWeatherInformation

- (PKPassWeatherInformation)initWithCityName:(id)a3 date:(id)a4 lightSymbol:(id)a5 darkSymbol:(id)a6 weatherDescription:(id)a7 highTemperature:(id)a8 lowTemperature:(id)a9 rawLocation:(id)a10 attributionURL:(id)a11 weatherURL:(id)a12 isHistoricalEstimate:(BOOL)a13 isForPastDate:(BOOL)a14
{
  id v36 = a3;
  id obj = a4;
  id v35 = a4;
  id v28 = a5;
  id v34 = a5;
  id v29 = a6;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PKPassWeatherInformation;
  v24 = [(PKPassWeatherInformation *)&v37 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_cityName, a3);
    objc_storeStrong((id *)&v25->_date, obj);
    objc_storeStrong((id *)&v25->_lightSymbol, v28);
    objc_storeStrong((id *)&v25->_darkSymbol, v29);
    objc_storeStrong((id *)&v25->_weatherDescription, a7);
    objc_storeStrong((id *)&v25->_highTemperature, a8);
    objc_storeStrong((id *)&v25->_lowTemperature, a9);
    objc_storeStrong((id *)&v25->_rawLocation, a10);
    objc_storeStrong((id *)&v25->_attributionURL, a11);
    objc_storeStrong((id *)&v25->_weatherURL, a12);
    v25->_isHistoricalEstimate = a13;
    v25->_isForPastDate = a14;
  }

  return v25;
}

- (PKPassWeatherInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPassWeatherInformation;
  v5 = [(PKPassWeatherInformation *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cityName"];
    cityName = v5->_cityName;
    v5->_cityName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weatherDate"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightSymbol"];
    lightSymbol = v5->_lightSymbol;
    v5->_lightSymbol = (PKPassWeatherSymbol *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkSymbol"];
    darkSymbol = v5->_darkSymbol;
    v5->_darkSymbol = (PKPassWeatherSymbol *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weatherDescription"];
    weatherDescription = v5->_weatherDescription;
    v5->_weatherDescription = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highTemperature"];
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (NSMeasurement *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lowTemperature"];
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (NSMeasurement *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawLocation"];
    rawLocation = v5->_rawLocation;
    v5->_rawLocation = (CLLocation *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributionURL"];
    attributionURL = v5->_attributionURL;
    v5->_attributionURL = (NSURL *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weatherURL"];
    weatherURL = v5->_weatherURL;
    v5->_weatherURL = (NSURL *)v24;

    v5->_isHistoricalEstimate = [v4 decodeBoolForKey:@"historicalEstimate"];
    v5->_isForPastDate = [v4 decodeBoolForKey:@"forPastDate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cityName = self->_cityName;
  id v5 = a3;
  [v5 encodeObject:cityName forKey:@"cityName"];
  [v5 encodeObject:self->_date forKey:@"weatherDate"];
  [v5 encodeObject:self->_lightSymbol forKey:@"lightSymbol"];
  [v5 encodeObject:self->_darkSymbol forKey:@"darkSymbol"];
  [v5 encodeObject:self->_weatherDescription forKey:@"weatherDescription"];
  [v5 encodeObject:self->_highTemperature forKey:@"highTemperature"];
  [v5 encodeObject:self->_lowTemperature forKey:@"lowTemperature"];
  [v5 encodeObject:self->_rawLocation forKey:@"rawLocation"];
  [v5 encodeObject:self->_attributionURL forKey:@"attributionURL"];
  [v5 encodeObject:self->_weatherURL forKey:@"weatherURL"];
  [v5 encodeBool:self->_isHistoricalEstimate forKey:@"historicalEstimate"];
  [v5 encodeBool:self->_isForPastDate forKey:@"forPastDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(PKPassWeatherInformation);
  uint64_t v6 = [(NSString *)self->_cityName copyWithZone:a3];
  cityName = v5->_cityName;
  v5->_cityName = (NSString *)v6;

  uint64_t v8 = [(NSDate *)self->_date copyWithZone:a3];
  date = v5->_date;
  v5->_date = (NSDate *)v8;

  uint64_t v10 = [(PKPassWeatherSymbol *)self->_lightSymbol copyWithZone:a3];
  lightSymbol = v5->_lightSymbol;
  v5->_lightSymbol = v10;

  uint64_t v12 = [(PKPassWeatherSymbol *)self->_darkSymbol copyWithZone:a3];
  darkSymbol = v5->_darkSymbol;
  v5->_darkSymbol = v12;

  uint64_t v14 = [(NSString *)self->_weatherDescription copyWithZone:a3];
  weatherDescription = v5->_weatherDescription;
  v5->_weatherDescription = (NSString *)v14;

  uint64_t v16 = [(NSMeasurement *)self->_highTemperature copyWithZone:a3];
  highTemperature = v5->_highTemperature;
  v5->_highTemperature = (NSMeasurement *)v16;

  uint64_t v18 = [(NSMeasurement *)self->_lowTemperature copyWithZone:a3];
  lowTemperature = v5->_lowTemperature;
  v5->_lowTemperature = (NSMeasurement *)v18;

  uint64_t v20 = [(CLLocation *)self->_rawLocation copyWithZone:a3];
  rawLocation = v5->_rawLocation;
  v5->_rawLocation = (CLLocation *)v20;

  uint64_t v22 = [(NSURL *)self->_attributionURL copyWithZone:a3];
  attributionURL = v5->_attributionURL;
  v5->_attributionURL = (NSURL *)v22;

  uint64_t v24 = [(NSURL *)self->_weatherURL copyWithZone:a3];
  weatherURL = v5->_weatherURL;
  v5->_weatherURL = (NSURL *)v24;

  v5->_isHistoricalEstimate = self->_isHistoricalEstimate;
  v5->_isForPastDate = self->_isForPastDate;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassWeatherInformation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassWeatherInformation *)self isEqualToWeatherInformation:v5];

  return v6;
}

- (BOOL)isEqualToWeatherInformation:(id)a3
{
  id v4 = a3;
  if (!PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects())
  {
    goto LABEL_19;
  }
  id v5 = (void *)v4[7];
  BOOL v6 = self->_weatherDescription;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7)
    {

LABEL_19:
      BOOL v10 = 0;
      goto LABEL_20;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_19;
    }
  }
  if (!PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || !PKEqualObjects()
    || self->_isHistoricalEstimate != *((unsigned __int8 *)v4 + 8))
  {
    goto LABEL_19;
  }
  BOOL v10 = self->_isForPastDate == *((unsigned __int8 *)v4 + 9);
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_cityName];
  [v3 safelyAddObject:self->_date];
  [v3 safelyAddObject:self->_lightSymbol];
  [v3 safelyAddObject:self->_darkSymbol];
  [v3 safelyAddObject:self->_weatherDescription];
  [v3 safelyAddObject:self->_highTemperature];
  [v3 safelyAddObject:self->_lowTemperature];
  [v3 safelyAddObject:self->_rawLocation];
  [v3 safelyAddObject:self->_attributionURL];
  [v3 safelyAddObject:self->_weatherURL];
  id v4 = [NSNumber numberWithBool:self->_isHistoricalEstimate];
  [v3 safelyAddObject:v4];

  id v5 = [NSNumber numberWithBool:self->_isForPastDate];
  [v3 safelyAddObject:v5];

  unint64_t v6 = PKCombinedHash();
  return v6;
}

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (NSString)cityName
{
  return self->_cityName;
}

- (NSDate)date
{
  return self->_date;
}

- (PKPassWeatherSymbol)lightSymbol
{
  return self->_lightSymbol;
}

- (PKPassWeatherSymbol)darkSymbol
{
  return self->_darkSymbol;
}

- (NSString)weatherDescription
{
  return self->_weatherDescription;
}

- (NSMeasurement)highTemperature
{
  return self->_highTemperature;
}

- (NSMeasurement)lowTemperature
{
  return self->_lowTemperature;
}

- (NSURL)attributionURL
{
  return self->_attributionURL;
}

- (NSURL)weatherURL
{
  return self->_weatherURL;
}

- (BOOL)isHistoricalEstimate
{
  return self->_isHistoricalEstimate;
}

- (BOOL)isForPastDate
{
  return self->_isForPastDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherURL, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_weatherDescription, 0);
  objc_storeStrong((id *)&self->_darkSymbol, 0);
  objc_storeStrong((id *)&self->_lightSymbol, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cityName, 0);

  objc_storeStrong((id *)&self->_rawLocation, 0);
}

@end