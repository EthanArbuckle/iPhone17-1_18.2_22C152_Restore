@interface PKTransactionReceiptAuthorizationResponse
- (NSData)signature;
- (NSString)authorizationToken;
- (NSString)conversationIdentifier;
- (PKTransactionReceiptAuthorizationResponse)initWithData:(id)a3;
- (void)setConversationIdentifier:(id)a3;
@end

@implementation PKTransactionReceiptAuthorizationResponse

- (PKTransactionReceiptAuthorizationResponse)initWithData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKTransactionReceiptAuthorizationResponse;
  v3 = [(PKWebServiceResponse *)&v17 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKStringForKey:@"authToken"];
      authorizationToken = v4->_authorizationToken;
      v4->_authorizationToken = (NSString *)v6;

      v8 = [v5 PKStringForKey:@"signature"];
      v9 = v8;
      if (!v8)
      {
LABEL_9:

        return v4;
      }
      uint64_t v10 = [(PKTransactionReceiptAuthorizationResponse *)v8 pk_decodeURLBase64];
      p_super = &v4->_signature->super;
      v4->_signature = (NSData *)v10;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        __int16 v20 = 2112;
        v21 = v14;
        id v15 = v14;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v9 = v4;
      v4 = 0;
    }

    goto LABEL_9;
  }
  return v4;
}

- (NSString)authorizationToken
{
  return self->_authorizationToken;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authorizationToken, 0);
}

@end