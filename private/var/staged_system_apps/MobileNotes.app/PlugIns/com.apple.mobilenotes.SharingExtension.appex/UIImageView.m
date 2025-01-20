@interface UIImageView
+ (id)ic_accessibilityListAccessoryViewImage;
+ (id)ic_defaultListAccessoryViewImage;
@end

@implementation UIImageView

+ (id)ic_defaultListAccessoryViewImage
{
  return +[UIImage ic_systemImageNamed:@"chevron.forward" textStyle:UIFontTextStyleHeadline scale:1];
}

+ (id)ic_accessibilityListAccessoryViewImage
{
  return +[UIImage ic_systemImageNamed:@"chevron.forward.circle.fill" textStyle:UIFontTextStyleHeadline scale:2];
}

@end