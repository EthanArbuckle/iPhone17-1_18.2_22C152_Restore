@interface UITextLayoutCanvasView
@end

@implementation UITextLayoutCanvasView

void __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_UITextViewportLayoutControllerDidLayout" object:*(void *)(*(void *)(a1 + 32) + 408)];
}

uint64_t __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) layoutViewport];
}

void __50___UITextLayoutCanvasView__performViewportLayout___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_UITextViewportLayoutControllerWillLayout" object:*(void *)(*(void *)(a1 + 32) + 408)];
}

uint64_t __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutManagedSubviews];
}

void __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setContainerOrigin:", v3, v4);
  objc_msgSend(v5, "setContainerSize:", a1[6], a1[7]);
  objc_msgSend(v5, "setClipRect:", a1[8], a1[9], a1[10], a1[11]);
}

void __70___UITextLayoutCanvasView_setTextEmphasisBackgroundView_withTextView___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v16 = a7;
  v12 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (v16 && WeakRetained)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 40));
    id v15 = objc_loadWeakRetained(v12);
    objc_msgSend(v14, "_updateTextEmphasisBackgroundViewForTextRange:inTextView:bounds:", v16, v15, a2, a3, a4, a5);
  }
}

uint64_t __91___UITextLayoutCanvasView__updateTextEmphasisBackgroundViewForTextRange_inTextView_bounds___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke_2(double *a1, void *a2)
{
  double v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[6];
  double v5 = a1[7];
  double v6 = a1[8];
  double v7 = a1[9];
  id v8 = a2;
  objc_msgSend(v3, "didLayoutTextAttachmentView:inFragmentRect:", v8, v4, v5, v6, v7);
  [*(id *)(*((void *)a1 + 5) + 440) addObject:v8];
}

void __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  double v4 = [a2 representedRange];
  double v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double v7 = *(void **)(v6 + 40);
  if (v3)
  {
    uint64_t v8 = [v4 textRangeByFormingUnionWithTextRange:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    double v7 = v5;
  }
  else
  {
    *(void *)(v6 + 40) = v4;
  }
}

uint64_t __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_2;
  v3[3] = &unk_1E52EF4C0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 endLayoutWithConsumer:v3];
}

void __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 424) objectForKey:a2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_3;
  v9[3] = &unk_1E52EF498;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  [v8 performChanges:v9];
}

uint64_t __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithSurface:*(void *)(a1 + 40)];
}

void __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  double v4 = [a2 representedRange];
  id v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  if (v3)
  {
    uint64_t v8 = [v4 textRangeByFormingUnionWithTextRange:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v7 = v5;
  }
  else
  {
    *(void *)(v6 + 40) = v4;
  }
}

void __64___UITextLayoutCanvasView_invalidateTemporaryAttributesInRange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 customRenderController];
  [v4 invalidateTemporaryAttributesInRange:v3];
}

@end