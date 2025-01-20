@interface BMEnergyMode(SearchUIExtension)
- (void)getEnabledStatusWithCompletion:()SearchUIExtension;
@end

@implementation BMEnergyMode(SearchUIExtension)

- (void)getEnabledStatusWithCompletion:()SearchUIExtension
{
  id v5 = a3;
  ((void (**)(id, BOOL))a3)[2](v5, [a1 mode] == 1);
}

@end