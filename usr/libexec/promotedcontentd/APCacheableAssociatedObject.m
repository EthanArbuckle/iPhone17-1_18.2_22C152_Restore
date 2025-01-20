@interface APCacheableAssociatedObject
+ (BOOL)isMasterObject;
+ (BOOL)supportsSecureCoding;
- (APCacheableAssociatedObject)initWithCoder:(id)a3;
- (APCacheableAssociatedObject)initWithMaster:(id)a3;
- (APCacheableMasterObject)masterObject;
- (BOOL)isNewObject;
- (BOOL)save;
- (NSString)masterId;
- (void)encodeWithCoder:(id)a3;
- (void)remove;
- (void)setIsNewObject:(BOOL)a3;
@end

@implementation APCacheableAssociatedObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)APCacheableAssociatedObject;
  id v4 = a3;
  [(APCacheableBaseObject *)&v6 encodeWithCoder:v4];
  v5 = [(APCacheableAssociatedObject *)self masterId];
  [v4 encodeObject:v5 forKey:@"_master_id"];
}

- (APCacheableAssociatedObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APCacheableAssociatedObject;
  v5 = [(APCacheableSynchronizedObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_master_id"];
    masterId = v5->_masterId;
    v5->_masterId = (NSString *)v6;
  }
  return v5;
}

- (APCacheableAssociatedObject)initWithMaster:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:@"%@ master cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  uint64_t v6 = [v4 persistentStore];
  v7 = [(APCacheableObject *)self initInPersistentStore:v6];

  if (v7)
  {
    v8 = [v4 identifier];
    objc_super v9 = (NSString *)[v8 copy];
    masterId = v7->_masterId;
    v7->_masterId = v9;

    v7->_isNewObject = 1;
  }

  return v7;
}

+ (BOOL)isMasterObject
{
  return 0;
}

- (APCacheableMasterObject)masterObject
{
  p_masterObject = &self->_masterObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_masterObject);
  if (!WeakRetained)
  {
    v5 = [(APCacheableAssociatedObject *)self masterId];
    id v6 = [v5 length];

    if (v6)
    {
      v7 = [(APCacheableAssociatedObject *)self masterId];
      v8 = [(APCacheableObject *)self persistentStore];
      WeakRetained = +[APCacheableObject findCacheableObjectForId:v7 inPersistentStore:v8];

      if (!WeakRetained)
      {
        objc_super v9 = APLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = [(APCacheableAssociatedObject *)self masterId];
          v11 = [(APCacheableBaseObject *)self identifier];
          int v13 = 138478083;
          v14 = v10;
          __int16 v15 = 2113;
          v16 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to reconstitute master object with id: '%{private}@' for associated object: '%{private}@'. Data consistency is broken.", (uint8_t *)&v13, 0x16u);
        }
      }
      objc_storeWeak((id *)p_masterObject, WeakRetained);
    }
    else
    {
      WeakRetained = 0;
    }
  }

  return (APCacheableMasterObject *)WeakRetained;
}

- (BOOL)save
{
  v3 = [(APCacheableAssociatedObject *)self masterObject];
  if (!v3)
  {
    id v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [(APCacheableBaseObject *)self identifier];
      int v10 = 138477827;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Master object is not available while saving '%{private}@'.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_11;
  }
  [(APCacheableSynchronizedObject *)self lockObject];
  if (![(APCacheableAssociatedObject *)self isNewObject])
  {
    [(APCacheableSynchronizedObject *)self unlockObject];
    [v3 touch];
    goto LABEL_9;
  }
  if (([v3 addAssociatedObject:self] & 1) == 0)
  {
    [(APCacheableSynchronizedObject *)self unlockObject];
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  [v3 save];
  [(APCacheableAssociatedObject *)self setIsNewObject:0];
  [(APCacheableSynchronizedObject *)self unlockObject];
LABEL_9:
  id v6 = [(APCacheableObject *)self persistentStore];
  v7 = [(APCacheableObject *)self fileName];
  [v6 setObject:self forKey:v7];

  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void)remove
{
  v3 = [(APCacheableAssociatedObject *)self masterObject];
  id v4 = v3;
  if (v3)
  {
    [v3 removeAssociatedObject:self];
    [v4 save];
  }
  else
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(APCacheableBaseObject *)self identifier];
      int v9 = 138477827;
      int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Master object is not available while removing '%{private}@'.", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = [(APCacheableObject *)self persistentStore];
  BOOL v8 = [(APCacheableObject *)self fileName];
  [v7 removeObjectForKey:v8];
}

- (NSString)masterId
{
  return self->_masterId;
}

- (BOOL)isNewObject
{
  return self->_isNewObject;
}

- (void)setIsNewObject:(BOOL)a3
{
  self->_isNewObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterId, 0);

  objc_destroyWeak((id *)&self->_masterObject);
}

@end