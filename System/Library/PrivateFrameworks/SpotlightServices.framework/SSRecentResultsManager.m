@interface SSRecentResultsManager
+ (BOOL)isValidSearchString:(id)a3;
+ (id)updateResult:(id)a3 topic:(id)a4 queryContext:(id)a5;
+ (void)cacheResult:(id)a3 searchString:(id)a4;
+ (void)cacheSearchString:(id)a3;
+ (void)deleteAllRecents;
+ (void)deleteResult:(id)a3;
+ (void)deleteResult:(id)a3 requiresRefresh:(BOOL)a4;
+ (void)preheat;
+ (void)sendRefreshNotification;
@end

@implementation SSRecentResultsManager

+ (void)preheat
{
  if (preheat_onceToken != -1) {
    dispatch_once(&preheat_onceToken, &__block_literal_global_59);
  }
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v2 setMaxConcurrentOperationCount:1];
  [v2 setUnderlyingQueue:preheat_gCacheManagerQueue];
  id v3 = (id)[v5 addObserverForName:@"com.apple.LaunchServices.applicationRegistered" object:0 suspensionBehavior:3 queue:v2 usingBlock:&__block_literal_global_21];
  id v4 = (id)[v5 addObserverForName:@"com.apple.LaunchServices.applicationUnregistered" object:0 suspensionBehavior:3 queue:v2 usingBlock:&__block_literal_global_21];
}

void __33__SSRecentResultsManager_preheat__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("cacheManagerUpdateQueue", v2);
  v1 = (void *)preheat_gCacheManagerQueue;
  preheat_gCacheManagerQueue = (uint64_t)v0;
}

void __33__SSRecentResultsManager_preheat__block_invoke_2()
{
  id v0 = +[SSApplicationManager currentApplications];
  [MEMORY[0x1E4FA5D80] updateApplicationContexts:v0];
}

+ (BOOL)isValidSearchString:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  LOBYTE(v4) = [v6 length] != 0;
  return (char)v4;
}

+ (void)cacheSearchString:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(a1, "isValidSearchString:")) {
    [MEMORY[0x1E4FA5D80] cacheSuggestion:v4 type:30 score:&unk_1F1864250 searchString:v4];
  }
}

