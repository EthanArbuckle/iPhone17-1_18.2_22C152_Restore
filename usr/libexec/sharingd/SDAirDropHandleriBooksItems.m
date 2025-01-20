@interface SDAirDropHandleriBooksItems
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriBooksItems)initWithTransfer:(id)a3;
- (id)defaultOpenActionBundleID;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriBooksItems

- (SDAirDropHandleriBooksItems)initWithTransfer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandleriBooksItems;
  v3 = [(SDAirDropHandlerGenericFiles *)&v9 initWithTransfer:a3 bundleIdentifier:@"com.apple.iBooks"];
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
  unsigned int v3 = [(SDAirDropHandler *)self isJustFiles];
  v4 = [(SDAirDropHandler *)self transfer];
  v5 = [v4 metaData];
  v6 = [v5 items];
  id v7 = [v6 count];

  char v8 = 0;
  int v9 = 1;
  if (v3 && (unint64_t)v7 >= 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = [(SDAirDropHandler *)self transfer];
    v11 = [v10 metaData];
    v12 = [v11 items];

    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v18 = [v17 type];
          v9 &= SFIsePub();

          v19 = [v17 type];
          if (SFIsPDF())
          {
          }
          else
          {
            v20 = [v17 type];
            int v21 = SFIsePub();

            if (!v21)
            {
              char v8 = 0;
              goto LABEL_15;
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    char v8 = 1;
LABEL_15:
  }
  return v8 & (v9 ^ 1);
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriBooksItems;
  return (unint64_t)[(SDAirDropHandlerGenericFiles *)&v3 transferTypes] | 0x24000;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end