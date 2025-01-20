@interface VCSleepDonationAction
+ (id)identifierForShortcut:(id)a3;
+ (id)sleepActionsDictionaryForShortcuts:(id)a3;
+ (id)sleepActionsDictionaryForShortcutsByApp:(id)a3;
+ (id)sleepActionsForShortcuts:(id)a3 bundleIdentifier:(id)a4;
- (VCSleepDonationAction)initWithShortcut:(id)a3;
- (VCSleepDonationAction)initWithShortcut:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation VCSleepDonationAction

+ (id)sleepActionsDictionaryForShortcutsByApp:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v4 objectForKeyedSubscript:v11];
        v13 = [a1 sleepActionsForShortcuts:v12 bundleIdentifier:v11];

        [v5 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)sleepActionsDictionaryForShortcuts:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v19 = v4;
  v6 = [a1 sleepActionsForShortcuts:v4 bundleIdentifier:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 sourceAppBundleIdentifier];
        v13 = [v5 objectForKey:v12];
        v14 = v13;
        if (v13) {
          id v15 = v13;
        }
        else {
          id v15 = (id)objc_opt_new();
        }
        long long v16 = v15;

        [v16 addObject:v11];
        long long v17 = [v11 sourceAppBundleIdentifier];
        [v5 setObject:v16 forKey:v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)sleepActionsForShortcuts:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__VCSleepDonationAction_INShortcut__sleepActionsForShortcuts_bundleIdentifier___block_invoke;
  v11[3] = &unk_1E6078998;
  id v12 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a3, "if_compactMap:", v11);
  uint64_t v8 = v7;
  if (!v7) {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v7;

  return v9;
}

VCSleepDonationAction *__79__VCSleepDonationAction_INShortcut__sleepActionsForShortcuts_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[VCSleepDonationAction alloc] initWithShortcut:v3 bundleIdentifier:*(void *)(a1 + 32)];

  return v4;
}

- (VCSleepDonationAction)initWithShortcut:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"VCSleepDonationAction.m", 27, @"Invalid parameter not satisfying: %@", @"shortcut" object file lineNumber description];
  }
  id v9 = [v7 intent];
  v10 = [v9 suggestedInvocationPhrase];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [v7 userActivity];
    v14 = [v13 suggestedInvocationPhrase];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v7 _title];
    }
    id v12 = v16;
  }
  if (v8)
  {
    id v17 = v8;
  }
  else
  {
    id v17 = [v7 _associatedAppBundleIdentifier];
  }
  long long v18 = v17;
  v19 = 0;
  if ([v17 length] && v12)
  {
    long long v20 = objc_opt_new();
    long long v21 = [v7 intent];

    if (v21)
    {
      long long v22 = (void *)MEMORY[0x1E4F28DB0];
      long long v23 = [v7 intent];
      id v40 = 0;
      v24 = [v22 archivedDataWithRootObject:v23 requiringSecureCoding:1 error:&v40];
      id v25 = v40;

      if ([v24 length])
      {
        [v20 setValue:v24 forKey:@"IntentData"];
        [v20 setObject:MEMORY[0x1E4F1CC28] forKey:@"ForceExecutionOnPhone"];

        v26 = @"is.workflow.actions.sirikit.donation.handle";
LABEL_20:
        v30 = +[VCSleepDonationAction identifierForShortcut:v7];
        v31 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v18 allowPlaceholder:1 error:0];
        v32 = [v31 localizedName];

        v39.receiver = self;
        v39.super_class = (Class)VCSleepDonationAction;
        v33 = -[VCSleepAction initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:](&v39, sel_initWithIdentifier_workflowActionIdentifier_sourceAppBundleIdentifier_bundleIdentifierForDisplay_title_subtitle_serializedParameters_shortcutAvailability_, v30, v26, v18, v18, v12, v32, v20, objc_msgSend(v7, "wf_shortcutAvailability"));
        self = v33;
        if (v33) {
          v34 = v33;
        }

        v19 = self;
        goto LABEL_27;
      }
      v35 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = [v25 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v42 = "-[VCSleepDonationAction initWithShortcut:bundleIdentifier:]";
        __int16 v43 = 2114;
        v44 = v36;
        _os_log_impl(&dword_1B3C5C000, v35, OS_LOG_TYPE_ERROR, "%s Could not create intent data from intent with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v19 = [v7 userActivity];

      if (!v19)
      {
LABEL_27:

        goto LABEL_28;
      }
      id v25 = [v7 activityData];
      if ([v25 length])
      {
        [v20 setValue:v25 forKey:@"UserActivityData"];
        v27 = [v7 activityImage];
        v28 = [v27 _imageData];
        [v20 setValue:v28 forKey:@"UserActivityImageData"];

        v29 = [v7 activitySubtitle];
        [v20 setValue:v29 forKey:@"UserActivitySubtitle"];

        [v20 setValue:v18 forKey:@"AppBundleIdentifier"];
        v26 = @"is.workflow.actions.useractivity.open";
        goto LABEL_20;
      }
    }

    v19 = 0;
    goto LABEL_27;
  }
LABEL_28:

  return v19;
}

