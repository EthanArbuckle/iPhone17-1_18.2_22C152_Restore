@interface SDAirDropHandleriTunesULinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriTunesULinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriTunesULinks

- (SDAirDropHandleriTunesULinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandleriTunesULinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.itunesu"];
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

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  v3 = [(SDAirDropHandleriTunesULinks *)self candidateIdentifiers];
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

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriTunesULinks;
  return [(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x800000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  objc_super v4 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906FB0];
  v5 = SFLocalizedStringForKey();
  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);

  return v6;
}

@end