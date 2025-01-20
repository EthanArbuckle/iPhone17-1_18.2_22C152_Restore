@interface MCOSXServerAccountPayloadHandler
- (ACAccount)setAsideAccount;
- (BOOL)isInstalled;
- (id)_installedAccount;
- (id)accountStore;
- (void)_deleteAccountAndAssociatedData:(id)a3;
- (void)remove;
- (void)setAsideWithInstaller:(id)a3;
- (void)setSetAsideAccount:(id)a3;
@end

@implementation MCOSXServerAccountPayloadHandler

- (id)accountStore
{
  if (qword_100105A60 != -1) {
    dispatch_once(&qword_100105A60, &stru_1000EC390);
  }
  v2 = (void *)qword_100105A58;

  return v2;
}

- (id)_installedAccount
{
  v3 = [(MCOSXServerAccountPayloadHandler *)self accountStore];
  v4 = [v3 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierOSXServer];

  v24 = self;
  v5 = [(MCOSXServerAccountPayloadHandler *)self accountStore];
  v6 = [v5 accountsWithAccountType:v4];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    v22 = v4;
    uint64_t v8 = *(void *)v28;
    v9 = v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v11 mcProfileUUID];
        v13 = [(MCNewPayloadHandler *)v9 payload];
        v14 = [v13 profile];
        v15 = [v14 UUID];
        if ([v12 isEqualToString:v15])
        {
          v23 = v11;
          v16 = [v11 mcPayloadUUID];
          v17 = [(MCNewPayloadHandler *)v9 payload];
          [v17 UUID];
          id v18 = v7;
          v20 = uint64_t v19 = v8;
          unsigned int v26 = [v16 isEqualToString:v20];

          uint64_t v8 = v19;
          id v7 = v18;

          v9 = v24;
          if (v26)
          {
            id v7 = v23;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
LABEL_12:
    v4 = v22;
  }

  return v7;
}

- (BOOL)isInstalled
{
  v2 = [(MCOSXServerAccountPayloadHandler *)self _installedAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MCOSXServerAccountPayloadHandler;
  [(MCNewPayloadHandler *)&v7 setAsideWithInstaller:v4];
  v5 = [(MCOSXServerAccountPayloadHandler *)self _installedAccount];
  if (v5)
  {
    [(MCOSXServerAccountPayloadHandler *)self setSetAsideAccount:v5];
    v6 = [v5 identifier];
    [v4 addSetAsideAccountIdentifier:v6 forPayloadClass:objc_opt_class()];
  }
}

- (void)_deleteAccountAndAssociatedData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)DMCProcessAssertion) initWithReason:@"profiled-DeleteAccount"];
  v6 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000828A4;
  block[3] = &unk_1000EC220;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)remove
{
  BOOL v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    id v5 = [(MCOSXServerAccountPayloadHandler *)self setAsideAccount];
    [(MCOSXServerAccountPayloadHandler *)self setSetAsideAccount:0];
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v5 = [(MCOSXServerAccountPayloadHandler *)self _installedAccount];
  if (v5) {
LABEL_5:
  }
    [(MCOSXServerAccountPayloadHandler *)self _deleteAccountAndAssociatedData:v5];
LABEL_6:
}

- (ACAccount)setAsideAccount
{
  return self->_setAsideAccount;
}

- (void)setSetAsideAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideAccount, 0);
  objc_storeStrong((id *)&self->_validationError, 0);

  objc_storeStrong((id *)&self->_doneSema, 0);
}

@end