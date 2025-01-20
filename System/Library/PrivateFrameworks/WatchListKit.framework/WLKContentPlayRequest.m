@interface WLKContentPlayRequest
- (NSString)canonicalID;
- (WLKContentPlayRequest)initWithCanonicalID:(id)a3;
- (void)makeRequestWithCompletion:(id)a3;
@end

@implementation WLKContentPlayRequest

- (WLKContentPlayRequest)initWithCanonicalID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKContentPlayRequest;
    v6 = [(WLKContentPlayRequest *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_canonicalID, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [WLKContentPlayRequestOperation alloc];
  canonicalID = self->_canonicalID;
  v7 = [(WLKRequest *)self caller];
  v8 = [(WLKContentPlayRequestOperation *)v5 initWithCanonicalID:canonicalID caller:v7];

  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__WLKContentPlayRequest_makeRequestWithCompletion___block_invoke;
  v11[3] = &unk_1E6209FD0;
  objc_copyWeak(&v13, &location);
  id v9 = v4;
  id v12 = v9;
  [(WLKContentPlayRequestOperation *)v8 setCompletionBlock:v11];
  objc_super v10 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
  [v10 addOperation:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __51__WLKContentPlayRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained response];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [v6 error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

    id WeakRetained = v6;
  }
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void).cxx_destruct
{
}

@end