@interface SXRepeatableImageFill
- (unint64_t)repeatWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXRepeatableImageFill

- (unint64_t)repeatWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"none"])
    {
      unint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"x"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"y"])
    {
      unint64_t v7 = 2;
    }
    else
    {
      unint64_t v7 = 3;
    }
  }
  else
  {
    unint64_t v7 = 3;
  }

  return v7;
}

@end