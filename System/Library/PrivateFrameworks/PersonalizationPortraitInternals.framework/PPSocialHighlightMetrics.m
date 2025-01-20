@interface PPSocialHighlightMetrics
+ (BOOL)_queryLinksWithFetchAttributes:(id)a3 interval:(double)a4 handler:(id)a5;
+ (double)hoursFromSeconds:(double)a3;
+ (id)SMSBucketDescriptionWithShouldContinueBlock:(id)a3;
+ (id)_countSentMessagesInLastWeekMatchingChatType:(id)a3 shouldContinueBlock:(id)a4;
+ (id)_loggableToggleStatus:(unsigned __int8)a3;
+ (id)allHighlightIdentifiersReceivedWithShouldContinueBlock:(id)a3;
+ (id)countIMessagesSentInPastWeekWithShouldContinueBlock:(id)a3;
+ (id)countSMSSentInPastWeekWithShouldContinueBlock:(id)a3;
+ (id)feedbackTypeCountsByHighlightIdentifierInInterval:(double)a3 forTVOS:(BOOL)a4;
+ (id)hasSentIMessageWithShouldContinueBlock:(id)a3;
+ (id)hasSentSMSWithShouldContinueBlock:(id)a3;
+ (id)highlightsReceivedInInterval:(double)a3 shouldContinueBlock:(id)a4;
+ (id)iMessageBucketDescriptionWithShouldContinueBlock:(id)a3;
+ (id)logExpiredLinkStatsWithHighlights:(id)a3 shouldContinueBlock:(id)a4;
+ (id)sendLinkExpiredMessagesForFeedbackCountsByHighlightId:(id)a3 tvFeedbackCountsByHighlightId:(id)a4 highlights:(id)a5;
+ (id)unsupportedClientsFromPastDayWithShouldContinueBlock:(id)a3;
+ (unint64_t)countAllLinksReceivedInMessages;
+ (void)_recordTipsContentEvent:(id)a3;
+ (void)logConsumptionByClientWithShouldContinueBlock:(id)a3;
+ (void)logFeedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5;
+ (void)logFeedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5;
+ (void)logLinkExpiredMetricsForHighlight:(id)a3 feedbackCountsByClient:(id)a4 forTVOS:(BOOL)a5;
+ (void)logMatchedFeedbackForHighlightMatches:(id)a3 batchSize:(unint64_t)a4 type:(int)a5 client:(id)a6;
+ (void)registerCTSDataCollection;
+ (void)registerClientLinkStatus;
+ (void)registerCountLinks;
+ (void)registerDeviceSettingsCollection;
+ (void)registerExpiredLinkReview;
+ (void)registerLogConsumedByClient;
+ (void)registerSampledUnsupportedClientLogging;
@end

@implementation PPSocialHighlightMetrics

+ (id)hasSentSMSWithShouldContinueBlock:(id)a3
{
  v3 = [a1 countSMSSentInPastWeekWithShouldContinueBlock:a3];
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "unsignedIntegerValue") != 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)hasSentIMessageWithShouldContinueBlock:(id)a3
{
  v3 = [a1 countIMessagesSentInPastWeekWithShouldContinueBlock:a3];
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "unsignedIntegerValue") != 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)SMSBucketDescriptionWithShouldContinueBlock:(id)a3
{
  v3 = [a1 countSMSSentInPastWeekWithShouldContinueBlock:a3];
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 unsignedIntegerValue];
    v6 = @"1-3";
    v7 = @"11+";
    if (v5 < 0xB) {
      v7 = @"4-10";
    }
    if (v5 >= 4) {
      v6 = v7;
    }
    if (v5) {
      v8 = v6;
    }
    else {
      v8 = @"0";
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)iMessageBucketDescriptionWithShouldContinueBlock:(id)a3
{
  v3 = [a1 countIMessagesSentInPastWeekWithShouldContinueBlock:a3];
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 unsignedIntegerValue];
    v6 = @"1-3";
    v7 = @"11+";
    if (v5 < 0xB) {
      v7 = @"4-10";
    }
    if (v5 >= 4) {
      v6 = v7;
    }
    if (v5) {
      v8 = v6;
    }
    else {
      v8 = @"0";
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)countSMSSentInPastWeekWithShouldContinueBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&kPPSentSMSLock);
  unsigned int v5 = (void *)kPPSentSMSCount;
  if (!kPPSentSMSCount)
  {
    uint64_t v6 = [a1 _countSentMessagesInLastWeekMatchingChatType:@"SMS" shouldContinueBlock:v4];
    v7 = (void *)kPPSentSMSCount;
    kPPSentSMSCount = v6;

    unsigned int v5 = (void *)kPPSentSMSCount;
  }
  id v8 = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)&kPPSentSMSLock);

  return v8;
}

+ (id)countIMessagesSentInPastWeekWithShouldContinueBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&kPPSentIMessagesLock);
  unsigned int v5 = (void *)kPPSentIMessagesCount;
  if (!kPPSentIMessagesCount)
  {
    uint64_t v6 = [a1 _countSentMessagesInLastWeekMatchingChatType:@"iMessage" shouldContinueBlock:v4];
    v7 = (void *)kPPSentIMessagesCount;
    kPPSentIMessagesCount = v6;

    unsigned int v5 = (void *)kPPSentIMessagesCount;
  }
  id v8 = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)&kPPSentIMessagesLock);

  return v8;
}

+ (void)registerDeviceSettingsCollection
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a1;
  v5[5] = a2;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.SocialHighlightSettingsCollection", v4, v5);
}

void __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  v27 = &v28;
  id v4 = v3;
  id v26 = v4;
  unsigned int v5 = _Block_copy(aBlock);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_3;
  v22 = &unk_1E65D8BF0;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v23 = v6;
  uint64_t v24 = v7;
  id v8 = (void (**)(void))_Block_copy(&v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  v9 = pp_maintenance_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = pp_maintenance_signpost_handle();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SocialHighlightSettingsCollection", "", buf, 2u);
  }

  v8[2](v8);
  v13 = pp_maintenance_signpost_handle();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v15 = *((unsigned __int8 *)v29 + 24);
    *(_DWORD *)buf = 67109120;
    int v33 = v15;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_END, v10, "SocialHighlightSettingsCollection", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v29 + 24)) {
    v16 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    v16 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v16);
  if (*((unsigned char *)v29 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      v18 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v19, v20, v21, v22);
      [v18 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPSocialHighlightMetrics.m" lineNumber:1110 description:@"Unexpected failure of deferral"];
    }
    v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: SocialHighlightSettingsCollection: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __60__PPSocialHighlightMetrics_registerDeviceSettingsCollection__block_invoke_3(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v2, "automaticSharingEnabled"));
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = objc_opt_new();
    [v4 setObject:v3 forKeyedSubscript:@"automaticSharingEnabled"];
    unsigned int v5 = [*(id *)(a1 + 40) iMessageBucketDescriptionWithShouldContinueBlock:*(void *)(a1 + 32)];
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      id v6 = [*(id *)(a1 + 40) SMSBucketDescriptionWithShouldContinueBlock:*(void *)(a1 + 32)];
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
      {
        uint64_t v7 = [*(id *)(a1 + 40) hasSentIMessageWithShouldContinueBlock:*(void *)(a1 + 32)];
        if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          id v8 = [*(id *)(a1 + 40) hasSentSMSWithShouldContinueBlock:*(void *)(a1 + 32)];
          if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
          {
            v9 = +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", [v2 automaticSharingEnabledForClient:*MEMORY[0x1E4F8A030] error:0]);
            [v4 setObject:v9 forKeyedSubscript:@"tvAutomaticSharing"];

            os_signpost_id_t v10 = +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", [v2 automaticSharingEnabledForClient:*MEMORY[0x1E4F8A008] error:0]);
            [v4 setObject:v10 forKeyedSubscript:@"newsAutomaticSharing"];

            v11 = +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", [v2 automaticSharingEnabledForClient:*MEMORY[0x1E4F8A000] error:0]);
            [v4 setObject:v11 forKeyedSubscript:@"musicAutomaticSharing"];

            v12 = +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", [v2 automaticSharingEnabledForClient:*MEMORY[0x1E4F8A018] error:0]);
            [v4 setObject:v12 forKeyedSubscript:@"podcastsAutomaticSharing"];

            v13 = +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", [v2 automaticSharingEnabledForClient:*MEMORY[0x1E4F8A010] error:0]);
            [v4 setObject:v13 forKeyedSubscript:@"photosAutomaticSharing"];

            v14 = +[PPSocialHighlightMetrics _loggableToggleStatus:](PPSocialHighlightMetrics, "_loggableToggleStatus:", [v2 automaticSharingEnabledForClient:*MEMORY[0x1E4F8A020] error:0]);
            [v4 setObject:v14 forKeyedSubscript:@"safariAutomaticSharing"];

            if (v5)
            {
              [v4 setObject:v5 forKeyedSubscript:@"iMesssageBucket"];
            }
            else
            {
              v16 = [MEMORY[0x1E4F1CA98] null];
              [v4 setObject:v16 forKeyedSubscript:@"iMesssageBucket"];
            }
            if (v6)
            {
              [v4 setObject:v6 forKeyedSubscript:@"SMSBucket"];
            }
            else
            {
              v17 = [MEMORY[0x1E4F1CA98] null];
              [v4 setObject:v17 forKeyedSubscript:@"SMSBucket"];
            }
            if (v7)
            {
              [v4 setObject:v7 forKeyedSubscript:@"activeiMessageUser"];
            }
            else
            {
              v18 = [MEMORY[0x1E4F1CA98] null];
              [v4 setObject:v18 forKeyedSubscript:@"activeiMessageUser"];
            }
            if (v8)
            {
              [v4 setObject:v8 forKeyedSubscript:@"activeSMSUser"];
            }
            else
            {
              uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
              [v4 setObject:v19 forKeyedSubscript:@"activeSMSUser"];
            }
            if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
              +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.SettingsStatus" payload:v4 inBackground:1];
            }
          }
          else
          {
            int v15 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v20 = 0;
              _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collection during message counts fetching.", v20, 2u);
            }
          }
        }
        else
        {
          id v8 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collection during message counts fetching.", v21, 2u);
          }
        }
      }
      else
      {
        uint64_t v7 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collection during message counts fetching.", v22, 2u);
        }
      }
    }
    else
    {
      id v6 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring settings collectionduring message counts fetching.", buf, 2u);
      }
    }
  }
}