+ (void)cacheResult:(id)a3 searchString:(id)a4
{
  id v58 = a3;
  id v6 = a4;
  if ([a1 isValidSearchString:v6])
  {
    switch([v58 type])
    {
      case 1u:
        v30 = [v58 completedQuery];
        if (v30) {
          goto LABEL_28;
        }
        v31 = [v58 completion];
        v32 = v31;
        if (v31)
        {
          id v33 = v31;
          goto LABEL_54;
        }
        v54 = [v58 title];
        id v8 = [v54 text];

        goto LABEL_55;
      case 2u:
      case 3u:
      case 4u:
      case 0x14u:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        uint64_t v7 = [v58 resultBundleId];
        if (!v7) {
          break;
        }
        id v8 = (id)v7;
        uint64_t v9 = [v58 applicationBundleIdentifier];
        if (!v9) {
          goto LABEL_49;
        }
        v10 = (__CFString *)v9;
        uint64_t v11 = [v58 sectionBundleIdentifier];
        if (!v11) {
          goto LABEL_48;
        }
        v12 = (void *)v11;
        v13 = [v58 identifier];

        if (!v13) {
          break;
        }
        id v8 = (id)*MEMORY[0x1E4F28358];
        v10 = (__CFString *)v58;
        v14 = [(__CFString *)v10 sectionBundleIdentifier];
        char v15 = [v14 isEqualToString:@"com.apple.application"];

        if ((v15 & 1) == 0)
        {
          v16 = [(__CFString *)v10 valueForAttribute:*MEMORY[0x1E4F23550] withType:objc_opt_class()];
          char v17 = [v16 BOOLValue];

          if ((v17 & 1) == 0)
          {
            if (objc_opt_respondsToSelector())
            {
              uint64_t v18 = [(__CFString *)v10 protectionClass];
            }
            else
            {
              uint64_t v18 = 0;
            }

            v55 = (void *)MEMORY[0x1E4FA5D80];
            v56 = [(__CFString *)v10 identifier];
            v57 = [(__CFString *)v10 resultBundleId];
            [v55 cacheLocalResult:v10 identifier:v56 bundleIdentifier:v57 protectionClass:v18 searchString:v6];

            id v8 = (id)v18;
          }
        }
        goto LABEL_48;
      case 8u:
      case 0x18u:
      case 0x22u:
      case 0x23u:
        break;
      case 0xFu:
      case 0x10u:
      case 0x1Eu:
      case 0x1Fu:
        id v8 = v58;
        v19 = [v8 completion];
        v20 = v19;
        if (v19)
        {
          v10 = v19;
        }
        else
        {
          v25 = [v8 title];
          v10 = [v25 text];
        }
        if ([(__CFString *)v10 length])
        {
          v26 = (void *)MEMORY[0x1E4FA5D80];
          uint64_t v27 = [v8 type];
          v28 = (void *)MEMORY[0x1E4F28ED0];
          [v8 rankingScore];
          v29 = objc_msgSend(v28, "numberWithDouble:");
          [v26 cacheSuggestion:v10 type:v27 score:v29 searchString:v6];
        }
        goto LABEL_48;
      case 0x11u:
      case 0x1Cu:
      case 0x1Du:
        id v8 = v58;
        v10 = [v8 completion];
        if (!v10)
        {
          v21 = [v8 title];
          uint64_t v22 = [v21 text];

          if (v22) {
            v10 = (__CFString *)v22;
          }
          else {
            v10 = &stru_1F1824018;
          }
        }
        [MEMORY[0x1E4FA5D80] cacheResult:v8 title:v10 searchString:v6];
        goto LABEL_48;
      case 0x20u:
        id v34 = v58;
        id v8 = v34;
        goto LABEL_30;
      case 0x24u:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        uint64_t v37 = [v58 resultBundleId];
        if (!v37) {
          break;
        }
        id v8 = (id)v37;
        uint64_t v38 = [v58 applicationBundleIdentifier];
        if (!v38) {
          goto LABEL_49;
        }
        v10 = (__CFString *)v38;
        uint64_t v39 = [v58 sectionBundleIdentifier];
        if (!v39) {
          goto LABEL_48;
        }
        v40 = (void *)v39;
        v41 = [v58 identifier];

        if (!v41) {
          break;
        }
        id v8 = v58;
        v42 = [v8 sectionBundleIdentifier];
        char v43 = [v42 isEqualToString:@"com.apple.CoreSuggestions"];

        if (v43) {
          goto LABEL_49;
        }
        id v34 = v8;
LABEL_30:
        v35 = [v34 completion];
        v36 = v35;
        if (v35)
        {
          v10 = v35;
        }
        else
        {
          v51 = [v8 title];
          v10 = [v51 text];
        }
        v47 = [v8 contactIdentifier];
        if (-[__CFString length](v10, "length") && [v47 length])
        {
          v52 = (void *)MEMORY[0x1E4FA5D80];
          v53 = (void *)MEMORY[0x1E4F28ED0];
          [v8 rankingScore];
          v50 = objc_msgSend(v53, "numberWithDouble:");
          [v52 cacheContact:v10 contactIdentifier:v47 score:v50 searchString:v6];
LABEL_46:
        }
LABEL_48:

LABEL_49:
        break;
      case 0x25u:
      case 0x26u:
        id v8 = v58;
        v23 = [v8 completion];
        v24 = v23;
        if (v23)
        {
          v10 = v23;
        }
        else
        {
          v44 = [v8 title];
          v10 = [v44 text];
        }
        if (![(__CFString *)v10 length]) {
          goto LABEL_48;
        }
        v45 = [v8 personQueryIdentifier];
        v46 = [v8 personIdentifier];
        v47 = +[SPSearchContactEntity updatePersonQueryIdentifier:v45 withPersonIdentifier:v46];

        v48 = (void *)MEMORY[0x1E4FA5D80];
        v49 = (void *)MEMORY[0x1E4F28ED0];
        [v8 rankingScore];
        v50 = objc_msgSend(v49, "numberWithDouble:");
        [v48 cachePerson:v10 personQueryIdentifier:v47 score:v50 searchString:v6];
        goto LABEL_46;
      default:
        v30 = [v58 completion];
        if (v30)
        {
LABEL_28:
          id v8 = v30;
        }
        else
        {
          v32 = [v58 title];
          id v33 = [v32 text];
LABEL_54:
          id v8 = v33;
LABEL_55:
        }
        if ([v8 length]) {
          [MEMORY[0x1E4FA5D80] cacheResult:v58 title:v8 searchString:v6];
        }
        goto LABEL_49;
    }
  }
}

