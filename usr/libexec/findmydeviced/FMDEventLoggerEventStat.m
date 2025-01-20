@interface FMDEventLoggerEventStat
+ (BOOL)supportsSecureCoding;
- (FMDEventLoggerEventStat)initWithCoder:(id)a3;
- (FMDEventLoggerEventStat)initWithEventName:(id)a3;
- (NSMutableDictionary)mutableDictionary;
- (NSNumber)groupValue;
- (NSNumber)precision;
- (NSNumber)statValue;
- (NSString)description;
- (NSString)eventName;
- (NSString)groupByKey;
- (id)userInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setEventName:(id)a3;
- (void)setGroupByKey:(id)a3;
- (void)setGroupValue:(id)a3;
- (void)setMutableDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPrecision:(id)a3;
- (void)setStatValue:(id)a3;
@end

@implementation FMDEventLoggerEventStat

- (FMDEventLoggerEventStat)initWithEventName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEventLoggerEventStat;
  v5 = [(FMDEventLoggerEventStat *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(FMDEventLoggerEventStat *)v5 setEventName:v4];
    v7 = +[NSMutableDictionary dictionary];
    [(FMDEventLoggerEventStat *)v6 setMutableDictionary:v7];
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
    v7 = [(FMDEventLoggerEventStat *)self mutableDictionary];
    [v7 fm_safelySetObject:v8 forKey:v6];
  }
  else
  {
    v7 = [(FMDEventLoggerEventStat *)self mutableDictionary];
    [v7 removeObjectForKey:v6];
  }

LABEL_7:
}

- (id)userInfo
{
  v2 = [(FMDEventLoggerEventStat *)self mutableDictionary];
  id v3 = [v2 copy];

  return v3;
}

- (NSString)description
{
  id v3 = [(FMDEventLoggerEventStat *)self eventName];
  id v4 = [(FMDEventLoggerEventStat *)self statValue];
  v5 = [(FMDEventLoggerEventStat *)self groupValue];
  [v5 doubleValue];
  v7 = +[NSString stringWithFormat:@"%@ : %@ %f", v3, v4, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventStat)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDEventLoggerEventStat;
  v5 = [(FMDEventLoggerEventStat *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mutableDictionary"];
    [(FMDEventLoggerEventStat *)v5 setMutableDictionary:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventName"];
    [(FMDEventLoggerEventStat *)v5 setEventName:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statValue"];
    [(FMDEventLoggerEventStat *)v5 setStatValue:v8];

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupValue"];
    [(FMDEventLoggerEventStat *)v5 setGroupValue:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDEventLoggerEventStat *)self eventName];
  [v4 encodeObject:v5 forKey:@"eventName"];

  uint64_t v6 = [(FMDEventLoggerEventStat *)self mutableDictionary];
  [v4 encodeObject:v6 forKey:@"mutableDictionary"];

  v7 = [(FMDEventLoggerEventStat *)self statValue];
  [v4 encodeObject:v7 forKey:@"statValue"];

  id v8 = [(FMDEventLoggerEventStat *)self groupValue];
  [v4 encodeObject:v8 forKey:@"groupValue"];
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

- (NSNumber)statValue
{
  return self->_statValue;
}

- (void)setStatValue:(id)a3
{
}

- (NSNumber)groupValue
{
  return self->_groupValue;
}

- (void)setGroupValue:(id)a3
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
  objc_storeStrong((id *)&self->_groupValue, 0);
  objc_storeStrong((id *)&self->_statValue, 0);
  objc_storeStrong((id *)&self->_precision, 0);

  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end