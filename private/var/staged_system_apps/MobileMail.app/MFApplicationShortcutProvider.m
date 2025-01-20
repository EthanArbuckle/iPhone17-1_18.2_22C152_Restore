@interface MFApplicationShortcutProvider
+ (OS_os_log)log;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (FavoriteItem)mailboxFavoriteItem;
- (FavoriteItem)specialMailboxFavoriteItem;
- (FavoritesPersistence)favoritesPersistence;
- (MFAccountsProvider)accountsProvider;
- (MFApplicationShortcutProvider)initWithAccountsProvider:(id)a3 favoritesPersistence:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6;
- (_ShortcutCountObserverWrapper)mailboxCountObserver;
- (_ShortcutCountObserverWrapper)specialMailboxCountObserver;
- (id)_applicationShortcutForFavoriteItem:(id)a3 badgeCountString:(id)a4;
- (id)_applicationShortcutIconForFavoriteItem:(id)a3;
- (id)_iconImageWithBackgroundColor:(id)a3;
- (id)fixedShortcutItems;
- (id)startCountQueryForMailboxFavoriteItem:(id)a3;
- (void)_favoritesDidChange:(id)a3;
- (void)_unreadCountDidChange:(id)a3;
- (void)_updateApplicationShortcuts;
- (void)dealloc;
- (void)setAccountsProvider:(id)a3;
- (void)setFavoritesPersistence:(id)a3;
- (void)setHookRegistry:(id)a3;
- (void)setMailboxCountObserver:(id)a3;
- (void)setMailboxFavoriteItem:(id)a3;
- (void)setShortcutItems:(id)a3;
- (void)setSpecialMailboxCountObserver:(id)a3;
- (void)setSpecialMailboxFavoriteItem:(id)a3;
- (void)updateApplicationShortcutsForNoDisplayedAccounts;
@end

@implementation MFApplicationShortcutProvider

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001714E4;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699988 != -1) {
    dispatch_once(&qword_100699988, block);
  }
  v2 = (void *)qword_100699980;

  return (OS_os_log *)v2;
}

- (MFApplicationShortcutProvider)initWithAccountsProvider:(id)a3 favoritesPersistence:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MFApplicationShortcutProvider;
  v15 = [(MFApplicationShortcutProvider *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountsProvider, a3);
    objc_storeStrong((id *)&v16->_favoritesPersistence, a4);
    objc_storeStrong((id *)&v16->_messagePersistence, a5);
    objc_storeStrong((id *)&v16->_hookRegistry, a6);
    [(MFApplicationShortcutProvider *)v16 _updateApplicationShortcuts];
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v16 selector:"_favoritesDidChange:" name:@"MailApplicationFavoritesDidChange" object:0];
  }
  return v16;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(MFApplicationShortcutProvider *)self specialMailboxCountObserver];
  [v4 cancel];

  v5 = [(MFApplicationShortcutProvider *)self mailboxCountObserver];
  [v5 cancel];

  v6.receiver = self;
  v6.super_class = (Class)MFApplicationShortcutProvider;
  [(MFApplicationShortcutProvider *)&v6 dealloc];
}

- (void)_favoritesDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100171844;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (void)_unreadCountDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001718F0;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (void)_updateApplicationShortcuts
{
  v3 = [(MFApplicationShortcutProvider *)self accountsProvider];
  v4 = [v3 displayedAccounts];
  id v5 = [v4 count];

  if (v5)
  {
    objc_super v6 = [(MFApplicationShortcutProvider *)self favoritesPersistence];
    v7 = [v6 mailboxesCollection];
    v8 = [v7 selectedItems];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v8;
    id v10 = 0;
    id v11 = 0;
    id v12 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v38;
      *(void *)&long long v13 = 138412290;
      long long v34 = v13;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v15);
          if (v10) {
            goto LABEL_12;
          }
          if ([*(id *)(*((void *)&v37 + 1) + 8 * (void)v15) type] == (id)3
            || [v16 type] == (id)2
            || [v16 type] == (id)4)
          {
            id v10 = v16;
LABEL_12:
            if (v11) {
              goto LABEL_21;
            }
            goto LABEL_13;
          }
          id v10 = 0;
          if (v11) {
            goto LABEL_21;
          }
LABEL_13:
          if (objc_msgSend(v16, "type", v34) != (id)5)
          {
            id v11 = 0;
            goto LABEL_23;
          }
          id v17 = v16;
          [v17 sourceType];
          if (_MSSourceTypeIsValid())
          {
            id v11 = v17;
          }
          else
          {
            v18 = +[MFApplicationShortcutProvider log];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              id v42 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Special mailbox %@ has an invalid source type", buf, 0xCu);
            }

            id v11 = 0;
          }

