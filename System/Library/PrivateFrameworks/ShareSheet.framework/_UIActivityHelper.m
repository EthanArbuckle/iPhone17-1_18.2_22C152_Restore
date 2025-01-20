@interface _UIActivityHelper
+ (id)activityTypeForBundleIdentifier:(id)a3;
+ (id)builtinActivityClasses;
+ (id)transportImageForBundleIdentifier:(id)a3;
+ (void)registerContinuousExtensionsDiscoveryOnLaunch;
- (BOOL)primed;
- (NSArray)cachedBuiltinActivities;
- (NSString)sessionID;
- (_UIActivityApplicationExtensionDiscovery)applicationExtensionDiscovery;
- (_UIActivityHelper)initWithDelegate:(id)a3 sessionID:(id)a4 fetchShortcutsBlock:(id)a5;
- (_UIActivityHelperDelegate)delegate;
- (id)_activitiesByApplyingBeforeTypePinningToActivities:(id)a3 activitiesToBeforeTypePin:(id)a4;
- (id)_activitiesByApplyingDefaultOrdering:(id)a3;
- (id)_activitiesByApplyingFavoriteOrderingToActivities:(id)a3 favoriteActivityTypes:(id)a4;
- (id)_activitiesByDuetOrderingActivities:(id)a3;
- (id)_activitiesByTypeOrderingActivities:(id)a3 activityTypeOrdering:(id)a4;
- (id)_defaultOrderingDescriptorForActivity:(id)a3;
- (id)_defaultSortItemForBuiltinActivity:(id)a3;
- (id)_defaultSortOrderForApplicationDefinedActivity:(id)a3;
- (id)_defaultSortOrderForBuiltInElevatedActivity:(id)a3;
- (id)_defaultSortOrderForExtensionBasedActivity:(id)a3;
- (id)_defaultSortOrderForOpenInAppActivity:(id)a3;
- (id)_defaultSortOrderForOtherActivity:(id)a3;
- (id)_defaultSortOrderForShortcutActivity:(id)a3;
- (id)activitiesByOrderingActivities:(id)a3 applyDefaultOrdering:(BOOL)a4 applyBeforeTypePinning:(BOOL)a5 activityTypeOrdering:(id)a6 bypassDuet:(BOOL)a7;
- (id)fetchShortcutsBlock;
- (id)orderedAvailableActivitiesForMatchingContext:(id)a3;
- (id)reportExtensionsCacheResult;
- (void)_enumerateAvailableActivitiesForMatchingContext:(id)a3 intoMatchingResults:(id)a4 matchingResultsUpdateBlock:(id)a5 enumerateActivityBlock:(id)a6;
- (void)preheatAvailableActivitiesForMatchingContext:(id)a3;
- (void)primeWithDiscoveryContext:(id)a3;
- (void)setApplicationExtensionDiscovery:(id)a3;
- (void)setFetchShortcutsBlock:(id)a3;
- (void)setPrimed:(BOOL)a3;
@end

@implementation _UIActivityHelper

- (_UIActivityHelper)initWithDelegate:(id)a3 sessionID:(id)a4 fetchShortcutsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UIActivityHelper;
  v11 = [(_UIActivityHelper *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_sessionID, a4);
    uint64_t v13 = _UIActivityGetBuiltinActivities();
    cachedBuiltinActivities = v12->_cachedBuiltinActivities;
    v12->_cachedBuiltinActivities = (NSArray *)v13;

    uint64_t v15 = MEMORY[0x1A6229A90](v10);
    id fetchShortcutsBlock = v12->_fetchShortcutsBlock;
    v12->_id fetchShortcutsBlock = (id)v15;
  }
  return v12;
}

+ (id)builtinActivityClasses
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  return v2;
}

+ (id)activityTypeForBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (activityTypeForBundleIdentifier__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      v5 = [(id)activityTypeForBundleIdentifier__activityTypesForIdentifiers objectForKeyedSubscript:v4];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&activityTypeForBundleIdentifier__onceToken, &__block_literal_global_43);
    if (v4) {
      goto LABEL_3;
    }
  }
  v5 = 0;
LABEL_6:

  return v5;
}

