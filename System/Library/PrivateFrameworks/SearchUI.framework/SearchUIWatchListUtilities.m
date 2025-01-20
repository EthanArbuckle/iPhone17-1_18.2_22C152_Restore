@interface SearchUIWatchListUtilities
+ (BOOL)channelHasBeenSeen:(id)a3 seenChannels:(id)a4;
+ (id)buttonForChannelDetails:(id)a3 punchoutURLs:(id)a4 tvAppDeeplinkURL:(id)a5 isEntitled:(BOOL)a6 isContinuing:(BOOL)a7 isContainerItem:(BOOL)a8 hasDescriptiveSeasonTitle:(BOOL)a9 seasonNumber:(id)a10 episodeNumber:(id)a11 isHorizontallySrollingStyle:(BOOL)a12;
+ (id)buttonForChannelOffer:(id)a3 channel:(id)a4 episode:(id)a5;
+ (id)buttonForOffer:(id)a3 playable:(id)a4;
+ (id)buttonForPlayable:(id)a3 isHorizontallySrollingStyle:(BOOL)a4;
+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 punchoutURL:(id)a5 type:(unint64_t)a6 image:(id)a7 storeIdentifier:(id)a8;
+ (id)buttonsForPlayables:(id)a3 channels:(id)a4 currentEpisode:(id)a5 isUpNextable:(BOOL)a6 watchListState:(id)a7 isHorizontallySrollingStyle:(BOOL)a8;
+ (int)watchListTypeForType:(int)a3 isMediaContainer:(BOOL)a4;
+ (int64_t)wlkTypeForType:(int)a3;
+ (void)computeButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6;
+ (void)fetchButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6;
+ (void)fetchButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 fetchButtons:(BOOL)a6 completion:(id)a7;
+ (void)fetchWatchListStateForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5;
+ (void)generateMediaContainerWatchListReponseForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5;
+ (void)generateWatchListReponseForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5;
+ (void)updateStatusIsInWatchList:(BOOL)a3 watchListItemWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation SearchUIWatchListUtilities

+ (int64_t)wlkTypeForType:(int)a3
{
  if ((a3 - 1) > 4) {
    return 1;
  }
  else {
    return qword_1E46B6808[a3 - 1];
  }
}

+ (int)watchListTypeForType:(int)a3 isMediaContainer:(BOOL)a4
{
  if (a4) {
    int v4 = 3;
  }
  else {
    int v4 = 4;
  }
  if (a3) {
    return a3;
  }
  else {
    return v4;
  }
}

+ (void)generateWatchListReponseForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E4FB5068];
  id v10 = a3;
  v11 = (void *)[[v9 alloc] initWithCanonicalID:v10];

  [v11 setCaller:@"SearchUI"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__SearchUIWatchListUtilities_generateWatchListReponseForWatchListIdentifier_type_completion___block_invoke;
  v13[3] = &unk_1E6E732C0;
  id v14 = v8;
  id v12 = v8;
  objc_msgSend(v11, "makeRequestWithCompletion:canonicalType:", v13, objc_msgSend(a1, "wlkTypeForType:", v5));
}

uint64_t __93__SearchUIWatchListUtilities_generateWatchListReponseForWatchListIdentifier_type_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)generateMediaContainerWatchListReponseForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke;
  v12[3] = &unk_1E6E73360;
  id v14 = v9;
  id v15 = a1;
  int v16 = a4;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v12];
}

