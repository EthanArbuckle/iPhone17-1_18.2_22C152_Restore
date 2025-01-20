@interface PREditingDoneButton
+ (id)editingTitledButtonTitle;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingDoneButton

+ (id)editingTitledButtonTitle
{
  v2 = PRBundle();
  v3 = [v2 localizedStringForKey:@"DONE_BUTTON" value:&stru_1ED9A3120 table:@"PosterKit"];

  return v3;
}

+ (int64_t)editingTitledButtonType
{
  return 1;
}

@end