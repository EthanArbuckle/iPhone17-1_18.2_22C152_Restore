@interface RCDeleteButton
- (id)_accessibilityIdentifier;
- (id)_accessibilityLabel;
- (id)_largeContentTitle;
- (id)_title;
@end

@implementation RCDeleteButton

- (id)_title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EDIT_MODE_DELETE_BUTTON_TITLE" value:&stru_100228BC8 table:0];

  return v3;
}

- (id)_accessibilityLabel
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EDIT_MODE_DELETE_BUTTON_TITLE" value:&stru_100228BC8 table:0];

  return v3;
}

- (id)_accessibilityIdentifier
{
  return @"Delete selection button";
}

- (id)_largeContentTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EDIT_MODE_DELETE_BUTTON_TITLE" value:&stru_100228BC8 table:0];

  return v3;
}

@end