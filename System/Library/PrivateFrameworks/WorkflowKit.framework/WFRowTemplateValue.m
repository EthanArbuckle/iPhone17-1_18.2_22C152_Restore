@interface WFRowTemplateValue
+ (BOOL)supportsSecureCoding;
- (BOOL)removable;
- (Class)contentItemClass;
- (NSDate)anotherDate;
- (NSDate)date;
- (NSNumber)BOOLean;
- (NSNumber)byteCountUnit;
- (NSNumber)calendarUnit;
- (NSNumber)number;
- (NSObject)enumeration;
- (NSString)contentPropertyName;
- (NSString)email;
- (NSString)phone;
- (NSString)string;
- (NSUnit)measurementUnit;
- (WFRowTemplateValue)initWithCoder:(id)a3;
- (WFRowTemplateValue)initWithContentItemClass:(Class)a3 contentPropertyName:(id)a4 comparisonOperator:(int64_t)a5 removable:(BOOL)a6;
- (int64_t)comparisonOperator;
- (void)encodeWithCoder:(id)a3;
- (void)setAnotherDate:(id)a3;
- (void)setBoolean:(id)a3;
- (void)setByteCountUnit:(id)a3;
- (void)setCalendarUnit:(id)a3;
- (void)setDate:(id)a3;
- (void)setEmail:(id)a3;
- (void)setEnumeration:(id)a3;
- (void)setMeasurementUnit:(id)a3;
- (void)setNumber:(id)a3;
- (void)setPhone:(id)a3;
- (void)setString:(id)a3;
@end

@implementation WFRowTemplateValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anotherDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_measurementUnit, 0);
  objc_storeStrong((id *)&self->_byteCountUnit, 0);
  objc_storeStrong((id *)&self->_calendarUnit, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_BOOLean, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_enumeration, 0);
  objc_storeStrong((id *)&self->_contentPropertyName, 0);
  objc_storeStrong((id *)&self->_contentItemClass, 0);
}

- (void)setAnotherDate:(id)a3
{
}

- (NSDate)anotherDate
{
  return self->_anotherDate;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setMeasurementUnit:(id)a3
{
}

- (NSUnit)measurementUnit
{
  return self->_measurementUnit;
}

- (void)setByteCountUnit:(id)a3
{
}

- (NSNumber)byteCountUnit
{
  return self->_byteCountUnit;
}

- (void)setCalendarUnit:(id)a3
{
}

- (NSNumber)calendarUnit
{
  return self->_calendarUnit;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setPhone:(id)a3
{
}

- (NSString)phone
{
  return self->_phone;
}

- (void)setNumber:(id)a3
{
}

- (NSNumber)number
{
  return self->_number;
}

- (void)setBoolean:(id)a3
{
}

- (NSNumber)BOOLean
{
  return self->_BOOLean;
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setEnumeration:(id)a3
{
}

- (NSObject)enumeration
{
  return self->_enumeration;
}

- (BOOL)removable
{
  return self->_removable;
}

- (int64_t)comparisonOperator
{
  return self->_comparisonOperator;
}

- (NSString)contentPropertyName
{
  return self->_contentPropertyName;
}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (void)encodeWithCoder:(id)a3
{
  contentItemClass = self->_contentItemClass;
  id v8 = a3;
  v5 = NSStringFromClass(contentItemClass);
  [v8 encodeObject:v5 forKey:@"contentItemClass"];

  [v8 encodeObject:self->_contentPropertyName forKey:@"contentPropertyName"];
  v6 = [NSNumber numberWithInteger:self->_comparisonOperator];
  [v8 encodeObject:v6 forKey:@"comparisonOperator"];

  v7 = [NSNumber numberWithBool:self->_removable];
  [v8 encodeObject:v7 forKey:@"removable"];

  [v8 encodeObject:self->_enumeration forKey:@"enumeration"];
  [v8 encodeObject:self->_string forKey:@"string"];
  [v8 encodeObject:self->_BOOLean forKey:@"BOOLean"];
  [v8 encodeObject:self->_number forKey:@"number"];
  [v8 encodeObject:self->_phone forKey:@"phone"];
  [v8 encodeObject:self->_email forKey:@"email"];
  [v8 encodeObject:self->_calendarUnit forKey:@"calendarUnit"];
  [v8 encodeObject:self->_byteCountUnit forKey:@"byteCountUnit"];
  [v8 encodeObject:self->_measurementUnit forKey:@"measurementUnit"];
  [v8 encodeObject:self->_date forKey:@"date"];
  [v8 encodeObject:self->_anotherDate forKey:@"anotherDate"];
}

- (WFRowTemplateValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentItemClass"];
  Class v6 = NSClassFromString(v5);

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentPropertyName"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"comparisonOperator"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"removable"];
  uint64_t v11 = [v10 BOOLValue];

  v12 = [(WFRowTemplateValue *)self initWithContentItemClass:v6 contentPropertyName:v7 comparisonOperator:v9 removable:v11];
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"enumeration"];
    enumeration = v12->_enumeration;
    v12->_enumeration = v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    string = v12->_string;
    v12->_string = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BOOLean"];
    BOOLean = v12->_BOOLean;
    v12->_BOOLean = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"number"];
    number = v12->_number;
    v12->_number = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phone"];
    phone = v12->_phone;
    v12->_phone = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"email"];
    email = v12->_email;
    v12->_email = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarUnit"];
    calendarUnit = v12->_calendarUnit;
    v12->_calendarUnit = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byteCountUnit"];
    byteCountUnit = v12->_byteCountUnit;
    v12->_byteCountUnit = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"measurementUnit"];
    measurementUnit = v12->_measurementUnit;
    v12->_measurementUnit = (NSUnit *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v12->_date;
    v12->_date = (NSDate *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anotherDate"];
    anotherDate = v12->_anotherDate;
    v12->_anotherDate = (NSDate *)v38;

    v40 = v12;
  }

  return v12;
}

- (WFRowTemplateValue)initWithContentItemClass:(Class)a3 contentPropertyName:(id)a4 comparisonOperator:(int64_t)a5 removable:(BOOL)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFRowTemplateValue;
  uint64_t v11 = [(WFRowTemplateValue *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentItemClass, a3);
    uint64_t v13 = [v10 copy];
    contentPropertyName = v12->_contentPropertyName;
    v12->_contentPropertyName = (NSString *)v13;

    v12->_comparisonOperator = a5;
    v12->_removable = a6;
    uint64_t v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end