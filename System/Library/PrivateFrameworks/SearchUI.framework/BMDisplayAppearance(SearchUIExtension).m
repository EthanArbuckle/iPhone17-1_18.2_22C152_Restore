@interface BMDisplayAppearance(SearchUIExtension)
- (void)getEnabledStatusWithCompletion:()SearchUIExtension;
@end

@implementation BMDisplayAppearance(SearchUIExtension)

- (void)getEnabledStatusWithCompletion:()SearchUIExtension
{
  id v5 = a3;
  ((void (**)(id, BOOL))a3)[2](v5, [a1 state] == 2);
}

@end