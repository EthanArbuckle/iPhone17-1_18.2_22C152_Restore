uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id _WTVCLog()
{
  if (_WTVCLog_onceToken[0] != -1) {
    dispatch_once(_WTVCLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)_WTVCLog_log;

  return v0;
}

void sub_261BE78A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_261BE7C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_261BE8A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
}

__CFString *getIAPayloadValueWritingToolsFeatureDetailsIndex()
{
  return @"Index";
}

__CFString *getIAPayloadValueWritingToolsFeatureDetailsSummaryTransform()
{
  return @"SummaryTransform";
}

__CFString *getIAPayloadValueWritingToolsFeatureDetailsSmartReply()
{
  return @"SmartReply";
}

__CFString *getIAPayloadValueWritingToolsFeatureDetailsCompose()
{
  return @"Compose";
}

__CFString *getIAPayloadKeyWritingToolsIsEditable()
{
  return @"IsEditable";
}

__CFString *getIAPayloadValueWritingToolsUIUnspecified()
{
  return @"Unspecified";
}

id WTIAWritingToolsLog()
{
  if (WTIAWritingToolsLog_onceToken != -1) {
    dispatch_once(&WTIAWritingToolsLog_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)WTIAWritingToolsLog___instance;

  return v0;
}

uint64_t __WTIAWritingToolsLog_block_invoke()
{
  WTIAWritingToolsLog___instance = (uint64_t)os_log_create("com.apple.WritingTools", "WritingToolsAnalytics");

  return MEMORY[0x270F9A758]();
}

id WTIATextAssistantLog()
{
  if (WTIATextAssistantLog_onceToken != -1) {
    dispatch_once(&WTIATextAssistantLog_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)WTIATextAssistantLog___instance;

  return v0;
}

uint64_t __WTIATextAssistantLog_block_invoke()
{
  WTIATextAssistantLog___instance = (uint64_t)os_log_create("com.apple.InputAnalytics", "TextAssistant");

  return MEMORY[0x270F9A758]();
}

void sub_261BE99A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIAPayloadKeyWritingToolsFeatureDetails()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadKeyWritingToolsFeatureDetailsSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadKeyWritingToolsFeatureDetailsSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsFeatureDetailsSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadKeyWritingToolsFeatureDetails");
    getIAPayloadKeyWritingToolsFeatureDetailsSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsMagicRewrite()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsMagicRewrite");
    getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsConciseTone()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsConciseTone");
    getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsFriendlyTone()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsFriendlyTone");
    getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsProfessionalTone()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsProfessionalTone");
    getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsOpenEndedTone()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsOpenEndedToneSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsOpenEndedToneSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsOpenEndedToneSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsOpenEndedTone");
    getIAPayloadValueWritingToolsFeatureDetailsOpenEndedToneSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransform()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsTakeawaysTransform");
    getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsBulletsTransform()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsBulletsTransform");
    getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsTablesTransform()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsTablesTransform");
    getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsFeatureDetailsProofreadingReview()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsFeatureDetailsProofreadingReviewSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsFeatureDetailsProofreadingReviewSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsFeatureDetailsProofreadingReviewSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsFeatureDetailsProofreadingReview");
    getIAPayloadValueWritingToolsFeatureDetailsProofreadingReviewSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIASignalAnalyticsClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getIASignalAnalyticsClass_softClass;
  uint64_t v6 = getIASignalAnalyticsClass_softClass;
  if (!getIASignalAnalyticsClass_softClass)
  {
    InputAnalyticsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("IASignalAnalytics");
    getIASignalAnalyticsClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_261BEA900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIAChannelWritingTools()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAChannelWritingToolsSymbolLoc_ptr;
  uint64_t v8 = getIAChannelWritingToolsSymbolLoc_ptr;
  if (!getIAChannelWritingToolsSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAChannelWritingTools");
    getIAChannelWritingToolsSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

void sub_261BEB424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_261BEB8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getIAPayloadValueWritingToolsUIRewritingView()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsUIRewritingView");
    getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIASignalWritingToolsButtonTapped()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIASignalWritingToolsButtonTappedSymbolLoc_ptr;
  uint64_t v8 = getIASignalWritingToolsButtonTappedSymbolLoc_ptr;
  if (!getIASignalWritingToolsButtonTappedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IASignalWritingToolsButtonTapped");
    getIASignalWritingToolsButtonTappedSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadKeyWritingToolsInteractionType()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadKeyWritingToolsInteractionType");
    getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadValueWritingToolsInteractionTypeUnspecified()
{
  IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc = (void **)getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc();
  if (IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc)
  {
    id v1 = *IAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t v3 = -[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    return (id)getIASignalWritingToolsResultsAccepted(v3);
  }
}

id getIASignalWritingToolsResultsAccepted()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr;
  uint64_t v8 = getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr;
  if (!getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IASignalWritingToolsResultsAccepted");
    getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadKeyWritingToolsAcceptedAll()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadKeyWritingToolsAcceptedAll");
    getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadKeyWritingToolsResultIndices()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadKeyWritingToolsResultIndices");
    getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIASignalWritingToolsResultsRejected()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIASignalWritingToolsResultsRejectedSymbolLoc_ptr;
  uint64_t v8 = getIASignalWritingToolsResultsRejectedSymbolLoc_ptr;
  if (!getIASignalWritingToolsResultsRejectedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IASignalWritingToolsResultsRejected");
    getIASignalWritingToolsResultsRejectedSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadKeyWritingToolsRejectedAll()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadKeyWritingToolsRejectedAll");
    getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIASignalWritingToolsResultsOffered()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIASignalWritingToolsResultsOfferedSymbolLoc_ptr;
  uint64_t v8 = getIASignalWritingToolsResultsOfferedSymbolLoc_ptr;
  if (!getIASignalWritingToolsResultsOfferedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IASignalWritingToolsResultsOffered");
    getIASignalWritingToolsResultsOfferedSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id getIAPayloadKeyWritingToolsNumResultsOffered()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr;
  uint64_t v8 = getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr;
  if (!getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v6[3] = (uint64_t)dlsym(v1, "IAPayloadKeyWritingToolsNumResultsOffered");
    getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)-[WTAnalyticsDelegate initWithSmartReplyBool:smartReplyConfig:analyticsUUID:requestedTool:isEditable:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

void sub_261BECEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIASignalWritingToolsPanelAppearedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  result = dlsym(v2, "IASignalWritingToolsPanelAppeared");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsPanelAppearedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t InputAnalyticsLibrary()
{
  uint64_t v0 = InputAnalyticsLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t InputAnalyticsLibraryCore()
{
  if (!InputAnalyticsLibraryCore_frameworkLibrary) {
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return InputAnalyticsLibraryCore_frameworkLibrary;
}

uint64_t __InputAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  InputAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getIAPayloadKeyWritingToolsFeatureDetailsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadKeyWritingToolsFeatureDetails");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsFeatureDetailsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsUISymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadKeyWritingToolsUI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsUISymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsGenericSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsGeneric");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsGenericSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsMagicRewrite");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsMagicRewriteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsConciseTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsConciseToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsFriendlyTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsFriendlyToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsProfessionalTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsProfessionalToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsOpenEndedToneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsOpenEndedTone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsOpenEndedToneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsTakeawaysTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsTakeawaysTransformSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsBulletsTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsBulletsTransformSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsTablesTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsTablesTransformSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsFeatureDetailsProofreadingReviewSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsFeatureDetailsProofreadingReview");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsFeatureDetailsProofreadingReviewSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

Class __getIASignalAnalyticsClass_block_invoke(uint64_t a1)
{
  InputAnalyticsLibraryCore();
  Class result = objc_getClass("IASignalAnalytics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalAnalyticsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAChannelWritingToolsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAChannelWritingTools");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAChannelWritingToolsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAChannelSmartRepliesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAChannelSmartReplies");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAChannelSmartRepliesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIASignalWritingToolsUISuspendedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsUISuspended");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsUISuspendedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getIASignalWritingToolsUIResumedSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIASignalWritingToolsUIResumedSymbolLoc_ptr;
  uint64_t v6 = getIASignalWritingToolsUIResumedSymbolLoc_ptr;
  if (!getIASignalWritingToolsUIResumedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IASignalWritingToolsUIResumed");
    getIASignalWritingToolsUIResumedSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_261BED940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIASignalWritingToolsUIResumedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsUIResumed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsUIResumedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIASignalWritingToolsUITerminatedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsUITerminated");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsUITerminatedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIASignalWritingToolsActionSelectedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsActionSelected");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsActionSelectedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsInputTextSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsInputText");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsInputTextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadValueWritingToolsUIRewritingView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsUIRewritingViewSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadValueWritingToolsUIProofreadingView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsUIProofreadingViewSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getIASignalWritingToolsButtonTappedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsButtonTapped");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsButtonTappedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsInteractionType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsInteractionTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadValueWritingToolsInteractionTypeShowOriginal");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsInteractionTypeShowOriginalSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadValueWritingToolsInteractionTypeShowRewritten");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsInteractionTypeShowRewrittenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

uint64_t getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr;
  uint64_t v6 = getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr;
  if (!getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr)
  {
    id v1 = (void *)InputAnalyticsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IAPayloadValueWritingToolsInteractionTypeUnspecified");
    getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_261BEDD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadValueWritingToolsInteractionTypeUnspecified");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsInteractionTypeUnspecifiedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

void *__getIASignalWritingToolsResultsAcceptedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsResultsAccepted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsResultsAcceptedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsAcceptedAll");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsAcceptedAllSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsResultIndices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsResultIndicesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIASignalWritingToolsResultsRejectedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsResultsRejected");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsResultsRejectedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsRejectedAll");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsRejectedAllSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIASignalWritingToolsResultsOfferedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsResultsOffered");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsResultsOfferedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsNumResultsOffered");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsNumResultsOfferedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsResultIndexSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IAPayloadKeyWritingToolsResultIndex");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsResultIndexSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIASignalWritingToolsPanelDismissedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)InputAnalyticsLibrary();
  Class result = dlsym(v2, "IASignalWritingToolsPanelDismissed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsPanelDismissedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_261BEED2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_261BF0C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
}

void sub_261BF2860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_261BF3724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_261BF3A98(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_261BF42E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_261BF8808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

void sub_261BFA0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_261C00EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_261C016D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_261C01B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _performSyncOnMain(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___performSyncOnMain_block_invoke;
  block[3] = &unk_26558E848;
  id v4 = v1;
  id v2 = v1;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t ___performSyncOnMain_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_261C03194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WTInputAnalyticsLog()
{
  if (WTInputAnalyticsLog_onceToken != -1) {
    dispatch_once(&WTInputAnalyticsLog_onceToken, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)WTInputAnalyticsLog___instance;

  return v0;
}

uint64_t __WTInputAnalyticsLog_block_invoke()
{
  WTInputAnalyticsLog___instance = (uint64_t)os_log_create("com.apple.WritingTools", "IASignalAnalytics");

  return MEMORY[0x270F9A758]();
}

void sub_261C078F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIASignalAnalyticsClass_block_invoke_0(uint64_t a1)
{
  InputAnalyticsLibraryCore_0();
  Class result = objc_getClass("IASignalAnalytics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalAnalyticsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t InputAnalyticsLibraryCore_0()
{
  if (!InputAnalyticsLibraryCore_frameworkLibrary_0) {
    InputAnalyticsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return InputAnalyticsLibraryCore_frameworkLibrary_0;
}

uint64_t __InputAnalyticsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  InputAnalyticsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getIAChannelWritingToolsSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)InputAnalyticsLibrary_0();
  uint64_t result = dlsym(v2, "IAChannelWritingTools");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAChannelWritingToolsSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t InputAnalyticsLibrary_0()
{
  uint64_t v0 = InputAnalyticsLibraryCore_0();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getIASignalWritingToolsPanelRequestedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)InputAnalyticsLibrary_0();
  uint64_t result = dlsym(v2, "IASignalWritingToolsPanelRequested");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIASignalWritingToolsPanelRequestedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadKeyWritingToolsUISymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)InputAnalyticsLibrary_0();
  uint64_t result = dlsym(v2, "IAPayloadKeyWritingToolsUI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadKeyWritingToolsUISymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIAPayloadValueWritingToolsUIAffordanceSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)InputAnalyticsLibrary_0();
  uint64_t result = dlsym(v2, "IAPayloadValueWritingToolsUIAffordance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIAPayloadValueWritingToolsUIAffordanceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void type metadata accessor for UIUserInterfaceIdiom(uint64_t a1)
{
}

void type metadata accessor for UIUserInterfaceSizeClass(uint64_t a1)
{
}

void type metadata accessor for WTFormSheetUIType(uint64_t a1)
{
}

void type metadata accessor for UIWritingToolsResultOptions(uint64_t a1)
{
}

void type metadata accessor for WTRequestedTool(uint64_t a1)
{
}

void sub_261C0814C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_261C08194()
{
  uint64_t v0 = sub_261C10B90();
  __swift_allocate_value_buffer(v0, qword_26B417640);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B417640);
  return sub_261C10B80();
}

void sub_261C0820C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_261C08214@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_261C08228@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_261C0823C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_261C08250(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_261C08280@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_261C082AC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_261C082D0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_261C082E4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_261C082F8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_261C0830C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_261C08320(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_261C08334(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_261C08348(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_261C0835C()
{
  return *v0 == 0;
}

uint64_t sub_261C0836C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_261C08384(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_261C08398(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_261C083AC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_261C08528(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_261C083EC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_261C083F8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_261C08408(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_261C08414()
{
  return sub_261C0847C(&qword_26A9546C0);
}

uint64_t sub_261C08448()
{
  return sub_261C0847C(&qword_26A9546C8);
}

uint64_t sub_261C0847C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UIWritingToolsResultOptions(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261C084C0()
{
  return sub_261C0847C(&qword_26A9546D0);
}

uint64_t sub_261C084F4()
{
  return sub_261C0847C(&qword_26A9546D8);
}

uint64_t sub_261C08528(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WritingTools(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WritingTools(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    void *result = a2 + 14;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x261C086CCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 14;
        break;
    }
  }
  return result;
}

uint64_t sub_261C086F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_261C08700(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WritingTools()
{
  return &type metadata for WritingTools;
}

unint64_t sub_261C0871C()
{
  unint64_t result = qword_26A9546E0;
  if (!qword_26A9546E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9546E0);
  }
  return result;
}

const char *sub_261C08770(char a1)
{
  unint64_t result = "Panel_iOS";
  switch(a1)
  {
    case 1:
      unint64_t result = "Panel_iPadOS";
      break;
    case 2:
      unint64_t result = "Panel_macOS";
      break;
    case 3:
      unint64_t result = "OpenEndedAdjustmentV2";
      break;
    case 4:
      unint64_t result = "OpenEndedAdjustmentV2_FollowUp";
      break;
    case 5:
      unint64_t result = "Montara";
      break;
    case 6:
      unint64_t result = "Montara_PersonalInfoSearch";
      break;
    case 7:
      unint64_t result = "Montara_NonInlineClients";
      break;
    case 8:
      unint64_t result = "Montara_PromptEntryView";
      break;
    case 9:
      unint64_t result = "Montara_SlotFill";
      break;
    case 10:
      unint64_t result = "Montara_PopoverAdjustment";
      break;
    case 11:
      unint64_t result = "CustomQuestionnaireEntry";
      break;
    case 12:
      unint64_t result = "AlternateQuestionnaire_macOS";
      break;
    case 13:
      unint64_t result = "AlternateQuestionnaire_iPadOS";
      break;
    case 14:
      unint64_t result = "FeedbackFCSBehavior";
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_261C088F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_261C08904()
{
  return sub_261C10DA0();
}

uint64_t sub_261C0894C()
{
  return sub_261C10D90();
}

uint64_t sub_261C08978()
{
  return sub_261C10DA0();
}

const char *sub_261C089BC()
{
  return "WritingTools";
}

const char *sub_261C089D0()
{
  return sub_261C08770(*v0);
}

uint64_t sub_261C089F0()
{
  uint64_t v0 = sub_261C10AE0();
  uint64_t v36 = *(void *)(v0 - 8);
  uint64_t v37 = v0;
  uint64_t v1 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  v38 = (char *)&v35 - v4;
  uint64_t v5 = sub_261C10AF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_261C10B10();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_261C10B40();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261C10B00();
  sub_261C10B30();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_261C10B20();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (v17 == *MEMORY[0x263F40F98])
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 1;
  }
  if (v17 == *MEMORY[0x263F40FA8])
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v8, v5);
    uint64_t v20 = v36;
    uint64_t v19 = v37;
    v21 = v38;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v38, v8, v37);
    if (qword_26B417590 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_261C10B90();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B417640);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v3, v21, v19);
    v23 = sub_261C10B70();
    os_log_type_t v24 = sub_261C10C20();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v40 = v26;
      *(_DWORD *)v25 = 136315138;
      sub_261C0990C();
      uint64_t v27 = sub_261C10D50();
      uint64_t v39 = sub_261C08FF4(v27, v28, &v40);
      sub_261C10C50();
      swift_bridgeObjectRelease();
      v29 = *(void (**)(char *, uint64_t))(v20 + 8);
      v29(v3, v19);
      _os_log_impl(&dword_261BE2000, v23, v24, "isAvailable: unavailable, info = %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E4F980](v26, -1, -1);
      MEMORY[0x263E4F980](v25, -1, -1);

      v30 = v38;
    }
    else
    {

      v29 = *(void (**)(char *, uint64_t))(v20 + 8);
      v29(v3, v19);
      v30 = v21;
    }
    v29(v30, v19);
  }
  else
  {
    if (v17 == *MEMORY[0x263F41150]) {
      return 1;
    }
    if (qword_26B417590 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_261C10B90();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B417640);
    v32 = sub_261C10B70();
    os_log_type_t v33 = sub_261C10C10();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_261BE2000, v32, v33, "isAvailable: @unknown default", v34, 2u);
      MEMORY[0x263E4F980](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return 0;
}

uint64_t sub_261C08FF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_261C090C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_261C09964((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_261C09964((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_261C090C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_261C10C60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_261C09284(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_261C10C90();
  if (!v8)
  {
    sub_261C10CA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_261C10CB0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_261C09284(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_261C0931C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_261C094FC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_261C094FC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_261C0931C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_261C09494(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_261C10C80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_261C10CA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_261C10C00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_261C10CB0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_261C10CA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_261C09494(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9546F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_261C094FC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9546F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_261C10CB0();
  __break(1u);
  return result;
}

id sub_261C0964C()
{
  id v0 = objc_msgSend(self, sel_currentTraitCollection);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (v1 == (id)1)
  {
    uint64_t v14 = &type metadata for WritingTools;
    unint64_t v15 = sub_261C098B8();
    LOBYTE(v13[0]) = 1;
    goto LABEL_5;
  }
  if (!v1)
  {
    uint64_t v14 = &type metadata for WritingTools;
    unint64_t v15 = sub_261C098B8();
    LOBYTE(v13[0]) = 0;
LABEL_5:
    int v2 = sub_261C10AD0();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
    goto LABEL_7;
  }
  int v2 = 0;
LABEL_7:
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    unint64_t v4 = result;
    unsigned int v5 = objc_msgSend(result, sel_isWritingToolsAllowed);

    int v6 = sub_261C089F0();
    char v7 = v6;
    uint64_t v8 = v2 & v6 & v5;
    if (byte_26A9546E8 == 2 || ((((byte_26A9546E8 & 1) == 0) ^ v8) & 1) == 0)
    {
      byte_26A9546E8 = v2 & v6 & v5;
      if (qword_26B417590 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_261C10B90();
      __swift_project_value_buffer(v9, (uint64_t)qword_26B417640);
      uint64_t v10 = sub_261C10B70();
      os_log_type_t v11 = sub_261C10C20();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 67109632;
        v13[0] = v2 & 1;
        sub_261C10C50();
        *(_WORD *)(v12 + 8) = 1024;
        v13[0] = v5;
        sub_261C10C50();
        *(_WORD *)(v12 + 14) = 1024;
        v13[0] = v7 & 1;
        sub_261C10C50();
        _os_log_impl(&dword_261BE2000, v10, v11, "isAvailable value changed: featureEnabled = %{BOOL}d, isMDMAllowed = %{BOOL}d, gmAvailable (current) = %{BOOL}d", (uint8_t *)v12, 0x14u);
        MEMORY[0x263E4F980](v12, -1, -1);
      }
    }
    return (id)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_261C098B8()
{
  unint64_t result = qword_26B417598;
  if (!qword_26B417598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B417598);
  }
  return result;
}

unint64_t sub_261C0990C()
{
  unint64_t result = qword_26B4175A0;
  if (!qword_26B4175A0)
  {
    sub_261C10AE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B4175A0);
  }
  return result;
}

uint64_t sub_261C09964(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_261C09A14()
{
  return sub_261C0B408(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
}

uint64_t sub_261C09A2C(uint64_t a1, uint64_t a2)
{
  return sub_261C0B4F0(a1, a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
}

uint64_t (*sub_261C09A38())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C09ADC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_261C09B70(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C09BBC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C09C60()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C09CF4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C09D40())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C09DE4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C09E78(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C09EC4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C09F68()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_261C09FFC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C0A048())()
{
  return j__swift_endAccess;
}

void *sub_261C0A0F4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  int v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_261C0A1A4(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *id v3 = a1;
}

void sub_261C0A1F8(void **a1, void *a2)
{
  int v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_261C0A25C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A300()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0A394(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0A3E0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A484()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0A518(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0A564())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A608()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0A69C(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0A6E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A78C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_261C0A820(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0A86C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A8D4@<X0>(uint64_t a1@<X8>)
{
  return sub_261C0B04C(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID, a1);
}

uint64_t sub_261C0A8EC(uint64_t a1)
{
  return sub_261C0B1F4(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

uint64_t (*sub_261C0A8F8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A960@<X0>(uint64_t a1@<X8>)
{
  return sub_261C0B04C(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID, a1);
}

uint64_t sub_261C0A978(uint64_t a1)
{
  return sub_261C0B1F4(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

uint64_t (*sub_261C0A984())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0A9EC@<X0>(uint64_t a1@<X8>)
{
  return sub_261C0B04C(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID, a1);
}

uint64_t sub_261C0AA04(uint64_t a1)
{
  return sub_261C0B1F4(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

uint64_t (*sub_261C0AA10())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0AAB4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0AB48(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0AB94())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0AC38()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_261C0ACCC(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0AD18())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0ADBC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0AE50(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_261C0AE9C())()
{
  return j_j__swift_endAccess;
}

id sub_261C0AF04(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1 + *a3;
  swift_beginAccess();
  sub_261C0DE48(v8, (uint64_t)v7);
  uint64_t v9 = sub_261C10AC0();
  uint64_t v10 = *(void *)(v9 - 8);
  os_log_type_t v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    os_log_type_t v11 = (void *)sub_261C10AA0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }

  return v11;
}

uint64_t sub_261C0B040@<X0>(uint64_t a1@<X8>)
{
  return sub_261C0B04C(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID, a1);
}

uint64_t sub_261C0B04C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return sub_261C0DE48(v4, a2);
}

void sub_261C0B0A8(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_261C10AB0();
    uint64_t v10 = sub_261C10AC0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_261C10AC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  uint64_t v12 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  id v13 = a1;
  sub_261C0DEB0((uint64_t)v9, v12);
  swift_endAccess();
}

uint64_t sub_261C0B1E8(uint64_t a1)
{
  return sub_261C0B1F4(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID);
}

uint64_t sub_261C0B1F4(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  sub_261C0DEB0(a1, v4);
  return swift_endAccess();
}

uint64_t sub_261C0B24C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261C0DE48(a1, (uint64_t)v10);
  uint64_t v11 = *a2 + *a5;
  swift_beginAccess();
  sub_261C0DEB0((uint64_t)v10, v11);
  return swift_endAccess();
}

uint64_t (*sub_261C0B30C())()
{
  return j_j__swift_endAccess;
}

id sub_261C0B374(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_261C10BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_261C0B3FC()
{
  return sub_261C0B408(&OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID);
}

uint64_t sub_261C0B408(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_261C0B468(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_261C10BE0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *uint64_t v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_261C0B4E4(uint64_t a1, uint64_t a2)
{
  return sub_261C0B4F0(a1, a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID);
}

uint64_t sub_261C0B4F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  void *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_261C0B54C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_261C0B5B4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0B658()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0B6EC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C0B738())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0B7DC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_261C0B870(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C0B8BC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_261C0B960()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_261C0B9F4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_261C0BA40())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_261C0BA9C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574736575716572;
      break;
    case 2:
      unint64_t result = 0x656C626174696465;
      break;
    case 3:
    case 18:
      return result;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0x737341726F467369;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      unint64_t result = 0x656568536D726F66;
      break;
    case 10:
      unint64_t result = 0x556E6F6973736573;
      break;
    case 11:
      unint64_t result = 0x6974736567677573;
      break;
    case 12:
      unint64_t result = 0x55747865746E6F63;
      break;
    case 13:
      unint64_t result = 0xD000000000000016;
      break;
    case 14:
      unint64_t result = 0xD000000000000022;
      break;
    case 15:
      unint64_t result = 0xD000000000000016;
      break;
    case 16:
      unint64_t result = 0x636974796C616E61;
      break;
    case 17:
      unint64_t result = 0x4449656C646E7562;
      break;
    case 19:
      unint64_t result = 0xD000000000000018;
      break;
    case 20:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      unint64_t result = 0x74706D6F7270;
      break;
  }
  return result;
}

uint64_t sub_261C0BD00(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_261C0BA9C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_261C0BA9C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_261C10D60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_261C0BD8C()
{
  char v1 = *v0;
  sub_261C10D80();
  sub_261C0BA9C(v1);
  sub_261C10BF0();
  swift_bridgeObjectRelease();
  return sub_261C10DA0();
}

uint64_t sub_261C0BDF0()
{
  sub_261C0BA9C(*v0);
  sub_261C10BF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_261C0BE44()
{
  char v1 = *v0;
  sub_261C10D80();
  sub_261C0BA9C(v1);
  sub_261C10BF0();
  swift_bridgeObjectRelease();
  return sub_261C10DA0();
}

uint64_t sub_261C0BEA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_261C0FFC4();
  *a1 = result;
  return result;
}

unint64_t sub_261C0BED4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_261C0BA9C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_261C0BF00()
{
  return sub_261C0BA9C(*v0);
}

uint64_t sub_261C0BF08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_261C0FFC4();
  *a1 = result;
  return result;
}

uint64_t sub_261C0BF30()
{
  return 0;
}

void sub_261C0BF3C(unsigned char *a1@<X8>)
{
  *a1 = 21;
}

uint64_t sub_261C0BF48(uint64_t a1)
{
  unint64_t v2 = sub_261C0DF5C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_261C0BF84(uint64_t a1)
{
  unint64_t v2 = sub_261C0DF5C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_261C0BFC0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v78 = *MEMORY[0x263EF8340];
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  uint64_t v4 = MEMORY[0x270FA5388](v54);
  v55 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v52 = (uint64_t)&v44 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v53 = (uint64_t)&v44 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954750);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_261C0DF5C();
  uint64_t v16 = v12;
  sub_261C10DC0();
  int v17 = (long long *)(v2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  long long v77 = *v17;
  char v76 = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954760);
  unint64_t v19 = sub_261C0DFB0();
  uint64_t v20 = (uint64_t)v56;
  sub_261C10D40();
  if (v20) {
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  }
  v56 = v11;
  unint64_t v50 = v19;
  uint64_t v51 = v18;
  uint64_t v22 = v13;
  uint64_t v23 = (uint64_t)v55;
  swift_beginAccess();
  char v76 = 1;
  sub_261C10D20();
  swift_beginAccess();
  char v75 = 2;
  sub_261C10D10();
  swift_beginAccess();
  char v74 = 3;
  sub_261C10D10();
  swift_beginAccess();
  char v73 = 4;
  sub_261C10D30();
  uint64_t v48 = 0;
  uint64_t v49 = v16;
  os_log_type_t v24 = (void **)(v2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v25 = *v24;
  if (*v24)
  {
    uint64_t v26 = self;
    v72[0] = 0;
    id v27 = v25;
    id v28 = objc_msgSend(v26, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v27, 1, v72);
    id v29 = v72[0];
    if (!v28)
    {
      uint64_t v35 = v29;
      sub_261C10A60();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v15, v49);
    }
    id v47 = v27;
    v30 = (void *)sub_261C10A90();
    v32 = v31;

    uint64_t v45 = (uint64_t)v30;
    unint64_t v46 = (unint64_t)v32;
    v72[0] = v30;
    v72[1] = v32;
    char v71 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A954780);
    sub_261C0E168();
    uint64_t v33 = v48;
    uint64_t v34 = v49;
    sub_261C10D40();
    if (v33)
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v34);

      return sub_261C0E230(v45, v46);
    }
    uint64_t v48 = 0;

    sub_261C0E230(v45, v46);
  }
  swift_beginAccess();
  char v71 = 6;
  uint64_t v36 = v48;
  uint64_t v37 = v49;
  sub_261C10D10();
  if (!v36)
  {
    swift_beginAccess();
    char v70 = 7;
    sub_261C10D10();
    swift_beginAccess();
    char v69 = 8;
    sub_261C10D10();
    swift_beginAccess();
    char v68 = 9;
    sub_261C10D20();
    uint64_t v48 = v2;
    uint64_t v38 = v2 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID;
    swift_beginAccess();
    uint64_t v39 = (uint64_t)v56;
    sub_261C0DE48(v38, (uint64_t)v56);
    char v67 = 10;
    id v47 = (id)sub_261C0E064();
    sub_261C10D40();
    sub_261C0E108(v39);
    uint64_t v40 = v48 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID;
    swift_beginAccess();
    sub_261C0DE48(v40, v53);
    char v66 = 11;
    sub_261C10D40();
    sub_261C0E108(v53);
    uint64_t v41 = v48 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID;
    swift_beginAccess();
    sub_261C0DE48(v41, v52);
    char v65 = 12;
    sub_261C10D40();
    sub_261C0E108(v52);
    swift_beginAccess();
    char v64 = 13;
    sub_261C10D10();
    swift_beginAccess();
    char v63 = 14;
    sub_261C10D20();
    swift_beginAccess();
    char v62 = 15;
    sub_261C10D10();
    uint64_t v42 = v48 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID;
    swift_beginAccess();
    sub_261C0DE48(v42, v23);
    char v61 = 16;
    sub_261C10D40();
    sub_261C0E108(v23);
    v43 = (long long *)(v48 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID);
    swift_beginAccess();
    long long v60 = *v43;
    char v59 = 17;
    sub_261C10D40();
    swift_beginAccess();
    char v59 = 18;
    sub_261C10D10();
    swift_beginAccess();
    char v58 = 19;
    sub_261C10D20();
    swift_beginAccess();
    char v57 = 20;
    uint64_t v37 = v49;
    sub_261C10D10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v15, v37);
}

id WTStartupOptions.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id WTStartupOptions.init()()
{
  id v1 = &v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt];
  *id v1 = 0;
  v1[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID];
  uint64_t v3 = sub_261C10AC0();
  uint64_t v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  v4(v2, 1, 1, v3);
  v4(&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID], 1, 1, v3);
  v4(&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID], 1, 1, v3);
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass] = 0;
  v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled] = 0;
  v4(&v0[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID], 1, 1, v3);
  uint64_t v5 = self;
  uint64_t v6 = v0;
  id v7 = objc_msgSend(v5, sel_mainBundle);
  id v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (v8)
  {
    uint64_t v9 = sub_261C10BE0();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v12 = (uint64_t *)&v6[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID];
  uint64_t *v12 = v9;
  v12[1] = v11;
  v6[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry] = 0;
  *(void *)&v6[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom] = -1;
  v6[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment] = 0;

  v14.receiver = v6;
  v14.super_class = (Class)type metadata accessor for WTStartupOptions();
  return objc_msgSendSuper2(&v14, sel_init);
}

id WTStartupOptions.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return WTStartupOptions.init(from:)(a1);
}

id WTStartupOptions.init(from:)(void *a1)
{
  v127 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v82 = (uint64_t)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v85 = (uint64_t)&v78 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v86 = (uint64_t)&v78 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v88 = (uint64_t)&v78 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954798);
  uint64_t v96 = *(void *)(v10 - 8);
  uint64_t v97 = v10;
  MEMORY[0x270FA5388](v10);
  v106 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt];
  uint64_t *v12 = 0;
  v12[1] = 0;
  v107 = v12;
  v95 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool];
  *(void *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool] = 0;
  v94 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable] = 0;
  v93 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing] = 0;
  v92 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions];
  *(void *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions] = 0;
  v105 = (id *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration];
  *(void *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration] = 0;
  v91 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard] = 0;
  v90 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant] = 0;
  v89 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation] = 0;
  v87 = (uint64_t *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType];
  *(void *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType] = 0;
  uint64_t v13 = (uint64_t)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID];
  uint64_t v14 = sub_261C10AC0();
  unint64_t v15 = *(void (**)(void))(*(void *)(v14 - 8) + 56);
  uint64_t v104 = v13;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v15)(v13, 1, 1, v14);
  v103 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID];
  v15();
  v102 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID];
  v15();
  uint64_t v16 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover] = 0;
  int v17 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass];
  *(void *)&v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass] = 0;
  uint64_t v18 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled];
  v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled] = 0;
  v101 = &v1[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID];
  v15();
  unint64_t v19 = self;
  uint64_t v20 = v1;
  id v21 = objc_msgSend(v19, sel_mainBundle);
  id v22 = objc_msgSend(v21, sel_bundleIdentifier);

  v81 = v18;
  v83 = (uint64_t *)v17;
  v84 = v16;
  if (v22)
  {
    uint64_t v23 = sub_261C10BE0();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t *)&v20[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID];
  uint64_t *v26 = v23;
  v26[1] = v25;
  id v99 = v20;
  v100 = v26;
  id v27 = &v20[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry];
  v20[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry] = 0;
  id v28 = &v20[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom];
  *(void *)&v20[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom] = -1;
  id v29 = &v20[OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment];
  *id v29 = 0;
  __swift_project_boxed_opaque_existential_1(v127, v127[3]);
  sub_261C0DF5C();
  v30 = v98;
  sub_261C10DB0();
  if (v30)
  {
    uint64_t v31 = v105;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v127);
    swift_bridgeObjectRelease();

    sub_261C0E108(v104);
    sub_261C0E108((uint64_t)v103);
    sub_261C0E108((uint64_t)v102);
    sub_261C0E108((uint64_t)v101);
    id v32 = (id)v100[1];

    swift_bridgeObjectRelease();
    type metadata accessor for WTStartupOptions();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v79 = v27;
    v80 = (uint64_t *)v28;
    v98 = v29;
    char v126 = 0;
    uint64_t v34 = sub_261C10CC0();
    uint64_t v36 = v35;
    uint64_t v37 = v107;
    swift_beginAccess();
    *uint64_t v37 = v34;
    v37[1] = v36;
    swift_bridgeObjectRelease();
    char v125 = 1;
    uint64_t v38 = sub_261C10CF0();
    uint64_t v39 = v95;
    swift_beginAccess();
    *uint64_t v39 = v38;
    char v124 = 2;
    LOBYTE(v38) = sub_261C10CE0();
    uint64_t v40 = v94;
    swift_beginAccess();
    *uint64_t v40 = v38 & 1;
    char v123 = 3;
    LOBYTE(v38) = sub_261C10CE0();
    uint64_t v41 = v93;
    swift_beginAccess();
    *uint64_t v41 = v38 & 1;
    char v122 = 4;
    uint64_t v42 = sub_261C10D00();
    v43 = v105;
    uint64_t v44 = v42;
    uint64_t v45 = v92;
    swift_beginAccess();
    *uint64_t v45 = v44;
    char v119 = 5;
    sub_261C0E518();
    sub_261C10CD0();
    uint64_t v47 = v120;
    unint64_t v46 = v121;
    if (v121 >> 60 == 15)
    {
LABEL_9:
      uint64_t v48 = 0;
    }
    else
    {
      switch(v121 >> 62)
      {
        case 1uLL:
          uint64_t v49 = (int)v120;
          uint64_t v50 = v120 >> 32;
          goto LABEL_15;
        case 2uLL:
          uint64_t v49 = *(void *)(v120 + 16);
          uint64_t v50 = *(void *)(v120 + 24);
LABEL_15:
          if (v49 == v50) {
            goto LABEL_9;
          }
          sub_261C0E580(v120, v121);
          goto LABEL_17;
        case 3uLL:
          goto LABEL_12;
        default:
          if ((v121 & 0xFF000000000000) != 0)
          {
LABEL_17:
            sub_261C0E5D8(0, &qword_26A9547B0);
            sub_261C0E5D8(0, &qword_26A9547B8);
            uint64_t v48 = sub_261C10C30();
            sub_261C0E56C(v47, v46);
          }
          else
          {
LABEL_12:
            sub_261C0E56C(v120, v121);
            uint64_t v48 = 0;
          }
          break;
      }
    }
    swift_beginAccess();
    uint64_t v51 = *v43;
    long long *v43 = (void *)v48;

    char v119 = 6;
    char v52 = sub_261C10CE0();
    v95 = (uint64_t *)v46;
    uint64_t v53 = v91;
    swift_beginAccess();
    *uint64_t v53 = v52 & 1;
    char v118 = 7;
    char v54 = sub_261C10CE0();
    v94 = (unsigned char *)v47;
    v55 = v90;
    swift_beginAccess();
    unsigned char *v55 = v54 & 1;
    char v117 = 8;
    char v56 = sub_261C10CE0();
    char v57 = v89;
    swift_beginAccess();
    *char v57 = v56 & 1;
    char v116 = 9;
    uint64_t v58 = sub_261C10CF0();
    char v59 = v87;
    swift_beginAccess();
    *char v59 = v58;
    char v115 = 10;
    sub_261C0E6F8(&qword_26A9547A8, MEMORY[0x263F07508]);
    sub_261C10CD0();
    uint64_t v60 = v104;
    swift_beginAccess();
    sub_261C0DEB0(v88, v60);
    swift_endAccess();
    char v115 = 11;
    sub_261C10CD0();
    uint64_t v61 = (uint64_t)v103;
    swift_beginAccess();
    sub_261C0DEB0(v86, v61);
    swift_endAccess();
    char v115 = 12;
    sub_261C10CD0();
    uint64_t v62 = (uint64_t)v102;
    swift_beginAccess();
    sub_261C0DEB0(v85, v62);
    swift_endAccess();
    char v115 = 13;
    LOBYTE(v62) = sub_261C10CE0();
    char v63 = v84;
    swift_beginAccess();
    *char v63 = v62 & 1;
    char v114 = 14;
    uint64_t v64 = sub_261C10CF0();
    char v65 = v83;
    swift_beginAccess();
    *char v65 = v64;
    char v113 = 15;
    LOBYTE(v64) = sub_261C10CE0();
    char v66 = v81;
    swift_beginAccess();
    *char v66 = v64 & 1;
    char v112 = 16;
    sub_261C10CD0();
    uint64_t v67 = (uint64_t)v101;
    swift_beginAccess();
    sub_261C0DEB0(v82, v67);
    swift_endAccess();
    char v112 = 17;
    uint64_t v68 = sub_261C10CC0();
    uint64_t v70 = v69;
    char v71 = v100;
    swift_beginAccess();
    *char v71 = v68;
    v71[1] = v70;
    swift_bridgeObjectRelease();
    char v111 = 18;
    LOBYTE(v68) = sub_261C10CE0();
    v72 = v79;
    swift_beginAccess();
    char *v72 = v68 & 1;
    char v110 = 19;
    uint64_t v73 = sub_261C10CF0();
    char v74 = v80;
    swift_beginAccess();
    *char v74 = v73;
    char v109 = 20;
    LOBYTE(v73) = sub_261C10CE0();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v106, v97);
    sub_261C0E56C((uint64_t)v94, (unint64_t)v95);
    char v75 = v98;
    swift_beginAccess();
    *char v75 = v73 & 1;
    id v76 = v99;

    long long v77 = (objc_class *)type metadata accessor for WTStartupOptions();
    v108.receiver = v76;
    v108.super_class = v77;
    id v32 = objc_msgSendSuper2(&v108, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v127);
  }
  return v32;
}

uint64_t sub_261C0DB78()
{
  return sub_261C10BA0();
}

id WTStartupOptions.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WTStartupOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_261C0DD64@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for WTStartupOptions());
  id result = WTStartupOptions.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_261C0DDBC(void *a1)
{
  return sub_261C0BFC0(a1);
}

uint64_t (*sub_261C0DDE0(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  sub_261C10120(a1, (uint64_t)v3);
  uint64_t v1 = swift_allocObject();
  sub_261C101BC(v3, v1 + 16);
  return sub_261C101D4;
}

uint64_t sub_261C0DE48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_261C0DEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_261C0DF5C()
{
  unint64_t result = qword_26A954758;
  if (!qword_26A954758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A954758);
  }
  return result;
}

unint64_t sub_261C0DFB0()
{
  unint64_t result = qword_26A954768;
  if (!qword_26A954768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A954760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A954768);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_261C0E064()
{
  unint64_t result = qword_26A954770;
  if (!qword_26A954770)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A954748);
    sub_261C0E6F8(&qword_26A954778, MEMORY[0x263F07508]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A954770);
  }
  return result;
}

uint64_t sub_261C0E108(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A954748);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_261C0E168()
{
  unint64_t result = qword_26A954788;
  if (!qword_26A954788)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A954780);
    sub_261C0E1DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A954788);
  }
  return result;
}

unint64_t sub_261C0E1DC()
{
  unint64_t result = qword_26A954790;
  if (!qword_26A954790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A954790);
  }
  return result;
}

uint64_t sub_261C0E230(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t (*static WTSceneConnectionOptionsDefinition.sceneDelegateMethod.getter())()
{
  swift_beginAccess();
  uint64_t v0 = off_26BD23310;
  swift_retain();
  return v0;
}

uint64_t static WTSceneConnectionOptionsDefinition.sceneDelegateMethod.setter(uint64_t (*a1)(), uint64_t a2)
{
  off_26BD23310 = a1;
  qword_26BD23318 = a2;
  return swift_release();
}

uint64_t (*static WTSceneConnectionOptionsDefinition.sceneDelegateMethod.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_261C0E390())@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v1 = off_26BD23310;
  uint64_t v0 = qword_26BD23318;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  swift_retain();
  return sub_261C10088;
}

uint64_t sub_261C0E41C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_261C10BC0();

  return swift_release();
}

