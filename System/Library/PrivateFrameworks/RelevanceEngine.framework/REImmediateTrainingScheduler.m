@interface REImmediateTrainingScheduler
- (void)performTask:(id)a3;
@end

@implementation REImmediateTrainingScheduler

- (void)performTask:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

@end