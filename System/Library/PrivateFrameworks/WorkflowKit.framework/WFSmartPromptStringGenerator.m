@interface WFSmartPromptStringGenerator
+ (id)contentDescriptionWithAttributionSet:(id)a3 contentItemCache:(id)a4;
+ (id)localizedOutputContentDescriptionWithContentCollection:(id)a3;
+ (id)localizedPromptForWorkflowName:(id)a3 attributionSet:(id)a4 contentCollection:(id)a5 contentItemCache:(id)a6 contentDestination:(id)a7 action:(id)a8 isWebpageCoercion:(BOOL)a9;
+ (id)localizedSubtitleForWorkflowName:(id)a3 attributionSet:(id)a4 previousAttributions:(id)a5 contentItemCache:(id)a6 contentDestination:(id)a7 action:(id)a8 isWebpageCoercion:(BOOL)a9;
@end

@implementation WFSmartPromptStringGenerator

+ (id)localizedOutputContentDescriptionWithContentCollection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28BD0] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [v3 items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_opt_class();
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __87__WFSmartPromptStringGenerator_localizedOutputContentDescriptionWithContentCollection___block_invoke;
  v23 = &unk_1E6553A38;
  id v11 = v4;
  id v24 = v11;
  v12 = objc_msgSend(v11, "if_map:", &v20);
  if ([v12 count])
  {
    v13 = (void *)MEMORY[0x1E4F28DF8];
    v14 = [v12 allObjects];
    v15 = [v13 localizedStringByJoiningStrings:v14];
    v16 = [v15 localizedLowercaseString];
  }
  else
  {
    v17 = NSString;
    v14 = WFLocalizedPluralString(@"%1$d items");
    uint64_t v18 = [v3 numberOfItems];
    v16 = objc_msgSend(v17, "localizedStringWithFormat:", v14, v18, v20, v21, v22, v23);
  }

  return v16;
}

id __87__WFSmartPromptStringGenerator_localizedOutputContentDescriptionWithContentCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];
  if (objc_opt_respondsToSelector())
  {
    v4 = [a2 localizedCountDescriptionWithValue:v3];
  }
  else
  {
    v5 = NSString;
    uint64_t v6 = [a2 countDescription];
    v4 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
  }
  return v4;
}

