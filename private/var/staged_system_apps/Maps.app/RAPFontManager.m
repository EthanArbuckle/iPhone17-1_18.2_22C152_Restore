@interface RAPFontManager
+ (id)mapDescriptionView;
+ (id)regularTitleFont;
+ (id)tableFooterViewFont;
+ (id)tableHeaderViewButtonFont;
+ (id)tableHeaderViewFont;
+ (id)userInfoTableViewCellPrimaryLabelFont;
+ (id)userInfoTableViewCellSecondaryLabelFont;
@end

@implementation RAPFontManager

+ (id)tableHeaderViewFont
{
  return +[UIFont system16];
}

+ (id)tableHeaderViewButtonFont
{
  return +[UIFont system13Adaptive];
}

+ (id)regularTitleFont
{
  return +[UIFont system17];
}

+ (id)mapDescriptionView
{
  return +[UIFont system15];
}

+ (id)tableFooterViewFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
}

+ (id)userInfoTableViewCellPrimaryLabelFont
{
  return +[UIFont system17];
}

+ (id)userInfoTableViewCellSecondaryLabelFont
{
  return +[UIFont system15];
}

@end