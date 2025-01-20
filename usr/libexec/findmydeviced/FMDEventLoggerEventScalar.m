@interface FMDEventLoggerEventScalar
+ (BOOL)supportsSecureCoding;
- (FMDEventLoggerEventScalar)initWithCoder:(id)a3;
- (FMDEventLoggerEventScalar)initWithEventName:(id)a3;
- (NSMutableDictionary)mutableDictionary;
- (NSNumber)precision;
- (NSString)description;
- (NSString)eventName;
- (NSString)groupByKey;
- (id)userInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setEventName:(id)a3;
- (void)setGroupByKey:(id)a3;
- (void)setMutableDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPrecision:(id)a3;
@end

@implementation FMDEventLoggerEventScalar

- (FMDEventLoggerEventScalar)initWithEventName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDEventLoggerEventScalar;
  v5 = [(FMDEventLoggerEventScalar *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(FMDEventLoggerEventScalar *)v5 setEventName:v4];
    v7 = +[NSMutableDictionary dictionary];
    [(FMDEventLoggerEventScalar *)v6 setMutableDictionary:v7];

    v8 = [(FMDEventLoggerEventScalar *)v6 mutableDictionary];
    [v8 setObject:&off_1002F2080 forKeyedSubscript:@"FMDEventLoggerFacilityDataPeekCompoundScalarValue"];
  }
  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 || !v6)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = [(FMDEventLoggerEventScalar *)self mutableDictionary];
    [v7 fm_safelySetObject:v8 forKey:v6];
  }
  else
  {
    v7 = [(FMDEventLoggerEventScalar *)self mutableDictionary];
    [v7 removeObjectForKey:v6];
  }

LABEL_7:
}

- (id)userInfo
{
  v2 = [(FMDEventLoggerEventScalar *)self mutableDictionary];
  id v3 = [v2 copy];

  return v3;
}

- (NSString)description
{
  v2 = [(FMDEventLoggerEventScalar *)self mutableDictionary];
  id v3 = [v2 description];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventScalar)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEventLoggerEventScalar;
  v5 = [(FMDEventLoggerEventScalar *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mutableDictionary"];
    [(FMDEventLoggerEventScalar *)v5 setMutableDictionary:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventName"];
    [(FMDEventLoggerEventScalar *)v5 setEventName:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDEventLoggerEventScalar *)self eventName];
  [v4 encodeObject:v5 forKey:@"eventName"];

  id v6 = [(FMDEventLoggerEventScalar *)self mutableDictionary];
  [v4 encodeObject:v6 forKey:@"mutableDictionary"];
}

- (NSString)groupByKey
{
  return self->_groupByKey;
}

- (void)setGroupByKey:(id)a3
{
}

- (NSNumber)precision
{
  return self->_precision;
}

- (void)setPrecision:(id)a3
{
}

- (NSMutableDictionary)mutableDictionary
{
  return self->_mutableDictionary;
}

- (void)setMutableDictionary:(id)a3
{
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_mutableDictionary, 0);
  objc_storeStrong((id *)&self->_precision, 0);

  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end