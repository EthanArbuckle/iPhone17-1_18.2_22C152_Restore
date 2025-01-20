@interface WLKContinuationMetadataBase
+ (int64_t)_contextForString:(id)a3;
+ (void)add:(id)a3 toCollection:(id)a4;
+ (void)remove:(id)a3 fromCollection:(id)a4;
- (BOOL)isPurchase;
- (BOOL)isRental;
- (NSDate)timestamp;
- (NSDictionary)dictionary;
- (NSString)context;
- (NSString)localizedContext;
- (NSURL)contentTVAppDeeplinkURL;
- (WLKBasicContentMetadata)movieOrShowContent;
- (WLKContinuationMetadataBase)init;
- (WLKContinuationMetadataBase)initWithDictionary:(id)a3 context:(id)a4;
- (id)_mergingIdentifier;
- (id)description;
- (int64_t)contextEnum;
- (void)setIsRental:(BOOL)a3;
@end

@implementation WLKContinuationMetadataBase

- (id)_mergingIdentifier
{
  v3 = [(WLKContinuationMetadataBase *)self movieOrShowContent];
  v4 = [v3 canonicalID];

  v5 = [(WLKContinuationMetadataBase *)self movieOrShowContent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(WLKContinuationMetadataBase *)self movieOrShowContent];
    uint64_t v8 = [v7 canonicalShowID];

    v4 = (void *)v8;
  }

  return v4;
}

+ (void)add:(id)a3 toCollection:(id)a4
{
  *(void *)&v25[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 _mergingIdentifier];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__WLKContinuationMetadataBase_Merging__add_toCollection___block_invoke;
  v22[3] = &unk_1E6209F40;
  id v8 = v7;
  id v23 = v8;
  v9 = [v6 indexesOfObjectsPassingTest:v22];
  if ([v9 count])
  {
    unint64_t v10 = [v9 firstIndex];
    if (v10 < [v6 count])
    {
      v11 = [v6 objectAtIndex:v10];
      v12 = [v5 timestamp];
      v13 = [v11 timestamp];
      uint64_t v14 = [v12 compare:v13];

      if (v14 == 1)
      {
        int v15 = [v5 isRental];
        if (v15 != [v11 isRental])
        {
          v16 = WLKSystemLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = [v5 isRental];
            int v18 = [v11 isRental];
            *(_DWORD *)buf = 67109376;
            v25[0] = v17;
            LOWORD(v25[1]) = 1024;
            *(_DWORD *)((char *)&v25[1] + 2) = v18;
            _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Mismatch in continuation.isRental=%d and existingContinuation.isRental=%d", buf, 0xEu);
          }

          objc_msgSend(v5, "setIsRental:", objc_msgSend(v11, "isRental"));
        }
        [v6 replaceObjectAtIndex:v10 withObject:v5];
        v19 = WLKSystemLogObject();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v25 = v8;
        v20 = "WLKContinuationMetadata (Merging/Delta) - Replacing existing item with delta. Newer timestamp. %@";
      }
      else
      {
        v19 = WLKSystemLogObject();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v25 = v8;
        v20 = "WLKContinuationMetadata (Merging/Delta) - Skipping addition for existing item, timestamp is not newer %@.";
      }
      _os_log_impl(&dword_1BA2E8000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      goto LABEL_16;
    }
  }
  else
  {
    v21 = WLKSystemLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v25 = v8;
      _os_log_impl(&dword_1BA2E8000, v21, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Adding continuation %@", buf, 0xCu);
    }

    [v6 addObject:v5];
  }
LABEL_17:
}

uint64_t __57__WLKContinuationMetadataBase_Merging__add_toCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 _mergingIdentifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];
  if (v7) {
    *a4 = 1;
  }

  return v7;
}

