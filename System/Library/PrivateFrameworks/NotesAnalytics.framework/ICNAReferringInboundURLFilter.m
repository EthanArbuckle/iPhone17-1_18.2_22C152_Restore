@interface ICNAReferringInboundURLFilter
+ (BOOL)foundMatchingPrefixAmongCandidates:(id)a3 forInputString:(id)a4 matchingPrefixInplaceResult:(id *)a5;
+ (id)allowedTieredPrefixReplacements;
+ (id)filterReferringInboundURL:(id)a3;
+ (id)filterStringByAllowedTieredPrefixReplacements:(id)a3;
+ (id)filterURLByLogicalReplacements:(id)a3;
@end

@implementation ICNAReferringInboundURLFilter

+ (id)filterReferringInboundURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 absoluteString];

  if (v5)
  {
    if ([MEMORY[0x1E4F83290] isShowNoteURL:v4])
    {
      v6 = @"showNote";
    }
    else if ([MEMORY[0x1E4F83290] isShowLegacyNoteURL:v4])
    {
      v6 = @"showLegacyNote";
    }
    else
    {
      v7 = [v4 absoluteString];
      v6 = [a1 filterStringByAllowedTieredPrefixReplacements:v7];

      if (!v6)
      {
        uint64_t v8 = [a1 filterURLByLogicalReplacements:v4];
        if (v8) {
          v6 = (__CFString *)v8;
        }
        else {
          v6 = @"other";
        }
      }
    }
  }
  else
  {
    v6 = &stru_1F1F66380;
  }

  return v6;
}

+ (id)filterStringByAllowedTieredPrefixReplacements:(id)a3
{
  id v4 = a3;
  v5 = [a1 allowedTieredPrefixReplacements];
  v6 = [v5 allKeys];
  id v17 = 0;
  int v7 = [a1 foundMatchingPrefixAmongCandidates:v6 forInputString:v4 matchingPrefixInplaceResult:&v17];
  id v8 = v17;
  v9 = v8;
  if (v7)
  {
    while (1)
    {
      objc_opt_class();
      v10 = [v5 objectForKeyedSubscript:v9];
      v11 = ICDynamicCast();

      if (!v11) {
        break;
      }
      v12 = [v11 allKeys];

      id v17 = v9;
      char v13 = [a1 foundMatchingPrefixAmongCandidates:v12 forInputString:v4 matchingPrefixInplaceResult:&v17];
      id v14 = v17;

      v9 = v14;
      v6 = v12;
      v5 = v11;
      if ((v13 & 1) == 0) {
        goto LABEL_7;
      }
    }
    v12 = v6;
    id v14 = v9;
  }
  else
  {
    v12 = v6;
    id v14 = v8;
    v11 = v5;
  }
LABEL_7:
  v15 = (void *)[v14 copy];

  return v15;
}

+ (id)filterURLByLogicalReplacements:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathComponents];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_8;
  }
  v6 = [v3 pathComponents];
  int v7 = [v6 objectAtIndexedSubscript:0];
  int v8 = [v7 isEqualToString:@"userActivity"];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:0];
    [v9 setQuery:0];
    v10 = [v9 string];

    goto LABEL_9;
  }
  v11 = [v3 scheme];
  v10 = @"file";
  int v12 = [v11 isEqualToString:@"file"];

  if (v12)
  {
    char v13 = [v3 pathExtension];
    int v14 = [v13 isEqualToString:@"notesairdropdocument"];

    if (v14) {
      v10 = @"notesairdropdocument";
    }
  }
  else
  {
LABEL_8:
    v10 = 0;
  }
LABEL_9:

  return v10;
}

