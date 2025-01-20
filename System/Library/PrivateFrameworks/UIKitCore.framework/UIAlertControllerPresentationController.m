@interface UIAlertControllerPresentationController
@end

@implementation UIAlertControllerPresentationController

uint64_t __95___UIAlertControllerPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateConstraintsIfNecessary];
}

uint64_t __74___UIAlertControllerPresentationController__prepareConstraintsIfNecessary__block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() positionContentsOfAlertController:*(void *)(a1 + 40) alertContentView:*(void *)(a1 + 48) availableSpaceView:*(void *)(a1 + 56) visualStyle:*(void *)(a1 + 32) updatableConstraints:*(void *)(*(void *)(a1 + 64) + 376)];
  objc_msgSend(*(id *)(a1 + 40), "_setShouldReverseActions:", objc_msgSend(*(id *)(a1 + 32), "_shouldReverseActions"));
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 64) containerView];
  [v2 contentInsetsForContainerView:v3];
  double v5 = v4;
  double v7 = v6;

  v8 = [*(id *)(a1 + 48) topAnchor];
  v9 = [*(id *)(a1 + 56) topAnchor];
  uint64_t v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9 constant:v5];
  uint64_t v11 = *(void *)(a1 + 64);
  v12 = *(void **)(v11 + 384);
  *(void *)(v11 + 384) = v10;

  v13 = [*(id *)(a1 + 48) bottomAnchor];
  v14 = [*(id *)(a1 + 56) bottomAnchor];
  uint64_t v15 = [v13 constraintLessThanOrEqualToAnchor:v14 constant:-v7];
  uint64_t v16 = *(void *)(a1 + 64);
  v17 = *(void **)(v16 + 392);
  *(void *)(v16 + 392) = v15;

  [*(id *)(a1 + 72) addObject:*(void *)(*(void *)(a1 + 64) + 384)];
  [*(id *)(a1 + 72) addObject:*(void *)(*(void *)(a1 + 64) + 392)];
  uint64_t v19 = *(void *)(a1 + 72);
  v18 = *(void **)(a1 + 80);
  return [v18 addConstraints:v19];
}

@end