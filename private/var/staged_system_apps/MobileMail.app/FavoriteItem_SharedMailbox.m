@interface FavoriteItem_SharedMailbox
- (BOOL)_displayNameShouldBeRedacted;
- (BOOL)_isTokenValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObserving;
- (BOOL)isVisible;
- (BOOL)wantsDisclosureButton;
- (EFCancelable)observationToken;
- (EFCancelable)unreadCountToken;
- (FavoriteItem_SharedMailbox)initWithDictionary:(id)a3;
- (FavoriteItem_SharedMailbox)initWithSourceType:(unint64_t)a3;
- (id)analyticsKey;
- (id)applicationShortcutIcon;
- (id)badgeCountString;
- (id)countQueryPredicate;
- (id)criterion;
- (id)defaultIconBlock;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)iconTintColor;
- (id)itemURLString;
- (id)mailboxScope;
- (id)persistentIDForMigration;
- (id)selectedIconTintColor;
- (id)serverCountMailboxScope;
- (id)sharedMailboxController;
- (id)smartMailbox;
- (unint64_t)hash;
- (unint64_t)sourceType;
- (void)_accountsDidChange:(id)a3;
- (void)_observeNotifications:(BOOL)a3;
- (void)_restartCountTokenIfNecessary;
- (void)_significantTimeChange;
- (void)_startCountQueryIfNeeded;
- (void)configureOutlineCell:(id)a3;
- (void)dealloc;
- (void)prepareItemForView;
- (void)setIsObserving:(BOOL)a3;
- (void)setObservationToken:(id)a3;
- (void)setSelected:(BOOL)a3 fromUI:(BOOL)a4;
- (void)setUnreadCountToken:(id)a3;
- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation FavoriteItem_SharedMailbox

- (id)displayName
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  v3 = [v2 mailboxTitle];

  return v3;
}

- (void)_observeNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FavoriteItem_SharedMailbox *)self isObserving] != a3)
  {
    v6 = +[FavoriteItem log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (id)objc_opt_class();
      v8 = [(FavoriteItem_SharedMailbox *)self displayName];
      v9 = NSStringFromSelector(a2);
      int v12 = 138544130;
      id v13 = v7;
      __int16 v14 = 2114;
      v15 = v8;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 1024;
      BOOL v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ - %{public}@ observe:%{BOOL}d", (uint8_t *)&v12, 0x26u);
    }
    [(FavoriteItem_SharedMailbox *)self setIsObserving:v3];
    v10 = +[NSNotificationCenter defaultCenter];
    v11 = v10;
    if (v3)
    {
      [v10 addObserver:self selector:"_accountsDidChange:" name:ECMailAccountsDidChangeNotification object:0];
      [v11 addObserver:self selector:"_significantTimeChange" name:UIApplicationSignificantTimeChangeNotification object:0];
    }
    else
    {
      [v10 removeObserver:self name:ECMailAccountsDidChangeNotification object:0];
      [v11 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);

  objc_storeStrong((id *)&self->_unreadCountToken, 0);
}

- (void)dealloc
{
  [(FavoriteItem_SharedMailbox *)self setUnreadCountToken:0];
  v3.receiver = self;
  v3.super_class = (Class)FavoriteItem_SharedMailbox;
  [(FavoriteItem_SharedMailbox *)&v3 dealloc];
}

- (void)setUnreadCountToken:(id)a3
{
  v5 = (EFCancelable *)a3;
  p_unreadCountToken = &self->_unreadCountToken;
  unreadCountToken = self->_unreadCountToken;
  if (unreadCountToken != v5)
  {
    [(EFCancelable *)unreadCountToken cancel];
    if (*p_unreadCountToken)
    {
      v8 = +[FavoriteItem log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (id)objc_opt_class();
        v10 = [(FavoriteItem_SharedMailbox *)self displayName];
        v11 = *p_unreadCountToken;
        int v13 = 138543874;
        id v14 = v9;
        __int16 v15 = 2114;
        __int16 v16 = v10;
        __int16 v17 = 2114;
        __int16 v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@:%{public}@ - Cancel token:%{public}@", (uint8_t *)&v13, 0x20u);
      }
      int v12 = +[NSNotificationCenter defaultCenter];
      [v12 removeObserver:self];

      [(FavoriteItem_SharedMailbox *)self setIsObserving:0];
    }
    objc_storeStrong((id *)&self->_unreadCountToken, a3);
  }
}

- (void)prepareItemForView
{
}

- (void)_startCountQueryIfNeeded
{
  unsigned int v3 = [(FavoriteItem *)self isSelected];
  unsigned int v4 = [(FavoriteItem_SharedMailbox *)self _isTokenValid];
  if (!v3 || (v4 & 1) != 0)
  {
    if ((v3 & 1) == 0)
    {
      if (v4) {
        [(FavoriteItem_SharedMailbox *)self _observeNotifications:0];
      }
      [(FavoriteItem_SharedMailbox *)self setUnreadCountToken:0];
    }
  }
  else
  {
    id v6 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
    v5 = [v6 startCountQuery];
    [(FavoriteItem_SharedMailbox *)self setUnreadCountToken:v5];

    [(FavoriteItem_SharedMailbox *)self _observeNotifications:1];
  }
}

- (BOOL)_isTokenValid
{
  v2 = [(FavoriteItem_SharedMailbox *)self unreadCountToken];
  unsigned int v3 = v2;
  if (v2) {
    unsigned int v4 = [v2 isCanceled] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (FavoriteItem_SharedMailbox *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_sourceType == v5->_sourceType;
  }

  return v6;
}

- (FavoriteItem_SharedMailbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_SharedMailbox;
  v5 = [(FavoriteItem *)&v9 initWithDictionary:v4];
  if (v5
    && ([v4 objectForKey:@"sourceType"],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v5->_sourceType = (unint64_t)[v6 integerValue],
        v6,
        v5->_sourceType > 0x1A))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)FavoriteItem_SharedMailbox;
  unsigned int v3 = [(FavoriteItem *)&v6 dictionaryRepresentation];
  id v4 = +[NSNumber numberWithInteger:self->_sourceType];
  [v3 setObject:v4 forKey:@"sourceType"];

  return v3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (id)persistentIDForMigration
{
  return +[NSString stringWithFormat:@"SharedMailbox-%i", self->_sourceType];
}

- (FavoriteItem_SharedMailbox)initWithSourceType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FavoriteItem_SharedMailbox;
  result = [(FavoriteItem *)&v5 initWithType:5];
  if (result) {
    result->_sourceType = a3;
  }
  return result;
}

- (id)sharedMailboxController
{
  return +[SharedMailboxController sharedInstanceForSourceType:self->_sourceType];
}

- (BOOL)isVisible
{
  return 1;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (id)defaultIconBlock
{
  unint64_t sourceType = self->_sourceType;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B6E90;
  v5[3] = &unk_1006067E8;
  v5[4] = sourceType;
  unsigned int v3 = objc_retainBlock(v5);

  return v3;
}

- (id)iconTintColor
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  unsigned int v3 = [v2 iconTintColor];

  return v3;
}

- (id)selectedIconTintColor
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  unsigned int v3 = [v2 selectedIconTintColor];

  return v3;
}