+ (void)remove:(id)a3 fromCollection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 _mergingIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__WLKContinuationMetadataBase_Merging__remove_fromCollection___block_invoke;
  v12[3] = &unk_1E6209F40;
  id v7 = v6;
  id v13 = v7;
  id v8 = [v5 indexesOfObjectsPassingTest:v12];
  uint64_t v9 = [v8 count];
  unint64_t v10 = WLKSystemLogObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Removing existing item: %@", buf, 0xCu);
    }

    [v5 removeObjectsAtIndexes:v8];
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Skipping removal for non-matching-item: %@", buf, 0xCu);
    }
  }
}

uint64_t __62__WLKContinuationMetadataBase_Merging__remove_fromCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 _mergingIdentifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (WLKContinuationMetadataBase)initWithDictionary:(id)a3 context:(id)a4
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WLKContinuationMetadataBase;
  id v6 = [(WLKContinuationMetadataBase *)&v23 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

    objc_msgSend(v5, "wlk_dictionaryForKey:", @"content");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 || (id v9 = v5) != 0)
    {
      unint64_t v10 = [[WLKBasicContentMetadata alloc] initWithDictionary:v9];
      movieOrShowContent = v6->_movieOrShowContent;
      v6->_movieOrShowContent = v10;

      v12 = (void *)MEMORY[0x1E4F1CB10];
      id v13 = objc_msgSend(v9, "wlk_stringForKey:", @"url");
      uint64_t v14 = [v12 URLWithString:v13];
      contentTVAppDeeplinkURL = v6->_contentTVAppDeeplinkURL;
      v6->_contentTVAppDeeplinkURL = (NSURL *)v14;
    }
    uint64_t v16 = objc_msgSend(v5, "wlk_stringForKey:", @"context");
    context = v6->_context;
    v6->_context = (NSString *)v16;

    v6->_contextEnum = [(id)objc_opt_class() _contextForString:v6->_context];
    uint64_t v18 = objc_msgSend(v5, "wlk_stringForKey:", @"localizedContext");
    localizedContext = v6->_localizedContext;
    v6->_localizedContext = (NSString *)v18;

    v6->_isRental = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", @"isRental", 0);
    v6->_isPurchase = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", @"isPurchase", 0);
    uint64_t v20 = objc_msgSend(v5, "wlk_dateFromMillisecondsSince1970ForKey:", @"timestamp");
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v20;
  }
  return v6;
}

- (WLKContinuationMetadataBase)init
{
  return [(WLKContinuationMetadataBase *)self initWithDictionary:0 context:0];
}

+ (int64_t)_contextForString:(id)a3
{
  id v3 = a3;
  if (_contextForString__onceToken != -1) {
    dispatch_once(&_contextForString__onceToken, &__block_literal_global_4);
  }
  v4 = [(id)_contextForString___sContextLookup objectForKey:v3];
  id v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

void __49__WLKContinuationMetadataBase__contextForString___block_invoke()
{
  v0 = (void *)_contextForString___sContextLookup;
  _contextForString___sContextLookup = (uint64_t)&unk_1F13D99B8;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WLKContinuationMetadataBase;
  v4 = [(WLKContinuationMetadataBase *)&v8 description];
  id v5 = [(WLKContinuationMetadataBase *)self movieOrShowContent];
  int64_t v6 = [v3 stringWithFormat:@"%@ content:%@", v4, v5];

  return v6;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (WLKBasicContentMetadata)movieOrShowContent
{
  return self->_movieOrShowContent;
}

- (NSURL)contentTVAppDeeplinkURL
{
  return self->_contentTVAppDeeplinkURL;
}

- (int64_t)contextEnum
{
  return self->_contextEnum;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)localizedContext
{
  return self->_localizedContext;
}

- (BOOL)isRental
{
  return self->_isRental;
}

- (void)setIsRental:(BOOL)a3
{
  self->_isRental = a3;
}

- (BOOL)isPurchase
{
  return self->_isPurchase;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_localizedContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentTVAppDeeplinkURL, 0);
  objc_storeStrong((id *)&self->_movieOrShowContent, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end