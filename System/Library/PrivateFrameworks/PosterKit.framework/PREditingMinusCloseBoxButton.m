@interface PREditingMinusCloseBoxButton
+ (id)editingTitledButtonSymbolName;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingMinusCloseBoxButton

+ (id)editingTitledButtonSymbolName
{
  return @"minus";
}

+ (int64_t)editingTitledButtonType
{
  return 0;
}

@end