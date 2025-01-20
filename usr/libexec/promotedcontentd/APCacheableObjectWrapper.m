@interface APCacheableObjectWrapper
+ (BOOL)supportsSecureCoding;
- (APCacheableObjectWrapper)initWithCoder:(id)a3;
- (APCacheableObjectWrapper)initWithObject:(id)a3 identifier:(id)a4;
- (BOOL)canBeGarbageCollected;
- (id)object;
- (int64_t)garbageCollect;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APCacheableObjectWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)APCacheableObjectWrapper;
  id v4 = a3;
  [(APCacheableBaseObject *)&v6 encodeWithCoder:v4];
  v5 = [(APCacheableObjectWrapper *)self object];
  [v4 encodeObject:v5 forKey:@"object"];
}

- (APCacheableObjectWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APCacheableObjectWrapper;
  v5 = [(APCacheableBaseObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:[objc_opt_class() objectClass] forKey:@"object"];
    id object = v5->_object;
    v5->_id object = (id)v6;
  }
  return v5;
}

- (APCacheableObjectWrapper)initWithObject:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  v8 = [(APCacheableBaseObject *)self initWithIdentifier:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_object, a3);
  }

  return v9;
}

- (BOOL)canBeGarbageCollected
{
  return 1;
}

- (int64_t)garbageCollect
{
  if (![(APCacheableObjectWrapper *)self canBeGarbageCollected]) {
    return 0;
  }
  if (sub_100180140(self)) {
    return 1;
  }
  id v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [(id)objc_opt_class() objectClass];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(APCacheableBaseObject *)self identifier];
    int v7 = 138478083;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to remove '%{private}@' '%{public}@'.", (uint8_t *)&v7, 0x16u);
  }
  return -1;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
}

@end