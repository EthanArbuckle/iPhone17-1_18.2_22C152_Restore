@interface PREditingAddButton
+ (id)editingTitledButtonTitle;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingAddButton

+ (id)editingTitledButtonTitle
{
  v2 = PRBundle();
  v3 = [v2 localizedStringForKey:@"ADD_BUTTON" value:&stru_1ED9A3120 table:@"PosterKit"];

  return v3;
}

+ (int64_t)editingTitledButtonType
{
  return 1;
}

@end