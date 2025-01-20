@interface UIInterfaceActionRepresentationViewSpringLoadedBehavior
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
@end

@implementation UIInterfaceActionRepresentationViewSpringLoadedBehavior

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  v4 = [a3 view];
  v5 = [v4 action];
  char v6 = [v5 isEnabled];

  return v6;
}

@end