void __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB5060]) initWithCanonicalID:*(void *)(a1 + 32)];
  [v2 setCaller:@"SearchUI"];
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__1;
  v18[4] = __Block_byref_object_dispose__1;
  id v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_104;
  v14[3] = &unk_1E6E732E8;
  int v16 = v20;
  v17 = v18;
  int v4 = v3;
  id v15 = v4;
  objc_msgSend(v2, "makeRequestWithCompletion:canonicalType:", v14, objc_msgSend(*(id *)(a1 + 48), "wlkTypeForType:", *(unsigned int *)(a1 + 56)));
  os_unfair_lock_lock(&sSeasonTitleLock);
  char v5 = sSeasonTitlesFlagCached;
  os_unfair_lock_unlock(&sSeasonTitleLock);
  if ((v5 & 1) == 0)
  {
    dispatch_group_enter(v4);
    v6 = (void *)MEMORY[0x1E4FB5070];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_2;
    v12[3] = &unk_1E6E73310;
    id v13 = v4;
    objc_msgSend(v6, "sui_fetchSeasonTitlesSettingWithCompletionHandler:", v12);
  }
  v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_3;
  block[3] = &unk_1E6E73338;
  id v9 = *(id *)(a1 + 40);
  id v10 = v20;
  id v11 = v18;
  dispatch_group_notify(v4, v7, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

void __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_2(uint64_t a1, char a2)
{
  os_unfair_lock_lock(&sSeasonTitleLock);
  sSeasonTitlesEnabled = a2;
  sSeasonTitlesFlagCached = 1;
  os_unfair_lock_unlock(&sSeasonTitleLock);
  int v4 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v4);
}

uint64_t __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

+ (void)fetchWatchListStateForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__SearchUIWatchListUtilities_fetchWatchListStateForWatchListIdentifier_type_completion___block_invoke;
  v10[3] = &unk_1E6E73388;
  id v11 = v8;
  id v9 = v8;
  [a1 fetchButtonsForWatchListIdentifier:a3 type:v5 isHorizontallySrollingStyle:1 fetchButtons:0 completion:v10];
}

uint64_t __88__SearchUIWatchListUtilities_fetchWatchListStateForWatchListIdentifier_type_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fetchButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__SearchUIWatchListUtilities_fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke;
  v12[3] = &unk_1E6E73388;
  id v13 = v10;
  id v11 = v10;
  [a1 fetchButtonsForWatchListIdentifier:a3 type:v7 isHorizontallySrollingStyle:v6 fetchButtons:1 completion:v12];
}

uint64_t __109__SearchUIWatchListUtilities_fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fetchButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 fetchButtons:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v10 = fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__onceToken;
  id v11 = a7;
  id v12 = a3;
  id v14 = v12;
  if (v10 == -1)
  {
    id v13 = v12;
  }
  else
  {
    dispatch_once(&fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__onceToken, &__block_literal_global_17);
    id v13 = v14;
  }
  [(id)fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__cache getButtonsForWatchListIdentifier:v13 type:v8 isHorizontallySrollingStyle:v7 completion:v11];
}

uint64_t __122__SearchUIWatchListUtilities_fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__cache;
  fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__cache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)computeButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = v11;
  if (v10)
  {
    id v13 = objc_opt_class();
    if ((v8 & 0xFFFFFFFE) == 2)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke;
      v19[3] = &unk_1E6E733B0;
      id v21 = a1;
      BOOL v22 = a5;
      id v20 = v12;
      [v13 generateMediaContainerWatchListReponseForWatchListIdentifier:v10 type:v8 completion:v19];
      id v14 = v20;
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke_2;
      v15[3] = &unk_1E6E733D8;
      id v17 = a1;
      BOOL v18 = a5;
      id v16 = v12;
      [v13 generateWatchListReponseForWatchListIdentifier:v10 type:v8 completion:v15];
      id v14 = v16;
    }
  }
  else
  {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);
  }
}

