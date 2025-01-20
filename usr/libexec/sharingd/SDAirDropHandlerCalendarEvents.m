@interface SDAirDropHandlerCalendarEvents
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerCalendarEvents)initWithTransfer:(id)a3;
- (id)importURLsWithError:(id *)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)triggerImport;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerCalendarEvents

- (SDAirDropHandlerCalendarEvents)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerCalendarEvents;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.mobilecal"];
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 metaData];
  v5 = [v4 items];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        int v11 = SFIsCalendarEvent();

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  v3.super_class = (Class)SDAirDropHandlerCalendarEvents;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x40;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v13 = @"CALENDAR";
  v5 = +[NSNumber numberWithUnsignedInteger:v4];
  long long v14 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  long long v15 = v6;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  LODWORD(v6) = [(SDAirDropHandler *)self isModernProgress];
  v9 = SFLocalizedStringForKey();
  if (v6) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4, v12);
  }
  else {
  v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);
  }

  return v10;
}

- (void)updatePossibleActions
{
  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerCalendarEvents;
  [(SDAirDropHandler *)&v13 updatePossibleActions];
  objc_super v3 = [(SDAirDropHandler *)self bundleProxy];
  unint64_t v4 = [(SDAirDropHandler *)self defaultActionForBundleProxy:v3];

  id location = 0;
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1000D5C38;
  v10 = &unk_1008CA128;
  objc_copyWeak(&v11, &location);
  [v4 setActionHandler:&v7];
  long long v14 = v4;
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v7, v8, v9, v10);
  id v6 = [(SDAirDropHandler *)self transfer];
  [v6 setPossibleActions:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)triggerImport
{
  id v11 = 0;
  objc_super v3 = [(SDAirDropHandlerCalendarEvents *)self importURLsWithError:&v11];
  id v4 = v11;
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v12 = v3;
    id v6 = +[NSArray arrayWithObjects:&v12 count:1];
    id v7 = [(SDAirDropHandler *)self bundleProxy];
    uint64_t v8 = [v7 bundleIdentifier];
    BOOL v9 = [(SDAirDropHandler *)self openURLs:v6 bundleIdentifier:v8];
  }
  v10 = [(SDAirDropHandler *)self completionHandler];
  v10[2](v10, v9, 0, 1);
}

- (id)importURLsWithError:(id *)a3
{
  off_100967340[0]();
  id v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v5 = [(SDAirDropHandler *)self transfer];
  id v6 = [v5 completedURLs];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    BOOL v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        objc_super v13 = v10;
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v24 = v10;
        long long v15 = +[NSData dataWithContentsOfURL:v14 options:0 error:&v24];
        id v10 = v24;

        if (v15)
        {
          long long v16 = [v4 defaultCalendarForNewEvents];
          long long v17 = [v4 importICSData:v15 intoCalendar:v16 options:0];

          v18 = airdrop_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v14;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calendar Events data was imported from %@", buf, 0xCu);
          }

          if (!v9)
          {
            v19 = [v17 firstObject];
            BOOL v9 = [v19 externalURL];
          }
        }
        else
        {
          long long v17 = airdrop_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "processCalendarEvents failed to load data for file: %@", buf, 0xCu);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    BOOL v9 = 0;
    id v10 = 0;
  }

  if (a3) {
    *a3 = v10;
  }
  id v20 = v9;

  return v20;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v11 = 0;
  id v6 = (void (**)(id, SDAirDropHandlerImportResult *, id))a4;
  id v7 = a3;
  id v8 = [(SDAirDropHandlerCalendarEvents *)self importURLsWithError:&v11];
  id v9 = v11;
  id v10 = objc_alloc_init(SDAirDropHandlerImportResult);
  [(SDAirDropHandlerImportResult *)v10 setImportedFiles:v7];

  [(SDAirDropHandlerImportResult *)v10 setOpenAppURL:v8];
  v6[2](v6, v10, v9);
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v10 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  id v7 = [(SDAirDropHandler *)self bundleProxy];
  id v8 = [v7 bundleIdentifier];
  BOOL v9 = [(SDAirDropHandler *)self openURLs:v6 bundleIdentifier:v8];

  v10[2](v10, v9, 0);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end