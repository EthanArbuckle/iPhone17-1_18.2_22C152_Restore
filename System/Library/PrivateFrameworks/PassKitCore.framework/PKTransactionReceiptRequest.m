@interface PKTransactionReceiptRequest
- (NSData)signature;
- (NSString)authorizationToken;
- (NSString)conversationIdentifier;
- (NSString)receiptIdentifier;
- (NSURL)receiptProviderURL;
- (PKTransactionReceiptRequest)initWithReceiptProviderURL:(id)a3 authorizationToken:(id)a4 signature:(id)a5 receiptIdentifier:(id)a6;
- (id)_urlRequest;
- (void)setConversationIdentifier:(id)a3;
@end

@implementation PKTransactionReceiptRequest

- (PKTransactionReceiptRequest)initWithReceiptProviderURL:(id)a3 authorizationToken:(id)a4 signature:(id)a5 receiptIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKTransactionReceiptRequest;
  v15 = [(PKOverlayableWebServiceRequest *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_receiptProviderURL, a3);
    uint64_t v17 = [v12 copy];
    authorizationToken = v16->_authorizationToken;
    v16->_authorizationToken = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    signature = v16->_signature;
    v16->_signature = (NSData *)v19;

    uint64_t v21 = [v14 copy];
    receiptIdentifier = v16->_receiptIdentifier;
    v16->_receiptIdentifier = (NSString *)v21;
  }
  return v16;
}

- (id)_urlRequest
{
  v3 = [MEMORY[0x1E4F29088] componentsWithURL:self->_receiptProviderURL resolvingAgainstBaseURL:0];
  v4 = [v3 queryItems];
  v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v8 = v7;

  if (self->_authorizationToken)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"authorizationToken" value:self->_authorizationToken];
    [v8 addObject:v9];
  }
  if (self->_receiptIdentifier)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"receiptIdentifier" value:self->_receiptIdentifier];
    [v8 addObject:v10];
  }
  signature = self->_signature;
  if (signature)
  {
    id v12 = [(NSData *)signature URLBase64EncodedString];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"signature" value:v12];
    [v8 addObject:v13];
  }
  [v3 setQueryItems:v8];
  id v14 = [v3 URL];
  v15 = [(PKPaymentWebServiceRequest *)self _murlRequestWithURL:v14];
  [v15 setHTTPMethod:@"GET"];
  [v15 setValue:self->_conversationIdentifier forHTTPHeaderField:@"x-conversation-id"];
  v16 = (void *)[v15 copy];

  return v16;
}

- (NSURL)receiptProviderURL
{
  return self->_receiptProviderURL;
}

- (NSString)authorizationToken
{
  return self->_authorizationToken;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
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
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authorizationToken, 0);
  objc_storeStrong((id *)&self->_receiptProviderURL, 0);
}

@end