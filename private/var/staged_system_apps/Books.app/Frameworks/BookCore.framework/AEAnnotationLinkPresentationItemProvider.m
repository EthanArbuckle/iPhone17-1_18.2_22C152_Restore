@interface AEAnnotationLinkPresentationItemProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation AEAnnotationLinkPresentationItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  v6 = AESharingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "%@ returning LPMetadat.URL for activity:%@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [(AEAnnotationActivityItemProviderSource *)self _generateLinkMetadata];
  v10 = [v9 URL];

  return v10;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

@end