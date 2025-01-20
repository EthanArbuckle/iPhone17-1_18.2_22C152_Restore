@interface PREditingPlusButton
+ (id)editingTitledButtonSymbolName;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingPlusButton

+ (id)editingTitledButtonSymbolName
{
  return @"plus";
}

+ (int64_t)editingTitledButtonType
{
  return 0;
}

@end