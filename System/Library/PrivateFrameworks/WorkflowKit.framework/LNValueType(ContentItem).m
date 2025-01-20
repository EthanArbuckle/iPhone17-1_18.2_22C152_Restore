@interface LNValueType(ContentItem)
- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:;
- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem;
- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:;
- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
@end

@implementation LNValueType(ContentItem)

- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:");
  if (v1)
  {
    v4[0] = v1;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:
{
  v5 = objc_msgSend(a1, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", a3, a4, a5, 0);
  v6 = (void *)MEMORY[0x1E4F5A830];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "if_arrayWithObjectIfNonNil:", v5);
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  v10 = [v6 collectionWithItems:v9];

  return v10;
}

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (objc_class *)MEMORY[0x1E4F302A8];
  id v13 = a6;
  id v14 = a5;
  id v15 = [v12 alloc];
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = v11;
  }
  v17 = (void *)[v15 initWithLocalizedName:0 bundleIdentifier:v16 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:v13 supportedIntents:0 bundleURL:0 documentTypes:0];

  v18 = [v10 value];
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  v21 = [v20 managedAccountIdentifier];

  if ([v21 length]) {
    [MEMORY[0x1E4F5A760] locationWithAccountIdentifier:v21 appDescriptor:v17];
  }
  else {
  v22 = [MEMORY[0x1E4F5A788] locationWithAppDescriptor:v17];
  }
  v23 = objc_msgSend(a1, "wf_contentItemClassesWithAppBundleIdentifier:", v11);
  v24 = v23;
  if (!v23 || ![v23 count])
  {
    v25 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[LNValueType(ContentItem) wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:]";
      __int16 v36 = 2112;
      id v37 = v11;
      v26 = "%s Couldn't find a Link content item class for bundleIdentifier: %@";
      v27 = v25;
      uint32_t v28 = 22;
      goto LABEL_19;
    }
LABEL_20:

    v29 = 0;
    goto LABEL_21;
  }
  if ((unint64_t)[v24 count] >= 2)
  {
    v25 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[LNValueType(ContentItem) wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:]";
      __int16 v36 = 2112;
      id v37 = v24;
      __int16 v38 = 2112;
      id v39 = v11;
      v26 = "%s Can't handle ambiguous content item classes %@ for bundleIdentifier: %@";
      v27 = v25;
      uint32_t v28 = 32;
LABEL_19:
      _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, v26, buf, v28);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v31 = (void *)[v24 firstObject];
  v32 = [v10 value];
  v33 = [MEMORY[0x1E4F5A850] configurationWithOrigin:v22 disclosureLevel:1];
  v29 = [v31 itemWithObject:v32 privacyConfiguration:v33];

LABEL_21:
  return v29;
}

- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = NSStringFromSelector(a2);
    int v8 = 136315650;
    uint64_t v9 = "-[LNValueType(ContentItem) wf_contentItemClassWithAppBundleIdentifier:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_FAULT, "%s -[%@ %@] must be overridden", (uint8_t *)&v8, 0x20u);
  }
  return 0;
}

@end