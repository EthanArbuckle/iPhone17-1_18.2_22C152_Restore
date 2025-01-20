@interface ACFComponents
+ (id)components;
+ (void)setComponents:(id)a3;
- (ACFCertificateStoragePolicy)certificateStoragePolicy;
- (ACFCryptographProtocol)cryptograph;
- (ACFKeychainManagerProtocol)keychainManager;
- (Class)localAuthenticationContextClass;
- (Class)transportClass;
- (id)createLocalAuthenticationContext;
- (id)createTransport;
- (void)dealloc;
- (void)setCertificateStoragePolicy:(id)a3;
- (void)setCryptograph:(id)a3;
- (void)setKeychainManager:(id)a3;
- (void)setLocalAuthenticationContextClass:(Class)a3;
- (void)setTransportClass:(Class)a3;
@end

@implementation ACFComponents

+ (id)components
{
  objc_sync_enter(a1);
  id v3 = (id)sComponents;
  objc_sync_exit(a1);
  return v3;
}

+ (void)setComponents:(id)a3
{
  objc_sync_enter(a1);
  if (([a3 isEqual:sComponents] & 1) == 0)
  {
    id v5 = (id)sComponents;
    sComponents = (uint64_t)a3;
  }

  objc_sync_exit(a1);
}

- (void)dealloc
{
  [(ACFComponents *)self setCryptograph:0];
  [(ACFComponents *)self setKeychainManager:0];
  [(ACFComponents *)self setCertificateStoragePolicy:0];
  [(ACFComponents *)self setTransportClass:0];
  [(ACFComponents *)self setLocalAuthenticationContextClass:0];
  v3.receiver = self;
  v3.super_class = (Class)ACFComponents;
  [(ACFComponents *)&v3 dealloc];
}

- (id)createTransport
{
  [(ACFComponents *)self transportClass];
  v2 = objc_opt_new();

  return v2;
}

- (id)createLocalAuthenticationContext
{
  [(ACFComponents *)self localAuthenticationContextClass];
  v2 = objc_opt_new();

  return v2;
}

- (ACFKeychainManagerProtocol)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (ACFCryptographProtocol)cryptograph
{
  return self->_cryptograph;
}

- (void)setCryptograph:(id)a3
{
}

- (ACFCertificateStoragePolicy)certificateStoragePolicy
{
  return self->_certificateStoragePolicy;
}

- (void)setCertificateStoragePolicy:(id)a3
{
}

- (Class)transportClass
{
  return self->_transportClass;
}

- (void)setTransportClass:(Class)a3
{
}

- (Class)localAuthenticationContextClass
{
  return self->_localAuthenticationContextClass;
}

- (void)setLocalAuthenticationContextClass:(Class)a3
{
}

@end