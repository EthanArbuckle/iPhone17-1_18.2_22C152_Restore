@interface IMMediaRequestEncoder
- (BOOL)personalizeRequests;
- (IMMediaRequestEncoder)initWithBag:(id)a3 session:(id)a4;
- (void)prepareRequest:(id)a3 account:(id)a4 completion:(id)a5;
- (void)prepareRequest:(id)a3 completion:(id)a4;
- (void)setPersonalizeRequests:(BOOL)a3;
@end

@implementation IMMediaRequestEncoder

- (void)setPersonalizeRequests:(BOOL)a3
{
  self->personalizeRequests = a3;
}

- (void)prepareRequest:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if ([(IMMediaRequestEncoder *)v11 personalizeRequests])
  {
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      self = (IMMediaRequestEncoder *)objc_claimAutoreleasedReturnValue();
      v12 = [(IMMediaRequestEncoder *)self ams_activeiTunesAccount];
    }
    [(AMSMediaRequestEncoder *)v11 setAccount:v12];
    if (!v9)
    {
    }
  }
  v17.receiver = v11;
  v17.super_class = (Class)IMMediaRequestEncoder;
  v13 = [(AMSMediaRequestEncoder *)&v17 requestByEncodingRequest:v8 parameters:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__IMMediaRequestEncoder_prepareRequest_account_completion___block_invoke;
  v15[3] = &unk_1E5E61268;
  id v14 = v10;
  id v16 = v14;
  [v13 addFinishBlock:v15];

  objc_sync_exit(v11);
}

- (BOOL)personalizeRequests
{
  return self->personalizeRequests;
}

- (IMMediaRequestEncoder)initWithBag:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[IMURLBag sharedInstance];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F4DD48]);
  id v9 = +[PFClientUtil mediaApiClientIdentifier];
  id v10 = (void *)[v8 initWithClientIdentifier:v9 bag:v6];

  [v10 setSession:v7];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F4DD28]) initWithTokenService:v10];
  [v7 setProtocolHandler:v11];
  v16.receiver = self;
  v16.super_class = (Class)IMMediaRequestEncoder;
  v12 = [(AMSMediaRequestEncoder *)&v16 initWithTokenService:v10 bag:v6];
  v13 = v12;
  if (v12)
  {
    [(IMMediaRequestEncoder *)v12 setPersonalizeRequests:1];
    id v14 = [MEMORY[0x1E4F4DDC8] currentProcess];
    [v14 setTreatmentNamespace:@"podcasts"];
    [(AMSMediaRequestEncoder *)v13 setClientInfo:v14];
  }
  return v13;
}

- (void)prepareRequest:(id)a3 completion:(id)a4
{
}

uint64_t __59__IMMediaRequestEncoder_prepareRequest_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end