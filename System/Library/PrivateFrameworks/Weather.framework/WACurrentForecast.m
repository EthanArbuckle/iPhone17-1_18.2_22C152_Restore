@interface WACurrentForecast
+ (id)currentForecastForLocation:(id)a3 conditions:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)providerName;
- (WFTemperature)feelsLike;
- (WFTemperature)temperature;
- (float)dewPoint;
- (float)humidity;
- (float)precipitationPast24Hours;
- (float)pressure;
- (float)visibility;
- (float)windDirection;
- (float)windSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)conditionCode;
- (unint64_t)UVIndex;
- (unint64_t)hash;
- (unint64_t)observationTime;
- (unint64_t)pressureRising;
- (void)setConditionCode:(int64_t)a3;
- (void)setDewPoint:(float)a3;
- (void)setFeelsLike:(id)a3;
- (void)setHumidity:(float)a3;
- (void)setObservationTime:(unint64_t)a3;
- (void)setPrecipitationPast24Hours:(float)a3;
- (void)setPressure:(float)a3;
- (void)setPressureRising:(unint64_t)a3;
- (void)setProviderName:(id)a3;
- (void)setTemperature:(id)a3;
- (void)setUVIndex:(unint64_t)a3;
- (void)setVisibility:(float)a3;
- (void)setWindDirection:(float)a3;
- (void)setWindSpeed:(float)a3;
@end

