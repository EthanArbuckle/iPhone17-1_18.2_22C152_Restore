@interface SXStrokeStyle
- (SXStrokeStyle)styleWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXStrokeStyle

- (SXStrokeStyle)styleWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"solid"])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"dashed"])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"dotted"])
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return (SXStrokeStyle *)v5;
}

@end