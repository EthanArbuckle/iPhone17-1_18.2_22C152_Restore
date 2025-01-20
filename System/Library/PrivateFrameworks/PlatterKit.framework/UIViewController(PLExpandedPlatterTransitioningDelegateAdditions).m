@interface UIViewController(PLExpandedPlatterTransitioningDelegateAdditions)
- (id)pl_containingClickPresentationInteractionPresentingViewController;
@end

@implementation UIViewController(PLExpandedPlatterTransitioningDelegateAdditions)

- (id)pl_containingClickPresentationInteractionPresentingViewController
{
  id v1 = a1;
  if (v1)
  {
    while (![v1 conformsToProtocol:&unk_1F337DDB8])
    {
      v2 = [v1 parentViewController];

      id v1 = v2;
      if (!v2) {
        goto LABEL_7;
      }
    }
    id v1 = v1;
    v2 = v1;
  }
  else
  {
    v2 = 0;
  }
LABEL_7:

  return v1;
}

@end