@implementation WACurrentForecast

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WACurrentForecast allocWithZone:a3] init];
  v5 = [(WACurrentForecast *)self temperature];
  v6 = (void *)[v5 copy];
  [(WACurrentForecast *)v4 setTemperature:v6];

  v7 = [(WACurrentForecast *)self feelsLike];
  v8 = (void *)[v7 copy];
  [(WACurrentForecast *)v4 setFeelsLike:v8];

  [(WACurrentForecast *)self windSpeed];
  -[WACurrentForecast setWindSpeed:](v4, "setWindSpeed:");
  [(WACurrentForecast *)self windDirection];
  -[WACurrentForecast setWindDirection:](v4, "setWindDirection:");
  [(WACurrentForecast *)self humidity];
  -[WACurrentForecast setHumidity:](v4, "setHumidity:");
  [(WACurrentForecast *)self dewPoint];
  -[WACurrentForecast setDewPoint:](v4, "setDewPoint:");
  [(WACurrentForecast *)self visibility];
  -[WACurrentForecast setVisibility:](v4, "setVisibility:");
  [(WACurrentForecast *)self pressure];
  -[WACurrentForecast setPressure:](v4, "setPressure:");
  [(WACurrentForecast *)v4 setPressureRising:[(WACurrentForecast *)self pressureRising]];
  [(WACurrentForecast *)v4 setUVIndex:[(WACurrentForecast *)self UVIndex]];
  [(WACurrentForecast *)self precipitationPast24Hours];
  -[WACurrentForecast setPrecipitationPast24Hours:](v4, "setPrecipitationPast24Hours:");
  [(WACurrentForecast *)v4 setConditionCode:[(WACurrentForecast *)self conditionCode]];
  [(WACurrentForecast *)v4 setObservationTime:[(WACurrentForecast *)self observationTime]];
  v9 = [(WACurrentForecast *)self providerName];
  [(WACurrentForecast *)v4 setProviderName:v9];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(WACurrentForecast *)self temperature];
  v5 = [(WACurrentForecast *)self feelsLike];
  [(WACurrentForecast *)self windSpeed];
  double v7 = v6;
  [(WACurrentForecast *)self windDirection];
  double v9 = v8;
  [(WACurrentForecast *)self humidity];
  double v11 = v10;
  [(WACurrentForecast *)self dewPoint];
  double v13 = v12;
  [(WACurrentForecast *)self visibility];
  double v15 = v14;
  [(WACurrentForecast *)self pressure];
  double v17 = v16;
  unint64_t v18 = [(WACurrentForecast *)self pressureRising];
  unint64_t v19 = [(WACurrentForecast *)self UVIndex];
  [(WACurrentForecast *)self precipitationPast24Hours];
  double v21 = v20;
  int64_t v22 = [(WACurrentForecast *)self conditionCode];
  unint64_t v23 = [(WACurrentForecast *)self observationTime];
  v24 = [(WACurrentForecast *)self providerName];
  v25 = [v3 stringWithFormat:@"<WACurrentForecast temperature: '%@' feelsLike: '%@' windSpeed: '%f' windDirection: '%f' humidity: '%f' dewPoint: '%f' visibility: '%f' pressure: '%f' pressureRising: '%lu' UVIndex: '%lu' precipitationPast24Hours: '%f' conditionCode: '%ld' observationTime: '%lu' providerName: %@>", v4, v5, *(void *)&v7, *(void *)&v9, *(void *)&v11, *(void *)&v13, *(void *)&v15, *(void *)&v17, v18, v19, *(void *)&v21, v22, v23, v24];

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WACurrentForecast *)a3;
  if (v4 == self)
  {
    char v41 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if (objc_opt_isKindOfClass()) {
      float v6 = v5;
    }
    else {
      float v6 = 0;
    }
    double v7 = v6;

    float v8 = [(WACurrentForecast *)self temperature];
    double v9 = [(WACurrentForecast *)v7 temperature];
    int IsEqual = WAObjectIsEqual(v8, v9);

    if (!IsEqual) {
      goto LABEL_19;
    }
    double v11 = [(WACurrentForecast *)self feelsLike];
    float v12 = [(WACurrentForecast *)v7 feelsLike];
    int v13 = WAObjectIsEqual(v11, v12);

    if (!v13) {
      goto LABEL_19;
    }
    [(WACurrentForecast *)self windSpeed];
    float v15 = v14;
    [(WACurrentForecast *)v7 windSpeed];
    if (!WAFloatIsEqual(v15, v16)) {
      goto LABEL_19;
    }
    [(WACurrentForecast *)self windDirection];
    float v18 = v17;
    [(WACurrentForecast *)v7 windDirection];
    if (!WAFloatIsEqual(v18, v19)) {
      goto LABEL_19;
    }
    [(WACurrentForecast *)self humidity];
    float v21 = v20;
    [(WACurrentForecast *)v7 humidity];
    if (!WAFloatIsEqual(v21, v22)) {
      goto LABEL_19;
    }
    [(WACurrentForecast *)self dewPoint];
    float v24 = v23;
    [(WACurrentForecast *)v7 dewPoint];
    if (!WAFloatIsEqual(v24, v25)) {
      goto LABEL_19;
    }
    [(WACurrentForecast *)self visibility];
    float v27 = v26;
    [(WACurrentForecast *)v7 visibility];
    if (!WAFloatIsEqual(v27, v28)) {
      goto LABEL_19;
    }
    [(WACurrentForecast *)self pressure];
    float v30 = v29;
    [(WACurrentForecast *)v7 pressure];
    if (!WAFloatIsEqual(v30, v31)) {
      goto LABEL_19;
    }
    unint64_t v32 = [(WACurrentForecast *)self pressureRising];
    if (v32 == [(WACurrentForecast *)v7 pressureRising]
      && (unint64_t v33 = [(WACurrentForecast *)self UVIndex], v33 == [(WACurrentForecast *)v7 UVIndex])
      && ([(WACurrentForecast *)self precipitationPast24Hours],
          float v35 = v34,
          [(WACurrentForecast *)v7 precipitationPast24Hours],
          WAFloatIsEqual(v35, v36))
      && (int64_t v37 = [(WACurrentForecast *)self conditionCode],
          v37 == [(WACurrentForecast *)v7 conditionCode])
      && (unint64_t v38 = [(WACurrentForecast *)self observationTime],
          v38 == [(WACurrentForecast *)v7 observationTime]))
    {
      v39 = [(WACurrentForecast *)self providerName];
      v40 = [(WACurrentForecast *)v7 providerName];
      char v41 = [v39 isEqualToString:v40];
    }
    else
    {
LABEL_19:
      char v41 = 0;
    }
  }
  return v41;
}

