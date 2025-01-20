@interface HasAttachmentsMailboxController
- (BOOL)shouldBeDisplayed;
- (CGPoint)iconOffset;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation HasAttachmentsMailboxController

- (id)criterion
{
  return +[MFMessageCriterion hasAttachmentsCriterion];
}

- (id)unscopedCountPredicate
{
  v2 = +[EMMessageListItemPredicates predicateForMessagesWithAttachments];
  v3 = +[EMMessageListItemPredicates predicateForUnreadMessages];
  v7[0] = v2;
  v7[1] = v3;
  v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  return v5;
}

- (BOOL)shouldBeDisplayed
{
  return [(SharedMailboxController *)self badgeCount] > 0;
}

- (id)mailboxTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HAS_ATTACHMENTS_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)navigationTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"HAS_ATTACHMENTS_NAVIGATION_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteAttachmentsMailbox;
}

- (id)shortcutIconName
{
  return 0;
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