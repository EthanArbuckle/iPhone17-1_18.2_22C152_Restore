@interface AEAnnotationTextActivityItemProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)supportedActivityTypes;
- (id)textForActivityType:(id)a3;
@end

@implementation AEAnnotationTextActivityItemProvider

- (id)supportedActivityTypes
{
  v4[0] = UIActivityTypeMessage;
  v4[1] = @"com.apple.share.Messages.window";
  v4[2] = UIActivityTypeCopyToPasteboard;
  v4[3] = UIActivityTypeSaveToNotes;
  v4[4] = @"com.apple.Notes.SharingExtension";
  v4[5] = UIActivityTypeCreateReminder;
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([(AEAssetActivityItemProviderSource *)self supportsActivityType:v5])
  {
    if ([v5 isEqualToString:UIActivityTypeCopyToPasteboard]
      || ([v5 isEqualToString:UIActivityTypeCreateReminder] & 1) != 0
      || ([v5 isEqualToString:UIActivityTypeSaveToNotes] & 1) != 0
      || [v5 isEqualToString:@"com.apple.Notes.SharingExtension"])
    {
      v6 = [(AEAnnotationTextActivityItemProvider *)self textForActivityType:v5];
      goto LABEL_10;
    }
    v11 = [(AEAnnotationActivityItemProviderSource *)self annotations];
    v12 = [v11 objectAtIndexedSubscript:0];

    v13 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
    if (![v13 isStoreAsset]
      || ([v12 annotationHasNote] & 1) != 0)
    {

LABEL_16:
      v6 = [(AEAnnotationTextActivityItemProvider *)self textForActivityType:v5];
LABEL_17:

      goto LABEL_10;
    }
    if ([v5 isEqualToString:UIActivityTypeMessage])
    {
    }
    else
    {
      unsigned __int8 v14 = [v5 isEqualToString:@"com.apple.share.Messages.window"];

      if ((v14 & 1) == 0) {
        goto LABEL_16;
      }
    }
    v15 = [(AEAnnotationActivityItemProviderSource *)self _generateLinkMetadata];
    v6 = [v15 URL];

    goto LABEL_17;
  }
  v7 = AESharingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v16 = 138412546;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "%@ returning nil for activity:%@", (uint8_t *)&v16, 0x16u);
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)textForActivityType:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotationActivityItemProviderSource *)self text];
  if ((unint64_t)[v5 tokenCountWithEnumerationOptions:3 maxTokenCount:-1 outLimitLength:0] >= 4)
  {
    v6 = [v5 stringByEnclosingInQuotes];
    v7 = [(AEAnnotationActivityItemProviderSource *)self annotations];
    v8 = [v7 firstObject];

    v42 = v8;
    v43 = [v8 annotationNote];
    if ([v43 length])
    {
      uint64_t v9 = [v6 stringByAppendingFormat:@"\n\n%@", v43];

      v6 = (void *)v9;
    }
    v10 = IMCommonCoreBundle();
    v11 = [v10 localizedStringForKey:@"Excerpt From" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    v12 = IMCommonCoreBundle();
    v13 = [v12 localizedStringForKey:@"This material may be protected by copyright." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    if ([v4 isEqualToString:UIActivityTypeCopyToPasteboard])
    {
      v39 = v11;
      unsigned __int8 v14 = +[NSString string];
      v15 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      int v16 = [v15 title];

      if ([v16 length])
      {
        uint64_t v17 = [v14 stringByAppendingFormat:@"\n%@", v16];

        unsigned __int8 v14 = (void *)v17;
      }
      __int16 v18 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      id v19 = [v18 author];

      if ([v19 length])
      {
        uint64_t v20 = [v14 stringByAppendingFormat:@"\n%@", v19];

        unsigned __int8 v14 = (void *)v20;
      }
      v21 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      v22 = [v21 storeURLPreferShort];

      v41 = v19;
      if (v22)
      {
        v23 = [v22 absoluteString];
        [v14 stringByAppendingFormat:@"\n%@", v23];
        v24 = v13;
        v25 = v6;
        v27 = id v26 = v4;

        unsigned __int8 v14 = (void *)v27;
        id v4 = v26;
        v6 = v25;
        v13 = v24;
      }
      v11 = v39;
      uint64_t v28 = +[NSString stringWithFormat:@"%@\n\n%@%@\n%@", v6, v39, v14, v13];
    }
    else
    {
      unsigned __int8 v14 = [(AEAssetActivityItemProviderSource *)self citation];
      v22 = +[NSString stringWithFormat:@"%@\n\n%@: %@\n%@", v6, v11, v14, v13];

      int v16 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      if (![v16 isStoreAsset]) {
        goto LABEL_22;
      }
      v40 = v13;
      unsigned __int8 v29 = [v4 isEqualToString:@"com.apple.share.Messages.window"];

      if (v29)
      {
        v13 = v40;
LABEL_23:

        id v5 = v22;
        goto LABEL_24;
      }
      v30 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      v31 = [v30 storeURLPreferShort];
      int v16 = [v31 absoluteString];

      if (!v16)
      {
        v13 = v40;
        goto LABEL_22;
      }
      v32 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
      v33 = (char *)[v32 assetType];

      v34 = IMCommonCoreBundle();
      v35 = v34;
      if (v33 == (unsigned char *)&dword_4 + 2) {
        CFStringRef v36 = @"Check out this audiobook on Apple Books:";
      }
      else {
        CFStringRef v36 = @"Check out this book on Apple Books:";
      }
      uint64_t v37 = [v34 localizedStringForKey:v36 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

      v41 = (void *)v37;
      uint64_t v28 = [v22 stringByAppendingFormat:@"\n\n%@ %@", v37, v16];
      v13 = v40;
    }

    v22 = (void *)v28;
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

  return v5;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v5 = [(AEAnnotationActivityItemProviderSource *)self _generateLinkMetadata];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end