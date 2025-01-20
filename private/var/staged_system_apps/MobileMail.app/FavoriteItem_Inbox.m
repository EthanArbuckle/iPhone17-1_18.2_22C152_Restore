@interface FavoriteItem_Inbox
- (BOOL)_displayNameShouldBeRedacted;
- (BOOL)acceptsMessageTransfers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisible;
- (FavoriteItem_Inbox)initWithAccount:(id)a3;
- (FavoriteItem_Inbox)initWithDictionary:(id)a3;
- (id)account;
- (id)analyticsKey;
- (id)criterion;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)itemID;
- (id)parentItemID;
- (id)persistentIDForMigration;
- (id)representingMailbox;
- (id)uniqueIDAndDisplayName;
- (unint64_t)hash;
- (void)configureOutlineCell:(id)a3;
- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation FavoriteItem_Inbox

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDAndDisplayName, 0);

  objc_storeStrong((id *)&self->_account, 0);
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
    v5 = [(FavoriteItem_Inbox *)self uniqueIDAndDisplayName];
    v6 = +[NSString stringWithFormat:@"%@-%@", collectionID, v5];
    v7 = self->super._itemID;
    self->super._itemID = v6;

    itemID = self->super._itemID;
  }

  return itemID;
}

- (FavoriteItem_Inbox)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FavoriteItem_Inbox;
  v6 = [(FavoriteItem *)&v9 initWithType:3];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)account
{
  return self->_account;
}

- (BOOL)isVisible
{
  return [(MailAccount *)self->_account isEnabledForDataclass:kAccountDataclassMail];
}

- (BOOL)_displayNameShouldBeRedacted
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 accountsProvider];
  unsigned __int8 v4 = [v3 isDisplayingMultipleAccounts];

  return v4;
}

- (id)displayName
{
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 accountsProvider];
  unsigned int v5 = [v4 isDisplayingMultipleAccounts];

  if (v5) {
    [(MailAccount *)self->_account displayName];
  }
  else {
  v6 = +[MFMailboxUid specialNameForType:7];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v4 = (FavoriteItem_Inbox *)a3;
  unsigned int v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = v6[13];
    v8 = [(MailAccount *)self->_account uniqueID];
    objc_super v9 = [v7 uniqueID];
    if ([v8 isEqualToString:v9])
    {
      v10 = [(FavoriteItem_Inbox *)self uniqueIDAndDisplayName];
      v11 = [v6 uniqueIDAndDisplayName];
      unsigned __int8 v12 = [v10 isEqualToString:v11];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)uniqueIDAndDisplayName
{
  uniqueIDAndDisplayName = self->_uniqueIDAndDisplayName;
  if (!uniqueIDAndDisplayName)
  {
    unsigned __int8 v4 = [(FavoriteItem_Inbox *)self representingMailbox];
    unsigned int v5 = [v4 uniqueId];
    v6 = [(FavoriteItem_Inbox *)self displayName];
    id v7 = +[EFPrivacy partiallyRedactedStringForString:v6];
    v8 = +[NSString stringWithFormat:@"%@-%@", v5, v7];
    objc_super v9 = self->_uniqueIDAndDisplayName;
    self->_uniqueIDAndDisplayName = v8;

    uniqueIDAndDisplayName = self->_uniqueIDAndDisplayName;
  }

  return uniqueIDAndDisplayName;
}

- (id)representingMailbox
{
  return [(MailAccount *)self->_account primaryMailboxUid];
}

- (id)dictionaryRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem_Inbox;
  v3 = [(FavoriteItem *)&v7 dictionaryRepresentation];
  unsigned __int8 v4 = [(MailAccount *)self->_account uniqueID];
  if (v4)
  {
    [v3 setObject:v4 forKey:@"uniqueID"];
  }
  else
  {
    unsigned int v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100459B48((uint64_t)self, v5);
    }

    [v3 removeAllObjects];
  }

  return v3;
}

- (FavoriteItem_Inbox)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FavoriteItem_Inbox;
  unsigned int v5 = [(FavoriteItem *)&v12 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 objectForKey:@"uniqueID"];
  if (v6)
  {
    uint64_t v7 = +[MailAccount accountWithUniqueId:v6];
    account = v5->_account;
    v5->_account = (MailAccount *)v7;
  }
  objc_super v9 = v5->_account;

  if (!v9) {
    v10 = 0;
  }
  else {
LABEL_5:
  }
    v10 = v5;

  return v10;
}

- (void)configureOutlineCell:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FavoriteItem_Inbox;
  [(FavoriteItem *)&v8 configureOutlineCell:v4];
  unsigned int v5 = [(FavoriteItem_Inbox *)self representingMailbox];
  v6 = +[NSSet setWithObject:v5];
  [v4 setLegacyMailboxes:v6 showUnreadCount:[self showUnreadCount]];

  uint64_t v7 = [(FavoriteItem_Inbox *)self displayName];
  [v4 setTitle:v7];
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  objc_super v8 = [(FavoriteItem_Inbox *)self representingMailbox];
  [v9 selectMailbox:v8 item:self animated:v6];
}

- (unint64_t)hash
{
  v2 = [(MailAccount *)self->_account uniqueID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)parentItemID
{
  v2 = [(FavoriteItem_Inbox *)self account];
  id v3 = [v2 uniqueID];

  return v3;
}

- (BOOL)acceptsMessageTransfers
{
  return 1;
}

- (id)criterion
{
  v2 = [(FavoriteItem_Inbox *)self representingMailbox];
  id v3 = +[MFMessageCriterion criterionForMailbox:v2];

  return v3;
}

- (id)persistentIDForMigration
{
  return [(MailAccount *)self->_account uniqueID];
}

- (id)analyticsKey
{
  return (id)NSStringFromMailboxUidType();
}

@end