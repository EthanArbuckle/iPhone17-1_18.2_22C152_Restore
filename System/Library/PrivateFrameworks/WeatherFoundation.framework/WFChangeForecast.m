@interface WFChangeForecast
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSString)descriptionDifferentTimeZone;
- (NSString)descriptionSameTimeZone;
- (WFChangeForecast)initWithCoder:(id)a3;
- (WFChangeForecast)initWithDate:(id)a3 descriptionSameTimeZone:(id)a4 descriptionDifferentTimeZone:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFChangeForecast

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFChangeForecast)initWithDate:(id)a3 descriptionSameTimeZone:(id)a4 descriptionDifferentTimeZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFChangeForecast;
  v11 = [(WFChangeForecast *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    date = v11->_date;
    v11->_date = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_descriptionSameTimeZone, a4);
    objc_storeStrong((id *)&v11->_descriptionDifferentTimeZone, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [WFChangeForecast alloc];
  date = self->_date;
  descriptionSameTimeZone = self->_descriptionSameTimeZone;
  return [(WFChangeForecast *)v4 initWithDate:date descriptionSameTimeZone:descriptionSameTimeZone descriptionDifferentTimeZone:descriptionSameTimeZone];
}

- (WFChangeForecast)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFChangeForecastDateKey"];
  v6 = [v4 decodeObjectForKey:@"WFChangeForecastSameTimeZoneDescriptionKey"];
  v7 = [v4 decodeObjectForKey:@"WFChangeForecastDifferentTimeZoneDescriptionKey"];

  id v8 = [(WFChangeForecast *)self initWithDate:v5 descriptionSameTimeZone:v6 descriptionDifferentTimeZone:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"WFChangeForecastDateKey"];
  [v5 encodeObject:self->_descriptionSameTimeZone forKey:@"WFChangeForecastSameTimeZoneDescriptionKey"];
  [v5 encodeObject:self->_descriptionDifferentTimeZone forKey:@"WFChangeForecastDifferentTimeZoneDescriptionKey"];
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)descriptionSameTimeZone
{
  return self->_descriptionSameTimeZone;
}

- (NSString)descriptionDifferentTimeZone
{
  return self->_descriptionDifferentTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionDifferentTimeZone, 0);
  objc_storeStrong((id *)&self->_descriptionSameTimeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end