- (id)applicationShortcutIcon
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  unsigned int v3 = [v2 applicationShortcutIconImage];
  if (v3)
  {
    id v4 = +[UIApplicationShortcutIcon iconWithCustomImage:v3];
  }
  else
  {
    objc_super v5 = [v2 applicationShortcutIconName];
    if (v5)
    {
      id v4 = +[UIApplicationShortcutIcon iconWithSystemImageName:v5];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)criterion
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  unsigned int v3 = [v2 criterion];

  return v3;
}

- (void)_accountsDidChange:(id)a3
{
}

- (void)_significantTimeChange
{
}

- (void)_restartCountTokenIfNecessary
{
  [(FavoriteItem_SharedMailbox *)self setUnreadCountToken:0];

  [(FavoriteItem_SharedMailbox *)self _startCountQueryIfNeeded];
}

- (void)configureOutlineCell:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_SharedMailbox;
  [(FavoriteItem *)&v8 configureOutlineCell:v4];
  objc_super v5 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  objc_super v6 = [v5 mailboxTitle];
  [v4 setTitle:v6];

  id v7 = [(FavoriteItem_SharedMailbox *)self unreadCountToken];
  [v4 setShouldShowBadgeCountIfNecessary:v7 != 0];

  [v4 setBadgeCount:[v5 badgeCount]];
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  objc_super v9 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  [v9 presentFromSelectionTarget:v10 item:self accessoryTapped:v7 animated:v6];
}

- (BOOL)wantsDisclosureButton
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  unsigned __int8 v3 = [v2 wantsDisclosureButton];

  return v3;
}

- (id)smartMailbox
{
  v2 = [(FavoriteItem_SharedMailbox *)self sharedMailboxController];
  unsigned __int8 v3 = [v2 mailbox];

  return v3;
}

- (void)setSelected:(BOOL)a3 fromUI:(BOOL)a4
{
  BOOL v4 = a4;
  [(FavoriteItem *)self setSelected:a3];
  if (v4)
  {
    BOOL v6 = +[FavoritesManager defaultsKeyForAutomaticMailboxVisibilityForSourceType:[(FavoriteItem_SharedMailbox *)self sourceType]];
    if (v6)
    {
      id v8 = v6;
      BOOL v7 = +[NSUserDefaults standardUserDefaults];
      [v7 setBool:1 forKey:v8];

      BOOL v6 = v8;
    }
  }
}

