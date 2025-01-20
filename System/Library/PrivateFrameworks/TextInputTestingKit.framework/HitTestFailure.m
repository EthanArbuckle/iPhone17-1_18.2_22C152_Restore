@interface HitTestFailure
- (BOOL)doesMatchResult:(id)a3;
@end

@implementation HitTestFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 inserted];
  v5 = [v4 componentsJoinedByString:&stru_26F2B7E50];

  v6 = [v3 intended];

  v7 = [v6 componentsJoinedByString:&stru_26F2B7E50];

  LOBYTE(v6) = [v5 isEqualToString:v7];
  return (char)v6;
}

@end