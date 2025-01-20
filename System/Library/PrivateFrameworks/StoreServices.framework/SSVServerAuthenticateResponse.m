@interface SSVServerAuthenticateResponse
- (NSNumber)authenticatedAccountIdentifier;
- (NSURL)redirectURL;
- (SSVServerAuthenticateResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)performedButtonIndex;
- (int64_t)selectedButtonIndex;
- (void)setAuthenticatedAccountIdentifier:(id)a3;
- (void)setPerformedButtonIndex:(int64_t)a3;
- (void)setRedirectURL:(id)a3;
- (void)setSelectedButtonIndex:(int64_t)a3;
@end

@implementation SSVServerAuthenticateResponse

- (SSVServerAuthenticateResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSVServerAuthenticateResponse;
  v5 = [(SSVServerAuthenticateResponse *)&v12 init];
  if (v5)
  {
    objc_opt_class();
    CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(v4, "0");
    authenticatedAccountIdentifier = v5->_authenticatedAccountIdentifier;
    v5->_authenticatedAccountIdentifier = (NSNumber *)v6;

    v5->_performedButtonIndex = xpc_dictionary_get_int64(v4, "1");
    v5->_selectedButtonIndex = xpc_dictionary_get_int64(v4, "3");
    objc_opt_class();
    CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v4, "2");
    if (v8)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
      redirectURL = v5->_redirectURL;
      v5->_redirectURL = (NSURL *)v9;
    }
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_authenticatedAccountIdentifier);
  xpc_dictionary_set_int64(v3, "1", self->_performedButtonIndex);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)[(NSURL *)self->_redirectURL absoluteString]);
  xpc_dictionary_set_int64(v3, "3", self->_selectedButtonIndex);
  return v3;
}

- (NSNumber)authenticatedAccountIdentifier
{
  return self->_authenticatedAccountIdentifier;
}

- (void)setAuthenticatedAccountIdentifier:(id)a3
{
}

- (int64_t)performedButtonIndex
{
  return self->_performedButtonIndex;
}

- (void)setPerformedButtonIndex:(int64_t)a3
{
  self->_performedButtonIndex = a3;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
}

- (int64_t)selectedButtonIndex
{
  return self->_selectedButtonIndex;
}

- (void)setSelectedButtonIndex:(int64_t)a3
{
  self->_selectedButtonIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_authenticatedAccountIdentifier, 0);
}

@end