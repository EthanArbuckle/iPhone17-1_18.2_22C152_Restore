@interface UIResilientRemoteViewContainerViewController
@end

@implementation UIResilientRemoteViewContainerViewController

void __78___UIResilientRemoteViewContainerViewController_initWithExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      v11 = [WeakRetained waitingController];
      [v11 stopSpinner];

      [v10 _displayError:v8];
    }
    else
    {
      objc_storeStrong(WeakRetained + 122, a3);
      [v10 setExtensionRequestIdentifier:v12];
      if (!*((unsigned char *)v10 + 984)) {
        [v10 _displayRemoteViewController];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v10 _endDelayingPresentation];
}

void __63___UIResilientRemoteViewContainerViewController__displayError___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

@end