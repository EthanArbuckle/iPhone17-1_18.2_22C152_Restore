@interface WFAirQualityResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)responseWasFromCache;
- (NSData)rawAPIData;
- (WFAirQualityConditions)airQualityConditions;
- (WFAirQualityResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAirQualityConditions:(id)a3;
- (void)setRawAPIData:(id)a3;
- (void)setResponseWasFromCache:(BOOL)a3;
@end

@implementation WFAirQualityResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAirQualityResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFAirQualityResponse;
  v5 = [(WFResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFAirQualityResponseConditionsKey"];
    [(WFAirQualityResponse *)v5 setAirQualityConditions:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAirQualityResponse;
  id v4 = a3;
  [(WFResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFAirQualityResponse *)self airQualityConditions];
  [v4 encodeObject:v5 forKey:@"WFAirQualityResponseConditionsKey"];
}

- (WFAirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (void)setAirQualityConditions:(id)a3
{
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
}

@end