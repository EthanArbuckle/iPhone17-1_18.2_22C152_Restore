@interface AirQualityConditions
- (AirQualityConditions)initWithAirQualityIndex:(unint64_t)a3 isNumerical:(BOOL)a4 color:(id)a5 learnMoreURL:(id)a6 forLocation:(id)a7 withExpirationDate:(id)a8 airQualityDescription:(id)a9;
- (BOOL)hasNumericalAirQualityIndex;
- (CLLocation)location;
- (NSDate)expirationDate;
- (NSString)airQualityDescription;
- (NSURL)learnMoreURL;
- (UIColor)color;
- (id)colorForString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)airQualityIndex;
@end

@implementation AirQualityConditions

- (AirQualityConditions)initWithAirQualityIndex:(unint64_t)a3 isNumerical:(BOOL)a4 color:(id)a5 learnMoreURL:(id)a6 forLocation:(id)a7 withExpirationDate:(id)a8 airQualityDescription:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v39.receiver = self;
  v39.super_class = (Class)AirQualityConditions;
  v20 = [(AirQualityConditions *)&v39 init];
  v21 = v20;
  if (v20)
  {
    v20->_airQualityIndex = a3;
    v20->_hasNumericalAirQualityIndex = a4;
    uint64_t v22 = [(AirQualityConditions *)v20 colorForString:v15];
    color = v21->_color;
    v21->_color = (UIColor *)v22;

    v24 = (NSURL *)[v16 copy];
    learnMoreURL = v21->_learnMoreURL;
    v21->_learnMoreURL = v24;

    v26 = (CLLocation *)[v17 copy];
    location = v21->_location;
    v21->_location = v26;

    v28 = (NSDate *)[v18 copy];
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = v28;

    v30 = (NSString *)[v19 copy];
    airQualityDescription = v21->_airQualityDescription;
    v21->_airQualityDescription = v30;

    v32 = sub_10000B290();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v21->_airQualityDescription;
      [(CLLocation *)v21->_location coordinate];
      v36 = +[NSString stringWithFormat:@"%+.8f, %+.8f", v34, v35];
      v37 = v21->_expirationDate;
      *(_DWORD *)buf = 138412803;
      v41 = v33;
      __int16 v42 = 2113;
      v43 = v36;
      __int16 v44 = 2112;
      v45 = v37;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Air quality = %@ for location = %{private}@ with expirationDate = %@", buf, 0x20u);
    }
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_airQualityIndex;
  *((unsigned char *)v5 + 16) = self->_hasNumericalAirQualityIndex;
  id v6 = [(UIColor *)self->_color copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSURL *)self->_learnMoreURL copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(CLLocation *)self->_location copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(NSString *)self->_airQualityDescription copyWithZone:a3];
  id v15 = (void *)v5[7];
  v5[7] = v14;

  return v5;
}

- (id)colorForString:(id)a3
{
  return +[UIColor _maps_colorFromHexString:a3];
}

- (unint64_t)airQualityIndex
{
  return self->_airQualityIndex;
}

- (BOOL)hasNumericalAirQualityIndex
{
  return self->_hasNumericalAirQualityIndex;
}

- (UIColor)color
{
  return self->_color;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)airQualityDescription
{
  return self->_airQualityDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airQualityDescription, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end