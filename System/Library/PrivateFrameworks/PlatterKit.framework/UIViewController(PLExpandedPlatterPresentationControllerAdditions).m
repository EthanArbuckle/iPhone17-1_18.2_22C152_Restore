@interface UIViewController(PLExpandedPlatterPresentationControllerAdditions)
- (id)expandedPlatterPresentationController;
@end

@implementation UIViewController(PLExpandedPlatterPresentationControllerAdditions)

- (id)expandedPlatterPresentationController
{
  v1 = objc_msgSend(a1, "pl_presentingPresentationController");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end