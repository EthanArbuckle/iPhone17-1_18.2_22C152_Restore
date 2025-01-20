@interface GEORoadDescription
- (UIColor)accentColor;
@end

@implementation GEORoadDescription

- (UIColor)accentColor
{
  switch([(GEORoadDescription *)self navigationFriendliness])
  {
    case 0u:
    case 1u:
      v2 = +[UIColor systemRedColor];
      break;
    case 2u:
      v2 = +[UIColor systemOrangeColor];
      break;
    case 3u:
      v2 = +[UIColor systemGreenColor];
      break;
    default:
      v2 = +[UIColor systemBackgroundColor];
      break;
  }

  return (UIColor *)v2;
}

@end