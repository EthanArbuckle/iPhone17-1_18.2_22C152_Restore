@interface VNRectangleObservation(Utilities)
- (VKQuad)vkQuad;
- (id)vk_quadConvertedToView:()Utilities withContentsRect:;
@end

@implementation VNRectangleObservation(Utilities)

- (VKQuad)vkQuad
{
  uint64_t v2 = objc_opt_class();
  v3 = VKDynamicCast(v2, a1);
  v4 = v3;
  if (v3)
  {
    [v3 topLeft];
    VKMFlipPoint();
    double v19 = v6;
    double v20 = v5;
    [v4 topRight];
    VKMFlipPoint();
    double v8 = v7;
    double v10 = v9;
    [v4 bottomLeft];
    VKMFlipPoint();
    double v12 = v11;
    double v14 = v13;
    [v4 bottomRight];
    VKMFlipPoint();
    v17 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v12, v14, v15, v16, v20, v19, v8, v10);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)vk_quadConvertedToView:()Utilities withContentsRect:
{
  id v12 = a7;
  double v13 = [a1 vkQuad];
  double v14 = objc_msgSend(v13, "quadByConvertingFromNormalizedRectToView:contentsRect:", v12, a2, a3, a4, a5);

  return v14;
}

@end