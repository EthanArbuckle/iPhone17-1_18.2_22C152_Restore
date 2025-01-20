@interface WLKCanonicalPlayablesRequest
- (NSString)canonicalID;
- (NSString)statsID;
- (WLKCanonicalPlayablesRequest)initWithCanonicalID:(id)a3;
- (WLKCanonicalPlayablesRequest)initWithStatsID:(id)a3;
- (void)makeRequestWithCompletion:(id)a3;
- (void)makeRequestWithCompletion:(id)a3 canonicalType:(int64_t)a4;
@end

@implementation WLKCanonicalPlayablesRequest

- (WLKCanonicalPlayablesRequest)initWithCanonicalID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKCanonicalPlayablesRequest;
    v5 = [(WLKCanonicalPlayablesRequest *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      canonicalID = v5->_canonicalID;
      v5->_canonicalID = (NSString *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"canonicalID must be non-nil"];
    v8 = 0;
  }

  return v8;
}

- (WLKCanonicalPlayablesRequest)initWithStatsID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKCanonicalPlayablesRequest;
    v5 = [(WLKCanonicalPlayablesRequest *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      statsID = v5->_statsID;
      v5->_statsID = (NSString *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"statsID must be non-nil"];
    v8 = 0;
  }

  return v8;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self->_canonicalID;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = [WLKCanonicalPlayablesRequestOperation alloc];
    v8 = [(WLKRequest *)self caller];
    v9 = [(WLKCanonicalPlayablesRequestOperation *)v7 initWithContentID:v5 caller:v8 isMovie:1];

    objc_initWeak(&location, v9);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke;
    v19[3] = &unk_1E620A970;
    objc_copyWeak(&v22, &location);
    v19[4] = self;
    objc_super v10 = v6;
    v20 = v10;
    id v21 = v4;
    [(WLKCanonicalPlayablesRequestOperation *)v9 setCompletionBlock:v19];
    v11 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
    [v11 addOperation:v9];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = [WLKCanonicalPlayablesSiriRequestOperation alloc];
    statsID = self->_statsID;
    v14 = [(WLKRequest *)self caller];
    objc_super v10 = [(WLKCanonicalPlayablesSiriRequestOperation *)v12 initWithStatsID:statsID caller:v14];

    objc_initWeak(&location, v10);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke_2;
    v16[3] = &unk_1E6209FD0;
    objc_copyWeak(&v18, &location);
    id v17 = v4;
    [(WLKCanonicalPlayablesSiriRequestOperation *)v10 setCompletionBlock:v16];
    v15 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
    [v15 addOperation:v10];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 40)];
  NSLog(&cfstr_ElapsedTime5f.isa, v3, v5);

  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = [WeakRetained response];
    uint64_t v7 = *(void *)(a1 + 48);
    v8 = [WeakRetained error];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);
  }
}

void __58__WLKCanonicalPlayablesRequest_makeRequestWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained response];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [v6 error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

    id WeakRetained = v6;
  }
}

- (void)makeRequestWithCompletion:(id)a3 canonicalType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [WLKCanonicalPlayablesRequestOperation alloc];
  canonicalID = self->_canonicalID;
  objc_super v10 = [(WLKRequest *)self caller];
  v11 = [(WLKCanonicalPlayablesRequestOperation *)v8 initWithContentID:canonicalID caller:v10 canonicalType:a4];

  objc_initWeak(&location, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__WLKCanonicalPlayablesRequest_makeRequestWithCompletion_canonicalType___block_invoke;
  v15[3] = &unk_1E620A970;
  objc_copyWeak(&v18, &location);
  v15[4] = self;
  id v12 = v7;
  id v16 = v12;
  id v13 = v6;
  id v17 = v13;
  [(WLKCanonicalPlayablesRequestOperation *)v11 setCompletionBlock:v15];
  v14 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
  [v14 addOperation:v11];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __72__WLKCanonicalPlayablesRequest_makeRequestWithCompletion_canonicalType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 40)];
  NSLog(&cfstr_ElapsedTime5f.isa, v3, v5);

  if (*(void *)(a1 + 48))
  {
    id v6 = [WeakRetained response];
    uint64_t v7 = *(void *)(a1 + 48);
    v8 = [WeakRetained error];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, v8);
  }
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)statsID
{
  return self->_statsID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsID, 0);

  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end