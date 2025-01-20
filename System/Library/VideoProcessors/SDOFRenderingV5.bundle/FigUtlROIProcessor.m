@interface FigUtlROIProcessor
- (BOOL)processImage:(__CVBuffer *)a3 orientation:(int)a4 rect:(CGRect)a5;
- (CGPoint)originalToRoi:(CGPoint)a3;
- (CGPoint)originalToRoiPixels:(CGPoint)a3;
- (CGPoint)roiToOriginal:(CGPoint)a3;
- (CGPoint)roiToOriginalPixels:(CGPoint)a3;
- (CGRect)roiRectangle;
- (FigUtlROIProcessor)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(unsigned int)a5;
- (__CVBuffer)pixelBuffer;
- (__n128)originalToRoiMatrix;
- (__n128)roiToOriginalMatrix;
- (int)height;
- (int)width;
- (void)dealloc;
@end

@implementation FigUtlROIProcessor

- (CGPoint)originalToRoi:(CGPoint)a3
{
  float64x2_t v6 = vaddq_f64(*(float64x2_t *)&self->_anon_90[64], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)self->_anon_90, a3.x), *(float64x2_t *)&self->_anon_90[32], a3.y));
  double v7 = vaddq_f64(*(float64x2_t *)&self->_anon_90[80], vmlaq_f64(vmulq_f64((float64x2_t)a3, *(float64x2_t *)&self->_anon_90[16]), *(float64x2_t *)&a3.y, *(float64x2_t *)&self->_anon_90[48])).f64[0];
  double v3 = sub_263533E78(v6.f64[0] / v7);
  double v4 = sub_263533E78(v6.f64[1] / v7);
  double v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)originalToRoiPixels:(CGPoint)a3
{
  objc_msgSend_originalToRoi_(self, a2, v3, v4, a3.x / (double)(self->_originalWidth - 1), a3.y / (double)(self->_originalHeight - 1));
  double v7 = v6 * (self->_roiInPixels.size.width + -1.0);
  double v9 = v8 * (self->_roiInPixels.size.height + -1.0);
  result.y = v9;
  result.x = v7;
  return result;
}

