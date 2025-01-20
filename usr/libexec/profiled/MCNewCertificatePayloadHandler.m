@interface MCNewCertificatePayloadHandler
- (BOOL)isSetAside;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (void)accessibility;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewCertificatePayloadHandler

- (void)setAside
{
  id v5 = [(MCNewPayloadHandler *)self payload];
  v3 = [v5 certificatePersistentID];
  v4 = [v5 UUID];
  [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v3 andUUID:v4];

  self->_isSetAside = 1;
}

- (void)unsetAside
{
  id v5 = [(MCNewPayloadHandler *)self payload];
  v3 = [v5 certificatePersistentID];
  v4 = [v5 UUID];
  [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v3 andUUID:v4];

  self->_isSetAside = 0;
}

- (void)remove
{
  if (!self->_isSetAside)
  {
    id v5 = [(MCNewPayloadHandler *)self payload];
    v3 = [v5 certificatePersistentID];
    v4 = [v5 UUID];
    [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v3 andUUID:v4];
  }
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  return 0;
}

- (void)accessibility
{
  v2 = [(MCNewPayloadHandler *)self payload];
  if ([v2 isIdentity] && !objc_msgSend(v2, "isMDMClientIdentity")) {
    v3 = &kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  }
  else {
    v3 = (const CFStringRef *)&kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  }
  CFStringRef v4 = *v3;

  return (void *)v4;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

@end