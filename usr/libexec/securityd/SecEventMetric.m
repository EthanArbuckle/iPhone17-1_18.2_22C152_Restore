@interface SecEventMetric
+ (BOOL)supportsSecureCoding;
+ (id)supportedAttributeClasses;
- (NSMutableDictionary)attributes;
- (NSString)eventName;
- (SecEventMetric)initWithCoder:(id)a3;
- (SecEventMetric)initWithEventName:(id)a3;
- (id)generateError:(id)a3;
- (id)genericEvent;
- (unint64_t)convertTimeIntervalToServerTime:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setEventName:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation SecEventMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)generateError:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SECC2MPError);
  v6 = [v4 domain];
  [(SECC2MPError *)v5 setErrorDomain:v6];

  -[SECC2MPError setErrorCode:](v5, "setErrorCode:", [v4 code]);
  if (+[SecC2DeviceInfo isAppleInternal])
  {
    v7 = [v4 userInfo];
    v8 = [v7 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    [(SECC2MPError *)v5 setErrorDescription:v8];
  }
  v9 = [v4 userInfo];
  v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (v10)
  {
    v11 = [(SecEventMetric *)self generateError:v10];
    [(SECC2MPError *)v5 setUnderlyingError:v11];
  }

  return v5;
}

- (id)genericEvent
{
  v3 = objc_alloc_init(SECC2MPGenericEvent);
  id v4 = [(SecEventMetric *)self eventName];
  [(SECC2MPGenericEvent *)v3 setName:v4];

  [(SECC2MPGenericEvent *)v3 setType:201];
  [(SECC2MPGenericEvent *)v3 setTimestampStart:0];
  [(SECC2MPGenericEvent *)v3 setTimestampEnd:0];
  v5 = [(SecEventMetric *)self attributes];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001D2924;
  v10[3] = &unk_100307068;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  v7 = v11;
  v8 = v6;

  return v8;
}

- (unint64_t)convertTimeIntervalToServerTime:(double)a3
{
  return (unint64_t)((a3 + 978307200.0) * 1000.0);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
      v8 = [objc_opt_class() supportedAttributeClasses];
      v9 = (char *)[v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v8);
            }
            if (objc_opt_isKindOfClass())
            {

              goto LABEL_14;
            }
            ++v11;
          }
          while (v9 != v11);
          v9 = (char *)[v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543618;
        id v21 = v7;
        __int16 v22 = 2114;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "genericMetric  %{public}@ with unhandled metric type: %{public}@", buf, 0x16u);
      }
    }
    else
    {
LABEL_14:
      v14 = self;
      objc_sync_enter(v14);
      v15 = [(SecEventMetric *)v14 attributes];
      [v15 setObject:v6 forKeyedSubscript:v7];

      objc_sync_exit(v14);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SecEventMetric *)self eventName];
  [v4 encodeObject:v5 forKey:@"eventName"];

  id v6 = [(SecEventMetric *)self attributes];
  [v4 encodeObject:v6 forKey:@"attributes"];
}

- (SecEventMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SecEventMetric;
  v5 = [(SecEventMetric *)&v14 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() supportedAttributeClasses];
    id v7 = [v6 mutableCopy];

    [v7 addObject:objc_opt_class()];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClasses:v7 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v10;

    if (!v5->_eventName || !v5->_attributes)
    {

      v12 = 0;
      goto LABEL_7;
    }
  }
  v12 = v5;
LABEL_7:

  return v12;
}

- (SecEventMetric)initWithEventName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SecEventMetric;
  v5 = [(SecEventMetric *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    [(SecEventMetric *)v5 setEventName:v4];
    id v7 = +[NSMutableDictionary dictionary];
    [(SecEventMetric *)v6 setAttributes:v7];

    uint64_t v8 = v6;
  }

  return v6;
}

+ (id)supportedAttributeClasses
{
  if (qword_10035D2D8 != -1) {
    dispatch_once(&qword_10035D2D8, &stru_100307040);
  }
  v2 = (void *)qword_10035D2D0;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end