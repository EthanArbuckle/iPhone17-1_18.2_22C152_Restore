@interface WTAnalyticsDelegate
- (BOOL)fromSmartReply;
- (BOOL)isEditableText;
- (NSMutableArray)proofreadingSuggestions;
- (NSMutableDictionary)uuidSuggestionMapping;
- (NSString)threadIdentifier;
- (NSUUID)analyticsUUID;
- (WTAnalyticsDelegate)initWithSmartReplyBool:(BOOL)a3 smartReplyConfig:(id)a4 analyticsUUID:(id)a5 requestedTool:(int64_t)a6 isEditable:(BOOL)a7;
- (id)getWritingToolsFeatureDetailsForCompositionSessionType:(int64_t)a3;
- (id)getWritingToolsFeatureDetailsForRequestedTool:(int64_t)a3;
- (int64_t)currentDraftNumber;
- (unint64_t)numDrafts;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillTerminate;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)endWritingTools;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)redo;
- (void)sendWritingToolsOnlySignal:(id)a3 withPayload:(id)a4;
- (void)sendWritingToolsOrSmartReplySignal:(id)a3 withPayload:(id)a4;
- (void)setAnalyticsUUID:(id)a3;
- (void)setCurrentDraftNumber:(int64_t)a3;
- (void)setFromSmartReply:(BOOL)a3;
- (void)setIsEditableText:(BOOL)a3;
- (void)setNumDrafts:(unint64_t)a3;
- (void)setProofreadingSuggestions:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setUuidSuggestionMapping:(id)a3;
- (void)undo;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation WTAnalyticsDelegate

