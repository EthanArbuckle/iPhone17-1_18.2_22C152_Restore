@interface IMURLRequestEncoder
- (BOOL)personalizeRequests;
- (IMURLRequestEncoder)initWithBag:(id)a3;
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
- (void)prepareRequest:(id)a3 account:(id)a4 completion:(id)a5;
- (void)prepareRequest:(id)a3 completion:(id)a4;
- (void)setPersonalizeRequests:(BOOL)a3;
@end

@implementation IMURLRequestEncoder

- (IMURLRequestEncoder)initWithBag:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[IMURLBag sharedInstance];
  }
  v8.receiver = self;
  v8.super_class = (Class)IMURLRequestEncoder;
  v5 = [(AMSURLRequestEncoder *)&v8 initWithBag:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F4DDC8] currentProcess];
    [(AMSURLRequestEncoder *)v5 setClientInfo:v6];
  }
  return v5;
}

- (void)prepareRequest:(id)a3 completion:(id)a4
{
}

- (void)prepareRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if ([(IMURLRequestEncoder *)v11 personalizeRequests])
  {
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      self = (IMURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      v12 = [(IMURLRequestEncoder *)self ams_activeiTunesAccount];
    }
    [(AMSURLRequestEncoder *)v11 setAccount:v12];
    if (!v9)
    {
    }
  }
  v17.receiver = v11;
  v17.super_class = (Class)IMURLRequestEncoder;
  v13 = [(AMSURLRequestEncoder *)&v17 requestByEncodingRequest:v8 parameters:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__IMURLRequestEncoder_prepareRequest_account_completion___block_invoke;
  v15[3] = &unk_1E5E61268;
  id v14 = v10;
  id v16 = v14;
  [v13 addFinishBlock:v15];

  objc_sync_exit(v11);
}

uint64_t __57__IMURLRequestEncoder_prepareRequest_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F4DDD0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__IMURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke;
  v10[3] = &unk_1E5E61290;
  id v8 = v7;
  id v11 = v8;
  [(IMURLRequestEncoder *)self prepareRequest:v6 completion:v10];

  return v8;
}

uint64_t __59__IMURLRequestEncoder_requestByEncodingRequest_parameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (BOOL)personalizeRequests
{
  return self->personalizeRequests;
}

- (void)setPersonalizeRequests:(BOOL)a3
{
  self->personalizeRequests = a3;
}

@end