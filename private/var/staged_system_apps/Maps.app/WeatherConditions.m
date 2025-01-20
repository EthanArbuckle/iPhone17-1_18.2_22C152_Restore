@interface WeatherConditions
- (CLLocation)location;
- (NSArray)palette;
- (NSDate)expirationDate;
- (NSString)conditionDescription;
- (NSString)name;
- (NSString)temperature;
- (NSString)temperatureDescription;
- (WeatherConditions)initWithTemperature:(id)a3 name:(id)a4 palette:(id)a5 forLocation:(id)a6 withExpirationDate:(id)a7 conditionDescription:(id)a8 temperatureDescription:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation WeatherConditions

- (WeatherConditions)initWithTemperature:(id)a3 name:(id)a4 palette:(id)a5 forLocation:(id)a6 withExpirationDate:(id)a7 conditionDescription:(id)a8 temperatureDescription:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v49.receiver = self;
  v49.super_class = (Class)WeatherConditions;
  v22 = [(WeatherConditions *)&v49 init];
  if (v22)
  {
    v23 = (NSString *)[v15 copy];
    temperature = v22->_temperature;
    v22->_temperature = v23;

    v25 = (NSString *)[v16 copy];
    name = v22->_name;
    v22->_name = v25;

    v27 = (NSArray *)[v17 copy];
    palette = v22->_palette;
    v22->_palette = v27;

    v29 = (CLLocation *)[v18 copy];
    location = v22->_location;
    v22->_location = v29;

    v31 = (NSDate *)[v19 copy];
    expirationDate = v22->_expirationDate;
    v22->_expirationDate = v31;

    v33 = (NSString *)[v20 copy];
    conditionDescription = v22->_conditionDescription;
    v22->_conditionDescription = v33;

    v35 = (NSString *)[v21 copy];
    temperatureDescription = v22->_temperatureDescription;
    v22->_temperatureDescription = v35;

    v37 = sub_10000B290();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = v18;
      id v48 = v16;
      id v38 = v17;
      id v39 = v15;
      v40 = v22->_temperatureDescription;
      v41 = v22->_name;
      [(CLLocation *)v22->_location coordinate];
      v44 = +[NSString stringWithFormat:@"%+.8f, %+.8f", v42, v43];
      v45 = v22->_expirationDate;
      *(_DWORD *)buf = 138413059;
      v51 = v40;
      id v15 = v39;
      id v17 = v38;
      __int16 v52 = 2112;
      v53 = v41;
      id v18 = v47;
      id v16 = v48;
      __int16 v54 = 2113;
      v55 = v44;
      __int16 v56 = 2112;
      v57 = v45;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Weather %@, %@ for location = %{private}@ with expirationDate = %@", buf, 0x2Au);
    }
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_temperature copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_name copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSArray *)self->_palette copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(CLLocation *)self->_location copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  id v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(NSString *)self->_conditionDescription copyWithZone:a3];
  id v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = [(NSString *)self->_temperatureDescription copyWithZone:a3];
  id v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSString)temperature
{
  return self->_temperature;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)palette
{
  return self->_palette;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)conditionDescription
{
  return self->_conditionDescription;
}

- (NSString)temperatureDescription
{
  return self->_temperatureDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureDescription, 0);
  objc_storeStrong((id *)&self->_conditionDescription, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_temperature, 0);
}

@end