+ (id)transportImageForBundleIdentifier:(id)a3
{
  id v3 = (__CFString *)a3;
  if (transportImageForBundleIdentifier__onceToken != -1) {
    dispatch_once(&transportImageForBundleIdentifier__onceToken, &__block_literal_global_185);
  }
  v4 = [(id)transportImageForBundleIdentifier__transportImagesForIdentifiers objectForKeyedSubscript:v3];
  if ([(__CFString *)v3 hasPrefix:@"com.apple.InCallService"])
  {

    id v3 = @"com.apple.facetime";
  }
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E4FB1818];
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    v4 = objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 5);
  }
  return v4;
}

+ (void)registerContinuousExtensionsDiscoveryOnLaunch
{
}

- (void)primeWithDiscoveryContext:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(_UIActivityApplicationExtensionDiscovery);
  v5 = [(_UIActivityHelper *)self fetchShortcutsBlock];
  [(_UIActivityApplicationExtensionDiscovery *)v6 setFetchShortcutsBlock:v5];

  [(_UIActivityHelper *)self setApplicationExtensionDiscovery:v6];
  [(_UIActivityHelper *)self setPrimed:1];
  [(_UIActivityApplicationExtensionDiscovery *)v6 primeWithDiscoveryContext:v4];
}

- (id)reportExtensionsCacheResult
{
  v2 = [(_UIActivityHelper *)self applicationExtensionDiscovery];
  id v3 = [v2 reportExtensionsCacheResult];

  return v3;
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(id)a3 intoMatchingResults:(id)a4 matchingResultsUpdateBlock:(id)a5 enumerateActivityBlock:(id)a6
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v80 = (void (**)(id, void *))a6;
  v11 = share_sheet_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.7((uint64_t)v9, v11);
  }

  v12 = [v9 excludedActivityTypes];
  v87 = v10;
  [v10 addExcludedActivityTypes:v12];

  uint64_t v13 = [v9 activityItemValues];
  unsigned int v83 = [v9 isContentManaged];
  int v82 = [v9 whitelistActionActivitiesOnly];
  uint64_t v90 = [v9 activityItems];
  v79 = [v9 applicationActivities];
  v84 = [v9 includedActivityTypes];
  uint64_t v86 = [v9 excludedActivityCategories];
  v78 = v13;
  _UIActivityItemTypesSet(v13);
  v92 = [MEMORY[0x1E4F1CA48] array];
  v91 = [(_UIActivityHelper *)self cachedBuiltinActivities];
  if ([v9 allowMatchingBuiltInActivities]) {
    [v92 addObjectsFromArray:v91];
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v14 = [v9 activityTypesGeneratedByDelegate];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v99 objects:v116 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v100 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v99 + 1) + 8 * i);
        v20 = [(_UIActivityHelper *)self delegate];
        v21 = [(_UIActivityHelper *)self sessionID];
        int v22 = [v20 activityHelper:self matchingWithContext:v9 shouldIncludeSystemActivityType:v19 sessionID:v21];

        if (v22)
        {
          v23 = [(_UIActivityHelper *)self delegate];
          v24 = [(_UIActivityHelper *)self sessionID];
          v25 = [v23 activityHelper:self activitiesForActivityType:v19 matchingContext:v9 sessionID:v24];

          if (v25) {
            [v92 addObjectsFromArray:v25];
          }
        }
        else
        {
          uint64_t v115 = v19;
          v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
          [v87 addExcludedActivityTypes:v25];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v99 objects:v116 count:16];
    }
    while (v16);
  }

  uint64_t v26 = [v9 prematchedExtensionActivities];
  v77 = (void *)v26;
  if (v26)
  {
    [v92 addObjectsFromArray:v26];
    v27 = v87;
    v28 = (void *)v90;
  }
  else
  {
    v27 = v87;
    v28 = (void *)v90;
    if (a5 && [v9 allowMatchingExtensionActivities])
    {
      if ([(_UIActivityHelper *)self primed])
      {
        [(_UIActivityHelper *)self setPrimed:0];
      }
      else
      {
        v70 = objc_alloc_init(_UIActivityApplicationExtensionDiscovery);
        [(_UIActivityHelper *)self setApplicationExtensionDiscovery:v70];

        v71 = [(_UIActivityHelper *)self fetchShortcutsBlock];
        v72 = [(_UIActivityHelper *)self applicationExtensionDiscovery];
        [v72 setFetchShortcutsBlock:v71];
      }
      v73 = [(_UIActivityHelper *)self applicationExtensionDiscovery];
      id v98 = 0;
      v74 = [v73 activitiesForMatchingContext:v9 error:&v98];
      id v75 = v98;

      if (v74)
      {
        [v92 addObjectsFromArray:v74];
      }
      else
      {
        v76 = share_sheet_log();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
          -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.6((uint64_t)v75, v76);
        }
      }
    }
  }
  [v92 addObjectsFromArray:v79];
  id v81 = v92;
  uint64_t v29 = [v81 count];
  if (v29)
  {
    uint64_t v30 = v29 - 1;
    do
    {
      v31 = [v81 objectAtIndexedSubscript:v30];
      v32 = [v31 activityType];
      int v33 = [@"com.apple.UIKit.activity.OpenWithApp-com.apple.DocumentsApp" isEqualToString:v32];

      if (v33) {
        [v81 removeObjectAtIndex:v30];
      }

      --v30;
    }
    while (v30 != -1);
  }

  v34 = _UIActivityGetOrderedBuiltinActivitiesFromActivities(v81);
  v35 = [(_UIActivityHelper *)self _activitiesByApplyingBeforeTypePinningToActivities:v34 activitiesToBeforeTypePin:v79];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obja = v35;
  uint64_t v93 = [obja countByEnumeratingWithState:&v94 objects:v114 count:16];
  if (v93)
  {
    uint64_t v36 = *(void *)v95;
    uint64_t v85 = *(void *)v95;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v95 != v36) {
          objc_enumerationMutation(obja);
        }
        v38 = *(void **)(*((void *)&v94 + 1) + 8 * v37);
        if ([v91 containsObject:v38])
        {
          v39 = [v38 activityType];
          char v40 = [v39 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

          if ((v40 & 1) == 0)
          {
            v41 = [(_UIActivityHelper *)self delegate];
            v42 = [v38 activityType];
            v43 = [(_UIActivityHelper *)self sessionID];
            char v44 = [v41 activityHelper:self matchingWithContext:v9 shouldIncludeSystemActivityType:v42 sessionID:v43];

            uint64_t v36 = v85;
            if ((v44 & 1) == 0)
            {
              v49 = [v38 activityType];
              v113 = v49;
              v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
              [v27 addExcludedActivityTypes:v50];

              v47 = share_sheet_log();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
                -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.5((uint64_t)v112, (uint64_t)v38);
              }
              goto LABEL_44;
            }
          }
        }
        if ([v9 shouldExcludeActivity:v38])
        {
          v45 = [v38 activityType];
          v111 = v45;
          v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
          [v27 addExcludedActivityTypes:v46];

          v47 = share_sheet_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:]((uint64_t)v110, (uint64_t)v38);
          }
