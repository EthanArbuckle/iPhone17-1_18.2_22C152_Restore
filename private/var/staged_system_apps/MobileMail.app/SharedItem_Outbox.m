@interface SharedItem_Outbox
- (BOOL)_displayNameShouldBeRedacted;
- (SharedItem_Outbox)init;
- (id)displayName;
- (id)itemID;
- (id)itemURLString;
- (void)configureOutlineCell:(id)a3;
- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation SharedItem_Outbox

- (void)configureOutlineCell:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SharedItem_Outbox;
  [(FavoriteItem *)&v7 configureOutlineCell:v4];
  v5 = +[MailAccount outboxMailboxUid];
  v6 = +[NSSet setWithObject:v5];
  [v4 setLegacyMailboxes:v6 showUnreadCount:[self showUnreadCount] unreadCountIncludesRead:1];
}

- (void)wasSelected:(id)a3 indexPath:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  v8 = +[MailAccount outboxMailboxUid];
  [v9 selectMailbox:v8 item:self animated:v6];
}

- (SharedItem_Outbox)init
{
  v3.receiver = self;
  v3.super_class = (Class)SharedItem_Outbox;
  return [(FavoriteItem *)&v3 initWithType:6];
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)displayName
{
  return +[MFMailboxUid specialNameForType:6];
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
    v5 = +[NSString stringWithFormat:@"%@-%ld", collectionID, [(FavoriteItem *)self type]];
    BOOL v6 = self->super._itemID;
    self->super._itemID = v5;

    itemID = self->super._itemID;
  }

  return itemID;
}

- (id)itemURLString
{
  v2 = [(SharedItem_Outbox *)self itemID];
  objc_super v3 = +[NSString stringWithFormat:@"favoriteitem://outbox/%@", v2];

  return v3;
}

@end