+ (id)_loggableToggleStatus:(unsigned __int8)a3
{
  if (a3)
  {
    if (a3 == 1) {
      unsigned int v5 = (void *)MEMORY[0x1E4F1CC28];
    }
    else {
      unsigned int v5 = (void *)MEMORY[0x1E4F1CC38];
    }
  }
  else
  {
    unsigned int v5 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v3);
  }
  return v5;
}

+ (void)registerExpiredLinkReview
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a2;
  v5[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ExpiredLinkReview", v4, v5);
}

void __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  unsigned int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  id v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ExpiredLinkReview", "", buf, 2u);
  }

  v7[2](v7);
  v12 = pp_maintenance_signpost_handle();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ExpiredLinkReview", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    int v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPSocialHighlightMetrics.m" lineNumber:1023 description:@"Unexpected failure of deferral"];
    }
    v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: ExpiredLinkReview: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_3(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  id v27 = 0;
  id v4 = [v2 autoDonatingChatsWithShouldContinueBlock:v3 error:&v27];
  id v5 = v27;
  id v28 = v5;
  if (v4)
  {
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      *(void *)&long long v31 = 0;
      *((void *)&v31 + 1) = &v31;
      uint64_t v32 = 0x3032000000;
      int v33 = __Block_byref_object_copy__8524;
      uint64_t v34 = __Block_byref_object_dispose__8525;
      id v35 = 0;
      id v6 = +[PPSQLDatabase sharedInstance];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_307;
      v26[3] = &unk_1E65DAC20;
      v26[4] = &v31;
      [v6 readTransactionWithClient:6 block:v26];

      if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
      {
        os_signpost_id_t v10 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link review after last date.", buf, 2u);
        }
        goto LABEL_26;
      }
      id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      id v8 = +[PPConfiguration sharedInstance];
      [v8 socialHighlightFeedbackDeletionInterval];
      os_signpost_id_t v10 = [v7 initWithTimeIntervalSinceNow:-v9];

      id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [*(id *)(*((void *)&v31 + 1) + 40) doubleValue];
      v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
      [v12 timeIntervalSinceNow];
      double v14 = v13;

      if (v14 > 0.0)
      {
        int v15 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          double v30 = -v14;
          _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: lastProcessedTimeSinceNow is in the future! %f", buf, 0xCu);
        }
        goto LABEL_25;
      }
      v18 = [v2 allSupportedHighlightsForAutoDonatingChats:v4 error:&v28];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_313;
      v24[3] = &unk_1E65DB1B0;
      uint64_t v25 = v10;
      id v19 = objc_msgSend(v18, "_pas_filteredArrayWithTest:", v24);

      if ([v19 count])
      {
        if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          uint64_t v20 = +[PPSocialHighlightMetrics logExpiredLinkStatsWithHighlights:v19 shouldContinueBlock:*(void *)(a1 + 32)];
          if (v20)
          {
            objc_storeStrong((id *)(*((void *)&v31 + 1) + 40), v20);
            id v21 = +[PPSQLDatabase sharedInstance];
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_315;
            v23[3] = &unk_1E65D6B18;
            v23[4] = &v31;
            [v21 writeTransactionWithClient:6 block:v23];
          }
          goto LABEL_24;
        }
        uint64_t v20 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v22 = "PPSocialHighlightMetrics: deferred while constructing highlight array";
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v20 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v22 = "PPSocialHighlightMetrics: no highlights have expired.";
LABEL_23:
          _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
        }
      }
LABEL_24:

      int v15 = v25;
LABEL_25:

LABEL_26:
      _Block_object_dispose(&v31, 8);

      goto LABEL_27;
    }
    v17 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link review after fetching chats.", (uint8_t *)&v31, 2u);
    }
  }
  else
  {
    id v16 = v5;
    v17 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v31) = 138412290;
      *(void *)((char *)&v31 + 4) = v16;
      _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch auto donating chats: %@", (uint8_t *)&v31, 0xCu);
    }
  }

LABEL_27:
}

uint64_t __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_307(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[PPSQLKVStore numberForKey:@"lastProcessedSocialHighlightLinkDate" transaction:a2];
  return MEMORY[0x1F41817F8]();
}

BOOL __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F89FC8];
  [a2 contentCreationSecondsSinceReferenceDate];
  double v5 = v4;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  return [v3 compareDouble:v5 withDouble:v6] == -1;
}

uint64_t __53__PPSocialHighlightMetrics_registerExpiredLinkReview__block_invoke_315(uint64_t a1, uint64_t a2)
{
  return +[PPSQLKVStore setNumber:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forKey:@"lastProcessedSocialHighlightLinkDate" transaction:a2];
}

+ (id)logExpiredLinkStatsWithHighlights:(id)a3 shouldContinueBlock:(id)a4
{
  double v6 = (uint64_t (**)(void))a4;
  id v7 = [a3 sortedArrayUsingComparator:&__block_literal_global_304];
  id v8 = +[PPConfiguration sharedInstance];
  [v8 socialHighlightFeedbackDeletionInterval];
  double v9 = +[PPSocialHighlightMetrics feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:](PPSocialHighlightMetrics, "feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:", 0);

  if (v6[2](v6))
  {
    os_signpost_id_t v10 = +[PPConfiguration sharedInstance];
    [v10 socialHighlightFeedbackDeletionInterval];
    id v11 = +[PPSocialHighlightMetrics feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:](PPSocialHighlightMetrics, "feedbackTypeCountsByHighlightIdentifierInInterval:forTVOS:", 1);

    if (v6[2](v6))
    {
      v12 = [a1 sendLinkExpiredMessagesForFeedbackCountsByHighlightId:v9 tvFeedbackCountsByHighlightId:v11 highlights:v7];
      goto LABEL_10;
    }
    double v13 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferred after tv feedback count generation.", v15, 2u);
    }
  }
  else
  {
    id v11 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferred after feedback count generation.", buf, 2u);
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

uint64_t __82__PPSocialHighlightMetrics_logExpiredLinkStatsWithHighlights_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 contentCreationSecondsSinceReferenceDate];
  double v7 = v6;
  [v5 contentCreationSecondsSinceReferenceDate];
  double v9 = v8;

  return [v4 compareDouble:v7 withDouble:v9];
}

+ (id)sendLinkExpiredMessagesForFeedbackCountsByHighlightId:(id)a3 tvFeedbackCountsByHighlightId:(id)a4 highlights:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v33 = a4;
  id v9 = a5;
  if (![v9 count])
  {
    double v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PPSocialHighlightMetrics.m", 903, @"Invalid parameter not satisfying: %@", @"highlights.count > 0" object file lineNumber description];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v11)
  {

LABEL_16:
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PPSocialHighlightMetrics.m", 913, @"This value must not be nil, as the highlight array has contents." object file lineNumber description];

    double v13 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  long long v31 = a2;
  id v32 = a1;
  double v13 = 0;
  uint64_t v14 = *(void *)v37;
  do
  {
    uint64_t v15 = 0;
    uint64_t v35 = v12;
    do
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v36 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x1CB79D060]();
      uint64_t v18 = [v16 highlightIdentifier];
      if (v18)
      {
        id v19 = (void *)v18;
        int v20 = [v16 hasContentCreationSecondsSinceReferenceDate];

        if (v20)
        {
          uint64_t v21 = v14;
          v22 = v13;
          uint64_t v23 = [v16 highlightIdentifier];
          uint64_t v24 = [v33 objectForKeyedSubscript:v23];
          +[PPSocialHighlightMetrics logLinkExpiredMetricsForHighlight:v16 feedbackCountsByClient:v24 forTVOS:1];

          uint64_t v25 = [v16 highlightIdentifier];
          char v26 = [v34 objectForKeyedSubscript:v25];
          +[PPSocialHighlightMetrics logLinkExpiredMetricsForHighlight:v16 feedbackCountsByClient:v26 forTVOS:0];

          id v27 = NSNumber;
          [v16 contentCreationSecondsSinceReferenceDate];
          double v13 = objc_msgSend(v27, "numberWithDouble:");

          uint64_t v14 = v21;
          uint64_t v12 = v35;
        }
      }
      ++v15;
    }
    while (v12 != v15);
    uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v12);

  a2 = v31;
  a1 = v32;
  if (!v13) {
    goto LABEL_16;
  }
LABEL_17:

  return v13;
}

