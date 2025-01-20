@interface IncludesMeMailboxController
- (BOOL)shouldBeDisplayed;
- (CGPoint)iconOffset;
- (id)_iconImageWithBackgroundColor:(id)a3;
- (id)applicationShortcutIconImage;
- (id)criterion;
- (id)iconImage;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
- (void)invalidateIcon;
@end

@implementation IncludesMeMailboxController

- (id)criterion
{
  return +[MFMessageCriterion includesMeCriterion];
}

- (id)unscopedCountPredicate
{
  v2 = +[EMMessageListItemPredicates predicateForIncludesMeMessages];
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
  v3 = [v2 localizedStringForKey:@"INCLUDES_ME_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)navigationTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"INCLUDES_ME_NAVIGATION_TITLE" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImage
{
  v3 = (void *)qword_100699510;
  if (!qword_100699510)
  {
    v4 = +[UIColor labelColor];
    uint64_t v5 = [(IncludesMeMailboxController *)self _iconImageWithBackgroundColor:v4];
    v6 = (void *)qword_100699510;
    qword_100699510 = v5;

    v3 = (void *)qword_100699510;
  }

  return v3;
}

- (id)applicationShortcutIconImage
{
  v3 = (void *)qword_100699518;
  if (!qword_100699518)
  {
    v4 = +[UIColor labelColor];
    uint64_t v5 = [(IncludesMeMailboxController *)self _iconImageWithBackgroundColor:v4];
    v6 = (void *)qword_100699518;
    qword_100699518 = v5;

    v3 = (void *)qword_100699518;
  }

  return v3;
}

- (id)shortcutIconName
{
  return 0;
}

- (id)_iconImageWithBackgroundColor:(id)a3
{
  id v3 = a3;
  v4 = +[UIApplication sharedApplication];
  uint64_t v5 = [v4 preferredContentSizeCategory];

  double v6 = sub_10013634C(2, v5, 36.0);
  double v7 = sub_10013634C(3, v5, 36.0);
  if (v6 < v7) {
    double v6 = v7;
  }
  v8 = +[NSBundle mainBundle];
  v9 = sub_100135D98(2, v5, v8, v3, 0, v6);

  v10 = +[NSBundle mainBundle];
  v11 = sub_100135D98(3, v5, v10, v3, 0, v6);

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
  [v11 drawInRect:CGRectMake(CGRectZero.origin.x, y + v20 + 2.0, v16, v18)];
  v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v21;
}

- (CGPoint)iconOffset
{
  double v2 = 0.0;
  double v3 = -2.0;
  result.double y = v3;
  result.x = v2;
  return result;
}

- (void)invalidateIcon
{
  v4.receiver = self;
  v4.super_class = (Class)IncludesMeMailboxController;
  [(SharedMailboxController *)&v4 invalidateIcon];
  double v2 = (void *)qword_100699510;
  qword_100699510 = 0;

  double v3 = (void *)qword_100699518;
  qword_100699518 = 0;
}

@end