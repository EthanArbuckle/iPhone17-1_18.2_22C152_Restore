@interface SSNetworkConstraints
+ (BOOL)supportsSecureCoding;
+ (id)_newLegacyNetworkConstraintsWithDictionary:(id)a3;
+ (id)_newModernNetworkConstraintsWithArray:(id)a3;
+ (id)networkConstraintsForDownloadKind:(id)a3 fromBag:(id)a4;
+ (id)newNetworkConstraintsByDownloadKindFromURLBag:(id)a3;
+ (void)_addNetworkConstraintsToDictionary:(id)a3 forNetworkType:(int64_t)a4 legacyDictionary:(id)a5;
- (BOOL)hasSizeLimitForNetworkType:(int64_t)a3;
- (BOOL)isAnyNetworkTypeEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SSNetworkConstraints)init;
- (SSNetworkConstraints)initWithCoder:(id)a3;
- (SSNetworkConstraints)initWithXPCEncoding:(id)a3;
- (id)_copySizeLimits;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)_sizeLimitForNetworkType:(int64_t)a3;
- (int64_t)sizeLimitForNetworkType:(int64_t)a3;
- (void)_disableAllNetworkTypes;
- (void)_setSizeLimit:(int64_t)a3 forNetworkType:(int64_t)a4;
- (void)dealloc;
- (void)disableCellularNetworkTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setAllNetworkTypesDisabled;
- (void)setSizeLimit:(int64_t)a3 forNetworkType:(int64_t)a4;
- (void)setSizeLimitsWithStoreConstraintDictionary:(id)a3;
@end

@implementation SSNetworkConstraints

- (SSNetworkConstraints)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSNetworkConstraints;
  v2 = [(SSNetworkConstraints *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSNetworkConstraints", 0);
    [(SSNetworkConstraints *)v2 _setSizeLimit:-1 forNetworkType:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)SSNetworkConstraints;
  [(SSNetworkConstraints *)&v4 dealloc];
}

- (void)disableCellularNetworkTypes
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSNetworkConstraints_disableCellularNetworkTypes__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __51__SSNetworkConstraints_disableCellularNetworkTypes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _sizeLimitForNetworkType:1000];
  [*(id *)(a1 + 32) _disableAllNetworkTypes];
  v3 = *(void **)(a1 + 32);
  return [v3 _setSizeLimit:v2 forNetworkType:1000];
}

- (BOOL)hasSizeLimitForNetworkType:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSNetworkConstraints_hasSizeLimitForNetworkType___block_invoke;
  block[3] = &unk_1E5BA76D8;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__SSNetworkConstraints_hasSizeLimitForNetworkType___block_invoke(void *a1)
{
  id v2 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", a1[6]);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 16) objectForKey:v2] != 0;
}

- (BOOL)isAnyNetworkTypeEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSNetworkConstraints_isAnyNetworkTypeEnabled__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSNetworkConstraints_isAnyNetworkTypeEnabled__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    char v3 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (!result) {
      return result;
    }
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
LABEL_4:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", *(void *)(*((void *)&v7 + 1) + 8 * v6)), "longLongValue");
      if ((result & 0x8000000000000000) == 0) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v4 = result;
        if (result) {
          goto LABEL_4;
        }
        return result;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)setAllNetworkTypesDisabled
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSNetworkConstraints_setAllNetworkTypesDisabled__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __50__SSNetworkConstraints_setAllNetworkTypesDisabled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableAllNetworkTypes];
}

- (void)setSizeLimit:(int64_t)a3 forNetworkType:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SSNetworkConstraints_setSizeLimit_forNetworkType___block_invoke;
  block[3] = &unk_1E5BAA0D0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __52__SSNetworkConstraints_setSizeLimit_forNetworkType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSizeLimit:*(void *)(a1 + 40) forNetworkType:*(void *)(a1 + 48)];
}