LABEL_21:
          if (v10 && v11)
          {

            goto LABEL_31;
          }
LABEL_23:
          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v19 = [v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
        id v12 = v19;
        if (!v19)
        {

          if (!v11) {
            goto LABEL_33;
          }
LABEL_31:
          v20 = [(MFApplicationShortcutProvider *)self specialMailboxCountObserver];
          v21 = [v20 favoriteItem];
          unsigned __int8 v22 = [v21 isEqual:v11];

          if ((v22 & 1) == 0)
          {
            [(MFApplicationShortcutProvider *)self setSpecialMailboxFavoriteItem:v11];
            v23 = [(MFApplicationShortcutProvider *)self specialMailboxCountObserver];
            [v23 cancel];

            v24 = [(MFApplicationShortcutProvider *)self startCountQueryForMailboxFavoriteItem:v11];
            [(MFApplicationShortcutProvider *)self setSpecialMailboxCountObserver:v24];
          }
LABEL_33:
          if (v10)
          {
            v25 = [(MFApplicationShortcutProvider *)self mailboxCountObserver];
            v26 = [v25 favoriteItem];
            unsigned __int8 v27 = [v26 isEqual:v10];

            if ((v27 & 1) == 0)
            {
              [(MFApplicationShortcutProvider *)self setMailboxFavoriteItem:v10];
              v28 = [(MFApplicationShortcutProvider *)self mailboxCountObserver];
              [v28 cancel];

              v29 = [(MFApplicationShortcutProvider *)self startCountQueryForMailboxFavoriteItem:v10];
              [(MFApplicationShortcutProvider *)self setMailboxCountObserver:v29];
              goto LABEL_40;
            }
          }
          goto LABEL_41;
        }
      }
    }
    v29 = v9;
LABEL_40:

LABEL_41:
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100171E94;
    v35[3] = &unk_100604618;
    v35[4] = self;
    id v32 = objc_alloc_init((Class)NSMutableArray);
    id v36 = v32;
    v33 = +[EFScheduler mainThreadScheduler];
    [v33 performBlock:v35];
  }
  else
  {
    v30 = [(MFApplicationShortcutProvider *)self specialMailboxCountObserver];
    [v30 cancel];

    [(MFApplicationShortcutProvider *)self setSpecialMailboxCountObserver:0];
    v31 = [(MFApplicationShortcutProvider *)self mailboxCountObserver];
    [v31 cancel];

    [(MFApplicationShortcutProvider *)self setMailboxCountObserver:0];
    [(MFApplicationShortcutProvider *)self updateApplicationShortcutsForNoDisplayedAccounts];
  }
}

- (id)startCountQueryForMailboxFavoriteItem:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [_ShortcutCountObserverWrapper alloc];
  objc_super v6 = [(MFApplicationShortcutProvider *)self messagePersistence];
  v7 = [(MFApplicationShortcutProvider *)self hookRegistry];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017230C;
  v10[3] = &unk_100607F68;
  objc_copyWeak(&v11, &location);
  v8 = [(_ShortcutCountObserverWrapper *)v5 initWithFavoriteItem:v4 messagePersistence:v6 hookRegistry:v7 countDidChange:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (void)updateApplicationShortcutsForNoDisplayedAccounts
{
  if (pthread_main_np() != 1)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MFApplicationShortcutProvider.m" lineNumber:193 description:@"Current thread must be main"];
  }
  id v4 = [(MFApplicationShortcutProvider *)self fixedShortcutItems];
  id v9 = +[NSMutableArray arrayWithArray:v4];

  id v5 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
  id v6 = [v5 initWithSystemImageName:MFImageGlpyhsAppShortcutAddAccount];
  id v7 = objc_alloc_init((Class)SBSApplicationShortcutItem);
  [v7 setType:@"com.apple.mobilemail.MFMailAddAccountAppShortcut"];
  v8 = MFLookupLocalizedString();
  [v7 setLocalizedTitle:v8];

  [v7 setIcon:v6];
  [v9 addObject:v7];
  [(MFApplicationShortcutProvider *)self setShortcutItems:v9];
}

