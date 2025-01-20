@interface MaskToRoi
- (MaskToRoi)initWithMetalToolBox:(id)a3;
- (__CVBuffer)integralSumPixelBuffer;
- (int64_t)extractRoiByGraphTraversalInput:(__CVBuffer *)a3 bboxSizeThreshold:(float)a4 scaleFactorInv:(float)a5[4] validWidth:(int)a6 validHeight:(int)a7 lightSourceBBox:;
- (int64_t)getLSBBoxesUsingGraphTraversalFrom:(__CVBuffer *)a3 roi:(CGRect)a4 pixValThreshold:(float)a5 bboxSizeThreshold:(float)a6 scaleFactorInv:(float)a7[4] validWidth:(int)a8 validHeight:(int)a9 lightSourceBBox:;
- (void)dealloc;
- (void)setIntegralSumPixelBuffer:(__CVBuffer *)a3;
@end

@implementation MaskToRoi

- (MaskToRoi)initWithMetalToolBox:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MaskToRoi;
  v5 = [(MaskToRoi *)&v11 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = v4 ? (GGMMetalToolBox *)v4 : objc_alloc_init(GGMMetalToolBox);
  metalToolbox = v5->_metalToolbox;
  v5->_metalToolbox = v6;

  *(void *)v5->_neighbors = -1;
  *(void *)&v5->_neighbors[8] = 0xFFFFFFFFLL;
  *(void *)&v5->_neighbors[16] = 0xFFFFFFFF00000000;
  *(void *)&v5->_neighbors[24] = 1;
  *(void *)&v5->_neighbors[32] = 0x100000000;
  *(void *)&v5->_neighbors[40] = 0x100000001;
  *(void *)&v5->_neighbors[48] = 0x1FFFFFFFFLL;
  *(void *)&v5->_neighbors[56] = 0xFFFFFFFF00000001;
  *(_OWORD *)&v5->_width = xmmword_2E240;
  v8 = malloc_type_malloc(0x185D00uLL, 0x100004000313F17uLL);
  *(void *)v5->_connectedPixelsQueue = v8;
  if (v8)
  {
    v9 = v5;
  }
  else
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  integralSumPixelBuffer = self->_integralSumPixelBuffer;
  if (integralSumPixelBuffer) {
    CFRelease(integralSumPixelBuffer);
  }
  free(*(void **)self->_connectedPixelsQueue);
  v4.receiver = self;
  v4.super_class = (Class)MaskToRoi;
  [(MaskToRoi *)&v4 dealloc];
}