+ (void)logLinkExpiredMetricsForHighlight:(id)a3 feedbackCountsByClient:(id)a4 forTVOS:(BOOL)a5
{
  BOOL v5 = a5;
  v61[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v49 = a4;
  double v8 = [v49 allKeys];
  id v9 = v8;
  if (!v8) {
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = objc_msgSend(v8, "_pas_shuffledArrayUsingRng:", 0);

  uint64_t v11 = (void *)MEMORY[0x1CB79D060]();
  v60[0] = @"forTVOS";
  uint64_t v12 = [NSNumber numberWithBool:v5];
  v60[1] = @"isManualHighlight";
  v61[0] = v12;
  v45 = v7;
  double v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "highlightType") == 2);
  v61[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];

  v48 = (void *)[v14 mutableCopy];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v15 = v10;
  uint64_t v50 = [v15 countByEnumeratingWithState:&v55 objects:v59 count:16];
  int v16 = 0;
  if (v50)
  {
    id obj = v15;
    uint64_t v47 = *(void *)v56;
    int v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v56 != v47) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        context = (void *)MEMORY[0x1CB79D060]();
        int v20 = [v49 objectForKeyedSubscript:v19];
        uint64_t v21 = [v20 objectForKeyedSubscript:&unk_1F2568DF8];
        int v53 = v16 | [v21 BOOLValue];

        v22 = [v49 objectForKeyedSubscript:v19];
        uint64_t v23 = [v22 objectForKeyedSubscript:&unk_1F2568E10];
        uint64_t v24 = [v23 unsignedIntegerValue];

        uint64_t v25 = [v49 objectForKeyedSubscript:v19];
        char v26 = [v25 objectForKeyedSubscript:&unk_1F2568E28];
        uint64_t v27 = [v26 unsignedIntegerValue];

        id v28 = [v49 objectForKeyedSubscript:v19];
        uint64_t v29 = [v28 objectForKeyedSubscript:&unk_1F2568E40];
        uint64_t v51 = [v29 unsignedIntegerValue];

        double v30 = objc_msgSend(v19, "_pas_stringBackedByUTF8CString");
        long long v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"client%u", v17);
        id v32 = objc_msgSend(v31, "_pas_stringBackedByUTF8CString");
        [v48 setObject:v30 forKeyedSubscript:v32];

        id v33 = [NSNumber numberWithUnsignedInteger:v24];
        id v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"countConsumedClient%u", v17);
        uint64_t v35 = objc_msgSend(v34, "_pas_stringBackedByUTF8CString");
        [v48 setObject:v33 forKeyedSubscript:v35];

        long long v36 = [NSNumber numberWithUnsignedInteger:v27];
        long long v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"countDisplayedClient%u", v17);
        long long v38 = objc_msgSend(v37, "_pas_stringBackedByUTF8CString");
        [v48 setObject:v36 forKeyedSubscript:v38];

        long long v39 = [NSNumber numberWithUnsignedInteger:v51];
        v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"countActivityClient%u", v17);
        uint64_t v41 = objc_msgSend(v40, "_pas_stringBackedByUTF8CString");
        [v48 setObject:v39 forKeyedSubscript:v41];

        int v16 = v53;
        ++v17;
      }
      id v15 = obj;
      uint64_t v50 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v50);
  }

  if ((unint64_t)[v15 count] > 3
    || (unint64_t)[v15 count] >= 3
    && ([v15 containsObject:&stru_1F253DF18] & 1) == 0)
  {
    v42 = pp_default_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_FAULT, "PPSocialHighlightMetrics: excessive clients found providing feedback for this highlight identifier. This may result in dropped metrics.", buf, 2u);
    }
  }
  v43 = (void *)MEMORY[0x1CB79D060]();
  v44 = [NSNumber numberWithBool:v16 & 1];
  [v48 setObject:v44 forKeyedSubscript:@"isHidden"];

  +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.LinkExpired" payload:v48 inBackground:1];
}

+ (id)feedbackTypeCountsByHighlightIdentifierInInterval:(double)a3 forTVOS:(BOOL)a4
{
  BOOL v4 = a4;
  double v8 = objc_opt_new();
  id v9 = [v8 feedbackPublisherWithInterval:v4 includingRemote:a3];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-a3];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__8524;
  id v28 = __Block_byref_object_dispose__8525;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke;
  v21[3] = &unk_1E65D9D28;
  id v11 = v10;
  id v22 = v11;
  BOOL v23 = v4;
  uint64_t v12 = [v9 filterWithIsIncluded:v21];
  double v13 = objc_opt_new();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_2;
  v20[3] = &__block_descriptor_48_e67___NSMutableDictionary_24__0__NSMutableDictionary_8__BMStoreEvent_16l;
  v20[4] = a2;
  v20[5] = a1;
  uint64_t v14 = [v12 reduceWithInitial:v13 nextPartialResult:v20];
  id v15 = [v14 collect];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_261;
  v19[3] = &unk_1E65DAFF8;
  v19[4] = &v24;
  id v16 = (id)[v15 sinkWithCompletion:&__block_literal_global_260 receiveInput:v19];

  id v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

uint64_t __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1CB79D060]();
  BOOL v5 = [v3 eventBody];
  double v6 = [v5 highlight];
  id v7 = [v6 highlightIdentifier];

  if (v7)
  {
    double v8 = [v3 eventBody];
    uint64_t v9 = [v8 feedbackType];

    if (v9 == 2)
    {
      id v10 = [v3 eventBody];
      id v11 = [v10 feedbackCreationDate];
      uint64_t v12 = [v11 compare:*(void *)(a1 + 32)] != -1;
    }
    else
    {
      int v13 = *(unsigned __int8 *)(a1 + 40);
      uint64_t v14 = [v3 eventBody];
      id v10 = v14;
      if (v13)
      {
        id v11 = [v14 clientIdentifier];
        uint64_t v12 = [v11 isEqualToString:*MEMORY[0x1E4F8A038]];
      }
      else
      {
        id v11 = [v14 highlight];
        id v15 = [v11 isPrimary];
        id v16 = v15;
        if (!v15) {
          id v15 = (void *)MEMORY[0x1E4F1CC38];
        }
        if ([v15 BOOLValue])
        {
          id v17 = [v3 eventBody];
          uint64_t v18 = [v17 clientIdentifier];
          uint64_t v12 = v18 != 0;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  context = (void *)MEMORY[0x1CB79D060]();
  id v7 = [v6 eventBody];
  double v8 = [v7 highlight];
  uint64_t v9 = [v8 highlightIdentifier];

  id v10 = [v6 eventBody];
  uint64_t v11 = [v10 clientIdentifier];
  uint64_t v12 = (void *)v11;
  int v13 = &stru_1F253DF18;
  if (v11) {
    int v13 = (__CFString *)v11;
  }
  uint64_t v14 = v13;

  if (!v9)
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPSocialHighlightMetrics.m" lineNumber:847 description:@"Highlight identifier has been checked in the filter clause to be nonnull"];
  }
  id v15 = [v5 objectForKeyedSubscript:v9];

  if (!v15)
  {
    id v16 = objc_opt_new();
    [v5 setObject:v16 forKeyedSubscript:v9];
  }
  id v17 = [v5 objectForKeyedSubscript:v9];
  uint64_t v18 = [v17 objectForKeyedSubscript:v14];

  if (!v18)
  {
    id v19 = objc_opt_new();
    int v20 = [v5 objectForKeyedSubscript:v9];
    [v20 setObject:v19 forKeyedSubscript:v14];
  }
  uint64_t v21 = [v5 objectForKeyedSubscript:v9];
  id v22 = [v21 objectForKeyedSubscript:v14];
  BOOL v23 = NSNumber;
  uint64_t v24 = [v6 eventBody];
  uint64_t v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "feedbackType"));
  uint64_t v26 = [v22 objectForKeyedSubscript:v25];
  uint64_t v27 = v6;
  uint64_t v28 = [v26 unsignedIntegerValue];

  id v29 = [NSNumber numberWithUnsignedInteger:v28 + 1];
  double v30 = [v5 objectForKeyedSubscript:v9];
  long long v31 = [v30 objectForKeyedSubscript:v14];
  id v32 = NSNumber;
  id v33 = [v27 eventBody];
  id v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "feedbackType"));
  [v31 setObject:v29 forKeyedSubscript:v34];

  id v35 = v5;

  return v35;
}

void __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_261(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __86__PPSocialHighlightMetrics_feedbackTypeCountsByHighlightIdentifierInInterval_forTVOS___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    uint64_t v3 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [v2 error];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: failed to collect highlight feedback counts: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (void)registerCountLinks
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14228]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a1;
  v5[5] = a2;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LinkStatusGeneration", v4, v5);
}

void __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v27 = &v28;
  id v4 = v3;
  id v26 = v4;
  int v5 = _Block_copy(aBlock);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_3;
  id v22 = &unk_1E65D8BF0;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v23 = v6;
  uint64_t v24 = v7;
  double v8 = (void (**)(void))_Block_copy(&v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v9 = pp_maintenance_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = pp_maintenance_signpost_handle();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "LinkStatusGeneration", "", buf, 2u);
  }

  v8[2](v8);
  int v13 = pp_maintenance_signpost_handle();
  uint64_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v15 = *((unsigned __int8 *)v29 + 24);
    *(_DWORD *)buf = 67109120;
    int v33 = v15;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_END, v10, "LinkStatusGeneration", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v29 + 24)) {
    id v16 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v16 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v16);
  if (*((unsigned char *)v29 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v19, v20, v21, v22);
      [v18 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPSocialHighlightMetrics.m" lineNumber:814 description:@"Unexpected failure of deferral"];
    }
    id v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: LinkStatusGeneration: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v28, 8);
}