LABEL_44:

          goto LABEL_45;
        }
        if ((v86 & (1 << [(id)objc_opt_class() activityCategory])) != 0)
        {
          v47 = share_sheet_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.4((uint64_t)v109, (uint64_t)v38);
          }
          goto LABEL_44;
        }
        if (v84)
        {
          v48 = [v38 activityType];
          if (([v84 containsObject:v48] & 1) != 0
            || v82 && [(id)objc_opt_class() activityCategory] == 1)
          {
          }
          else
          {
            v51 = [v38 activityType];
            char v52 = [v51 isEqualToString:@"com.apple.UIKit.activity.Share"];

            if ((v52 & 1) == 0)
            {
              v68 = share_sheet_log();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
                -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:]((uint64_t)v108, (uint64_t)v38);
              }

              goto LABEL_66;
            }
          }
        }
        _setIsContentManagedIfResctrictableActivity(v38, v83);
        v53 = [v38 activityType];
        if ([v53 isEqualToString:@"com.apple.UIKit.activity.CopyToPasteboard"]
          && [v28 count])
        {
          v54 = [v28 objectAtIndex:0];
          v55 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v55);
          if ([v56 isEqualToString:@"GKAchievement"])
          {

LABEL_66:
            uint64_t v36 = v85;
            goto LABEL_45;
          }
          v64 = [v28 objectAtIndex:0];
          v65 = (objc_class *)objc_opt_class();
          v66 = NSStringFromClass(v65);
          char v67 = [v66 isEqualToString:@"GKScore"];

          v27 = v87;
          uint64_t v36 = v85;
          if (v67) {
            goto LABEL_45;
          }
        }
        else
        {

          uint64_t v36 = v85;
        }
        v57 = [v38 activityType];
        int v58 = [v57 isEqualToString:@"com.apple.UIKit.activity.SharePlay"];

        if (v58)
        {
          v107 = v38;
          v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
          [v27 addHiddenActivities:v59];

          if ([v9 showSharePlayProminently])
          {
            v47 = share_sheet_log();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:]((uint64_t)v106, (uint64_t)v38);
            }
            goto LABEL_44;
          }
        }
        v60 = [v38 activityType];
        int v61 = [v60 isEqualToString:@"com.apple.InCallService.ShareExtension"];

        if (v61)
        {
          v105 = v38;
          v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
          [v27 addHiddenActivities:v62];

          v47 = share_sheet_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v63 = [v38 activityType];
            *(_DWORD *)buf = 138412290;
            v104 = v63;
            _os_log_impl(&dword_1A0AD8000, v47, OS_LOG_TYPE_DEFAULT, "Excluding activityType %@ because it should only ever be shown as a suggestion", buf, 0xCu);
          }
          goto LABEL_44;
        }
        v80[2](v80, v38);
