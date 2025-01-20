@interface RBSProcessExecPathStartsWithPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessExecPathStartsWithPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = [v4 executablePath];
  if (v5
    || ([v4 bundle],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 executablePath],
        v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    v7 = [(RBSProcessStringPredicate *)self identifier];
    char v8 = [v5 hasPrefix:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

@end