@interface VKCQuickActionsProcessor
+ (id)configureQuickActionForTuple:(id)a3 unfilteredTextElements:(id)a4;
+ (id)dedupeQuickActions:(id)a3;
+ (id)sortQuickActions:(id)a3;
+ (int64_t)sortOrderForElement:(id)a3;
+ (void)quickActionsFromElements:(id)a3 unfilteredElements:(id)a4 analysis:(id)a5 queue:(id)a6 completionHandler:(id)a7;
@end

@implementation VKCQuickActionsProcessor

+ (void)quickActionsFromElements:(id)a3 unfilteredElements:(id)a4 analysis:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = a6;
  id v13 = a7;
  v37 = v11;
  v14 = objc_msgSend(v11, "vk_objectsPassingTest:", &__block_literal_global_23);
  id v15 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2;
  v52[3] = &unk_1E6BF2BC8;
  id v16 = v15;
  id v53 = v16;
  v42 = objc_msgSend(v40, "vk_compactMap:", v52);
  v41 = [getDDContextMenuActionClass() filterResultsForQuickActions:v42];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3;
  v50[3] = &unk_1E6BF2BF0;
  id v36 = v16;
  id v51 = v36;
  v17 = objc_msgSend(v41, "vk_compactMap:", v50);
  v18 = objc_msgSend(v17, "vk_map:", &__block_literal_global_66);
  v19 = objc_msgSend(v18, "vk_compactMap:", &__block_literal_global_71);
  v20 = objc_alloc_init(VKCDataDetectorCatalystRevealHighlighter);
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v21 = (id *)getkDataDetectorsAllResultsKeySymbolLoc_ptr;
  uint64_t v62 = getkDataDetectorsAllResultsKeySymbolLoc_ptr;
  if (!getkDataDetectorsAllResultsKeySymbolLoc_ptr)
  {
    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    v56 = __getkDataDetectorsAllResultsKeySymbolLoc_block_invoke;
    v57 = &unk_1E6BF0A90;
    v58 = &v59;
    v22 = (void *)DataDetectorsUILibrary_2();
    v23 = dlsym(v22, "kDataDetectorsAllResultsKey");
    *(void *)(v58[1] + 24) = v23;
    getkDataDetectorsAllResultsKeySymbolLoc_ptr = *(void *)(v58[1] + 24);
    v21 = (id *)v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v21) {
    goto LABEL_8;
  }
  id v24 = *v21;
  id v63 = v24;
  v65[0] = v19;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v25 = (id *)getkDDHighlighterKeySymbolLoc_ptr;
  uint64_t v62 = getkDDHighlighterKeySymbolLoc_ptr;
  if (!getkDDHighlighterKeySymbolLoc_ptr)
  {
    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    v56 = __getkDDHighlighterKeySymbolLoc_block_invoke;
    v57 = &unk_1E6BF0A90;
    v58 = &v59;
    v26 = (void *)DataDetectorsUILibrary_2();
    v27 = dlsym(v26, "kDDHighlighterKey");
    *(void *)(v58[1] + 24) = v27;
    getkDDHighlighterKeySymbolLoc_ptr = *(void *)(v58[1] + 24);
    v25 = (id *)v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v25)
  {
LABEL_8:
    getkDDRVInteractionDidFinishNotification_cold_1();
    __break(1u);
  }
  id v64 = *v25;
  v65[1] = v20;
  v28 = (void *)MEMORY[0x1E4F1C9E8];
  id v29 = v64;
  v30 = [v28 dictionaryWithObjects:v65 forKeys:&v63 count:2];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_6;
  block[3] = &unk_1E6BF09C8;
  id v44 = v12;
  id v45 = v18;
  id v46 = v30;
  id v47 = v14;
  id v48 = v13;
  id v49 = a1;
  id v31 = v13;
  id v32 = v14;
  id v33 = v30;
  id v34 = v18;
  id v35 = v12;
  dispatch_async(queue, block);
}

uint64_t __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTextDataDetector];
}