uint64_t type metadata accessor for WTStartupOptions()
{
  uint64_t result = qword_26A9547D8;
  if (!qword_26A9547D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_261C0E518()
{
  unint64_t result = qword_26A9547A0;
  if (!qword_26A9547A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9547A0);
  }
  return result;
}

uint64_t sub_261C0E56C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_261C0E230(a1, a2);
  }
  return a1;
}

uint64_t sub_261C0E580(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_261C0E5D8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_261C0E614()
{
  unint64_t result = qword_26A9547C0;
  if (!qword_26A9547C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9547C0);
  }
  return result;
}

uint64_t sub_261C0E668()
{
  return sub_261C0E6F8(&qword_26A9547C8, (void (*)(uint64_t))type metadata accessor for WTStartupOptions);
}

uint64_t sub_261C0E6B0()
{
  return sub_261C0E6F8(&qword_26A9547D0, (void (*)(uint64_t))type metadata accessor for WTStartupOptions);
}

uint64_t sub_261C0E6F8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261C0E740@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt, a2);
}

uint64_t sub_261C0E74C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_261C0B54C(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
}

uint64_t sub_261C0E76C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool, a2);
}

uint64_t sub_261C0E778(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
}

uint64_t sub_261C0E784@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable, a2);
}

uint64_t sub_261C0E790(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable);
}

