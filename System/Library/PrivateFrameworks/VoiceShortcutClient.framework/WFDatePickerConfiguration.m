@interface WFDatePickerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDate)defaultDate;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (NSString)datePickerMode;
- (WFDatePickerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDatePickerMode:(id)a3;
- (void)setDefaultDate:(id)a3;
- (void)setMaximumDate:(id)a3;
- (void)setMinimumDate:(id)a3;
@end

@implementation WFDatePickerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_datePickerMode, 0);
}

- (void)setMaximumDate:(id)a3
{
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (void)setMinimumDate:(id)a3
{
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (void)setDefaultDate:(id)a3
{
}

- (NSDate)defaultDate
{
  return self->_defaultDate;
}

- (void)setDatePickerMode:(id)a3
{
}

- (NSString)datePickerMode
{
  return self->_datePickerMode;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFDatePickerConfiguration *)self datePickerMode];
  [v4 encodeObject:v5 forKey:@"datePickerMode"];

  v6 = [(WFDatePickerConfiguration *)self defaultDate];
  [v4 encodeObject:v6 forKey:@"defaultDate"];

  v7 = [(WFDatePickerConfiguration *)self maximumDate];
  [v4 encodeObject:v7 forKey:@"maximumDate"];

  id v8 = [(WFDatePickerConfiguration *)self minimumDate];
  [v4 encodeObject:v8 forKey:@"minimumDate"];
}

- (WFDatePickerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFDatePickerConfiguration;
  v5 = [(WFDatePickerConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datePickerMode"];
    datePickerMode = v5->_datePickerMode;
    v5->_datePickerMode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultDate"];
    defaultDate = v5->_defaultDate;
    v5->_defaultDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumDate"];
    maximumDate = v5->_maximumDate;
    v5->_maximumDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumDate"];
    minimumDate = v5->_minimumDate;
    v5->_minimumDate = (NSDate *)v12;

    v14 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFDatePickerConfiguration *)self datePickerMode];
  [v4 setDatePickerMode:v5];

  uint64_t v6 = [(WFDatePickerConfiguration *)self defaultDate];
  [v4 setDefaultDate:v6];

  v7 = [(WFDatePickerConfiguration *)self maximumDate];
  [v4 setMaximumDate:v7];

  uint64_t v8 = [(WFDatePickerConfiguration *)self minimumDate];
  [v4 setMinimumDate:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end