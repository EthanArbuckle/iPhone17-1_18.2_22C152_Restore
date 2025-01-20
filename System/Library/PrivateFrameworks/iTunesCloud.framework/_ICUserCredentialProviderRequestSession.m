@interface _ICUserCredentialProviderRequestSession
- (BOOL)hasPendingResponses;
- (ICUserIdentityProperties)activeICloudAccountProperties;
- (ICUserIdentityStore)identityStore;
- (NSArray)credentialRequests;
- (NSMapTable)delegationCredentialRequestToIdentityProperties;
- (NSMapTable)delegationCredentialRequestToSpecificUserIdentity;
- (NSMutableArray)pendingPropertyLoadCredentialRequests;
- (NSMutableArray)pendingResponseCredentialRequests;
- (NSMutableDictionary)delegationUserIdentityToUUIDs;
- (_ICUserCredentialProviderRequestSession)initWithCredentialRequests:(id)a3 responseHandler:(id)a4;
- (id)description;
- (id)responseHandler;
- (int64_t)maximumQualityOfService;
- (void)setActiveICloudAccountProperties:(id)a3;
- (void)setDelegationCredentialRequestToIdentityProperties:(id)a3;
- (void)setDelegationCredentialRequestToSpecificUserIdentity:(id)a3;
- (void)setDelegationUserIdentityToUUIDs:(id)a3;
- (void)setPendingPropertyLoadCredentialRequests:(id)a3;
- (void)setPendingResponseCredentialRequests:(id)a3;
@end

@implementation _ICUserCredentialProviderRequestSession

- (_ICUserCredentialProviderRequestSession)initWithCredentialRequests:(id)a3 responseHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_ICUserCredentialProviderRequestSession;
  v8 = [(_ICUserCredentialProviderRequestSession *)&v27 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    credentialRequests = v8->_credentialRequests;
    v8->_credentialRequests = (NSArray *)v9;

    uint64_t v11 = [(NSArray *)v8->_credentialRequests mutableCopy];
    pendingResponseCredentialRequests = v8->_pendingResponseCredentialRequests;
    v8->_pendingResponseCredentialRequests = (NSMutableArray *)v11;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      uint64_t v17 = -1;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "qualityOfService", (void)v23);
          if (v17 <= v19) {
            uint64_t v17 = v19;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v17 = -1;
    }

    v8->_maximumQualityOfService = v17;
    uint64_t v20 = MEMORY[0x1A6240BF0](v7);
    id responseHandler = v8->_responseHandler;
    v8->_id responseHandler = (id)v20;
  }
  return v8;
}

- (void)setActiveICloudAccountProperties:(id)a3
{
}

- (void)setPendingPropertyLoadCredentialRequests:(id)a3
{
}

- (NSArray)credentialRequests
{
  return self->_credentialRequests;
}

- (int64_t)maximumQualityOfService
{
  return self->_maximumQualityOfService;
}

- (ICUserIdentityStore)identityStore
{
  v2 = [(NSArray *)self->_credentialRequests firstObject];
  v3 = [v2 identityStore];

  return (ICUserIdentityStore *)v3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (NSMutableArray)pendingResponseCredentialRequests
{
  return self->_pendingResponseCredentialRequests;
}

- (NSMutableArray)pendingPropertyLoadCredentialRequests
{
  return self->_pendingPropertyLoadCredentialRequests;
}

- (BOOL)hasPendingResponses
{
  return [(NSMutableArray *)self->_pendingResponseCredentialRequests count] != 0;
}

- (NSMapTable)delegationCredentialRequestToSpecificUserIdentity
{
  return self->_delegationCredentialRequestToSpecificUserIdentity;
}

- (ICUserIdentityProperties)activeICloudAccountProperties
{
  return self->_activeICloudAccountProperties;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p [%@]>", objc_opt_class(), self, self->_credentialRequests];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_pendingResponseCredentialRequests, 0);
  objc_storeStrong((id *)&self->_pendingPropertyLoadCredentialRequests, 0);
  objc_storeStrong((id *)&self->_delegationUserIdentityToUUIDs, 0);
  objc_storeStrong((id *)&self->_delegationCredentialRequestToIdentityProperties, 0);
  objc_storeStrong((id *)&self->_delegationCredentialRequestToSpecificUserIdentity, 0);
  objc_storeStrong((id *)&self->_credentialRequests, 0);

  objc_storeStrong((id *)&self->_activeICloudAccountProperties, 0);
}

- (void)setPendingResponseCredentialRequests:(id)a3
{
}

- (void)setDelegationUserIdentityToUUIDs:(id)a3
{
}

- (NSMutableDictionary)delegationUserIdentityToUUIDs
{
  return self->_delegationUserIdentityToUUIDs;
}

- (void)setDelegationCredentialRequestToIdentityProperties:(id)a3
{
}

- (NSMapTable)delegationCredentialRequestToIdentityProperties
{
  return self->_delegationCredentialRequestToIdentityProperties;
}

- (void)setDelegationCredentialRequestToSpecificUserIdentity:(id)a3
{
}

@end