uint64_t sub_261C0E79C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing, a2);
}

uint64_t sub_261C0E7A8(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing);
}

uint64_t sub_261C0E7B4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_261C0E808(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
}

id sub_261C0E814@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t sub_261C0E87C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard, a2);
}

uint64_t sub_261C0E888(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard);
}

uint64_t sub_261C0E894@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant, a2);
}

uint64_t sub_261C0E8A0(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant);
}

uint64_t sub_261C0E8AC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation, a2);
}

uint64_t sub_261C0E8B8(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation);
}

uint64_t sub_261C0E8C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType, a2);
}

uint64_t sub_261C0E8D0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType);
}

uint64_t sub_261C0E8DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_31Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID, a2);
}

uint64_t sub_261C0E8E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_261C0B24C(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

uint64_t sub_261C0E908@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_31Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID, a2);
}

uint64_t sub_261C0E914(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_261C0B24C(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

uint64_t sub_261C0E934@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_31Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID, a2);
}

uint64_t sub_261C0E940(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_261C0B24C(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

uint64_t sub_261C0E960@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover, a2);
}

uint64_t sub_261C0E96C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover);
}

uint64_t sub_261C0E978@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass, a2);
}

uint64_t sub_261C0E984(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass);
}

uint64_t sub_261C0E990@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled, a2);
}

