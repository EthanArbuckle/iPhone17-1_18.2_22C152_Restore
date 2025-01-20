@interface TUIInputAnalytics
+ (id)getIAChannelGenmojiCreation;
+ (id)getIASignalGenmojiCreationEmojiKeyPlaneSwitched;
+ (id)getIASignalGenmojiCreationEmojiSearchDismissed;
+ (id)getIASignalGenmojiCreationEmojiSearchInvoked;
+ (id)getIASignalGenmojiCreationGenmojiButtonPressed;
+ (void)_sendSignal:(id)a3 toChannel:(id)a4 withThreadId:(id)a5 withPayload:(id)a6;
+ (void)didHandleSmartReplyAnalyticsEventOfType:(int64_t)a3 withBundleId:(id)a4 withInputContextHistoryRequestId:(id)a5 withMsgOrMailThreadId:(id)a6 withSmartReplyResponse:(id)a7;
+ (void)sendGenmojiCreationSignal:(id)a3 payload:(id)a4;
@end

@implementation TUIInputAnalytics

+ (id)getIASignalGenmojiCreationEmojiSearchDismissed
{
  return @"EmojiSearchDismissed";
}

+ (id)getIASignalGenmojiCreationEmojiSearchInvoked
{
  return @"EmojiSearchInvoked";
}

+ (id)getIASignalGenmojiCreationGenmojiButtonPressed
{
  return @"GenmojiButtonPressed";
}

+ (id)getIASignalGenmojiCreationEmojiKeyPlaneSwitched
{
  return @"EmojiKeyPlaneSwitched";
}

+ (id)getIAChannelGenmojiCreation
{
  return @"GenmojiCreation";
}

+ (void)sendGenmojiCreationSignal:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TUIInputAnalytics getIAChannelGenmojiCreation];
  +[TUIInputAnalytics _sendSignal:v6 toChannel:v7 withThreadId:0 withPayload:v5];
}

+ (void)didHandleSmartReplyAnalyticsEventOfType:(int64_t)a3 withBundleId:(id)a4 withInputContextHistoryRequestId:(id)a5 withMsgOrMailThreadId:(id)a6 withSmartReplyResponse:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (v14)
  {
    v16 = [v14 srResponse];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18 = [v15 modelInfoString];
    v19 = [v15 userFeedbackInputString];
    v20 = [v16 responseTexts];
    if (v18) {
      [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F6F460]];
    }
    if (v19) {
      [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F6F450]];
    }
    if (v20) {
      [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F6F468]];
    }
  }
  else
  {
    id v17 = 0;
  }
  switch(a3)
  {
    case 0:
      uint64_t v21 = mach_continuous_time();
      SetSmartReplyStartTimeForRequest(v12, v21);
      v22 = TUIInputAnalyticsLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v33 = 0;
        _os_log_debug_impl(&dword_18D47E000, v22, OS_LOG_TYPE_DEBUG, "Begin - SmartReplyGenerate", v33, 2u);
      }

      v23 = (void *)MEMORY[0x1E4F6F4A0];
      goto LABEL_33;
    case 1:
      v24 = TUIInputAnalyticsLog();
      if (os_signpost_enabled(v24))
      {
        *(_DWORD *)v33 = 134349056;
        *(void *)&v33[4] = GetSmartReplyStartTimeForRequest(v12);
        _os_signpost_emit_with_name_impl(&dword_18D47E000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SmartReplyGenerate", "%{public, signpost.description:begin_time}llu", v33, 0xCu);
      }

      v25 = TUIInputAnalyticsLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v33 = 0;
        _os_log_debug_impl(&dword_18D47E000, v25, OS_LOG_TYPE_DEBUG, "End - SmartReplyGenerate - SmartReply Generated successfully", v33, 2u);
      }

      if (v15)
      {
        uint64_t v26 = [v15 responseFromCache];
        v27 = (void *)v26;
        if (v26) {
          uint64_t v28 = v26;
        }
        else {
          uint64_t v28 = MEMORY[0x1E4F1CC28];
        }
        [v17 setObject:v28 forKeyedSubscript:@"IsCached"];
      }
      v23 = (void *)MEMORY[0x1E4F6F490];
      goto LABEL_33;
    case 2:
      v29 = TUIInputAnalyticsLog();
      if (os_signpost_enabled(v29))
      {
        *(_DWORD *)v33 = 134349056;
        *(void *)&v33[4] = GetSmartReplyStartTimeForRequest(v12);
        _os_signpost_emit_with_name_impl(&dword_18D47E000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SmartReplyGenerateFailure", "%{public, signpost.description:begin_time}llu", v33, 0xCu);
      }

      v30 = TUIInputAnalyticsLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      *(_WORD *)v33 = 0;
      v31 = "End - SmartReplyGenerate - No SmartReply Generated";
      break;
    case 3:
      v32 = TUIInputAnalyticsLog();
      if (os_signpost_enabled(v32))
      {
        *(_DWORD *)v33 = 134349056;
        *(void *)&v33[4] = GetSmartReplyStartTimeForRequest(v12);
        _os_signpost_emit_with_name_impl(&dword_18D47E000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SmartReplyGenerateTimeout", "%{public, signpost.description:begin_time}llu", v33, 0xCu);
      }

      v30 = TUIInputAnalyticsLog();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      *(_WORD *)v33 = 0;
      v31 = "End - SmartReplyGenerate - No SmartReply Generated - Timeout";
      break;
    case 4:
      v23 = (void *)MEMORY[0x1E4F6F4A8];
      goto LABEL_33;
    default:
      goto LABEL_34;
  }
  _os_log_debug_impl(&dword_18D47E000, v30, OS_LOG_TYPE_DEBUG, v31, v33, 2u);
LABEL_31:

  v23 = (void *)MEMORY[0x1E4F6F498];
LABEL_33:
  +[TUIInputAnalytics _sendSignal:toChannel:withThreadId:withPayload:](TUIInputAnalytics, "_sendSignal:toChannel:withThreadId:withPayload:", *v23, *MEMORY[0x1E4F6F448], v13, v17, *(void *)v33);
LABEL_34:
}

+ (void)_sendSignal:(id)a3 toChannel:(id)a4 withThreadId:(id)a5 withPayload:(id)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a5)
  {
    [MEMORY[0x1E4F6F4B0] sendSignal:v9 toChannel:a4 withUniqueStringID:a5 withPayload:a6];
  }
  else
  {
    [MEMORY[0x1E4F6F4B0] sendSignal:v9 toChannel:a4 withPayload:a6];
    v10 = TUIInputAnalyticsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138477827;
      id v12 = v9;
      _os_log_error_impl(&dword_18D47E000, v10, OS_LOG_TYPE_ERROR, "%{private}@ sent without msgOrMailThreadId", (uint8_t *)&v11, 0xCu);
    }
  }
}

@end