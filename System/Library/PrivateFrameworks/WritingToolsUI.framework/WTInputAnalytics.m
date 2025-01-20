@interface WTInputAnalytics
+ (id)getIAChannelWritingTools;
+ (id)getIAPayloadKeyWritingToolsUI;
+ (id)getIAPayloadValueWritingToolsUIAffordance;
+ (id)getIASignalWritingToolsPanelRequested;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5;
+ (void)sendWritingToolsSignal:(id)a3 payload:(id)a4;
@end

@implementation WTInputAnalytics

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v10 = (void *)getIASignalAnalyticsClass_softClass_0;
  uint64_t v16 = getIASignalAnalyticsClass_softClass_0;
  if (!getIASignalAnalyticsClass_softClass_0)
  {
    InputAnalyticsLibraryCore_0();
    v14[3] = (uint64_t)objc_getClass("IASignalAnalytics");
    getIASignalAnalyticsClass_softClass_0 = v14[3];
    v10 = (void *)v14[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v13, 8);
  if (v11)
  {
    [v11 sendSignal:v7 toChannel:v8 withPayload:v9];
  }
  else
  {
    v12 = WTInputAnalyticsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[WTInputAnalytics sendSignal:toChannel:withPayload:](v12);
    }
  }
}

+ (void)sendWritingToolsSignal:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[WTInputAnalytics getIAChannelWritingTools];
  +[WTInputAnalytics sendSignal:v6 toChannel:v7 withPayload:v5];
}

+ (id)getIAChannelWritingTools
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getIAChannelWritingToolsSymbolLoc_ptr_0;
  uint64_t v10 = getIAChannelWritingToolsSymbolLoc_ptr_0;
  if (!getIAChannelWritingToolsSymbolLoc_ptr_0)
  {
    v3 = (void *)InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "IAChannelWritingTools");
    getIAChannelWritingToolsSymbolLoc_ptr_0 = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4 = *v2;

  return v4;
}

+ (id)getIASignalWritingToolsPanelRequested
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getIASignalWritingToolsPanelRequestedSymbolLoc_ptr;
  uint64_t v10 = getIASignalWritingToolsPanelRequestedSymbolLoc_ptr;
  if (!getIASignalWritingToolsPanelRequestedSymbolLoc_ptr)
  {
    v3 = (void *)InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "IASignalWritingToolsPanelRequested");
    getIASignalWritingToolsPanelRequestedSymbolLoc_ptr = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4 = *v2;

  return v4;
}

+ (id)getIAPayloadKeyWritingToolsUI
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getIAPayloadKeyWritingToolsUISymbolLoc_ptr_0;
  uint64_t v10 = getIAPayloadKeyWritingToolsUISymbolLoc_ptr_0;
  if (!getIAPayloadKeyWritingToolsUISymbolLoc_ptr_0)
  {
    v3 = (void *)InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "IAPayloadKeyWritingToolsUI");
    getIAPayloadKeyWritingToolsUISymbolLoc_ptr_0 = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4 = *v2;

  return v4;
}

+ (id)getIAPayloadValueWritingToolsUIAffordance
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void **)getIAPayloadValueWritingToolsUIAffordanceSymbolLoc_ptr;
  uint64_t v10 = getIAPayloadValueWritingToolsUIAffordanceSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsUIAffordanceSymbolLoc_ptr)
  {
    v3 = (void *)InputAnalyticsLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "IAPayloadValueWritingToolsUIAffordance");
    getIAPayloadValueWritingToolsUIAffordanceSymbolLoc_ptr = v8[3];
    v2 = (void **)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4 = *v2;

  return v4;
}

+ (void)sendSignal:(os_log_t)log toChannel:withPayload:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_261BE2000, log, OS_LOG_TYPE_ERROR, "Could not soft link InputAnalytics", v1, 2u);
}

@end