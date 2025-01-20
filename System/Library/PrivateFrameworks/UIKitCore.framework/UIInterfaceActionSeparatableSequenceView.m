@interface UIInterfaceActionSeparatableSequenceView
@end

@implementation UIInterfaceActionSeparatableSequenceView

uint64_t __113___UIInterfaceActionSeparatableSequenceView__withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:*(void *)(a1 + 40)];
}

void __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 456);
  id v3 = a2;
  [v2 removeArrangedSubview:v3];
  [v3 removeFromSuperview];
}

void __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke_14(uint64_t a1, void *a2, unint64_t a3)
{
  id v14 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "addArrangedSubview:");
  if (*(void *)(a1 + 64) - 1 <= a3)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v5 = [v14 sectionID];
    v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 + 1];
    v7 = [v6 sectionID];

    uint64_t v8 = [v7 isEqualToString:v5] ^ 1;
    [*(id *)(a1 + 32) _addSeparatorToStackAndMutableArray:*(void *)(a1 + 48) preferSectionStyle:v8];
    if (v8)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 48) lastObject];
    }
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = v10;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    objc_msgSend(v10, "addObject:");
  }
  if (v9) {
    [v11 addObject:v9];
  }
  [v14 setViewsToDisappearWhenHighlighted:v11];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
}

uint64_t __78___UIInterfaceActionSeparatableSequenceView__updateSeparatorConstantSizedAxis__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setConstantSizedAxis:*(void *)(a1 + 32)];
}

uint64_t __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _markRoundedCornerPositionOnAllCornersOfView:a2];
}

uint64_t __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _markRoundedCornerPositionOnNoCornersOfView:a2];
}

@end