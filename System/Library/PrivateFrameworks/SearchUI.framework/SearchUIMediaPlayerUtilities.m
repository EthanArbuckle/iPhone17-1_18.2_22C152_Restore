@interface SearchUIMediaPlayerUtilities
+ (id)filterPropertyForMPMediaEntityType:(int64_t)a3;
+ (int64_t)MPMediaEntityTypeForSFMediaEntityType:(int)a3;
+ (int64_t)MPMediaGroupingForMPMediaEntityType:(int64_t)a3;
+ (void)fetchVideoPunchoutForActionItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUIMediaPlayerUtilities

+ (int64_t)MPMediaEntityTypeForSFMediaEntityType:(int)a3
{
  if ((a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1E46B6890[a3 - 1];
  }
}

+ (int64_t)MPMediaGroupingForMPMediaEntityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1E46B68C0[a3 - 1];
  }
}

+ (id)filterPropertyForMPMediaEntityType:(int64_t)a3
{
  if (unint64_t)a3 <= 7 && ((0xBFu >> a3)) {
    a1 = **((id **)&unk_1E6E73D38 + a3);
  }
  return a1;
}

+ (void)fetchVideoPunchoutForActionItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke;
  v9[3] = &unk_1E6E73D18;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v9];
}

void __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (*(void *)(a1 + 32))
    {
      v46 = [*(id *)(a1 + 32) localMediaIdentifier];
      uint64_t v3 = [*(id *)(a1 + 32) storeIdentifiers];
      v4 = [*(id *)(a1 + 32) persistentID];
      uint64_t v5 = [v4 longLongValue];

      int64_t v44 = +[SearchUIMediaPlayerUtilities MPMediaEntityTypeForSFMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaEntityTypeForSFMediaEntityType:", [*(id *)(a1 + 32) mediaEntityType]);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v6 = v3;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        v9 = 0;
        uint64_t v10 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v55 != v10) {
              objc_enumerationMutation(v6);
            }
            v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v13 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
            v14 = objc_msgSend(v13, "itemWithStoreID:", objc_msgSend(v12, "longLongValue"));

            if (([v14 mediaType] & 0xFF00) != 0)
            {
              id v15 = v14;

              v9 = v15;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      if (v46 && !v9)
      {
        v17 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
        v18 = [v17 entityWithSpotlightIdentifier:v46];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
        }
        else
        {
          id v19 = [v18 representativeItem];
        }
        id v20 = v19;
        if (([v19 mediaType] & 0xFF00) != 0)
        {
          id v20 = v20;
          v9 = v20;
        }
        else
        {
          v9 = 0;
        }
      }
      if (v5 && !v9)
      {
        int64_t v21 = +[SearchUIMediaPlayerUtilities MPMediaGroupingForMPMediaEntityType:v44];
        uint64_t v22 = +[SearchUIMediaPlayerUtilities filterPropertyForMPMediaEntityType:v44];
        v23 = objc_opt_new();
        v24 = (void *)MEMORY[0x1E4F31968];
        v25 = [NSNumber numberWithLongLong:v5];
        v45 = (void *)v22;
        v26 = [v24 predicateWithValue:v25 forProperty:v22];

        [v23 setGroupingType:v21];
        [v23 addFilterPredicate:v26];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v27 = [v23 items];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          v9 = 0;
          uint64_t v30 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v51 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v50 + 1) + 8 * j);
              if (([v32 mediaType] & 0xFF00) != 0)
              {
                id v33 = v32;

                v9 = v33;
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v29);
        }
        else
        {
          v9 = 0;
        }
      }
      if (v9)
      {
        v34 = @"music";
        if (([v9 mediaType] & 0x800) == 0)
        {
          v35 = [v9 valueForProperty:*MEMORY[0x1E4F313E8]];
          int v36 = [v35 BOOLValue];
          v37 = @"videos";
          if (v36) {
            v37 = @"music";
          }
          v34 = v37;
        }
        v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", objc_msgSend(v9, "persistentID"));
        v39 = (void *)MEMORY[0x1E4F1CB10];
        v40 = [NSString stringWithFormat:@"%@://play/?pid=%@&allowCloudPlayback=1", v34, v38];
        v41 = [v39 URLWithString:v40];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke_2;
        block[3] = &unk_1E6E73D18;
        id v42 = *(id *)(a1 + 40);
        id v48 = v41;
        id v49 = v42;
        id v43 = v41;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      v16 = *(void (**)(void))(v2 + 16);
      v16();
    }
  }
}

void __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end