- (id)fixedShortcutItems
{
  v2 = (void *)qword_100699990;
  if (!qword_100699990)
  {
    id v3 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
    id v4 = [v3 initWithSystemImageName:MFImageGlpyhsAppShortcutCompose];
    id v5 = objc_alloc_init((Class)SBSApplicationShortcutItem);
    [v5 setType:@"com.apple.mobilemail.NewMessageApplicationShortcut"];
    id v6 = MFLookupLocalizedString();
    [v5 setLocalizedTitle:v6];

    [v5 setIcon:v4];
    id v7 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
    id v8 = [v7 initWithSystemImageName:MFImageGlpyhsAppShortcutSearch];
    id v9 = objc_alloc_init((Class)SBSApplicationShortcutItem);
    [v9 setType:@"com.apple.mobilemail.SearchApplicationShortcut"];
    id v10 = MFLookupLocalizedString();
    [v9 setLocalizedTitle:v10];

    [v9 setIcon:v8];
    v14[0] = v5;
    v14[1] = v9;
    uint64_t v11 = +[NSArray arrayWithObjects:v14 count:2];
    id v12 = (void *)qword_100699990;
    qword_100699990 = v11;

    v2 = (void *)qword_100699990;
  }

  return v2;
}

- (id)_applicationShortcutForFavoriteItem:(id)a3 badgeCountString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 displayName];
  id v9 = v7;
  id v10 = [(MFApplicationShortcutProvider *)self _applicationShortcutIconForFavoriteItem:v6];
  if (!v10)
  {
    id v11 = objc_alloc((Class)SBSApplicationShortcutSystemIcon);
    id v10 = [v11 initWithSystemImageName:MFImageGlyphGenericMailbox];
  }
  id v12 = [(MFApplicationShortcutProvider *)self favoritesPersistence];
  long long v13 = [v12 indexPathForItem:v6];
  id v14 = [v13 row];

  CFStringRef v19 = @"MFMailFavoriteItemAppShortcutFavoriteItem";
  v15 = +[NSNumber numberWithUnsignedInteger:v14];
  v20 = v15;
  v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  id v17 = objc_alloc_init((Class)SBSApplicationShortcutItem);
  [v17 setType:@"com.apple.mobilemail.FavoriteItemApplicationShortcut"];
  [v17 setLocalizedTitle:v8];
  [v17 setLocalizedSubtitle:v9];
  [v17 setIcon:v10];
  [v17 setUserInfo:v16];

  return v17;
}

