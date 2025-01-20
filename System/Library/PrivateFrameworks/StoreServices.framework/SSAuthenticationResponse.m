@interface SSAuthenticationResponse
- (BOOL)isManagedStudent;
- (BOOL)isNewCustomer;
- (NSDictionary)responseDictionary;
- (NSHTTPURLResponse)URLResponse;
- (NSNumber)accountUniqueIdentifier;
- (NSNumber)failureType;
- (NSString)accountName;
- (NSString)creditsString;
- (NSString)storeFrontIdentifier;
- (NSString)token;
- (NSString)userMessage;
- (SSAuthenticationResponse)initWithURLResponse:(id)a3 dictionary:(id)a4;
- (id)_valueForFirstAvailableKey:(id)a3;
- (id)altDSID;
- (id)newAccount;
- (int64_t)URLBagType;
- (int64_t)_responseTypeForErrorNumber:(int64_t)a3;
- (int64_t)_responseTypeForFailureType:(int64_t)a3;
- (int64_t)_responseTypeForStatusValue:(int64_t)a3;
- (int64_t)accountKind;
- (int64_t)availableServiceTypes;
- (int64_t)enabledServiceTypes;
- (int64_t)responseType;
- (void)setURLBagType:(int64_t)a3;
@end

@implementation SSAuthenticationResponse

- (SSAuthenticationResponse)initWithURLResponse:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSAuthenticationResponse;
  v8 = [(SSAuthenticationResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v9;

    uint64_t v11 = [v6 copy];
    urlResponse = v8->_urlResponse;
    v8->_urlResponse = (NSHTTPURLResponse *)v11;
  }
  return v8;
}

- (int64_t)accountKind
{
  v2 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"accountKind", 0];
  int64_t v3 = 0;
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 intValue] == 1;
  }

  return v3;
}

- (NSString)accountName
{
  id v3 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"appleId", @"accountName", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v4 = v3, (v5 = v4) == 0))
  {
    id v6 = [(NSDictionary *)self->_responseDictionary objectForKey:@"personInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 objectForKey:@"acAccountName"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = v7;
        v5 = v3;
      }
      else
      {
        v5 = 0;
        id v3 = v7;
      }
    }
    else
    {
      v5 = 0;
    }

    id v4 = v3;
  }

  return (NSString *)v5;
}

- (NSNumber)accountUniqueIdentifier
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"dsPersonId"];
  id v3 = SSAccountGetUniqueIdentifierFromValue(v2);

  return (NSNumber *)v3;
}

- (id)altDSID
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"altDsid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int64_t)availableServiceTypes
{
  v2 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"is-cloud-enabled", @"is-saga-enabled", 0];
  int64_t v3 = 0;
  if (objc_opt_respondsToSelector())
  {
    if ([v2 BOOLValue]) {
      int64_t v3 = 4;
    }
    else {
      int64_t v3 = 0;
    }
  }

  return v3;
}

- (NSString)creditsString
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"creditDisplay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)enabledServiceTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"services", 0];
  objc_opt_class();
  int64_t v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v11 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int64_t v3 = 0;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v9 isEqualToString:@"locker"])
            {
              v3 |= 4uLL;
            }
            else if ([v9 isEqualToString:@"purchase-history"])
            {
              v3 |= 2uLL;
            }
            else
            {
              v3 |= [v9 isEqualToString:@"social"];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      int64_t v3 = 0;
    }

    v2 = v11;
  }

  return v3;
}

- (NSNumber)failureType
{
  v2 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"failureType", @"errorNumber", 0];
  int64_t v3 = 0;
  if (objc_opt_respondsToSelector())
  {
    int64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "intValue"));
  }

  return (NSNumber *)v3;
}

- (BOOL)isManagedStudent
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"isManagedStudent"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isNewCustomer
{
  v2 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"newCustomer", 0];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)newAccount
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v3 = [(SSAuthenticationResponse *)self accountUniqueIdentifier];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F179C8]);
    v25 = [v4 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17890]];
    v26 = v4;
    objc_msgSend(v4, "accountsWithAccountType:");
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        uint64_t v11 = [v10 username];
        long long v12 = [(SSAuthenticationResponse *)self accountName];
        char v13 = [v11 isEqualToString:v12];

        if (v13) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      long long v14 = &off_1E5BA6000;
      long long v15 = [[SSAccount alloc] initWithBackingAccount:v10];

      if (v15) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:

      long long v14 = &off_1E5BA6000;
    }
    long long v15 = (SSAccount *)objc_alloc_init((Class)v14[171]);
LABEL_13:
    [(SSAccount *)v15 setAccountKind:[(SSAuthenticationResponse *)self accountKind]];
    v16 = [(SSAuthenticationResponse *)self accountName];
    [(SSAccount *)v15 setAccountName:v16];

    [(SSAccount *)v15 setAccountScope:SSAccountScopeForURLBagType([(SSAuthenticationResponse *)self URLBagType])];
    uint64_t v17 = [(SSAuthenticationResponse *)self altDSID];
    [(SSAccount *)v15 setAltDSID:v17];

    [(SSAccount *)v15 setAvailableServiceTypes:[(SSAuthenticationResponse *)self availableServiceTypes]];
    v18 = [(SSAuthenticationResponse *)self creditsString];
    [(SSAccount *)v15 setCreditsString:v18];

    [(SSAccount *)v15 setEnabledServiceTypes:[(SSAuthenticationResponse *)self enabledServiceTypes]];
    [(SSAccount *)v15 setManagedAppleID:[(SSAuthenticationResponse *)self isManagedStudent]];
    [(SSAccount *)v15 setNewCustomer:[(SSAuthenticationResponse *)self isNewCustomer]];
    v19 = [(SSAuthenticationResponse *)self token];
    [(SSAccount *)v15 setSecureToken:v19];

    v20 = [(SSAuthenticationResponse *)self storeFrontIdentifier];
    [(SSAccount *)v15 setStoreFrontIdentifier:v20];

    [(SSAccount *)v15 setUniqueIdentifier:v3];
    v21 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"address", 0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [v21 objectForKey:@"firstName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSAccount *)v15 setFirstName:v22];
      }
      v23 = [v21 objectForKey:@"lastName"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSAccount *)v15 setLastName:v23];
      }
    }
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (int64_t)responseType
{
  char v3 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"failureType", 0];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = -[SSAuthenticationResponse _responseTypeForFailureType:](self, "_responseTypeForFailureType:", [v3 integerValue]);
