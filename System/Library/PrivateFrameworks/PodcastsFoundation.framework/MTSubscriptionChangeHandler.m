@interface MTSubscriptionChangeHandler
- (MTLegacyDownloadManagerProtocol)downloadManager;
- (id)episodesWithEffect:(unint64_t)a3 fromEpisodeEffects:(id)a4;
- (unint64_t)_updateEntitledAttributes:(id)a3 subscriptionActive:(BOOL)a4 taskID:(id)a5;
- (void)_applyEffectsOffMoC:(id)a3 channel:(id)a4 taskID:(id)a5;
- (void)_unsafeApplyDownloadEffects:(id)a3 channel:(id)a4 taskID:(id)a5;
- (void)_unsafeSendNotificationsForNewlyEntitledEpisodes:(id)a3 latestEpisodeUUID:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 taskID:(id)a6;
- (void)_unsafeUpdateEntitlementStateAndCheckForNewEntitlement:(id)a3 newlyEntitledEpisodeUUIDs:(id)a4 latestEpisodeDate:(double *)a5 latestEpisodeUUID:(id)a6;
- (void)_unsafeUpdatePriceTypeAndSendNotificationsIfNeededFor:(id)a3 subscriptionActive:(BOOL)a4 episodeEffects:(id)a5 taskID:(id)a6;
- (void)setDownloadManager:(id)a3;
- (void)unsafeHandleSubscriptionChangeForChannel:(id)a3 subscriptionBecameActive:(BOOL)a4 subscriptionEnabledDate:(double)a5;
@end

@implementation MTSubscriptionChangeHandler

- (void)setDownloadManager:(id)a3
{
  self->_downloadManager = (MTLegacyDownloadManagerProtocol *)a3;
}

- (void)unsafeHandleSubscriptionChangeForChannel:(id)a3 subscriptionBecameActive:(BOOL)a4 subscriptionEnabledDate:(double)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [MEMORY[0x1E4F29128] UUID];
  v10 = [v9 UUIDString];

  v11 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = [v8 storeId];
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling subscription change for channel: %lld. Switching to active: %d", (uint8_t *)&v13, 0x1Cu);
  }

  [v8 setSubscriptionActive:v6];
  [v8 setSubscriptionEnabledDate:a5];
  v12 = objc_opt_new();
  [(MTSubscriptionChangeHandler *)self _unsafeUpdatePriceTypeAndSendNotificationsIfNeededFor:v8 subscriptionActive:v6 episodeEffects:v12 taskID:v10];
  [(MTSubscriptionChangeHandler *)self _unsafeApplyDownloadEffects:v12 channel:v8 taskID:v10];
}

- (void)_unsafeApplyDownloadEffects:(id)a3 channel:(id)a4 taskID:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = +[PFClientUtil supportsDownloads];
  v12 = _MTLogCategoryDownload();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      int v14 = 138543618;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1AC9D5000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Applying effects for subscription change: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    [(MTSubscriptionChangeHandler *)self _applyEffectsOffMoC:v8 channel:v9 taskID:v10];
  }
  else
  {
    if (v13)
    {
      int v14 = 138543362;
      id v15 = v10;
      _os_log_impl(&dword_1AC9D5000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Platform does not support downloads. Effects cannot be applied.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_applyEffectsOffMoC:(id)a3 channel:(id)a4 taskID:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(MTSubscriptionChangeHandler *)self downloadManager];

  if (v11)
  {
    v12 = [(MTSubscriptionChangeHandler *)self episodesWithEffect:2 fromEpisodeEffects:v8];
    BOOL v13 = objc_msgSend(v12, "mt_uniqued");

    int v14 = [(MTSubscriptionChangeHandler *)self episodesWithEffect:4 fromEpisodeEffects:v8];
    id v15 = objc_msgSend(v14, "mt_uniqued");

    if (([v15 isSubsetOfSet:v13] & 1) == 0)
    {
      __int16 v16 = _MTLogCategoryDownload();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC9D5000, v16, OS_LOG_TYPE_ERROR, "Potential API misuse while applying effect. Deleted episodes should be a strict superset of downloads - but an episode would be downloaded before deletion! This will be corrected, but may be a programming error elsewhere.", buf, 2u);
      }

      uint64_t v17 = [v13 setByAddingObjectsFromSet:v15];

      BOOL v13 = v17;
    }
    uint64_t v18 = [(MTSubscriptionChangeHandler *)self downloadManager];
    [v18 removeDownloadedEpisodes:v13];

    uint64_t v19 = _MTLogCategoryDownload();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v10;
      __int16 v26 = 2114;
      uint64_t v27 = (uint64_t)v13;
      _os_log_impl(&dword_1AC9D5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]Removed episodes from subscription status change: %{public}@", buf, 0x16u);
    }

    v20 = [(MTSubscriptionChangeHandler *)self downloadManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__MTSubscriptionChangeHandler__applyEffectsOffMoC_channel_taskID___block_invoke;
    v22[3] = &unk_1E5E61218;
    id v23 = v10;
    [v20 addEpisodeAutoDownloads:v15 completion:v22];

    goto LABEL_11;
  }
  BOOL v13 = _MTLogCategoryDownload();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = [v9 storeId];
    id v15 = [v9 name];
    *(_DWORD *)buf = 138543875;
    id v25 = v10;
    __int16 v26 = 2049;
    uint64_t v27 = v21;
    __int16 v28 = 2113;
    v29 = v15;
    _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] No download manager. Failed to re-download episodes after subscription changed for channel: %{private}lld - %{private}@", buf, 0x20u);