uint64_t __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __46__PPSocialHighlightMetrics_registerCountLinks__block_invoke_3(uint64_t a1)
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  unint64_t v3 = +[PPSocialHighlightMetrics countAllLinksReceivedInMessages];
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    v52 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats after messages count.", buf, 2u);
    }

    goto LABEL_99;
  }
  id obj = 0;
  id location = 0;
  id v4 = [v2 autoDonatingChatsWithShouldContinueBlock:*(void *)(a1 + 32) error:&obj];
  objc_storeStrong(&location, obj);
  if (!v4)
  {
    int v5 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v118 = location;
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch auto donating chats (potentially deferred). %@", buf, 0xCu);
    }
    goto LABEL_98;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    int v5 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats after fetching autodonating chats.", buf, 2u);
    }
    goto LABEL_98;
  }
  int v5 = [v2 allSupportedHighlightsForAutoDonatingChats:v4 error:&location];
  if (!v5)
  {
    log = pp_social_highlights_log_handle();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v118 = location;
      _os_log_error_impl(&dword_1CA9A8000, log, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch highlights, will retry at a later date: %@", buf, 0xCu);
    }
    goto LABEL_97;
  }
  uint64_t v95 = a1;
  unint64_t v92 = v3;
  log = objc_opt_new();
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v94 = v5;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v108 objects:v124 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v109 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        uint64_t v12 = [v11 highlightIdentifier];

        if (v12)
        {
          int v13 = [v11 highlightIdentifier];
          uint64_t v14 = [log objectForKeyedSubscript:v13];

          if (!v14)
          {
            int v15 = objc_opt_new();
            id v16 = [v11 highlightIdentifier];
            [log setObject:v15 forKeyedSubscript:v16];
          }
          id v17 = [v11 attributionIdentifier];

          if (v17)
          {
            uint64_t v18 = [v11 highlightIdentifier];
            uint64_t v19 = [log objectForKeyedSubscript:v18];
            uint64_t v20 = [v11 attributionIdentifier];
            [v19 addObject:v20];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v108 objects:v124 count:16];
    }
    while (v8);
  }

  uint64_t v21 = v95;
  id v22 = +[PPSocialHighlightMetrics allHighlightIdentifiersReceivedWithShouldContinueBlock:*(void *)(v95 + 32)];
  if (!v22)
  {
    uint64_t v25 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: Unable to fetch, or requested to defer fetching of highlight identifiers.", buf, 2u);
    }
    int v5 = v94;
    goto LABEL_96;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v24 = [log allKeys];
  uint64_t v25 = [v23 initWithArray:v24];

  [v22 minusSet:v25];
  v97 = objc_opt_new();
  uint64_t v26 = [v22 count];
  uint64_t v27 = [*(id *)(v95 + 40) iMessageBucketDescriptionWithShouldContinueBlock:*(void *)(v95 + 32)];
  if (((*(uint64_t (**)(void))(*(void *)(v95 + 32) + 16))() & 1) == 0)
  {
    uint64_t v28 = pp_social_highlights_log_handle();
    int v5 = v94;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }
    goto LABEL_95;
  }
  uint64_t v74 = v26;
  uint64_t v28 = [*(id *)(v95 + 40) SMSBucketDescriptionWithShouldContinueBlock:*(void *)(v95 + 32)];
  if (((*(uint64_t (**)(void))(*(void *)(v95 + 32) + 16))() & 1) == 0)
  {
    int v53 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v53, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }
    int v5 = v94;
    goto LABEL_94;
  }
  uint64_t v76 = [*(id *)(v95 + 40) hasSentIMessageWithShouldContinueBlock:*(void *)(v95 + 32)];
  if (((*(uint64_t (**)(void))(*(void *)(v95 + 32) + 16))() & 1) == 0)
  {
    v54 = pp_social_highlights_log_handle();
    int v5 = v94;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }
    int v53 = v76;
    goto LABEL_93;
  }
  uint64_t v71 = [*(id *)(v95 + 40) hasSentSMSWithShouldContinueBlock:*(void *)(v95 + 32)];
  if (((*(uint64_t (**)(void))(*(void *)(v95 + 32) + 16))() & 1) == 0)
  {
    long long v55 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring link stats during message counts fetching.", buf, 2u);
    }

LABEL_91:
    int v5 = v94;
    goto LABEL_92;
  }
  v67 = v25;
  v68 = v22;
  v69 = v28;
  v70 = v27;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v75 = v6;
  v73 = v4;
  uint64_t v81 = [v75 countByEnumeratingWithState:&v104 objects:v123 count:16];
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  if (!v81)
  {
    uint64_t v77 = 0;
    goto LABEL_70;
  }
  uint64_t v77 = 0;
  uint64_t v79 = *(void *)v105;
  v72 = v2;
  while (2)
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v105 != v79) {
        objc_enumerationMutation(v75);
      }
      uint64_t v34 = *(void **)(*((void *)&v104 + 1) + 8 * v33);
      id v35 = (void *)MEMORY[0x1CB79D060]();
      if (((*(uint64_t (**)(void))(*(void *)(v21 + 32) + 16))() & 1) == 0)
      {
        long long v56 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: link stats deferring.", buf, 2u);
        }
        id v22 = v68;
        uint64_t v28 = v69;
        uint64_t v27 = v70;
        uint64_t v25 = v67;
        goto LABEL_90;
      }
      uint64_t v90 = v33;
      long long v36 = [v34 highlightIdentifier];

      if (!v36) {
        goto LABEL_40;
      }
      v88 = v35;
      uint64_t v84 = v31;
      long long v37 = [v34 highlightIdentifier];
      long long v38 = [log objectForKeyedSubscript:v37];
      uint64_t v83 = [v38 count];

      v86 = [v34 highlightIdentifier];
      long long v39 = [log objectForKeyedSubscript:v86];
      v40 = [v39 allObjects];
      id v103 = location;
      uint64_t v41 = [v2 attributionsForIdentifiers:v40 error:&v103];
      objc_storeStrong(&location, v103);
      v42 = [v41 allValues];

      if (!v42)
      {
        long long v56 = pp_social_highlights_log_handle();
        id v35 = v88;
        uint64_t v25 = v67;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v64 = [v34 highlightIdentifier];
          v65 = [v34 highlightIdentifier];
          v66 = [log objectForKeyedSubscript:v65];
          *(_DWORD *)buf = 138412802;
          id v118 = v64;
          __int16 v119 = 2112;
          v120 = v66;
          __int16 v121 = 2112;
          id v122 = location;
          _os_log_error_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch attributions for highlight: %@, attributions %@, will try again at a later date: %@", buf, 0x20u);

          id v35 = v88;
        }
        id v22 = v68;
        uint64_t v28 = v69;
        uint64_t v27 = v70;
LABEL_90:

        goto LABEL_91;
      }
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v43 = v42;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v99 objects:v116 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        char v46 = 0;
        uint64_t v47 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v100 != v47) {
              objc_enumerationMutation(v43);
            }
            id v49 = *(void **)(*((void *)&v99 + 1) + 8 * j);
            uint64_t v50 = [v49 conversationIdentifier];
            [v97 addObject:v50];

            unsigned int v51 = [v49 isStarred];
            v29 += v51;
            v30 += v51 ^ 1;
            v46 |= v51;
            v32 += [v49 isFromMe];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v99 objects:v116 count:16];
        }
        while (v45);

        v77 += v46 & 1;
        id v2 = v72;
        id v4 = v73;
      }
      else
      {
      }
      uint64_t v31 = v83 + v84;

      uint64_t v21 = v95;
      id v35 = v88;
LABEL_40:
      uint64_t v33 = v90 + 1;
    }
    while (v90 + 1 != v81);
    uint64_t v81 = [v75 countByEnumeratingWithState:&v104 objects:v123 count:16];
    if (v81) {
      continue;
    }
    break;
  }
LABEL_70:

  v114[0] = @"urlsInMessages";
  v96 = [NSNumber numberWithUnsignedInteger:v92];
  v115[0] = v96;
  v114[1] = @"manuallyHighlightedLinks";
  v93 = [NSNumber numberWithUnsignedInteger:v29];
  v115[1] = v93;
  v114[2] = @"automaticallyHighlightedLinks";
  v91 = [NSNumber numberWithUnsignedInteger:v30];
  v115[2] = v91;
  v114[3] = @"totalLinkCount";
  v89 = [NSNumber numberWithUnsignedInteger:v31];
  v115[3] = v89;
  v114[4] = @"uniqueLinkCount";
  v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v75, "count"));
  v115[4] = v87;
  v114[5] = @"uniqueChats";
  v85 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
  v115[5] = v85;
  v114[6] = @"autoDonatingChats";
  v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v115[6] = v82;
  v114[7] = @"uniqueManuallyHighlightedLinks";
  v80 = [NSNumber numberWithUnsignedInteger:v77];
  v115[7] = v80;
  v114[8] = @"outboundLinks";
  v78 = [NSNumber numberWithUnsignedInteger:v32];
  v115[8] = v78;
  v114[9] = @"automaticSyndicationEnabled";
  long long v57 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v2, "automaticSharingEnabled"));
  v115[9] = v57;
  v114[10] = @"unsupportedLinkCount";
  long long v58 = [NSNumber numberWithUnsignedInteger:v74];
  v115[10] = v58;
  v114[11] = @"iMesssageBucket";
  v59 = v70;
  if (!v70)
  {
    v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v115[11] = v59;
  v114[12] = @"SMSBucket";
  v60 = v69;
  if (!v69)
  {
    v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v115[12] = v60;
  v114[13] = @"activeiMessageUser";
  v61 = (void *)v76;
  if (!v76)
  {
    v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v115[13] = v61;
  v114[14] = @"activeSMSUser";
  v62 = (void *)v71;
  if (!v71)
  {
    v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v115[14] = v62;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:15];
  +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.LinkStatusGenerated" payload:v63 inBackground:1];

  if (!v71) {
  if (!v76)
  }

  uint64_t v25 = v67;
  if (!v69) {

  }
  if (!v70) {
  id v4 = v73;
  }
  int v5 = v94;
  id v22 = v68;
  uint64_t v28 = v69;
  uint64_t v27 = v70;
LABEL_92:
  int v53 = v76;
  v54 = v71;
LABEL_93:

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:

LABEL_98:
LABEL_99:
}

+ (void)registerLogConsumedByClient
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a2;
  v5[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.FeedbackStreamReviewed", v4, v5);
}

void __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  id v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeedbackStreamReviewed", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  int v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "FeedbackStreamReviewed", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    int v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPSocialHighlightMetrics.m" lineNumber:667 description:@"Unexpected failure of deferral"];
    }
    id v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: FeedbackStreamReviewed: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

