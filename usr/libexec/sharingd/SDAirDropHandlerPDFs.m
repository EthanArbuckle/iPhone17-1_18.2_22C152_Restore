@interface SDAirDropHandlerPDFs
- (BOOL)canHandleTransfer;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerPDFs

- (BOOL)canHandleTransfer
{
  v18.receiver = self;
  v18.super_class = (Class)SDAirDropHandlerPDFs;
  if (![(SDAirDropHandlerGenericFiles *)&v18 canHandleTransfer]) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 metaData];
  v5 = [v4 items];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) type];
        int v11 = SFIsPDF();

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerPDFs;
  return (unint64_t)[(SDAirDropHandlerGenericFiles *)&v3 transferTypes] | 0x4000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  if (v4 < 2)
  {
    v14.receiver = self;
    v14.super_class = (Class)SDAirDropHandlerPDFs;
    int v11 = [(SDAirDropHandlerGenericFiles *)&v14 suitableContentsDescription];
  }
  else
  {
    unint64_t v5 = v4;
    CFStringRef v15 = @"PDF";
    id v6 = +[NSNumber numberWithUnsignedInteger:v4];
    long long v16 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    long long v17 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v17 count:1];
    v9 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v8];

    LODWORD(v7) = [(SDAirDropHandler *)self isModernProgress];
    v10 = SFLocalizedStringForKey();
    if (v7) {
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5, v13);
    }
    else {
    int v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v3, v5);
    }
  }

  return v11;
}

@end