LABEL_45:
        ++v37;
        v28 = (void *)v90;
      }
      while (v93 != v37);
      uint64_t v69 = [obja countByEnumeratingWithState:&v94 objects:v114 count:16];
      uint64_t v93 = v69;
    }
    while (v69);
  }
}

- (void)preheatAvailableActivitiesForMatchingContext:(id)a3
{
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.ShareUI.activityPreheating", v5);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66___UIActivityHelper_preheatAvailableActivitiesForMatchingContext___block_invoke;
  v9[3] = &unk_1E5A23708;
  dispatch_queue_t v10 = v7;
  id v8 = v7;
  [(_UIActivityHelper *)self _enumerateAvailableActivitiesForMatchingContext:v6 intoMatchingResults:0 matchingResultsUpdateBlock:0 enumerateActivityBlock:v9];
}

- (id)orderedAvailableActivitiesForMatchingContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityItemValues];
  char v6 = [v4 isContentManaged];
  dispatch_queue_t v7 = [v4 sourceApplicationIdentifier];
  v45 = self;
  id v8 = [(_UIActivityHelper *)self cachedBuiltinActivities];
  id v9 = +[_UIActivityPlaceholderItemProxy unproxiedItemsForItems:v5];
  int v10 = [v4 allowMatchingExtensionActivities];
  v11 = share_sheet_log();
  v12 = share_sheet_log();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v4);

  if (v10)
  {
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      v14 = "AvailableActivitiesIncludingExtensions";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, v14, (const char *)&unk_1A0BA1E03, buf, 2u);
    }
  }
  else if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    v14 = "AvailableActivitiesExcludingExtensions";
    goto LABEL_8;
  }

  uint64_t v15 = [[_UIActivityMatchingResults alloc] initWithActivityMatchingContext:v4];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __66___UIActivityHelper_orderedAvailableActivitiesForMatchingContext___block_invoke_2;
  v46[3] = &unk_1E5A23750;
  id v47 = v8;
  id v48 = v5;
  id v49 = v9;
  id v17 = v4;
  id v50 = v17;
  id v51 = v7;
  id v18 = v16;
  id v52 = v18;
  char v53 = v6;
  id v44 = v7;
  id v43 = v9;
  id v19 = v5;
  id v20 = v8;
  [(_UIActivityHelper *)v45 _enumerateAvailableActivitiesForMatchingContext:v17 intoMatchingResults:v15 matchingResultsUpdateBlock:&__block_literal_global_212 enumerateActivityBlock:v46];
  v21 = share_sheet_log();
  int v22 = share_sheet_log();
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v17);

  unint64_t v24 = v23 - 1;
  if (v10)
  {
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v21, OS_SIGNPOST_INTERVAL_END, v23, "AvailableActivitiesIncludingExtensions", (const char *)&unk_1A0BA1E03, buf, 2u);
    }

    v25 = share_sheet_log();
    uint64_t v26 = share_sheet_log();
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v26, v17);

    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      v28 = "SortAvailableActivitiesIncludingExtensions";