uint64_t __55__PPSocialHighlightMetrics_registerLogConsumedByClient__block_invoke_3(uint64_t a1)
{
  return +[PPSocialHighlightMetrics logConsumptionByClientWithShouldContinueBlock:*(void *)(a1 + 32)];
}

+ (void)logConsumptionByClientWithShouldContinueBlock:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[PPSettings sharedInstance];
  char v6 = [v5 hasWrittenSharedWithYouContentConsumed];

  id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  uint64_t v8 = +[PPConfiguration sharedInstance];
  [v8 socialHighlightMetricReportingInterval];
  os_signpost_id_t v10 = (void *)[v7 initWithTimeIntervalSinceNow:-v9];

  uint64_t v11 = objc_opt_new();
  [v10 timeIntervalSinceNow];
  int v13 = [v11 feedbackPublisherWithInterval:0 includingRemote:-v12];

  int v14 = objc_opt_new();
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke;
  v76[3] = &unk_1E65D9E80;
  id v15 = v10;
  id v77 = v15;
  id v16 = [v13 filterWithIsIncluded:v76];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke_207;
  v72[3] = &unk_1E65D6AD0;
  id v59 = v14;
  id v73 = v59;
  char v75 = v6;
  id v17 = (uint64_t (**)(void))v4;
  id v74 = v17;
  id v18 = (id)[v16 sinkWithCompletion:&__block_literal_global_206 shouldContinue:v72];

  if (v17[2](v17))
  {
    id v19 = [a1 iMessageBucketDescriptionWithShouldContinueBlock:v17];
    if (v17[2](v17))
    {
      uint64_t v20 = [a1 SMSBucketDescriptionWithShouldContinueBlock:v17];
      char v46 = v17;
      if (v17[2](v17))
      {
        id v44 = v15;
        uint64_t v45 = v13;
        v62 = [a1 hasSentIMessageWithShouldContinueBlock:v17];
        if (v17[2](v17))
        {
          id v21 = [a1 hasSentSMSWithShouldContinueBlock:v17];
          if (v17[2](v17))
          {
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v22 = [v59 keyEnumerator];
            uint64_t v49 = [v22 countByEnumeratingWithState:&v67 objects:v81 count:16];
            if (!v49)
            {

              goto LABEL_56;
            }
            id obj = v22;
            char v23 = 0;
            uint64_t v48 = *(void *)v68;
            long long v58 = v21;
            uint64_t v24 = v21;
LABEL_8:
            uint64_t v25 = 0;
            while (1)
            {
              if (*(void *)v68 != v48) {
                objc_enumerationMutation(obj);
              }
              uint64_t v50 = v25;
              char v26 = *(void **)(*((void *)&v67 + 1) + 8 * v25);
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v51 = [v59 objectForKeyedSubscript:v26];
              uint64_t v60 = [v51 countByEnumeratingWithState:&v63 objects:v80 count:16];
              if (v60) {
                break;
              }
LABEL_40:

              uint64_t v25 = v50 + 1;
              if (v50 + 1 == v49)
              {
                uint64_t v49 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
                if (!v49)
                {

                  if (v23) {
                    goto LABEL_57;
                  }
LABEL_56:
                  +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackStreamReviewed" payload:MEMORY[0x1E4F1CC08] inBackground:1];
                  goto LABEL_57;
                }
                goto LABEL_8;
              }
            }
            uint64_t v57 = *(void *)v64;
LABEL_13:
            uint64_t v27 = 0;
            while (1)
            {
              int v28 = v20;
              if (*(void *)v64 != v57) {
                objc_enumerationMutation(v51);
              }
              uint64_t v29 = v19;
              uint64_t v30 = *(void **)(*((void *)&v63 + 1) + 8 * v27);
              context = (void *)MEMORY[0x1CB79D060]();
              v78[0] = @"clientIdentifier";
              uint64_t v31 = v26;
              if (!v26)
              {
                long long v56 = [MEMORY[0x1E4F1CA98] null];
                uint64_t v31 = v56;
              }
              v79[0] = v31;
              v78[1] = @"feedbackType";
              uint64_t v32 = +[PPSocialHighlightFeedbackUtils stringifyBiomeFeedbackType:](PPSocialHighlightFeedbackUtils, "stringifyBiomeFeedbackType:", [v30 unsignedIntegerValue]);
              v79[1] = v32;
              v78[2] = @"eventCount";
              uint64_t v33 = NSNumber;
              uint64_t v34 = [v59 objectForKeyedSubscript:v26];
              id v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "countForObject:", v30));
              v79[2] = v35;
              v78[3] = @"iMesssageBucket";
              long long v36 = v29;
              if (!v29)
              {
                long long v55 = [MEMORY[0x1E4F1CA98] null];
                long long v36 = v55;
              }
              v79[3] = v36;
              v78[4] = @"SMSBucket";
              long long v37 = v28;
              if (!v28)
              {
                v54 = [MEMORY[0x1E4F1CA98] null];
                long long v37 = v54;
              }
              v79[4] = v37;
              v78[5] = @"activeiMessageUser";
              long long v38 = v62;
              if (!v62)
              {
                int v53 = [MEMORY[0x1E4F1CA98] null];
                long long v38 = v53;
              }
              v79[5] = v38;
              v78[6] = @"activeSMSUser";
              long long v39 = v24;
              if (!v24)
              {
                v52 = [MEMORY[0x1E4F1CA98] null];
                long long v39 = v52;
              }
              v79[6] = v39;
              v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:7];
              +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackStreamReviewed" payload:v40 inBackground:1];

              if (!v24) {
              id v19 = v29;
              }
              if (!v62) {

              }
              uint64_t v20 = v28;
              if (v28)
              {
                if (!v19) {
                  goto LABEL_37;
                }
              }
              else
              {

                if (!v19) {
LABEL_37:
                }
              }
              if (!v26) {

              }
              if (v60 == ++v27)
              {
                uint64_t v41 = [v51 countByEnumeratingWithState:&v63 objects:v80 count:16];
                uint64_t v60 = v41;
                if (!v41)
                {
                  char v23 = 1;
                  id v21 = v58;
                  goto LABEL_40;
                }
                goto LABEL_13;
              }
            }
          }
          id v43 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v43, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
          }
        }
        else
        {
          id v21 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
          }
        }
LABEL_57:

        id v15 = v44;
        int v13 = v45;
      }
      else
      {
        v42 = pp_social_highlights_log_handle();
        v62 = v42;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
        }
      }

      id v17 = v46;
    }
    else
    {
      uint64_t v20 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review during message counts fetching.", buf, 2u);
      }
    }
  }
  else
  {
    id v19 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring feedback stream review.", buf, 2u);
    }
  }
}

uint64_t __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  int v5 = [v3 eventBody];
  uint64_t v6 = [v5 feedbackType];

  id v7 = [v3 eventBody];
  uint64_t v8 = v7;
  if (v6 == 2)
  {
    double v9 = [v7 feedbackCreationDate];
    uint64_t v10 = [v9 compare:*(void *)(a1 + 32)] != -1;
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v11 = [v7 highlight];

    double v9 = [v3 eventBody];
    double v12 = [v9 clientIdentifier];
    if (v12)
    {
      int v13 = [v11 isPrimary];
      if (v13)
      {
        int v14 = [v11 isPrimary];
        uint64_t v10 = [v14 BOOLValue];
      }
      else
      {
        uint64_t v10 = 1;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

uint64_t __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  int v5 = [v3 eventBody];
  uint64_t v6 = [v5 clientIdentifier];
  id v7 = (void *)v6;
  uint64_t v8 = &stru_1F253DF18;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  double v9 = v8;

  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v9];
  }
  double v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  int v13 = NSNumber;
  int v14 = [v3 eventBody];
  id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "feedbackType"));
  [v12 addObject:v15];

  id v16 = [v3 eventBody];
  if ([v16 feedbackType] == 1)
  {
    int v17 = *(unsigned __int8 *)(a1 + 48);

    if (!v17) {
      +[PPSocialHighlightMetrics _recordTipsContentEvent:@"com.apple.proactive.PersonalizationPortrait.shared-with-you-content-consumed"];
    }
  }
  else
  {
  }
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v18;
}

