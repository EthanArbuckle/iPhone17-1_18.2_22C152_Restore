@interface CALayer(Utilities)
- (VKAutoFadeOutLayer)vk_autoFadeOutShapePointLayer;
- (VKQuad)vk_quadFromConvertingRect:()Utilities toLayer:;
- (id)vk_autoFadeOutShapeRectLayer;
- (id)vk_quadFromConvertingBoundsToLayer:()Utilities;
@end

@implementation CALayer(Utilities)

- (id)vk_quadFromConvertingBoundsToLayer:()Utilities
{
  id v4 = a3;
  [a1 bounds];
  v5 = objc_msgSend(a1, "vk_quadFromConvertingRect:toLayer:", v4);

  return v5;
}

- (VKQuad)vk_quadFromConvertingRect:()Utilities toLayer:
{
  id v12 = a7;
  v13 = -[VKQuad initWithRect:]([VKQuad alloc], "initWithRect:", a2, a3, a4, a5);
  [(VKQuad *)v13 topLeft];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v15 = v14;
  double v17 = v16;
  [(VKQuad *)v13 topRight];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v19 = v18;
  double v21 = v20;
  [(VKQuad *)v13 bottomLeft];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v23 = v22;
  double v25 = v24;
  [(VKQuad *)v13 bottomRight];
  objc_msgSend(a1, "convertPoint:toLayer:", v12);
  double v27 = v26;
  double v29 = v28;

  v30 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v23, v25, v27, v29, v15, v17, v19, v21);
  return v30;
}

- (VKAutoFadeOutLayer)vk_autoFadeOutShapePointLayer
{
  v2 = objc_alloc_init(VKAutoFadeOutLayer);
  v3 = objc_msgSend(MEMORY[0x1E4F428B8], "vk_randomColor");
  id v4 = [v3 colorWithAlphaComponent:0.8];
  -[VKAutoFadeOutLayer setBackgroundColor:](v2, "setBackgroundColor:", [v4 CGColor]);

  [(VKAutoFadeOutLayer *)v2 setBounds:VKMRectWithOriginAndSize(v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 10.0, 10.0)];
  [a1 addSublayer:v2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke;
  v8[3] = &unk_1E6BF0D18;
  v6 = v2;
  v9 = v6;
  vk_dispatchMainAfterDelay(v8, 1.0);

  return v6;
}

- (id)vk_autoFadeOutShapeRectLayer
{
  v1 = objc_msgSend(a1, "vk_autoFadeOutShapePointLayer");
  objc_msgSend(v1, "setBorderColor:", objc_msgSend(v1, "backgroundColor"));
  [v1 setBorderWidth:2.0];
  id v2 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v1, "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  return v1;
}

@end