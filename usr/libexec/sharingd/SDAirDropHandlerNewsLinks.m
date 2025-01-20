@interface SDAirDropHandlerNewsLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerNewsLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerNewsLinks

- (SDAirDropHandlerNewsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerNewsLinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.news"];
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
  if (![(SDAirDropHandler *)self isJustLinks]
    || ![(SDAirDropHandler *)self handlingAppInstalled])
  {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 completedURLs];

  v5 = (char *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!SFIsNewsLink())
        {
          BOOL v9 = 0;
          goto LABEL_14;
        }
      }
      v6 = (char *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerNewsLinks;
  return [(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x10000000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  objc_super v4 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906D10];
  v5 = SFLocalizedStringForKey();
  v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);

  return v6;
}

@end