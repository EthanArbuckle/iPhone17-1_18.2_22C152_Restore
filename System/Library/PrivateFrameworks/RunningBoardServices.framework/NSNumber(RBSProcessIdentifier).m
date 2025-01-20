@interface NSNumber(RBSProcessIdentifier)
- (BOOL)matchesProcess:()RBSProcessIdentifier;
- (id)processPredicate;
- (uint64_t)rbs_pid;
@end

@implementation NSNumber(RBSProcessIdentifier)

- (uint64_t)rbs_pid
{
  LODWORD(result) = [a1 intValue];
  if ((int)result < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return result;
  }
}

- (BOOL)matchesProcess:()RBSProcessIdentifier
{
  id v4 = a3;
  LODWORD(a1) = objc_msgSend(a1, "rbs_pid");
  int v5 = objc_msgSend(v4, "rbs_pid");

  return a1 == v5;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:a1];
}

@end