id __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v3 scannerResult];
  [v2 setObject:v3 forKey:v4];

  v5 = [v3 scannerResult];

  return v5;
}

VKCTextDataDetectorElement *__105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if (!v4) {
    v4 = [[VKCTextDataDetectorElement alloc] initWithScannerResult:v3];
  }

  return v4;
}

VKCQuickActionMenuTuple *__105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(VKCQuickActionMenuTuple);
  v4 = +[VKCActionInfoButton buttonWithImage:0 text:0];
  [(VKCQuickActionMenuTuple *)v3 setButton:v4];

  [(VKCQuickActionMenuTuple *)v3 setElement:v2];
  return v3;
}

id __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 element];
  id v3 = [v2 scannerResult];
  v4 = [v3 coreResult];

  return v4;
}

void __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [*(id *)(a1 + 32) analysisRequestID];
    *(_DWORD *)buf = 67109120;
    int v19 = v4;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_INFO, "Beginning Quick Action processing, id: %d", buf, 8u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_77;
  v16[3] = &unk_1E6BF2C58;
  v5 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  [v5 enumerateObjectsUsingBlock:v16];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2_79;
  v9[3] = &unk_1E6BF09C8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 72);
  id v10 = v6;
  uint64_t v15 = v7;
  id v11 = *(id *)(a1 + 56);
  id v12 = v2;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 64);
  id v8 = v2;
  vk_dispatchMainAfterDelay(v9, 0.0);
}

void __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_77(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v3 element];
  v5 = [v4 groupedElementData];
  id v6 = objc_msgSend(v2, "vk_dictionaryByAddingEntriesFromNonNilDictionary:", v5);

  id DDContextMenuActionClass = getDDContextMenuActionClass();
  id v8 = [v3 element];
  v9 = [v8 scannerResult];
  uint64_t v10 = [v9 coreResult];
  id v11 = [v3 button];
  id v14 = 0;
  id v12 = [DDContextMenuActionClass buttonActionsForURL:0 result:v10 contact:0 icsString:0 context:v6 view:v11 identifier:0 suggestedActions:0 defaultAction:&v14];
  id v13 = v14;

  [v3 setMenu:v12];
  [v3 setDefaultAction:v13];
}

void __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2_79(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3_80;
  id v14 = &unk_1E6BF2C80;
  uint64_t v16 = *(void *)(a1 + 72);
  id v2 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "vk_compactMap:", &v11);
  int v4 = objc_msgSend(*(id *)(a1 + 72), "dedupeQuickActions:", v3, v11, v12, v13, v14);

  v5 = [*(id *)(a1 + 72) sortQuickActions:v4];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceDate:*(void *)(a1 + 48)];
  uint64_t v8 = v7;

  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = [*(id *)(a1 + 56) analysisRequestID];
    *(_DWORD *)buf = 134218240;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_INFO, "Quick Action processing completed in %f, id: %d", buf, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3_80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) configureQuickActionForTuple:a2 unfilteredTextElements:*(void *)(a1 + 32)];
}

+ (int64_t)sortOrderForElement:(id)a3
{
  __int16 v3 = [a3 dataDetectorTypes];
  if ((v3 & 0x40) != 0) {
    return 1;
  }
  if ((v3 & 0x200) != 0) {
    return 2;
  }
  if ((v3 & 0x80) != 0) {
    return 3;
  }
  if ((v3 & 0x100) != 0) {
    return 4;
  }
  if (v3) {
    return 5;
  }
  if ((v3 & 2) != 0) {
    return 6;
  }
  if ((v3 & 0x10) != 0) {
    return 7;
  }
  if ((v3 & 8) != 0) {
    return 8;
  }
  if ((v3 & 4) != 0) {
    return 9;
  }
  if ((v3 & 0x400) != 0) {
    return 10;
  }
  if ((v3 & 0x800) != 0) {
    return 11;
  }
  if ((v3 & 0x20) != 0) {
    return 13;
  }
  return 127;
}

