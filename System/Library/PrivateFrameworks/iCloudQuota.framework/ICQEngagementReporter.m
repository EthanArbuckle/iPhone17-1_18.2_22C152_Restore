@interface ICQEngagementReporter
+ (id)_createOpportunityBubbleFrom:(id)a3 bundleID:(id)a4;
+ (id)_eventNameForEngagementType:(int64_t)a3;
+ (id)_placementDictionary;
+ (void)_sendBubbleDisplayedEventFor:(id)a3;
+ (void)_sendImpressionEventWithName:(id)a3 bundleID:(id)a4;
+ (void)_sendSubscriptionChangedEvent;
+ (void)fetchBubbleContentWithBundleID:(id)a3 completion:(id)a4;
+ (void)sendEventFor:(int64_t)a3 withBundleID:(id)a4 link:(id)a5;
+ (void)shouldShowOpportunityBubbleWithBundleID:(id)a3 completion:(id)a4;
@end

@implementation ICQEngagementReporter

+ (void)sendEventFor:(int64_t)a3 withBundleID:(id)a4 link:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = [a1 _eventNameForEngagementType:a3];
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Sending AMSMetricEvent for %@", (uint8_t *)&v10, 0xCu);
  }

  if (a3 == 2)
  {
    [a1 _sendBubbleDisplayedEventFor:v7];
  }
  else if (a3 == 3)
  {
    [a1 _sendSubscriptionChangedEvent];
  }
}

+ (void)_sendImpressionEventWithName:(id)a3 bundleID:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (__CFString *)a4;
  id v7 = v6;
  v8 = @"com.apple.iCloudQuotaUI";
  if (v6) {
    v8 = v6;
  }
  v9 = v8;
  id v10 = objc_alloc(MEMORY[0x1E4F4DD60]);
  v21[0] = @"eventType";
  v21[1] = @"bundleId";
  v22[0] = v5;
  v22[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  uint64_t v12 = (void *)[v10 initWithUnderlyingDictionary:v11];

  v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Sending AMS metricEvent to start on-device journey with bundleID %@", (uint8_t *)&v19, 0xCu);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F4DC70]);
  v15 = [v12 underlyingDictionary];
  id v16 = (id)[v14 enqueueData:v15];

  v17 = _ICQGetLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v12 underlyingDictionary];
    int v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent to AMSEngagement: %@", (uint8_t *)&v19, 0xCu);
  }
}

+ (void)shouldShowOpportunityBubbleWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4DC70]);
  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"photosLibraryFooter", @"homeDashboardHeader", 0);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4DC80]) initWithServiceType:@"iCloudQuotaUI" placements:v9];
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing a messageEvent to amsengagementd to determine if we should show OpportunityBubble.", buf, 2u);
  }

  uint64_t v12 = [v8 enqueueMessageEvent:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke;
  v17[3] = &unk_1E6A53330;
  id v21 = v7;
  id v22 = a1;
  id v18 = v9;
  id v19 = v6;
  id v20 = v8;
  id v13 = v8;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  [v12 addFinishBlock:v17];
}

