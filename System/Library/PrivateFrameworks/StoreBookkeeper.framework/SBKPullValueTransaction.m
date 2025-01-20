@interface SBKPullValueTransaction
- (BOOL)success;
- (NSString)clientItemVersionAnchor;
- (NSString)requestedKey;
- (NSString)resultDomainVersion;
- (NSString)resultItemVersionAnchor;
- (SBKKeyValuePayloadPair)clientItemPayloadPair;
- (SBKKeyValuePayloadPair)resultItemPayloadPair;
- (SBKPullValueTransaction)initWithStoreBagContext:(id)a3 requestedKey:(id)a4 clientItemPayloadPair:(id)a5 clientItemVersionAnchor:(id)a6;
- (id)clampsKey;
- (id)description;
- (id)newRequest;
- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation SBKPullValueTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDomainVersion, 0);
  objc_storeStrong((id *)&self->_resultItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_resultItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_clientItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_clientItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_requestedKey, 0);
}

- (NSString)resultDomainVersion
{
  return self->_resultDomainVersion;
}

- (NSString)resultItemVersionAnchor
{
  return self->_resultItemVersionAnchor;
}

- (SBKKeyValuePayloadPair)resultItemPayloadPair
{
  return self->_resultItemPayloadPair;
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)clientItemVersionAnchor
{
  return self->_clientItemVersionAnchor;
}

- (SBKKeyValuePayloadPair)clientItemPayloadPair
{
  return self->_clientItemPayloadPair;
}

- (NSString)requestedKey
{
  return self->_requestedKey;
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v17 = a3;
  v6 = (void (**)(id, void))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v17 itemValuePayload];

    if (v7)
    {
      v8 = objc_opt_class();
      v9 = [v17 itemKey];
      v10 = [v17 itemValuePayload];
      SBKKeyValuePayloadPairWithPreferredClass(v8, v9, v10);
      v11 = (SBKKeyValuePayloadPair *)objc_claimAutoreleasedReturnValue();
      resultItemPayloadPair = self->_resultItemPayloadPair;
      self->_resultItemPayloadPair = v11;

      v13 = [v17 itemVersion];
    }
    else
    {
      objc_storeStrong((id *)&self->_resultItemPayloadPair, self->_clientItemPayloadPair);
      v13 = self->_clientItemVersionAnchor;
    }
    resultItemVersionAnchor = self->_resultItemVersionAnchor;
    self->_resultItemVersionAnchor = v13;

    self->_success = [v17 isSuccess];
    v15 = [v17 domainVersion];
    resultDomainVersion = self->_resultDomainVersion;
    self->_resultDomainVersion = v15;
  }
  v6[2](v6, 0);
}

- (id)newRequest
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clampsKey
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@-%@", v5, self->_requestedKey];

  return v6;
}

- (id)description
{
  clientItemVersionAnchor = (__CFString *)self->_clientItemVersionAnchor;
  if (!clientItemVersionAnchor) {
    clientItemVersionAnchor = @"*unversioned*";
  }
  v4 = [NSString stringWithFormat:@"[client: payload-pair=%@, anchor=%@]", self->_clientItemPayloadPair, clientItemVersionAnchor];
  resultItemVersionAnchor = (__CFString *)self->_resultItemVersionAnchor;
  if (!resultItemVersionAnchor) {
    resultItemVersionAnchor = @"*unversioned*";
  }
  v6 = [NSString stringWithFormat:@"[result: payload-pair=%@, anchor=%@]", self->_resultItemPayloadPair, resultItemVersionAnchor];
  v7 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SBKPullValueTransaction;
  v8 = [(SBKPullValueTransaction *)&v12 description];
  v9 = [(SBKTransaction *)self domain];
  v10 = [v7 stringWithFormat:@"%@ domain = %@, GET: key='%@', %@, %@", v8, v9, self->_requestedKey, v4, v6];

  return v10;
}

- (SBKPullValueTransaction)initWithStoreBagContext:(id)a3 requestedKey:(id)a4 clientItemPayloadPair:(id)a5 clientItemVersionAnchor:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  v15 = [v14 domain];
  v16 = [v14 pullKeyValueRequestURL];

  v19.receiver = self;
  v19.super_class = (Class)SBKPullValueTransaction;
  id v17 = [(SBKTransaction *)&v19 initWithDomain:v15 requestURL:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_requestedKey, a4);
    objc_storeStrong((id *)&v17->_clientItemPayloadPair, a5);
    objc_storeStrong((id *)&v17->_clientItemVersionAnchor, a6);
  }

  return v17;
}

@end