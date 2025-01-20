@interface WLKRemoveFavoriteRequest
- (NSString)bundleID;
- (NSString)canonicalID;
- (NSString)externalID;
- (NSString)statsID;
- (WLKRemoveFavoriteRequest)initWithBundleID:(id)a3 externalID:(id)a4;
- (WLKRemoveFavoriteRequest)initWithCanonicalID:(id)a3;
- (WLKRemoveFavoriteRequest)initWithStatsID:(id)a3;
- (WLKWatchListModificationResponse)response;
- (void)makeRequestWithCompletion:(id)a3;
@end

@implementation WLKRemoveFavoriteRequest

- (WLKRemoveFavoriteRequest)initWithCanonicalID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKRemoveFavoriteRequest;
    v5 = [(WLKRemoveFavoriteRequest *)&v10 init];
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
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"canonicalID is required"];
    v8 = 0;
  }

  return v8;
}

- (WLKRemoveFavoriteRequest)initWithStatsID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKRemoveFavoriteRequest;
    v5 = [(WLKRemoveFavoriteRequest *)&v10 init];
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
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"statsID is required"];
    v8 = 0;
  }

  return v8;
}

- (WLKRemoveFavoriteRequest)initWithBundleID:(id)a3 externalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"bundleID is required";
LABEL_9:
    [v19 raise:v20 format:v21];
    v18 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"externalID is required";
    goto LABEL_9;
  }
  v9 = +[WLKChannelUtilities sharedInstance];
  objc_super v10 = [v9 channelIDForBundleID:v6];

  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)WLKRemoveFavoriteRequest;
    v11 = [(WLKRemoveFavoriteRequest *)&v23 init];
    if (v11)
    {
      uint64_t v12 = [v6 copy];
      bundleID = v11->_bundleID;
      v11->_bundleID = (NSString *)v12;

      uint64_t v14 = [v8 copy];
      externalID = v11->_externalID;
      v11->_externalID = (NSString *)v14;

      uint64_t v16 = [v10 copy];
      channelID = v11->_channelID;
      v11->_channelID = (NSString *)v16;
    }
    self = v11;
    v18 = self;
  }
  else
  {
    NSLog(&cfstr_ErrorUnableToR.isa, v6);
    v18 = 0;
  }

LABEL_12:
  return v18;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[WLKSettingsStore sharedSettings];
  char v6 = [v5 optedIn];

  if (v6)
  {
    if (self->_canonicalID)
    {
      id v7 = [WLKWatchListModificationRequestOperation alloc];
      canonicalID = self->_canonicalID;
      v9 = [(WLKRequest *)self caller];
      uint64_t v10 = [(WLKWatchListModificationRequestOperation *)v7 initWithAction:1 canonicalID:canonicalID caller:v9];
    }
    else
    {
      if (!self->_statsID)
      {
        if (self->_channelID && self->_externalID)
        {
          v17 = [WLKWatchListModificationRequestOperation alloc];
          channelID = self->_channelID;
          externalID = self->_externalID;
          uint64_t v20 = [(WLKRequest *)self caller];
          v15 = [(WLKWatchListModificationRequestOperation *)v17 initWithAction:1 channelID:channelID externalID:externalID caller:v20];
        }
        else
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"no valid canonical ID or channel/external ID pair"];
          v15 = 0;
        }
        goto LABEL_8;
      }
      v13 = [WLKWatchListModificationRequestOperation alloc];
      statsID = self->_statsID;
      v9 = [(WLKRequest *)self caller];
      uint64_t v10 = [(WLKWatchListModificationRequestOperation *)v13 initWithAction:1 statsID:statsID caller:v9];
    }
    v15 = (WLKWatchListModificationRequestOperation *)v10;

LABEL_8:
    objc_initWeak(&location, self);
    objc_initWeak(&from, v15);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke_2;
    v21[3] = &unk_1E620B5F0;
    objc_copyWeak(&v24, &from);
    objc_copyWeak(&v25, &location);
    id v23 = v4;
    uint64_t v12 = v15;
    v22 = v12;
    [(WLKWatchListModificationRequestOperation *)v12 setCompletionBlock:v21];
    uint64_t v16 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
    [v16 addOperation:v12];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke;
  block[3] = &unk_1E620A390;
  v29 = (WLKWatchListModificationRequestOperation *)v4;
  dispatch_async(v11, block);

  uint64_t v12 = v29;
LABEL_9:
}

void __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKAddFavoriteRequestErrorDomain" code:9056 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (v2)
  {
    uint64_t v3 = [WeakRetained response];
    id v4 = (void *)v2[7];
    v2[7] = v3;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [WeakRetained response];
    if (v5)
    {
      char v6 = (void *)v5;
      id v7 = [*(id *)(a1 + 32) error];

      uint64_t v8 = *(void *)(a1 + 40);
      if (!v7)
      {
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
    }
    v9 = [WeakRetained error];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
LABEL_9:
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)statsID
{
  return self->_statsID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (WLKWatchListModificationResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_statsID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_channelID, 0);
}

@end