void __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke_cold_1(v5, v6);
    }
    goto LABEL_4;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = [a2 messageActions];
  uint64_t v33 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v33)
  {
    uint64_t v7 = *(void *)v41;
    v35 = v6;
    uint64_t v32 = *(void *)v41;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v34 = v8;
        v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        id v10 = _ICQGetLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Received response from amsngagementd.", buf, 2u);
        }

        v11 = [v9 placements];
        uint64_t v12 = _ICQGetLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v11;
          _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "AMSEngagementMessageRequests: %@", buf, 0xCu);
        }

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v13 = *(id *)(a1 + 32);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (!v14) {
          goto LABEL_22;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v19 = [v11 objectForKeyedSubscript:v18];
            id v20 = [*(id *)(a1 + 64) _placementDictionary];
            id v21 = [v20 objectForKeyedSubscript:*(void *)(a1 + 40)];
            LODWORD(v18) = [v18 isEqualToString:v21];

            if (v18)
            {
              id v22 = _ICQGetLogSystem();
              BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
              if (v19)
              {
                id v5 = 0;
                if (v23)
                {
                  *(_WORD *)buf = 0;
                  v24 = "ICQTileView should be shown.";
                  goto LABEL_30;
                }
              }
              else
              {
                id v5 = 0;
                if (v23)
                {
                  *(_WORD *)buf = 0;
                  v24 = "ICQTileView shouldn't be shown.";
LABEL_30:
                  _os_log_impl(&dword_1D5851000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
                }
              }

              v25 = _ICQGetLogSystem();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = [v19 metricsEvent];
                v27 = [v26 underlyingDictionary];
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent from AMSEngagementMessageRequest to AMSEngagement: %@", buf, 0xCu);
              }
              v28 = *(void **)(a1 + 48);
              v29 = [v19 metricsEvent];
              v30 = [v29 underlyingDictionary];
              id v31 = (id)[v28 enqueueData:v30];

              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
              goto LABEL_34;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v15) {
            continue;
          }
          break;
        }
LABEL_22:

        uint64_t v8 = v34 + 1;
        id v6 = v35;
        id v5 = 0;
        uint64_t v7 = v32;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [v35 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v33);
  }
LABEL_4:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_34:
}

+ (void)fetchBubbleContentWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4DC70]);
  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"photosLibraryFooter", @"homeDashboardHeader", 0);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4DC80]) initWithServiceType:@"iCloudQuotaUI" placements:v9];
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Enqueueing a messageEvent to amsengagementd to pull bubble content from Mercury.", buf, 2u);
  }

  uint64_t v12 = [v8 enqueueMessageEvent:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__ICQEngagementReporter_fetchBubbleContentWithBundleID_completion___block_invoke;
  v17[3] = &unk_1E6A53358;
  id v21 = v7;
  id v22 = a1;
  id v18 = v9;
  id v19 = v6;
  id v20 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v6;
  id v16 = v9;
  [v12 addFinishBlock:v17];
}

