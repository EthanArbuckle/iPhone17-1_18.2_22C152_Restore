@interface INDeleteTasksIntent
- (BOOL)rem_all;
@end

@implementation INDeleteTasksIntent

- (BOOL)rem_all
{
  v2 = [(INDeleteTasksIntent *)self all];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

@end