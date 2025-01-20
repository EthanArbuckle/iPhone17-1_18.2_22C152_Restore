@interface PDSCDCacheReferenceProxy
- (BOOL)conformsToProtocol:(id)a3;
- (NSPersistentContainer)persistentContainer;
- (PDSCDCacheContainer)cacheContainer;
- (PDSCDCacheReferenceProxy)initWithCacheContainer:(id)a3 persistentContainer:(id)a4;
- (void)setCacheContainer:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation PDSCDCacheReferenceProxy

- (PDSCDCacheReferenceProxy)initWithCacheContainer:(id)a3 persistentContainer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_cacheContainer, a3);
    objc_storeStrong((id *)&self->_persistentContainer, a4);
  }

  return self;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v5 = [(PDSCDCacheReferenceProxy *)self cacheContainer];
  char v6 = [v5 conformsToProtocol:v4];

  return v6;
}

- (PDSCDCacheContainer)cacheContainer
{
  return self->_cacheContainer;
}

- (void)setCacheContainer:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_cacheContainer, 0);
}

@end