void __67__ICQEngagementReporter_fetchBubbleContentWithBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v3 = [a2 messageActions];
  uint64_t v29 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v29)
  {
    uint64_t v4 = *(void *)v38;
    id v31 = v3;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v38 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v30 = v5;
        id v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
        id v7 = _ICQGetLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Received response from amsngagementd for bubble content.", buf, 2u);
        }

        id v8 = [v6 placements];
        v9 = _ICQGetLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v43 = v8;
          _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "AMSEngagementMessageRequests for bubble content: %@", buf, 0xCu);
        }

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id obj = *(id *)(a1 + 32);
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(obj);
              }
              id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              id v15 = [v8 objectForKeyedSubscript:v14];
              id v16 = [v15 makeDialogRequest];
              v17 = [*(id *)(a1 + 64) _placementDictionary];
              id v18 = [v17 objectForKeyedSubscript:*(void *)(a1 + 40)];
              LODWORD(v14) = [v14 isEqualToString:v18];

              if (v14)
              {
                uint64_t v19 = *(void *)(a1 + 56);
                id v20 = [*(id *)(a1 + 64) _createOpportunityBubbleFrom:v16 bundleID:*(void *)(a1 + 40)];
                (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v20, 0);

                id v21 = *(void **)(a1 + 48);
                id v22 = [v16 metricsEvent];
                BOOL v23 = [v22 underlyingDictionary];
                id v24 = (id)[v21 enqueueData:v23];

                v25 = _ICQGetLogSystem();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  v26 = [v16 metricsEvent];
                  v27 = [v26 underlyingDictionary];
                  *(_DWORD *)buf = 138412290;
                  long long v43 = v27;
                  _os_log_impl(&dword_1D5851000, v25, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent from AMSDialogRequest to AMSEngagement after pulling for bubble content: %@", buf, 0xCu);
                }
                return;
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v30 + 1;
        v3 = v31;
        uint64_t v4 = v28;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [v31 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v29);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)_createOpportunityBubbleFrom:(id)a3 bundleID:(id)a4
{
  v57[2] = *MEMORY[0x1E4F143B8];
  v56[1] = @"opportunityBubbleDetails";
  v57[0] = a4;
  v56[0] = @"appId";
  v54[0] = @"title";
  id v42 = a4;
  id v5 = a3;
  long long v41 = [v5 title];
  v55[0] = v41;
  v54[1] = @"message";
  long long v40 = [v5 message];
  v55[1] = v40;
  v54[2] = @"imageDetails";
  v52[0] = @"3x";
  long long v39 = [v5 iconURL];
  v53[0] = v39;
  v52[1] = @"2x";
  long long v38 = [v5 iconURL];
  v53[1] = v38;
  v52[2] = @"1x";
  long long v37 = [v5 iconURL];
  v53[2] = v37;
  long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v55[2] = v36;
  v54[3] = @"actions";
  v49[0] = @"btnId";
  long long v35 = [v5 buttonActions];
  long long v34 = [v35 objectAtIndexedSubscript:0];
  long long v33 = [v34 identifier];
  v50[0] = v33;
  v49[1] = @"btnTitle";
  uint64_t v32 = [v5 buttonActions];
  id v31 = [v32 objectAtIndexedSubscript:0];
  uint64_t v30 = [v31 title];
  v50[1] = v30;
  v50[2] = @"LAUNCH_REMOTE_UI";
  v49[2] = @"btnAction";
  v49[3] = @"btnActParams";
  v47 = @"openUrl";
  uint64_t v29 = [v5 buttonActions];
  uint64_t v28 = [v29 objectAtIndexedSubscript:0];
  v27 = [v28 deepLink];
  v26 = [v27 absoluteString];
  uint64_t v48 = v26;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v50[3] = v25;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];
  v51[0] = v24;
  v45[0] = @"btnId";
  BOOL v23 = [v5 buttonActions];
  id v22 = [v23 objectAtIndexedSubscript:1];
  id v21 = [v22 identifier];
  v46[0] = v21;
  v45[1] = @"btnTitle";
  id v20 = [v5 buttonActions];
  uint64_t v19 = [v20 objectAtIndexedSubscript:1];
  id v6 = [v19 title];
  v46[1] = v6;
  v46[2] = @"HTTP_CALL";
  v45[2] = @"btnAction";
  v45[3] = @"btnActParams";
  long long v43 = @"openUrl";
  id v7 = [v5 buttonActions];

  id v8 = [v7 objectAtIndexedSubscript:1];
  v9 = [v8 deepLink];
  uint64_t v10 = [v9 absoluteString];
  v44 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v46[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:4];
  v51[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  v55[3] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
  v57[1] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  id v16 = [ICQOpportunityBubbleSpecification alloc];
  v17 = [(ICQOpportunityBubbleSpecification *)v16 initWithOpportunityBubble:v15 andOpportunitySheet:0];

  return v17;
}

+ (void)_sendBubbleDisplayedEventFor:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4DC70]);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"photosLibraryFooter", @"homeDashboardHeader", 0);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4DC80]) initWithServiceType:@"iCloudQuotaUI" placements:v4];
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Enqueueing a messageEvent to amsengagementd to send impression event.", buf, 2u);
  }

  id v7 = [v3 enqueueMessageEvent:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ICQEngagementReporter__sendBubbleDisplayedEventFor___block_invoke;
  v10[3] = &unk_1E6A53380;
  id v11 = v4;
  id v12 = v3;
  id v8 = v3;
  id v9 = v4;
  [v7 addFinishBlock:v10];
}