LABEL_22:
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, v28, (const char *)&unk_1A0BA1E03, buf, 2u);
    }
  }
  else
  {
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v21, OS_SIGNPOST_INTERVAL_END, v23, "AvailableActivitiesExcludingExtensions", (const char *)&unk_1A0BA1E03, buf, 2u);
    }

    v25 = share_sheet_log();
    uint64_t v29 = share_sheet_log();
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v29, v17);

    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      v28 = "SortAvailableActivitiesExcludingExtensions";
      goto LABEL_22;
    }
  }

  uint64_t v30 = [v17 externalMatchBuiltinOrderedActivities];
  v31 = (void *)v30;
  v32 = (void *)MEMORY[0x1E4F1CBF0];
  if (v30) {
    v32 = (void *)v30;
  }
  id v33 = v32;

  v34 = [v33 arrayByAddingObjectsFromArray:v18];

  BOOL v35 = ([v17 excludedActivityCategories] & 2) != 0 || objc_msgSend(v17, "sharingStyle") == 2;
  uint64_t v36 = [v17 activityTypeOrder];
  uint64_t v37 = [(_UIActivityHelper *)v45 activitiesByOrderingActivities:v34 applyDefaultOrdering:1 applyBeforeTypePinning:1 activityTypeOrdering:v36 bypassDuet:v35];
  [(_UIActivityMatchingResults *)v15 setOrderedActivities:v37];

  v38 = share_sheet_log();
  v39 = share_sheet_log();
  os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v39, v17);

  if (v10)
  {
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      v41 = "SortAvailableActivitiesIncludingExtensions";
LABEL_35:
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v38, OS_SIGNPOST_INTERVAL_END, v40, v41, (const char *)&unk_1A0BA1E03, buf, 2u);
    }
  }
  else if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    v41 = "SortAvailableActivitiesExcludingExtensions";
    goto LABEL_35;
  }

  return v15;
}

- (id)activitiesByOrderingActivities:(id)a3 applyDefaultOrdering:(BOOL)a4 applyBeforeTypePinning:(BOOL)a5 activityTypeOrdering:(id)a6 bypassDuet:(BOOL)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = v12;
  uint64_t v15 = v14;
  if (v10)
  {
    uint64_t v15 = [(_UIActivityHelper *)self _activitiesByApplyingDefaultOrdering:v14];

    if (!v9)
    {
LABEL_3:
      if (!v13) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v9)
  {
    goto LABEL_3;
  }
  uint64_t v27 = [(_UIActivityHelper *)self _activitiesByApplyingBeforeTypePinningToActivities:v15 activitiesToBeforeTypePin:v15];

  uint64_t v15 = (void *)v27;
  if (v13)
  {
LABEL_4:
    uint64_t v16 = [(_UIActivityHelper *)self _activitiesByTypeOrderingActivities:v15 activityTypeOrdering:v13];

    uint64_t v15 = (void *)v16;
  }
LABEL_5:
  if (([v13 containsObject:@"com.apple.UIKit.activity.Share"] & 1) == 0)
  {
    v29[0] = @"com.apple.UIKit.activity.Share";
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    uint64_t v18 = [(_UIActivityHelper *)self _activitiesByApplyingFavoriteOrderingToActivities:v15 favoriteActivityTypes:v17];

    uint64_t v15 = (void *)v18;
  }
  if (!a7)
  {
    id v19 = share_sheet_log();
    id v20 = share_sheet_log();
    os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, v15);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SortAvailableActivitiesByDuet", (const char *)&unk_1A0BA1E03, v28, 2u);
    }

    int v22 = [(_UIActivityHelper *)self _activitiesByDuetOrderingActivities:v15];

    os_signpost_id_t v23 = share_sheet_log();
    unint64_t v24 = share_sheet_log();
    os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, v22);

    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v23, OS_SIGNPOST_INTERVAL_END, v25, "SortAvailableActivitiesByDuet", (const char *)&unk_1A0BA1E03, v28, 2u);
    }

    uint64_t v15 = (void *)v22;
  }

  return v15;
}

