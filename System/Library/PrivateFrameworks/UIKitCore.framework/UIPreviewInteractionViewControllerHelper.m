@interface UIPreviewInteractionViewControllerHelper
@end

@implementation UIPreviewInteractionViewControllerHelper

void __140___UIPreviewInteractionViewControllerHelper_presentViewControllerFromViewController_highlighter_presentationCompletion_dismissalCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performPresentViewControllerFromViewController:*(void *)(a1 + 32)];
}

id __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) interactiveHighlightEffect];
  v2 = [v1 environment];
  v3 = [v2 contentView];

  return v3;
}

void __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((void *)WeakRetained + 9))
    {
      v5 = WeakRetained;
      [*(id *)(a1 + 32) _animateAlongsideViewControllerPresentationDismiss];
      [*(id *)(a1 + 32) _viewControllerPresentationDidEnd];
      [v5 _finalizeAfterViewControllerPresentation];
      [v5 _performDismissalCompletionIfNeeded];
      v3 = v5;
      v4 = *(void **)(a1 + 32);
      if (v4)
      {
        [v4 _delayedViewControllerPresentationDidCancel];
        v3 = v5;
      }
    }
  }
}

uint64_t __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareTransitionFromView:*(void *)(a1 + 40) toView:*(void *)(a1 + 48) containerView:*(void *)(a1 + 56)];
}

uint64_t __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72)) {
    [*(id *)(*(void *)(a1 + 32) + 8) _animateAlongsideViewControllerPresentationDismiss];
  }
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  return [v2 performTransitionFromView:v3 toView:v4 containerView:v5];
}

void __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained[9];
    if (v3 == *(id *)(a1 + 32))
    {
      uint64_t v5 = WeakRetained;
      objc_msgSend(v3, "completeTransition:", objc_msgSend(v3, "transitionWasCancelled") ^ 1);
      objc_msgSend(*(id *)(a1 + 40), "transitionDidEnd:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
      if (!*(unsigned char *)(a1 + 56))
      {
        [v5[1] _viewControllerPresentationDidEnd];
        [v5 _finalizeAfterViewControllerPresentation];
        [v5 _performDismissalCompletionIfNeeded];
      }
      id v4 = v5[9];
      v5[9] = 0;

      id WeakRetained = v5;
    }
  }
}

uint64_t __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93___UIPreviewInteractionViewControllerHelper__performPresentViewControllerFromViewController___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _finalizeAfterViewControllerPresentation];
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

id __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained presentedViewController];
  int v5 = [v4 isBeingPresented];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) effectView];
  }
  else
  {
    id v7 = objc_loadWeakRetained(v2);
    v6 = [v7 contentPlatterView];
  }
  return v6;
}

id __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained presentedViewController];
  int v5 = [v4 isBeingPresented];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    id v7 = [v6 contentPlatterView];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) effectView];
  }
  return v7;
}

id __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)
    || ([*(id *)(a1 + 32) portalView],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 setHidesSourceView:0],
        [v2 setHidden:1],
        v2,
        !*(unsigned char *)(a1 + 56)))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [WeakRetained presentedViewController];
    if ([v4 isBeingPresented])
    {

LABEL_6:
      id v6 = [*(id *)(a1 + 32) effectView];
      goto LABEL_8;
    }
    int v5 = *(unsigned __int8 *)(a1 + 57);

    if (v5) {
      goto LABEL_6;
    }
  }
  id v6 = *(id *)(a1 + 40);
LABEL_8:
  return v6;
}

id __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained presentedViewController];
  if ([v3 isBeingPresented])
  {

LABEL_5:
    id v5 = *(id *)(a1 + 32);
    goto LABEL_6;
  }
  int v4 = *(unsigned __int8 *)(a1 + 57);

  if (v4) {
    goto LABEL_5;
  }
  id v5 = [*(id *)(a1 + 40) effectView];
LABEL_6:
  return v5;
}

@end