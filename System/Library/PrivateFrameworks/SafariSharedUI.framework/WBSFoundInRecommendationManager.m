@interface WBSFoundInRecommendationManager
+ (BOOL)isBundleIdentifierFromCalendar:(id)a3;
+ (BOOL)isBundleIdentifierFromMessages:(id)a3;
+ (id)_linkRecommendationsFromSGSuggestions:(id)a3 contactStoreProvider:(id)a4;
+ (unint64_t)foundInSourceFromBundleIdentifier:(id)a3;
- (void)_createInternalQueueIfNecessary;
- (void)_recentURLRecommendationsWithCompletionHandler:(id)a3;
- (void)beginListeningForURLSuggestionChanges;
- (void)recentRecommendationsWithCompletionHandler:(id)a3;
- (void)stopListeningForURLSuggestionChanges;
@end

@implementation WBSFoundInRecommendationManager

- (void)beginListeningForURLSuggestionChanges
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Could not begin listening for Found In notifications", v1, 2u);
}

void __72__WBSFoundInRecommendationManager_beginListeningForURLSuggestionChanges__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSFoundInRecommendationManager_beginListeningForURLSuggestionChanges__block_invoke_2;
  block[3] = &unk_1E5E41340;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __72__WBSFoundInRecommendationManager_beginListeningForURLSuggestionChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"WBSFoundInRecommendationManagerDidUpdateSuggestionsNotification" object:WeakRetained];
  }
}

- (void)stopListeningForURLSuggestionChanges
{
  int changeNotificationToken = self->_changeNotificationToken;
  if (changeNotificationToken)
  {
    notify_cancel(changeNotificationToken);
    self->_int changeNotificationToken = 0;
  }
}

- (void)recentRecommendationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(WBSFoundInRecommendationManager *)self _createInternalQueueIfNecessary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5E42D70;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(WBSFoundInRecommendationManager *)self _recentURLRecommendationsWithCompletionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5E423E8;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __78__WBSFoundInRecommendationManager_recentRecommendationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_recentURLRecommendationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E420C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [MEMORY[0x1E4F5DB70] serviceForURLs];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5E42DB8;
  id v14 = *(id *)(a1 + 40);
  id v5 = (void *)MEMORY[0x1AD115160](v13);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = [v6 dateByAddingUnit:16 value:1 toDate:v7 options:0];

    id v9 = [v6 startOfDayForDate:v8];
    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.mail", @"com.apple.mobilemail", 0);
    v11 = *(void **)(*(void *)(a1 + 32) + 8);
    v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*MEMORY[0x1E4F985F8]];
    [v11 urlsFoundBetweenStartDate:v12 endDate:v9 excludingBundleIdentifiers:v10 limit:64 withCompletion:v5];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) recentURLsWithLimit:64 withCompletion:v5];
  }
}

void __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(a1 + 32))
  {
    if (v6)
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2_cold_1(v8, v7);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v9 = +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:v5 contactStoreProvider:&__block_literal_global_16];
      v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        int v12 = 134218240;
        uint64_t v13 = [v9 count];
        __int16 v14 = 2048;
        uint64_t v15 = [v5 count];
        _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_INFO, "Got %ld recommendations out of %ld Found In links retrieved from suggestions service.", (uint8_t *)&v12, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_6()
{
  return [MEMORY[0x1E4F982D8] sharedContactStoreManager];
}

- (void)_createInternalQueueIfNecessary
{
  if (!self->_internalQueue)
  {
    uint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.FoundInRecommendationManager.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;
  }
}

