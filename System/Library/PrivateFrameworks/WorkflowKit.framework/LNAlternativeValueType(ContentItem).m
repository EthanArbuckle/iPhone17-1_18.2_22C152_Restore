@interface LNAlternativeValueType(ContentItem)
- (id)teamIdentifierForBundleIdentifier:()ContentItem;
- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:;
- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem;
- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
@end

@implementation LNAlternativeValueType(ContentItem)

- (id)teamIdentifierForBundleIdentifier:()ContentItem
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F223C8];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

    v6 = [v5 teamIdentifier];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v8 = 136315650;
    v9 = "-[LNAlternativeValueType(ContentItem) wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:]";
    __int16 v10 = 2112;
    uint64_t v11 = a1;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s -[%@ %@] should not be reachable; there is no such thing as an LNAlternativeValue.",
      (uint8_t *)&v8,
      0x20u);
  }
  v6 = objc_opt_new();
  return v6;
}

- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem
{
  id v4 = a3;
  v5 = [a1 memberValueTypes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__LNAlternativeValueType_ContentItem__wf_contentItemClassesWithAppBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6558650;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "if_flatMap:", v9);

  return v7;
}

- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v7 = 136315650;
    int v8 = "-[LNAlternativeValueType(ContentItem) wf_contentItemClassWithAppBundleIdentifier:]";
    __int16 v9 = 2112;
    uint64_t v10 = a1;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s -[%@ %@] should not be called; use wf_contentItemClasses...",
      (uint8_t *)&v7,
      0x20u);
  }
  return 0;
}

@end