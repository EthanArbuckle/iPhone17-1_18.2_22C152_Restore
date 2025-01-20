@interface SDAirDropHandlerPlaygroundItems
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerPlaygroundItems)initWithTransfer:(id)a3;
- (id)defaultOpenActionBundleID;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerPlaygroundItems

- (SDAirDropHandlerPlaygroundItems)initWithTransfer:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SDAirDropHandlerPlaygroundItems;
  v3 = [(SDAirDropHandlerGenericFiles *)&v8 initWithTransfer:a3];
  if (v3 && SFPlaygroundsAppAvailable())
  {
    v4 = +[LSBundleProxy bundleProxyForIdentifier:@"com.apple.Playgrounds"];
    [(SDAirDropHandler *)v3 setBundleProxy:v4];

    v5 = [(SDAirDropHandler *)v3 bundleProxy];
    v9 = v5;
    v6 = +[NSArray arrayWithObjects:&v9 count:1];
    [(SDAirDropHandlerGenericFiles *)v3 setAvailableApplications:v6];
  }
  return v3;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 metaData];
  v5 = [v4 rawFiles];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:v9];
        v12 = [v11 pathExtension];

        LODWORD(v11) = SFIsPlaygroundItem();
        if (!v11)
        {
          BOOL v13 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerPlaygroundItems;
  return (unint64_t)[(SDAirDropHandlerGenericFiles *)&v3 transferTypes] | 0x10000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v12 = @"PLAYGROUND";
  v5 = +[NSNumber numberWithUnsignedInteger:v4];
  BOOL v13 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v14 = v6;
  id v7 = +[NSArray arrayWithObjects:&v14 count:1];
  uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  uint64_t v9 = SFLocalizedStringForKey();
  v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);

  return v10;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end