LABEL_11:
  }
}

void __66__MTSubscriptionChangeHandler__applyEffectsOffMoC_channel_taskID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    v4 = _MTLogCategoryDownload();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1AC9D5000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]Unable to redownload episodes for subscription change: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)episodesWithEffect:(unint64_t)a3 fromEpisodeEffects:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__MTSubscriptionChangeHandler_episodesWithEffect_fromEpisodeEffects___block_invoke;
  v6[3] = &__block_descriptor_40_e11__24__0_8_16l;
  v6[4] = a3;
  v4 = objc_msgSend(a4, "mt_compactMap:", v6);
  return v4;
}

id __69__MTSubscriptionChangeHandler_episodesWithEffect_fromEpisodeEffects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((*(void *)(a1 + 32) & [a3 unsignedIntegerValue]) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)_unsafeUpdatePriceTypeAndSendNotificationsIfNeededFor:(id)a3 subscriptionActive:(BOOL)a4 episodeEffects:(id)a5 taskID:(id)a6
{
  BOOL v48 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v47 = a5;
  id v10 = a6;
  v45 = [MEMORY[0x1E4F1CA80] set];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v39 = v9;
  id obj = [v9 podcasts];
  uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v55;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v55 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v11;
        v12 = *(void **)(*((void *)&v54 + 1) + 8 * v11);
        BOOL v13 = _MTLogCategoryDatabase();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = [v12 uuid];
          uint64_t v15 = [v12 storeCollectionId];
          *(_DWORD *)buf = 138543874;
          id v59 = v10;
          __int16 v60 = 2114;
          v61 = v14;
          __int16 v62 = 2048;
          uint64_t v63 = v15;
          _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating episodes in podcast: %{public}@ - %lld", buf, 0x20u);
        }
        uint64_t v53 = 0;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v43 = v12;
        id v46 = [v12 episodes];
        uint64_t v16 = [v46 countByEnumeratingWithState:&v49 objects:v66 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v50 != v18) {
                objc_enumerationMutation(v46);
              }
              v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              uint64_t v21 = _MTLogCategoryDatabase();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = [v20 uuid];
                uint64_t v23 = [v20 storeTrackId];
                *(_DWORD *)buf = 138543874;
                id v59 = v10;
                __int16 v60 = 2114;
                v61 = v22;
                __int16 v62 = 2048;
                uint64_t v63 = v23;
                _os_log_impl(&dword_1AC9D5000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating episode: %{public}@ - %lld", buf, 0x20u);
              }
              unint64_t v24 = [(MTSubscriptionChangeHandler *)self _updateEntitledAttributes:v20 subscriptionActive:v48 taskID:v10];
              if ((v24 & 8) != 0)
              {
                id v25 = _MTLogCategoryDatabase();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v26 = [v20 uuid];
                  uint64_t v27 = [v20 storeTrackId];
                  *(_DWORD *)buf = 138543874;
                  id v59 = v10;
                  __int16 v60 = 2114;
                  v61 = v26;
                  __int16 v62 = 2048;
                  uint64_t v63 = v27;
                  _os_log_impl(&dword_1AC9D5000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating episode state: %{public}@ - %lld", buf, 0x20u);
                }
                [(MTSubscriptionChangeHandler *)self _unsafeUpdateEntitlementStateAndCheckForNewEntitlement:v20 newlyEntitledEpisodeUUIDs:v45 latestEpisodeDate:&v53 latestEpisodeUUID:0];
                v24 ^= 8uLL;
              }
              __int16 v28 = [v20 uuid];

              if (v28)
              {
                v29 = _MTLogCategoryDatabase();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  uint64_t v30 = [v20 uuid];
                  uint64_t v31 = [v20 storeTrackId];
                  *(_DWORD *)buf = 138544130;
                  id v59 = v10;
                  __int16 v60 = 2114;
                  v61 = v30;
                  __int16 v62 = 2048;
                  uint64_t v63 = v31;
                  __int16 v64 = 2048;
                  unint64_t v65 = v24;
                  _os_log_impl(&dword_1AC9D5000, v29, OS_LOG_TYPE_INFO, "[%{public}@] Returning resulting effects for episode (%{public}@ - %lld): %lu", buf, 0x2Au);
                }
                v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v24];
                v33 = [v20 uuid];
                [v47 setObject:v32 forKeyedSubscript:v33];
              }
            }
            uint64_t v17 = [v46 countByEnumeratingWithState:&v49 objects:v66 count:16];
          }
          while (v17);
        }

        v34 = [v43 newestEpisodeByAvailabiltyTime];
        [v34 firstTimeAvailable];
        objc_msgSend(v43, "setLatestEpisodeAvailabilityTime:");

        v35 = _MTLogCategoryDatabase();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = [v43 uuid];
          uint64_t v37 = [v43 storeCollectionId];
          [v43 latestEpisodeAvailabilityTime];
          *(_DWORD *)buf = 138544130;
          id v59 = v10;
          __int16 v60 = 2114;
          v61 = v36;
          __int16 v62 = 2048;
          uint64_t v63 = v37;
          __int16 v64 = 2048;
          unint64_t v65 = v38;
          _os_log_impl(&dword_1AC9D5000, v35, OS_LOG_TYPE_INFO, "[%{public}@] Resolved podcasts latest episode availability for podcast (%{public}@ - %lld): %f", buf, 0x2Au);
        }
        if (v48) {
          [(MTSubscriptionChangeHandler *)self _unsafeSendNotificationsForNewlyEntitledEpisodes:v43 latestEpisodeUUID:0 newlyEntitledEpisodeUUIDs:v45 taskID:v10];
        }
        uint64_t v11 = v44 + 1;
      }
      while (v44 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v42);
  }
}

