@interface RBSProcessReportedProcesses
+ (id)reportedPredicate;
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessReportedProcesses

- (BOOL)matchesProcess:(id)a3
{
  return [a3 isReported];
}

+ (id)reportedPredicate
{
  v2 = objc_alloc_init(RBSProcessReportedProcesses);
  v3 = +[RBSProcessPredicate predicateMatching:v2];

  return v3;
}

@end