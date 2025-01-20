@interface APCacheableBaseObject
+ (BOOL)supportsSecureCoding;
+ (id)cacheKeyForIdentifier:(id)a3;
+ (id)deserializeFromData:(id)a3;
+ (id)deserializeFromData:(id)a3 ignoreKeys:(id)a4;
+ (id)proxyForIdentifier:(id)a3;
- (APCacheableBaseObject)initWithCoder:(id)a3;
- (APCacheableBaseObject)initWithIdentifier:(id)a3;
- (NSString)cacheKey;
- (NSString)identifier;
- (id)proxy;
- (id)serialize;
- (int64_t)garbageCollect;
- (unint64_t)objectSize;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setObjectSize:(unint64_t)a3;
@end

@implementation APCacheableBaseObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APCacheableBaseObject *)self identifier];
  [v4 encodeObject:v5 forKey:@"_identifier"];
}

- (APCacheableBaseObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APCacheableBaseObject *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (APCacheableBaseObject)initWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(APCacheableBaseObject *)self init];
  if (v5)
  {
    uint64_t v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (NSString)cacheKey
{
  v3 = objc_opt_class();
  id v4 = [(APCacheableBaseObject *)self identifier];
  id v5 = [v3 cacheKeyForIdentifier:v4];

  return (NSString *)v5;
}

+ (id)cacheKeyForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 kind];
  uint64_t v6 = [v4 stringByAppendingPathExtension:v5];

  return v6;
}

- (id)serialize
{
  [(APCacheableBaseObject *)self lockObject];
  id v9 = 0;
  v3 = +[_APKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v4 = v9;
  [(APCacheableBaseObject *)self unlockObject];
  if (v4 || ![v3 length])
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(APCacheableBaseObject *)self identifier];
      *(_DWORD *)buf = 138543619;
      v11 = v6;
      __int16 v12 = 2113;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to serialize object %{public}@. Error: %{private}@", buf, 0x16u);
    }
    id v7 = 0;
  }
  else
  {
    id v5 = objc_getAssociatedObject(v3, "_memorySize");
    [(APCacheableBaseObject *)self setObjectSize:[v5 unsignedIntegerValue]];
    id v7 = v3;
  }

  return v7;
}

+ (id)deserializeFromData:(id)a3
{
  return [a1 deserializeFromData:a3 ignoreKeys:0];
}

+ (id)deserializeFromData:(id)a3 ignoreKeys:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v5 count])
  {
    id v17 = 0;
    id v7 = [[_APKeyedUnarchiver alloc] initForReadingFromData:v6 error:&v17];

    id v8 = v17;
    if (v7)
    {
      [v7 setIgnoreKeys:v5];
      [v7 setRequiresSecureCoding:1];
      [v7 setDecodingFailurePolicy:1];
      id v9 = +[NSSet setWithObject:objc_opt_class()];
      id v16 = v8;
      v10 = [v7 decodeTopLevelObjectOfClasses:v9 forKey:NSKeyedArchiveRootObjectKey error:&v16];
      id v11 = v16;

      id v8 = v11;
    }
    else
    {
      v10 = 0;
    }

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
    id v15 = 0;
    v10 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v15];

    id v8 = v15;
    if (v8) {
      goto LABEL_10;
    }
  }
  if (v10)
  {
    id v12 = v10;
    goto LABEL_13;
  }
LABEL_10:
  id v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to deserialize object. Error: %{private}@", buf, 0xCu);
  }

  id v12 = 0;
LABEL_13:

  return v12;
}

- (int64_t)garbageCollect
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)objectSize
{
  return self->_objectSize;
}

- (void)setObjectSize:(unint64_t)a3
{
  self->_objectSize = a3;
}

- (void).cxx_destruct
{
}

+ (id)proxyForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 cacheKeyForIdentifier:v4];
  id v6 = +[APPersistentCacheStoreProvider persistentCacheStore];
  id v7 = +[APCacheableObjectProxy proxyWithCacheKey:v5 object:0 identifier:v4 inPersistentStore:v6];

  return v7;
}

- (id)proxy
{
  v3 = [(APCacheableBaseObject *)self cacheKey];
  id v4 = +[APPersistentCacheStoreProvider persistentCacheStore];
  id v5 = +[APCacheableObjectProxy proxyWithCacheKey:v3 object:self inPersistentStore:v4];

  return v5;
}

@end