@interface WBSPageTestEvaluator
- (BOOL)iOS;
- (BOOL)iPad;
- (BOOL)iPhone;
- (BOOL)macCatalyst;
- (BOOL)macOS;
@end

@implementation WBSPageTestEvaluator

- (BOOL)macOS
{
  return 0;
}

- (BOOL)iOS
{
  return 1;
}

- (BOOL)macCatalyst
{
  return 0;
}

- (BOOL)iPhone
{
  v2 = [NSClassFromString(&cfstr_Uidevice.isa) currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (BOOL)iPad
{
  v2 = [NSClassFromString(&cfstr_Uidevice.isa) currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

@end