@interface SDAirDropHandlerSharediCloudDocumentsLinks
- (BOOL)canHandleTransfer;
- (BOOL)urlIsCloudDocument:(id)a3;
- (SDAirDropHandlerSharediCloudDocumentsLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerSharediCloudDocumentsLinks

- (SDAirDropHandlerSharediCloudDocumentsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerSharediCloudDocumentsLinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.CloudKit.ShareBear"];
}

- (id)candidateIdentifiers
{
  v3 = objc_opt_new();
  objc_super v4 = [(SDAirDropHandler *)self bundleProxy];

  if (v4)
  {
    v5 = [(SDAirDropHandler *)self bundleProxy];
    v6 = [v5 bundleIdentifier];
    [v3 addObject:v6];
  }

  return v3;
}

- (BOOL)urlIsCloudDocument:(id)a3
{
  id v21 = 0;
  objc_super v4 = +[LSAppLink appLinksWithURL:a3 limit:-1 error:&v21];
  id v5 = v21;
  v6 = v5;
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    v14 = [(SDAirDropHandlerSharediCloudDocumentsLinks *)self candidateIdentifiers];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) targetApplicationRecord:v17];
          v13 = [v12 bundleIdentifier];

          if (v13 && ([v14 containsObject:v13] & 1) != 0)
          {

            LOBYTE(v9) = 1;
            goto LABEL_20;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  else
  {
    v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to get app links with error %@", buf, 0xCu);
    }
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 completedURLs];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![(SDAirDropHandlerSharediCloudDocumentsLinks *)self urlIsCloudDocument:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerSharediCloudDocumentsLinks;
  return (unint64_t)[(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x40000000;
}

- (id)suitableContentsDescription
{
  v23 = [(SDAirDropHandler *)self senderName];
  unint64_t v3 = [(SDAirDropHandler *)self totalSharedItemsCount];
  objc_super v4 = [(SDAirDropHandler *)self transfer];
  id v5 = [v4 completedURLs];
  id v6 = [v5 firstObject];

  uint64_t v7 = SFSharediCloudDocumentsLinkToAppName();
  id v8 = [v7 lowercaseString];

  uint64_t v9 = SFSharediCloudDocumentsLinkToFileName();
  uint64_t v10 = (void *)v9;
  long long v11 = 0;
  if (v3 == 1 && v8 && v9)
  {
    if ([v8 isEqual:@"keynote"])
    {
      CFStringRef v12 = @"SHARED_KEYNOTE_DOCUMENT_LINK";
      goto LABEL_10;
    }
    if ([v8 isEqual:@"numbers"])
    {
      CFStringRef v12 = @"SHARED_NUMBERS_DOCUMENT_LINK";
      goto LABEL_10;
    }
    if ([v8 isEqual:@"pages"])
    {
      CFStringRef v12 = @"SHARED_PAGES_DOCUMENT_LINK";
LABEL_10:
      CFStringRef v27 = v12;
      v28 = &off_100902688;
      long long v13 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v29 = v13;
      long long v14 = +[NSArray arrayWithObjects:&v29 count:1];
      long long v11 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v14];

      v15 = SFLocalizedStringForKey();
      v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v23, v10);

      long long v17 = v11;
      if (v16) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    long long v11 = 0;
  }
LABEL_13:
  CFStringRef v24 = @"SHARED_ICLOUD_DOCUMENT_LINK";
  long long v18 = +[NSNumber numberWithUnsignedInteger:v3];
  v25 = v18;
  long long v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v26 = v19;
  long long v20 = +[NSArray arrayWithObjects:&v26 count:1];
  long long v17 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v20];

  id v21 = SFLocalizedStringForKey();
  v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v23, v3);

LABEL_14:

  return v16;
}

@end