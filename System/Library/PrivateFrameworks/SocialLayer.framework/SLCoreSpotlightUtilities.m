@interface SLCoreSpotlightUtilities
+ (id)CSQueryStringForAutodonatingChatsWithDecay:(BOOL)a3;
+ (id)CSQueryStringForSLHighlightsForContentType:(unsigned __int8)a3 forChatIdentifiers:(id)a4;
+ (id)CSSearchQueryContextForAutodonatingChats;
+ (id)CSSearchQueryContextForSLHighlightsForContentType:(unsigned __int8)a3;
+ (id)fetchCSSearchableItemForUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 withRequiredAttributes:(id)a5 error:(id *)a6;
+ (id)requiredSpotlightAttributeKeysForFiles;
+ (id)requiredSpotlightAttributeKeysForLinks;
@end

@implementation SLCoreSpotlightUtilities

+ (id)fetchCSSearchableItemForUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 withRequiredAttributes:(id)a5 error:(id *)a6
{
  int v8 = a4;
  v61[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__3;
    v53 = __Block_byref_object_dispose__3;
    id v54 = 0;
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v12 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
    id v59 = v9;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke;
    v45[3] = &unk_1E58A8E00;
    v48 = &v49;
    id v14 = v9;
    id v46 = v14;
    v15 = v11;
    v47 = v15;
    [v12 slowFetchAttributes:v10 protectionClass:0 bundleID:@"com.apple.MobileSMS" identifiers:v13 completionHandler:v45];

    dispatch_time_t v16 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(v15, v16))
    {
      v57[0] = *MEMORY[0x1E4F28568];
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
      v18 = [v17 localizedStringForKey:@"SocialLayer CSSearchableItem fetch failed." value:&stru_1EEC19158 table:0];
      v58[0] = v18;
      v57[1] = *MEMORY[0x1E4F28588];
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      v20 = [v19 localizedStringForKey:@"Timed out while fetching CSSearchableItem." value:&stru_1EEC19158 table:0];
      v58[1] = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

      if (a6)
      {
        id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" code:2 userInfo:v21];
LABEL_15:
        v28 = 0;
        *a6 = v22;
LABEL_20:

        _Block_object_dispose(&v49, 8);
        goto LABEL_21;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v29 = [(id)v50[5] count];
        if (v29 == [v10 count])
        {
          id v30 = objc_alloc_init(MEMORY[0x1E4F23850]);
          uint64_t v38 = MEMORY[0x1E4F143A8];
          uint64_t v39 = 3221225472;
          v40 = __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_19;
          v41 = &unk_1E58A8E28;
          v44 = &v49;
          id v21 = v30;
          id v42 = v21;
          id v31 = v14;
          id v43 = v31;
          [v10 enumerateObjectsUsingBlock:&v38];
          if (v8)
          {
            if (v8 == 1) {
              v32 = @"attachmentDomain";
            }
            else {
              v32 = 0;
            }
          }
          else
          {
            objc_msgSend(v21, "domainIdentifier", v38, v39, v40, v41, v42);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v28 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v31 domainIdentifier:v32 attributeSet:v21];

          goto LABEL_20;
        }
      }
      v55[0] = *MEMORY[0x1E4F28568];
      v33 = [MEMORY[0x1E4F28B50] mainBundle];
      v34 = [v33 localizedStringForKey:@"SocialLayer CSSearchableItem fetch failed." value:&stru_1EEC19158 table:0];
      v56[0] = v34;
      v55[1] = *MEMORY[0x1E4F28588];
      v35 = [MEMORY[0x1E4F28B50] mainBundle];
      v36 = [v35 localizedStringForKey:@"Failed to fetch one or more required attributes." value:&stru_1EEC19158 table:0];
      v56[1] = v36;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

      if (a6)
      {
        id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" code:3 userInfo:v21];
        goto LABEL_15;
      }
    }
    v28 = 0;
    goto LABEL_20;
  }
  v60[0] = *MEMORY[0x1E4F28568];
  v23 = [MEMORY[0x1E4F28B50] mainBundle];
  v24 = [v23 localizedStringForKey:@"SocialLayer CSSearchableItem fetch failed." value:&stru_1EEC19158 table:0];
  v61[0] = v24;
  v60[1] = *MEMORY[0x1E4F28588];
  v25 = [MEMORY[0x1E4F28B50] mainBundle];
  v26 = [v25 localizedStringForKey:@"Provided a nil unique identifier." value:&stru_1EEC19158 table:0];
  v61[1] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];

  if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" code:1 userInfo:v27];
  }

  v28 = 0;
LABEL_21:

  return v28;
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    v7 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_19(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndex:a3];
  v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {
    int v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_19_cold_1();
    }
  }
  else
  {
    if (![v5 hasPrefix:@"com_"])
    {
      [*(id *)(a1 + 32) setAttribute:v6 forKey:v5];
      goto LABEL_8;
    }
    int v8 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:v5];
    [*(id *)(a1 + 32) setValue:v6 forCustomKey:v8];
  }

LABEL_8:
}

+ (id)CSSearchQueryContextForAutodonatingChats
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v5[0] = *MEMORY[0x1E4F22A10];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setFetchAttributes:v3];

  return v2;
}

+ (id)CSQueryStringForAutodonatingChatsWithDecay:(BOOL)a3
{
  id v3 = NSString;
  if (a3)
  {
    [MEMORY[0x1E4F89F30] decayInterval];
    id v5 = objc_msgSend(v3, "stringWithFormat:", @"kMDItemLastUsedDate>=$time.now(-%.f)", v4);
    v6 = [NSString stringWithFormat:@"%@ && %@", @"com_apple_mobilesms_isChatAutoDonating=1", v5];
  }
  else
  {
    v6 = [NSString stringWithFormat:@"%@", @"com_apple_mobilesms_isChatAutoDonating=1"];
  }
  return v6;
}