void __74__PPSocialHighlightMetrics_logConsumptionByClientWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [v2 error];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: failed to complete traversal of local feedback stream: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (void)registerClientLinkStatus
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14228]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a2;
  v5[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ClientLinkStatus", v4, v5);
}

void __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  id v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = pp_maintenance_signpost_handle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ClientLinkStatus", "", buf, 2u);
  }

  v7[2](v7);
  double v12 = pp_maintenance_signpost_handle();
  int v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ClientLinkStatus", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      int v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPSocialHighlightMetrics.m" lineNumber:554 description:@"Unexpected failure of deferral"];
    }
    id v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: ClientLinkStatus: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_3(uint64_t a1)
{
  v92[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x1E4F8A008];
  v92[0] = *MEMORY[0x1E4F8A030];
  v92[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F8A018];
  v92[2] = *MEMORY[0x1E4F8A020];
  v92[3] = v4;
  v92[4] = *MEMORY[0x1E4F8A000];
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:5];
  id v6 = objc_msgSend(v5, "_pas_shuffledArrayUsingRng:", 0);

  v91[0] = @"internal";
  v91[1] = @"*";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (!v9) {
    goto LABEL_61;
  }
  uint64_t v11 = v9;
  uint64_t v68 = *(void *)v82;
  uint64_t v66 = *MEMORY[0x1E4F8A190];
  *(void *)&long long v10 = 138412290;
  long long v54 = v10;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v82 != v68) {
      objc_enumerationMutation(v8);
    }
    uint64_t v71 = v12;
    uint64_t v13 = *(void *)(*((void *)&v81 + 1) + 8 * v12);
    int v14 = (void *)MEMORY[0x1CB79D060]();
    int v15 = [v2 automaticSharingEnabledForClient:v13 error:0];
    if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
      goto LABEL_60;
    }
    if (v15 != 2
      || ([v2 autoDonatingChatsWithShouldContinueBlock:*(void *)(a1 + 32) error:0],
          (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v51 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch auto donating chat identifiers", buf, 2u);
      }
      goto LABEL_59;
    }
    int v17 = v16;
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0) {
      break;
    }
    uint64_t v18 = [v2 sharedContentForClient:v13 variant:v66 applicationIdentifiers:v7 limit:-1 autoDonatingChatIdentifiers:v17 error:0];
    long long v69 = v18;
    long long v70 = v14;
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      uint64_t v65 = v13;
      long long v67 = v17;
      id v19 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_175_8619);
      uint64_t v20 = [v2 attributionsForIdentifiers:v19 error:0];

      if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
      {
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_176;
        v76[3] = &unk_1E65D6AA8;
        long long v64 = v20;
        id v77 = v20;
        v78 = v67;
        id v79 = v7;
        uint64_t v80 = v65;
        id v21 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v76);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          uint64_t v60 = v11;
          uint64_t v61 = a1;
          id v62 = v8;
          long long v63 = v7;
          context = v2;
          uint64_t v58 = [v21 count];
          id v22 = objc_opt_new();
          uint64_t v23 = objc_opt_new();
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v59 = v21;
          id v24 = v21;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v72 objects:v89 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = 0;
            uint64_t v28 = 0;
            uint64_t v29 = *(void *)v73;
            while (1)
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v73 != v29) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v31 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                if (objc_msgSend(v31, "hasHighlightIdentifier", v54))
                {
                  if ([v31 highlightType] == 2)
                  {
                    uint64_t v32 = [v31 highlightIdentifier];
                    uint64_t v33 = v22;
                  }
                  else
                  {
                    if ([v31 highlightType] != 1) {
                      goto LABEL_24;
                    }
                    uint64_t v32 = [v31 highlightIdentifier];
                    uint64_t v33 = v23;
                  }
                  [v33 addObject:v32];
                }
LABEL_24:
                if ([v31 highlightType] == 2)
                {
                  ++v28;
                }
                else if ([v31 highlightType] == 1)
                {
                  ++v27;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v72 objects:v89 count:16];
              if (!v26) {
                goto LABEL_39;
              }
            }
          }
          uint64_t v27 = 0;
          uint64_t v28 = 0;
LABEL_39:

          if (v27 | v28
            && (+[PPSettings sharedInstance],
                long long v36 = objc_claimAutoreleasedReturnValue(),
                char v37 = [v36 hasWrittenSharedWithYouContentAvailable],
                v36,
                (v37 & 1) == 0))
          {
            +[PPSocialHighlightMetrics _recordTipsContentEvent:@"com.apple.proactive.PersonalizationPortrait.shared-with-you-content-available"];
            id v2 = context;
            uint64_t v39 = v65;
          }
          else
          {
            long long v38 = pp_social_highlights_log_handle();
            id v2 = context;
            uint64_t v39 = v65;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v40 = +[PPSettings sharedInstance];
              int v41 = [v40 hasWrittenSharedWithYouContentAvailable];
              v42 = @"NO";
              if (v41) {
                v42 = @"YES";
              }
              *(_DWORD *)buf = v54;
              v88 = v42;
              _os_log_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: ineligible to update tips shared content. Has written previously: %@", buf, 0xCu);
            }
          }
          contexta = (void *)MEMORY[0x1CB79D060]();
          v85[0] = @"automaticHighlights";
          long long v55 = [NSNumber numberWithUnsignedInteger:v27];
          v86[0] = v55;
          v85[1] = @"uniqueAutomaticHighlights";
          id v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
          v86[1] = v43;
          v85[2] = @"manualHighlights";
          id v44 = [NSNumber numberWithUnsignedInteger:v28];
          v86[2] = v44;
          v85[3] = @"uniqueManualHighlights";
          uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
          v86[3] = v45;
          v85[4] = @"totalHighlights";
          char v46 = [NSNumber numberWithUnsignedInteger:v58];
          v86[4] = v46;
          v85[5] = @"uniqueHighlights";
          uint64_t v47 = NSNumber;
          uint64_t v48 = [v23 setByAddingObjectsFromSet:v22];
          uint64_t v49 = objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "count"));
          v85[6] = @"clientIdentifier";
          v86[5] = v49;
          v86[6] = v39;
          uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:7];

          +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.ClientLinkStatus" payload:v50 inBackground:1];

          int v34 = 0;
          id v8 = v62;
          uint64_t v7 = v63;
          uint64_t v11 = v60;
          a1 = v61;
          id v21 = v59;
        }
        else
        {
          int v34 = 1;
        }

        id v35 = v77;
        uint64_t v20 = v64;
      }
      else
      {
        id v35 = pp_social_highlights_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring after fetching attributions.", buf, 2u);
        }
        int v34 = 1;
      }

      int v17 = v67;
    }
    else
    {
      uint64_t v20 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring after fetching searchable items.", buf, 2u);
      }
      int v34 = 1;
    }

    if (v34) {
      goto LABEL_61;
    }
    uint64_t v12 = v71 + 1;
    if (v71 + 1 == v11)
    {
      uint64_t v11 = [v8 countByEnumeratingWithState:&v81 objects:v90 count:16];
      if (!v11) {
        goto LABEL_61;
      }
      goto LABEL_3;
    }
  }
  v52 = v17;
  int v53 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v53, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring client link status after fetching autodonating chats.", buf, 2u);
  }

  id v51 = v52;
LABEL_59:

LABEL_60:
LABEL_61:
}

id __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_176(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  int v5 = [v3 uniqueIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = (void *)a1[4];
    id v8 = [v3 uniqueIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
    long long v10 = +[PPRankableSocialHighlightUtils rankableHighlightFromSearchableItem:v3 attribution:v9 autoDonatingChats:a1[5] applicationIdentifiers:a1[6] clientIdentifier:a1[7] variant:*MEMORY[0x1E4F8A190]];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

uint64_t __52__PPSocialHighlightMetrics_registerClientLinkStatus__block_invoke_173(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

+ (void)_recordTipsContentEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPSocialHighlight-tipsContent" qosClass:5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PPSocialHighlightMetrics__recordTipsContentEvent___block_invoke;
  block[3] = &unk_1E65DBE30;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __52__PPSocialHighlightMetrics__recordTipsContentEvent___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F50318]) initWithIdentifier:*(void *)(a1 + 32) bundleID:@"com.apple.proactive.PersonalizationPortrait" context:0];
  id v3 = BiomeLibrary();
  uint64_t v4 = [v3 Discoverability];
  id v5 = [v4 Signals];

  id v6 = [v5 source];
  [v6 sendEvent:v2];
  id v7 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: wrote tips content event %@", (uint8_t *)&v9, 0xCu);
  }
}

+ (void)registerSampledUnsupportedClientLogging
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke;
  v5[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a1;
  v5[5] = a2;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.UnsupportedClient", v4, v5);
}

void __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v26 = &v27;
  id v4 = v3;
  id v25 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_3;
  id v21 = &unk_1E65D8BF0;
  uint64_t v23 = *(void *)(a1 + 32);
  id v6 = v5;
  id v22 = v6;
  id v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = pp_maintenance_signpost_handle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "UnsupportedClient", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    int v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "UnsupportedClient", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v28 + 24)) {
    int v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      int v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPSocialHighlightMetrics.m" lineNumber:425 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: UnsupportedClient: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __67__PPSocialHighlightMetrics_registerSampledUnsupportedClientLogging__block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 40) unsupportedClientsFromPastDayWithShouldContinueBlock:*(void *)(a1 + 32)];
  id v3 = objc_msgSend(v2, "_pas_shuffledArrayUsingRng:", 0);

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v12 = v3;
      uint64_t v7 = *(void *)v14;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
          break;
        }
        if ([MEMORY[0x1E4F89FC8] yesWithProbability:0.01])
        {
          uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v18 = @"bundleId";
          uint64_t v19 = v9;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.UnsupportedLinkReceived" payload:v11 inBackground:1];
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
      id v3 = v12;
    }
  }
  else
  {
    id v4 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: unable to, or deferred from fetching unsupported clients.", buf, 2u);
    }
  }
}

