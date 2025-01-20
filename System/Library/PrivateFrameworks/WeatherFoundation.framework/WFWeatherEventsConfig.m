@interface WFWeatherEventsConfig
- (WFWeatherEventConfig)changeInConditions;
- (WFWeatherEventConfig)nextHourPrecipitation;
- (WFWeatherEventConfig)severeWeather;
- (WFWeatherEventsConfig)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setChangeInConditions:(id)a3;
- (void)setNextHourPrecipitation:(id)a3;
- (void)setSevereWeather:(id)a3;
@end

@implementation WFWeatherEventsConfig

- (WFWeatherEventsConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFWeatherEventsConfig;
  v5 = [(WFWeatherEventsConfig *)&v16 init];
  if (v5)
  {
    v6 = [v4 dictionaryForKey:@"cic"];
    v7 = [v4 dictionaryForKey:@"nhp"];
    v8 = [v4 dictionaryForKey:@"severe"];
    v9 = [[WFWeatherEventConfig alloc] initWithDictionary:v6 defaulEnabled:1];
    changeInConditions = v5->_changeInConditions;
    v5->_changeInConditions = v9;

    v11 = [[WFWeatherEventConfig alloc] initWithDictionary:v7 defaulEnabled:1];
    nextHourPrecipitation = v5->_nextHourPrecipitation;
    v5->_nextHourPrecipitation = v11;

    v13 = [[WFWeatherEventConfig alloc] initWithDictionary:v8 defaulEnabled:1];
    severeWeather = v5->_severeWeather;
    v5->_severeWeather = v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(WFWeatherEventConfig *)self->_changeInConditions copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(WFWeatherEventConfig *)self->_nextHourPrecipitation copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(WFWeatherEventConfig *)self->_severeWeather copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (WFWeatherEventConfig)changeInConditions
{
  return self->_changeInConditions;
}

- (void)setChangeInConditions:(id)a3
{
}

- (WFWeatherEventConfig)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
}

- (WFWeatherEventConfig)severeWeather
{
  return self->_severeWeather;
}

- (void)setSevereWeather:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_severeWeather, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_changeInConditions, 0);
}

@end