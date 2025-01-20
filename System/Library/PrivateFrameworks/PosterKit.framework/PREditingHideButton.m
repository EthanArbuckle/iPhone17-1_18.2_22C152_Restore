@interface PREditingHideButton
+ (id)editingTitledButtonSymbolName:(BOOL)a3;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingHideButton

+ (id)editingTitledButtonSymbolName:(BOOL)a3
{
  if (a3) {
    return @"eye.slash.fill";
  }
  else {
    return @"eye.fill";
  }
}

+ (int64_t)editingTitledButtonType
{
  return 0;
}

@end