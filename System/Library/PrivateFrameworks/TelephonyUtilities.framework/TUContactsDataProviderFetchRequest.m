@interface TUContactsDataProviderFetchRequest
- (BOOL)isBlocked;
- (BOOL)isConversation;
- (BOOL)isEmergency;
- (BOOL)isIncoming;
- (BOOL)isVerified;
- (BOOL)useNetworkCountryCode;
- (NSArray)auxiliaryKeysToFetch;
- (NSArray)handles;
- (NSString)contactIdentifier;
- (NSString)isoCountryCode;
- (NSString)phoneNumberPrefixHint;
- (TUContactsDataProviderFetchRequest)init;
- (TUContactsDataProviderFetchRequest)initWithCall:(id)a3;
- (TUContactsDataProviderFetchRequest)initWithHandle:(id)a3;
- (TUContactsDataProviderFetchRequest)initWithHandles:(id)a3;
- (TUContactsDataProviderFetchRequest)initWithHandles:(id)a3 isConversation:(BOOL)a4;
- (id)description;
- (void)removePsuedHandles;
- (void)setAuxiliaryKeysToFetch:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setHandles:(id)a3;
- (void)setPhoneNumberPrefixHint:(id)a3;
- (void)setUseNetworkCountryCode:(BOOL)a3;
@end

@implementation TUContactsDataProviderFetchRequest

- (TUContactsDataProviderFetchRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUContactsDataProviderFetchRequest.m", 19, @"%s is not available. Use a designated initializer instead.", "-[TUContactsDataProviderFetchRequest init]");

  return 0;
}

- (TUContactsDataProviderFetchRequest)initWithCall:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUContactsDataProviderFetchRequest;
  v6 = [(TUContactsDataProviderFetchRequest *)&v15 init];
  if (v6)
  {
    if (!v5)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v6, @"TUContactsDataProviderFetchRequest.m", 25, @"Invalid parameter not satisfying: %@", @"call != nil" object file lineNumber description];
    }
    v6->_emergency = [v5 isEmergency];
    uint64_t v7 = [v5 isoCountryCode];
    isoCountryCode = v6->_isoCountryCode;
    v6->_isoCountryCode = (NSString *)v7;

    v6->_blocked = [v5 isBlocked];
    v6->_conversation = [v5 isConversation];
    v6->_verified = [v5 verificationStatus] == 1;
    v6->_incoming = [v5 isIncoming];
    v9 = [v5 remoteParticipantHandles];
    uint64_t v10 = [v9 allObjects];
    handles = v6->_handles;
    v6->_handles = (NSArray *)v10;

    auxiliaryKeysToFetch = v6->_auxiliaryKeysToFetch;
    v6->_auxiliaryKeysToFetch = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (TUContactsDataProviderFetchRequest)initWithHandles:(id)a3 isConversation:(BOOL)a4
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUContactsDataProviderFetchRequest;
  v9 = [(TUContactsDataProviderFetchRequest *)&v13 init];
  if (v9)
  {
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v9, @"TUContactsDataProviderFetchRequest.m", 41, @"Invalid parameter not satisfying: %@", @"handles != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_handles, a3);
    auxiliaryKeysToFetch = v9->_auxiliaryKeysToFetch;
    v9->_auxiliaryKeysToFetch = (NSArray *)MEMORY[0x1E4F1CBF0];

    v9->_conversation = a4;
  }

  return v9;
}

- (TUContactsDataProviderFetchRequest)initWithHandles:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TUContactsDataProviderFetchRequest.m", 51, @"Invalid parameter not satisfying: %@", @"handles != nil" object file lineNumber description];
  }
  v6 = [(TUContactsDataProviderFetchRequest *)self initWithHandles:v5 isConversation:0];

  return v6;
}

- (TUContactsDataProviderFetchRequest)initWithHandle:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TUContactsDataProviderFetchRequest.m", 56, @"Invalid parameter not satisfying: %@", @"handle != nil" object file lineNumber description];
  }
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v7 = [(TUContactsDataProviderFetchRequest *)self initWithHandles:v6];

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUContactsDataProviderFetchRequest *)self contactIdentifier];
  [v3 appendFormat:@" cI=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" uNCC=%d", -[TUContactsDataProviderFetchRequest useNetworkCountryCode](self, "useNetworkCountryCode"));
  objc_msgSend(v3, "appendFormat:", @" iEM=%d", -[TUContactsDataProviderFetchRequest isEmergency](self, "isEmergency"));
  objc_msgSend(v3, "appendFormat:", @" iBL=%d", -[TUContactsDataProviderFetchRequest isBlocked](self, "isBlocked"));
  objc_msgSend(v3, "appendFormat:", @" c=%d", -[TUContactsDataProviderFetchRequest isConversation](self, "isConversation"));
  objc_msgSend(v3, "appendFormat:", @" v=%d", -[TUContactsDataProviderFetchRequest isVerified](self, "isVerified"));
  objc_msgSend(v3, "appendFormat:", @" i=%d", -[TUContactsDataProviderFetchRequest isIncoming](self, "isIncoming"));
  id v5 = [(TUContactsDataProviderFetchRequest *)self isoCountryCode];
  [v3 appendFormat:@" isoCN=%@", v5];

  v6 = [(TUContactsDataProviderFetchRequest *)self handles];
  [v3 appendFormat:@" hdls=%@", v6];

  uint64_t v7 = [(TUContactsDataProviderFetchRequest *)self phoneNumberPrefixHint];
  [v3 appendFormat:@" pnpH=%@", v7];

  id v8 = [(TUContactsDataProviderFetchRequest *)self auxiliaryKeysToFetch];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(TUContactsDataProviderFetchRequest *)self auxiliaryKeysToFetch];
    [v3 appendFormat:@" aKTF=%@", v10];
  }
  [v3 appendString:@">"];
  v11 = (void *)[v3 copy];

  return v11;
}

- (void)removePsuedHandles
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(TUContactsDataProviderFetchRequest *)self handles];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(TUContactsDataProviderFetchRequest *)self handles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      objc_super v13 = [v12 value];
      char v14 = [v13 destinationIdIsPseudonym];

      if (v14) {
        char v9 = 1;
      }
      else {
        [v5 addObject:v12];
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v8);

  if (v9)
  {
    v6 = (void *)[v5 copy];
    [(TUContactsDataProviderFetchRequest *)self setHandles:v6];
LABEL_13:
  }
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSArray)auxiliaryKeysToFetch
{
  return self->_auxiliaryKeysToFetch;
}

- (void)setAuxiliaryKeysToFetch:(id)a3
{
}

- (NSString)phoneNumberPrefixHint
{
  return self->_phoneNumberPrefixHint;
}

- (void)setPhoneNumberPrefixHint:(id)a3
{
}

- (BOOL)useNetworkCountryCode
{
  return self->_useNetworkCountryCode;
}

- (void)setUseNetworkCountryCode:(BOOL)a3
{
  self->_useNetworkCountryCode = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (BOOL)isVerified
{
  return self->_verified;
}

- (BOOL)isIncoming
{
  return self->_incoming;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_phoneNumberPrefixHint, 0);
  objc_storeStrong((id *)&self->_auxiliaryKeysToFetch, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end