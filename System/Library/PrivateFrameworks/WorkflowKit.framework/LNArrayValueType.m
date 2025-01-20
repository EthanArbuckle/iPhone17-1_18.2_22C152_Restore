@interface LNArrayValueType
@end

@implementation LNArrayValueType

id __113__LNArrayValueType_ContentItem__wf_contentCollectionFromLinkValue_appBundleIdentifier_displayedBundleIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 valueType];
  v5 = objc_msgSend(v4, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v3, a1[4], a1[5], a1[6]);

  return v5;
}

@end