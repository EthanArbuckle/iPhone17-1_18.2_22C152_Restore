@interface PXGMetalCaptureSpriteTexture
- (BOOL)isAtlas;
- (BOOL)isCaptureTexture;
- (BOOL)isOpaque;
- (CGRect)captureRect;
- (MTLTexture)chromaTexture;
- (MTLTexture)snapshotTexture;
- (MTLTexture)texture;
- (PXGCaptureSpritePayload)payload;
- (PXGColorProgram)colorProgram;
- (PXGMetalCaptureSpriteTexture)initWithPayload:(id)a3 presentationType:(unsigned __int8)a4;
- (const)spriteGeometries;
- (double)drawingScale;
- (float)alpha;
- (id)copyWithZone:(_NSZone *)a3;
- (int)shaderFlags;
- (int64_t)renderPipelineIndex;
- (unint64_t)behavior;
- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9;
- (void)setCaptureRect:(CGRect)a3;
- (void)setDrawingScale:(double)a3;
- (void)setRenderPipelineIndex:(int64_t)a3;
- (void)setSpriteGeometries:(id *)a3;
- (void)setTexture:(id)a3;
@end

@implementation PXGMetalCaptureSpriteTexture

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXGMetalCaptureSpriteTexture alloc];
  v5 = [(PXGMetalCaptureSpriteTexture *)self payload];
  v6 = [(PXGMetalCaptureSpriteTexture *)v4 initWithPayload:v5 presentationType:[(PXGPayloadTexture *)self presentationType]];

  v7 = [(PXGBaseTexture *)self spriteIndexes];
  [(PXGBaseTexture *)v6 addSpriteIndexes:v7];

  return v6;
}

- (PXGMetalCaptureSpriteTexture)initWithPayload:(id)a3 presentationType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGMetalCaptureSpriteTexture;
  v8 = [(PXGPayloadTexture *)&v17 initWithPayload:v7 presentationType:v4];
  if (v8)
  {
    v9 = [v7 renderSnapshot];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
        [v13 handleFailureInMethod:a2, v8, @"PXGMetalCaptureSpriteTexture.m", 41, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"payload.renderSnapshot", v15, v16 object file lineNumber description];
      }
    }
    uint64_t v10 = [v9 texture];
    snapshotTexture = v8->_snapshotTexture;
    v8->_snapshotTexture = (MTLTexture *)v10;

    v8->_behavior = [v7 behavior];
  }

  return v8;
}

- (BOOL)isOpaque
{
  v2 = [(PXGMetalCaptureSpriteTexture *)self payload];
  BOOL v3 = [v2 behavior] == 0;

  return v3;
}

- (PXGCaptureSpritePayload)payload
{
  v11.receiver = self;
  v11.super_class = (Class)PXGMetalCaptureSpriteTexture;
  uint64_t v4 = [(PXGPayloadTexture *)&v11 payload];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v9);
    uint64_t v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:a2, self, @"PXGMetalCaptureSpriteTexture.m", 55, @"%@ should be an instance inheriting from %@, but it is %@", @"super.payload", v8, v10 object file lineNumber description];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PXGMetalCaptureSpriteTexture.m", 55, @"%@ should be an instance inheriting from %@, but it is nil", @"super.payload", v8 object file lineNumber description];
  }

LABEL_3:
  return (PXGCaptureSpritePayload *)v4;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  if ([(PXGBaseTexture *)self spriteCount] < a9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXGMetalCaptureSpriteTexture.m", 63, @"Invalid parameter not satisfying: %@", @"count <= self.spriteCount" object file lineNumber description];
  }
  v14 = [(PXGMetalCaptureSpriteTexture *)self texture];
  v15 = [(PXGMetalCaptureSpriteTexture *)self spriteGeometries];
  if (!v15)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXGMetalCaptureSpriteTexture.m", 68, @"%@ must have geometries at this point", self object file lineNumber description];

    if (v14) {
      goto LABEL_5;
    }
LABEL_7:
    unint64_t v16 = 1;
    unint64_t v17 = 1;
    goto LABEL_8;
  }
  if (!v14) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v16 = [v14 width];
  unint64_t v17 = [v14 height];