+ (id)contentDescriptionWithAttributionSet:(id)a3 contentItemCache:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v63 = v5;
  v9 = [v5 attributions];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v80 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v79 + 1) + 8 * i) privateItemIdentifiers];
        v15 = [v14 set];
        [v8 unionSet:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v11);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v76 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [v6 contentItemForUUID:*(void *)(*((void *)&v75 + 1) + 8 * j)];
        uint64_t v22 = objc_opt_class();
        if (v22) {
          [v7 addObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v18);
  }

  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __86__WFSmartPromptStringGenerator_contentDescriptionWithAttributionSet_contentItemCache___block_invoke;
  v73[3] = &unk_1E6553A38;
  id v23 = v7;
  id v74 = v23;
  id v24 = objc_msgSend(v23, "if_map:", v73);
  if (![v24 count])
  {
    id v61 = v23;
    v62 = v24;
    id v26 = [MEMORY[0x1E4F28BD0] set];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v29 = [v63 attributions];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v88 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v70;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v70 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v69 + 1) + 8 * k);
          uint64_t v35 = [v34 origin];
          if (v35)
          {
            v36 = (void *)v35;
            uint64_t v37 = [v34 disclosureLevel];

            if (v37 == 1)
            {
              if ([v34 count])
              {
                unint64_t v38 = 0;
                do
                {
                  v39 = [v34 origin];
                  [v26 addObject:v39];

                  ++v38;
                }
                while ([v34 count] > v38);
              }
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v69 objects:v88 count:16];
      }
      while (v31);
    }

    if (![v26 count])
    {
      long long v28 = 0;
      id v23 = v61;
      id v24 = v62;
      goto LABEL_57;
    }
    id v60 = v16;
    long long v27 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v26 = v26;
    uint64_t v40 = [v26 countByEnumeratingWithState:&v65 objects:v87 count:16];
    v41 = v26;
    id v24 = v62;
    if (v40)
    {
      uint64_t v42 = v40;
      v64 = v27;
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v66;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v66 != v44) {
            objc_enumerationMutation(v26);
          }
          v46 = *(void **)(*((void *)&v65 + 1) + 8 * m);
          uint64_t v47 = [v26 countForObject:v46];
          v48 = [v46 localizedTitle];
          if (v48)
          {
            v49 = NSString;
            if (v47 == 1)
            {
              v50 = WFLocalizedString(@"1 %1$@ item");
              v51 = objc_msgSend(v49, "localizedStringWithFormat:", v50, v48);
              [v64 addObject:v51];
            }
            else
            {
              v53 = WFLocalizedString(@"%1$d %2$@ items");
              v54 = objc_msgSend(v49, "localizedStringWithFormat:", v53, v47, v48);
              [v64 addObject:v54];
            }
          }
          else
          {
            v52 = getWFSecurityLogObject();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v84 = "+[WFSmartPromptStringGenerator contentDescriptionWithAttributionSet:contentItemCache:]";
              __int16 v85 = 2112;
              v86 = v46;
              _os_log_impl(&dword_1C7F0A000, v52, OS_LOG_TYPE_INFO, "%s Could not get localizedTitle for origin %@", buf, 0x16u);
            }

            v43 += v47;
          }
        }
        uint64_t v42 = [v26 countByEnumeratingWithState:&v65 objects:v87 count:16];
      }
      while (v42);

      id v24 = v62;
      long long v27 = v64;
      if (!v43) {
        goto LABEL_52;
      }
      if (v43 == 1)
      {
        v41 = WFLocalizedString(@"1 item");
        [v64 addObject:v41];
      }
      else
      {
        v55 = NSString;
        v41 = WFLocalizedString(@"%1$d items");
        v56 = objc_msgSend(v55, "localizedStringWithFormat:", v41, v43);
        [v64 addObject:v56];
      }
    }

LABEL_52:
    if ([v27 count])
    {
      v57 = (void *)MEMORY[0x1E4F28DF8];
      v58 = [v27 array];
      long long v28 = [v57 localizedStringByJoiningStrings:v58];
    }
    else
    {
      long long v28 = 0;
    }
    id v16 = v60;
    id v23 = v61;
    goto LABEL_56;
  }
  long long v25 = (void *)MEMORY[0x1E4F28DF8];
  id v26 = [v24 allObjects];
  long long v27 = [v25 localizedStringByJoiningStrings:v26];
  long long v28 = [v27 localizedLowercaseString];
LABEL_56:

LABEL_57:
  return v28;
}

id __86__WFSmartPromptStringGenerator_contentDescriptionWithAttributionSet_contentItemCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];
  if (objc_opt_respondsToSelector())
  {
    v4 = [a2 localizedCountDescriptionWithValue:v3];
  }
  else
  {
    id v5 = NSString;
    id v6 = [a2 countDescription];
    v4 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
  }
  return v4;
}