- (WTAnalyticsDelegate)initWithSmartReplyBool:(BOOL)a3 smartReplyConfig:(id)a4 analyticsUUID:(id)a5 requestedTool:(int64_t)a6 isEditable:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a3;
  v47[2] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  v35.receiver = self;
  v35.super_class = (Class)WTAnalyticsDelegate;
  v14 = [(WTAnalyticsDelegate *)&v35 init];
  v15 = v14;
  if (v14)
  {
    [(WTAnalyticsDelegate *)v14 setFromSmartReply:v10];
    [(WTAnalyticsDelegate *)v15 setIsEditableText:v7];
    v16 = WTIATextAssistantLog();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_261BE2000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WTPanelBringup", byte_261C17A8E, buf, 2u);
    }

    v17 = WTIATextAssistantLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:](v17);
    }

    if (v12)
    {
      v18 = [v12 inputContextHistory];
      uint64_t v19 = [v18 threadIdentifier];
      threadIdentifier = v15->_threadIdentifier;
      v15->_threadIdentifier = (NSString *)v19;
    }
    else
    {
      v18 = v15->_threadIdentifier;
      v15->_threadIdentifier = 0;
    }

    objc_storeStrong((id *)&v15->_analyticsUUID, a5);
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v21 = (id *)getIASignalWritingToolsPanelAppearedSymbolLoc_ptr;
    uint64_t v44 = getIASignalWritingToolsPanelAppearedSymbolLoc_ptr;
    if (!getIASignalWritingToolsPanelAppearedSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __getIASignalWritingToolsPanelAppearedSymbolLoc_block_invoke;
      v39 = &unk_26558E480;
      v40 = &v41;
      v22 = (void *)InputAnalyticsLibrary();
      v23 = dlsym(v22, "IASignalWritingToolsPanelAppeared");
      *(void *)(v40[1] + 24) = v23;
      getIASignalWritingToolsPanelAppearedSymbolLoc_ptr = *(void *)(v40[1] + 24);
      v21 = (id *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (!v21) {
      goto LABEL_17;
    }
    id v24 = *v21;
    v25 = getIAPayloadKeyWritingToolsFeatureDetails();
    v45 = v25;
    v26 = [(WTAnalyticsDelegate *)v15 getWritingToolsFeatureDetailsForRequestedTool:a6];
    v47[0] = v26;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v27 = (id *)getIAPayloadKeyWritingToolsUISymbolLoc_ptr;
    uint64_t v44 = getIAPayloadKeyWritingToolsUISymbolLoc_ptr;
    if (!getIAPayloadKeyWritingToolsUISymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __getIAPayloadKeyWritingToolsUISymbolLoc_block_invoke;
      v39 = &unk_26558E480;
      v40 = &v41;
      v28 = (void *)InputAnalyticsLibrary();
      v29 = dlsym(v28, "IAPayloadKeyWritingToolsUI");
      *(void *)(v40[1] + 24) = v29;
      getIAPayloadKeyWritingToolsUISymbolLoc_ptr = *(void *)(v40[1] + 24);
      v27 = (id *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (!v27)
    {
LABEL_17:
      -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
      __break(1u);
    }
    id v46 = *v27;
    v47[1] = @"Unspecified";
    v30 = NSDictionary;
    id v31 = v46;
    v32 = [v30 dictionaryWithObjects:v47 forKeys:&v45 count:2];
    [(WTAnalyticsDelegate *)v15 sendWritingToolsOnlySignal:v24 withPayload:v32];

    v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v15 selector:sel_applicationDidEnterBackground name:*MEMORY[0x263F83330] object:0];
    [v33 addObserver:v15 selector:sel_applicationDidBecomeActive name:*MEMORY[0x263F83318] object:0];
    [v33 addObserver:v15 selector:sel_applicationWillTerminate name:*MEMORY[0x263F833C8] object:0];
  }
  return v15;
}

- (id)getWritingToolsFeatureDetailsForCompositionSessionType:(int64_t)a3
{
  v3 = @"SummaryTransform";
  switch(a3)
  {
    case 0:
      uint64_t v8 = 0;
      v9 = &v8;
      uint64_t v10 = 0x2020000000;
      v4 = (id *)getIAPayloadValueWritingToolsFeatureDetailsGenericSymbolLoc_ptr;
      uint64_t v11 = getIAPayloadValueWritingToolsFeatureDetailsGenericSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsFeatureDetailsGenericSymbolLoc_ptr)
      {
        v5 = (void *)InputAnalyticsLibrary();
        v9[3] = (uint64_t)dlsym(v5, "IAPayloadValueWritingToolsFeatureDetailsGeneric");
        getIAPayloadValueWritingToolsFeatureDetailsGenericSymbolLoc_ptr = v9[3];
        v4 = (id *)v9[3];
      }
      _Block_object_dispose(&v8, 8);
      if (!v4)
      {
        BOOL v7 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
        _Block_object_dispose(&v8, 8);
        _Unwind_Resume(v7);
      }
      v3 = (__CFString *)*v4;
      break;
    case 1:
      getIAPayloadValueWritingToolsFeatureDetailsMagicRewrite();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      getIAPayloadValueWritingToolsFeatureDetailsFriendlyTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      getIAPayloadValueWritingToolsFeatureDetailsProfessionalTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      getIAPayloadValueWritingToolsFeatureDetailsConciseTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      getIAPayloadValueWritingToolsFeatureDetailsOpenEndedTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransform();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      getIAPayloadValueWritingToolsFeatureDetailsBulletsTransform();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      getIAPayloadValueWritingToolsFeatureDetailsTablesTransform();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      v3 = @"Compose";
      break;
    case 11:
      v3 = @"SmartReply";
      break;
    case 12:
      getIAPayloadValueWritingToolsFeatureDetailsProofreadingReview();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v3;
}

- (id)getWritingToolsFeatureDetailsForRequestedTool:(int64_t)a3
{
  v3 = @"Index";
  switch(a3)
  {
    case 1:
    case 3:
      getIAPayloadValueWritingToolsFeatureDetailsProofreadingReview();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      getIAPayloadValueWritingToolsFeatureDetailsMagicRewrite();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
      break;
    case 11:
      getIAPayloadValueWritingToolsFeatureDetailsFriendlyTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      getIAPayloadValueWritingToolsFeatureDetailsProfessionalTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      getIAPayloadValueWritingToolsFeatureDetailsConciseTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      getIAPayloadValueWritingToolsFeatureDetailsOpenEndedTone();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      v3 = @"SummaryTransform";
      break;
    case 22:
      getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransform();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      getIAPayloadValueWritingToolsFeatureDetailsBulletsTransform();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 24:
      getIAPayloadValueWritingToolsFeatureDetailsTablesTransform();
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = @"Compose";
      if (a3 != 201) {
        v4 = @"Index";
      }
      if (a3 == 101) {
        v3 = @"SmartReply";
      }
      else {
        v3 = v4;
      }
      break;
  }

  return v3;
}

- (void)sendWritingToolsOnlySignal:(id)a3 withPayload:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (![(WTAnalyticsDelegate *)self fromSmartReply])
  {
    id IASignalAnalyticsClass = getIASignalAnalyticsClass();
    uint64_t v8 = getIAChannelWritingTools();
    v9 = [(NSUUID *)self->_analyticsUUID UUIDString];
    [IASignalAnalyticsClass sendSignal:v10 toChannel:v8 withUniqueStringID:v9 withPayload:v6];
  }
}

