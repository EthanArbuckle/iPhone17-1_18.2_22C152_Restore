@interface PREditingNextButton
+ (id)editingTitledButtonTitle;
+ (int64_t)editingTitledButtonType;
@end

@implementation PREditingNextButton

+ (id)editingTitledButtonTitle
{
  v2 = PRBundle();
  v3 = [v2 localizedStringForKey:@"NEXT_BUTTON" value:&stru_1ED9A3120 table:@"PosterKit"];

  return v3;
}

+ (int64_t)editingTitledButtonType
{
  return 1;
}

@end