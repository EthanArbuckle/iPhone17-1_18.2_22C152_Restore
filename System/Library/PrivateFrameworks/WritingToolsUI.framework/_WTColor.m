@interface _WTColor
+ (_WTColor)platformTextColor;
@end

@implementation _WTColor

+ (_WTColor)platformTextColor
{
  v2 = objc_opt_class();

  return (_WTColor *)[v2 grayColor];
}

@end