+ (id)_linkRecommendationsFromSGSuggestions:(id)a3 contactStoreProvider:(id)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  v104 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v111 objects:v123 count:16];
  v90 = v6;
  if (!v7)
  {
    v102 = 0;
    v94 = 0;
    goto LABEL_103;
  }
  uint64_t v8 = v7;
  char v92 = 0;
  v102 = 0;
  v94 = 0;
  uint64_t v9 = *(void *)v112;
  unint64_t v10 = 0x1E5E3F000uLL;
  uint64_t v105 = *(void *)v112;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v112 != v9) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(*((void *)&v111 + 1) + 8 * v11);
      uint64_t v13 = *(void **)(v10 + 2768);
      __int16 v14 = [v12 bundleIdentifier];
      unint64_t v15 = [v13 foundInSourceFromBundleIdentifier:v14];

      if (v15 < 2) {
        goto LABEL_43;
      }
      uint64_t v16 = [v12 url];
      v17 = [v16 scheme];
      if ([v17 length])
      {
        char v18 = objc_msgSend(v16, "safari_isHTTPFamilyURL");

        if ((v18 & 1) == 0) {
          goto LABEL_42;
        }
      }
      else
      {
      }
      v19 = objc_msgSend(v16, "safari_canonicalURLForStartPage");
      v20 = [v19 host];
      if (![v20 length] || (objc_msgSend(v20, "safari_looksLikeIPAddress") & 1) != 0) {
        goto LABEL_40;
      }
      v21 = bestDateForSuggestion(v12);
      if (!v21) {
        goto LABEL_39;
      }
      if (v15 == 2)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([v12 documentTitle],
              v28 = objc_claimAutoreleasedReturnValue(),
              uint64_t v29 = [v28 length],
              v28,
              !v29))
        {
LABEL_39:

LABEL_40:
          uint64_t v34 = (uint64_t)v12;
          goto LABEL_41;
        }
        v22 = [v12 documentDate];
        if (v22)
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v31 = v30;
          [v22 timeIntervalSinceReferenceDate];
          double v33 = v32;
          if (v31 >= v32 + -600.0)
          {
            [v12 documentTimeInterval];
            LOBYTE(v10) = v31 <= v33 + v51;
            goto LABEL_29;
          }
        }
      }
      else
      {
        if (v15 != 3) {
          goto LABEL_30;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_39;
        }
        v22 = [v12 documentDate];
        if (v22)
        {
          v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          v24 = [v23 components:96 fromDate:v22];

          if ([v24 hour] || objc_msgSend(v24, "minute"))
          {
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v26 = v25;
            [v22 timeIntervalSinceReferenceDate];
            LOBYTE(v10) = v26 <= v27 + 3600.0 && v26 >= v27 + -3600.0;
          }
          else
          {
            LOBYTE(v10) = 0;
          }

          goto LABEL_29;
        }
      }
      LOBYTE(v10) = 0;
LABEL_29:

