@interface CSSearchableItemAttributeSet(Shortcuts)
- (BOOL)wf_associateWithBundleIdentifier:()Shortcuts;
@end

@implementation CSSearchableItemAttributeSet(Shortcuts)

- (BOOL)wf_associateWithBundleIdentifier:()Shortcuts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"WFContextualAction+Spotlight.m", 28, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v18 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v18];
  id v7 = v18;
  if (v6)
  {
    v8 = [v6 bundleIdentifier];
    [a1 setRelatedAppBundleIdentifier:v8];

    uint64_t v9 = [a1 alternateNames];
    v10 = v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v12 = [v6 localizedName];
    v19[0] = v12;
    v13 = [v6 localizedShortName];
    v19[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v15 = [v11 arrayByAddingObjectsFromArray:v14];
    [a1 setAlternateNames:v15];
  }
  else
  {
    v10 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSearchableItemAttributeSet(Shortcuts) wf_associateWithBundleIdentifier:]";
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_ERROR, "%s Can't associate spotlight item with app: %@", buf, 0x16u);
    }
  }

  return v6 != 0;
}

@end