+ (id)unsupportedClientsFromPastDayWithShouldContinueBlock:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v39 = objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E4F8A008], *MEMORY[0x1E4F8A018], *MEMORY[0x1E4F8A000], *MEMORY[0x1E4F8A030], 0);
  uint64_t v6 = +[PPSocialHighlightMetrics highlightsReceivedInInterval:v3 shouldContinueBlock:86400.0];
  if (v6)
  {
    id v37 = v3;
    id v38 = (id)objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v36 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      unint64_t v11 = 0x1E4F1C000uLL;
      uint64_t v40 = *(void *)v49;
      id v41 = v7;
      do
      {
        uint64_t v12 = 0;
        uint64_t v42 = v9;
        do
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
          long long v14 = [v13 resourceUrl];

          if (v14)
          {
            id v15 = objc_alloc(*(Class *)(v11 + 2832));
            long long v16 = [v13 resourceUrl];
            int v17 = [v15 initWithString:v16];

            if (v17)
            {
              uint64_t v18 = [v13 resolvedUrl];
              if (v18)
              {
                id v19 = objc_alloc(*(Class *)(v11 + 2832));
                uint64_t v20 = [v13 resolvedUrl];
                uint64_t v21 = (void *)[v19 initWithString:v20];
              }
              else
              {
                uint64_t v21 = 0;
              }

              uint64_t v23 = +[PPSocialHighlightStorage appLinksForResourceURL:v17 resolvedURL:v21];
              if (v23)
              {
                id v43 = v21;
                id v24 = objc_opt_new();
                long long v44 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                id v25 = v23;
                uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = *(void *)v45;
                  do
                  {
                    for (uint64_t i = 0; i != v27; ++i)
                    {
                      if (*(void *)v45 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      char v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                      if ([v30 isEnabled])
                      {
                        uint64_t v31 = [v30 targetApplicationRecord];
                        int v32 = [v31 applicationIdentifier];

                        if (v32) {
                          [v24 addObject:v32];
                        }
                      }
                    }
                    uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
                  }
                  while (v27);
                }

                if ([v24 count])
                {
                  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v24];
                  char v34 = [v33 intersectsSet:v39];

                  if ((v34 & 1) == 0) {
                    [v38 addObjectsFromArray:v24];
                  }
                }

                uint64_t v10 = v40;
                id v7 = v41;
                uint64_t v9 = v42;
                uint64_t v21 = v43;
                unint64_t v11 = 0x1E4F1C000;
              }
            }
          }
          else
          {
            int v17 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              id v22 = [v13 attributionIdentifier];
              *(_DWORD *)buf = 138412290;
              long long v54 = v22;
              _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: encountered highlight (attribution ID: %@) without a valid resource URL", buf, 0xCu);
            }
          }

          ++v12;
        }
        while (v12 != v9);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v9);
    }

    uint64_t v6 = v36;
    id v3 = v37;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

+ (unint64_t)countAllLinksReceivedInMessages
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v2 = *MEMORY[0x1E4F23660];
  v12[0] = *MEMORY[0x1E4F23670];
  v12[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v4 = +[PPConfiguration sharedInstance];
  [v4 socialHighlightMetricReportingInterval];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PPSocialHighlightMetrics_countAllLinksReceivedInMessages__block_invoke;
  v7[3] = &unk_1E65DAFF8;
  v7[4] = &v8;
  +[PPSocialHighlightMetrics _queryLinksWithFetchAttributes:interval:handler:](PPSocialHighlightMetrics, "_queryLinksWithFetchAttributes:interval:handler:", v3, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __59__PPSocialHighlightMetrics_countAllLinksReceivedInMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)allHighlightIdentifiersReceivedWithShouldContinueBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PPConfiguration sharedInstance];
  [v4 socialHighlightMetricReportingInterval];
  unint64_t v5 = +[PPSocialHighlightMetrics highlightsReceivedInInterval:shouldContinueBlock:](PPSocialHighlightMetrics, "highlightsReceivedInInterval:shouldContinueBlock:", v3);

  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "highlightIdentifier", (void)v16);

          if (v13)
          {
            long long v14 = [v12 highlightIdentifier];
            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)highlightsReceivedInInterval:(double)a3 shouldContinueBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (uint64_t (**)(void))a4;
  uint64_t v6 = objc_opt_new();
  id v20 = 0;
  id v7 = [v6 autoDonatingChatsWithShouldContinueBlock:v5 error:&v20];
  id v8 = v20;
  id location = v8;
  if (!v7)
  {
    id v15 = v8;
    uint64_t v10 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v15;
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch autodonating chats (possibly deferred): %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ((v5[2](v5) & 1) == 0)
  {
    uint64_t v10 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring highlights received in interval.", buf, 2u);
    }
LABEL_10:
    long long v13 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = [v6 sharedContentFromChats:v7 dateRange:0 applicationIdentifiers:&location error:a3];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 _pas_mappedArrayWithTransform:&__block_literal_global_144];
    id obj = location;
    uint64_t v12 = [v6 attributionsForIdentifiers:v11 error:&obj];
    objc_storeStrong(&location, obj);

    if (v12)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__PPSocialHighlightMetrics_highlightsReceivedInInterval_shouldContinueBlock___block_invoke_145;
      v17[3] = &unk_1E65D6A80;
      long long v18 = v12;
      long long v13 = [v10 _pas_mappedArrayWithTransform:v17];
      long long v14 = v18;
    }
    else
    {
      long long v14 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = location;
        _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch attributions: %@", buf, 0xCu);
      }
      long long v13 = 0;
    }
  }
  else
  {
    uint64_t v12 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = location;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPSocialHighlightMetrics: unable to fetch searchable items: %@", buf, 0xCu);
    }
    long long v13 = 0;
  }

LABEL_19:
  return v13;
}

id __77__PPSocialHighlightMetrics_highlightsReceivedInInterval_shouldContinueBlock___block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = [v3 uniqueIdentifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 uniqueIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = +[PPRankableSocialHighlightUtils rankableHighlightFromSearchableItem:v3 attribution:v9 autoDonatingChats:v10 applicationIdentifiers:MEMORY[0x1E4F1CBF0] clientIdentifier:&stru_1F253DF18 variant:*MEMORY[0x1E4F8A190]];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __77__PPSocialHighlightMetrics_highlightsReceivedInInterval_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

+ (BOOL)_queryLinksWithFetchAttributes:(id)a3 interval:(double)a4 handler:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_new();
  [v9 setReason:@"SHMetrics"];
  [v9 setDisableBlockingOnIndex:1];
  [v9 setMaxCount:500];
  [v9 setFetchAttributes:v7];
  [v9 setLowPriority:1];
  [v9 setReason:@"reason:PPSocialHighlightMetrics-1 code:1"];
  v37[0] = *MEMORY[0x1E4F28358];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v9 setProtectionClasses:v10];

  id v11 = [NSString alloc];
  uint64_t v12 = (void *)[v11 initWithFormat:@"%@=\"%@\", *MEMORY[0x1E4F23148], @"lnk""];
  long long v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"kMDItemContentCreationDate>=$time.now(-%.f)", *(void *)&a4);
  v36[0] = v12;
  v36[1] = v13;
  v36[2] = @"URL=*";
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  id v15 = objc_msgSend(v14, "_pas_componentsJoinedByString:", @" && ");

  long long v16 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: Performing CoreSpotlight highlight query: %@", (uint8_t *)&buf, 0xCu);
  }

  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v15 context:v9];
  uint64_t v35 = *MEMORY[0x1E4F8A0A8];
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  [v17 setBundleIDs:v18];

  [v17 setFoundItemsHandler:v8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  int v32 = __Block_byref_object_copy__8524;
  uint64_t v33 = __Block_byref_object_dispose__8525;
  id v34 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__PPSocialHighlightMetrics__queryLinksWithFetchAttributes_interval_handler___block_invoke;
  v22[3] = &unk_1E65D6A58;
  p_long long buf = &buf;
  id v25 = &v26;
  id v20 = v19;
  id v23 = v20;
  [v17 setCompletionHandler:v22];
  [v17 start];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v18) = *((unsigned char *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&buf, 8);

  return (char)v18;
}

