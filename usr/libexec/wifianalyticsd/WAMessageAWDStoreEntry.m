@interface WAMessageAWDStoreEntry
+ (BOOL)supportsSecureCoding;
- (WAMessageAWD)message;
- (WAMessageAWDStoreEntry)init;
- (WAMessageAWDStoreEntry)initWithCoder:(id)a3;
- (WAMessageAWDStoreEntry)initWithPayload:(id)a3;
- (id)description;
- (id)payload;
- (unint64_t)lastModifiedTimeInMillisecondEpoch;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setLastModifiedTimeInMillisecondEpoch:(unint64_t)a3;
- (void)setPayload:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)updatePayload:(id)a3;
@end

@implementation WAMessageAWDStoreEntry

- (WAMessageAWDStoreEntry)initWithPayload:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WAMessageAWDStoreEntry;
  v6 = [(WAMessageAWDStoreEntry *)&v13 init];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding])
  {
    objc_storeStrong(&v6->_payload, a3);
    v7 = +[NSDate date];
    [v7 timeIntervalSince1970];
    v6->_lastModifiedTimeInMillisecondEpoch = (unint64_t)(v8 * 1000.0);

    v9 = +[NSKeyedArchiver archivedDataWithRootObject:v6->_payload requiringSecureCoding:1 error:0];
    v6->_size = (unint64_t)[v9 length];

    v10 = v6;
  }
  else
  {
    v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAMessageAWDStoreEntry initWithPayload:]";
      __int16 v16 = 1024;
      int v17 = 29;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWDStoreEntry can only accept payloads that conform to the NSSecureCoding protocol, returning nil", buf, 0x12u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)updatePayload:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToProtocol:&OBJC_PROTOCOL___NSSecureCoding] & 1) == 0)
  {
    v14 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v16 = 136446466;
    int v17 = "-[WAMessageAWDStoreEntry updatePayload:]";
    __int16 v18 = 1024;
    int v19 = 49;
    v15 = "%{public}s::%d:WAMessageAWDStoreEntry can only accept payloads that conform to the NSSecureCoding protocol, returning nil";
    goto LABEL_8;
  }
  id v5 = [(WAMessageAWDStoreEntry *)self payload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v14 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v16 = 136446466;
    int v17 = "-[WAMessageAWDStoreEntry updatePayload:]";
    __int16 v18 = 1024;
    int v19 = 50;
    v15 = "%{public}s::%d:-[WAMessageAWDStoreEntry updatePayload:] can only accept payloads of the same class type that w"
          "as used to initalize this instance";
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v4 uuid];
    double v8 = [(WAMessageAWDStoreEntry *)self payload];
    v9 = [v8 uuid];
    unsigned __int8 v10 = [v7 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      v14 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }
      int v16 = 136446466;
      int v17 = "-[WAMessageAWDStoreEntry updatePayload:]";
      __int16 v18 = 1024;
      int v19 = 51;
      v15 = "%{public}s::%d:-[WAMessageAWDStoreEntry updatePayload:] can only accept updated payloads of type WAMessageAW"
            "D where the update has the same uuid as the WAMessageAWD instance used to initialize this entry";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0x12u);
      goto LABEL_9;
    }
  }
  [(WAMessageAWDStoreEntry *)self setPayload:v4];
  v11 = +[NSDate date];
  [v11 timeIntervalSince1970];
  [(WAMessageAWDStoreEntry *)self setLastModifiedTimeInMillisecondEpoch:(unint64_t)(v12 * 1000.0)];

  objc_super v13 = +[NSKeyedArchiver archivedDataWithRootObject:self->_payload requiringSecureCoding:1 error:0];
  -[WAMessageAWDStoreEntry setSize:](self, "setSize:", [v13 length]);

LABEL_10:
}

- (WAMessageAWD)message
{
  v3 = [(WAMessageAWDStoreEntry *)self payload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(WAMessageAWDStoreEntry *)self payload];
  }
  else
  {
    id v5 = 0;
  }

  return (WAMessageAWD *)v5;
}

- (WAMessageAWDStoreEntry)init
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"-init is not a valid initializer for this class" userInfo:0];
  objc_exception_throw(v2);
}

- (id)description
{
  v3 = [(WAMessageAWDStoreEntry *)self payload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(WAMessageAWDStoreEntry *)self payload];
    v6 = [v5 key];
    v7 = [(WAMessageAWDStoreEntry *)self payload];
    double v8 = [v7 originalClassName];
    v9 = +[NSDate dateWithTimeIntervalSince1970:(double)([(WAMessageAWDStoreEntry *)self lastModifiedTimeInMillisecondEpoch]/ 0x3E8)];
    unsigned __int8 v10 = +[NSString stringWithFormat:@"Message with key: %@ original classname: %@ added: %@ + %llu size: %lu", v6, v8, v9, [(WAMessageAWDStoreEntry *)self lastModifiedTimeInMillisecondEpoch] % 0x3E8, [(WAMessageAWDStoreEntry *)self size]];
  }
  else
  {
    id v5 = +[NSDate dateWithTimeIntervalSince1970:(double)([(WAMessageAWDStoreEntry *)self lastModifiedTimeInMillisecondEpoch]/ 0x3E8)];
    unsigned __int8 v10 = +[NSString stringWithFormat:@"added: %@ + %llu size: %lu", v5, [(WAMessageAWDStoreEntry *)self lastModifiedTimeInMillisecondEpoch] % 0x3E8, [(WAMessageAWDStoreEntry *)self size]];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id payload = self->_payload;
  id v5 = a3;
  [v5 encodeObject:payload forKey:@"_payload"];
  [v5 encodeInt64:self->_lastModifiedTimeInMillisecondEpoch forKey:@"_lastModifiedTimeInMillisecondEpoch"];
  [v5 encodeInteger:self->_size forKey:@"_size"];
}

- (WAMessageAWDStoreEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WAMessageAWDStoreEntry;
  id v5 = [(WAMessageAWDStoreEntry *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    double v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_payload"];
    id payload = v5->_payload;
    v5->_id payload = (id)v9;

    v5->_lastModifiedTimeInMillisecondEpoch = (unint64_t)[v4 decodeInt64ForKey:@"_lastModifiedTimeInMillisecondEpoch"];
    v5->_size = (unint64_t)[v4 decodeIntegerForKey:@"_size"];
  }

  return v5;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (unint64_t)lastModifiedTimeInMillisecondEpoch
{
  return self->_lastModifiedTimeInMillisecondEpoch;
}

- (void)setLastModifiedTimeInMillisecondEpoch:(unint64_t)a3
{
  self->_lastModifiedTimeInMillisecondEpoch = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end