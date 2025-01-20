@interface LNArrayValueType(ContentItem)
- (id)teamIdentifierForBundleIdentifier:()ContentItem;
- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:;
- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem;
@end

@implementation LNArrayValueType(ContentItem)

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
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 value];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = v8;
  }
  v14 = [a1 teamIdentifierForBundleIdentifier:v13];
  v15 = (void *)MEMORY[0x1E4F5A830];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __113__LNArrayValueType_ContentItem__wf_contentCollectionFromLinkValue_appBundleIdentifier_displayedBundleIdentifier___block_invoke;
  v23[3] = &unk_1E654F048;
  id v24 = v8;
  id v25 = v9;
  id v26 = v14;
  id v16 = v14;
  id v17 = v9;
  id v18 = v8;
  v19 = objc_msgSend(v12, "if_compactMap:", v23);

  if (v19) {
    v20 = v19;
  }
  else {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v21 = [v15 collectionWithItems:v20];

  return v21;
}

- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem
{
  id v4 = a3;
  v5 = [a1 memberValueType];
  v6 = objc_msgSend(v5, "wf_contentItemClassesWithAppBundleIdentifier:", v4);

  return v6;
}

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  id v4 = a3;
  v5 = [a1 memberValueType];
  v6 = objc_msgSend(v5, "wf_contentItemClassWithAppBundleIdentifier:", v4);

  return v6;
}

@end