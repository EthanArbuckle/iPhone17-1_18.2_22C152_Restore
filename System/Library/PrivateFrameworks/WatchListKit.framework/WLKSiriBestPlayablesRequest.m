@interface WLKSiriBestPlayablesRequest
- (NSArray)statsIDs;
- (WLKSiriBestPlayablesRequest)init;
- (WLKSiriBestPlayablesRequest)initWithStatsIDs:(id)a3;
- (void)makeRequestWithCompletion:(id)a3;
@end

@implementation WLKSiriBestPlayablesRequest

- (WLKSiriBestPlayablesRequest)init
{
  return 0;
}

- (WLKSiriBestPlayablesRequest)initWithStatsIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKSiriBestPlayablesRequest;
  v5 = [(WLKSiriBestPlayablesRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    statsIDs = v5->_statsIDs;
    v5->_statsIDs = (NSArray *)v6;
  }
  return v5;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [WLKSiriBestPlayableForStatsIDsOperation alloc];
  uint64_t v6 = [(WLKSiriBestPlayablesRequest *)self statsIDs];
  v7 = [(WLKRequest *)self caller];
  v8 = [(WLKSiriBestPlayableForStatsIDsOperation *)v5 initWithStatsIDs:v6 caller:v7];

  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__WLKSiriBestPlayablesRequest_makeRequestWithCompletion___block_invoke;
  v11[3] = &unk_1E6209FD0;
  objc_copyWeak(&v13, &location);
  id v9 = v4;
  id v12 = v9;
  [(WLKSiriBestPlayableForStatsIDsOperation *)v8 setCompletionBlock:v11];
  v10 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
  [v10 addOperation:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__WLKSiriBestPlayablesRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained response];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [v6 error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

    id WeakRetained = v6;
  }
}

- (NSArray)statsIDs
{
  return self->_statsIDs;
}

- (void).cxx_destruct
{
}

@end