- (id)_activitiesByApplyingDefaultOrdering:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___UIActivityHelper__activitiesByApplyingDefaultOrdering___block_invoke;
  v7[3] = &unk_1E5A23778;
  v7[4] = self;
  id v3 = _mapArray(a3, v7);
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];
  v5 = _mapArray(v4, &__block_literal_global_218);

  return v5;
}

- (id)_defaultOrderingDescriptorForActivity:(id)a3
{
  id v4 = a3;
  switch([v4 _defaultSortGroup])
  {
    case 1:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortOrderForBuiltInElevatedActivity:v4];
      goto LABEL_10;
    case 2:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortItemForBuiltinActivity:v4];
      goto LABEL_10;
    case 3:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortOrderForApplicationDefinedActivity:v4];
      goto LABEL_10;
    case 4:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortOrderForExtensionBasedActivity:v4];
      goto LABEL_10;
    case 5:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortOrderForOpenInAppActivity:v4];
      goto LABEL_10;
    case 6:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortOrderForShortcutActivity:v4];
      goto LABEL_10;
    case 7:
      uint64_t v5 = [(_UIActivityHelper *)self _defaultSortOrderForOtherActivity:v4];
LABEL_10:
      char v6 = (void *)v5;
      break;
    default:
      char v6 = 0;
      break;
  }

  return v6;
}

- (id)_defaultSortOrderForBuiltInElevatedActivity:(id)a3
{
  id v3 = a3;
  id v4 = +[_UIActivityUserDefaults builtinActivityOrder];
  uint64_t v5 = [v3 activityType];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_queue_t v7 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:1 secondarySortValue:&unk_1EF33A150];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6 + 1000];
    dispatch_queue_t v7 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:1 secondarySortValue:v8];
  }
  return v7;
}

- (id)_defaultSortItemForBuiltinActivity:(id)a3
{
  id v3 = a3;
  id v4 = +[_UIActivityUserDefaults builtinActivityOrder];
  uint64_t v5 = [v3 activityType];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_queue_t v7 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:2 secondarySortValue:&unk_1EF33A150];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6 + 1000];
    dispatch_queue_t v7 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:2 secondarySortValue:v8];
  }
  return v7;
}

- (id)_defaultSortOrderForExtensionBasedActivity:(id)a3
{
  id v3 = a3;
  id v4 = +[_UIActivityUserDefaults builtinActivityOrder];
  uint64_t v5 = [v3 activityType];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6 + 3000];
    id v17 = v3;
    uint64_t v18 = 2;
LABEL_8:
    uint64_t v16 = +[_UIActivitySortItem sortDescriptorForActivity:v17 withGroup:v18 secondarySortValue:v7];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [v3 activityTitle];
    id v17 = v3;
    uint64_t v18 = 7;
    goto LABEL_8;
  }
  id v7 = v3;
  id v8 = [v7 installationDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v12 = v10 / v11;

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v14 = 2000.0;
  if (isKindOfClass) {
    double v14 = 1000.0;
  }
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12 + v14];
  uint64_t v16 = +[_UIActivitySortItem sortDescriptorForActivity:v7 withGroup:4 secondarySortValue:v15];

LABEL_9:
  return v16;
}

- (id)_defaultSortOrderForApplicationDefinedActivity:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexInApplicationDefinedActivities"));
  uint64_t v6 = +[_UIActivitySortItem sortDescriptorForActivity:v4 withGroup:3 secondarySortValue:v5];

  return v6;
}

- (id)_defaultSortOrderForOpenInAppActivity:(id)a3
{
  id v3 = a3;
  if ([v3 _appIsDocumentTypeOwner]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 10;
  }
  int v5 = [v3 _supportsOpenInPlace];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4 | v5 ^ 1u];
  id v7 = [v3 activityTitle];
  id v8 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:5 secondarySortValue:v6 tertiarySortValue:v7];

  return v8;
}