uint64_t sub_261C0E99C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled);
}

uint64_t sub_261C0E9A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_31Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID, a2);
}

uint64_t keypath_get_31Tm@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  swift_beginAccess();
  return sub_261C0DE48(v4, a3);
}

uint64_t sub_261C0EA08(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_261C0B24C(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID);
}

uint64_t sub_261C0EA28@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_261C0EA88(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_261C0B54C(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID);
}

uint64_t sub_261C0EAA8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry, a2);
}

uint64_t sub_261C0EAB4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry);
}

uint64_t sub_261C0EAC0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom, a2);
}

uint64_t keypath_get_13Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_261C0EB1C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom);
}

uint64_t keypath_set_14Tm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  void *v6 = v5;
  return result;
}

uint64_t sub_261C0EB74@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment, a2);
}

uint64_t keypath_get_15Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_261C0EBD0(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment);
}

uint64_t keypath_set_16Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  unsigned char *v6 = v5;
  return result;
}

uint64_t sub_261C0EC28()
{
  return type metadata accessor for WTStartupOptions();
}

void sub_261C0EC30()
{
  sub_261C0FCAC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for WTStartupOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WTStartupOptions);
}

uint64_t dispatch thunk of WTStartupOptions.prompt.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of WTStartupOptions.prompt.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of WTStartupOptions.prompt.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of WTStartupOptions.editable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of WTStartupOptions.editable.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of WTStartupOptions.editable.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsFormSheetPresentation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsFormSheetPresentation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of WTStartupOptions.wantsFormSheetPresentation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of WTStartupOptions.formSheetUIType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of WTStartupOptions.formSheetUIType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of WTStartupOptions.formSheetUIType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of WTStartupOptions.sourceResponderHorizontalSizeClass.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of WTStartupOptions.sourceResponderHorizontalSizeClass.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of WTStartupOptions.sourceResponderHorizontalSizeClass.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of WTStartupOptions.isWindowingModeEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of WTStartupOptions.isWindowingModeEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of WTStartupOptions.isWindowingModeEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of WTStartupOptions.analyticsUUID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of WTStartupOptions.analyticsUUID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of WTStartupOptions.analyticsUUID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of WTStartupOptions.bundleID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of WTStartupOptions.bundleID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of WTStartupOptions.bundleID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of WTStartupOptions.requestPromptEntry.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of WTStartupOptions.requestPromptEntry.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of WTStartupOptions.requestPromptEntry.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of WTStartupOptions.sourceUserInterfaceIdiom.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of WTStartupOptions.sourceUserInterfaceIdiom.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of WTStartupOptions.sourceUserInterfaceIdiom.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of WTStartupOptions.isResumingFromModelEnrollment.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of WTStartupOptions.isResumingFromModelEnrollment.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of WTStartupOptions.isResumingFromModelEnrollment.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of WTStartupOptions.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of WTStartupOptions.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 760))();
}