- (int64_t)sizeLimitForNetworkType:(int64_t)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSNetworkConstraints_sizeLimitForNetworkType___block_invoke;
  block[3] = &unk_1E5BA76D8;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__SSNetworkConstraints_sizeLimitForNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _sizeLimitForNetworkType:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__20;
  uint64_t v10 = __Block_byref_object_dispose__20;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSNetworkConstraints_description__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __35__SSNetworkConstraints_description__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@: %@", SSGetStringForNetworkType(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue")), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i))];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  if ([v2 count])
  {
    id v9 = [NSString alloc];
    v11.receiver = *(id *)(a1 + 32);
    v11.super_class = (Class)SSNetworkConstraints;
    id v10 = (id)[v9 initWithFormat:@"%@: %@", objc_msgSendSuper2(&v11, sel_description), objc_msgSend(v2, "componentsJoinedByString:", @", ")];
  }
  else
  {
    v12.receiver = *(id *)(a1 + 32);
    v12.super_class = (Class)SSNetworkConstraints;
    id v10 = objc_msgSendSuper2(&v12, sel_description);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v6 = (void *)[a3 _copySizeLimits];
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__SSNetworkConstraints_isEqual___block_invoke;
    block[3] = &unk_1E5BA8F70;
    void block[5] = v6;
    block[6] = &v11;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __32__SSNetworkConstraints_isEqual___block_invoke(void *a1)
{
  id v2 = (void *)a1[5];
  char v3 = *(void **)(a1[4] + 16);
  if (v3 == v2) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = objc_msgSend(v3, "isEqualToDictionary:");
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

+ (id)networkConstraintsForDownloadKind:(id)a3 fromBag:(id)a4
{
  uint64_t v5 = objc_msgSend(a1, "_newModernNetworkConstraintsWithArray:", objc_msgSend(a4, "arrayForKey:error:", @"mobile-network-constraints", 0));
  id v6 = (id)[v5 objectForKeyedSubscript:a3];

  return v6;
}

+ (id)newNetworkConstraintsByDownloadKindFromURLBag:(id)a3
{
  uint64_t v5 = [a3 objectForKey:@"mobile-network-constraints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return (id)[a1 _newModernNetworkConstraintsWithArray:v5];
  }
  else
  {
    uint64_t v7 = [a3 objectForKey:@"mobile-connection-type-allows"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return (id)[a1 _newLegacyNetworkConstraintsWithDictionary:v7];
    }
    else
    {
      return 0;
    }
  }
}

- (void)setSizeLimitsWithStoreConstraintDictionary:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SSNetworkConstraints_setSizeLimitsWithStoreConstraintDictionary___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __67__SSNetworkConstraints_setSizeLimitsWithStoreConstraintDictionary___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        char v8 = (void *)[*(id *)(a1 + 32) objectForKey:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
          objc_msgSend(*(id *)(a1 + 40), "_setSizeLimit:forNetworkType:", objc_msgSend(v8, "longLongValue"), SSGetNetworkTypeForString(v7));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

+ (void)_addNetworkConstraintsToDictionary:(id)a3 forNetworkType:(int64_t)a4 legacyDictionary:(id)a5
{
  uint64_t v8 = 0;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v15 = @"book";
  long long v16 = @"p2-music-store-available";
  v17 = @"music-download-size-limit-in-bytes";
  uint64_t v18 = @"coached-audio";
  v19 = @"p2-music-store-available";
  v20 = @"music-download-size-limit-in-bytes";
  v21 = @"ebook";
  v22 = @"eBook-store-available";
  v23 = @"eBook-download-size-limit-in-bytes";
  v24 = @"feature-movie";
  v25 = @"p2-music-store-available";
  v26 = @"video-download-size-limit-in-bytes";
  v27 = @"song";
  v28 = @"p2-music-store-available";
  v29 = @"music-download-size-limit-in-bytes";
  v30 = @"music-video";
  v31 = @"p2-music-store-available";
  v32 = @"music-download-size-limit-in-bytes";
  v33 = @"podcast";
  v34 = @"p2-podcasts-enabled";
  v35 = @"podcast-download-size-limit-in-bytes";
  v36 = @"ringtone";
  v39 = @"software";
  v40 = @"p2-software-store-available";
  v37 = @"p2-music-store-available";
  v38 = @"music-download-size-limit-in-bytes";
  v41 = @"software-download-size-limit-in-bytes";
  v42 = @"tv-episode";
  v43 = @"p2-music-store-available";
  v44 = @"video-download-size-limit-in-bytes";
  v45 = @"tone";
  v46 = @"p2-music-store-available";
  v47 = @"music-download-size-limit-in-bytes";
  v48 = @"videoPodcast";
  v49 = @"p2-podcasts-enabled";
  v50 = @"podcast-download-size-limit-in-bytes";
  do
  {
    long long v9 = objc_msgSend(a5, "objectForKey:", *(__CFString **)((char *)&v15 + v8 + 8), v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
                   v31,
                   v32,
                   v33,
                   v34,
                   v35,
                   v36,
                   v37,
                   v38,
                   v39,
                   v40,
                   v41,
                   v42,
                   v43,
                   v44,
                   v45,
                   v46,
                   v47,
                   v48,
                   v49,
                   v50,
                   v51);
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 BOOLValue])
    {
      long long v10 = (void *)[a5 objectForKey:*(__CFString **)((char *)&v17 + v8)];
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = [v10 longLongValue];
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = -1;
    }
    uint64_t v12 = *(uint64_t *)((char *)&v15 + v8);
    uint64_t v13 = (SSNetworkConstraints *)[a3 objectForKey:v12];
    if (!v13)
    {
      uint64_t v13 = objc_alloc_init(SSNetworkConstraints);
      [a3 setObject:v13 forKey:v12];
      uint64_t v14 = v13;
    }
    [(SSNetworkConstraints *)v13 setSizeLimit:v11 forNetworkType:a4];
    v8 += 24;
  }
  while (v8 != 288);
}

+ (id)_newLegacyNetworkConstraintsWithDictionary:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(a1, "_addNetworkConstraintsToDictionary:forNetworkType:legacyDictionary:", v5, 1, objc_msgSend(a3, "objectForKey:", @"2G"));
  objc_msgSend(a1, "_addNetworkConstraintsToDictionary:forNetworkType:legacyDictionary:", v5, 2, objc_msgSend(a3, "objectForKey:", @"3G"));
  objc_msgSend(a1, "_addNetworkConstraintsToDictionary:forNetworkType:legacyDictionary:", v5, 1000, objc_msgSend(a3, "objectForKey:", @"WiFi"));
  return v5;
}

