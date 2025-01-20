@interface UIStackedImageContainerLayer
@end

@implementation UIStackedImageContainerLayer

void __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v18 = a1;
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v13 = a2;
  double v14 = a3 + a5 * 0.5;
  double v15 = a4 + a6 * 0.5;
  v16 = [v18 delegate];
  v17 = [v13 _preferredLayoutDelegateForLayer:v18];

  [v18 setDelegate:v17];
  if (_IsKindOfUIView((uint64_t)v16))
  {
    objc_msgSend(v16, "setBounds:", v12, v11, a5, a6);
    objc_msgSend(v16, "setCenter:", v14, v15);
  }
  else
  {
    objc_msgSend(v18, "setBounds:", v12, v11, a5, a6);
    objc_msgSend(v18, "setPosition:", v14, v15);
  }
  [v18 setDelegate:v16];
}

void __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v34 = a1;
  double v11 = (double *)MEMORY[0x1E4F1DAD8];
  id v12 = a2;
  double v13 = a3 + a5 * 0.5;
  double v14 = a4 + a6 * 0.5;
  uint64_t v15 = [v34 superlayer];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v34 superlayer];
    [v17 size];
    double v19 = v18;
    double v21 = v20;
    double v22 = *MEMORY[0x1E4F1DB30];
    double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    if (v19 != v22 || v21 != v23)
    {
      v25 = [v34 superlayer];
      [v25 size];
      double v27 = v26;
      double v29 = v28;

      double v13 = v27 * 0.5;
      double v14 = v29 * 0.5;
    }
  }
  double v31 = *v11;
  double v30 = v11[1];
  v32 = [v34 delegate];
  v33 = [v12 _preferredLayoutDelegateForLayer:v34];

  [v34 setDelegate:v33];
  if (_IsKindOfUIView((uint64_t)v32))
  {
    objc_msgSend(v32, "setBounds:", v31, v30, a5, a6);
    objc_msgSend(v32, "setCenter:", v13, v14);
  }
  else
  {
    objc_msgSend(v34, "setBounds:", v31, v30, a5, a6);
    objc_msgSend(v34, "setPosition:", v13, v14);
  }
  [v34 setDelegate:v32];
}

void __57___UIStackedImageContainerLayer__layerStackObservingKeys__block_invoke()
{
  v0 = (void *)qword_1EB25E860;
  qword_1EB25E860 = (uint64_t)&unk_1ED3F19A8;
}

uint64_t __63___UIStackedImageContainerLayer__updateRadiosityFromLayerStack__block_invoke(uint64_t result, uint64_t a2, double a3, double a4)
{
  uint64_t v6 = *(void *)(result + 32);
  if (*(double *)(result + 40) == *(double *)(v6 + 112))
  {
    uint64_t v7 = result;
    [*(id *)(v6 + 232) setContents:a2];
    v8 = (double *)(*(void *)(v7 + 32) + 72);
    double *v8 = a3;
    v8[1] = a4;
    *(unsigned char *)(*(void *)(v7 + 32) + 88) = 1;
    v9 = *(void **)(v7 + 32);
    return [v9 setNeedsLayout];
  }
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _resetAnimatingToNormalState];
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 33) = 0;
  return result;
}

uint64_t __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_4(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[154])
  {
    [*(id *)(a1 + 32) _setLayerStackInflated:1 seed:*(void *)(a1 + 48)];
    v2 = *(unsigned char **)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 _updateLayerForSelectionWithAnimationCoordinator:WeakRetained];

  [*(id *)(*(void *)(a1 + 32) + 408) alpha];
  BOOL v5 = v4 == 0.0;
  double v6 = 1.0;
  if (!v5) {
    double v6 = 0.0;
  }
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 408);
  return [v7 setAlpha:v6];
}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke()
{
  id v1 = +[UITraitCollection traitCollectionWithTraits:&__block_literal_global_230];
  id v0 = +[UIImage _kitImageNamed:@"UILayeredImageSpecularHighlight" withTrait:v1];
  qword_1EB25E868 = (uint64_t)CGImageRetain((CGImageRef)[v0 CGImage]);
}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setUserInterfaceIdiom:2];
  [v2 setDisplayScale:1.0];
  [v2 setDisplayGamut:0];
}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke_3()
{
  id v1 = +[UITraitCollection traitCollectionWithTraits:&__block_literal_global_238_3];
  id v0 = +[UIImage _kitImageNamed:@"UILayeredImageSpecularHighlight" withTrait:v1];
  qword_1EB25E878 = (uint64_t)CGImageRetain((CGImageRef)[v0 CGImage]);
}

