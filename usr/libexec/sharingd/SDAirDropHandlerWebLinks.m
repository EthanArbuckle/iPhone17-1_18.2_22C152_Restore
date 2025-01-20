@interface SDAirDropHandlerWebLinks
+ (id)safariBundleID;
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerWebLinks)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerWebLinks

- (SDAirDropHandlerWebLinks)initWithTransfer:(id)a3
{
  id v4 = a3;
  v5 = +[SDAirDropHandlerWebLinks safariBundleID];
  v8.receiver = self;
  v8.super_class = (Class)SDAirDropHandlerWebLinks;
  v6 = [(SDAirDropHandler *)&v8 initWithTransfer:v4 bundleIdentifier:v5];

  return v6;
}

+ (id)safariBundleID
{
  return @"com.apple.mobilesafari";
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  id v4 = [v3 completedURLs];

  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 scheme];
        v11 = [v10 lowercaseString];
        if ([v11 isEqual:@"http"])
        {
        }
        else
        {
          v12 = [v9 scheme];
          v13 = [v12 lowercaseString];
          unsigned int v14 = [v13 isEqual:@"https"];

          if (!v14)
          {
            BOOL v15 = 0;
            goto LABEL_15;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerWebLinks;
  return [(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x8000000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  id v5 = [(SDAirDropHandler *)self transfer];
  id v6 = [v5 metaData];
  uint64_t v7 = [v6 itemsDescription];

  if (qword_10097FB90 != -1) {
    dispatch_once(&qword_10097FB90, &stru_1008CAB28);
  }
  if (v4 != 1)
  {
    v16 = 0;
LABEL_10:
    CFStringRef v25 = @"WEBSITE";
    long long v19 = +[NSNumber numberWithUnsignedInteger:v4];
    v26 = v19;
    long long v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v27 = v20;
    v21 = +[NSArray arrayWithObjects:&v27 count:1];
    uint64_t v22 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v21];

    v23 = SFLocalizedStringForKey();
    long long v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v3, v4);

    v16 = (void *)v22;
    goto LABEL_11;
  }
  objc_super v8 = +[SDAirDropHandlerWebLinks safariBundleID];
  v9 = [v5 metaData];
  v10 = [v9 senderBundleID];
  unsigned int v11 = [v10 isEqual:v8];

  if (!v11 || !v7)
  {
    v12 = [(SDAirDropHandler *)self transfer];
    v13 = [v12 completedURLs];
    unsigned int v14 = [v13 firstObject];
    uint64_t v15 = [v14 _lp_simplifiedDisplayString];

    uint64_t v7 = (void *)v15;
  }
  v16 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906D58];
  long long v17 = SFLocalizedStringForKey();
  long long v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v3, v7);

  if (!v18) {
    goto LABEL_10;
  }
LABEL_11:

  return v18;
}

@end