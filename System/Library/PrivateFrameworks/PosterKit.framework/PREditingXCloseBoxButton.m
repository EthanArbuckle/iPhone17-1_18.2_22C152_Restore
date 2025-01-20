@interface PREditingXCloseBoxButton
+ (id)editingTitledButtonSymbolName;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingXCloseBoxButton

+ (id)editingTitledButtonSymbolName
{
  return @"xmark";
}

+ (int64_t)editingTitledButtonType
{
  return 0;
}

@end