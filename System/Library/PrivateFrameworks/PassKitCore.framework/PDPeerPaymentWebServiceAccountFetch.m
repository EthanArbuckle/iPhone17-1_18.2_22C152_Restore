@interface PDPeerPaymentWebServiceAccountFetch
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)fromPush;
- (BOOL)updateAccount;
- (BOOL)updateAssociatedAccounts;
- (BOOL)updatePass;
- (PDPeerPaymentWebServiceAccountFetch)initWithCompletionHandler:(id)a3;
- (id)description;
- (id)diagnosticReasonString;
- (void)addDiagnosticReason:(id)a3;
- (void)addDiagnosticReasons:(id)a3;
- (void)callCompletionsWithAccount:(id)a3;
- (void)setFromPush:(BOOL)a3;
- (void)setUpdateAccount:(BOOL)a3;
- (void)setUpdateAssociatedAccounts:(BOOL)a3;
- (void)setUpdatePass:(BOOL)a3;
@end

@implementation PDPeerPaymentWebServiceAccountFetch

- (PDPeerPaymentWebServiceAccountFetch)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDPeerPaymentWebServiceAccountFetch;
  v5 = [(PDPeerPaymentWebServiceAccountFetch *)&v13 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = v6;

    if (v4)
    {
      v8 = v5->_completionHandlers;
      id v9 = objc_retainBlock(v4);
      [(NSMutableArray *)v8 addObject:v9];
    }
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    diagnosticReasons = v5->_diagnosticReasons;
    v5->_diagnosticReasons = v10;
  }
  return v5;
}

- (void)addDiagnosticReason:(id)a3
{
}

- (void)addDiagnosticReasons:(id)a3
{
  if (a3) {
    -[NSMutableSet unionSet:](self->_diagnosticReasons, "unionSet:");
  }
}

- (void)callCompletionsWithAccount:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_completionHandlers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)diagnosticReasonString
{
  if ([(NSMutableSet *)self->_diagnosticReasons count])
  {
    v3 = [(NSMutableSet *)self->_diagnosticReasons allObjects];
    id v4 = [v3 sortedArrayUsingSelector:"compare:"];
    v5 = [v4 componentsJoinedByString:@","];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDPeerPaymentWebServiceAccountFetch *)self _canCoalesceRequest:v4];
  if (v5)
  {
    [(NSMutableArray *)self->_completionHandlers addObjectsFromArray:v4[1]];
    [(NSMutableSet *)self->_diagnosticReasons unionSet:v4[2]];
  }

  return v5;
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v9 = 0;
  if (v4)
  {
    int updateAccount = self->_updateAccount;
    if (updateAccount == [v4 updateAccount])
    {
      int updateAssociatedAccounts = self->_updateAssociatedAccounts;
      if (updateAssociatedAccounts == [v5 updateAssociatedAccounts])
      {
        int updatePass = self->_updatePass;
        if (updatePass == [v5 updatePass]) {
          BOOL v9 = 1;
        }
      }
    }
  }

  return v9;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  id v4 = v3;
  if (self->_updateAccount) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"updateAccount: '%@'; ", v5];
  if (self->_updateAssociatedAccounts) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v4 appendFormat:@"updateAssociatedAccounts: '%@'; ", v6];
  if (self->_updatePass) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v4 appendFormat:@"updatePass: '%@'; ", v7];
  [v4 appendFormat:@"diagnosticReasons: '%@'; ", self->_diagnosticReasons];
  id v8 = [v4 copy];

  return v8;
}

- (BOOL)updateAccount
{
  return self->_updateAccount;
}

- (void)setUpdateAccount:(BOOL)a3
{
  self->_int updateAccount = a3;
}

- (BOOL)updateAssociatedAccounts
{
  return self->_updateAssociatedAccounts;
}

- (void)setUpdateAssociatedAccounts:(BOOL)a3
{
  self->_int updateAssociatedAccounts = a3;
}

- (BOOL)updatePass
{
  return self->_updatePass;
}

- (void)setUpdatePass:(BOOL)a3
{
  self->_int updatePass = a3;
}

- (BOOL)fromPush
{
  return self->_fromPush;
}

- (void)setFromPush:(BOOL)a3
{
  self->_fromPush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticReasons, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end