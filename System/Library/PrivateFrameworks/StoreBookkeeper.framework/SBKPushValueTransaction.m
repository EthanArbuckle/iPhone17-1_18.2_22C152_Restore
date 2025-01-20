@interface SBKPushValueTransaction
- (BOOL)success;
- (NSString)clientItemVersionAnchor;
- (NSString)requestItemVersionAnchor;
- (NSString)resultDomainVersion;
- (NSString)resultItemVersionAnchor;
- (SBKKeyValuePayloadPair)clientItemPayloadPair;
- (SBKKeyValuePayloadPair)requestItemPayloadPair;
- (SBKKeyValuePayloadPair)resultItemPayloadPair;
- (SBKPushValueTransaction)initWithStoreBagContext:(id)a3 clientItemPayloadPair:(id)a4 clientItemVersionAnchor:(id)a5;
- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4;
- (id)clampsKey;
- (id)description;
- (id)newRequest;
- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation SBKPushValueTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDomainVersion, 0);
  objc_storeStrong((id *)&self->_resultItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_resultItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_requestItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_requestItemPayloadPair, 0);
  objc_storeStrong((id *)&self->_clientItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_clientItemPayloadPair, 0);
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

- (NSString)requestItemVersionAnchor
{
  return self->_requestItemVersionAnchor;
}

- (SBKKeyValuePayloadPair)requestItemPayloadPair
{
  return self->_requestItemPayloadPair;
}

- (NSString)clientItemVersionAnchor
{
  return self->_clientItemVersionAnchor;
}

- (SBKKeyValuePayloadPair)clientItemPayloadPair
{
  return self->_clientItemPayloadPair;
}

- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 timestamp];
  double v8 = v7;
  [v5 timestamp];
  if (v8 >= v9) {
    v10 = v6;
  }
  else {
    v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, BOOL))a4;
  BOOL isRechedulable = self->_isRechedulable;
  self->_BOOL isRechedulable = 0;
  id v21 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [v21 conflictItemValuePayload];

    if (v9)
    {
      BOOL v10 = isRechedulable;
      id v11 = objc_opt_class();
      v12 = [v21 conflictItemKey];
      v13 = [v21 conflictItemValuePayload];
      v14 = SBKKeyValuePayloadPairWithPreferredClass(v11, v12, v13);

      v15 = [(SBKPushValueTransaction *)self _resolveConflictBetweenClientPayloadPair:self->_clientItemPayloadPair andServerPayloadPair:v14];
      requestItemPayloadPair = self->_requestItemPayloadPair;
      self->_requestItemPayloadPair = v15;

      v17 = [v21 conflictItemVersionAnchor];
      requestItemVersionAnchor = self->_requestItemVersionAnchor;
      self->_requestItemVersionAnchor = v17;

      v7[2](v7, v10);
      goto LABEL_6;
    }
    self->_success = [v21 isSuccess];
    objc_storeStrong((id *)&self->_resultItemPayloadPair, self->_requestItemPayloadPair);
    objc_storeStrong((id *)&self->_resultItemVersionAnchor, self->_requestItemVersionAnchor);
    v19 = [v21 domainVersion];
    resultDomainVersion = self->_resultDomainVersion;
    self->_resultDomainVersion = v19;
  }
  v7[2](v7, 0);
LABEL_6:
}

- (id)newRequest
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clampsKey
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(SBKKeyValuePayloadPair *)self->_clientItemPayloadPair kvsKey];
  double v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
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
  id v6 = [NSString stringWithFormat:@"[result: payload-pair=%@, anchor=%@]", self->_resultItemPayloadPair, resultItemVersionAnchor];
  requestItemVersionAnchor = (__CFString *)self->_requestItemVersionAnchor;
  if (!requestItemVersionAnchor) {
    requestItemVersionAnchor = @"*unversioned*";
  }
  double v8 = [NSString stringWithFormat:@"[request: payload-pair=%@, anchor=%@]", self->_requestItemPayloadPair, requestItemVersionAnchor];
  double v9 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)SBKPushValueTransaction;
  BOOL v10 = [(SBKPushValueTransaction *)&v14 description];
  id v11 = [(SBKTransaction *)self domain];
  v12 = [v9 stringWithFormat:@"%@ domain = %@, PUT: %@, %@, %@", v10, v11, v4, v8, v6];

  return v12;
}

- (SBKPushValueTransaction)initWithStoreBagContext:(id)a3 clientItemPayloadPair:(id)a4 clientItemVersionAnchor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v11 domain];
  v13 = [v11 pushKeyValueRequestURL];

  v16.receiver = self;
  v16.super_class = (Class)SBKPushValueTransaction;
  objc_super v14 = [(SBKTransaction *)&v16 initWithDomain:v12 requestURL:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_clientItemPayloadPair, a4);
    objc_storeStrong((id *)&v14->_clientItemVersionAnchor, a5);
    objc_storeStrong((id *)&v14->_requestItemPayloadPair, a4);
    objc_storeStrong((id *)&v14->_requestItemVersionAnchor, a5);
    v14->_BOOL isRechedulable = 1;
  }

  return v14;
}

@end