+ (id)_newModernNetworkConstraintsWithArray:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    id v23 = a3;
    do
    {
      uint64_t v8 = 0;
      v22 = sel_BOOLValue;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(a3);
        }
        long long v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v10 = (void *)[v9 objectForKey:@"kinds"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v10 count])
            {
              uint64_t v11 = [v9 objectForKey:@"enabled"];
              if (!v11
                || (uint64_t v12 = (void *)v11, (objc_opt_respondsToSelector() & 1) != 0)
                && ([v12 BOOLValue] & 1) != 0)
              {
                uint64_t v13 = objc_msgSend(v9, "objectForKey:", @"size-limits", v22);
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                long long v15 = objc_alloc_init(SSNetworkConstraints);
                long long v16 = v15;
                if (isKindOfClass) {
                  [(SSNetworkConstraints *)v15 setSizeLimitsWithStoreConstraintDictionary:v13];
                }
              }
              else
              {
                long long v16 = objc_alloc_init(SSNetworkConstraints);
                [(SSNetworkConstraints *)v16 setAllNetworkTypesDisabled];
              }
              long long v26 = 0u;
              long long v27 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              uint64_t v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16, v22);
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v25;
                do
                {
                  uint64_t v20 = 0;
                  do
                  {
                    if (*(void *)v25 != v19) {
                      objc_enumerationMutation(v10);
                    }
                    [v4 setObject:v16 forKey:*(void *)(*((void *)&v24 + 1) + 8 * v20++)];
                  }
                  while (v18 != v20);
                  uint64_t v18 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
                }
                while (v18);
              }

              a3 = v23;
            }
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)_copySizeLimits
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__20;
  long long v10 = __Block_byref_object_dispose__20;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSNetworkConstraints__copySizeLimits__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSNetworkConstraints__copySizeLimits__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_disableAllNetworkTypes
{
  if (!self->_sizeLimits) {
    self->_sizeLimits = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  char v3 = (void *)[objc_alloc(NSNumber) initWithInteger:-1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSNetworkConstraints__disableAllNetworkTypes__block_invoke;
  v4[3] = &unk_1E5BAA0F8;
  v4[4] = self;
  v4[5] = v3;
  SSNetworkTypeApplyBlock((uint64_t)v4);
}

void __47__SSNetworkConstraints__disableAllNetworkTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", a2);
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKey:v3];
}

- (void)_setSizeLimit:(int64_t)a3 forNetworkType:(int64_t)a4
{
  id v8 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", a4);
  uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithLongLong:a3];
  sizeLimits = self->_sizeLimits;
  if (!sizeLimits)
  {
    sizeLimits = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_sizeLimits = sizeLimits;
  }
  [(NSMutableDictionary *)sizeLimits setObject:v6 forKey:v8];
}

- (int64_t)_sizeLimitForNetworkType:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", a3);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_sizeLimits objectForKey:v5];
  if (v6)
  {
LABEL_2:
    int64_t v7 = [v6 longLongValue];
  }
  else
  {
    if (SSNetworkTypeIsCellularType(v3))
    {
      while (v3 >= 2)
      {
        id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", --v3);
        uint64_t v6 = (void *)[(NSMutableDictionary *)self->_sizeLimits objectForKey:v8];

        if (v6) {
          goto LABEL_2;
        }
      }
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (SSNetworkConstraints)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [(SSNetworkConstraints *)self init];
    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0), @"0");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        v5->_sizeLimits = (NSMutableDictionary *)[v12 mutableCopy];
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SSNetworkConstraints_encodeWithCoder___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __40__SSNetworkConstraints_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"0"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSNetworkConstraints_copyWithZone___block_invoke;
  block[3] = &unk_1E5BAA120;
  block[4] = v5;
  void block[5] = self;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  return v5;
}

uint64_t __37__SSNetworkConstraints_copyWithZone___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[5] + 16) copyWithZone:a1[6]];
  *(void *)(a1[4] + 16) = result;
  return result;
}

- (SSNetworkConstraints)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = [(SSNetworkConstraints *)self init];
    if (!v5) {
      return v5;
    }
    objc_opt_class();
    self = (SSNetworkConstraints *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");

    v5->_sizeLimits = (NSMutableDictionary *)[(SSNetworkConstraints *)self mutableCopy];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SSNetworkConstraints_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __39__SSNetworkConstraints_copyXPCEncoding__block_invoke(uint64_t a1)
{
}

@end