- (unint64_t)_updateEntitledAttributes:(id)a3 subscriptionActive:(BOOL)a4 taskID:(id)a5
{
  BOOL v6 = a4;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 uuid];
    *(_DWORD *)buf = 138544130;
    id v69 = v8;
    __int16 v70 = 2112;
    v71 = v10;
    __int16 v72 = 2048;
    uint64_t v73 = [v7 storeTrackId];
    __int16 v74 = 1024;
    LODWORD(v75) = v6;
    _os_log_impl(&dword_1AC9D5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating entitled attributes in episode: %@ - %lld. subscriptionActive: %d", buf, 0x26u);
  }
  uint64_t v11 = [v7 priceType];
  v12 = [v7 enclosureURL];
  if (!v6)
  {
    [v7 freeDuration];
    if (v23 > 0.0)
    {
      [v7 freeDuration];
      objc_msgSend(v7, "setDuration:");
    }
    unint64_t v24 = [v7 freeEnclosureURL];
    [v7 setEnclosureURL:v24];

    id v25 = [v7 freePriceType];
    [v7 setPriceType:v25];

    uint64_t v22 = [v7 freeTranscriptIdentifier];
    goto LABEL_15;
  }
  [v7 entitledDuration];
  if (v13 > 0.0)
  {
    [v7 entitledDuration];
    objc_msgSend(v7, "setDuration:");
  }
  int v14 = [v7 entitledEnclosureURL];

  if (v14)
  {
    uint64_t v15 = [v7 entitledEnclosureURL];
    [v7 setEnclosureURL:v15];
  }
  uint64_t v16 = [v7 entitledPriceType];
  [v7 setPriceType:v16];

  uint64_t v17 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v7 entitledPriceType];
    uint64_t v19 = [v7 uuid];
    uint64_t v20 = [v7 storeTrackId];
    *(_DWORD *)buf = 138544386;
    id v69 = v8;
    __int16 v70 = 2112;
    v71 = v18;
    __int16 v72 = 2112;
    uint64_t v73 = (uint64_t)v19;
    __int16 v74 = 2048;
    uint64_t v75 = v20;
    __int16 v76 = 1024;
    LODWORD(v77) = 1;
    _os_log_impl(&dword_1AC9D5000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set priceType to entitledPriceType %@ for episode: %@ - %lld. subscriptionActive: %d", buf, 0x30u);
  }
  uint64_t v21 = [v7 entitledTranscriptIdentifier];

  if (v21)
  {
    uint64_t v22 = [v7 entitledTranscriptIdentifier];
LABEL_15:
    __int16 v26 = (void *)v22;
    [v7 setTranscriptIdentifier:v22];
  }
  uint64_t v27 = [v7 priceType];
  char v28 = [v11 isEqualToString:v27];

  if ((v28 & 1) == 0)
  {
    v29 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v7 uuid];
      uint64_t v31 = [v7 priceType];
      *(_DWORD *)buf = 138544130;
      id v69 = v8;
      __int16 v70 = 2112;
      v71 = v30;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v11;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v31;
      _os_log_impl(&dword_1AC9D5000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entitled state is changed for episode uuid %@ from priceType: %@ to %@", buf, 0x2Au);
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v7, "setPriceTypeChangedDate:");
  }
  [v7 resolveAvailabilityDate];
  v32 = [v7 assetURL];
  uint64_t v33 = [v32 length];

  if (v33)
  {
    id v67 = v8;
    v34 = v12;
    v35 = [v7 priceType];
    char v36 = [v35 isEqualToString:v11];

    uint64_t v37 = [v7 entitledEnclosureURL];
    unint64_t v38 = [v7 freeEnclosureURL];
    char v39 = [v37 isEqualToString:v38];

    char v40 = v39 | v36;
    uint64_t v41 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v42 = [v7 uuid];
      v43 = [v7 priceType];
      uint64_t v44 = [v7 freePriceType];
      v45 = NSStringFromBOOL();
      id v46 = [v7 enclosureURL];
      *(_DWORD *)buf = 138544642;
      id v69 = v42;
      __int16 v70 = 2112;
      v71 = v11;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v43;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v44;
      __int16 v76 = 2112;
      v77 = v45;
      __int16 v78 = 2112;
      v79 = v46;
      _os_log_impl(&dword_1AC9D5000, v41, OS_LOG_TYPE_INFO, "Updating entitlement info for %{public}@. PriceType: (%@ -> %@), freePriceType: %@. Requires new media: %@. New enclosure url: %@", buf, 0x3Eu);
    }
    if (v40)
    {
      unint64_t v47 = 1;
    }
    else
    {
      BOOL v48 = [v7 enclosureURL];

      if (v48) {
        unint64_t v47 = 7;
      }
      else {
        unint64_t v47 = 3;
      }
    }
    v12 = v34;
    id v8 = v67;
    if (!v11) {
      goto LABEL_40;
    }
  }
  else
  {
    unint64_t v47 = 1;
    if (!v11) {
      goto LABEL_40;
    }
  }
  uint64_t v49 = [v7 priceType];
  if (v49)
  {
    long long v50 = (void *)v49;
    long long v51 = [v7 priceType];
    if (([v11 isEqualToString:v51] & 1) == 0
      && v12
      && ([v7 enclosureURL], (uint64_t v52 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v53 = (void *)v52;
      long long v54 = [v7 enclosureURL];
      char v55 = [v12 isEqualToString:v54];

      if ((v55 & 1) == 0)
      {
        long long v56 = _MTLogCategoryDatabase();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          long long v57 = [v7 uuid];
          uint64_t v58 = [v7 storeTrackId];
          id v59 = [v7 priceType];
          __int16 v60 = [v7 enclosureURL];
          *(_DWORD *)buf = 138544898;
          id v69 = v8;
          __int16 v70 = 2112;
          v71 = v57;
          __int16 v72 = 2048;
          uint64_t v73 = v58;
          __int16 v74 = 2112;
          uint64_t v75 = (uint64_t)v11;
          __int16 v76 = 2112;
          v77 = v59;
          __int16 v78 = 2112;
          v79 = v12;
          __int16 v80 = 2112;
          v81 = v60;
          _os_log_impl(&dword_1AC9D5000, v56, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will update entitlement state for episode %@ - %lld. oldPriceType: %@, priceType: %@, oldEnclosureUrl: %@, enclosureUrl: %@", buf, 0x48u);
        }
        v47 |= 8uLL;
        goto LABEL_43;
      }
    }
    else
    {
    }
  }
LABEL_40:
  v61 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v62 = [v7 uuid];
    uint64_t v63 = [v7 storeTrackId];
    __int16 v64 = [v7 priceType];
    unint64_t v65 = [v7 enclosureURL];
    *(_DWORD *)buf = 138544898;
    id v69 = v8;
    __int16 v70 = 2112;
    v71 = v62;
    __int16 v72 = 2048;
    uint64_t v73 = v63;
    __int16 v74 = 2112;
    uint64_t v75 = (uint64_t)v11;
    __int16 v76 = 2112;
    v77 = v64;
    __int16 v78 = 2112;
    v79 = v12;
    __int16 v80 = 2112;
    v81 = v65;
    _os_log_impl(&dword_1AC9D5000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will not update entitlement state for episode %@ - %lld. oldPriceType: %@, priceType: %@, oldEnclosureUrl: %@, enclosureUrl: %@", buf, 0x48u);
  }
LABEL_43:

  return v47;
}

- (void)_unsafeUpdateEntitlementStateAndCheckForNewEntitlement:(id)a3 newlyEntitledEpisodeUUIDs:(id)a4 latestEpisodeDate:(double *)a5 latestEpisodeUUID:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = [v9 isEntitled];
  double v13 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v9 uuid];
    int v24 = 138413058;
    id v25 = v14;
    __int16 v26 = 2048;
    uint64_t v27 = [v9 storeTrackId];
    __int16 v28 = 2048;
    uint64_t v29 = [v9 entitlementState];
    __int16 v30 = 1024;
    int v31 = v12;
    _os_log_impl(&dword_1AC9D5000, v13, OS_LOG_TYPE_DEFAULT, "[MTSubscriptionChangeHandler] Updating entitlementState for episode: %@ - %lld. oldEntitlementState: %lld, oldIsEntitled: %d", (uint8_t *)&v24, 0x26u);
  }
  [v9 updateEntitlementState];
  uint64_t v15 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v9 uuid];
    uint64_t v17 = [v9 storeTrackId];
    uint64_t v18 = [v9 entitlementState];
    int v19 = [v9 isEntitled];
    int v24 = 138413058;
    id v25 = v16;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    __int16 v30 = 1024;
    int v31 = v19;
    _os_log_impl(&dword_1AC9D5000, v15, OS_LOG_TYPE_DEFAULT, "[MTSubscriptionChangeHandler] Updated entitlementState for episode: %@ - %lld. newEntitlementState: %lld, newIsEntitled: %d", (uint8_t *)&v24, 0x26u);
  }
  if ([v9 isEntitled] && v12 != objc_msgSend(v9, "isEntitled"))
  {
    uint64_t v20 = [v9 uuid];
    [v10 addObject:v20];
  }
  [v9 pubDate];
  if (v21 > *a5 && [v9 isMedia])
  {
    [v9 pubDate];
    *(void *)a5 = v22;
    uint64_t v23 = [v9 uuid];

    id v11 = (id)v23;
  }
}

