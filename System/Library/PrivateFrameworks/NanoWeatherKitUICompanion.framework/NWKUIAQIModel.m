@interface NWKUIAQIModel
- (NSDate)date;
- (NSDate)expiration;
- (NSString)categoryDescription;
- (NSString)label;
- (NSString)name;
- (NWKUIAQIModel)initWithAirQualityConditions:(id)a3 color:(id)a4;
- (NWKUIAQIModel)initWithName:(id)a3 label:(id)a4 categoryDescription:(id)a5 color:(id)a6 date:(id)a7 expiration:(id)a8;
- (UIColor)color;
@end

@implementation NWKUIAQIModel

- (NWKUIAQIModel)initWithAirQualityConditions:(id)a3 color:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NWKUIAQIModel;
  v8 = [(NWKUIAQIModel *)&v23 init];
  if (v8)
  {
    v9 = [v6 scale];
    uint64_t v10 = [v9 displayName];
    name = v8->_name;
    v8->_name = (NSString *)v10;

    v12 = [v6 scale];
    uint64_t v13 = [v12 displayLabel];
    label = v8->_label;
    v8->_label = (NSString *)v13;

    v15 = [v6 currentScaleCategory];
    uint64_t v16 = [v15 categoryName];
    categoryDescription = v8->_categoryDescription;
    v8->_categoryDescription = (NSString *)v16;

    objc_storeStrong((id *)&v8->_color, a4);
    uint64_t v18 = [v6 date];
    date = v8->_date;
    v8->_date = (NSDate *)v18;

    uint64_t v20 = [v6 expirationDate];
    expiration = v8->_expiration;
    v8->_expiration = (NSDate *)v20;
  }
  return v8;
}

- (NWKUIAQIModel)initWithName:(id)a3 label:(id)a4 categoryDescription:(id)a5 color:(id)a6 date:(id)a7 expiration:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)NWKUIAQIModel;
  uint64_t v20 = [(NWKUIAQIModel *)&v28 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    label = v20->_label;
    v20->_label = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    categoryDescription = v20->_categoryDescription;
    v20->_categoryDescription = (NSString *)v25;

    objc_storeStrong((id *)&v20->_color, a6);
    objc_storeStrong((id *)&v20->_date, a7);
    objc_storeStrong((id *)&v20->_expiration, a8);
  }

  return v20;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)categoryDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)expiration
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_categoryDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end