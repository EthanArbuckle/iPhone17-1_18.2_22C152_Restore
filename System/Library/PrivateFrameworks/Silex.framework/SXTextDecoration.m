@interface SXTextDecoration
- (int)styleWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXTextDecoration

- (int)styleWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"solid"])
  {
    int v5 = 0;
  }
  else if ([v4 isEqualToString:@"dashed"])
  {
    int v5 = 1;
  }
  else if ([v4 isEqualToString:@"dotted"])
  {
    int v5 = 2;
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

@end