- (void)_unsafeSendNotificationsForNewlyEntitledEpisodes:(id)a3 latestEpisodeUUID:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 taskID:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  double v13 = [v9 managedObjectContext];
  int v14 = [v9 uuid];
  uint64_t v15 = +[MTRecencyUtil upNextForPodcastUuid:v14 ctx:v13];
  uint64_t v16 = [v15 episodeUuid];

  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v10;
  }
  id v18 = v17;
  int v19 = [v12 containsObject:v18];

  if (v19)
  {
    uint64_t v20 = [v13 objectForUuid:v16 entityName:@"MTEpisode"];
    double v21 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [v9 uuid];
      v22 = id v28 = v10;
      uint64_t v23 = [v9 title];
      int v24 = [v20 uuid];
      [v20 title];
      id v25 = v29 = v11;
      *(_DWORD *)buf = 138544386;
      id v31 = v29;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      __int16 v34 = 2112;
      v35 = v23;
      __int16 v36 = 2114;
      uint64_t v37 = v24;
      __int16 v38 = 2112;
      char v39 = v25;
      _os_log_impl(&dword_1AC9D5000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ - '%@' Found new smart play episode from episode entitlement changed %{public}@ - %@", buf, 0x34u);

      id v11 = v29;
      id v10 = v28;
    }

    [v20 unsuppressAutomaticDownloadsIfNeeded];
    [v20 setIsNew:1];
    [v20 setSentNotification:0];
  }
  else
  {
    uint64_t v20 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = [v9 uuid];
      uint64_t v27 = [v9 title];
      *(_DWORD *)buf = 138543874;
      id v31 = v11;
      __int16 v32 = 2114;
      uint64_t v33 = v26;
      __int16 v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_1AC9D5000, v20, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ - Skipping '%@' smart playlist episode, not found during entitlement update.", buf, 0x20u);
    }
  }
}

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

@end