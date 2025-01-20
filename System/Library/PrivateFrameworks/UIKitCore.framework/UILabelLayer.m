@interface UILabelLayer
@end

@implementation UILabelLayer

void __39___UILabelLayer_updateContentLayerSize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39___UILabelLayer_updateContentLayerSize__block_invoke_2;
  v3[3] = &__block_descriptor_64_e17_v16__0__CALayer_8l;
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  long long v5 = v2;
  -[_UILabelLayer _updateLayers:](v1, v3);
}

id __27___UILabelLayer_setBounds___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UILabelLayer;
  return objc_msgSendSuper2(&v2, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id __26___UILabelLayer_setFrame___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UILabelLayer;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __39___UILabelLayer_updateContentLayerSize__block_invoke_3(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __39___UILabelLayer_updateContentLayerSize__block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __39___UILabelLayer_setNeedsDisplayInRect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsDisplay];
}

uint64_t __37___UILabelLayer__configureSublayers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _configureUsingLayer:*(void *)(a1 + 32)];
}

uint64_t __35___UILabelLayer_setContentsFormat___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentsFormat:*(void *)(a1 + 32)];
}

void __39___UILabelLayer_updateContentLayerSize__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 contentsScale];
  objc_msgSend(v4, "setContentsScale:");
  [*(id *)(a1 + 32) rasterizationScale];
  objc_msgSend(v4, "setRasterizationScale:");
}

uint64_t __33___UILabelLayer__updateSublayers__block_invoke(uint64_t a1)
{
  objc_super v2 = objc_alloc_init(_UILabelContentLayer);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  long long v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[4];
  return [v5 insertSublayer:v6 atIndex:0];
}

uint64_t __33___UILabelLayer__updateSublayers__block_invoke_2(uint64_t a1)
{
  objc_super v2 = objc_alloc_init(_UILabelLightReactiveLayer);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v5 = objc_alloc_init(_UILabelLightInertLayer);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  v8 = *(void **)(*(void *)(a1 + 32) + 40);
  v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A090]];
  [v8 setCompositingFilter:v9];

  v10 = [*(id *)(a1 + 32) lightContainerView];
  v11 = [v10 layer];
  [v11 insertSublayer:*(void *)(*(void *)(a1 + 32) + 40) atIndex:1];

  v12 = *(void **)(a1 + 32);
  uint64_t v13 = v12[6];
  return [v12 insertSublayer:v13 atIndex:0];
}

uint64_t __31___UILabelLayer__clearContents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContents:0];
}

uint64_t __36___UILabelLayer_setContentsGravity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentsGravity:*(void *)(a1 + 32)];
}

uint64_t __47___UILabelLayer_setNeedsDisplayOnBoundsChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsDisplayOnBoundsChange:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __42___UILabelLayer_setContentsMultiplyColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentsMultiplyColor:*(void *)(a1 + 32)];
}

uint64_t __34___UILabelLayer_setContentsScale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentsScale:*(double *)(a1 + 32)];
}

@end