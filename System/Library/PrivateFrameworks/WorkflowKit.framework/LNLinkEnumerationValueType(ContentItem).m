@interface LNLinkEnumerationValueType(ContentItem)
- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:;
- (uint64_t)wf_objectClass;
@end

@implementation LNLinkEnumerationValueType(ContentItem)

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[WFLinkActionProvider sharedProvider];
  v12 = [a1 enumerationIdentifier];
  v13 = [v11 enumMetadataByAppBundleIdentifier:v8 enumIdentifier:v12];

  v14 = [v10 value];

  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = [v13 cases];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __132__LNLinkEnumerationValueType_ContentItem__wf_contentItemFromLinkValue_appBundleIdentifier_displayedBundleIdentifier_teamIdentifier___block_invoke;
    v30[3] = &unk_1E65581D0;
    id v16 = v14;
    id v31 = v16;
    v17 = objc_msgSend(v15, "if_firstObjectPassingTest:", v30);

    if (v17)
    {
      v18 = [WFLinkEnumerationCase alloc];
      v19 = [v17 identifier];
      v20 = [(WFLinkEnumerationCase *)v18 initWithIdentifier:v19];

      v21 = (void *)MEMORY[0x1E4F5A788];
      id v22 = objc_alloc(MEMORY[0x1E4F302A8]);
      if (v9) {
        id v23 = v9;
      }
      else {
        id v23 = v8;
      }
      v24 = (void *)[v22 initWithBundleIdentifier:v23];
      v25 = [v21 locationWithAppDescriptor:v24];

      v26 = objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:", v8);
      v27 = [MEMORY[0x1E4F5A850] configurationWithOrigin:v25 disclosureLevel:1];
      v28 = [v26 itemWithObject:v20 privacyConfiguration:v27];
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {

    v28 = 0;
  }

  return v28;
}

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  id v4 = a3;
  v5 = +[WFLinkActionProvider sharedProvider];
  v6 = [a1 enumerationIdentifier];
  v7 = [v5 enumMetadataByAppBundleIdentifier:v4 enumIdentifier:v6];

  id v8 = objc_msgSend(v7, "wf_contentItemClassWithAppBundleIdentifier:", v4);

  return v8;
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end