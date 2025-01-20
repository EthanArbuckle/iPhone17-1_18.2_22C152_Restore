@interface FlagColorMailboxController
- (BOOL)shouldBeDisplayed;
- (CGPoint)iconOffset;
- (FlagColorMailboxController)initWithType:(unint64_t)a3;
- (FlagColorMailboxController)initWithType:(unint64_t)a3 flagColor:(unint64_t)a4;
- (id)criterion;
- (id)iconImageName;
- (id)iconTintColor;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
- (unint64_t)flagColor;
@end

@implementation FlagColorMailboxController

- (FlagColorMailboxController)initWithType:(unint64_t)a3
{
}

- (FlagColorMailboxController)initWithType:(unint64_t)a3 flagColor:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FlagColorMailboxController;
  result = [(SharedMailboxController *)&v6 initWithType:a3];
  if (result) {
    result->_flagColor = a4;
  }
  return result;
}

- (id)unscopedCountPredicate
{
  unint64_t v2 = [(FlagColorMailboxController *)self flagColor];

  return +[EMMessageListItemPredicates predicateForFlagColor:v2];
}

- (id)criterion
{
  unint64_t v2 = [(FlagColorMailboxController *)self flagColor];

  return +[MFMessageCriterion criterionForFlagColor:v2];
}

- (BOOL)shouldBeDisplayed
{
  return [(SharedMailboxController *)self badgeCount] > 0;
}

- (id)mailboxTitle
{
  unint64_t v2 = [(FlagColorMailboxController *)self flagColor];
  if (v2 > 6)
  {
    v5 = 0;
  }
  else
  {
    v3 = off_100607080[v2];
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:v3 value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)navigationTitle
{
  unint64_t v2 = [(FlagColorMailboxController *)self flagColor];
  if (v2 > 6)
  {
    v5 = 0;
  }
  else
  {
    v3 = off_1006070B8[v2];
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:v3 value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteFlagColorMailbox;
}

- (id)iconTintColor
{
  unint64_t v2 = [(FlagColorMailboxController *)self flagColor];

  return +[UIColor mf_colorFromFlagColor:v2];
}

- (id)shortcutIconName
{
  return MFImageGlyphFavoriteFlagColorMailbox;
}

- (CGPoint)iconOffset
{
  double v2 = 3.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (unint64_t)flagColor
{
  return self->_flagColor;
}

@end