uint64_t dispatch thunk of WTStartupOptions.asBSAction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x300))();
}

void sub_261C0FCAC()
{
  if (!qword_26A9547E8)
  {
    sub_261C10AC0();
    unint64_t v0 = sub_261C10C40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A9547E8);
    }
  }
}

uint64_t dispatch thunk of WritingToolsSceneDelegate.windowScene(_:didUpdateWritingToolsStartupOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for WTSceneConnectionOptionsDefinition()
{
  return &type metadata for WTSceneConnectionOptionsDefinition;
}

uint64_t getEnumTagSinglePayload for WTStartupOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WTStartupOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    const char *result = a2 + 20;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x261C0FE84);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          const char *result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WTStartupOptions.CodingKeys()
{
  return &type metadata for WTStartupOptions.CodingKeys;
}

unint64_t sub_261C0FEC0()
{
  unint64_t result = qword_26A9547F0;
  if (!qword_26A9547F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9547F0);
  }
  return result;
}

unint64_t sub_261C0FF18()
{
  unint64_t result = qword_26A9547F8;
  if (!qword_26A9547F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9547F8);
  }
  return result;
}

unint64_t sub_261C0FF70()
{
  unint64_t result = qword_26A954800;
  if (!qword_26A954800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A954800);
  }
  return result;
}

