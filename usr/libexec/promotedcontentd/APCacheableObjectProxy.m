@interface APCacheableObjectProxy
+ (BOOL)objectIsLoaded:(id)a3;
+ (id)proxyWithCacheKey:(id)a3 inPersistentStore:(id)a4;
+ (id)proxyWithCacheKey:(id)a3 object:(id)a4 identifier:(id)a5 inPersistentStore:(id)a6;
+ (id)proxyWithCacheKey:(id)a3 object:(id)a4 inPersistentStore:(id)a5;
- (APCacheableBaseObject)proxyObject;
- (APPersistentCachedStoreProtocol)persistentStore;
- (BOOL)_proxiedObjectIsAlive;
- (NSString)cacheKey;
- (NSString)identifier;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)provideIgnorableKeyNamesBlock;
- (void)forwardInvocation:(id)a3;
- (void)setProvideIgnorableKeyNamesBlock:(id)a3;
@end

@implementation APCacheableObjectProxy

+ (id)proxyWithCacheKey:(id)a3 inPersistentStore:(id)a4
{
  return [a1 proxyWithCacheKey:a3 object:0 identifier:0 inPersistentStore:a4];
}

+ (id)proxyWithCacheKey:(id)a3 object:(id)a4 inPersistentStore:(id)a5
{
  return [a1 proxyWithCacheKey:a3 object:a4 identifier:0 inPersistentStore:a5];
}

+ (id)proxyWithCacheKey:(id)a3 object:(id)a4 identifier:(id)a5 inPersistentStore:(id)a6
{
  v9 = (NSString *)a3;
  v10 = (APCacheableBaseObject *)a4;
  id v11 = a6;
  id v12 = a5;
  v13 = [APCacheableObjectProxy alloc];
  cacheKey = v13->_cacheKey;
  v13->_cacheKey = v9;
  v15 = v9;

  proxyObject = v13->_proxyObject;
  v13->_proxyObject = v10;
  v17 = v10;

  objc_storeWeak((id *)&v13->_persistentStore, v11);
  v18 = (NSString *)[v12 copy];

  identifier = v13->_identifier;
  v13->_identifier = v18;

  return v13;
}

- (APCacheableBaseObject)proxyObject
{
  p_proxyObject = &self->_proxyObject;
  v4 = self->_proxyObject;
  if (!v4)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(APCacheableObjectProxy *)self cacheKey];
      int v14 = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cacheable proxy is loading object %{public}@.", (uint8_t *)&v14, 0xCu);
    }
    v7 = [(APCacheableObjectProxy *)self provideIgnorableKeyNamesBlock];

    if (v7)
    {
      v8 = [(APCacheableObjectProxy *)self provideIgnorableKeyNamesBlock];
      v7 = v8[2]();
    }
    v9 = [(APCacheableObjectProxy *)self persistentStore];
    v10 = [(APCacheableObjectProxy *)self cacheKey];
    v4 = [v9 objectForKey:v10 ignoreKeys:v7];

    if (!v4)
    {
      id v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [(APCacheableObjectProxy *)self cacheKey];
        int v14 = 138543362;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Cacheable proxy failed to get object %{public}@ from cache.", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  objc_storeStrong((id *)p_proxyObject, v4);

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  v4 = [(APCacheableObjectProxy *)self proxyObject];
  if (v4)
  {
    [v5 setTarget:v4];
    [v5 invoke];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = [(APCacheableObjectProxy *)self proxyObject];
  id v5 = v4;
  if (!v4
    || ([v4 methodSignatureForSelector:a3], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = +[NSMethodSignature signatureWithObjCTypes:"C@:"];
  }

  return v6;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    v4 = [(APCacheableObjectProxy *)self proxyObject];
    v3 = [v4 identifier];
  }

  return v3;
}

- (BOOL)_proxiedObjectIsAlive
{
  return self->_proxyObject != 0;
}

+ (BOOL)objectIsLoaded:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  if ([v4 isEqual:objc_opt_class()]) {
    unsigned __int8 v5 = [v3 _proxiedObjectIsAlive];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)provideIgnorableKeyNamesBlock
{
  return self->_provideIgnorableKeyNamesBlock;
}

- (void)setProvideIgnorableKeyNamesBlock:(id)a3
{
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (APPersistentCachedStoreProtocol)persistentStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentStore);

  return (APPersistentCachedStoreProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentStore);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong(&self->_provideIgnorableKeyNamesBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_proxyObject, 0);
}

@end