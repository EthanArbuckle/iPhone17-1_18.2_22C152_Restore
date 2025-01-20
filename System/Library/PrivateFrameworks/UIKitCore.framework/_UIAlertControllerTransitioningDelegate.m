@interface _UIAlertControllerTransitioningDelegate
- (UIInteractionProgress)interactionProgressForPresentation;
- (id)_interactionControllerForTransitionOfType:(int64_t)a3 forAlertController:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForPresentation:(id)a3;
- (void)setInteractionProgressForPresentation:(id)a3;
@end

@implementation _UIAlertControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [_UIAlertControllerAnimatedTransitioning alloc];
  v10 = [(_UIAlertControllerTransitioningDelegate *)self interactionProgressForPresentation];
  v11 = [(_UIAlertControllerAnimatedTransitioning *)v9 initWithInteractionProgress:v10];

  v12 = +[UIAlertController _alertControllerContainedInViewController:v8];

  [(_UIAlertControllerAnimatedTransitioning *)v11 setAlertController:v12];
  v13 = [v7 traitCollection];

  [v12 _updateProvidedStyleWithTraitCollection:v13];
  [(_UIAlertControllerAnimatedTransitioning *)v11 setPresentation:1];

  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIAlertControllerAnimatedTransitioning);
  v5 = +[UIAlertController _alertControllerContainedInViewController:v3];

  [(_UIAlertControllerAnimatedTransitioning *)v4 setAlertController:v5];
  [(_UIAlertControllerAnimatedTransitioning *)v4 setPresentation:0];

  return v4;
}

- (id)_interactionControllerForTransitionOfType:(int64_t)a3 forAlertController:(id)a4
{
  id v4 = a4;
  v5 = [v4 _visualStyle];
  v6 = 0;
  if ([v5 transitionOfType:0 shouldBeInteractiveForAlertController:v4])
  {
    v6 = [v5 interactionProgressForTransitionOfType:0 forAlertController:v4];

    if (v6)
    {
      v6 = objc_alloc_init(_UIAlertControllerInteractionController);
      [(_UIAlertControllerInteractionController *)v6 setAlertController:v4];
    }
  }

  return v6;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (has_internal_diagnostics)
  {
    if ((isKindOfClass & 1) == 0)
    {
      v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "UIAlertController is expected to have an animator of type _UIAlertControllerAnimatedTransitioning", buf, 2u);
      }
    }
  }
  else if ((isKindOfClass & 1) == 0)
  {
    v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &interactionControllerForPresentation____s_category) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "UIAlertController is expected to have an animator of type _UIAlertControllerAnimatedTransitioning", v12, 2u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 alertController];
    id v8 = [(_UIAlertControllerTransitioningDelegate *)self _interactionControllerForTransitionOfType:0 forAlertController:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (UIInteractionProgress)interactionProgressForPresentation
{
  return self->interactionProgressForPresentation;
}

- (void)setInteractionProgressForPresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end