- (VCSleepDonationAction)initWithShortcut:(id)a3
{
  return [(VCSleepDonationAction *)self initWithShortcut:a3 bundleIdentifier:0];
}

+ (id)identifierForShortcut:(id)a3
{
  id v3 = a3;
  id v4 = [v3 intent];

  if (v4)
  {
    id v5 = [v3 intent];
    id v6 = [v5 _JSONDictionaryRepresentation];

    id v7 = objc_alloc_init(MEMORY[0x1E4F70C20]);
    id v8 = (id)[v7 combine:@"is.workflow.actions.sirikit.donation.handle"];
    id v9 = (id)[v7 combineContentsOfPropertyListObject:v6];
    uint64_t v10 = [v7 finalize];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%2llX", v10);
  }
  else
  {
    id v12 = [v3 userActivity];

    if (v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F70C20]);
      id v14 = (id)[v13 combine:@"is.workflow.actions.useractivity.open"];
      id v15 = [v3 userActivity];
      id v16 = [v15 activityType];
      id v17 = (id)[v13 combine:v16];

      long long v18 = [v3 userActivity];
      v19 = [v18 title];

      if (v19)
      {
        long long v20 = [v3 userActivity];
        long long v21 = [v20 title];
        id v22 = (id)[v13 combine:v21];
      }
      long long v23 = [v3 activityBundleIdentifier];

      if (v23)
      {
        v24 = [v3 activityBundleIdentifier];
        id v25 = (id)[v13 combine:v24];
      }
      v26 = objc_opt_new();
      v27 = [v3 userActivity];
      v28 = [v27 requiredUserInfoKeys];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __47__VCSleepDonationAction_identifierForShortcut___block_invoke;
      v33[3] = &unk_1E60797A8;
      id v34 = v3;
      id v35 = v26;
      id v29 = v26;
      [v28 enumerateObjectsUsingBlock:v33];

      id v30 = (id)[v13 combineContentsOfPropertyListObject:v29];
      uint64_t v31 = [v13 finalize];
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%2llX", v31);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

void __47__VCSleepDonationAction_identifierForShortcut___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [*(id *)(a1 + 32) userActivity];
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:v17];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v10 = v7;

    uint64_t v11 = *(void **)(a1 + 40);
    id v12 = [v10 absoluteString];

    if (v12)
    {
      [v11 setObject:v12 forKey:v17];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CA98] null];
      [v11 setObject:v13 forKey:v17];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
      }
      else
      {
        id v9 = 0;
      }
      id v14 = v9;

      id v15 = *(void **)(a1 + 40);
      id v16 = [v14 allObjects];

      [v15 setObject:v16 forKey:v17];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:v5 forKey:v17];
    }
  }
}

@end