LABEL_30:
      if (v10)
      {
        uint64_t v34 = [v12 documentIdentifier];
        v35 = [v104 objectForKeyedSubscript:v34];
        uint64_t v16 = v35;
        if (!v35) {
          goto LABEL_37;
        }
        v19 = [v35 pageURL];
        v20 = [v12 url];
        v36 = [v19 host];
        v37 = [v20 host];
        char v38 = [v36 isEqualToString:v37];

        if (v38)
        {
          v39 = [v20 pathComponents];
          unint64_t v98 = [v39 count];
          v40 = [v19 pathComponents];
          unint64_t v41 = [v40 count];

          v42 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
          BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
          if (v98 > v41)
          {
            if (v43)
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v118 = v34;
              _os_log_error_impl(&dword_1ABB70000, v42, OS_LOG_TYPE_ERROR, "We have a Found In link with a duplicate GUID and host but more path components so we'll replace the existing one: %{public}@", buf, 0xCu);
            }

LABEL_37:
            v44 = [v12 url];
            v19 = objc_msgSend(v44, "safari_canonicalURLForStartPage");

            v20 = bestDateForSuggestion(v12);
            v45 = [v12 bundleIdentifier];
            unint64_t v46 = +[WBSFoundInRecommendationManager foundInSourceFromBundleIdentifier:v45];

            switch(v46)
            {
              case 0uLL:
                goto LABEL_41;
              case 1uLL:
                uint64_t v47 = 5;
                goto LABEL_56;
              case 2uLL:
                uint64_t v47 = 6;
                goto LABEL_56;
              case 3uLL:
                uint64_t v47 = 7;
LABEL_56:
                uint64_t v99 = v47;
                break;
              default:
                uint64_t v99 = 0;
                break;
            }
            v95 = [WBSForYouLinkRecommendation alloc];
            id v52 = v12;
            if ((objc_opt_respondsToSelector() & 1) != 0
              && ([v52 documentTitle],
                  v53 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v54 = [v53 length],
                  v53,
                  v54))
            {
              uint64_t v55 = [v52 documentTitle];
            }
            else
            {
              v56 = [v52 title];
              uint64_t v57 = [v56 length];

              if (!v57)
              {
                v58 = &stru_1F031A860;
                goto LABEL_64;
              }
              uint64_t v55 = [v52 title];
            }
            v58 = (__CFString *)v55;
LABEL_64:

            v59 = [(WBSForYouLinkRecommendation *)v95 initWithTitle:v58 url:v19 lastSeenDate:v20 source:v99 topicSource:0];
            v60 = [v52 bundleIdentifier];
            [(WBSForYouLinkRecommendation *)v59 setBundleIdentifier:v60];

            [(WBSForYouLinkRecommendation *)v59 setSourceID:v34];
            if (v46 == 3 || v46 == 2)
            {
              v97 = NSString;
              v68 = v59;
              v101 = _WBSLocalizedString();
              v69 = [(WBSForYouLinkRecommendation *)v59 title];
              v70 = objc_msgSend(v97, "localizedStringWithFormat:", v101, v69);
              [(WBSForYouLinkRecommendation *)v68 setTitle:v70];

              v71 = _WBSLocalizedString();
              [(WBSForYouLinkRecommendation *)v68 setFootnote:v71];

              v72 = v102;
              v59 = v68;
              goto LABEL_97;
            }
            if (v46 != 1)
            {
              v72 = v102;
              goto LABEL_97;
            }
            v96 = _WBSLocalizedString();
            v61 = [v52 receivedFromHandle];
            if ([v61 hasPrefix:@"e:"])
            {
              uint64_t v62 = [v61 substringFromIndex:2];

              v61 = (void *)v62;
            }
            id v63 = v61;
            if (!v94)
            {
              v94 = v90[2]();
            }
            v100 = v63;
            if ((v92 & 1) != 0 || [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
            {
              v64 = v102;
            }
            else
            {
              id v110 = 0;
              v64 = objc_msgSend(v94, "_ios_meContactWithKeysToFetch:error:", MEMORY[0x1E4F1CBF0], &v110);
              id v65 = v110;

              if (v65)
              {
                v66 = v64;
                v67 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                  +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:v65 contactStoreProvider:&v122];
                }

                v64 = v66;
                id v63 = v100;
              }
            }
            id v109 = 0;
            v73 = [v94 contactForHandle:v63 error:&v109];
            v91 = v64;
            id v93 = v109;
            v74 = [v64 identifier];
            v103 = v73;
            v75 = [v73 identifier];
            LODWORD(v73) = [v74 isEqualToString:v75];

            if (v73)
            {
              v76 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138478083;
                v78 = v100;
                uint64_t v118 = (uint64_t)v100;
                __int16 v119 = 2113;
                uint64_t v120 = v34;
                _os_log_debug_impl(&dword_1ABB70000, v76, OS_LOG_TYPE_DEBUG, "Skipping suggestion from Me contact with handle: %{private}@ document identifier: %{private}@", buf, 0x16u);
                int v77 = 3;
              }
              else
              {
                int v77 = 3;
                v78 = v100;
              }
              id v79 = v78;
LABEL_96:

              char v92 = 1;
              v72 = v91;
              if (v77 != 11)
              {
LABEL_98:

                v102 = v72;
LABEL_41:

                id v12 = (id)v34;
                uint64_t v9 = v105;
                unint64_t v10 = 0x1E5E3F000;
LABEL_42:

LABEL_43:
                goto LABEL_44;
              }
LABEL_97:
              [v104 setObject:v59 forKeyedSubscript:v34];
              goto LABEL_98;
            }
            v80 = objc_msgSend(v103, "safari_fullName");
            v89 = v80;
            if ([v80 length])
            {
              id v79 = v80;
            }
            else
            {
              id v79 = v100;
              if (v94)
              {
                v83 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
                v84 = v83;
                if (v93)
                {
                  v78 = v100;
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                    +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:v93 contactStoreProvider:&v116];
                  }
                }
                else
                {
                  v78 = v100;
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
                    +[WBSFoundInRecommendationManager _linkRecommendationsFromSGSuggestions:contactStoreProvider:](&v107, v108, v84);
                  }
                }
                int v77 = 3;
                id v79 = v78;
                goto LABEL_95;
              }
            }
            [(WBSForYouLinkRecommendation *)v59 setContact:v103];
            v88 = NSString;
            v81 = _WBSLocalizedString();
            v82 = objc_msgSend(v88, "localizedStringWithFormat:", v81, v96, v79);
            [(WBSForYouLinkRecommendation *)v59 setFootnote:v82];

            int v77 = 11;
            v78 = v100;
