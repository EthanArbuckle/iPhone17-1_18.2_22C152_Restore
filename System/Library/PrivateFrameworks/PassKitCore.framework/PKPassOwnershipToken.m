@interface PKPassOwnershipToken
+ (void)deleteAllLocalKeychainOwnershipTokens;
+ (void)queryKeychainForOwnershipTokens:(id)a3;
- (NSString)ownershipToken;
- (NSString)ownershipTokenIdentifier;
- (PKPassOwnershipToken)initWithIdentifier:(id)a3;
- (PKPassOwnershipToken)initWithOwnershipToken:(id)a3 identifier:(id)a4;
- (id)_wrapperWithType:(unint64_t)a3 identifier:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (void)_readFromKeychain;
- (void)_writeToKeychain;
- (void)deleteTokenFromKeychain;
- (void)deleteTokenFromLocalKeychain;
- (void)setOwnershipToken:(id)a3;
@end

@implementation PKPassOwnershipToken

- (PKPassOwnershipToken)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassOwnershipToken;
    v5 = [(PKPassOwnershipToken *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      ownershipTokenIdentifier = v5->_ownershipTokenIdentifier;
      v5->_ownershipTokenIdentifier = (NSString *)v6;

      [(PKPassOwnershipToken *)v5 _readFromKeychain];
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassOwnershipToken)initWithOwnershipToken:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPassOwnershipToken;
    objc_super v10 = [(PKPassOwnershipToken *)&v16 init];
    if (v10)
    {
      uint64_t v11 = [v8 copy];
      ownershipTokenIdentifier = v10->_ownershipTokenIdentifier;
      v10->_ownershipTokenIdentifier = (NSString *)v11;

      uint64_t v13 = [v6 copy];
      ownershipToken = v10->_ownershipToken;
      v10->_ownershipToken = (NSString *)v13;

      [(PKPassOwnershipToken *)v10 _writeToKeychain];
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (NSString)ownershipToken
{
  return self->_ownershipToken;
}

- (void)setOwnershipToken:(id)a3
{
  if (self->_ownershipToken != a3)
  {
    id v4 = (NSString *)[a3 copy];
    ownershipToken = self->_ownershipToken;
    self->_ownershipToken = v4;

    [(PKPassOwnershipToken *)self _writeToKeychain];
  }
}

+ (void)queryKeychainForOwnershipTokens:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void, id))a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:*MEMORY[0x1E4F3B988] forKey:*MEMORY[0x1E4F3B978]];
  [v4 setObject:@"com.apple.passd.pass-ownership-token" forKey:*MEMORY[0x1E4F3B850]];
  [v4 setObject:@"com.apple.passd" forKey:*MEMORY[0x1E4F3B550]];
  uint64_t v5 = *MEMORY[0x1E4F1CFD0];
  [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3B878]];
  [v4 setObject:*MEMORY[0x1E4F3BB88] forKey:*MEMORY[0x1E4F3BB80]];
  [v4 setObject:v5 forKey:*MEMORY[0x1E4F3BC68]];
  [v4 setObject:v5 forKey:*MEMORY[0x1E4F3BC70]];
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  CFTypeRef result = 0;
  OSStatus v7 = SecItemCopyMatching(v6, &result);
  if (!v7 && result)
  {
    CFDictionaryRef v28 = v6;
    id v29 = v4;
    v30 = v3;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v9 = (id)result;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      uint64_t v13 = *MEMORY[0x1E4F3B5C0];
      uint64_t v14 = *MEMORY[0x1E4F3BD38];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_super v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v17 = [v16 objectForKey:v13];
          v18 = [v16 objectForKey:v14];
          v19 = v18;
          if (v17 && [v18 length])
          {
            v20 = objc_alloc_init(PKPassOwnershipToken);
            uint64_t v21 = [v17 copy];
            ownershipTokenIdentifier = v20->_ownershipTokenIdentifier;
            v20->_ownershipTokenIdentifier = (NSString *)v21;

            uint64_t v23 = [[NSString alloc] initWithData:v19 encoding:4];
            ownershipToken = v20->_ownershipToken;
            v20->_ownershipToken = (NSString *)v23;

            [v8 addObject:v20];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    if (result) {
      CFRelease(result);
    }
    v3 = v30;
    if (v30)
    {
      v25 = (void *)[v8 copy];
      ((void (**)(id, void *, id))v30)[2](v30, v25, 0);
    }
    CFDictionaryRef v6 = v28;
    id v4 = v29;
    goto LABEL_22;
  }
  v26 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    OSStatus v38 = v7;
    _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Error fetching pass ownership tokens from Keychain: %d", buf, 8u);
  }

  if (v3)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v8 = (id)[v27 initWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
    v3[2](v3, 0, v8);
LABEL_22:
  }
}

+ (void)deleteAllLocalKeychainOwnershipTokens
{
}

void __61__PKPassOwnershipToken_deleteAllLocalKeychainOwnershipTokens__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        OSStatus v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v8 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = v7;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Deleting local keychain pass ownership token %@", buf, 0xCu);
        }

        [v7 deleteTokenFromLocalKeychain];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)deleteTokenFromKeychain
{
  uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Removing pass ownership token from Keychain", v5, 2u);
  }

  uint64_t v4 = [(PKPassOwnershipToken *)self _wrapperWithType:1 identifier:self->_ownershipTokenIdentifier];
  [v4 resetKeychainItem];
}

- (void)deleteTokenFromLocalKeychain
{
  uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Removing pass ownership token from Local Keychain", v5, 2u);
  }

  uint64_t v4 = [(PKPassOwnershipToken *)self _wrapperWithType:1 identifier:self->_ownershipTokenIdentifier];
  [v4 resetLocalKeychainItem];
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_ownershipTokenIdentifier forKey:@"ownershipTokenIdentifier"];
  [v3 setObject:self->_ownershipToken forKey:@"ownershipToken"];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSString *)self->_ownershipTokenIdentifier description];
  [v3 appendFormat:@"ownershipTokenIdentifier: '%@'; ", v4];

  uint64_t v5 = [(NSString *)self->_ownershipToken description];
  [v3 appendFormat:@"ownershipToken: '%@'; ", v5];

  [v3 appendFormat:@">"];
  CFDictionaryRef v6 = (void *)[v3 copy];

  return v6;
}

- (void)_writeToKeychain
{
  id v4 = [(PKPassOwnershipToken *)self _wrapperWithType:1 identifier:self->_ownershipTokenIdentifier];
  id v3 = [(NSString *)self->_ownershipToken dataUsingEncoding:4];
  [v4 setObject:v3 forKey:*MEMORY[0x1E4F3BD38]];
}

- (void)_readFromKeychain
{
  id v6 = [(PKPassOwnershipToken *)self _wrapperWithType:1 identifier:self->_ownershipTokenIdentifier];
  id v3 = [v6 objectForKey:*MEMORY[0x1E4F3BD38]];
  id v4 = (NSString *)[[NSString alloc] initWithData:v3 encoding:4];
  ownershipToken = self->_ownershipToken;
  self->_ownershipToken = v4;
}

- (id)_wrapperWithType:(unint64_t)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = [[PKKeychainItemWrapper alloc] initWithIdentifier:v5 accessGroup:@"com.apple.passd" serviceName:@"com.apple.passd.pass-ownership-token" type:a3 invisible:1];

  [(PKKeychainItemWrapper *)v6 setLabel:@"com.apple.passd.pass-ownership-token"];
  return v6;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
}

@end