void __54__ICQEngagementReporter__sendBubbleDisplayedEventFor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [a2 messageActions];
  uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v30 + 1) + 8 * v2);
        uint64_t v4 = _ICQGetLogSystem();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Received response from amsngagementd.", buf, 2u);
        }
        uint64_t v24 = v2;

        id v5 = [v3 placements];
        id v6 = _ICQGetLogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v36 = v5;
          _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "AMSEngagementMessageRequests: %@", buf, 0xCu);
        }

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = *(id *)(a1 + 32);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
              id v13 = [v12 makeDialogRequest];
              id v14 = *(void **)(a1 + 40);
              id v15 = [v13 metricsEvent];
              id v16 = [v15 underlyingDictionary];
              id v17 = (id)[v14 enqueueData:v16];

              id v18 = _ICQGetLogSystem();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = [v13 metricsEvent];
                id v20 = [v19 underlyingDictionary];
                *(_DWORD *)buf = 138412290;
                long long v36 = v20;
                _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent from AMSDialogRequest to AMSEngagement: %@", buf, 0xCu);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v9);
        }

        uint64_t v2 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v23);
  }
}

+ (void)_sendSubscriptionChangedEvent
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__7;
  v16[4] = __Block_byref_object_dispose__7;
  id v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  id v15 = 0;
  id v3 = dispatch_group_create();
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Requesting current storage level", buf, 2u);
  }

  dispatch_group_enter(v3);
  id v5 = +[ICQOfferManager sharedOfferManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke;
  v9[3] = &unk_1E6A533A8;
  id v11 = v16;
  id v12 = v14;
  id v6 = v3;
  uint64_t v10 = v6;
  [v5 getPremiumOfferWithCompletion:v9];

  id v7 = dispatch_get_global_queue(33, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke_79;
  v8[3] = &unk_1E6A533D0;
  v8[5] = v14;
  v8[6] = a1;
  v8[4] = v16;
  dispatch_group_notify(v6, v7, v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 commerceQuotaInfo];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [v5 bundleQuotaInfo];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v19 = 138412546;
      id v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      id v16 = "Current iCloudStorageLevel: %@ appleOneStorageLevel %@";
      id v17 = v13;
      uint32_t v18 = 22;
LABEL_6:
      _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    }
  }
  else
  {
    id v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      id v16 = "No premium offer return with error: %@";
      id v17 = v13;
      uint32_t v18 = 12;
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__ICQEngagementReporter__sendSubscriptionChangedEvent__block_invoke_79(uint64_t a1)
{
  void v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 48) _eventNameForEngagementType:3];
  v16[0] = @"eventType";
  v16[1] = @"bundleId";
  v17[0] = v2;
  v17[1] = @"com.apple.iCloudQuotaUI";
  v16[2] = @"newiCloudStoragePlan";
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v4;
  v16[3] = @"newAppleOneStoragePlan";
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (v5)
  {
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

LABEL_7:
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4DD60]) initWithUnderlyingDictionary:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F4DC70]);
  uint64_t v10 = [v8 underlyingDictionary];
  id v11 = (id)[v9 enqueueData:v10];

  id v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 underlyingDictionary];
    int v14 = 138412290;
    uint64_t v15 = v13;
    _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Enqueued metricEvent to AMSEngagement: %@", (uint8_t *)&v14, 0xCu);
  }
}

+ (id)_eventNameForEngagementType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"iCloudQuota:dismissal";
  }
  else {
    return off_1E6A533F0[a3];
  }
}

+ (id)_placementDictionary
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.mobileslideshow";
  v4[1] = @"com.apple.Home";
  v5[0] = @"photosLibraryFooter";
  v5[1] = @"homeDashboardHeader";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

void __76__ICQEngagementReporter_shouldShowOpportunityBubbleWithBundleID_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Received error from amsngagementd %@", (uint8_t *)&v4, 0xCu);
}

@end