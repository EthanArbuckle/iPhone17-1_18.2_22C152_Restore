@interface UITableViewCell(MTUIStyling)
- (void)setSelectedBackgroundColor:()MTUIStyling;
@end

@implementation UITableViewCell(MTUIStyling)

- (void)setSelectedBackgroundColor:()MTUIStyling
{
  id v5 = a3;
  if (v5) {
    v4 = objc_opt_new();
  }
  else {
    v4 = 0;
  }
  [v4 setBackgroundColor:v5];
  [a1 setSelectedBackgroundView:v4];
}

@end