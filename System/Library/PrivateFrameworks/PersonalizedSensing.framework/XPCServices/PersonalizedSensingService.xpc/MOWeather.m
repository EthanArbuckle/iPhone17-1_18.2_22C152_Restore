@interface MOWeather
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MOWeather)initWithCoder:(id)a3;
- (MOWeather)initWithStartDate:(id)a3 endDate:(id)a4 temperature:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 windSpeed:(id)a8;
- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7;
- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 temperature:(id)a8 windSpeed:(id)a9;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMeasurement)temperature;
- (NSMeasurement)windSpeed;
- (NSString)weatherSummary;
- (NSString)weatherSymbolName;
- (NSUUID)sourceEventIdentifier;
- (NSUUID)weatherIdentifier;
- (id)description;
- (int64_t)sourceEventAccessType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setSourceEventAccessType:(int64_t)a3;
- (void)setSourceEventIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTemperature:(id)a3;
- (void)setWeatherIdentifier:(id)a3;
- (void)setWeatherSummary:(id)a3;
- (void)setWeatherSymbolName:(id)a3;
- (void)setWindSpeed:(id)a3;
@end

@implementation MOWeather

- (MOWeather)initWithStartDate:(id)a3 endDate:(id)a4 temperature:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 windSpeed:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = +[NSUUID UUID];
  v21 = [(MOWeather *)self initWithWeatherIdentifier:v20 startDate:v19 endDate:v18 weatherSummary:v16 weatherSymbolName:v15 temperature:v17 windSpeed:v14];

  return v21;
}

- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7
{
  return [(MOWeather *)self initWithWeatherIdentifier:a3 startDate:a4 endDate:a5 weatherSummary:a6 weatherSymbolName:a7 temperature:0 windSpeed:0];
}

- (MOWeather)initWithWeatherIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 weatherSummary:(id)a6 weatherSymbolName:(id)a7 temperature:(id)a8 windSpeed:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MOWeather;
  id v18 = [(MOWeather *)&v26 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_weatherIdentifier, a3);
    objc_storeStrong((id *)&v19->_startDate, a4);
    objc_storeStrong((id *)&v19->_endDate, a5);
    objc_storeStrong((id *)&v19->_weatherSummary, a6);
    objc_storeStrong((id *)&v19->_weatherSymbolName, a7);
    objc_storeStrong((id *)&v19->_temperature, a8);
    objc_storeStrong((id *)&v19->_windSpeed, a9);
    v19->_sourceEventAccessType = 5;
  }

  return v19;
}

- (id)description
{
  v3 = [(MOWeather *)self weatherIdentifier];
  v4 = [(MOWeather *)self startDate];
  v5 = [(MOWeather *)self endDate];
  v6 = [(MOWeather *)self weatherSummary];
  v7 = [(MOWeather *)self weatherSymbolName];
  v8 = [(MOWeather *)self temperature];
  v9 = [(MOWeather *)self windSpeed];
  v10 = +[NSString stringWithFormat:@"<MOWeather identifier, %@, startDate, %@, endDate, %@, weatherSummary, %@, weatherSymbolName, %@, temperature, %@, windSpeed %@>", v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  weatherIdentifier = self->_weatherIdentifier;
  id v5 = a3;
  [v5 encodeObject:weatherIdentifier forKey:@"weatherIdentifier"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_weatherSummary forKey:@"weatherSummary"];
  [v5 encodeObject:self->_weatherSymbolName forKey:@"weatherSymbolName"];
  [v5 encodeObject:self->_temperature forKey:@"temperature"];
  [v5 encodeObject:self->_windSpeed forKey:@"windSpeed"];
  [v5 encodeInt64:self->_sourceEventAccessType forKey:@"sourceEventAccessType"];
  [v5 encodeObject:self->_sourceEventIdentifier forKey:@"sourceEventIdentifier"];
}

- (MOWeather)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weatherIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weatherSummary"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weatherSymbolName"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"temperature"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windSpeed"];
  v12 = [(MOWeather *)self initWithWeatherIdentifier:v5 startDate:v6 endDate:v7 weatherSummary:v8 weatherSymbolName:v9 temperature:v10 windSpeed:v11];
  if (v12)
  {
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEventIdentifier"];
    [(MOWeather *)v12 setSourceEventIdentifier:v13];

    -[MOWeather setSourceEventAccessType:](v12, "setSourceEventAccessType:", [v4 decodeInt64ForKey:@"sourceEventAccessType"]);
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = [(MOWeather *)self weatherIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOWeather *)a3;
  v6 = v5;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        v8 = [(MOWeather *)self weatherIdentifier];
        if (v8
          || ([(MOWeather *)v7 weatherIdentifier],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v9 = [(MOWeather *)self weatherIdentifier];
          v10 = [(MOWeather *)v7 weatherIdentifier];
          unsigned __int8 v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }

        goto LABEL_12;
      }
    }
    unsigned __int8 v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)weatherIdentifier
{
  return self->_weatherIdentifier;
}

- (void)setWeatherIdentifier:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)weatherSummary
{
  return self->_weatherSummary;
}

- (void)setWeatherSummary:(id)a3
{
}

- (NSString)weatherSymbolName
{
  return self->_weatherSymbolName;
}

- (void)setWeatherSymbolName:(id)a3
{
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(id)a3
{
}

- (NSMeasurement)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(id)a3
{
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_windSpeed, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_weatherSymbolName, 0);
  objc_storeStrong((id *)&self->_weatherSummary, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_weatherIdentifier, 0);
}

@end