- (id)_defaultSortOrderForShortcutActivity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 sortValue];
  }
  else
  {
    uint64_t v4 = &unk_1EF33A168;
  }
  int v5 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:6 secondarySortValue:v4];

  return v5;
}

- (id)_defaultSortOrderForOtherActivity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 activityTitle];
  int v5 = +[_UIActivitySortItem sortDescriptorForActivity:v3 withGroup:7 secondarySortValue:v4];

  return v5;
}

- (id)_activitiesByApplyingBeforeTypePinningToActivities:(id)a3 activitiesToBeforeTypePin:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)[a3 mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v12 = [v11 _beforeActivity];
        id v13 = v12;
        if (v12)
        {
          id v14 = v12;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = ___UIIndexOfActivityType_block_invoke;
          v24[3] = &unk_1E5A23048;
          id v25 = v14;
          unint64_t v15 = [v6 indexOfObjectPassingTest:v24];

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v16 = [v6 indexOfObject:v11];
            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v17 = v16;
              [v6 removeObject:v11];
              if (v17 > v15) {
                ++v15;
              }
            }
            [v6 insertObject:v11 atIndex:v15];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_activitiesByTypeOrderingActivities:(id)a3 activityTypeOrdering:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v19 + 1) + 8 * i);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = ___UIIndexOfActivityType_block_invoke;
          v23[3] = &unk_1E5A23048;
          id v24 = v12;
          id v13 = v12;
          uint64_t v14 = [v7 indexOfObjectPassingTest:v23];

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v15 = [v7 objectAtIndexedSubscript:v14];
            [v17 addObject:v15];

            [v7 removeObjectAtIndex:v14];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v9);
    }

    [v17 addObjectsFromArray:v7];
  }
  else
  {
    id v17 = v5;
  }

  return v17;
}

- (id)_activitiesByApplyingFavoriteOrderingToActivities:(id)a3 favoriteActivityTypes:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v5 reverseObjectEnumerator];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = ___UIIndexOfActivityType_block_invoke;
        v21[3] = &unk_1E5A23048;
        id v22 = v11;
        id v12 = v11;
        uint64_t v13 = [v6 indexOfObjectPassingTest:v21];

        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = [v6 objectAtIndexedSubscript:v13];
          [v6 removeObjectAtIndex:v13];
          [v6 insertObject:v14 atIndex:0];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_activitiesByDuetOrderingActivities:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  uint64_t v4 = [(_UIActivityHelper *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    id v6 = (void *)get_PSSuggesterConfigurationClass_softClass;
    uint64_t v62 = get_PSSuggesterConfigurationClass_softClass;
    if (!get_PSSuggesterConfigurationClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      char v67 = __get_PSSuggesterConfigurationClass_block_invoke;
      v68 = &unk_1E5A216E8;
      uint64_t v69 = &v59;
      __get_PSSuggesterConfigurationClass_block_invoke((uint64_t)&buf);
      id v6 = (void *)v60[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v59, 8);
    v42 = [v7 defaultConfiguration];
    [v42 setMaximumNumberOfSuggestions:8];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    uint64_t v8 = (void *)get_PSSuggesterClass_softClass;
    uint64_t v62 = get_PSSuggesterClass_softClass;
    if (!get_PSSuggesterClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      char v67 = __get_PSSuggesterClass_block_invoke;
      v68 = &unk_1E5A216E8;
      uint64_t v69 = &v59;
      __get_PSSuggesterClass_block_invoke((uint64_t)&buf);
      uint64_t v8 = (void *)v60[3];
    }
    uint64_t v9 = v8;
    _Block_object_dispose(&v59, 8);
    v39 = (void *)[[v9 alloc] initWithDaemonUsingConfiguration:v42];
    uint64_t v10 = [(_UIActivityHelper *)self delegate];
    id v11 = [(_UIActivityHelper *)self sessionID];
    v41 = [v10 activityHelper:self predictionContextForSessionID:v11];

    v46 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v12 = v43;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v56 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v17 = [v16 containingAppBundleIdentifier];
            long long v18 = [v16 activityType];
            long long v19 = [v46 objectForKeyedSubscript:v17];
            long long v20 = v19;
            if (v19)
            {
              if (([v19 containsObject:v18] & 1) == 0) {
                [v20 addObject:v18];
              }
              if (!v17) {
                goto LABEL_19;
              }
LABEL_18:
              [v46 setObject:v20 forKeyedSubscript:v17];
            }
            else
            {
              long long v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v18];
              if (v17) {
                goto LABEL_18;
              }
            }
LABEL_19:

            continue;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v13);
    }

    [v41 setAppBundleIdsToShareExtensionBundleIdsMapping:v46];
    os_signpost_id_t v40 = [v39 shareExtensionSuggestionsFromContext:v41];
    if ([v40 count])
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v21 = v40;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v64 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = *(void **)(*((void *)&v51 + 1) + 8 * j);
            uint64_t v26 = share_sheet_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v25 bundleID];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v27;
              _os_log_impl(&dword_1A0AD8000, v26, OS_LOG_TYPE_DEFAULT, "duet ordering suggestion for bundle ID: %@", (uint8_t *)&buf, 0xCu);
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v64 count:16];
        }
        while (v22);
      }

      v28 = [v21 valueForKey:@"bundleID"];
      uint64_t v29 = (void *)[v12 mutableCopy];
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count"));
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v28;
      uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v63 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v48 != v31) {
              objc_enumerationMutation(obj);
            }
            id v33 = (uint64_t *)*(id *)(*((void *)&v47 + 1) + 8 * k);
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            char v67 = ___UIIndexOfActivityType_block_invoke;
            v68 = &unk_1E5A23048;
            uint64_t v69 = v33;
            v34 = v33;
            uint64_t v35 = [v29 indexOfObjectPassingTest:&buf];

            if (v35 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v36 = [v29 objectAtIndexedSubscript:v35];
              [v44 addObject:v36];

              [v29 removeObjectAtIndex:v35];
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v63 count:16];
        }
        while (v30);
      }

      [v44 addObjectsFromArray:v29];
    }
    else
    {
      id v44 = v12;
    }

    uint64_t v37 = v43;
  }
  else
  {
    uint64_t v37 = v43;
    id v44 = v43;
  }

  return v44;
}

