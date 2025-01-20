@interface ICDelegationConsumerServiceSessionRequestResult
- (ICDelegateToken)delegateToken;
- (ICDelegationConsumerServiceSessionRequestResult)initWithDelegateToken:(id)a3 storefrontIdentifier:(id)a4 resultError:(id)a5;
- (NSError)resultError;
- (NSString)storefrontIdentifier;
@end

@implementation ICDelegationConsumerServiceSessionRequestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_resultError, 0);

  objc_storeStrong((id *)&self->_delegateToken, 0);
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSError)resultError
{
  return self->_resultError;
}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (ICDelegationConsumerServiceSessionRequestResult)initWithDelegateToken:(id)a3 storefrontIdentifier:(id)a4 resultError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICDelegationConsumerServiceSessionRequestResult;
  v11 = [(ICDelegationConsumerServiceSessionRequestResult *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    delegateToken = v11->_delegateToken;
    v11->_delegateToken = (ICDelegateToken *)v12;

    uint64_t v14 = [v10 copy];
    resultError = v11->_resultError;
    v11->_resultError = (NSError *)v14;

    uint64_t v16 = [v9 copy];
    storefrontIdentifier = v11->_storefrontIdentifier;
    v11->_storefrontIdentifier = (NSString *)v16;
  }
  return v11;
}

@end