- (id)_applicationShortcutIconForFavoriteItem:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  id v6 = (id *)&MFImageGlyphGenericMailbox;
  switch((unint64_t)[v4 sourceType])
  {
    case 0uLL:
      if ([v4 type] == (id)3)
      {
        id v6 = (id *)&MFImageGlyphInboxMailbox;
      }
      else if ([v4 type] == (id)4)
      {
        id v6 = (id *)&MFImageGlyphFavoriteInboxUnifiedMailbox;
      }
      goto LABEL_3;
    case 1uLL:
      id v6 = (id *)&MFImageGlyphFavoriteVIPMailbox;
      goto LABEL_3;
    case 2uLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
      id v6 = (id *)&MFImageGlyphFavoriteFlaggedMailbox;
      goto LABEL_3;
    case 3uLL:
      id v6 = (id *)&MFImageGlyphFavoriteUnreadMailbox;
      goto LABEL_3;
    case 4uLL:
      id v9 = objc_alloc((Class)SBSApplicationShortcutCustomImageIcon);
      id v10 = +[UIColor labelColor];
      id v11 = [(MFApplicationShortcutProvider *)self _iconImageWithBackgroundColor:v10];
      id v12 = UIImagePNGRepresentation(v11);
      id v7 = [v9 initWithImageData:v12 dataType:0 isTemplate:0];

      id v5 = 0;
      goto LABEL_5;
    case 5uLL:
      id v6 = (id *)&MFImageGlyphFavoriteAttachmentsMailbox;
      goto LABEL_3;
    case 6uLL:
      id v6 = (id *)&MFImageGlyphFavoriteNotifydMailbox;
      goto LABEL_3;
    case 7uLL:
      id v6 = (id *)&MFImageGlyphFavoriteTodayMailbox;
      goto LABEL_3;
    case 8uLL:
      id v6 = (id *)&MFImageGlyphFavoriteMuteThreadMailbox;
      goto LABEL_3;
    case 0xFuLL:
      id v6 = (id *)&MFImageGlyphFavoriteReadLaterMailbox;
      goto LABEL_3;
    case 0x17uLL:
      id v6 = (id *)&MFImageGlyphFavoriteFollowUpMailbox;
      goto LABEL_3;
    case 0x19uLL:
      id v6 = (id *)&MFImageGlyphFavoriteSendLaterMailbox;
      goto LABEL_3;
    case 0x1AuLL:
LABEL_3:
      id v5 = *v6;
      break;
    default:
      break;
  }
  id v7 = [objc_alloc((Class)SBSApplicationShortcutSystemIcon) initWithSystemImageName:v5];
LABEL_5:

  return v7;
}

- (id)_iconImageWithBackgroundColor:(id)a3
{
  id v3 = a3;
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 preferredContentSizeCategory];

  double v6 = sub_10013634C(2, v5, 36.0);
  double v7 = sub_10013634C(3, v5, 36.0);
  if (v6 < v7) {
    double v6 = v7;
  }
  id v8 = +[NSBundle mainBundle];
  id v9 = sub_100135D98(2, v5, v8, v3, 0, v6);

  id v10 = +[NSBundle mainBundle];
  id v11 = sub_100135D98(3, v5, v10, v3, 0, v6);

  [v9 size];
  double v13 = v12;
  [v11 size];
  v24.height = v13 + v14 + 2.0;
  v24.width = v6;
  UIGraphicsBeginImageContextWithOptions(v24, 0, 0.0);
  [v9 size];
  double v16 = v15;
  double v18 = v17;
  double y = CGRectZero.origin.y;
  [v9 drawInRect:CGRectZero.origin.x, y, v15, v17];
  [v9 size];
  [v11 drawInRect:CGRectMake(0, y + v20 + 2.0, v16, v18)];
  v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v21;
}

- (void)setShortcutItems:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ef_map:&stru_10060A950];
  id v5 = +[MFApplicationShortcutProvider log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting shortcuts: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = objc_alloc_init((Class)SBSApplicationShortcutService);
  [v6 updateDynamicApplicationShortcutItems:v3 forBundleIdentifier:kMFMobileMailBundleIdentifier];
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (void)setFavoritesPersistence:(id)a3
{
}

- (_ShortcutCountObserverWrapper)mailboxCountObserver
{
  return self->_mailboxCountObserver;
}

- (void)setMailboxCountObserver:(id)a3
{
}

- (_ShortcutCountObserverWrapper)specialMailboxCountObserver
{
  return self->_specialMailboxCountObserver;
}

- (void)setSpecialMailboxCountObserver:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
}

- (FavoriteItem)specialMailboxFavoriteItem
{
  return self->_specialMailboxFavoriteItem;
}

- (void)setSpecialMailboxFavoriteItem:(id)a3
{
}

- (FavoriteItem)mailboxFavoriteItem
{
  return self->_mailboxFavoriteItem;
}

- (void)setMailboxFavoriteItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxFavoriteItem, 0);
  objc_storeStrong((id *)&self->_specialMailboxFavoriteItem, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_specialMailboxCountObserver, 0);
  objc_storeStrong((id *)&self->_mailboxCountObserver, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);

  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end