- (void)sendWritingToolsOrSmartReplySignal:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WTAnalyticsDelegate *)self fromSmartReply])
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v8 = (id *)getIAChannelSmartRepliesSymbolLoc_ptr;
    uint64_t v19 = getIAChannelSmartRepliesSymbolLoc_ptr;
    if (!getIAChannelSmartRepliesSymbolLoc_ptr)
    {
      v9 = (void *)InputAnalyticsLibrary();
      v17[3] = (uint64_t)dlsym(v9, "IAChannelSmartReplies");
      getIAChannelSmartRepliesSymbolLoc_ptr = v17[3];
      uint64_t v8 = (id *)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v8)
    {
      v15 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v15);
    }
    id v10 = *v8;
  }
  else
  {
    getIAChannelWritingTools();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;
  if ([(WTAnalyticsDelegate *)self fromSmartReply]
    && (threadIdentifier = self->_threadIdentifier) != 0)
  {
    uint64_t v13 = [(NSString *)threadIdentifier copy];
  }
  else
  {
    uint64_t v13 = [(NSUUID *)self->_analyticsUUID UUIDString];
  }
  v14 = (void *)v13;
  [getIASignalAnalyticsClass() sendSignal:v6 toChannel:v11 withUniqueStringID:v13 withPayload:v7];
}

- (void)applicationDidEnterBackground
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v3 = (void *)getIASignalWritingToolsUISuspendedSymbolLoc_ptr;
  uint64_t v9 = getIASignalWritingToolsUISuspendedSymbolLoc_ptr;
  if (!getIASignalWritingToolsUISuspendedSymbolLoc_ptr)
  {
    v4 = (void *)InputAnalyticsLibrary();
    v7[3] = (uint64_t)dlsym(v4, "IASignalWritingToolsUISuspended");
    getIASignalWritingToolsUISuspendedSymbolLoc_ptr = v7[3];
    v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v5 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  [(WTAnalyticsDelegate *)self sendWritingToolsOrSmartReplySignal:*v3 withPayload:0];
}

