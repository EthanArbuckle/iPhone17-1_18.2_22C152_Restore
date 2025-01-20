@interface NUEmbedData
- (unint64_t)autoPlayMediaWithValue:(id)a3 withType:(int)a4;
@end

@implementation NUEmbedData

- (unint64_t)autoPlayMediaWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"video"])
    {
      unint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"audio"])
    {
      unint64_t v7 = 1;
    }
    else
    {
      unint64_t v7 = [v6 isEqualToString:@"all"] << 63 >> 63;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

@end