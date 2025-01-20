@interface SSAuthenticateResponse
- (NSDictionary)responseDictionary;
- (NSError)error;
- (NSString)description;
- (SSAccount)authenticatedAccount;
- (SSAuthenticateResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)authenticateResponseType;
- (unint64_t)credentialSource;
- (void)setAuthenticateResponseType:(int64_t)a3;
- (void)setAuthenticatedAccount:(id)a3;
- (void)setCredentialSource:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setResponseDictionary:(id)a3;
@end

@implementation SSAuthenticateResponse

- (NSError)error
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  v4 = [(NSError *)v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F4DB98]];

  if (v5)
  {
    if ([(NSError *)v3 code] == 5001)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      v7 = [(NSError *)v3 userInfo];
      uint64_t v8 = [v6 errorWithDomain:@"SSServerErrorDomain" code:5001 userInfo:v7];
    }
    else if ([(NSError *)v3 code] == 5304)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      v7 = [(NSError *)v3 userInfo];
      uint64_t v8 = [v9 errorWithDomain:@"SSServerErrorDomain" code:5304 userInfo:v7];
    }
    else
    {
      if ([(NSError *)v3 code] != -5000) {
        goto LABEL_9;
      }
      v10 = (void *)MEMORY[0x1E4F28C58];
      v7 = [(NSError *)v3 userInfo];
      uint64_t v8 = [v10 errorWithDomain:@"SSServerErrorDomain" code:-5000 userInfo:v7];
    }
    v11 = (NSError *)v8;

    v3 = v11;
  }
LABEL_9:
  objc_sync_exit(v2);

  return v3;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v9.receiver = self;
  v9.super_class = (Class)SSAuthenticateResponse;
  v4 = [(SSAuthenticateResponse *)&v9 description];
  [v3 appendFormat:@"%@:\n", v4];

  int v5 = [(SSAuthenticateResponse *)self authenticatedAccount];
  [v3 appendFormat:@"  authenticatedAccount = %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"  authenticateResponseType = %ld\n", -[SSAuthenticateResponse authenticateResponseType](self, "authenticateResponseType"));
  objc_msgSend(v3, "appendFormat:", @"  credentialSource = %ld\n", -[SSAuthenticateResponse credentialSource](self, "credentialSource"));
  v6 = [(SSAuthenticateResponse *)self error];
  [v3 appendFormat:@"  error = %@\n", v6];

  v7 = [(SSAuthenticateResponse *)self responseDictionary];
  [v3 appendFormat:@"  responseDictionary = %@", v7];

  return (NSString *)v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)[(SSAccount *)self->_authenticatedAccount uniqueIdentifier]);
  xpc_dictionary_set_int64(v3, "4", self->_credentialSource);
  xpc_dictionary_set_int64(v3, "3", self->_authenticateResponseType);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_error);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_responseDictionary);
  return v3;
}

- (SSAuthenticateResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v19.receiver = self;
    v19.super_class = (Class)SSAuthenticateResponse;
    v7 = [(SSAuthenticateResponse *)&v19 init];
    if (v7)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      objc_super v9 = +[SSAccountStore defaultStore];
      uint64_t v10 = [v9 accountWithUniqueIdentifier:v8];
      authenticatedAccount = v7->_authenticatedAccount;
      v7->_authenticatedAccount = (SSAccount *)v10;

      v7->_authenticateResponseType = xpc_dictionary_get_int64(v5, "3");
      v7->_credentialSource = xpc_dictionary_get_int64(v5, "4");
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      v13 = xpc_dictionary_get_value(v5, "1");
      uint64_t v14 = [v12 initWithXPCEncoding:v13];
      error = v7->_error;
      v7->_error = (NSError *)v14;

      objc_opt_class();
      CFArrayRef v16 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      responseDictionary = v7->_responseDictionary;
      v7->_responseDictionary = (NSDictionary *)v16;
    }
    self = v7;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SSAccount)authenticatedAccount
{
  return self->_authenticatedAccount;
}

- (void)setAuthenticatedAccount:(id)a3
{
}

- (int64_t)authenticateResponseType
{
  return self->_authenticateResponseType;
}

- (void)setAuthenticateResponseType:(int64_t)a3
{
  self->_authenticateResponseType = a3;
}

- (void)setError:(id)a3
{
}

- (unint64_t)credentialSource
{
  return self->_credentialSource;
}

- (void)setCredentialSource:(unint64_t)a3
{
  self->_credentialSource = a3;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_authenticatedAccount, 0);
}

@end