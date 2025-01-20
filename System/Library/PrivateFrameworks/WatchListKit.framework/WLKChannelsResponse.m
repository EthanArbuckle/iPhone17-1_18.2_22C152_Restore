@interface WLKChannelsResponse
+ (id)parseChannelsFromPayload:(id)a3;
- (BOOL)filtered;
- (BOOL)isValidForFiltered:(BOOL)a3;
- (NSArray)orderedChannels;
- (NSDate)expirationDate;
- (NSDictionary)channels;
- (WLKChannelsResponse)initWithDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5 filtered:(BOOL)a6;
- (unint64_t)environmentHash;
- (void)modifyConsentStatusForChannelEntry:(id)a3 consented:(BOOL)a4;
- (void)setChannels:(id)a3;
- (void)setEnvironmentHash:(unint64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFiltered:(BOOL)a3;
- (void)setOrderedChannels:(id)a3;
@end

@implementation WLKChannelsResponse

- (WLKChannelsResponse)initWithDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5 filtered:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WLKChannelsResponse;
  v12 = [(WLKChannelsResponse *)&v29 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("WLKChannelsResponseModificationQueue", 0);
    modificationQueue = v12->_modificationQueue;
    v12->_modificationQueue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(v10, "wlk_dictionaryForKey:", @"channels");
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __82__WLKChannelsResponse_initWithDictionary_expirationDate_environmentHash_filtered___block_invoke;
    v26 = &unk_1E620C348;
    id v27 = v16;
    id v28 = v17;
    id v18 = v17;
    id v19 = v16;
    [v15 enumerateKeysAndObjectsUsingBlock:&v23];
    v20 = objc_msgSend(v19, "copy", v23, v24, v25, v26);
    [(WLKChannelsResponse *)v12 setOrderedChannels:v20];

    v21 = (void *)[v18 copy];
    [(WLKChannelsResponse *)v12 setChannels:v21];

    [(WLKChannelsResponse *)v12 setExpirationDate:v11];
    [(WLKChannelsResponse *)v12 setFiltered:v6];
    [(WLKChannelsResponse *)v12 setEnvironmentHash:a5];
  }
  return v12;
}

void __82__WLKChannelsResponse_initWithDictionary_expirationDate_environmentHash_filtered___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8 = [[WLKChannelDetails alloc] initWithDictionary:v4];

  v5 = [(WLKChannelDetails *)v8 channelID];

  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v8];
    BOOL v6 = *(void **)(a1 + 40);
    v7 = [(WLKChannelDetails *)v8 channelID];
    [v6 setObject:v8 forKey:v7];
  }
}

- (void)setChannels:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WLKChannelsResponse_setChannels___block_invoke;
  block[3] = &unk_1E620C370;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(modificationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__WLKChannelsResponse_setChannels___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 3, *(id *)(a1 + 32));
    WeakRetained = v3;
  }
}

- (NSDictionary)channels
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  dispatch_queue_t v13 = __Block_byref_object_dispose__10;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__WLKChannelsResponse_channels__block_invoke;
  v6[3] = &unk_1E620C398;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v6[5] = &v9;
  dispatch_sync(modificationQueue, v6);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v4;
}

void __31__WLKChannelsResponse_channels__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id WeakRetained = v6;
  }
}

- (void)setOrderedChannels:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WLKChannelsResponse_setOrderedChannels___block_invoke;
  block[3] = &unk_1E620C370;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(modificationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __42__WLKChannelsResponse_setOrderedChannels___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    id WeakRetained = v3;
  }
}

- (NSArray)orderedChannels
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  dispatch_queue_t v13 = __Block_byref_object_dispose__10;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__WLKChannelsResponse_orderedChannels__block_invoke;
  block[3] = &unk_1E620C3C0;
  objc_copyWeak(&v7, &location);
  void block[4] = &v9;
  dispatch_sync(modificationQueue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

void __38__WLKChannelsResponse_orderedChannels__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[2] copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id WeakRetained = v6;
  }
}

- (void)modifyConsentStatusForChannelEntry:(id)a3 consented:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__WLKChannelsResponse_modifyConsentStatusForChannelEntry_consented___block_invoke;
  v9[3] = &unk_1E620C3E8;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(modificationQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __68__WLKChannelsResponse_modifyConsentStatusForChannelEntry_consented___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    uint64_t v3 = [WeakRetained[3] objectForKey:*(void *)(a1 + 32)];
    uint64_t v4 = v3;
    if (v3) {
      [v3 setConsented:*(unsigned __int8 *)(a1 + 48)];
    }

    id WeakRetained = v5;
  }
}

- (BOOL)isValidForFiltered:(BOOL)a3
{
  int v3 = a3;
  int filtered = self->_filtered;
  id v6 = [(WLKChannelsResponse *)self channels];

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    [(NSDate *)expirationDate timeIntervalSinceNow];
    BOOL v9 = v8 > -5.0;
  }
  else
  {
    BOOL v9 = 0;
  }
  unint64_t environmentHash = self->_environmentHash;
  id v11 = +[WLKUserEnvironment currentEnvironment];
  uint64_t v12 = [v11 hash];

  BOOL result = 0;
  if (filtered == v3 && v6) {
    return environmentHash == v12 && v9;
  }
  return result;
}

+ (id)parseChannelsFromPayload:(id)a3
{
  int v3 = objc_msgSend(a3, "wlk_arrayForKey:", @"channels");
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__WLKChannelsResponse_parseChannelsFromPayload___block_invoke;
  v8[3] = &unk_1E620B378;
  id v5 = v4;
  id v9 = v5;
  [v3 enumerateObjectsUsingBlock:v8];
  if ([v5 count]) {
    id v6 = (void *)[v5 copy];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

void __48__WLKChannelsResponse_parseChannelsFromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[WLKChannelDetails alloc] initWithDictionary:v3];

  uint64_t v4 = [(WLKChannelDetails *)v5 channelID];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_int filtered = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (void)setEnvironmentHash:(unint64_t)a3
{
  self->_unint64_t environmentHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_orderedChannels, 0);

  objc_storeStrong((id *)&self->_modificationQueue, 0);
}

@end