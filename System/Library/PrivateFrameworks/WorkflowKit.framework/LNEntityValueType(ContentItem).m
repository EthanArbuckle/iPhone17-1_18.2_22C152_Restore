@interface LNEntityValueType(ContentItem)
- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:;
@end

@implementation LNEntityValueType(ContentItem)

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  id v4 = a3;
  v5 = +[WFLinkActionProvider sharedProvider];
  v6 = [a1 identifier];
  v7 = [v5 entityMetadataByAppBundleIdentifier:v4 entityIdentifier:v6];

  v8 = +[WFLinkActionProvider sharedProvider];
  v9 = [a1 identifier];
  v10 = [v8 queryMetadataByAppBundleIdentifier:v4 entityIdentifier:v9];

  v11 = [v7 attributionBundleIdentifier];
  v12 = [v7 shortcutsActionMetadata];

  if (v12)
  {
    v13 = [v7 shortcutsActionMetadata];
    uint64_t v14 = [v13 attributionBundleIdentifierWithDefaultValue:v11];

    v11 = (void *)v14;
  }
  id v15 = (id)objc_msgSend(v7, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v10, v4, v11);

  return v15;
}

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  v15.receiver = a1;
  v15.super_class = (Class)&off_1F2380F10;
  id v9 = a3;
  v10 = objc_msgSendSuper2(&v15, sel_wf_contentItemFromLinkValue_appBundleIdentifier_displayedBundleIdentifier_teamIdentifier_, v9, a4, a5, a6);
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
  v13 = objc_msgSend(v9, "displayRepresentation", v15.receiver, v15.super_class);

  [v12 setDisplayRepresentation:v13];
  return v10;
}

@end