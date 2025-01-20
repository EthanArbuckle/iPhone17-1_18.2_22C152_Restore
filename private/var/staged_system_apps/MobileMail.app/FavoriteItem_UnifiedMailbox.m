@interface FavoriteItem_UnifiedMailbox
- (BOOL)_displayNameShouldBeRedacted;
- (BOOL)acceptsMessageTransfers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisible;
- (CGPoint)iconOffset;
- (EFCancelable)unreadCountToken;
- (EFDebouncer)badgeCountDebouncer;
- (FavoriteItem_UnifiedMailbox)initWithDictionary:(id)a3;
- (FavoriteItem_UnifiedMailbox)initWithMailboxType:(int64_t)a3;
- (id)analyticsKey;
- (id)applicationShortcutIcon;
- (id)defaultIconBlock;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)itemID;
- (id)itemURLString;
- (id)persistentIDForMigration;
- (id)representingMailboxes;
- (id)smartMailbox;
- (int64_t)mailboxType;
- (unint64_t)hash;
- (void)configureOutlineCell:(id)a3;
- (void)setBadgeCountDebouncer:(id)a3;
- (void)setUnreadCountToken:(id)a3;
- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation FavoriteItem_UnifiedMailbox

- (BOOL)isVisible
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 accountsProvider];
  unsigned __int8 v4 = [v3 isDisplayingMultipleAccounts];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeCountDebouncer, 0);

  objc_storeStrong((id *)&self->_unreadCountToken, 0);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v4 = (FavoriteItem_UnifiedMailbox *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_mailboxType == v5->_mailboxType;
  }

  return v6;
}

- (FavoriteItem_UnifiedMailbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_UnifiedMailbox;
  v5 = [(FavoriteItem *)&v8 initWithDictionary:v4];
  if (v5)
  {
    BOOL v6 = [v4 objectForKey:@"mailboxType"];
    v5->_mailboxType = (int64_t)[v6 integerValue];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)FavoriteItem_UnifiedMailbox;
  v3 = [(FavoriteItem *)&v6 dictionaryRepresentation];
  id v4 = +[NSNumber numberWithInteger:self->_mailboxType];
  [v3 setObject:v4 forKey:@"mailboxType"];

  return v3;
}

- (id)itemID
{
  itemID = self->super._itemID;
  if (!itemID)
  {
    if (self->super._collectionID) {
      CFStringRef collectionID = (const __CFString *)self->super._collectionID;
    }
    else {
      CFStringRef collectionID = &stru_100619928;
    }
    v5 = +[NSString stringWithFormat:@"%@-%ld", collectionID, [(FavoriteItem_UnifiedMailbox *)self mailboxType]];
    objc_super v6 = self->super._itemID;
    self->super._itemID = v5;

    itemID = self->super._itemID;
  }

  return itemID;
}

- (int64_t)mailboxType
{
  return self->_mailboxType;
}

- (FavoriteItem_UnifiedMailbox)initWithMailboxType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FavoriteItem_UnifiedMailbox;
  result = [(FavoriteItem *)&v5 initWithType:4];
  if (result) {
    result->_mailboxType = a3;
  }
  return result;
}

- (id)defaultIconBlock
{
  int64_t mailboxType = self->_mailboxType;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B68EC;
  v5[3] = &unk_1006067E8;
  v5[4] = mailboxType;
  v3 = objc_retainBlock(v5);

  return v3;
}

- (id)applicationShortcutIcon
{
  v2 = +[MFMailboxUid shorcutIconNameForMailboxType:self->_mailboxType];
  if (v2)
  {
    v3 = +[UIApplicationShortcutIcon iconWithSystemImageName:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)configureOutlineCell:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FavoriteItem_UnifiedMailbox;
  [(FavoriteItem *)&v16 configureOutlineCell:v4];
  objc_super v5 = +[UIApplication sharedApplication];
  objc_super v6 = [v5 accountsProvider];
  v7 = [v6 focusedAccounts];

  if (![v7 count])
  {
    objc_super v8 = +[UIApplication sharedApplication];
    v9 = [v8 accountsProvider];
    uint64_t v10 = [v9 displayedAccounts];

    v7 = (void *)v10;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B6C5C;
  v15[3] = &unk_100606810;
  v15[4] = self;
  v11 = [v7 ef_compactMap:v15];
  int64_t mailboxType = self->_mailboxType;
  v13 = [(FavoriteItem_UnifiedMailbox *)self smartMailbox];
  [v4 setSmartMailbox:v13];

  [v4 setLegacyMailboxes:v11 showUnreadCount:[self showUnreadCount] unreadCountIncludesRead:mailboxType == 5];
  v14 = [(FavoriteItem_UnifiedMailbox *)self displayName];
  [v4 setTitle:v14];
}

- (CGPoint)iconOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
}

- (id)smartMailbox
{
  uint64_t v3 = ECMailboxTypeFromMailboxUidType();
  if (v3 == 5)
  {
    id v4 = +[LocalAccount localAccount];
    objc_super v5 = [v4 transientDraftsFolder];
    objc_super v6 = [v5 URL];

    v7 = +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxWithURL:v6];
  }
  else
  {
    v7 = 0;
  }
  objc_super v8 = [(FavoriteItem_UnifiedMailbox *)self displayName];
  v9 = +[EMSmartMailbox unifiedMailboxOfType:v3 name:v8 additionalPredicate:v7];

  return v9;
}