uint64_t sub_261C0FFC4()
{
  unint64_t v0 = sub_261C10D70();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15) {
    return 21;
  }
  else {
    return v0;
  }
}

uint64_t sub_261C10018()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_261C10050(uint64_t a1)
{
  int v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_261C10088@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(void))(v1 + 16))();
  uint64_t v5 = v4;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = v5;
  *a1 = sub_261C100F0;
  a1[1] = result;
  return result;
}

uint64_t sub_261C100F0(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_261C10120(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_261C10184()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_261C101BC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_261C101D4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[5];
  uint64_t v6 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, a2, v5, v6);
}

uint64_t sub_261C103EC()
{
  uint64_t v0 = sub_261C10B60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F407C8], v0);
  sub_261C10B50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id SettingsDestination.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SettingsDestination.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsDestination();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SettingsDestination()
{
  return self;
}

id SettingsDestination.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsDestination();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SettingsDestination(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SettingsDestination);
}

uint64_t dispatch thunk of static SettingsDestination.rootURL.getter()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_261C10604()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_261C10A50()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_261C10A60()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_261C10A70()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_261C10A80()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_261C10A90()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_261C10AA0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_261C10AB0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_261C10AC0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_261C10AD0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_261C10AE0()
{
  return MEMORY[0x270F2F910]();
}