- (_UIActivityHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIActivityHelperDelegate *)WeakRetained;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (_UIActivityApplicationExtensionDiscovery)applicationExtensionDiscovery
{
  return self->_applicationExtensionDiscovery;
}

- (void)setApplicationExtensionDiscovery:(id)a3
{
}

- (NSArray)cachedBuiltinActivities
{
  return self->_cachedBuiltinActivities;
}

- (BOOL)primed
{
  return self->_primed;
}

- (void)setPrimed:(BOOL)a3
{
  self->_primed = a3;
}

- (id)fetchShortcutsBlock
{
  return self->_fetchShortcutsBlock;
}

- (void)setFetchShortcutsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShortcutsBlock, 0);
  objc_storeStrong((id *)&self->_cachedBuiltinActivities, 0);
  objc_storeStrong((id *)&self->_applicationExtensionDiscovery, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.1(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(a1, a2), "activityType");
  OUTLINED_FUNCTION_2_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A0AD8000, v3, v4, "Excluding activityType %@ as determined by activityMatchingContext");
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.2(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(a1, a2), "activityType");
  OUTLINED_FUNCTION_2_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A0AD8000, v3, v4, "Excluding activityType %@ because it should be shown prominently in the header");
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.3(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(a1, a2), "activityType");
  OUTLINED_FUNCTION_2_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A0AD8000, v3, v4, "Excluding activityType %@ because client has set includedActivityTypes");
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.4(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(a1, a2), "activityType");
  OUTLINED_FUNCTION_2_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A0AD8000, v3, v4, "Excluding activityType %@ because it is in a hidden category");
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.5(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(a1, a2), "activityType");
  OUTLINED_FUNCTION_2_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A0AD8000, v3, v4, "Excluding activityType %@ as instructed by _shouldShowSystemActivityType");
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(NSObject *)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Cannot find application extensions: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(NSObject *)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_DEBUG, "Enumerate available activities for %@", (uint8_t *)&v2, 0xCu);
}

@end