- (void)applicationDidBecomeActive
{
  if (InputAnalyticsLibraryCore() && getIASignalWritingToolsUIResumedSymbolLoc())
  {
    IASignalWritingToolsUIResumedSymbolLoc = (id *)getIASignalWritingToolsUIResumedSymbolLoc();
    if (!IASignalWritingToolsUIResumedSymbolLoc)
    {
      v5 = (WTAnalyticsDelegate *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
      [(WTAnalyticsDelegate *)v5 applicationWillTerminate];
      return;
    }
    v4 = (__CFString *)*IASignalWritingToolsUIResumedSymbolLoc;
  }
  else
  {
    v4 = @"UIResumed";
  }
  id v7 = v4;
  [(WTAnalyticsDelegate *)self sendWritingToolsOrSmartReplySignal:v4 withPayload:0];
}

- (void)applicationWillTerminate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v3 = (void *)getIASignalWritingToolsUITerminatedSymbolLoc_ptr;
  uint64_t v9 = getIASignalWritingToolsUITerminatedSymbolLoc_ptr;
  if (!getIASignalWritingToolsUITerminatedSymbolLoc_ptr)
  {
    v4 = (void *)InputAnalyticsLibrary();
    v7[3] = (uint64_t)dlsym(v4, "IASignalWritingToolsUITerminated");
    getIASignalWritingToolsUITerminatedSymbolLoc_ptr = v7[3];
    v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v5 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  [(WTAnalyticsDelegate *)self sendWritingToolsOrSmartReplySignal:*v3 withPayload:0];
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(WTAnalyticsDelegate *)self setProofreadingSuggestions:v5];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(WTAnalyticsDelegate *)self setUuidSuggestionMapping:v6];

  [(WTAnalyticsDelegate *)self setNumDrafts:0];

  [(WTAnalyticsDelegate *)self setCurrentDraftNumber:0];
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v45 = v5;
  uint64_t v46 = [v5 type];
  uint64_t v44 = [v5 compositionSessionType];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v50;
    uint64_t v9 = &stru_270DB2A10;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "range", v44);
        [v11 range];
        uint64_t v14 = v13;
        v15 = [v11 attributedText];
        uint64_t v16 = [v15 string];
        LOBYTE(v12) = v14 + v12 > (unint64_t)[v16 length];

        v17 = [v11 attributedText];
        uint64_t v18 = [v17 string];
        if (v12)
        {

          v17 = WTIAWritingToolsLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [v11 range];
            [v11 range];
            uint64_t v21 = v20;
            v22 = [v11 attributedText];
            v23 = [v22 string];
            uint64_t v24 = [v23 length];
            *(_DWORD *)buf = 134218496;
            *(void *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2048;
            v61 = (void *)v24;
            _os_log_error_impl(&dword_261BE2000, v17, OS_LOG_TYPE_ERROR, "context.range (%lu, %lu) out of bounds (%lu)!", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v25 = [v11 range];
          uint64_t v27 = objc_msgSend(v18, "substringWithRange:", v25, v26);

          uint64_t v18 = (void *)v27;
        }

        if (v18)
        {
          uint64_t v28 = [(__CFString *)v9 stringByAppendingString:v18];

          uint64_t v9 = (__CFString *)v28;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = &stru_270DB2A10;
  }

  if (v46 == 2)
  {
    uint64_t v29 = [(WTAnalyticsDelegate *)self getWritingToolsFeatureDetailsForCompositionSessionType:v44];
  }
  else
  {
    if (v46 != 1)
    {
      v30 = WTIAWritingToolsLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[WTAnalyticsDelegate didBeginWritingToolsSession:contexts:]();
      }
      goto LABEL_30;
    }
    uint64_t v29 = getIAPayloadValueWritingToolsFeatureDetailsProofreadingReview();
  }
  v30 = v29;
  if (v29)
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    id v31 = (id *)getIASignalWritingToolsActionSelectedSymbolLoc_ptr;
    uint64_t v56 = getIASignalWritingToolsActionSelectedSymbolLoc_ptr;
    if (!getIASignalWritingToolsActionSelectedSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __getIASignalWritingToolsActionSelectedSymbolLoc_block_invoke;
      v61 = &unk_26558E480;
      v62 = &v53;
      v32 = (void *)InputAnalyticsLibrary();
      v33 = dlsym(v32, "IASignalWritingToolsActionSelected");
      *(void *)(v62[1] + 24) = v33;
      getIASignalWritingToolsActionSelectedSymbolLoc_ptr = *(void *)(v62[1] + 24);
      id v31 = (id *)v54[3];
    }
    _Block_object_dispose(&v53, 8);
    if (!v31) {
      goto LABEL_32;
    }
    id v34 = *v31;
    objc_super v35 = getIAPayloadKeyWritingToolsFeatureDetails();
    v57[0] = v35;
    v58[0] = v30;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    v36 = (void **)getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr;
    uint64_t v56 = getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr;
    if (!getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __getIAPayloadKeyWritingToolsInputTextSymbolLoc_block_invoke;
      v61 = &unk_26558E480;
      v62 = &v53;
      uint64_t v37 = (void *)InputAnalyticsLibrary();
      v38 = dlsym(v37, "IAPayloadKeyWritingToolsInputText");
      *(void *)(v62[1] + 24) = v38;
      getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr = *(void *)(v62[1] + 24);
      v36 = (void **)v54[3];
    }
    _Block_object_dispose(&v53, 8);
    if (!v36)
    {
LABEL_32:
      -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
      __break(1u);
    }
    v39 = *v36;
    v58[1] = v9;
    v57[1] = v39;
    v57[2] = @"IsEditable";
    v40 = NSNumber;
    id v41 = v39;
    v42 = objc_msgSend(v40, "numberWithBool:", -[WTAnalyticsDelegate isEditableText](self, "isEditableText"));
    v58[2] = v42;
    uint64_t v43 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
    [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v34 withPayload:v43];

LABEL_30:
  }
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  v33[1] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 type] == 2)
  {
    getIAPayloadValueWritingToolsUIRewritingView();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v8 = (id *)getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr;
    uint64_t v29 = getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr;
    if (!getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr)
    {
      uint64_t v9 = (void *)InputAnalyticsLibrary();
      v27[3] = (uint64_t)dlsym(v9, "IAPayloadValueWritingToolsUIProofreadingView");
      getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr = v27[3];
      uint64_t v8 = (id *)v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (!v8) {
      goto LABEL_25;
    }
    id v7 = *v8;
  }
  id v10 = v7;
  if (a4 != 3)
  {
    if (a4 == 2)
    {
      uint64_t v11 = getIASignalWritingToolsButtonTapped();
      uint64_t v18 = getIAPayloadKeyWritingToolsInteractionType();
      v30 = v18;
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v19 = (id *)getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr;
      uint64_t v29 = getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr)
      {
        uint64_t v20 = (void *)InputAnalyticsLibrary();
        v27[3] = (uint64_t)dlsym(v20, "IAPayloadValueWritingToolsInteractionTypeShowRewritten");
        getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr = v27[3];
        uint64_t v19 = (id *)v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (v19)
      {
        id v31 = *v19;
        uint64_t v21 = NSDictionary;
        id v22 = v31;
        v23 = [v21 dictionaryWithObjects:&v31 forKeys:&v30 count:1];

        [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v11 withPayload:v23];
        goto LABEL_23;
      }
    }
    else
    {
      if (a4 != 1)
      {
        uint64_t v11 = WTIAWritingToolsLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[WTAnalyticsDelegate writingToolsSession:didReceiveAction:]();
        }
        goto LABEL_23;
      }
      uint64_t v11 = getIASignalWritingToolsButtonTapped();
      uint64_t v12 = getIAPayloadKeyWritingToolsInteractionType();
      v32 = v12;
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v13 = (id *)getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr;
      uint64_t v29 = getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr;
      if (!getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr)
      {
        uint64_t v14 = (void *)InputAnalyticsLibrary();
        v27[3] = (uint64_t)dlsym(v14, "IAPayloadValueWritingToolsInteractionTypeShowOriginal");
        getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr = v27[3];
        uint64_t v13 = (id *)v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (v13)
      {
        v33[0] = *v13;
        v15 = NSDictionary;
        id v16 = v33[0];
        v17 = [v15 dictionaryWithObjects:v33 forKeys:&v32 count:1];

        [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v11 withPayload:v17];
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_25:
    -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    __break(1u);
  }
  [(WTAnalyticsDelegate *)self setNumDrafts:[(WTAnalyticsDelegate *)self numDrafts] + 1];
  [(WTAnalyticsDelegate *)self setCurrentDraftNumber:[(WTAnalyticsDelegate *)self numDrafts]];
  uint64_t v24 = getIAPayloadValueWritingToolsUIRewritingView();
  BOOL v25 = v10 == v24;

  if (!v25)
  {
    uint64_t v11 = WTIAWritingToolsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WTAnalyticsDelegate writingToolsSession:didReceiveAction:].cold.4((uint64_t)v10, v11);
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 type] == 1)
  {
    id v56 = v6;
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
    uint64_t v10 = [v9 count];

    char v11 = 0;
    if (v10)
    {
      unint64_t v12 = 0;
      do
      {
        if (v4)
        {
          uint64_t v13 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
          uint64_t v14 = [v13 objectAtIndexedSubscript:v12];
          uint64_t v15 = [v14 state];

          if (v15 == 3)
          {
            id v16 = [NSNumber numberWithUnsignedInteger:v12];
            uint64_t v18 = v8;
            goto LABEL_13;
          }
          if (v15 == 1)
          {
            id v16 = [NSNumber numberWithUnsignedInteger:v12];
            uint64_t v18 = v7;
LABEL_13:
            [v18 addObject:v16];
            char v11 = 1;
            goto LABEL_16;
          }
          if (v15)
          {
            id v16 = WTIAWritingToolsLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
              id v22 = [v21 objectAtIndexedSubscript:v12];
              uint64_t v23 = [v22 state];
              *(_DWORD *)buf = 134218240;
              uint64_t v68 = v23;
              __int16 v69 = 2048;
              unint64_t v70 = v12;
              _os_log_error_impl(&dword_261BE2000, v16, OS_LOG_TYPE_ERROR, "didEndWritingToolsSession: Unexpected proofreading suggestion state %lu for index %lu", buf, 0x16u);
            }
            goto LABEL_16;
          }
          id v16 = [NSNumber numberWithUnsignedInteger:v12];
          v17 = v7;
        }
        else
        {
          id v16 = [NSNumber numberWithUnsignedInteger:v12];
          v17 = v8;
        }
        [v17 addObject:v16];
LABEL_16:

        ++v12;
        uint64_t v19 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
        unint64_t v20 = [v19 count];
      }
      while (v12 < v20);
    }
    if ([v7 count])
    {
      if (InputAnalyticsLibraryCore() && getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc())
      {
        getIAPayloadValueWritingToolsInteractionTypeUnspecified();
        BOOL v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v25 = @"Unspecified";
      }
      uint64_t v55 = getIASignalWritingToolsResultsAccepted();
      v54 = getIAPayloadKeyWritingToolsAcceptedAll();
      v65[0] = v54;
      uint64_t v26 = NSNumber;
      if (v11)
      {
        BOOL v27 = 0;
      }
      else
      {
        uint64_t v28 = [v7 count];
        uint64_t v53 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
        BOOL v27 = v28 == [v53 count];
      }
      uint64_t v29 = [v26 numberWithInt:v27];
      v66[0] = v29;
      v30 = getIAPayloadKeyWritingToolsResultIndices();
      v65[1] = v30;
      v66[1] = v7;
      id v31 = getIAPayloadKeyWritingToolsInteractionType();
      v65[2] = v31;
      v32 = v25;
      v66[2] = v25;
      v33 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
      [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v55 withPayload:v33];

      if ((v11 & 1) == 0) {
    }
      }
    if ([v8 count])
    {
      id v34 = getIASignalWritingToolsResultsRejected();
      objc_super v35 = getIAPayloadKeyWritingToolsRejectedAll();
      v63[0] = v35;
      v36 = [NSNumber numberWithInt:!v4];
      v64[0] = v36;
      uint64_t v37 = getIAPayloadKeyWritingToolsResultIndices();
      v63[1] = v37;
      v64[1] = v8;
      v38 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
      [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v34 withPayload:v38];
    }
    id v6 = v56;
    goto LABEL_44;
  }
  if ([v6 type] != 2)
  {
    id v7 = WTIAWritingToolsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WTAnalyticsDelegate didEndWritingToolsSession:accepted:](v6, v7);
    }
    goto LABEL_44;
  }
  if (v4)
  {
    if (InputAnalyticsLibraryCore() && getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc())
    {
      id v24 = v6;
      id v7 = getIAPayloadValueWritingToolsInteractionTypeUnspecified();
    }
    else
    {
      id v24 = v6;
      id v7 = @"Unspecified";
    }
    uint64_t v46 = getIASignalWritingToolsResultsAccepted();
    v47 = getIAPayloadKeyWritingToolsAcceptedAll();
    v61[0] = v47;
    v62[0] = MEMORY[0x263EFFA80];
    v48 = getIAPayloadKeyWritingToolsResultIndices();
    v61[1] = v48;
    long long v49 = objc_msgSend(NSNumber, "numberWithInteger:", -[WTAnalyticsDelegate currentDraftNumber](self, "currentDraftNumber"));
    v60 = v49;
    long long v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    v62[1] = v50;
    long long v51 = getIAPayloadKeyWritingToolsInteractionType();
    v61[2] = v51;
    v62[2] = v7;
    long long v52 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];
    [(WTAnalyticsDelegate *)self sendWritingToolsOrSmartReplySignal:v46 withPayload:v52];

    id v6 = v24;
    goto LABEL_44;
  }
  if ([v6 requestedTool] != 201
    || [(WTAnalyticsDelegate *)self currentDraftNumber] >= 1)
  {
    id v7 = getIASignalWritingToolsResultsRejected();
    getIAPayloadKeyWritingToolsRejectedAll();
    v40 = id v39 = v6;
    v58[0] = v40;
    id v41 = [NSNumber numberWithInt:1];
    v59[0] = v41;
    v42 = getIAPayloadKeyWritingToolsResultIndices();
    v58[1] = v42;
    uint64_t v43 = objc_msgSend(NSNumber, "numberWithInteger:", -[WTAnalyticsDelegate currentDraftNumber](self, "currentDraftNumber"));
    v57 = v43;
    uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    v59[1] = v44;
    v45 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
    [(WTAnalyticsDelegate *)self sendWritingToolsOrSmartReplySignal:v7 withPayload:v45];

    id v6 = v39;
LABEL_44:
  }
  [(WTAnalyticsDelegate *)self setProofreadingSuggestions:0];
  [(WTAnalyticsDelegate *)self setUuidSuggestionMapping:0];
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  uint64_t v10 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
  [v10 addObjectsFromArray:v9];

  if (v7)
  {
    char v11 = [(WTAnalyticsDelegate *)self proofreadingSuggestions];
    uint64_t v12 = [v11 count];

    uint64_t v13 = getIASignalWritingToolsResultsOffered();
    uint64_t v14 = getIAPayloadKeyWritingToolsNumResultsOffered();
    v30 = v14;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
    v31[0] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v13 withPayload:v16];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
        uint64_t v23 = [(WTAnalyticsDelegate *)self uuidSuggestionMapping];
        id v24 = [v22 uuid];
        [v23 setObject:v22 forKeyedSubscript:v24];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v8 = a5;
  id v10 = [(WTAnalyticsDelegate *)self uuidSuggestionMapping];
  id v9 = [v10 objectForKeyedSubscript:v8];

  [v9 setState:a4];
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  v30[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v7)
  {
    unint64_t v14 = [(WTAnalyticsDelegate *)self numDrafts];
    uint64_t v15 = getIASignalWritingToolsResultsOffered();
    id v16 = getIAPayloadKeyWritingToolsNumResultsOffered();
    long long v28 = v16;
    id v17 = [NSNumber numberWithUnsignedInteger:1];
    v30[0] = v17;
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v18 = (id *)getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr;
    uint64_t v27 = getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr;
    if (!getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr)
    {
      uint64_t v19 = (void *)InputAnalyticsLibrary();
      v25[3] = (uint64_t)dlsym(v19, "IAPayloadKeyWritingToolsResultIndex");
      getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr = v25[3];
      uint64_t v18 = (id *)v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v18)
    {
      -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
      __break(1u);
    }
    id v29 = *v18;
    uint64_t v20 = NSNumber;
    id v21 = v29;
    id v22 = [v20 numberWithUnsignedInteger:v14];
    v30[1] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v28 count:2];
    [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:v15 withPayload:v23];
  }
}

