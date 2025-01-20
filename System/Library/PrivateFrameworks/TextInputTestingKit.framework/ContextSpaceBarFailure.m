@interface ContextSpaceBarFailure
- (BOOL)doesMatchResult:(id)a3;
@end

@implementation ContextSpaceBarFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 corrected];
  v5 = [v4 componentsJoinedByString:&stru_26F2B7E50];

  v6 = [v3 intended];
  v7 = [v6 componentsJoinedByString:&stru_26F2B7E50];

  if ([v5 isEqualToString:v7])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v9 = [v3 context];
    int v8 = [v9 hasSuffix:@" "] ^ 1;
  }
  return v8;
}

@end