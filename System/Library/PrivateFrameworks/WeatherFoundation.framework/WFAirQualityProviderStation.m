@interface WFAirQualityProviderStation
- (CLLocation)location;
- (NSDate)lastReadDate;
- (WFAirQualityProviderStation)initWithLocation:(id)a3 lastReadDate:(id)a4;
- (id)description;
@end

@implementation WFAirQualityProviderStation

- (WFAirQualityProviderStation)initWithLocation:(id)a3 lastReadDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAirQualityProviderStation;
  v9 = [(WFAirQualityProviderStation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_location, a3);
    objc_storeStrong((id *)&v10->_lastReadDate, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(WFAirQualityProviderStation *)self location];
  v5 = [(WFAirQualityProviderStation *)self lastReadDate];
  v6 = [v3 stringWithFormat:@"<WFAirQualityProviderStation location: %@, lastReadDate: %@", v4, v5];

  return v6;
}

- (NSDate)lastReadDate
{
  return self->_lastReadDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_lastReadDate, 0);
}

@end