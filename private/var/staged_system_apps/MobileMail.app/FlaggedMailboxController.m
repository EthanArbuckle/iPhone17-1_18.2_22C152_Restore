@interface FlaggedMailboxController
- (BOOL)shouldBeDisplayed;
- (CGPoint)iconOffset;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation FlaggedMailboxController

- (id)criterion
{
  return +[MFMessageCriterion flaggedMessageCriterion];
}

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForFlaggedMessages];
}

- (BOOL)shouldBeDisplayed
{
  return [(SharedMailboxController *)self badgeCount] > 0;
}

- (id)mailboxTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"FLAGGED_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)navigationTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"FLAGGED_NAVIGATION_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteFlaggedMailbox;
}

- (id)shortcutIconName
{
  return MFImageGlyphFavoriteFlaggedMailbox;
}

- (CGPoint)iconOffset
{
  double v2 = 3.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end