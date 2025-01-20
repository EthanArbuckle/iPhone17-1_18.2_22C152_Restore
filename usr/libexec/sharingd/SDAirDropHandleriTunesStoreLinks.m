@interface SDAirDropHandleriTunesStoreLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriTunesStoreLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)singleItemActionTitle;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriTunesStoreLinks

- (SDAirDropHandleriTunesStoreLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandleriTunesStoreLinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.MobileStore"];
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
  [v3 addObject:@"com.apple.Music"];

  return v3;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  v3 = [(SDAirDropHandleriTunesStoreLinks *)self candidateIdentifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = [(SDAirDropHandler *)self transfer];
  v5 = [v4 completedURLs];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(SDAirDropHandler *)self bundleProxyFromCandidateIdentifiers:v3 handlesURL:*(void *)(*((void *)&v13 + 1) + 8 * i)];

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (id)singleItemActionTitle
{
  return (id)SFLocalizedStringForKey();
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriTunesStoreLinks;
  return [(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x1000000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  objc_super v4 = [(SDAirDropHandler *)self transfer];
  v5 = [v4 metaData];
  id v6 = [v5 itemsDescriptionAdvanced];

  id v7 = [(SDAirDropHandler *)self transfer];
  uint64_t v8 = v7;
  if (v6)
  {
    v9 = [v7 metaData];
    v10 = [v9 itemsDescriptionAdvanced];
    BOOL v11 = [v10 objectForKeyedSubscript:@"SFAirDropActivitySubjectiTunesStoreLinkType"];
    v12 = (char *)[v11 integerValue];
  }
  else
  {
    v9 = [v7 completedURLs];
    v10 = [v9 firstObject];
    v12 = (char *)SFiTunesStoreLinkType();
  }

  if ((unint64_t)(v12 - 1) > 4) {
    long long v13 = &off_1009073E8;
  }
  else {
    long long v13 = off_1008D0E28[(void)(v12 - 1)];
  }
  long long v14 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v13];
  long long v15 = SFLocalizedStringForKey();
  long long v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v3);

  return v16;
}

@end