LABEL_8:
  [(PXGMetalCaptureSpriteTexture *)self captureRect];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  double v25 = v24;
  uint64_t v27 = v26;
  [(PXGMetalCaptureSpriteTexture *)self alpha];
  int v29 = v28;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v30 = [(PXGBaseTexture *)self spriteIndexes];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __119__PXGMetalCaptureSpriteTexture_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke;
  v31[3] = &unk_1E5DCFC50;
  *(double *)&v31[6] = (double)v16;
  *(double *)&v31[7] = (double)v17;
  v31[8] = v15;
  v31[9] = v21;
  v31[10] = v23;
  *(double *)&v31[11] = v25;
  v31[12] = v27;
  *(double *)&v31[13] = (double)v16 / v25;
  v31[4] = v34;
  v31[5] = a7;
  v31[14] = a3;
  v31[15] = v16;
  v31[16] = v17;
  int v32 = v29;
  unsigned int v33 = a9;
  [v30 enumerateRangesUsingBlock:v31];

  _Block_object_dispose(v34, 8);
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (float)alpha
{
  return 1.0;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)setTexture:(id)a3
{
}

- (void)setSpriteGeometries:(id *)a3
{
  self->_spriteGeometries = a3;
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
}

- (void)setCaptureRect:(CGRect)a3
{
  self->_captureRect = a3;
}

- (BOOL)isCaptureTexture
{
  return 1;
}

- (const)spriteGeometries
{
  return self->_spriteGeometries;
}

- (int)shaderFlags
{
  return 0;
}

- (BOOL)isAtlas
{
  return 0;
}

- (CGRect)captureRect
{
  double x = self->_captureRect.origin.x;
  double y = self->_captureRect.origin.y;
  double width = self->_captureRect.size.width;
  double height = self->_captureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_snapshotTexture, 0);
}

uint64_t __119__PXGMetalCaptureSpriteTexture_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2 + a3 > (unint64_t)a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = a2;
    long long v6 = *(_OWORD *)off_1E5DAAFA0;
    unsigned int v7 = a2 + 1;
    while (1)
    {
      if ((*(unsigned char *)(*(void *)(result + 40) + 40 * v5 + 34) & 8) == 0)
      {
        uint64_t v8 = *(void *)(result + 64) + 20 * v5;
        float32x2_t v9 = *(float32x2_t *)(v8 + 12);
        float32x2_t v10 = vmul_f32(v9, (float32x2_t)0x3F0000003F000000);
        v22.origin.CGFloat x = (float)(*(float *)v8 - v10.f32[0]);
        v22.origin.CGFloat y = (float)(*(float *)(v8 + 4) - v10.f32[1]);
        v22.size.CGFloat width = v9.f32[0];
        v22.size.CGFloat height = v9.f32[1];
        CGRect v20 = CGRectIntersection(*(CGRect *)(result + 72), v22);
        CGFloat x = v20.origin.x;
        CGFloat y = v20.origin.y;
        CGFloat width = v20.size.width;
        CGFloat height = v20.size.height;
        if (!CGRectIsEmpty(v20))
        {
          v21.origin.CGFloat x = x;
          v21.origin.CGFloat y = y;
          v21.size.CGFloat width = width;
          v21.size.CGFloat height = height;
          CGRectOffset(v21, -*(double *)(v4 + 72), -*(double *)(v4 + 80));
        }
        PXRectScale();
      }
      uint64_t v15 = *(void *)(result + 112) + (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) << 6);
      float32x2_t v16 = vcvt_f32_f64(*(float64x2_t *)(result + 48));
      float32x2_t v17 = vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)(result + 120)));
      int v18 = *(_DWORD *)(result + 136);
      *(float32x2_t *)uint64_t v15 = vcvt_f32_f64((float64x2_t)0);
      *(float32x2_t *)(v15 + 8) = v16;
      *(float32x2_t *)(v15 + 16) = v17;
      *(_OWORD *)(v15 + 32) = v6;
      *(_DWORD *)(v15 + 48) = v18;
      if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) == *(_DWORD *)(result + 140)) {
        break;
      }
      uint64_t v5 = v7;
      if (a2 + a3 <= (unint64_t)v7++) {
        return result;
      }
    }
    *a4 = 1;
  }
  return result;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (MTLTexture)snapshotTexture
{
  return self->_snapshotTexture;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  self->_renderPipelineIndeCGFloat x = a3;
}

- (int64_t)renderPipelineIndex
{
  return self->_renderPipelineIndex;
}

- (PXGColorProgram)colorProgram
{
  return 0;
}

- (MTLTexture)chromaTexture
{
  return 0;
}

@end