uint64_t sub_261C10AF0()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_261C10B00()
{
  return MEMORY[0x270F2F960]();
}

uint64_t sub_261C10B10()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_261C10B20()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_261C10B30()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_261C10B40()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_261C10B50()
{
  return MEMORY[0x270F2ECC0]();
}

uint64_t sub_261C10B60()
{
  return MEMORY[0x270F2ECD8]();
}

uint64_t sub_261C10B70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_261C10B80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_261C10B90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_261C10BA0()
{
  return MEMORY[0x270F82250]();
}

uint64_t sub_261C10BB0()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_261C10BC0()
{
  return MEMORY[0x270F82260]();
}

uint64_t sub_261C10BD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_261C10BE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_261C10BF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_261C10C00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_261C10C10()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_261C10C20()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_261C10C30()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_261C10C40()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_261C10C50()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_261C10C60()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_261C10C80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_261C10C90()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_261C10CA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_261C10CB0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_261C10CC0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_261C10CD0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_261C10CE0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_261C10CF0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_261C10D00()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_261C10D10()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_261C10D20()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_261C10D30()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_261C10D40()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_261C10D50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_261C10D60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_261C10D70()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_261C10D80()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_261C10D90()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_261C10DA0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_261C10DB0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_261C10DC0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F10940]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x270EE5BD8](colorName);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t RBColorFromCGColor()
{
  return MEMORY[0x270F5AA98]();
}

uint64_t RBDisplayListGetState()
{
  return MEMORY[0x270F5AAC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}