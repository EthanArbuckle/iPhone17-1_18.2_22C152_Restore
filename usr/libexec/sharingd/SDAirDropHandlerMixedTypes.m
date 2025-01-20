@interface SDAirDropHandlerMixedTypes
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerMixedTypes)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)openLinks;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerMixedTypes

- (SDAirDropHandlerMixedTypes)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerMixedTypes;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3];
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerMixedTypes;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x5000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v12 = @"GENERIC_ITEM";
  v5 = +[NSNumber numberWithInteger:v4];
  v13 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v14 = v6;
  v7 = +[NSArray arrayWithObjects:&v14 count:1];
  v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  v9 = SFLocalizedStringForKey();
  v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);

  return v10;
}

- (void)updatePossibleActions
{
  v19.receiver = self;
  v19.super_class = (Class)SDAirDropHandlerMixedTypes;
  [(SDAirDropHandler *)&v19 updatePossibleActions];
  objc_super v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  id v5 = objc_alloc((Class)SFAirDropAction);
  v6 = [(SDAirDropHandler *)self transfer];
  v7 = [v6 identifier];
  v8 = SFLocalizedStringForKey();
  v9 = [(SDAirDropHandler *)self singleItemActionTitle];
  id v10 = [v5 initWithTransferIdentifier:v7 actionIdentifier:v4 title:v8 singleItemTitle:v9 type:1];

  id location = 0;
  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1001FF750;
  v16 = &unk_1008CA128;
  objc_copyWeak(&v17, &location);
  [v10 setActionHandler:&v13];
  id v20 = v10;
  v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v13, v14, v15, v16);
  CFStringRef v12 = [(SDAirDropHandler *)self transfer];
  [v12 setPossibleActions:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)openLinks
{
  objc_super v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v4 = [(SDAirDropHandler *)self transfer];
  id v5 = [v4 completedURLs];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 isFileURL] & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(SDAirDropHandler *)self openURLs:v3];
}

@end