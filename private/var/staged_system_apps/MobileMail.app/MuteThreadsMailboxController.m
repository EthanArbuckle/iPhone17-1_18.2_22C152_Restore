@interface MuteThreadsMailboxController
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)shortcutIconName;
- (id)unreadCriterion;
- (id)unscopedCountPredicate;
@end

@implementation MuteThreadsMailboxController

- (id)unreadCriterion
{
  v2 = [(MuteThreadsMailboxController *)self criterion];
  v3 = +[NSUserDefaults em_userDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:DisableThreadingKey];

  if ((v4 & 1) == 0) {
    [v2 setIncludeRelatedMessages:1];
  }

  return v2;
}

- (id)criterion
{
  return +[MFMessageCriterion threadMuteMessageCriterion];
}

- (id)unscopedCountPredicate
{
  v2 = +[EMMessageListItemPredicates predicateForMuteMessages];
  v3 = +[EMMessageListItemPredicates predicateForUnreadMessages];
  v7[0] = v2;
  v7[1] = v3;
  unsigned __int8 v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  return v5;
}

- (id)mailboxTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"MUTED_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)navigationTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"MUTED_NAVIGATION_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteMuteThreadMailbox;
}

- (id)shortcutIconName
{
  return @"MFInboxFavoriteIcon";
}

@end