void __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v11 isWatchListable]) {
    BOOL v6 = [[SearchUIWatchListState alloc] initWithContainerResponse:v11];
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v11 channels];
  id v9 = [v11 currentEpisode];
  id v10 = objc_msgSend(v7, "buttonsForPlayables:channels:currentEpisode:isUpNextable:watchListState:isHorizontallySrollingStyle:", 0, v8, v9, objc_msgSend(v11, "isWatchListable"), v6, *(unsigned __int8 *)(a1 + 48));

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 isWatchListable]) {
    BOOL v6 = [[SearchUIWatchListState alloc] initWithResponse:v10];
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v10 playables];
  id v9 = objc_msgSend(v7, "buttonsForPlayables:channels:currentEpisode:isUpNextable:watchListState:isHorizontallySrollingStyle:", v8, 0, 0, objc_msgSend(v10, "isWatchListable"), v6, *(unsigned __int8 *)(a1 + 48));

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)buttonsForPlayables:(id)a3 channels:(id)a4 currentEpisode:(id)a5 isUpNextable:(BOOL)a6 watchListState:(id)a7 isHorizontallySrollingStyle:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v83 = a6;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v12 = a4;
  id v13 = a5;
  id v82 = a7;
  BOOL v89 = v8;
  uint64_t v14 = 4;
  if (v8) {
    uint64_t v14 = 0x7FFFFFFFLL;
  }
  uint64_t v80 = v14;
  id v90 = (id)objc_opt_new();
  v93 = objc_opt_new();
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v12;
  uint64_t v15 = [obj countByEnumeratingWithState:&v99 objects:v104 count:16];
  v86 = v13;
  if (!v15)
  {
    v92 = 0;
    goto LABEL_35;
  }
  uint64_t v16 = v15;
  v92 = 0;
  uint64_t v17 = *(void *)v100;
  uint64_t v84 = *MEMORY[0x1E4FB5288];
  uint64_t v85 = *(void *)v100;
  do
  {
    uint64_t v18 = 0;
    uint64_t v87 = v16;
    do
    {
      if (*(void *)v100 != v17) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v99 + 1) + 8 * v18);
      id v20 = [v19 details];
      if (v20 && ([a1 channelHasBeenSeen:v20 seenChannels:v93] & 1) == 0)
      {
        id v21 = [v13 playable];
        BOOL v22 = [v19 punchoutUrls];
        v23 = [v20 channelID];
        v24 = [v21 channelID];
        if ([v23 isEqual:v24])
        {
          v25 = [v19 seasonNumbers];
          v26 = [v13 seasonNumber];
          int v27 = [v25 containsObject:v26];

          if (v27)
          {
            id v28 = [v21 punchoutUrls];
            if (v28)
            {
              id v13 = v86;
              v29 = [v86 seasonNumber];
              v30 = [v86 episodeNumber];
              id v28 = v28;
              v31 = v22;
              BOOL v22 = v28;
              goto LABEL_20;
            }
            v30 = 0;
            v29 = 0;
            id v13 = v86;
LABEL_21:

            goto LABEL_22;
          }
        }
        else
        {
        }
        if ([v20 isiTunes])
        {
          id v28 = (id)[v22 mutableCopy];
          id v13 = v86;
          v32 = [v86 tvAppDeeplinkURL];
          v31 = [v32 absoluteString];

          if (v31)
          {
            [v28 setObject:v31 forKey:v84];
            id v28 = v28;

            v30 = 0;
            v29 = 0;
            BOOL v22 = v28;
          }
          else
          {
            v30 = 0;
            v29 = 0;
          }
LABEL_20:

          goto LABEL_21;
        }
        v30 = 0;
        v29 = 0;
        id v13 = v86;
LABEL_22:
        v33 = [v19 subscriptionOffers];
        v34 = [v33 firstObject];

        if (!v34 || v92)
        {
          uint64_t v35 = [v20 isSubscribed];
          v36 = [v13 seasonTitle];
          LOBYTE(v79) = v89;
          LOBYTE(v78) = v36 != 0;
          v37 = [a1 buttonForChannelDetails:v20 punchoutURLs:v22 tvAppDeeplinkURL:0 isEntitled:v35 isContinuing:0 isContainerItem:1 hasDescriptiveSeasonTitle:v78 seasonNumber:v29 episodeNumber:v30 isHorizontallySrollingStyle:v79];

          if (v37) {
            [v90 addObject:v37];
          }
        }
        else
        {
          v92 = [a1 buttonForChannelOffer:v34 channel:v19 episode:v13];
        }

        uint64_t v17 = v85;
        uint64_t v16 = v87;
      }

      ++v18;
    }
    while (v16 != v18);
    uint64_t v38 = [obj countByEnumeratingWithState:&v99 objects:v104 count:16];
    uint64_t v16 = v38;
  }
  while (v38);
