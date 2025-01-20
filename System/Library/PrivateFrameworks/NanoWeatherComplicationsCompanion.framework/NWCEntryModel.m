@interface NWCEntryModel
+ (BOOL)supportsSecureCoding;
- (NSArray)hourlyEntryModels;
- (NWCEntryModel)initWithCoder:(id)a3;
- (NWCEntryModel)initWithConditions:(id)a3 airQualityConditions:(id)a4 dailyConditions:(id)a5 timeOfDay:(unint64_t)a6;
- (NWCEntryModel)initWithConditions:(id)a3 airQualityConditions:(id)a4 hourlyEntryModels:(id)a5 dailyConditions:(id)a6 timeOfDay:(unint64_t)a7;
- (NWCEntryModel)initWithConditions:(id)a3 dailyConditions:(id)a4 timeOfDay:(unint64_t)a5;
- (NWCEntryModel)initWithConditions:(id)a3 hourlyEntryModels:(id)a4 dailyConditions:(id)a5 timeOfDay:(unint64_t)a6;
- (NWCEntryModel)initWithConditions:(id)a3 hourlyEntryModels:(id)a4 timeOfDay:(unint64_t)a5;
- (NWCEntryModel)initWithConditions:(id)a3 timeOfDay:(unint64_t)a4;
- (WFAirQualityConditions)airQualityConditions;
- (WFWeatherConditions)conditions;
- (WFWeatherConditions)dailyConditions;
- (unint64_t)timeOfDay;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NWCEntryModel

- (NWCEntryModel)initWithConditions:(id)a3 airQualityConditions:(id)a4 hourlyEntryModels:(id)a5 dailyConditions:(id)a6 timeOfDay:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NWCEntryModel;
  v17 = [(NWCEntryModel *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_conditions, a3);
    objc_storeStrong((id *)&v18->_airQualityConditions, a4);
    objc_storeStrong((id *)&v18->_hourlyEntryModels, a5);
    objc_storeStrong((id *)&v18->_dailyConditions, a6);
    v18->_timeOfDay = a7;
  }

  return v18;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyConditions, 0);
  objc_storeStrong((id *)&self->_hourlyEntryModels, 0);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);

  objc_storeStrong((id *)&self->_conditions, 0);
}

- (WFWeatherConditions)conditions
{
  return (WFWeatherConditions *)objc_getProperty(self, a2, 8, 1);
}

- (NWCEntryModel)initWithConditions:(id)a3 timeOfDay:(unint64_t)a4
{
  return [(NWCEntryModel *)self initWithConditions:a3 airQualityConditions:0 hourlyEntryModels:MEMORY[0x263EFFA68] dailyConditions:0 timeOfDay:a4];
}

- (NWCEntryModel)initWithConditions:(id)a3 hourlyEntryModels:(id)a4 timeOfDay:(unint64_t)a5
{
  return [(NWCEntryModel *)self initWithConditions:a3 airQualityConditions:0 hourlyEntryModels:a4 dailyConditions:0 timeOfDay:a5];
}

- (NWCEntryModel)initWithConditions:(id)a3 dailyConditions:(id)a4 timeOfDay:(unint64_t)a5
{
  return [(NWCEntryModel *)self initWithConditions:a3 airQualityConditions:0 hourlyEntryModels:MEMORY[0x263EFFA68] dailyConditions:a4 timeOfDay:a5];
}

- (NWCEntryModel)initWithConditions:(id)a3 hourlyEntryModels:(id)a4 dailyConditions:(id)a5 timeOfDay:(unint64_t)a6
{
  return [(NWCEntryModel *)self initWithConditions:a3 airQualityConditions:0 hourlyEntryModels:a4 dailyConditions:a5 timeOfDay:a6];
}

- (NWCEntryModel)initWithConditions:(id)a3 airQualityConditions:(id)a4 dailyConditions:(id)a5 timeOfDay:(unint64_t)a6
{
  return [(NWCEntryModel *)self initWithConditions:a3 airQualityConditions:a4 hourlyEntryModels:MEMORY[0x263EFFA68] dailyConditions:a5 timeOfDay:a6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWCEntryModel)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_conditions);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_airQualityConditions);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  id v14 = NSStringFromSelector(sel_hourlyEntryModels);
  uint64_t v15 = [v4 decodeObjectOfClasses:v13 forKey:v14];
  id v16 = (void *)v15;
  v17 = (void *)MEMORY[0x263EFFA68];
  if (v15) {
    v17 = (void *)v15;
  }
  id v18 = v17;

  uint64_t v19 = objc_opt_class();
  objc_super v20 = NSStringFromSelector(sel_dailyConditions);
  v21 = [v4 decodeObjectOfClass:v19 forKey:v20];

  v22 = NSStringFromSelector(sel_timeOfDay);
  uint64_t v23 = [v4 decodeIntegerForKey:v22];

  v24 = [(NWCEntryModel *)self initWithConditions:v7 airQualityConditions:v10 hourlyEntryModels:v18 dailyConditions:v21 timeOfDay:v23];
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NWCEntryModel *)self conditions];
  v6 = NSStringFromSelector(sel_conditions);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(NWCEntryModel *)self airQualityConditions];
  uint64_t v8 = NSStringFromSelector(sel_airQualityConditions);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(NWCEntryModel *)self hourlyEntryModels];
  v10 = NSStringFromSelector(sel_hourlyEntryModels);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(NWCEntryModel *)self dailyConditions];
  uint64_t v12 = NSStringFromSelector(sel_dailyConditions);
  [v4 encodeObject:v11 forKey:v12];

  unint64_t v13 = [(NWCEntryModel *)self timeOfDay];
  NSStringFromSelector(sel_timeOfDay);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v13 forKey:v14];
}

- (WFAirQualityConditions)airQualityConditions
{
  return (WFAirQualityConditions *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)hourlyEntryModels
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (WFWeatherConditions)dailyConditions
{
  return (WFWeatherConditions *)objc_getProperty(self, a2, 32, 1);
}

@end