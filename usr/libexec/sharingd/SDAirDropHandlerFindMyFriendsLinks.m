@interface SDAirDropHandlerFindMyFriendsLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerFindMyFriendsLinks)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (id)suitableContentsTitle;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerFindMyFriendsLinks

- (SDAirDropHandlerFindMyFriendsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerFindMyFriendsLinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.findmy"];
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  objc_super v4 = [v3 completedURLs];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) scheme];
        v10 = [v9 lowercaseString];
        int MyFriendsLink = SFIsFindMyFriendsLink();

        if (!MyFriendsLink)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
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
  v3.super_class = (Class)SDAirDropHandlerFindMyFriendsLinks;
  return (unint64_t)[(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x8000000;
}

- (id)suitableContentsTitle
{
  return (id)SFLocalizedStringForKey();
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  objc_super v4 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:&off_100906E30];
  id v5 = SFLocalizedStringForKey();
  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3);

  return v6;
}

@end