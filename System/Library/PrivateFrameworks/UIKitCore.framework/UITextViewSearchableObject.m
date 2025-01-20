@interface UITextViewSearchableObject
@end

@implementation UITextViewSearchableObject

uint64_t __94___UITextViewSearchableObject_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) foundRange:a2 forSearchString:*(void *)(a1 + 40) inDocument:0];
}

uint64_t __88___UITextViewSearchableObject_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __57___UITextViewSearchableObject_clearAllDecoratedFoundText__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained setNeedsLayout];
}

uint64_t __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
}

uint64_t __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 40)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a2 == 0;
  }
  if (!v6 && WeakRetained != 0)
  {
    v8 = *(void **)(a1 + 40);
    if (v8 == (void *)v5[3])
    {
      v10 = v5;
      [v8 removeFromSuperview];
      v9 = (void *)v10[3];
      v10[3] = 0;

      [v10 _ensureSubviewOrder];
      v5 = v10;
    }
  }
}

id __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained(WeakRetained + 9);
  id v3 = WeakRetained[7];
  if (v3
    && ([v2 _fullRange],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v2 _range:v4 containsRange:v3],
        v4,
        v5))
  {
    BOOL v6 = [v2 _targetedPreviewForHighlightRange:v3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:1.0];
}

uint64_t __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
}

void __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v5 + 41)) {
        [*(id *)(v5 + 32) removeFromSuperview];
      }
    }
    [v6 _ensureSubviewOrder];
    id WeakRetained = v6;
  }
}

uint64_t __68___UITextViewSearchableObject__updateHighlightLabelForMatchedRange___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _usesTransientHighlightBehavior];
  if (result)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v3 fadeAwayWithCompletion:0];
  }
  return result;
}

uint64_t __52___UITextViewSearchableObject_layoutManagedSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setContentInset:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(*(void *)(a1 + 32) + 24) setTextRects:*(void *)(a1 + 40)];
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

@end