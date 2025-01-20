@interface WLKCanonicalContainerRequest
- (NSString)canonicalID;
- (WLKCanonicalContainerRequest)initWithCanonicalID:(id)a3;
- (void)makeRequestWithCompletion:(id)a3;
- (void)makeRequestWithCompletion:(id)a3 canonicalType:(int64_t)a4;
@end

@implementation WLKCanonicalContainerRequest

- (WLKCanonicalContainerRequest)initWithCanonicalID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKCanonicalContainerRequest;
    v6 = [(WLKCanonicalContainerRequest *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_canonicalID, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"canonicalID must be non-nil"];
    v8 = 0;
  }

  return v8;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [WLKCanonicalContainerRequestOperation alloc];
  canonicalID = self->_canonicalID;
  v8 = [(WLKRequest *)self caller];
  v9 = [(WLKCanonicalPlayablesRequestOperation *)v6 initWithContentID:canonicalID caller:v8 isMovie:0];

  objc_initWeak(&location, v9);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __58__WLKCanonicalContainerRequest_makeRequestWithCompletion___block_invoke;
  v16 = &unk_1E620B2C8;
  id v10 = v5;
  id v17 = v10;
  objc_copyWeak(&v19, &location);
  id v11 = v4;
  id v18 = v11;
  [(WLKCanonicalContainerRequestOperation *)v9 setCompletionBlock:&v13];
  v12 = objc_msgSend(MEMORY[0x1E4F28F08], "wlkDefaultQueue", v13, v14, v15, v16);
  [v12 addOperation:v9];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __58__WLKCanonicalContainerRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  NSLog(&cfstr_Wlkcanonicalco.isa, v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 40))
  {
    id v8 = WeakRetained;
    id v5 = [WeakRetained containerResponse];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [v8 error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

    id WeakRetained = v8;
  }
}

- (void)makeRequestWithCompletion:(id)a3 canonicalType:(int64_t)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [WLKCanonicalContainerRequestOperation alloc];
  canonicalID = self->_canonicalID;
  id v10 = [(WLKRequest *)self caller];
  id v11 = [(WLKCanonicalPlayablesRequestOperation *)v8 initWithContentID:canonicalID caller:v10 canonicalType:a4];

  objc_initWeak(&location, v11);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __72__WLKCanonicalContainerRequest_makeRequestWithCompletion_canonicalType___block_invoke;
  id v18 = &unk_1E620B2C8;
  id v12 = v7;
  id v19 = v12;
  objc_copyWeak(&v21, &location);
  id v13 = v6;
  id v20 = v13;
  [(WLKCanonicalContainerRequestOperation *)v11 setCompletionBlock:&v15];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F08], "wlkDefaultQueue", v15, v16, v17, v18);
  [v14 addOperation:v11];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __72__WLKCanonicalContainerRequest_makeRequestWithCompletion_canonicalType___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  NSLog(&cfstr_Wlkcanonicalco.isa, v3);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 40))
  {
    id v8 = WeakRetained;
    id v5 = [WeakRetained containerResponse];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [v8 error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

    id WeakRetained = v8;
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