LABEL_35:

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v39 = v81;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (!v40)
  {

    v43 = 0;
    BOOL v56 = v92 != 0;
    unint64_t v57 = v80 - v83 - v56;
    goto LABEL_86;
  }
  uint64_t v41 = v40;
  unsigned __int8 v42 = 0;
  v43 = 0;
  uint64_t v44 = *(void *)v96;
  unint64_t v88 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      if (*(void *)v96 != v44) {
        objc_enumerationMutation(v39);
      }
      v46 = *(void **)(*((void *)&v95 + 1) + 8 * i);
      char v47 = [v46 isEntitled];
      v48 = [v46 channelDetails];
      char v49 = [a1 channelHasBeenSeen:v48 seenChannels:v93];

      if ((v49 & 1) == 0)
      {
        if ([v46 isiTunes])
        {
          id v50 = v46;

          unint64_t v88 = [v90 count];
          v43 = v50;
        }
        else if (v92 {
               || ([v46 bestStoreSubscriptionOffer],
        }
                   v52 = objc_claimAutoreleasedReturnValue(),
                   v52,
                   !v52))
        {
          v51 = [a1 buttonForPlayable:v46 isHorizontallySrollingStyle:v89];
          if (v51) {
            [v90 addObject:v51];
          }
        }
        else
        {
          v53 = [v46 bestStoreSubscriptionOffer];
          v92 = [a1 buttonForOffer:v53 playable:v46];
        }
      }
      v42 |= v47;
    }
    uint64_t v41 = [v39 countByEnumeratingWithState:&v95 objects:v103 count:16];
  }
  while (v41);

  v54 = v92;
  if ((v42 & (v92 != 0)) == 1)
  {

    v54 = 0;
  }
  id v13 = v86;
  v55 = v90;
  v92 = v54;
  BOOL v56 = v54 != 0;
  unint64_t v57 = v80 - v83 - v56;
  if (v43)
  {
    uint64_t v58 = [v90 count];
    if (v88 < v57 && (uint64_t)(v57 - v58) < 1) {
      uint64_t v60 = 1;
    }
    else {
      uint64_t v60 = v57 - v58;
    }
    if (v60 >= 1)
    {
      v61 = objc_opt_new();
      v62 = [v43 bestStoreRentalOffer];
      if (v62)
      {
        v63 = [v43 bestStoreBuyOffer];
        BOOL v65 = v60 == 1 && v63 != 0;
      }
      else
      {
        BOOL v65 = 0;
      }

      int v66 = [v43 isEntitled];
      if (v65 || v66)
      {
        v68 = [a1 buttonForPlayable:v43 isHorizontallySrollingStyle:v89];
        [v61 addObject:v68];
      }
      else
      {
        v67 = [v43 bestStoreRentalOffer];
        v68 = [a1 buttonForOffer:v67 playable:v43];

        if (v68) {
          [v61 addObject:v68];
        }
        v69 = [v43 bestStoreBuyOffer];
        v70 = [a1 buttonForOffer:v69 playable:v43];

        if (v70) {
          [v61 addObject:v70];
        }
        if (![v61 count])
        {
          v71 = [v43 storeOffers];
          v72 = [v71 lastObject];
          v73 = [a1 buttonForOffer:v72 playable:v43];

          if (v73) {
            [v61 addObject:v73];
          }

          id v13 = v86;
        }
      }
      if ([v61 count])
      {
        v74 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v88, objc_msgSend(v61, "count"));
        [v90 insertObjects:v61 atIndexes:v74];
      }
    }
