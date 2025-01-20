@interface NCLongLookTransitioningDelegate
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4;
- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4;
@end

@implementation NCLongLookTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PLExpandedPlatterTransitioningDelegate *)self _presentationController];

  if (!v11)
  {
    v12 = objc_msgSend(v10, "pl_containingClickPresentationInteractionPresentingViewController");
    v13 = [v12 viewForPreview];
    if (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector())
      {
        v14 = [v8 presenter];
      }
      else
      {
        v14 = 0;
      }
      char v15 = objc_opt_respondsToSelector();
      v16 = v14;
      if (v15 & 1) != 0 || (char v17 = objc_opt_respondsToSelector(), v16 = v8, (v17)) {
        id v18 = v16;
      }
      else {
        id v18 = 0;
      }
      [v8 setDismisser:v18];
    }
    v19 = [[NCLongLookDefaultPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9 sourceViewController:v10 sourceView:v13];
    [(PLExpandedPlatterTransitioningDelegate *)self _setPresentationController:v19];
  }
  v20 = [(PLExpandedPlatterTransitioningDelegate *)self _presentationController];

  return v20;
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend((id)+[NCLongLookTransitioningDelegate superclass](NCLongLookTransitioningDelegate, "superclass"), "instancesRespondToSelector:", sel_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext_))
  {
    v12.receiver = self;
    v12.super_class = (Class)NCLongLookTransitioningDelegate;
    [(PLExpandedPlatterTransitioningDelegate *)&v12 viewControllerAnimator:v6 willBeginPresentationAnimationWithTransitionContext:v7];
  }
  id v8 = [v7 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  id v9 = [v8 transitionCoordinator];
  [v9 animateAlongsideTransition:0 completion:&__block_literal_global_40];

  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  id v10 = *MEMORY[0x1E4FB3750];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3750]))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_PRESENTATION_BEGIN", " enableTelemetry=YES ", v11, 2u);
  }
  kdebug_trace();
}

uint64_t __110__NCLongLookTransitioningDelegate_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke()
{
  v0 = *MEMORY[0x1E4FB3750];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3750]))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_PRESENTATION_END", " enableTelemetry=YES ", v2, 2u);
  }
  return kdebug_trace();
}

- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend((id)+[NCLongLookTransitioningDelegate superclass](NCLongLookTransitioningDelegate, "superclass"), "instancesRespondToSelector:", sel_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext_))
  {
    v12.receiver = self;
    v12.super_class = (Class)NCLongLookTransitioningDelegate;
    [(PLExpandedPlatterTransitioningDelegate *)&v12 viewControllerAnimator:v6 willBeginDismissalAnimationWithTransitionContext:v7];
  }
  id v8 = [v7 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  id v9 = [v8 transitionCoordinator];
  [v9 animateAlongsideTransition:0 completion:&__block_literal_global_12_0];

  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  id v10 = *MEMORY[0x1E4FB3750];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3750]))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_DISMISSAL_BEGIN", " enableTelemetry=YES ", v11, 2u);
  }
  kdebug_trace();
}

uint64_t __107__NCLongLookTransitioningDelegate_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke()
{
  v0 = *MEMORY[0x1E4FB3750];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3750]))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_LONG_LOOK_DISMISSAL_END", " enableTelemetry=YES ", v2, 2u);
  }
  return kdebug_trace();
}

@end