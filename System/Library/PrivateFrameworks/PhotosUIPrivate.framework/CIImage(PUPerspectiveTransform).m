@interface CIImage(PUPerspectiveTransform)
- (id)pu_imageWithPerspectiveTransform:()PUPerspectiveTransform extent:;
- (uint64_t)pu_imageWithPerspectiveTransform:()PUPerspectiveTransform;
@end

@implementation CIImage(PUPerspectiveTransform)

- (uint64_t)pu_imageWithPerspectiveTransform:()PUPerspectiveTransform
{
  [a1 extent];
  return objc_msgSend(a1, "pu_imageWithPerspectiveTransform:extent:", a2, a3, a4, v5, v6, v7, v8);
}

- (id)pu_imageWithPerspectiveTransform:()PUPerspectiveTransform extent:
{
  v12 = (void *)MEMORY[0x1E4F1E040];
  id v13 = a1;
  v14 = [v12 filterWithName:@"CIPerspectiveTransformWithExtent"];
  v41.origin.x = a5;
  v41.origin.y = a6;
  v41.size.width = a7;
  v41.size.height = a8;
  double MinX = CGRectGetMinX(v41);
  v42.origin.x = a5;
  v42.origin.y = a6;
  v42.size.width = a7;
  v42.size.height = a8;
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.x = a5;
  v43.origin.y = a6;
  v43.size.width = a7;
  v43.size.height = a8;
  double MinY = CGRectGetMinY(v43);
  v44.origin.x = a5;
  v44.origin.y = a6;
  v44.size.width = a7;
  v44.size.height = a8;
  CGFloat MaxY = CGRectGetMaxY(v44);
  float v19 = MinX;
  float v20 = MinY;
  float32x4_t v21 = vmulq_n_f32(a2, v19);
  int32x4_t v22 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v21, a3, v20));
  *(float *)&CGFloat MaxY = MaxY;
  int32x4_t v23 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v21, a3, *(float *)&MaxY));
  float64x2_t v34 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2)));
  *(float *)v23.i32 = MaxX;
  float32x4_t v24 = vmulq_n_f32(a2, *(float *)v23.i32);
  int32x4_t v25 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v24, a3, *(float *)&MaxY));
  float64x2_t v36 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v25.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2)));
  int32x4_t v26 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(v24, a3, v20));
  float64x2_t v39 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2)));
  v27 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:", vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2))));
  v28 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:", *(_OWORD *)&v34);
  v29 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:", *(_OWORD *)&v36);
  v30 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:", *(_OWORD *)&v39);
  [v14 setValue:v13 forKey:*MEMORY[0x1E4F1E480]];

  v31 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", a5, a6, a7, a8);
  [v14 setValue:v31 forKey:@"inputExtent"];

  [v14 setValue:v27 forKey:@"inputBottomLeft"];
  [v14 setValue:v28 forKey:@"inputTopLeft"];
  [v14 setValue:v29 forKey:@"inputTopRight"];
  [v14 setValue:v30 forKey:@"inputBottomRight"];
  v32 = [v14 outputImage];

  return v32;
}

@end