LABEL_86:
    v55 = v90;
  }
  while ([v55 count] > v57)
    [v55 removeLastObject];
  if (v56) {
    [v90 addObject:v92];
  }
  if (v83)
  {
    v75 = objc_opt_new();
    [v75 setWatchListState:v82];
    [v75 setButtonType:3];
    [v90 addObject:v75];
  }
  id v76 = v90;

  return v76;
}

+ (BOOL)channelHasBeenSeen:(id)a3 seenChannels:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 channelID];
  char v7 = [v5 containsObject:v6];
  if ((v7 & 1) == 0) {
    [v5 addObject:v6];
  }

  return v7;
}

+ (id)buttonForPlayable:(id)a3 isHorizontallySrollingStyle:(BOOL)a4
{
  id v6 = a3;
  char v7 = [v6 channelDetails];
  BOOL v8 = [v6 punchoutUrls];
  id v9 = [v6 tvAppDeeplinkURL];
  uint64_t v10 = [v6 isEntitled];
  id v11 = [v6 playEvent];

  LOBYTE(v15) = a4;
  LOBYTE(v14) = 0;
  id v12 = [a1 buttonForChannelDetails:v7 punchoutURLs:v8 tvAppDeeplinkURL:v9 isEntitled:v10 isContinuing:v11 != 0 isContainerItem:0 hasDescriptiveSeasonTitle:v14 seasonNumber:0 episodeNumber:0 isHorizontallySrollingStyle:v15];

  return v12;
}

