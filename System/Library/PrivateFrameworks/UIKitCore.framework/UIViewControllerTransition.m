@interface UIViewControllerTransition
+ (id)coverVerticalTransition;
+ (id)crossDissolveTransition;
+ (id)flipHorizontalTransition;
+ (id)partialCurlTransition;
+ (id)zoomWithOptions:(id)a3 sourceViewProvider:(id)a4;
- (BOOL)_hasOwnInteractiveExitGestureForTraits:(id)a3;
- (BOOL)_isSupportedGivenTraits:(id)a3;
- (id)_transitionControllerForViewController:(id)a3 traits:(id)a4 isAppearing:(BOOL)a5;
- (int64_t)_preferredModalPresentationStyle;
@end

@implementation UIViewControllerTransition

+ (id)zoomWithOptions:(id)a3 sourceViewProvider:(id)a4
{
  return +[_UIZoomViewControllerTransition zoomWithOptions:a3 sourceViewProvider:a4];
}

+ (id)coverVerticalTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:0];
}

+ (id)flipHorizontalTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:1];
}

+ (id)crossDissolveTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:2];
}

+ (id)partialCurlTransition
{
  return +[_UILegacyModalViewControllerTransition transitionWithStyle:3];
}

- (id)_transitionControllerForViewController:(id)a3 traits:(id)a4 isAppearing:(BOOL)a5
{
  return 0;
}

- (BOOL)_hasOwnInteractiveExitGestureForTraits:(id)a3
{
  return 0;
}

- (BOOL)_isSupportedGivenTraits:(id)a3
{
  return 0;
}

- (int64_t)_preferredModalPresentationStyle
{
  return -2;
}

uint64_t __45___UIViewControllerTransition__apiTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained _interactiveDismissShouldBeginHandler];
  if (v5)
  {
    v6 = objc_opt_new();
    [v3 location];
    objc_msgSend(v6, "setLocation:");
    [v3 velocity];
    objc_msgSend(v6, "setVelocity:");
    objc_msgSend(v6, "setProposedBeginState:", objc_msgSend(v3, "willBegin"));
    uint64_t v7 = ((uint64_t (**)(void, void *))v5)[2](v5, v6);
  }
  else
  {
    uint64_t v7 = [v3 willBegin];
  }

  return v7;
}

double __45___UIViewControllerTransition__apiTransition__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _options];
  [v2 frameOfSourceInDestination];
  double v4 = v3;

  return v4;
}

id __45___UIViewControllerTransition__apiTransition__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _viewProvider];
  v6 = [v3 zoomedViewController];

  uint64_t v7 = ((void (**)(void, void *))v5)[2](v5, v6);

  return v7;
}

@end