@interface SDAirDropHandleriLifeLinks
- (BOOL)canHandleTransfer;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriLifeLinks

- (BOOL)canHandleTransfer
{
  BOOL v3 = [(SDAirDropHandler *)self isJustLinks];
  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = [(SDAirDropHandler *)self transfer];
    v5 = [v4 completedURLs];

    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      BOOL v9 = 1;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = [(SDAirDropHandler *)self bundleProxyFromCandidateIdentifiers:&off_100906D40 handlesURL:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          v12 = v11;
          if (v11 == 0 || !v9)
          {

            LOBYTE(v3) = 0;
            return v3;
          }
          v13 = [(SDAirDropHandler *)self bundleProxy];

          if (v13)
          {
            v14 = [(SDAirDropHandler *)self bundleProxy];
            unsigned int v15 = [v14 isEqual:v12];
          }
          else
          {
            [(SDAirDropHandler *)self setBundleProxy:v12];
            unsigned int v15 = 1;
          }

          BOOL v9 = v15 != 0;
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      unsigned int v15 = 1;
    }

    LOBYTE(v3) = v15 != 0;
  }
  return v3;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriLifeLinks;
  return [(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x2000000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v14 = @"ILIFE_ITEM";
  v5 = +[NSNumber numberWithUnsignedInteger:v4];
  unsigned int v15 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v16 = v6;
  id v7 = +[NSArray arrayWithObjects:&v16 count:1];
  uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  BOOL v9 = SFLocalizedStringForKey();
  v10 = [(SDAirDropHandler *)self bundleProxy];
  v11 = [v10 localizedName];
  v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4, v11);

  return v12;
}

@end