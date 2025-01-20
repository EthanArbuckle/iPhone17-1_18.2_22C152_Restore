@interface UIAlertControllerPhoneTVMacView
@end

@implementation UIAlertControllerPhoneTVMacView

void __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke(void *a1)
{
  id v1 = a1;
  [v1 setPresentationContextPrefersCancelActionShown:0];
  [v1 setPresentedAsPopover:1];
  [v1 setHasDimmingView:0];
  [v1 setShouldHaveBackdropView:0];
  [v1 setAlignsToKeyboard:0];
}

void __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke_2(void *a1)
{
  id v1 = a1;
  [v1 setPresentationContextPrefersCancelActionShown:1];
  [v1 setShouldHaveBackdropView:1];
  [v1 setPresentedAsPopover:0];
}

uint64_t __83___UIAlertControllerPhoneTVMacView_interfaceAction_invokeActionHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __96___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActionViewRepresentations__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 648), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) addObject:v3];
}

uint64_t __78___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertObject:a2 atIndex:0];
}

uint64_t __86___UIAlertControllerPhoneTVMacView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 locationInView:*(void *)(a1 + 32)];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "pointInside:withEvent:", 0);
  *a3 = result;
  return result;
}

uint64_t __65___UIAlertControllerPhoneTVMacView__updateActionViewVisualStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisualStyle:*(void *)(a1 + 32)];
}

uint64_t __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateSizeUsingAXEnforcedWidth:*(double *)(a1 + 32)];
}

uint64_t __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateSizeUsingAXEnforcedWidth:*(double *)(a1 + 32)];
}

void __62___UIAlertControllerPhoneTVMacView__updateConstraintConstants__block_invoke(uint64_t a1, void *a2, double a3)
{
  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0.0)
  {
    id v6 = [a2 font];
    [v6 capHeight];
    UIRoundToViewScale(*(void **)(a1 + 32));
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 - v5;
  }
}

uint64_t __77___UIAlertControllerPhoneTVMacView__sizeOfHeaderContentViewControllerChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actionLayoutDirectionChanged];
}

uint64_t __71___UIAlertControllerPhoneTVMacView__sizeOfContentViewControllerChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentViewControllerContainerViewWidthConstraint];
  [v2 setConstant:*(double *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) contentViewControllerContainerViewHeightConstraint];
  [v3 setConstant:*(double *)(a1 + 48)];

  v4 = *(void **)(a1 + 32);
  return [v4 _actionLayoutDirectionChanged];
}

void __104___UIAlertControllerPhoneTVMacView__disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = *(unsigned __int8 *)(a1 + 41);
    id v2 = [*(id *)(a1 + 32) layer];
    [v2 setAllowsGroupOpacity:v1];
  }
}

uint64_t __86___UIAlertControllerPhoneTVMacView_configureForPresentAlongsideTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollInitialActionToVisibleForPresentation];
}

@end