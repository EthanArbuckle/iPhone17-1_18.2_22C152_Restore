@interface SDAirDropHandlerContacts
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerContacts)initWithTransfer:(id)a3;
- (id)defaultOpenActionBundleID;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerContacts

- (SDAirDropHandlerContacts)initWithTransfer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandlerContacts;
  v3 = [(SDAirDropHandlerGenericFiles *)&v9 initWithTransfer:a3 bundleIdentifier:@"com.apple.MobileAddressBook"];
  v4 = v3;
  if (v3)
  {
    v5 = [(SDAirDropHandler *)v3 bundleProxy];

    if (v5)
    {
      v6 = [(SDAirDropHandler *)v4 bundleProxy];
      v10 = v6;
      v7 = +[NSArray arrayWithObjects:&v10 count:1];
      [(SDAirDropHandlerGenericFiles *)v4 setAvailableApplications:v7];
    }
  }
  return v4;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 metaData];
  v5 = [v4 rawFiles];
  id v6 = [v5 count];

  if (!v6) {
    return 1;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = [(SDAirDropHandler *)self transfer];
  v8 = [v7 metaData];
  objc_super v9 = [v8 rawFiles];

  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    uint64_t v13 = kSFOperationFileTypeKey;
    uint64_t v14 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v17 = [v16 objectForKeyedSubscript:v13];
        v18 = [v16 objectForKeyedSubscript:v14];
        v19 = [v18 pathExtension];

        LODWORD(v18) = SFIsContact();
        if (!v18)
        {
          BOOL v20 = 0;
          goto LABEL_14;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerContacts;
  return (unint64_t)[(SDAirDropHandlerGenericFiles *)&v3 transferTypes] | 0x80;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v13 = @"CONTACT";
  v5 = +[NSNumber numberWithUnsignedInteger:v4];
  uint64_t v14 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v15 = v6;
  v7 = +[NSArray arrayWithObjects:&v15 count:1];
  v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  LODWORD(v6) = [(SDAirDropHandler *)self isModernProgress];
  objc_super v9 = SFLocalizedStringForKey();
  if (v6) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4, v12);
  }
  else {
  id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);
  }

  return v10;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end