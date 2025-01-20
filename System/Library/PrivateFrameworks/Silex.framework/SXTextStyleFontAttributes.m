@interface SXTextStyleFontAttributes
- (unint64_t)weightLabelWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXTextStyleFontAttributes

- (unint64_t)weightLabelWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  unint64_t v7 = 0;
  if (v5 && a4 == 3)
  {
    if ([v5 isEqualToString:@"bolder"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"lighter"])
    {
      unint64_t v7 = 2;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

@end