- (unint64_t)hash
{
  v2 = [(WACurrentForecast *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(id)a3
{
}

- (WFTemperature)feelsLike
{
  return self->_feelsLike;
}

- (void)setFeelsLike:(id)a3
{
}

- (float)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(float)a3
{
  self->_windSpeed = a3;
}

- (float)windDirection
{
  return self->_windDirection;
}

- (void)setWindDirection:(float)a3
{
  self->_windDirection = a3;
}

- (float)humidity
{
  return self->_humidity;
}

- (void)setHumidity:(float)a3
{
  self->_humidity = a3;
}

- (float)dewPoint
{
  return self->_dewPoint;
}

- (void)setDewPoint:(float)a3
{
  self->_dewPoint = a3;
}

- (float)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(float)a3
{
  self->_visibility = a3;
}

- (float)pressure
{
  return self->_pressure;
}

- (void)setPressure:(float)a3
{
  self->_pressure = a3;
}

- (unint64_t)pressureRising
{
  return self->_pressureRising;
}

- (void)setPressureRising:(unint64_t)a3
{
  self->_pressureRising = a3;
}

- (unint64_t)UVIndex
{
  return self->_UVIndex;
}

- (void)setUVIndex:(unint64_t)a3
{
  self->_UVIndex = a3;
}

- (float)precipitationPast24Hours
{
  return self->_precipitationPast24Hours;
}

- (void)setPrecipitationPast24Hours:(float)a3
{
  self->_precipitationPast24Hours = a3;
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (void)setConditionCode:(int64_t)a3
{
  self->_conditionCode = a3;
}

- (unint64_t)observationTime
{
  return self->_observationTime;
}

- (void)setObservationTime:(unint64_t)a3
{
  self->_observationTime = a3;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_feelsLike, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

+ (id)currentForecastForLocation:(id)a3 conditions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"WACurrentForecast+WFAdditions.m", 18, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v45 = [MEMORY[0x263F08690] currentHandler];
  [v45 handleFailureInMethod:a2, a1, @"WACurrentForecast+WFAdditions.m", 19, @"Invalid parameter not satisfying: %@", @"conditions" object file lineNumber description];

LABEL_3:
  float v10 = objc_opt_new();
  double v11 = [v9 valueForComponent:*MEMORY[0x263F86050]];
  [v10 setTemperature:v11];

  float v12 = [v9 valueForComponent:*MEMORY[0x263F85FC8]];
  [v10 setFeelsLike:v12];

  int v13 = [v9 valueForComponent:*MEMORY[0x263F85FB8]];
  [v10 setProviderName:v13];

  float v14 = [v9 valueForComponent:*MEMORY[0x263F86070]];
  v54 = v14;
  if (v14) {
    [v14 floatValue];
  }
  else {
    LODWORD(v15) = 0x800000;
  }
  [v10 setWindDirection:v15];
  float v16 = [v9 valueForComponent:*MEMORY[0x263F86078]];
  v53 = v16;
  if (v16) {
    [v16 floatValue];
  }
  else {
    LODWORD(v17) = 0x800000;
  }
  [v10 setWindSpeed:v17];
  float v18 = [v9 valueForComponent:*MEMORY[0x263F85FF0]];
  v52 = v18;
  if (v18) {
    [v18 floatValue];
  }
  else {
    LODWORD(v19) = 0x800000;
  }
  [v10 setHumidity:v19];
  float v20 = [v9 valueForComponent:*MEMORY[0x263F85FC0]];
  v51 = v20;
  if (v20) {
    [v20 floatValue];
  }
  else {
    LODWORD(v21) = 0x800000;
  }
  [v10 setDewPoint:v21];
  float v22 = [v9 valueForComponent:*MEMORY[0x263F86060]];
  v50 = v22;
  if (v22) {
    [v22 floatValue];
  }
  else {
    LODWORD(v23) = 0x800000;
  }
  [v10 setVisibility:v23];
  float v24 = [v9 valueForComponent:*MEMORY[0x263F86020]];
  v49 = v24;
  if (v24) {
    [v24 floatValue];
  }
  else {
    LODWORD(v25) = 0x800000;
  }
  [v10 setPressure:v25];
  float v26 = [v9 valueForComponent:*MEMORY[0x263F86028]];
  float v27 = v26;
  if (v26)
  {
    unint64_t v28 = [v26 unsignedIntegerValue];
    if (v28 <= 4) {
      [v10 setPressureRising:PressureStatesMap[v28]];
    }
  }
  v48 = [v9 valueForComponent:*MEMORY[0x263F86058]];
  objc_msgSend(v10, "setUVIndex:", objc_msgSend(v48, "unsignedIntegerValue"));
  v47 = [v9 valueForComponent:*MEMORY[0x263F86010]];
  [v47 doubleValue];
  double v30 = v29 / 10.0;
  *(float *)&double v30 = v30;
  [v10 setPrecipitationPast24Hours:v30];
  uint64_t v31 = [v9 valueForComponent:*MEMORY[0x263F86080]];
  unint64_t v32 = (void *)v31;
  unint64_t v33 = &unk_26DAEB000;
  if (v31) {
    unint64_t v33 = (void *)v31;
  }
  id v34 = v33;

  uint64_t v35 = [v34 unsignedIntegerValue];
  [v10 setConditionCode:v35];
  float v36 = +[City _ISO8601Calendar];
  int64_t v37 = [v7 timeZone];
  [v9 valueForComponent:*MEMORY[0x263F85FE0]];
  unint64_t v38 = v46 = v7;
  v39 = [v38 date];
  [v39 timeIntervalSince1970];
  char v41 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(unint64_t)v40];
  [v36 setTimeZone:v37];
  v42 = [v36 components:96 fromDate:v41];
  objc_msgSend(v10, "setObservationTime:", objc_msgSend(v42, "minute") + 100 * objc_msgSend(v42, "hour"));

  return v10;
}

@end