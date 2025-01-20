@interface SDAirDropHandlerAppStoreLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerAppStoreLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)singleItemActionTitle;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerAppStoreLinks

- (SDAirDropHandlerAppStoreLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerAppStoreLinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.AppStore"];
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
  [v3 addObject:@"com.apple.TVAppStore"];

  return v3;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  v3 = [(SDAirDropHandlerAppStoreLinks *)self candidateIdentifiers];
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
  v3.super_class = (Class)SDAirDropHandlerAppStoreLinks;
  return [(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | (unint64_t)&_mh_execute_header;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  objc_super v4 = [(SDAirDropHandler *)self transfer];
  v5 = [v4 metaData];
  id v6 = [v5 itemsDescription];
  if ([v6 length])
  {
    id v7 = [(SDAirDropHandler *)self transfer];
    uint64_t v8 = [v7 metaData];
    v9 = [v8 itemsDescription];
  }
  else
  {
    v9 = 0;
  }

  if (v9) {
    v10 = &off_100906FE0;
  }
  else {
    v10 = &off_100906FF8;
  }
  BOOL v11 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v10];
  unsigned int v12 = [(SDAirDropHandler *)self isModernProgress];
  long long v13 = SFLocalizedStringForKey();
  if (v12) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v9, v16);
  }
  else {
  long long v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v3, v9);
  }

  return v14;
}

@end