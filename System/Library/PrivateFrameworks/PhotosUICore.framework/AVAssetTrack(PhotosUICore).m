@interface AVAssetTrack(PhotosUICore)
+ (__n128)px_changeTranslationOfTransform:()PhotosUICore forAssetSize:;
- (double)px_preferredTransformBasedOnNaturalSize;
- (double)px_transformedNaturalSize;
@end

@implementation AVAssetTrack(PhotosUICore)

- (double)px_preferredTransformBasedOnNaturalSize
{
  v4 = objc_opt_class();
  [a1 preferredTransform];
  [a1 naturalSize];
  if (v4)
  {
    objc_msgSend(v4, "px_changeTranslationOfTransform:forAssetSize:", &v6);
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (double)px_transformedNaturalSize
{
  [a1 naturalSize];
  double v5 = v3;
  double v6 = v2;
  objc_msgSend(a1, "px_preferredTransformBasedOnNaturalSize");
  *(void *)&double result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v5), (float64x2_t)0, v6));
  return result;
}

+ (__n128)px_changeTranslationOfTransform:()PhotosUICore forAssetSize:
{
  double v4 = a3;
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v11.a = *(_OWORD *)a1;
  *(_OWORD *)&v11.c = v8;
  *(_OWORD *)&v11.tx = *(_OWORD *)(a1 + 32);
  uint64_t v9 = 0;
  *(void *)&long long v8 = 0;
  CGRect v12 = CGRectApplyAffineTransform(*(CGRect *)(&v4 - 3), &v11);
  v12.size.height = *(CGFloat *)(a1 + 40);
  *(double *)(a1 + 32) = *(double *)(a1 + 32) - v12.origin.x;
  *(double *)(a1 + 40) = v12.size.height - v12.origin.y;
  *(_OWORD *)&v12.origin.y = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = *(_OWORD *)&v12.origin.y;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

@end