void __76__PPSocialHighlightMetrics__queryLinksWithFetchAttributes_interval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (!v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_countSentMessagesInLastWeekMatchingChatType:(id)a3 shouldContinueBlock:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (uint64_t (**)(void))a4;
  id v7 = objc_opt_new();
  [v7 setReason:@"SHMetrics"];
  [v7 setDisableBlockingOnIndex:1];
  [v7 setMaxCount:500];
  v41[0] = *MEMORY[0x1E4F23020];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [v7 setFetchAttributes:v8];

  [v7 setLowPriority:1];
  [v7 setReason:@"reason:PPSocialHighlightMetrics-1; code:1"];
  uint64_t v40 = *MEMORY[0x1E4F28358];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [v7 setProtectionClasses:v9];

  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"com_apple_mobilesms_service=\"%@\"", v5];
  v39[0] = v10;
  v39[1] = @"kMDItemContentCreationDate>=$time.now(-7d)";
  v39[2] = @"com_apple_mobilesms_fromMe=1";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  uint64_t v12 = objc_msgSend(v11, "_pas_componentsJoinedByString:", @" && ");

  long long v13 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: Performing CoreSpotlight highlight query: %@", (uint8_t *)&buf, 0xCu);
  }

  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v12 context:v7];
  uint64_t v38 = *MEMORY[0x1E4F8A0A8];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  [v14 setBundleIDs:v15];

  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke;
  v28[3] = &unk_1E65DAFF8;
  v28[4] = &v29;
  [v14 setFoundItemsHandler:v28];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__8524;
  long long v36 = __Block_byref_object_dispose__8525;
  id v37 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke_124;
  v22[3] = &unk_1E65D6A58;
  p_long long buf = &buf;
  id v25 = v26;
  long long v17 = v16;
  id v23 = v17;
  [v14 setCompletionHandler:v22];
  [v14 start];
  do
  {
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v17 timeoutSeconds:1.0] != 1)
    {
      dispatch_semaphore_t v19 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v30 + 6)];
      goto LABEL_10;
    }
  }
  while ((v6[2](v6) & 1) != 0);
  long long v18 = pp_default_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightMetrics: deferring while counting metrics.", v21, 2u);
  }

  [v14 cancel];
  dispatch_semaphore_t v19 = 0;
LABEL_10:

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v29, 8);
  return v19;
}

uint64_t __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __93__PPSocialHighlightMetrics__countSentMessagesInLastWeekMatchingChatType_shouldContinueBlock___block_invoke_124(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (!v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)registerCTSDataCollection
{
  +[PPSocialHighlightMetrics registerLogConsumedByClient];
  +[PPSocialHighlightMetrics registerDeviceSettingsCollection];
  +[PPSocialHighlightMetrics registerCountLinks];
  +[PPSocialHighlightMetrics registerSampledUnsupportedClientLogging];
  +[PPSocialHighlightMetrics registerClientLinkStatus];
  +[PPSocialHighlightMetrics registerExpiredLinkReview];
}

+ (void)logMatchedFeedbackForHighlightMatches:(id)a3 batchSize:(unint64_t)a4 type:(int)a5 client:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  v83[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (v7 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = off_1E65D6B38[v7];
  }
  uint64_t v12 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "Logging matched feedback for social highlights.", buf, 2u);
  }

  if ([v9 count])
  {
    uint64_t v57 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v46 = v9;
    id obj = v9;
    uint64_t v58 = [obj countByEnumeratingWithState:&v64 objects:v81 count:16];
    if (v58)
    {
      uint64_t v53 = *(void *)v65;
      long long v54 = v11;
      unint64_t v13 = 0x1E4F28000uLL;
      id v55 = v10;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v65 != v53) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v16 = MEMORY[0x1CB79D060]();
          id v17 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v15 contentCreationSecondsSinceReferenceDate];
          long long v18 = objc_msgSend(v17, "initWithTimeIntervalSinceReferenceDate:");
          [v57 timeIntervalSinceDate:v18];
          double v20 = v19;

          id v21 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v15 syndicationSecondsSinceReferenceDate];
          id v22 = objc_msgSend(v21, "initWithTimeIntervalSinceReferenceDate:");
          [v57 timeIntervalSinceDate:v22];
          double v24 = v23;

          v69[0] = @"clientIdentifier";
          id v25 = v10;
          if (!v10)
          {
            v52 = [MEMORY[0x1E4F1CA98] null];
            id v25 = v52;
          }
          v70[0] = v25;
          v70[1] = v11;
          v69[1] = @"feedbackType";
          v69[2] = @"rank";
          uint64_t v26 = objc_msgSend(*(id *)(v13 + 3792), "numberWithUnsignedInt:", objc_msgSend(v15, "rank"));
          v70[2] = v26;
          v69[3] = @"isPrimary";
          uint64_t v71 = objc_msgSend(*(id *)(v13 + 3792), "numberWithBool:", objc_msgSend(v15, "isPrimary"));
          v69[4] = @"hoursSinceCreation";
          uint64_t v61 = (void *)v71;
          if ([v15 hasContentCreationSecondsSinceReferenceDate])
          {
            char v27 = *(void **)(v13 + 3792);
            +[PPSocialHighlightMetrics hoursFromSeconds:v20];
            uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");
            unint64_t v29 = 0x1E4F1C000;
          }
          else
          {
            unint64_t v29 = 0x1E4F1C000uLL;
            uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
          }
          uint64_t v72 = v28;
          v69[5] = @"hoursSinceHighlight";
          id v62 = (void *)v26;
          context = (void *)v16;
          uint64_t v60 = (void *)v28;
          if ([v15 hasSyndicationSecondsSinceReferenceDate])
          {
            char v30 = *(void **)(v13 + 3792);
            +[PPSocialHighlightMetrics hoursFromSeconds:v24];
            objc_msgSend(v30, "numberWithDouble:");
          }
          else
          {
            [*(id *)(v29 + 2712) null];
          id v59 = };
          long long v73 = v59;
          v69[6] = @"isManuallyHighlighted";
          uint64_t v31 = objc_msgSend(*(id *)(v13 + 3792), "numberWithInt:", objc_msgSend(v15, "highlightType") == 2);
          long long v74 = v31;
          v69[7] = @"batchSize";
          int v32 = [*(id *)(v13 + 3792) numberWithUnsignedInteger:a4];
          long long v75 = v32;
          v69[8] = @"isTopKResult";
          uint64_t v33 = objc_msgSend(*(id *)(v13 + 3792), "numberWithBool:", objc_msgSend(v15, "isTopKResult"));
          uint64_t v76 = v33;
          v69[9] = @"iMesssageBucket";
          uint64_t v34 = [a1 iMessageBucketDescriptionWithShouldContinueBlock:&__block_literal_global_8704];
          uint64_t v35 = v34;
          if (!v34)
          {
            long long v51 = [*(id *)(v29 + 2712) null];
            uint64_t v35 = v51;
          }
          id v77 = v35;
          v69[10] = @"SMSBucket";
          long long v36 = [a1 SMSBucketDescriptionWithShouldContinueBlock:&__block_literal_global_99_8705];
          id v37 = v36;
          if (!v36)
          {
            long long v50 = [*(id *)(v29 + 2712) null];
            id v37 = v50;
          }
          v78 = v37;
          v69[11] = @"activeiMessageUser";
          uint64_t v38 = [a1 hasSentIMessageWithShouldContinueBlock:&__block_literal_global_101];
          uint64_t v39 = v38;
          if (!v38)
          {
            long long v49 = [*(id *)(v29 + 2712) null];
            uint64_t v39 = v49;
          }
          id v79 = v39;
          v69[12] = @"activeSMSUser";
          id v40 = a1;
          id v41 = [a1 hasSentSMSWithShouldContinueBlock:&__block_literal_global_103];
          uint64_t v42 = v41;
          if (!v41)
          {
            long long v48 = [*(id *)(v29 + 2712) null];
            uint64_t v42 = v48;
          }
          uint64_t v80 = v42;
          id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:13];
          if (!v41) {

          }
          if (!v38) {
          a1 = v40;
          }
          if (!v36) {

          }
          unint64_t v13 = 0x1E4F28000;
          if (!v34) {

          }
          id v10 = v55;
          if (!v55) {

          }
          +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackMatched" payload:v43 inBackground:0];
          id v11 = v54;
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v64 objects:v81 count:16];
      }
      while (v58);
    }

    id v9 = v46;
  }
  else
  {
    long long v44 = (void *)MEMORY[0x1CB79D060]();
    v82[0] = @"clientIdentifier";
    v82[1] = @"feedbackType";
    v83[0] = v10;
    v83[1] = v11;
    long long v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackNotMatched" payload:v45 inBackground:0];
  }
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke_4()
{
  return 1;
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke_3()
{
  return 1;
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke_2()
{
  return 1;
}

uint64_t __88__PPSocialHighlightMetrics_logMatchedFeedbackForHighlightMatches_batchSize_type_client___block_invoke()
{
  return 1;
}

+ (double)hoursFromSeconds:(double)a3
{
  return a3 / 3600.0;
}

+ (void)logFeedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[PPSocialHighlightStorage attributionFeedbackTypeForAttributionFeedbackType:a4];
  if (v9 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = off_1E65D6B38[v9];
  }
  id v11 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "Logging feedback for highlight attribution", buf, 2u);
  }

  uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
  v16[0] = @"clientIdentifier";
  unint64_t v13 = v8;
  if (!v8)
  {
    unint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v13;
  v17[1] = @"attributionFeedbackDomain";
  v16[1] = @"feedbackDomain";
  v16[2] = @"feedbackType";
  v17[2] = v10;
  long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  if (!v8) {

  }
  +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackReceived" payload:v14 inBackground:0];
}

+ (void)logFeedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[PPSocialHighlightStorage unifiedFeedbackTypeForHighlightFeedbackType:a4];
  if (v9 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = off_1E65D6B38[v9];
  }
  id v11 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "Logging feedback for highlight engagement", buf, 2u);
  }

  uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
  v16[0] = @"clientIdentifier";
  unint64_t v13 = v8;
  if (!v8)
  {
    unint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v13;
  v17[1] = @"engagementFeedbackDomain";
  v16[1] = @"feedbackDomain";
  v16[2] = @"feedbackType";
  v17[2] = v10;
  long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  if (!v8) {

  }
  +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.SocialHighlights.FeedbackReceived" payload:v14 inBackground:0];
}

@end