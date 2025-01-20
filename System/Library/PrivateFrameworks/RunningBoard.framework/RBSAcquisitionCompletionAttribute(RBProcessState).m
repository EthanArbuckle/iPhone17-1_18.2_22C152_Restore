@interface RBSAcquisitionCompletionAttribute(RBProcessState)
- (void)applyToAcquisitionContext:()RBProcessState;
@end

@implementation RBSAcquisitionCompletionAttribute(RBProcessState)

- (void)applyToAcquisitionContext:()RBProcessState
{
  id v5 = a3;
  unint64_t v4 = [a1 policy];
  if (v4 > [v5 acquisitionPolicy]) {
    [v5 setAcquisitionPolicy:v4];
  }
}

@end