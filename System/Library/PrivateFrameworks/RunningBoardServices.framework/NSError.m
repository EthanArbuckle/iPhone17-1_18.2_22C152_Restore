@interface NSError
- (BOOL)rbs_isServiceDenied;
@end

@implementation NSError

- (BOOL)rbs_isServiceDenied
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    v2 = [a1 domain];
    if ([v2 isEqualToString:@"RBSServiceErrorDomain"]) {
      BOOL v1 = [(id)v1 code] == 1;
    }
    else {
      BOOL v1 = 0;
    }
  }
  return v1;
}

@end