+ (id)allowedTieredPrefixReplacements
{
  if (allowedTieredPrefixReplacements_onceToken != -1) {
    dispatch_once(&allowedTieredPrefixReplacements_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)allowedTieredPrefixReplacements_allowedTieredPrefixReplacements;
  return v2;
}

void __64__ICNAReferringInboundURLFilter_allowedTieredPrefixReplacements__block_invoke()
{
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v0 = [MEMORY[0x1E4F1CA98] null];
  [v46 setObject:v0 forKeyedSubscript:@"showLegacyNote"];

  v1 = [MEMORY[0x1E4F1CA98] null];
  [v46 setObject:v1 forKeyedSubscript:@"showNote"];

  v2 = [MEMORY[0x1E4F1CA98] null];
  [v46 setObject:v2 forKeyedSubscript:@"notesairdropdocument"];

  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v46 setObject:v3 forKeyedSubscript:@"mobilenotes"];
  id v4 = [MEMORY[0x1E4F1CA98] null];
  [v3 setObject:v4 forKeyedSubscript:@"mobilenotes://snapshotBackgroundTask"];

  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  [v3 setObject:v5 forKeyedSubscript:@"mobilenotes://showFolderList"];

  v6 = [MEMORY[0x1E4F1CA98] null];
  [v3 setObject:v6 forKeyedSubscript:@"mobilenotes://text"];

  int v7 = [MEMORY[0x1E4F1CA98] null];
  [v3 setObject:v7 forKeyedSubscript:@"mobilenotes://msg"];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:v8 forKeyedSubscript:@"mobilenotes://newNote"];
  v9 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v9 forKeyedSubscript:@"mobilenotes://newNote?action=0"];

  v10 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v10 forKeyedSubscript:@"mobilenotes://newNote?action=1"];

  v11 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v11 forKeyedSubscript:@"mobilenotes://newNote?action=2"];

  int v12 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v12 forKeyedSubscript:@"mobilenotes://newNote?action=3"];

  char v13 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v13 forKeyedSubscript:@"mobilenotes://newNote?action=4"];

  int v14 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v14 forKeyedSubscript:@"mobilenotes://newNote?action=5"];

  v15 = [MEMORY[0x1E4F1CA98] null];
  [v8 setObject:v15 forKeyedSubscript:@"mobilenotes://newNote?action=6"];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:v16 forKeyedSubscript:@"mobilenotes://quicknote"];
  id v17 = [MEMORY[0x1E4F1CA98] null];
  [v16 setObject:v17 forKeyedSubscript:@"mobilenotes://quicknote?showList=1"];

  v18 = [MEMORY[0x1E4F1CA98] null];
  [v16 setObject:v18 forKeyedSubscript:@"mobilenotes://quicknote?showList=0"];

  v19 = [MEMORY[0x1E4F1CA98] null];
  [v16 setObject:v19 forKeyedSubscript:@"mobilenotes://quicknote?launchedByPencil=0"];

  v20 = [MEMORY[0x1E4F1CA98] null];
  [v16 setObject:v20 forKeyedSubscript:@"mobilenotes://quicknote?launchedByPencil=1"];

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:v21 forKeyedSubscript:@"mobilenotes-quicknote"];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v21 setObject:v22 forKeyedSubscript:@"mobilenotes-quicknote://quicknote"];
  v23 = [MEMORY[0x1E4F1CA98] null];
  [v22 setObject:v23 forKeyedSubscript:@"mobilenotes-quicknote://quicknote?showList=0"];

  v24 = [MEMORY[0x1E4F1CA98] null];
  [v22 setObject:v24 forKeyedSubscript:@"mobilenotes-quicknote://quicknote?showList=1"];

  v25 = [MEMORY[0x1E4F1CA98] null];
  [v22 setObject:v25 forKeyedSubscript:@"mobilenotes-quicknote://quicknote?launchedByPencil=0"];

  v26 = [MEMORY[0x1E4F1CA98] null];
  [v22 setObject:v26 forKeyedSubscript:@"mobilenotes-quicknote://quicknote?launchedByPencil=1"];

  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v46 setObject:v27 forKeyedSubscript:@"notesAnalytics"];
  v28 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v28 forKeyedSubscript:@"notesAnalytics://cloudKitShare"];

  v29 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v29 forKeyedSubscript:@"notesAnalytics://shortcutItem"];

  v30 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v30 forKeyedSubscript:@"notesAnalytics://userActivity"];

  v31 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v31 forKeyedSubscript:@"notesAnalytics://notificationCenter"];

  v32 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v32 forKeyedSubscript:@"notesAnalytics://sharingExtension"];

  v33 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v33 forKeyedSubscript:@"notesAnalytics://todayExtension"];

  v34 = [MEMORY[0x1E4F1CA98] null];
  [v27 setObject:v34 forKeyedSubscript:@"notesAnalytics://intentsExtension"];

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v46 setObject:v35 forKeyedSubscript:@"shortcutItem"];
  v36 = [MEMORY[0x1E4F1CA98] null];
  v37 = [NSString stringWithFormat:@"%@/com.apple.notes.newNote", @"shortcutItem"];
  [v35 setObject:v36 forKeyedSubscript:v37];

  v38 = [MEMORY[0x1E4F1CA98] null];
  v39 = [NSString stringWithFormat:@"%@/com.apple.notes.checklist", @"shortcutItem"];
  [v35 setObject:v38 forKeyedSubscript:v39];

  v40 = [MEMORY[0x1E4F1CA98] null];
  v41 = [NSString stringWithFormat:@"%@/com.apple.notes.scanDocument", @"shortcutItem"];
  [v35 setObject:v40 forKeyedSubscript:v41];

  v42 = [MEMORY[0x1E4F1CA98] null];
  v43 = [NSString stringWithFormat:@"%@/com.apple.notes.audio", @"shortcutItem"];
  [v35 setObject:v42 forKeyedSubscript:v43];

  uint64_t v44 = [v46 copy];
  v45 = (void *)allowedTieredPrefixReplacements_allowedTieredPrefixReplacements;
  allowedTieredPrefixReplacements_allowedTieredPrefixReplacements = v44;
}

+ (BOOL)foundMatchingPrefixAmongCandidates:(id)a3 forInputString:(id)a4 matchingPrefixInplaceResult:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", v14, (void)v17))
        {
          *a5 = v14;
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

@end