- (void)endWritingTools
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v3 = (void *)getIASignalWritingToolsPanelDismissedSymbolLoc_ptr;
  uint64_t v9 = getIASignalWritingToolsPanelDismissedSymbolLoc_ptr;
  if (!getIASignalWritingToolsPanelDismissedSymbolLoc_ptr)
  {
    BOOL v4 = (void *)InputAnalyticsLibrary();
    v7[3] = (uint64_t)dlsym(v4, "IASignalWritingToolsPanelDismissed");
    getIASignalWritingToolsPanelDismissedSymbolLoc_ptr = v7[3];
    v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    id v5 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  [(WTAnalyticsDelegate *)self sendWritingToolsOnlySignal:*v3 withPayload:0];
}

- (void)undo
{
  uint64_t v3 = [(WTAnalyticsDelegate *)self currentDraftNumber];
  uint64_t v4 = 2;
  if (v3 > 2) {
    uint64_t v4 = v3;
  }

  [(WTAnalyticsDelegate *)self setCurrentDraftNumber:v4 - 1];
}

- (void)redo
{
  int64_t v3 = [(WTAnalyticsDelegate *)self currentDraftNumber];
  unint64_t v4 = [(WTAnalyticsDelegate *)self numDrafts];
  if (v3 + 1 > v4) {
    unint64_t v5 = v3 + 1;
  }
  else {
    unint64_t v5 = v4;
  }

  [(WTAnalyticsDelegate *)self setCurrentDraftNumber:v5];
}

