@interface SXMoveInComponentAnimation
- (Class)handlerClass;
- (int64_t)preferredStartingPositionWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXMoveInComponentAnimation

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

- (int64_t)preferredStartingPositionWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"left"])
  {
    int64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"right"])
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

@end