LABEL_95:

            goto LABEL_96;
          }
          if (!v43) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v118 = v34;
          v49 = v42;
          v50 = "Skipping Found In link with a duplicate GUID and host but less path components: %{public}@";
        }
        else
        {
          v48 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v118 = v34;
          v49 = v48;
          v50 = "Skipping Found In link with a duplicate GUID but different URL host: %{public}@";
        }
        _os_log_error_impl(&dword_1ABB70000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
        goto LABEL_41;
      }
      uint64_t v9 = v105;
      unint64_t v10 = 0x1E5E3F000;
LABEL_44:
      ++v11;
    }
    while (v8 != v11);
    uint64_t v85 = [obj countByEnumeratingWithState:&v111 objects:v123 count:16];
    uint64_t v8 = v85;
  }
  while (v85);
LABEL_103:

  v86 = [v104 allValues];

  return v86;
}

+ (unint64_t)foundInSourceFromBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([a1 isBundleIdentifierFromCalendar:v4])
  {
    unint64_t v5 = 2;
  }
  else if ([a1 isBundleIdentifierFromMessages:v4])
  {
    unint64_t v5 = 1;
  }
  else
  {
    id v6 = [v4 lowercaseString];
    int v7 = [v6 isEqualToString:@"com.apple.reminders"];

    if (v7) {
      unint64_t v5 = 3;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)isBundleIdentifierFromCalendar:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilecal"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.iCal"];
  }

  return v4;
}

+ (BOOL)isBundleIdentifierFromMessages:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.iChat"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.MobileSMS"];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
}

void __82__WBSFoundInRecommendationManager__recentURLRecommendationsWithCompletionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  char v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Unable to get Found In suggestions: %{public}@", (uint8_t *)&v5, 0xCu);
}

+ (void)_linkRecommendationsFromSGSuggestions:(os_log_t)log contactStoreProvider:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Unable to get full contact name for Messages link", buf, 2u);
}

+ (void)_linkRecommendationsFromSGSuggestions:(void *)a3 contactStoreProvider:(void *)a4 .cold.2(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_0_6(&dword_1ABB70000, v9, v10, "Unable to get full contact name for Messages link with error: %{public}@");
}

+ (void)_linkRecommendationsFromSGSuggestions:(void *)a3 contactStoreProvider:(void *)a4 .cold.3(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_0_6(&dword_1ABB70000, v9, v10, "Could not fetch me card with error: %{public}@");
}

@end