- (unint64_t)hash
{
  return self->_mailboxType;
}

- (id)itemURLString
{
  double v2 = [(FavoriteItem_UnifiedMailbox *)self itemID];
  uint64_t v3 = +[NSString stringWithFormat:@"favoriteitem://unifiedmailbox/%@", v2];

  return v3;
}

- (id)representingMailboxes
{
  if ([(FavoriteItem_UnifiedMailbox *)self isVisible])
  {
    uint64_t v3 = +[NSMutableArray array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = +[MailAccount activeAccounts];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) mailboxUidOfType:self->_mailboxType createIfNeeded:0];
          if (v8) {
            [v3 addObject:v8];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)acceptsMessageTransfers
{
  int64_t v2 = [(FavoriteItem_UnifiedMailbox *)self mailboxType];

  return +[MFMailboxUid typeIsValidTransferDestination:v2];
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)displayName
{
  switch(self->_mailboxType)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      int64_t v2 = MFLookupLocalizedString();
      break;
    default:
      int64_t v2 = +[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:");
      break;
  }

  return v2;
}

- (id)persistentIDForMigration
{
  if (self->_mailboxType == 7) {
    return @"AllInboxes";
  }
  else {
    return 0;
  }
}

- (id)description
{
  int64_t mailboxType = self->_mailboxType;
  if (mailboxType > 99)
  {
    switch(mailboxType)
    {
      case 'd':
        CFStringRef v4 = @"INBOXSpecialMailboxUid";
        break;
      case 'e':
        CFStringRef v4 = @"JunkSpecialMailboxUid";
        break;
      case 'f':
        CFStringRef v4 = @"ArchiveSpecialMailboxUid";
        break;
      case 'g':
        CFStringRef v4 = @"TrashSpecialMailboxUid";
        break;
      case 'h':
        CFStringRef v4 = @"SentMessagesSpecialMailboxUid";
        break;
      case 'i':
        CFStringRef v4 = @"DraftsSpecialMailboxUid";
        break;
      case 'j':
        CFStringRef v4 = @"OutboxSpecialMailboxUid";
        break;
      default:
        CFStringRef v4 = 0;
        break;
    }
  }
  else
  {
    switch(mailboxType)
    {
      case 0:
        CFStringRef v4 = @"GenericMailboxUid";
        break;
      case 1:
        CFStringRef v4 = @"JunkMailboxUid";
        break;
      case 2:
        CFStringRef v4 = @"ArchiveMailboxUid";
        break;
      case 3:
        CFStringRef v4 = @"TrashMailboxUid";
        break;
      case 4:
        CFStringRef v4 = @"SentMessagesUid";
        break;
      case 5:
        CFStringRef v4 = @"DraftsMailboxUid";
        break;
      case 6:
        CFStringRef v4 = @"OutboxUid";
        break;
      case 7:
        CFStringRef v4 = @"InboxUid";
        break;
      case 8:
        CFStringRef v4 = @"RootMailboxUid";
        break;
      default:
        CFStringRef v5 = @"RootlessMailboxUid";
        if (mailboxType != -100) {
          CFStringRef v5 = 0;
        }
        if (mailboxType == -500) {
          CFStringRef v4 = @"InvalidMailboxUidType";
        }
        else {
          CFStringRef v4 = v5;
        }
        break;
    }
  }
  uint64_t v6 = objc_opt_class();
  v7 = [(FavoriteItem_UnifiedMailbox *)self displayName];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; int64_t mailboxType = %@; displayName = %@>",
    v6,
    self,
    v4,
  objc_super v8 = v7);

  return v8;
}

- (id)analyticsKey
{
  int64_t v2 = NSStringFromMailboxUidType();
  uint64_t v3 = +[NSString stringWithFormat:@"Unified_%@", v2];

  return v3;
}

- (EFCancelable)unreadCountToken
{
  return (EFCancelable *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUnreadCountToken:(id)a3
{
}

- (EFDebouncer)badgeCountDebouncer
{
  return (EFDebouncer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBadgeCountDebouncer:(id)a3
{
}

@end