+ (id)buttonForChannelDetails:(id)a3 punchoutURLs:(id)a4 tvAppDeeplinkURL:(id)a5 isEntitled:(BOOL)a6 isContinuing:(BOOL)a7 isContainerItem:(BOOL)a8 hasDescriptiveSeasonTitle:(BOOL)a9 seasonNumber:(id)a10 episodeNumber:(id)a11 isHorizontallySrollingStyle:(BOOL)a12
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  id v17 = a3;
  id v18 = a4;
  unint64_t v19 = (unint64_t)a5;
  id v64 = a10;
  id v20 = a11;
  v61 = objc_msgSend(v17, "sui_channelName");
  id v63 = v20;
  if (([v17 isAppInstalled] & 1) == 0 && !objc_msgSend(v17, "isFirstParty"))
  {
    unint64_t v30 = v19;
    v31 = [v17 appStoreURL];

    if (!v31)
    {
      id v28 = 0;
      id v27 = 0;
      v36 = 0;
      v33 = 0;
      uint64_t v44 = 0;
      unint64_t v19 = v30;
      v29 = v61;
      v45 = v63;
      goto LABEL_45;
    }
    id v27 = +[SearchUIUtilities localizedStringForKey:@"INSTALL_BUTTON_TITLE"];
    id v28 = [v17 appStoreURL];
    v32 = [v17 appAdamIDs];
    v33 = [v32 firstObject];

    if (a12)
    {
      v34 = [SearchUIWatchListIconImage alloc];
      uint64_t v35 = [v17 images];
      v36 = [(SearchUIWatchListIconImage *)v34 initWithArtwork:v35];

      -[SearchUIWatchListIconImage setSize:](v36, "setSize:", 45.0, 45.0);
    }
    else
    {
      v36 = 0;
    }
    uint64_t v26 = 2;
    unint64_t v19 = v30;
    v29 = v61;
    v45 = v63;
    if (v28) {
      goto LABEL_44;
    }
LABEL_33:
    uint64_t v44 = 0;
    goto LABEL_45;
  }
  id v21 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4FB5290]];
  id v59 = v18;
  uint64_t v22 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4FB5288]];
  v23 = (void *)v22;
  if (v14 && v21)
  {
    BOOL v24 = !v20 || v64 == 0;
    if (!v24 || !v12)
    {
      id v28 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
      if (v12)
      {
        os_unfair_lock_lock(&sSeasonTitleLock);
        uint64_t v37 = sSeasonTitlesEnabled;
        os_unfair_lock_unlock(&sSeasonTitleLock);
        uint64_t v38 = objc_msgSend(v17, "sui_seasonEpisodeLabel:seasonTitleAvailable:seasonNumber:episodeNumber:", v37, a9, v64, v63);
        id v39 = (void *)v38;
        uint64_t v40 = NSString;
        if (a12)
        {
          uint64_t v41 = +[SearchUIUtilities localizedStringForKey:@"PLAY_EPISODE_FORMAT"];
          unsigned __int8 v42 = +[SearchUIUtilities localizedStringForKey:@"PLAY"];
          id v27 = [v40 stringWithValidatedFormat:v41, @"%@ %@", 0, v42, v39 validFormatSpecifiers error];

          v29 = v61;
        }
        else
        {
          uint64_t v41 = v61;
          [NSString stringWithFormat:@"%@\n%@", v38, v61];
          v29 = id v27 = 0;
        }
      }
      else
      {
        if (!v13)
        {
          if (a12)
          {
            id v27 = +[SearchUIUtilities localizedStringForKey:@"PLAY"];
          }
          else
          {
            id v27 = 0;
          }
          uint64_t v26 = 1;
          goto LABEL_15;
        }
        v46 = +[SearchUIUtilities localizedStringForKey:@"CONTINUE"];
        id v39 = v46;
        if (a12)
        {
          id v27 = v46;
          v29 = v61;
        }
        else
        {
          char v47 = NSString;
          v48 = +[SearchUIUtilities localizedStringForKey:@"CONTINUE_IN_FORMAT"];
          v29 = [v47 stringWithValidatedFormat:v48, @"%@ %@", 0, v39, v61 validFormatSpecifiers error];

          id v27 = 0;
        }
      }

      uint64_t v26 = 1;
      goto LABEL_40;
    }
  }
  if (!(v19 | v22))
  {
    uint64_t v26 = 0;
    id v27 = 0;
    id v28 = 0;
LABEL_15:
    v29 = v61;
    goto LABEL_40;
  }
  if (v19)
  {
    id v25 = (id)v19;
  }
  else
  {
    id v25 = [MEMORY[0x1E4F1CB10] URLWithString:v22];
  }
  id v28 = v25;
  v29 = v61;
  if ([v17 isApSubscription]) {
    v43 = @"SUBSCRIBE_BUTTON_TITLE";
  }
  else {
    v43 = @"OPEN_BUTTON_TITLE";
  }
  id v27 = +[SearchUIUtilities localizedStringForKey:v43];
  uint64_t v26 = 0;
LABEL_40:
  v36 = (SearchUIWatchListIconImage *)objc_opt_new();
  if ([v17 isFirstParty])
  {
    char v49 = +[SearchUIUtilities bundleIdentifierForApp:18];
    [(SearchUIWatchListIconImage *)v36 setBundleIdentifier:v49];
  }
  else
  {
    char v49 = [v17 appBundleIDs];
    [v49 firstObject];
    id v62 = v17;
    uint64_t v50 = v26;
    v51 = v28;
    id v52 = v27;
    v53 = v21;
    v54 = v23;
    v55 = v29;
    v57 = unint64_t v56 = v19;
    [(SearchUIWatchListIconImage *)v36 setBundleIdentifier:v57];

    unint64_t v19 = v56;
    v29 = v55;
    v23 = v54;
    id v21 = v53;
    id v27 = v52;
    id v28 = v51;
    uint64_t v26 = v50;
    id v17 = v62;
  }

  v33 = 0;
  id v18 = v59;
  v45 = v63;
  if (!v28) {
    goto LABEL_33;
  }
