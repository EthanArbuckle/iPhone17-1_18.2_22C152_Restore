@interface USDailyLimit
- (BOOL)validateBudget:(id *)a3 error:(id *)a4;
@end

@implementation USDailyLimit

- (BOOL)validateBudget:(id *)a3 error:(id *)a4
{
  id v4 = *a3;
  if (!*a3)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"USDailyLimit.m" lineNumber:21 description:@"Tried to set a nil budget!"];

    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:1024 userInfo:0];
    }
  }
  return v4 != 0;
}

@end