- (CGPoint)roiToOriginal:(CGPoint)a3
{
  float64x2_t v6 = vaddq_f64((float64x2_t)self[1]._originalRectangle.size, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self[1].super.isa, a3.x), (float64x2_t)self[1]._roiInPixels.size, a3.y));
  double v7 = vaddq_f64(*(float64x2_t *)&self[1]._orientation, vmlaq_f64(vmulq_f64((float64x2_t)a3, (float64x2_t)self[1]._roiInPixels.origin), *(float64x2_t *)&a3.y, (float64x2_t)self[1]._originalRectangle.origin)).f64[0];
  double v3 = sub_263533E78(v6.f64[0] / v7);
  double v4 = sub_263533E78(v6.f64[1] / v7);
  double v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)roiToOriginalPixels:(CGPoint)a3
{
  CGFloat v5 = self->_roiInPixels.size.width + -1.0;
  CGFloat v6 = self->_roiInPixels.size.height + -1.0;
  objc_msgSend_roiToOriginal_(self, a2, v3, v4, a3.x / v5, a3.y / v6);
  double v8 = v5 * v7;
  double v10 = v6 * v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (FigUtlROIProcessor)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(unsigned int)a5
{
  v14.receiver = self;
  v14.super_class = (Class)FigUtlROIProcessor;
  double v7 = [(FigUtlROIProcessor *)&v14 init];
  if (v7)
  {
    uint64_t PixelBuffer = CreatePixelBuffer();
    v7->_pixelBuffer = (__CVBuffer *)PixelBuffer;
    if (!PixelBuffer
      || (double v9 = (FigM2MController *)objc_alloc_init(MEMORY[0x263F2EE08]),
          m2m = v7->_m2m,
          v7->_m2m = v9,
          m2m,
          !v7->_m2m))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v12 = 0;
      goto LABEL_6;
    }
    CGSize v11 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v7->_roiInPixels.origin = (CGPoint)*MEMORY[0x263F001A8];
    v7->_roiInPixels.size = v11;
    v7->_width = a3;
    v7->_height = a4;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigUtlROIProcessor;
  [(FigUtlROIProcessor *)&v4 dealloc];
}

- (BOOL)processImage:(__CVBuffer *)a3 orientation:(int)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v9 = *(void *)&a4;
  int v12 = CVPixelBufferGetWidth(a3);
  int v13 = CVPixelBufferGetHeight(a3);
  int v14 = v13;
  self->_originalWidth = v12;
  self->_originalHeight = v13;
  double v15 = floor(width * (double)v12);
  double v16 = floor(height * (double)v13);
  int v17 = v12;
  int v18 = v13;
  double v19 = v15;
  double v20 = v16;
  switch((int)v9)
  {
    case 1:
    case 3:
      goto LABEL_3;
    case 6:
    case 8:
      int v17 = v13;
      int v18 = v12;
      double v19 = v16;
      double v20 = v15;
LABEL_3:
      int v21 = (int)v20;
      int v22 = (int)v19;
      int v23 = self->_width;
      double v24 = 1.0;
      double v25 = 1.0;
      if (v23 <= v22) {
        double v25 = (double)v23 / (double)v22;
      }
      int v26 = self->_height;
      if (v26 <= v21) {
        double v24 = (double)v26 / (double)v21;
      }
      if (v25 < v24) {
        double v24 = v25;
      }
      if (v24 < 0.25) {
        goto LABEL_14;
      }
      v59.f64[0] = v16;
      v59.f64[1] = v15;
      CGSize v78 = (CGSize)0;
      long long v79 = 0u;
      CGSize v76 = (CGSize)0;
      CGPoint v77 = (CGPoint)0;
      float64x2_t v74 = 0u;
      CGPoint v75 = (CGPoint)0;
      float64x2_t v73 = 0u;
      sub_263535FA4((uint64_t)self, v9, &v74, &v68, x, y, width, height, v24 / (double)v23 * (double)v17, v24 / (double)v26 * (double)v18, v57, v58, v59, v62, v63, v64, v65, v66, v67,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0);
      float64x2_t v27 = v71;
      float64x2_t v28 = v70;
      float64x2_t v29 = v71;
      *(float64x2_t *)&self->_anon_90[32] = v70;
      *(float64x2_t *)&self->_anon_90[48] = v27;
      float64x2_t v30 = v73;
      float64x2_t v31 = v72;
      float64x2_t v32 = v73;
      *(float64x2_t *)&self->_anon_90[64] = v72;
      *(float64x2_t *)&self->_anon_90[80] = v30;
      float64x2_t v33 = v69;
      float64x2_t v34 = v68;
      float64x2_t v35 = v69;
      *(float64x2_t *)self->_anon_90 = v68;
      *(float64x2_t *)&self->_anon_90[16] = v33;
      CGPoint v36 = v77;
      self[1]._roiInPixels.size = v76;
      self[1]._originalRectangle.origin = v36;
      long long v37 = v79;
      self[1]._originalRectangle.size = v78;
      *(_OWORD *)&self[1]._orientation = v37;
      v38.f64[1] = v74.f64[1];
      CGPoint v39 = v75;
      *(float64x2_t *)&self[1].super.isa = v74;
      self[1]._roiInPixels.origin = v39;
      float64x2_t v64 = v28;
      float64x2_t v65 = v29;
      float64x2_t v66 = v31;
      float64x2_t v67 = v32;
      float64x2_t v62 = v34;
      float64x2_t v63 = v35;
      v38.f64[0] = x;
      v28.f64[0] = y;
      v31.f64[0] = width;
      v29.f64[0] = height;
      double v40 = sub_263533E8C(&v62, v38, v28, v31, v29);
      CGFloat v42 = v41;
      double v44 = v43;
      double v46 = sub_263533E78(v45);
      double v48 = sub_263533E78(v44);
      CGFloat v49 = (double)self->_width;
      CGFloat v50 = floor(v46 * v49);
      double v51 = (double)self->_height;
      double v52 = floor(v48 * v51);
      self->_roiInPixels.size.double width = v50;
      self->_roiInPixels.size.double height = v52;
      self->_roiInPixels.origin.double x = 0.0;
      self->_roiInPixels.origin.double y = 0.0;
      if (v50 <= v49 && v52 <= v51)
      {
        self->_originalRectangle.origin.double x = x;
        self->_originalRectangle.origin.double y = y;
        self->_originalRectangle.size.double width = width;
        self->_originalRectangle.size.double height = height;
        self->_orientation = v9;
        self->_roiRectangle.origin.double x = v40;
        self->_roiRectangle.origin.double y = v42;
        self->_roiRectangle.size.double width = v46;
        self->_roiRectangle.size.double height = v48;
        m2m = self->_m2m;
        pixelBuffer = self->_pixelBuffer;
        BOOL v55 = 1;
        if (!objc_msgSend_transform_srcRect_dst_dstRect_rotate_sync_m2m_(m2m, v47, (uint64_t)a3, (uint64_t)pixelBuffer, v9, 1, floor(x * (double)(v12 - 1)), floor(y * (double)(v14 - 1)), v61, v60, 0.0, 0.0))return v55; {
      }
        }
      fig_log_get_emitter();
LABEL_15:
      FigDebugAssert3();
      return 0;
    default:
LABEL_14:
      fig_log_get_emitter();
      goto LABEL_15;
  }
}

- (__n128)originalToRoiMatrix
{
  long long v2 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 144);
  long long v5 = *(_OWORD *)(a1 + 160);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)roiToOriginalMatrix
{
  long long v2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 320);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 304);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 240);
  long long v5 = *(_OWORD *)(a1 + 256);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (CGRect)roiRectangle
{
  double x = self->_roiRectangle.origin.x;
  double y = self->_roiRectangle.origin.y;
  double width = self->_roiRectangle.size.width;
  double height = self->_roiRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (void).cxx_destruct
{
}

@end