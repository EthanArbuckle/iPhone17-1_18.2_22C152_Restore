@interface SBKTransaction
- (NSMutableDictionary)userInfo;
- (NSString)domain;
- (NSURL)requestURL;
- (SBKRequest)activeRequest;
- (SBKTransaction)init;
- (SBKTransaction)initWithDomain:(id)a3 requestURL:(id)a4;
- (id)clampsKey;
- (id)newRequest;
- (id)transactionContextForKey:(id)a3;
- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)setActiveRequest:(id)a3;
- (void)setRequestURL:(id)a3;
- (void)setTransactionContext:(id)a3 forKey:(id)a4;
- (void)setUserInfo:(id)a3;
@end

@implementation SBKTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setActiveRequest:(id)a3
{
}

- (SBKRequest)activeRequest
{
  return self->_activeRequest;
}

- (void)setRequestURL:(id)a3
{
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSString)domain
{
  return self->_domain;
}

- (id)newRequest
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKTransaction.m" lineNumber:62 description:@"Subclass must implement"];

  return 0;
}

- (id)clampsKey
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKTransaction.m" lineNumber:56 description:@"Subclass must implement"];

  return 0;
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"SBKTransaction.m" lineNumber:51 description:@"Subclass must implement"];
}

- (id)transactionContextForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_userInfo valueForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setTransactionContext:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_userInfo setValue:v8 forKey:v6];
  objc_sync_exit(v7);
}

- (SBKTransaction)init
{
  return [(SBKTransaction *)self initWithDomain:0 requestURL:0];
}

- (SBKTransaction)initWithDomain:(id)a3 requestURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBKTransaction;
  v9 = [(SBKTransaction *)&v13 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    userInfo = v9->_userInfo;
    v9->_userInfo = v10;

    objc_storeStrong((id *)&v9->_requestURL, a4);
    objc_storeStrong((id *)&v9->_domain, a3);
  }

  return v9;
}

@end