+ (void)deleteResult:(id)a3
{
}

+ (void)deleteResult:(id)a3 requiresRefresh:(BOOL)a4
{
  BOOL v4 = a4;
  id v59 = a3;
  switch([v59 type])
  {
    case 2u:
    case 3u:
    case 4u:
    case 0x14u:
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v7 = [v59 resultBundleId];
      id v8 = (__CFString *)v7;
      if ((isKindOfClass & 1) == 0)
      {
        if (!v7) {
          goto LABEL_54;
        }
        uint64_t v22 = [v59 sectionBundleIdentifier];
        if (v22)
        {
          v23 = (void *)v22;
          v24 = [v59 sectionBundleIdentifier];
          int v25 = [v24 isEqualToString:@"com.apple.searchd.recent.results"];

          if (!v25) {
            goto LABEL_54;
          }
          v26 = [v59 resultBundleId];
          id v8 = [v26 componentsSeparatedByString:@":"];

          if ([(__CFString *)v8 count] == 2)
          {
            v10 = [(__CFString *)v8 firstObject];
            uint64_t v27 = [(__CFString *)v8 lastObject];
            v28 = (void *)MEMORY[0x1E4FA5D80];
            v29 = [v59 identifier];
            [v28 deleteLocalResult:v59 identifier:v29 bundleIdentifier:v27 protectionClass:v10];
            goto LABEL_50;
          }
        }
        goto LABEL_53;
      }
      if (!v7) {
        goto LABEL_54;
      }
      uint64_t v9 = [v59 applicationBundleIdentifier];
      if (!v9) {
        goto LABEL_53;
      }
      v10 = (__CFString *)v9;
      uint64_t v11 = [v59 sectionBundleIdentifier];
      if (!v11) {
        goto LABEL_52;
      }
      v12 = (void *)v11;
      v13 = [v59 identifier];

      if (v13)
      {
        id v14 = v59;
        if (objc_opt_respondsToSelector())
        {
          char v15 = [v14 protectionClass];
        }
        else
        {
          char v15 = 0;
        }
        v52 = (void *)MEMORY[0x1E4FA5D80];
        v53 = [v14 identifier];
        v54 = [v14 resultBundleId];
        [v52 deleteLocalResult:v14 identifier:v53 bundleIdentifier:v54 protectionClass:v15];

        goto LABEL_56;
      }
      goto LABEL_54;
    case 8u:
      uint64_t v37 = (void *)MEMORY[0x1E4FA5D80];
      id v8 = [v59 completion];
      uint64_t v38 = [v59 type];
      uint64_t v39 = (void *)MEMORY[0x1E4F28ED0];
      [v59 rankingScore];
      v40 = objc_msgSend(v39, "numberWithDouble:");
      [v37 deleteSuggestion:v8 type:v38 score:v40];

      goto LABEL_53;
    case 0xFu:
    case 0x10u:
    case 0x1Eu:
    case 0x1Fu:
      id v8 = (__CFString *)v59;
      v16 = [(__CFString *)v8 completion];
      char v17 = v16;
      if (v16)
      {
        v10 = v16;
      }
      else
      {
        v30 = [(__CFString *)v8 title];
        v10 = [v30 text];
      }
      if ([(__CFString *)v10 length])
      {
        v31 = (void *)MEMORY[0x1E4FA5D80];
        uint64_t v32 = [(__CFString *)v8 type];
        id v33 = (void *)MEMORY[0x1E4F28ED0];
        [(__CFString *)v8 rankingScore];
        id v34 = objc_msgSend(v33, "numberWithDouble:");
        [v31 deleteSuggestion:v10 type:v32 score:v34];
      }
      goto LABEL_52;
    case 0x11u:
    case 0x1Cu:
    case 0x1Du:
      id v8 = (__CFString *)v59;
      v10 = [(__CFString *)v8 completion];
      if (!v10)
      {
        uint64_t v18 = [(__CFString *)v8 title];
        uint64_t v19 = [v18 text];

        if (v19) {
          v10 = (__CFString *)v19;
        }
        else {
          v10 = &stru_1F1824018;
        }
      }
      [MEMORY[0x1E4FA5D80] deleteResult:v8 title:v10];
      goto LABEL_52;
    case 0x20u:
      id v8 = (__CFString *)v59;
      v41 = [(__CFString *)v8 completion];
      v42 = v41;
      if (v41)
      {
        v10 = v41;
      }
      else
      {
        v51 = [(__CFString *)v8 title];
        v10 = [v51 text];
      }
      uint64_t v27 = [(__CFString *)v8 contactIdentifier];
      if (!-[__CFString length](v10, "length") || ![v27 length]) {
        goto LABEL_51;
      }
      goto LABEL_49;
    case 0x24u:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_54;
      }
      id v8 = (__CFString *)v59;
      char v43 = [(__CFString *)v8 contactIdentifier];

      if (!v43) {
        goto LABEL_53;
      }
      v44 = [(__CFString *)v8 completion];
      v45 = v44;
      if (v44)
      {
        v10 = v44;
      }
      else
      {
        v55 = [(__CFString *)v8 title];
        v10 = [v55 text];
      }
      uint64_t v27 = [(__CFString *)v8 contactIdentifier];
LABEL_49:
      v56 = (void *)MEMORY[0x1E4FA5D80];
      v57 = (void *)MEMORY[0x1E4F28ED0];
      [(__CFString *)v8 rankingScore];
      v29 = objc_msgSend(v57, "numberWithDouble:");
      [v56 deleteContact:v10 contactIdentifier:v27 score:v29];
LABEL_50:

LABEL_51:
LABEL_52:

LABEL_53:
LABEL_54:
      id v58 = v59;
      if (v4)
      {
        [a1 sendRefreshNotification];
LABEL_56:
        id v58 = v59;
      }

      return;
    case 0x25u:
    case 0x26u:
      id v8 = (__CFString *)v59;
      v20 = [(__CFString *)v8 completion];
      v21 = v20;
      if (v20)
      {
        v10 = v20;
      }
      else
      {
        v46 = [(__CFString *)v8 title];
        v10 = [v46 text];
      }
      if (![(__CFString *)v10 length]) {
        goto LABEL_52;
      }
      v47 = [(__CFString *)v8 personQueryIdentifier];
      v48 = [(__CFString *)v8 personIdentifier];
      uint64_t v27 = +[SPSearchContactEntity updatePersonQueryIdentifier:v47 withPersonIdentifier:v48];

      v49 = (void *)MEMORY[0x1E4FA5D80];
      v50 = (void *)MEMORY[0x1E4F28ED0];
      [(__CFString *)v8 rankingScore];
      v29 = objc_msgSend(v50, "numberWithDouble:");
      [v49 deletePerson:v10 personQueryIdentifier:v27 score:v29];
      goto LABEL_50;
    default:
      id v8 = [v59 completion];
      if (!v8)
      {
        v35 = [v59 title];
        uint64_t v36 = [v35 text];

        if (v36) {
          id v8 = (__CFString *)v36;
        }
        else {
          id v8 = &stru_1F1824018;
        }
      }
      [MEMORY[0x1E4FA5D80] deleteResult:v59 title:v8];
      goto LABEL_53;
  }
}