- (unint64_t)hash
{
  return self->_sourceType;
}

- (id)itemURLString
{
  return +[NSString stringWithFormat:@"favoriteitem://sharedmailbox/%i", self->_sourceType];
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)badgeCountString
{
  unint64_t v4 = [(FavoriteItem_SharedMailbox *)self sourceType];
  if (v4 <= 0x1A)
  {
    if (((1 << v4) & 0x2FF800C) != 0)
    {
      objc_super v5 = +[NSBundle bundleWithIdentifier:@"com.apple.Message"];
      BOOL v6 = [v5 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
      BOOL v7 = [(FavoriteItem *)self badgeCount];
      uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v7 integerValue]);
    }
    else
    {
      if (((1 << v4) & 0x40001F3) == 0) {
        goto LABEL_7;
      }
      objc_super v5 = +[NSBundle bundleWithIdentifier:@"com.apple.Message"];
      BOOL v6 = [v5 localizedStringForKey:@"UNREAD_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
      BOOL v7 = [(FavoriteItem *)self badgeCount];
      uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v7 integerValue]);
    }
    v2 = (void *)v8;
  }
LABEL_7:

  return v2;
}

- (id)countQueryPredicate
{
  unint64_t v3 = [(FavoriteItem_SharedMailbox *)self sourceType];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  objc_super v5 = 0;
  uint64_t v6 = 1;
  switch(v3)
  {
    case 1uLL:
      int v7 = 1;
      uint64_t v8 = +[EMMessageListItemPredicates predicateForIsVIP:1];
      goto LABEL_19;
    case 2uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForFlaggedMessages];
      goto LABEL_18;
    case 3uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForUnreadMessages];
      goto LABEL_18;
    case 4uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForIncludesMeMessages];
      goto LABEL_10;
    case 5uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForMessagesWithAttachments];
      goto LABEL_10;
    case 6uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForNotifyMessages];
      goto LABEL_10;
    case 7uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForTodayMessages];
      goto LABEL_10;
    case 8uLL:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForMuteMessages];
LABEL_10:
      int v7 = 1;
      goto LABEL_19;
    case 0x10uLL:
      goto LABEL_17;
    case 0x11uLL:
      uint64_t v6 = 0;
      goto LABEL_17;
    case 0x12uLL:
      uint64_t v6 = 5;
      goto LABEL_17;
    case 0x13uLL:
      uint64_t v6 = 4;
      goto LABEL_17;
    case 0x14uLL:
      uint64_t v6 = 2;
      goto LABEL_17;
    case 0x15uLL:
      uint64_t v6 = 3;
      goto LABEL_17;
    case 0x16uLL:
      uint64_t v6 = 6;
LABEL_17:
      uint64_t v8 = +[EMMessageListItemPredicates predicateForFlagColor:v6];
LABEL_18:
      int v7 = 0;
LABEL_19:
      objc_super v9 = (void *)v8;
      [v4 addObject:v8];
      if (v7)
      {
        id v10 = +[EMMessageListItemPredicates predicateForUnreadMessages];
        [v4 addObject:v10];
      }
      v11 = [(FavoriteItem_SharedMailbox *)self mailboxScope];
      int v12 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v11];
      [v4 addObject:v12];

      objc_super v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

      break;
    default:
      break;
  }

  return v5;
}

- (id)mailboxScope
{
  unint64_t v2 = [(FavoriteItem_SharedMailbox *)self sourceType];
  unint64_t v3 = +[EMMailboxScope mailboxScopeForMailboxTypes:&off_10062B3A8 forExclusion:1];
  uint64_t v4 = +[EMMailboxScope mailboxScopeForMailboxType:7 forExclusion:0];
  objc_super v5 = (void *)v4;
  id v6 = 0;
  if (v2 <= 0x16)
  {
    if (((1 << v2) & 0x7F0144) != 0)
    {
      int v7 = v3;
    }
    else
    {
      int v7 = (void *)v4;
      if (((1 << v2) & 0xBA) == 0) {
        goto LABEL_6;
      }
    }
    id v6 = v7;
  }
LABEL_6:

  return v6;
}

- (id)serverCountMailboxScope
{
  if ((id)[(FavoriteItem_SharedMailbox *)self sourceType] == (id)3)
  {
    unint64_t v3 = [(FavoriteItem_SharedMailbox *)self mailboxScope];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)analyticsKey
{
  unint64_t v2 = [(FavoriteItem_SharedMailbox *)self sourceType] - 1;
  if (v2 <= 0x15 && ((0x3F80FFu >> v2) & 1) != 0)
  {
    unint64_t v3 = +[NSString stringWithFormat:@"Smart_%@", off_1006068D8[v2]];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (EFCancelable)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
}

@end