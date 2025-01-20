@interface FMDEventLoggerEventError
+ (BOOL)supportsSecureCoding;
- (FMDEventLoggerEventError)initWithCoder:(id)a3;
- (FMDEventLoggerEventError)initWithEventName:(id)a3;
- (NSError)error;
- (NSMutableDictionary)mutableDictionary;
- (NSNumber)precision;
- (NSString)eventName;
- (NSString)groupByKey;
- (id)dictionaryForError:(id)a3;
- (id)userInfo;
- (void)_populateInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setEventName:(id)a3;
- (void)setGroupByKey:(id)a3;
- (void)setMutableDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPrecision:(id)a3;
@end

@implementation FMDEventLoggerEventError

- (FMDEventLoggerEventError)initWithEventName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDEventLoggerEventError;
  v5 = [(FMDEventLoggerEventError *)&v8 init];
  if (v5)
  {
    v6 = +[NSMutableDictionary dictionary];
    [(FMDEventLoggerEventError *)v5 setMutableDictionary:v6];

    [(FMDEventLoggerEventError *)v5 setEventName:v4];
  }

  return v5;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);

  [(FMDEventLoggerEventError *)self _populateInfo];
}

- (void)_populateInfo
{
  v3 = +[NSMutableArray array];
  id v4 = [(FMDEventLoggerEventError *)self error];
  v5 = [(FMDEventLoggerEventError *)self dictionaryForError:v4];
  [v3 addObject:v5];

  v6 = [(FMDEventLoggerEventError *)self error];
  v7 = [v6 userInfo];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CF64;
  v12[3] = &unk_1002D9CA0;
  id v13 = v3;
  v14 = self;
  id v8 = v3;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  CFStringRef v15 = @"errors";
  id v16 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v10 = [(FMDEventLoggerEventError *)self mutableDictionary];
  v11 = [(FMDEventLoggerEventError *)self eventName];
  [v10 fm_safelySetObject:v9 forKey:v11];
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
    v7 = [(FMDEventLoggerEventError *)self mutableDictionary];
    [v7 fm_safelySetObject:v8 forKey:v6];
  }
  else
  {
    v7 = [(FMDEventLoggerEventError *)self mutableDictionary];
    [v7 removeObjectForKey:v6];
  }

LABEL_7:
}

- (id)userInfo
{
  v2 = [(FMDEventLoggerEventError *)self mutableDictionary];
  id v3 = [v2 copy];

  return v3;
}

- (id)dictionaryForError:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  v5 = [v3 domain];
  [v4 fm_safelyMapKey:@"domain" toObject:v5];

  id v6 = [v3 code];
  v7 = +[NSNumber numberWithInteger:v6];
  [v4 fm_safelyMapKey:@"code" toObject:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventError)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEventLoggerEventError;
  v5 = [(FMDEventLoggerEventError *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mutableDictionary"];
    [(FMDEventLoggerEventError *)v5 setMutableDictionary:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventName"];
    [(FMDEventLoggerEventError *)v5 setEventName:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDEventLoggerEventError *)self eventName];
  [v4 encodeObject:v5 forKey:@"eventName"];

  id v6 = [(FMDEventLoggerEventError *)self mutableDictionary];
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

- (NSError)error
{
  return self->_error;
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_precision, 0);

  objc_storeStrong((id *)&self->_groupByKey, 0);
}

@end