+ (id)dedupeQuickActions:(id)a3
{
  __int16 v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __47__VKCQuickActionsProcessor_dedupeQuickActions___block_invoke;
  id v15 = &unk_1E6BF22D0;
  id v16 = v5;
  id v17 = v6;
  id v7 = v6;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:&v12];

  v9 = objc_msgSend(v8, "allValues", v12, v13, v14, v15);
  int v10 = [v9 arrayByAddingObjectsFromArray:v7];

  return v10;
}

void __47__VKCQuickActionsProcessor_dedupeQuickActions___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  __int16 v3 = [v6 text];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v6 text];
    [v4 setObject:v6 forKey:v5];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

+ (id)sortQuickActions:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__VKCQuickActionsProcessor_sortQuickActions___block_invoke;
  v5[3] = &__block_descriptor_40_e53_q24__0__VKCActionInfoButton_8__VKCActionInfoButton_16l;
  v5[4] = a1;
  __int16 v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

uint64_t __45__VKCQuickActionsProcessor_sortQuickActions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 representedElement];
  id v7 = [v5 representedElement];

  uint64_t v8 = [*(id *)(a1 + 32) sortOrderForElement:v6];
  uint64_t v9 = [*(id *)(a1 + 32) sortOrderForElement:v7];
  if (v8 < v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v8 > v9;
  }
  if (!v10)
  {
    uint64_t v11 = [v6 quad];
    [v11 topLeft];
    double v13 = v12;
    double v15 = v14;

    id v16 = [v7 quad];
    [v16 topLeft];
    double v18 = v17;
    double v20 = v19;

    uint64_t v21 = v15 > v20;
    if (v15 < v20) {
      uint64_t v21 = -1;
    }
    uint64_t v22 = v13 > v18;
    if (v13 < v18) {
      uint64_t v22 = -1;
    }
    if (v21) {
      uint64_t v10 = v21;
    }
    else {
      uint64_t v10 = v22;
    }
  }

  return v10;
}

+ (id)configureQuickActionForTuple:(id)a3 unfilteredTextElements:(id)a4
{
  id v5 = a3;
  id v20 = a4;
  id v6 = [v5 button];
  id v7 = [v5 defaultAction];
  uint64_t v8 = [v5 menu];
  uint64_t v9 = [v5 element];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  uint64_t v10 = (void *)getDDUIActionClass_softClass_0;
  uint64_t v25 = getDDUIActionClass_softClass_0;
  if (!getDDUIActionClass_softClass_0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getDDUIActionClass_block_invoke_0;
    v21[3] = &unk_1E6BF0A90;
    v21[4] = &v22;
    __getDDUIActionClass_block_invoke_0((uint64_t)v21);
    uint64_t v10 = (void *)v23[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v22, 8);
  if (objc_opt_isKindOfClass())
  {
    double v12 = objc_msgSend(v7, "dd_action");
    if (([v12 isPlaceholderAction] & 1) != 0
      || [v9 isUnitConversionDataDetector])
    {
      objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"arrow.triangle.swap");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v19 = 1;
      double v14 = v13;
    }
    else
    {
      id v13 = [v12 compactIcon];
      double v14 = [v12 icon];
      unsigned int v19 = 0;
    }
    double v15 = [v12 quickActionTitle];
    [v6 setText:v15];
    [v6 setImage:v13];
    [v6 setMenuImage:v14];
    [v6 setDefaultAction:v7];
    id v16 = [v9 uuid];
    [v6 setCorrelationIdentifier:v16];

    [v6 setMenu:v8];
    [v6 setRepresentedElement:v9];
    [v6 setAllUnfilteredElements:v20];
    [v6 setShowsMenuAsPrimaryAction:v19];
    [v6 setAccessibilityIdentifier:@"QuickAction"];
    [v6 addTarget:v6 action:sel_performDefaultElementAction forControlEvents:64];
  }
  else
  {
LABEL_8:
    double v15 = 0;
    id v13 = 0;
    double v14 = 0;
    double v12 = v6;
    id v6 = 0;
  }

  id v17 = v6;
  return v17;
}

@end