+ (id)localizedSubtitleForWorkflowName:(id)a3 attributionSet:(id)a4 previousAttributions:(id)a5 contentItemCache:(id)a6 contentDestination:(id)a7 action:(id)a8 isWebpageCoercion:(BOOL)a9
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = [a1 contentDescriptionWithAttributionSet:v16 contentItemCache:v18];
  uint64_t v22 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:2];
  v52 = v17;
  if (v17)
  {
    id v17 = [a1 contentDescriptionWithAttributionSet:v17 contentItemCache:v18];
  }
  id v23 = [v19 localizedTitle];
  v50 = v20;
  v48 = v17;
  v53 = v15;
  id v24 = [v20 smartPromptSubtitleWithPreviousContentDescription:v17 contentDestination:v23 workflowName:v15];

  if ([v24 length]) {
    [v22 addObject:v24];
  }
  uint64_t v47 = v24;
  if (!a9)
  {
    long long v25 = [MEMORY[0x1E4F5A868] webpagesLocation];
    if ([v19 isEqual:v25])
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();
  long long v28 = NSString;
  if (v27)
  {
    if (v21) {
      v29 = @"This might allow “%1$@” to share this content with “%2$@”.";
    }
    else {
      v29 = @"This might allow “%1$@” to share content with “%2$@”.";
    }
    uint64_t v31 = WFLocalizedString(v29);
    uint64_t v32 = [v19 localizedTitle];
    v33 = objc_msgSend(v28, "localizedStringWithFormat:", v31, v53, v32);
    [v22 addObject:v33];
  }
  else
  {
    if (v21) {
      uint64_t v30 = @"This might allow “%1$@” to share this content with any website.";
    }
    else {
      uint64_t v30 = @"This might allow “%1$@” to share content with any website.";
    }
    uint64_t v31 = WFLocalizedString(v30);
    uint64_t v32 = objc_msgSend(v28, "localizedStringWithFormat:", v31, v53);
    [v22 addObject:v32];
  }

LABEL_19:
  v49 = v19;
  v34 = (void *)v21;
  v51 = v18;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v35 = v16;
  v36 = [v16 attributions];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v55 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [*(id *)(*((void *)&v54 + 1) + 8 * i) disclosureWarnings];
        uint64_t v42 = objc_msgSend(v41, "if_map:", &__block_literal_global_43156);

        [v22 unionOrderedSet:v42];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v38);
  }

  if ([v22 count])
  {
    uint64_t v43 = (void *)MEMORY[0x1E4F28DF8];
    uint64_t v44 = [v22 array];
    v45 = [v43 localizedStringByJoiningStrings:v44];
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

uint64_t __162__WFSmartPromptStringGenerator_localizedSubtitleForWorkflowName_attributionSet_previousAttributions_contentItemCache_contentDestination_action_isWebpageCoercion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedMessage];
}

+ (id)localizedPromptForWorkflowName:(id)a3 attributionSet:(id)a4 contentCollection:(id)a5 contentItemCache:(id)a6 contentDestination:(id)a7 action:(id)a8 isWebpageCoercion:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v17 promptingBehaviour] == 2)
  {
    id v19 = 0;
  }
  else
  {
    id v19 = [a1 contentDescriptionWithAttributionSet:v15 contentItemCache:v16];
  }
  id v20 = [v17 localizedTitle];
  if (!a9) {
    goto LABEL_11;
  }
  uint64_t v21 = [MEMORY[0x1E4F5A868] webpagesLocation];
  int v22 = [v17 isEqual:v21];

  if (!v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = NSString;
      if (v19)
      {
        id v24 = WFLocalizedString(@"Allow “%1$@” to access %2$@ while loading web content on “%3$@”?");
        id v26 = [v17 localizedTitle];
        objc_msgSend(v25, "localizedStringWithFormat:", v24, v14, v19, v26);
      }
      else
      {
        id v24 = WFLocalizedString(@"Allow “%1$@” to load web content on “%2$@”?");
        id v26 = [v17 localizedTitle];
        objc_msgSend(v25, "localizedStringWithFormat:", v24, v14, v26, v30);
      char v27 = };

      goto LABEL_16;
    }
LABEL_11:
    char v27 = [v18 smartPromptWithContentDescription:v19 contentDestination:v20 workflowName:v14];
    goto LABEL_17;
  }
  id v23 = NSString;
  if (v19)
  {
    id v24 = WFLocalizedString(@"Allow “%1$@” to access %2$@ while loading web content?");
    objc_msgSend(v23, "localizedStringWithFormat:", v24, v14, v19);
  }
  else
  {
    id v24 = WFLocalizedString(@"Allow “%1$@” to load web content?");
    objc_msgSend(v23, "localizedStringWithFormat:", v24, v14, v29);
  char v27 = };
LABEL_16:

LABEL_17:
  return v27;
}

@end