LABEL_44:
  uint64_t v44 = [a1 buttonWithTitle:v27 subtitle:v29 punchoutURL:v28 type:v26 image:v36 storeIdentifier:v33];
LABEL_45:

  return v44;
}

+ (id)buttonForOffer:(id)a3 playable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 channelDetails];
  int v9 = [v8 isFirstParty];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CB10];
  id v11 = [v7 punchoutUrls];
  BOOL v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4FB5288]];
  BOOL v13 = [v10 URLWithString:v12];

  BOOL v14 = [v7 channelDetails];
  uint64_t v15 = [v14 appBundleIDs];
  uint64_t v16 = [v15 firstObject];

  if (v13) {
    BOOL v17 = v9 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (!v17)
  {
    uint64_t v18 = +[SearchUIUtilities bundleIdentifierForApp:18];

    uint64_t v19 = [v7 tvAppDeeplinkURL];

    uint64_t v16 = (void *)v18;
    BOOL v13 = (void *)v19;
  }
  id v20 = 0;
  if (v6 && v13)
  {
    uint64_t v21 = objc_msgSend(v6, "sui_buttonTitle");
    uint64_t v22 = [v7 channelDetails];
    v23 = objc_msgSend(v22, "sui_channelName");
    BOOL v24 = objc_msgSend(v6, "sui_buttonSubtitleWithServiceName:", v23);

    if (v21)
    {
      id v25 = objc_opt_new();
      [v25 setBundleIdentifier:v16];
      id v20 = [a1 buttonWithTitle:v21 subtitle:v24 punchoutURL:v13 type:0 image:v25 storeIdentifier:0];

      BOOL v24 = (void *)v21;
    }
    else
    {
      id v20 = 0;
    }
  }
  return v20;
}

+ (id)buttonForChannelOffer:(id)a3 channel:(id)a4 episode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a5 tvAppDeeplinkURL];
  id v11 = (void *)v10;
  BOOL v12 = 0;
  if (v8 && v10)
  {
    uint64_t v13 = objc_msgSend(v8, "sui_buttonTitle");
    BOOL v14 = [v9 details];
    uint64_t v15 = objc_msgSend(v14, "sui_channelName");
    uint64_t v16 = objc_msgSend(v8, "sui_buttonSubtitleWithServiceName:", v15);

    if (v13)
    {
      BOOL v17 = objc_opt_new();
      uint64_t v18 = +[SearchUIUtilities bundleIdentifierForApp:18];
      [v17 setBundleIdentifier:v18];

      BOOL v12 = [a1 buttonWithTitle:v13 subtitle:v16 punchoutURL:v11 type:0 image:v17 storeIdentifier:0];

      uint64_t v16 = (void *)v13;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 punchoutURL:(id)a5 type:(unint64_t)a6 image:(id)a7 storeIdentifier:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = objc_opt_new();
  [v18 setTitle:v17];

  [v18 setSubtitle:v16];
  [v18 setPunchoutURL:v15];

  [v18 setButtonType:a6];
  [v18 setThumbnailImage:v14];

  [v18 setStoreIdentifier:v13];
  return v18;
}

+ (void)updateStatusIsInWatchList:(BOOL)a3 watchListItemWithIdentifier:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E6E73298;
  BOOL v17 = v6;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  id v11 = _Block_copy(aBlock);
  BOOL v12 = (Class *)0x1E4FB5040;
  if (!v6) {
    BOOL v12 = (Class *)0x1E4FB5140;
  }
  id v13 = (void *)[objc_alloc(*v12) initWithCanonicalID:v9];
  [v13 setCaller:@"SearchUI"];
  [v13 makeRequestWithCompletion:v11];
}

void __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v6 = SearchUITapLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    v3 = @"add";
  }
  else {
    v3 = @"remove";
  }
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Failed to %@ %@ to watchlist", (uint8_t *)&v4, 0x16u);
}

@end