+ (void)deleteAllRecents
{
}

+ (id)updateResult:(id)a3 topic:(id)a4 queryContext:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = SSRecentResultsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 resultBundleId];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1BDB2A000, v10, OS_LOG_TYPE_DEFAULT, "updateResult withResultBUndleId: %@", (uint8_t *)&buf, 0xCu);
  }
  v12 = SSRecentResultsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[SSRecentResultsManager updateResult:topic:queryContext:]((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
  }

  uint64_t v19 = [v7 sectionBundleIdentifier];
  int v20 = [v19 isEqualToString:@"com.apple.searchd.recent.results"];

  if (v20)
  {
    v21 = SSGeneralLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BDB2A000, v21, OS_LOG_TYPE_DEFAULT, "recent result", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__13;
    v74 = __Block_byref_object_dispose__13;
    id v75 = 0;
    uint64_t v22 = [v7 resultBundleId];
    v23 = [v22 componentsSeparatedByString:@":"];
    v24 = (void *)[v23 mutableCopy];

    if ((unint64_t)[v24 count] >= 2)
    {
      int v25 = [v24 firstObject];
      [v24 removeObjectAtIndex:0];
      v26 = [v24 componentsJoinedByString:&stru_1F1824018];
      if ((SSScreenTimeStatusForBundleIDWithCompletionHandler(v26, 0) & 1) == 0
        && (SSHiddenStatusForBundleIDWithCompletionHandler(v26, 0) & 1) == 0)
      {
        uint64_t v27 = [v7 identifier];
        v28 = +[SSResultBuilder fetchAttributes];
        id v59 = v9;
        v56 = dispatch_group_create();
        dispatch_group_enter(v56);
        id v58 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
        v70 = v27;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke;
        v60[3] = &unk_1E635B758;
        id v55 = v27;
        id v61 = v55;
        id v62 = v26;
        id v63 = v25;
        id v64 = v28;
        id v65 = v7;
        p_long long buf = &buf;
        id v66 = v59;
        v30 = v56;
        v67 = v30;
        id v57 = v64;
        [v58 slowFetchAttributes:v64 protectionClass:v63 bundleID:v62 identifiers:v29 completionHandler:v60];

        id v9 = v59;
        dispatch_time_t v31 = dispatch_time(0, 750000000);
        intptr_t v32 = dispatch_group_wait(v30, v31);
        id v33 = SSRecentResultsLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          id v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", v32, v55);
          +[SSRecentResultsManager updateResult:topic:queryContext:](v34, v69, v33);
        }
      }
    }
    id v35 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    goto LABEL_32;
  }
  uint64_t v36 = [v7 sectionBundleIdentifier];
  int v37 = [v36 isEqualToString:@"com.apple.searchd.recent.dictionary"];

  if (v37)
  {
    uint64_t v38 = SSRecentResultsLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BDB2A000, v38, OS_LOG_TYPE_DEFAULT, "recent dictionary result", (uint8_t *)&buf, 2u);
    }

    uint64_t v39 = +[SSResultBuilder resultBuilderWithResult:v7];
    id v35 = [v39 buildResult];
    v40 = [v35 compactCard];
    v41 = [v40 cardSections];
    v42 = [v41 firstObject];
    [v42 setShouldUseCompactDisplay:1];

    [v35 setShouldUseCompactDisplay:1];
    [v35 setUsesCompactDisplay:1];
    [v35 setInlineCard:0];

    goto LABEL_32;
  }
  char v43 = [v7 sectionBundleIdentifier];
  int v44 = [v43 isEqualToString:@"com.apple.searchd.recent.suggestions"];

  if (v44)
  {
    v45 = SSRecentResultsLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BDB2A000, v45, OS_LOG_TYPE_DEFAULT, "recent suggestion", (uint8_t *)&buf, 2u);
    }

    id v46 = +[SSSuggestionResultBuilder buildResultWithResult:v7 queryContext:v9];
    goto LABEL_31;
  }
  v47 = [v7 identifier];
  if (v47)
  {

LABEL_27:
    v50 = SSRecentResultsLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      +[SSRecentResultsManager updateResult:topic:queryContext:](v50);
    }

    [v7 setUsesCompactDisplay:1];
