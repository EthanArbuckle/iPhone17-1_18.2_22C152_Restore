@interface UnreadMailboxController
- (BOOL)shouldBeDisplayed;
- (CGPoint)iconOffset;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)serverCountMailboxScope;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation UnreadMailboxController

- (id)criterion
{
  return +[MFMessageCriterion unreadMessageCriterion];
}

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForUnreadMessages];
}

- (id)serverCountMailboxScope
{
  v2 = [(SharedMailboxController *)self mailbox];
  v3 = [v2 mailboxScope];

  return v3;
}

- (BOOL)shouldBeDisplayed
{
  return [(SharedMailboxController *)self badgeCount] > 0;
}

- (id)mailboxTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"UNREAD_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)navigationTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"UNREAD_NAVIGATION_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteUnreadMailbox;
}

- (id)shortcutIconName
{
  return MFImageGlyphFavoriteUnreadMailbox;
}

- (CGPoint)iconOffset
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end