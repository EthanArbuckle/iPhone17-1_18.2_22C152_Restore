@interface UIEditMenuContentPresentation
@end

@implementation UIEditMenuContentPresentation

void __54___UIEditMenuContentPresentation__displayMenu_reason___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 delegate];
  id v6 = [v5 _editMenuPresentation:*(void *)(a1 + 32) titleViewForMenu:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) _displayPreparedMenu:v4 titleView:v6 reason:*(void *)(a1 + 56) didDismissMenu:*(unsigned __int8 *)(a1 + 64) configuration:*(void *)(a1 + 48)];
}

uint64_t __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionWithEvent:1];
}

void __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = [*(id *)(a1 + 40) presentAnimator];
  [v2 runAnimations];
}

uint64_t __101___UIEditMenuContentPresentation__displayPreparedMenu_titleView_reason_didDismissMenu_configuration___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v6];
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v4 = [*(id *)(a1 + 40) presentAnimator];
  [v4 runAnimations];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 32) dismissAnimator];
  [v2 runAnimations];
}

void __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_2(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.2, 0.2);
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlpha:0.0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layoutIfNeeded];
  long long v3 = [*(id *)(a1 + 32) dismissAnimator];
  [v3 runAnimations];
}

uint64_t __53___UIEditMenuContentPresentation_hideMenuWithReason___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeFromSuperview];
  id v2 = *(void **)(a1 + 32);
  return [v2 transitionWithEvent:3];
}

void __72___UIEditMenuContentPresentation_editMenuListView_didSelectMenuElement___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  char v2 = [a1[4] attributes];
  long long v3 = WeakRetained;
  if ((v2 & 8) == 0)
  {
    id v4 = [WeakRetained displayedMenu];
    CGAffineTransform v5 = v4;
    if (v4 == a1[5])
    {
      uint64_t v6 = [WeakRetained currentState];

      long long v3 = WeakRetained;
      if (v6 != 3) {
        goto LABEL_7;
      }
      [WeakRetained hideMenuWithReason:1];
    }
    else
    {
    }
    long long v3 = WeakRetained;
  }
LABEL_7:
}

void __75___UIEditMenuContentPresentation__reloadMenuLayoutWithSourceRect_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
  [*(id *)(a1 + 40) containerBounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  [*(id *)(a1 + 40) menuPosition];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  [*(id *)(a1 + 40) anchorPoint];
  double v3 = v2;
  double v5 = v4;
  id v6 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v6, "setAnchorPoint:", v3, v5);
}

@end