@interface SDAirDropHandlerGenericLinks
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (LSAppLink)appLink;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)setAppLink:(id)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerGenericLinks

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  v4 = [(SDAirDropHandler *)self bundleProxy];

  if (v4) {
    return 1;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v6 = [(SDAirDropHandler *)self transfer];
  v7 = [v6 completedURLs];

  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  BOOL v5 = v8 != 0;
  id v27 = v8;
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    v26 = v29;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v10);
        v12 = [v11 scheme:v26];
        v13 = [v12 lowercaseString];

        if (([v13 isEqual:@"http"] & 1) != 0
          || [v13 isEqual:@"https"])
        {
          dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v29[0] = sub_1000C81D0;
          v29[1] = &unk_1008CC880;
          v29[2] = self;
          v29[3] = v11;
          dispatch_semaphore_t v30 = v14;
          SEL v31 = a2;
          v15 = v14;
          +[LSAppLink getAppLinkWithURL:v11 completionHandler:v28];
          dispatch_time_t v16 = dispatch_time(0, 1000000000);
          dispatch_semaphore_wait(v15, v16);
          v17 = [(SDAirDropHandlerGenericLinks *)self appLink];
        }
        else
        {
          v18 = +[LSApplicationWorkspace defaultWorkspace];
          v15 = [v18 URLOverrideForURL:v11];

          v19 = +[LSApplicationWorkspace defaultWorkspace];
          v20 = [v19 applicationsAvailableForOpeningURL:v15];
          [v20 firstObject];
          uint64_t v21 = v9;
          v22 = a2;
          v24 = v23 = v7;
          [(SDAirDropHandler *)self setBundleProxy:v24];

          v7 = v23;
          a2 = v22;
          uint64_t v9 = v21;

          v17 = [(SDAirDropHandler *)self bundleProxy];
        }
        if (!v17)
        {
          BOOL v5 = 0;
          goto LABEL_19;
        }
        v10 = (char *)v10 + 1;
      }
      while (v27 != v10);
      id v27 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v27) {
        continue;
      }
      break;
    }
    BOOL v5 = 1;
  }
LABEL_19:

  return v5;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerGenericLinks;
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x4000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  v4 = [(SDAirDropHandlerGenericLinks *)self appLink];
  BOOL v5 = [v4 targetApplicationProxy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SDAirDropHandler *)self bundleProxy];
  }
  id v8 = v7;

  uint64_t v9 = [v8 localizedName];
  unint64_t v10 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v19 = @"GENERIC_LINK";
  v11 = +[NSNumber numberWithInteger:v10];
  v20 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  uint64_t v21 = v12;
  v13 = +[NSArray arrayWithObjects:&v21 count:1];
  dispatch_semaphore_t v14 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v13];

  v15 = SFLocalizedStringForKey();
  if (v10 == 1) {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v3, v9, v18);
  }
  else {
  dispatch_time_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v3, v10, v9);
  }

  return v16;
}

- (void)updatePossibleActions
{
  v14.receiver = self;
  v14.super_class = (Class)SDAirDropHandlerGenericLinks;
  [(SDAirDropHandler *)&v14 updatePossibleActions];
  objc_super v3 = [(SDAirDropHandlerGenericLinks *)self appLink];
  v4 = [v3 targetApplicationProxy];
  if (v4)
  {
  }
  else
  {
    v4 = [(SDAirDropHandler *)self bundleProxy];

    if (!v4) {
      return;
    }
  }
  BOOL v5 = [(SDAirDropHandler *)self defaultActionForBundleProxy:v4];
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  unint64_t v10 = sub_1000C863C;
  v11 = &unk_1008CA128;
  objc_copyWeak(&v12, &location);
  [v5 setActionHandler:&v8];
  v15 = v5;
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v8, v9, v10, v11);
  id v7 = [(SDAirDropHandler *)self transfer];
  [v7 setPossibleActions:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (void)setAppLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end