void __61___UIStackedImageContainerLayer__updateSpecularLayerContents__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setUserInterfaceIdiom:2];
  [v2 setDisplayScale:2.0];
  [v2 setDisplayGamut:1];
}

void __47___UIStackedImageContainerLayer__setFlatImage___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) setContents:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (*(void *)(a1 + 40) == *(void *)(v2 + 176))
  {
    double v4 = [(id)v2 _imageStackContentsGravity];
    [v3 setContentsGravity:v4];
  }
  else
  {
    [*(id *)(v2 + 216) setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 216);
  if (*(void *)(v5 + 176))
  {
    [*(id *)(v5 + 216) setBackgroundColor:0];
  }
  else
  {
    uint64_t v7 = [*(id *)(v5 + 416) placeholderImage];
    if (v7)
    {
      uint64_t v8 = 0;
    }
    else
    {
      if (qword_1EB25E8A0 != -1) {
        dispatch_once(&qword_1EB25E8A0, &__block_literal_global_510_1);
      }
      uint64_t v8 = qword_1EB25E898;
    }
    [v6 setBackgroundColor:v8];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 240);
  double v11 = [*(id *)(v9 + 416) placeholderImage];
  if (v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    if (qword_1EB25E8A0 != -1) {
      dispatch_once(&qword_1EB25E8A0, &__block_literal_global_510_1);
    }
    uint64_t v12 = qword_1EB25E898;
  }
  [v10 setBackgroundColor:v12];

  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = *(void **)(v13 + 240);
  id v15 = [*(id *)(v13 + 416) placeholderImage];
  objc_msgSend(v14, "setContents:", objc_msgSend(v15, "CGImage"));

  v16 = *(void **)(a1 + 32);
  v17 = (void *)v16[30];
  id v18 = [v16 _imageStackContentsGravity];
  [v17 setContentsGravity:v18];
}

void __45___UIStackedImageContainerLayer__randomImage__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  id v1 = (void *)qword_1EB25E888;
  qword_1EB25E888 = (uint64_t)v0;
}

void __52___UIStackedImageContainerLayer__setParallaxImages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  [v11 setDelegate:*(void *)(a1 + 32)];
  objc_msgSend(v11, "setAnchorPoint:", 0.5, 0.5);
  [*(id *)(a1 + 32) _positionAndSizeForLayerImage:*(void *)(a1 + 40)];
  double v6 = v5;
  double v8 = v7;
  objc_msgSend(v11, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  objc_msgSend(v11, "setPosition:", v6, v8);
  [v11 setAllowsGroupOpacity:0];
  [v11 setAllowsEdgeAntialiasing:1];
  uint64_t v9 = [*(id *)(a1 + 32) _imageStackContentsGravity];
  [v11 setContentsGravity:v9];

  [v11 setZPosition:(double)*(uint64_t *)(a1 + 48) * 0.001];
  [*(id *)(a1 + 32) contentsScale];
  objc_msgSend(v11, "setContentsScale:");
  [*(id *)(a1 + 32) rasterizationScale];
  objc_msgSend(v11, "setRasterizationScale:");
  if (a3 && [*(id *)(a1 + 40) blendMode] == 1)
  {
    v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A0]];
    [v11 setCompositingFilter:v10];
  }
}

@end