LABEL_7:
    int64_t v6 = v4;
    goto LABEL_8;
  }
  id v5 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"errorNumber", 0];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v3 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"status", 0];

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      int64_t v6 = 3;
      goto LABEL_8;
    }
    int64_t v4 = -[SSAuthenticationResponse _responseTypeForStatusValue:](self, "_responseTypeForStatusValue:", [v3 integerValue]);
    goto LABEL_7;
  }
  int64_t v6 = -[SSAuthenticationResponse _responseTypeForErrorNumber:](self, "_responseTypeForErrorNumber:", [v5 integerValue]);
  char v3 = v5;
LABEL_8:

  return v6;
}

- (NSString)storeFrontIdentifier
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [(NSHTTPURLResponse *)self->_urlResponse allHeaderFields];
  char v3 = [v2 objectForKey:@"X-Set-Apple-Store-Front"];
  if (!v3)
  {
    int64_t v4 = [@"X-Set-Apple-Store-Front" lowercaseString];
    char v3 = [v2 objectForKey:v4];

    if (!v3)
    {
      char v3 = [v2 objectForKey:@"X-Apple-Request-Store-Front"];
      if (!v3)
      {
        id v5 = [@"X-Apple-Request-Store-Front" lowercaseString];
        char v3 = [v2 objectForKey:v5];

        if (!v3)
        {
          int64_t v6 = +[SSAccountStore defaultStore];
          uint64_t v7 = [v6 localAccount];
          uint64_t v8 = [v7 resultWithError:0];

          char v3 = [v8 storeFrontIdentifier];

          if (!v3)
          {
            uint64_t v9 = +[SSLogConfig sharedAccountsAuthenticationConfig];
            if (!v9)
            {
              uint64_t v9 = +[SSLogConfig sharedConfig];
            }
            int v10 = [v9 shouldLog];
            if ([v9 shouldLogToDisk]) {
              int v11 = v10 | 2;
            }
            else {
              int v11 = v10;
            }
            long long v12 = [v9 OSLogObject];
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              v11 &= 2u;
            }
            if (v11)
            {
              LODWORD(v23) = 138543362;
              *(void *)((char *)&v23 + 4) = objc_opt_class();
              id v13 = *(id *)((char *)&v23 + 4);
              LODWORD(v22) = 12;
              long long v14 = (void *)_os_log_send_and_compose_impl();

              if (!v14)
              {
LABEL_17:

                char v3 = 0;
                goto LABEL_18;
              }
              long long v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v23, v22, v23);
              free(v14);
              SSFileLog(v9, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
            }

            goto LABEL_17;
          }
        }
      }
    }
  }
LABEL_18:

  return (NSString *)v3;
}

- (NSString)token
{
  char v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"xToken"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v4 = v3, (v5 = v4) == 0))
  {
    id v5 = [(NSDictionary *)self->_responseDictionary objectForKey:@"passwordToken"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v5;
      id v5 = v4;
    }
    else
    {
      id v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_urlResponse;
}

- (NSString)userMessage
{
  v2 = [(SSAuthenticationResponse *)self _valueForFirstAvailableKey:@"customerMessage", @"errorKey", 0];
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }

  return (NSString *)v3;
}

- (int64_t)_responseTypeForErrorNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 9007) > 2) {
    return 3;
  }
  else {
    return qword_1A52F6500[a3 - 9007];
  }
}

- (int64_t)_responseTypeForFailureType:(int64_t)a3
{
  int64_t v3 = 3;
  if (a3 == -128) {
    int64_t v3 = 1;
  }
  if (a3 == -5000) {
    return 2;
  }
  else {
    return v3;
  }
}

- (int64_t)_responseTypeForStatusValue:(int64_t)a3
{
  int64_t v3 = 3;
  if (a3 == -128) {
    int64_t v3 = 1;
  }
  if (!a3) {
    int64_t v3 = 0;
  }
  if (a3 == -5000) {
    return 2;
  }
  else {
    return v3;
  }
}

- (id)_valueForFirstAvailableKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_responseDictionary objectForKey:@"accountInfo"];
  int v11 = (id *)&v13;
  if (v4)
  {
    do
    {
      int64_t v6 = [(NSDictionary *)self->_responseDictionary objectForKey:v4];
      if (!v6)
      {
        int64_t v6 = [v5 objectForKey:v4];
      }
      uint64_t v7 = v11++;
      id v8 = *v7;

      if (v8) {
        BOOL v9 = v6 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      id v4 = v8;
    }
    while (v9);
  }
  else
  {
    int64_t v6 = 0;
    id v8 = 0;
  }

  return v6;
}

- (NSDictionary)responseDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)URLBagType
{
  return self->_urlBagType;
}

- (void)setURLBagType:(int64_t)a3
{
  self->_urlBagType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end