- (int64_t)getLSBBoxesUsingGraphTraversalFrom:(__CVBuffer *)a3 roi:(CGRect)a4 pixValThreshold:(float)a5 bboxSizeThreshold:(float)a6 scaleFactorInv:(float)a7[4] validWidth:(int)a8 validHeight:(int)a9 lightSourceBBox:
{
  uint64_t v10 = v9;
  int32x2_t v49 = *(int32x2_t *)&a6;
  int Width = CVPixelBufferGetWidth(a3);
  if (Width >= a8) {
    int v17 = a8;
  }
  else {
    int v17 = Width;
  }
  int Height = CVPixelBufferGetHeight(a3);
  if (Height >= a9) {
    uint64_t v19 = a9;
  }
  else {
    uint64_t v19 = Height;
  }
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  if (CVPixelBufferLockBaseAddress(a3, 0) || (BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  else
  {
    if (v17 < 1)
    {
      int64_t v23 = 0;
    }
    else
    {
      unsigned int v22 = 0;
      int64_t v23 = 0;
      float32x2_t v25 = (float32x2_t)vdup_lane_s32(v49, 0);
      do
      {
        if ((int)v19 >= 1)
        {
          uint64_t v26 = 0;
          v27 = &BaseAddress[(unint64_t)v22 >> 3];
          int v28 = 1 << (v22 & 7);
          do
          {
            int v29 = v27[v26 * BytesPerRow];
            if ((v28 & v29) != 0)
            {
              uint64_t v30 = 0;
              **(void **)self->_connectedPixelsQueue = __PAIR64__(v26, v22);
              v27[v26 * BytesPerRow] = v29 & ~(_BYTE)v28;
              int32x2_t v31 = vadd_s32((int32x2_t)__PAIR64__(v26, v22), (int32x2_t)-1);
              int32x2_t v32 = vadd_s32((int32x2_t)__PAIR64__(v26, v22), (int32x2_t)0x100000001);
              uint64_t v33 = 1;
              do
              {
                uint64_t v34 = 0;
                int32x2_t v35 = *(int32x2_t *)(*(void *)self->_connectedPixelsQueue + 8 * v30);
                int32x2_t v36 = vadd_s32(v35, (int32x2_t)-1);
                int32x2_t v37 = vadd_s32(v35, (int32x2_t)0x100000001);
                do
                {
                  int32x2_t v38 = vadd_s32(*(int32x2_t *)&self->_neighbors[v34], v35);
                  uint32x2_t v39 = (uint32x2_t)vcgt_s32(v38, (int32x2_t)-1);
                  if ((vpmin_u32(v39, v39).u32[0] & 0x80000000) != 0)
                  {
                    uint32x2_t v40 = (uint32x2_t)vcgt_s32((int32x2_t)__PAIR64__(v19, v17), v38);
                    if ((vpmin_u32(v40, v40).u32[0] & 0x80000000) != 0)
                    {
                      v41 = &BaseAddress[v38.i32[0] >> 3];
                      int v42 = v41[v38.i32[1] * BytesPerRow];
                      int v43 = 1 << (v38.i8[0] & 7);
                      if ((v43 & v42) != 0)
                      {
                        *(int32x2_t *)(*(void *)self->_connectedPixelsQueue + 8 * v33++) = v38;
                        v41[v38.i32[1] * BytesPerRow] = v42 & ~(_BYTE)v43;
                      }
                    }
                  }
                  v34 += 8;
                }
                while (v34 != 64);
                ++v30;
                int32x2_t v31 = vmin_s32(v36, v31);
                int32x2_t v32 = vmax_s32(v37, v32);
              }
              while (v33 > v30);
              v24.i32[1] = v19 - 1;
              v24.i32[0] = v17 - 1;
              int32x2_t v44 = vcvt_s32_f32(vmla_f32(*(float32x2_t *)(a7 + 2), *(float32x2_t *)a7, vadd_f32(vcvt_f32_s32(vmin_s32(v24, v32)), (float32x2_t)0x3F0000003F000000)));
              *(float32x2_t *)&long long v45 = vcvt_f32_s32(vcvt_s32_f32(vmla_f32(*(float32x2_t *)(a7 + 2), *(float32x2_t *)a7, vadd_f32(vcvt_f32_s32(vmax_s32(v31, 0)), (float32x2_t)0x3F0000003F000000))));
              float32x2_t v46 = vsub_f32(vcvt_f32_s32(v44), *(float32x2_t *)&v45);
              uint32x2_t v47 = (uint32x2_t)vcgt_f32(v46, v25);
              if ((vpmin_u32(v47, v47).u32[0] & 0x80000000) != 0)
              {
                if (v23 <= 1023)
                {
                  *((float32x2_t *)&v45 + 1) = v46;
                  *(_OWORD *)(v10 + 16 * v23) = v45;
                }
                ++v23;
              }
            }
            ++v26;
          }
          while (v26 != v19);
        }
        ++v22;
      }
      while (v22 != v17);
    }
    CVPixelBufferUnlockBaseAddress(a3, 0);
  }
  return v23;
}

- (int64_t)extractRoiByGraphTraversalInput:(__CVBuffer *)a3 bboxSizeThreshold:(float)a4 scaleFactorInv:(float)a5[4] validWidth:(int)a6 validHeight:(int)a7 lightSourceBBox:
{
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (v8
    && ((size_t v19 = Height, Width == self->_width) && Height == self->_height
     || (self->_width = Width,
         self->_height = Height,
         free(*(void **)self->_connectedPixelsQueue),
         v20 = malloc_type_malloc(8 * Width * v19, 0x100004000313F17uLL),
         (*(void *)self->_connectedPixelsQueue = v20) != 0)))
  {
    double y = CGRectZero.origin.y;
    double v22 = CGRectZero.size.width;
    double v23 = CGRectZero.size.height;
    LODWORD(v17) = 1008981770;
    *(float *)&double v18 = a4;
    return -[MaskToRoi getLSBBoxesUsingGraphTraversalFrom:roi:pixValThreshold:bboxSizeThreshold:scaleFactorInv:validWidth:validHeight:lightSourceBBox:](self, "getLSBBoxesUsingGraphTraversalFrom:roi:pixValThreshold:bboxSizeThreshold:scaleFactorInv:validWidth:validHeight:lightSourceBBox:", a3, a5, v10, v9, v8, CGRectZero.origin.x, y, v22, v23, v17, v18);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (__CVBuffer)integralSumPixelBuffer
{
  return self->_integralSumPixelBuffer;
}

- (void)setIntegralSumPixelBuffer:(__CVBuffer *)a3
{
  self->_integralSumPixelBuffer = a3;
}

- (void).cxx_destruct
{
}

@end