@interface APCacheableObject
+ (BOOL)supportsSecureCoding;
+ (id)associatedObjectFileNameForIdentifier:(id)a3;
+ (id)fileNameForIdentifier:(id)a3;
+ (id)findCacheableObjectForId:(id)a3 inPersistentStore:(id)a4;
+ (id)masterObjectFileNameForIdentifier:(id)a3;
- (APCacheableObject)initWithIdentifier:(id)a3 inPersistentStore:(id)a4;
- (APPersistentCachedStoreProtocol)persistentStore;
- (id)fileName;
- (id)initInPersistentStore:(id)a3;
- (void)setPersistentStore:(id)a3;
@end

@implementation APCacheableObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)masterObjectFileNameForIdentifier:(id)a3
{
  return [a3 stringByAppendingPathExtension:@"mo"];
}

+ (id)associatedObjectFileNameForIdentifier:(id)a3
{
  return [a3 stringByAppendingPathExtension:@"ao"];
}

+ (id)fileNameForIdentifier:(id)a3
{
  id v4 = a3;
  if ([a1 isMasterObject]) {
    [a1 masterObjectFileNameForIdentifier:v4];
  }
  else {
  v5 = [a1 associatedObjectFileNameForIdentifier:v4];
  }

  return v5;
}

- (id)fileName
{
  v3 = objc_opt_class();
  id v4 = [(APCacheableBaseObject *)self identifier];
  v5 = [v3 fileNameForIdentifier:v4];

  return v5;
}

- (id)initInPersistentStore:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:@"%@ persistentStore cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  v6 = +[NSUUID UUID];
  v7 = [v6 UUIDString];
  v8 = [(APCacheableObject *)self initWithIdentifier:v7 inPersistentStore:v4];

  return v8;
}

- (APCacheableObject)initWithIdentifier:(id)a3 inPersistentStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = +[NSString stringWithFormat:@"%@ identifier cannot be nil", objc_opt_class()];
    APSimulateCrash();

    if (v7) {
      goto LABEL_3;
    }
  }
  v16 = +[NSString stringWithFormat:@"%@ persistentStore cannot be nil", objc_opt_class()];
  APSimulateCrash();

LABEL_3:
  v8 = [(id)objc_opt_class() fileNameForIdentifier:v6];
  unsigned int v9 = [v7 hasObjectForKey:v8];

  if (v9)
  {
    v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Item %{public}@ already exists.", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)APCacheableObject;
    v12 = [(APCacheableSynchronizedObject *)&v17 initWithIdentifier:v6];
    v13 = v12;
    if (v12) {
      objc_storeWeak((id *)&v12->_persistentStore, v7);
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

+ (id)findCacheableObjectForId:(id)a3 inPersistentStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = +[NSString stringWithFormat:@"%@ persistentStore cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  if ([v5 length])
  {
    v8 = [(id)objc_opt_class() fileNameForIdentifier:v5];
    unsigned int v9 = [v6 objectForKey:v8];

    id v10 = v9;
    [v10 setPersistentStore:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (APPersistentCachedStoreProtocol)persistentStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentStore);

  return (APPersistentCachedStoreProtocol *)WeakRetained;
}

- (void)setPersistentStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end