LABEL_30:
    id v46 = v7;
LABEL_31:
    id v35 = v46;
    goto LABEL_32;
  }
  v48 = [v7 sectionBundleIdentifier];
  BOOL v49 = v48 == 0;

  if (!v49) {
    goto LABEL_27;
  }
  v52 = SSRecentResultsLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BDB2A000, v52, OS_LOG_TYPE_DEFAULT, "fallback result from topic", (uint8_t *)&buf, 2u);
  }

  v53 = [MEMORY[0x1E4FA5D80] resultFromTopic:v8];
  if (!v53) {
    goto LABEL_30;
  }
  v54 = SSGeneralLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BDB2A000, v54, OS_LOG_TYPE_DEFAULT, "successfully created fallback search result", (uint8_t *)&buf, 2u);
  }

  id v35 = +[SSSuggestionResultBuilder buildResultWithResult:v53 queryContext:v9];

LABEL_32:
  return v35;
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 firstObject];
  id v5 = SSRecentResultsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_3(v5);
  }

  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (SSFetchAttributeValueIsValid(v4), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    id v8 = [SFSearchResult_SpotlightExtras alloc];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [v3 firstObject];
    uint64_t v14 = -[SFSearchResult_SpotlightExtras initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:](v8, "initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:", v9, v10, v11, v12, v13, [*(id *)(a1 + 64) type], 0);

    uint64_t v15 = SSRecentResultsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_2((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
    }

    [(SFSearchResult_SpotlightExtras *)v14 setShouldUseCompactDisplay:1];
    if ([(SFSearchResult_SpotlightExtras *)v14 type] == 36
      || [(SFSearchResult_SpotlightExtras *)v14 type] == 32)
    {
      uint64_t v22 = +[SSSuggestionResultBuilder buildResultWithResult:v14 queryContext:*(void *)(a1 + 72)];
      uint64_t v23 = *(void *)(*(void *)(a1 + 88) + 8);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
    else
    {
      v24 = +[SSResultBuilder resultBuilderWithResult:v14];
      uint64_t v32 = [v24 buildResult];
      uint64_t v33 = *(void *)(*(void *)(a1 + 88) + 8);
      id v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;

      id v35 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) compactCard];
      uint64_t v36 = [v35 cardSections];
      int v37 = [v36 firstObject];
      [v37 setShouldUseCompactDisplay:1];

      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setShouldUseCompactDisplay:1];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setUsesCompactDisplay:1];
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setInlineCard:0];
    }
  }
  else
  {
    int v25 = SSRecentResultsLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_1(a1, v25, v26, v27, v28, v29, v30, v31);
    }

    +[SSRecentResultsManager deleteResult:*(void *)(a1 + 64) requiresRefresh:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

+ (void)sendRefreshNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.spotlight.refreshZKW" object:0];
}

+ (void)updateResult:(void *)a1 topic:(uint8_t *)buf queryContext:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "waited for group didFail: %@", buf, 0xCu);
}

+ (void)updateResult:(os_log_t)log topic:queryContext:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "couldn't update result", v1, 2u);
}

+ (void)updateResult:(uint64_t)a3 topic:(uint64_t)a4 queryContext:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "got fetchAttributes", v1, 2u);
}

@end