- (BOOL)fromSmartReply
{
  return self->_fromSmartReply;
}

- (void)setFromSmartReply:(BOOL)a3
{
  self->_fromSmartReply = a3;
}

- (BOOL)isEditableText
{
  return self->_isEditableText;
}

- (void)setIsEditableText:(BOOL)a3
{
  self->_isEditableText = a3;
}

- (NSUUID)analyticsUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAnalyticsUUID:(id)a3
{
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSMutableArray)proofreadingSuggestions
{
  return self->_proofreadingSuggestions;
}

- (void)setProofreadingSuggestions:(id)a3
{
}

- (NSMutableDictionary)uuidSuggestionMapping
{
  return self->_uuidSuggestionMapping;
}

- (void)setUuidSuggestionMapping:(id)a3
{
}

- (unint64_t)numDrafts
{
  return self->_numDrafts;
}

- (void)setNumDrafts:(unint64_t)a3
{
  self->_numDrafts = a3;
}

- (int64_t)currentDraftNumber
{
  return self->_currentDraftNumber;
}

- (void)setCurrentDraftNumber:(int64_t)a3
{
  self->_currentDraftNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidSuggestionMapping, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestions, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);

  objc_storeStrong((id *)&self->_analyticsUUID, 0);
}

- (uint64_t)initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:.cold.1()
{
  dlerror();
  v0 = abort_report_np();
  return -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:](v0);
}

- (void)initWithSmartReplyBool:(os_log_t)log smartReplyConfig:analyticsUUID:requestedTool:isEditable:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_261BE2000, log, OS_LOG_TYPE_DEBUG, "Begin - WTPanelBringup", v1, 2u);
}

- (void)didBeginWritingToolsSession:contexts:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_261BE2000, v0, OS_LOG_TYPE_ERROR, "Unsupported session type: %lu", v1, 0xCu);
}

- (void)writingToolsSession:didReceiveAction:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_261BE2000, v0, OS_LOG_TYPE_DEBUG, "didReceiveAction: %lu ignored", v1, 0xCu);
}

- (void)writingToolsSession:(uint64_t)a1 didReceiveAction:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v4 = getIAPayloadValueWritingToolsUIRewritingView();
  OUTLINED_FUNCTION_0();
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_261BE2000, a2, OS_LOG_TYPE_ERROR, "WTActionShowRewritten action performed, expected UI to be rewriting view (%lu) but got %lu", v5, 0x16u);
}

- (void)didEndWritingToolsSession:(void *)a1 accepted:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 type];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_261BE2000, a2, OS_LOG_TYPE_ERROR, "didEndWritingToolsSession: Unsupported session type: %lu", v3, 0xCu);
}

@end