+ (id)CSSearchQueryContextForSLHighlightsForContentType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = v4;
  if (v3 == 1)
  {
    v6 = [(id)objc_opt_class() requiredSpotlightAttributeKeysForFiles];
    goto LABEL_5;
  }
  if (!v3)
  {
    v6 = [(id)objc_opt_class() requiredSpotlightAttributeKeysForLinks];
LABEL_5:
    v7 = v6;
    int v8 = [v6 allObjects];
    [v5 setFetchAttributes:v8];

    goto LABEL_7;
  }
  [v4 setFetchAttributes:0];
LABEL_7:
  return v5;
}

+ (id)CSQueryStringForSLHighlightsForContentType:(unsigned __int8)a3 forChatIdentifiers:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  if (!v4)
  {
    char v7 = 0;
    v6 = @"URL=*";
    int v8 = @"lnk";
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v6 = 0;
    char v7 = 1;
    int v8 = @"at";
LABEL_5:
    id v9 = [NSString stringWithFormat:@"%@=\"%@\"", *MEMORY[0x1E4F23148], v8];
    goto LABEL_7;
  }
  id v9 = 0;
  v6 = 0;
  char v7 = 1;
LABEL_7:
  id v10 = @"InRange(com_apple_mobilesms_isHighlightedContent, 1, 2)";
  if (!v5) {
    id v10 = @"com_apple_mobilesms_isHighlightedContent=2";
  }
  if (v7) {
    [NSString stringWithFormat:@"%@ && %@", v9, v10, v13];
  }
  else {
  v11 = [NSString stringWithFormat:@"%@ && %@ && %@", v9, v6, v10];
  }

  return v11;
}

+ (id)requiredSpotlightAttributeKeysForFiles
{
  v20[31] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F231D0];
  v20[0] = *MEMORY[0x1E4F22B50];
  v20[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22C38];
  v20[2] = *MEMORY[0x1E4F23670];
  v20[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F22B30];
  v20[4] = *MEMORY[0x1E4F22AF8];
  v20[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F22B10];
  v20[6] = *MEMORY[0x1E4F22B00];
  v20[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F23498];
  v20[8] = *MEMORY[0x1E4F22A08];
  v20[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F22C70];
  v20[10] = *MEMORY[0x1E4F22CE8];
  v20[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F22A10];
  v20[12] = *MEMORY[0x1E4F22C60];
  v20[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F230A8];
  v20[14] = *MEMORY[0x1E4F22FC0];
  v20[15] = v10;
  uint64_t v11 = *MEMORY[0x1E4F22FD8];
  v20[16] = *MEMORY[0x1E4F235E8];
  v20[17] = v11;
  uint64_t v12 = *MEMORY[0x1E4F236C0];
  v20[18] = *MEMORY[0x1E4F231D8];
  v20[19] = v12;
  uint64_t v13 = *MEMORY[0x1E4F22FA0];
  v20[20] = *MEMORY[0x1E4F230B0];
  v20[21] = v13;
  uint64_t v14 = *MEMORY[0x1E4F22FA8];
  v20[22] = *MEMORY[0x1E4F22FB0];
  v20[23] = v14;
  uint64_t v15 = *MEMORY[0x1E4F233E0];
  v20[24] = *MEMORY[0x1E4F22A78];
  v20[25] = v15;
  uint64_t v16 = *MEMORY[0x1E4F23148];
  v20[26] = *MEMORY[0x1E4F234B0];
  v20[27] = v16;
  v20[28] = *MEMORY[0x1E4F23080];
  v20[29] = @"com_apple_mobilesms_groupPhotoPath";
  v20[30] = @"com_apple_mobilesms_highlightedContentServerDate";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:31];
  v18 = [v2 setWithArray:v17];

  return v18;
}

+ (id)requiredSpotlightAttributeKeysForLinks
{
  v16[23] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F231D0];
  v16[0] = *MEMORY[0x1E4F22B50];
  v16[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22D28];
  v16[2] = *MEMORY[0x1E4F23670];
  v16[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F22C38];
  v16[4] = *MEMORY[0x1E4F23660];
  v16[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F22B30];
  v16[6] = *MEMORY[0x1E4F22AF8];
  v16[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F22B10];
  v16[8] = *MEMORY[0x1E4F22B00];
  v16[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F23498];
  v16[10] = *MEMORY[0x1E4F22A08];
  v16[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F230A8];
  v16[12] = *MEMORY[0x1E4F22CE8];
  v16[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F22FD8];
  v16[14] = *MEMORY[0x1E4F235E8];
  v16[15] = v10;
  uint64_t v11 = *MEMORY[0x1E4F233E0];
  v16[16] = *MEMORY[0x1E4F22A78];
  v16[17] = v11;
  uint64_t v12 = *MEMORY[0x1E4F23148];
  v16[18] = *MEMORY[0x1E4F234B0];
  v16[19] = v12;
  v16[20] = *MEMORY[0x1E4F23080];
  v16[21] = @"com_apple_mobilesms_groupPhotoPath";
  v16[22] = @"com_apple_mobilesms_highlightedContentServerDate";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:23];
  uint64_t v14 = [v2 setWithArray:v13];

  return v14;
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "CSSearchableIndex attributes fetch return an unexpected value (%@) for unique identifier: %@");
}

void __113__SLCoreSpotlightUtilities_fetchCSSearchableItemForUniqueIdentifier_forContentType_withRequiredAttributes_error___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "Missing required attribute %@ for loaded values with unique identifier %@");
}

@end