@interface RBSurface
- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor;
- (BOOL)clearsBackground;
- (BOOL)isOpaque;
- (CGImage)copyCGImageUsingDevice:(id)a3;
- (CGSize)size;
- (RBDisplayList)displayList;
- (RBSurface)init;
- (double)scale;
- (id).cxx_construct;
- (int)colorMode;
- (int32x2_t)invalidateInRect:(int32x4_t)a3;
- (uint64_t)_updateWithDevice:(RB:(int)a4 :RenderFrame *)a3 frame:synchronized:;
- (void)dealloc;
- (void)invalidate;
- (void)setClearColor:(id)a3;
- (void)setClearsBackground:(BOOL)a3;
- (void)setColorMode:(int)a3;
- (void)setDisplayList:(id)a3;
- (void)setDisplayList:(id)a3 dirtyRect:(CGRect)a4;
- (void)setOpaque:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)updateUsingDevice:(id)a3;
@end

@implementation RBSurface

- (RBSurface)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSurface;
  result = [(RBSurface *)&v3 init];
  if (result)
  {
    result->_scale = 1.0;
    result->_colorMode = 1;
    *(_WORD *)&result->_clearsBackground = 1;
    *(void *)&result->_clearColor.red = 0;
    *(void *)&result->_clearColor.blue = 0;
  }
  return result;
}

- (void)dealloc
{
  p = self->_drawable._p;
  if (p) {
    RB::Drawable::finish((intptr_t)p);
  }
  v4.receiver = self;
  v4.super_class = (Class)RBSurface;
  [(RBSurface *)&v4 dealloc];
}

- (void)setSize:(CGSize)a3
{
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    [(RBSurface *)self invalidate];
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(RBSurface *)self invalidate];
  }
}

- (void)setColorMode:(int)a3
{
  if (self->_colorMode != a3)
  {
    self->_colorMode = a3;
    [(RBSurface *)self invalidate];
  }
}

- (void)setClearsBackground:(BOOL)a3
{
  if (self->_clearsBackground != a3)
  {
    self->_clearsBackground = a3;
    [(RBSurface *)self invalidate];
  }
}

- (void)setClearColor:(id)a3
{
  if (self->_clearColor.red != a3.var0
    || self->_clearColor.green != a3.var1
    || self->_clearColor.blue != a3.var2
    || self->_clearColor.alpha != a3.var3)
  {
    self->_clearColor = ($F6F15AA9EF86AD1416F06DA9210B6734)a3;
    [(RBSurface *)self invalidate];
  }
}

- (RBDisplayList)displayList
{
  return self->_displayList._p;
}

- (void)setDisplayList:(id)a3
{
  p = self->_displayList._p;
  if (p != a3)
  {

    self->_displayList._p = (RBDisplayList *)a3;
    [(RBSurface *)self invalidate];
  }
}

- (void)setDisplayList:(id)a3 dirtyRect:(CGRect)a4
{
  p = self->_displayList._p;
  if (p != a3)
  {
    CGFloat height = a4.size.height;
    CGFloat y = a4.origin.y;
    CGFloat width = a4.size.width;
    CGFloat x = a4.origin.x;

    self->_displayList._p = (RBDisplayList *)a3;
    v7.f64[0] = x;
    v7.f64[1] = y;
    float32x2_t v8 = vcvt_f32_f64(v7);
    CGFloat v9 = width;
    v10.f64[1] = height;
    *(float32x2_t *)&v10.f64[0] = vcvt_f32_f64(v10);
    [(RBSurface *)(int32x2_t *)self invalidateInRect:(int32x4_t)v10];
  }
}

- (int32x2_t)invalidateInRect:(int32x4_t)a3
{
  if (result)
  {
    objc_super v3 = result;
    *(float32x2_t *)a3.i8 = vrndp_f32(vadd_f32(*(float32x2_t *)a3.i8, a2));
    double v4 = RB::Rect::from_bounds(vrndm_f32(a2), a3);
    RB::Bounds::Bounds(v6, *(float32x2_t *)&v4, v5);
    result = RB::Bounds::Union(v3 + 6, v6[0], v6[1]);
    v3[5] = 0;
  }
  return result;
}

- (CGImage)copyCGImageUsingDevice:(id)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  float32x2_t v5 = [a3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__RBSurface_copyCGImageUsingDevice___block_invoke;
  block[3] = &unk_2641F9C70;
  block[5] = a3;
  block[6] = &v25;
  block[4] = self;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v26 + 24)) {
    goto LABEL_9;
  }
  RB::Drawable::finish((intptr_t)self->_drawable._p);
  int HasExtendedRange = RBColorModeHasExtendedRange(self->_colorMode);
  char v7 = HasExtendedRange;
  int width = (int)self->_size.width;
  int height = (int)self->_size.height;
  char v10 = HasExtendedRange ? 3 : 2;
  signed int v11 = ((width << v10) + 63) & 0xFFFFFFC0;
  v12 = malloc_type_malloc(v11 * height, 0xE3EDA7DDuLL);
  if (v12)
  {
    v13 = (void *)*((void *)self->_texture._p + 2);
    memset(v23, 0, 24);
    v23[3] = width;
    v23[4] = height;
    v23[5] = 1;
    [v13 getBytes:v12 bytesPerRow:v11 fromRegion:v23 mipmapLevel:0];
    v14 = CGDataProviderCreateWithData(0, v12, v11 * height, (CGDataProviderReleaseDataCallback)free_data);
    v15 = v14;
    if (v7)
    {
      if (self->_colorMode == 2) {
        uint64_t v16 = RB::extended_linear_srgb_colorspace(v14);
      }
      else {
        uint64_t v16 = RB::extended_srgb_colorspace(v14);
      }
      v18 = (CGColorSpace *)v16;
      CGBitmapInfo v19 = 4353;
      size_t v20 = 16;
      size_t v21 = 64;
    }
    else
    {
      v18 = (CGColorSpace *)RB::srgb_colorspace(v14);
      CGBitmapInfo v19 = 8194;
      size_t v20 = 8;
      size_t v21 = 32;
    }
    v17 = CGImageCreate(width, height, v20, v21, v11, v18, v19, v15, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v15);
  }
  else
  {
LABEL_9:
    v17 = 0;
  }
  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __36__RBSurface_copyCGImageUsingDevice___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  objc_super v3 = (RB::Device *)-[RBDecodedFontMetadata fontUID](a1[5]);
  uint64_t result = -[RBSurface _updateWithDevice:frame:synchronized:](v2, v3, 0, 1);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (uint64_t)_updateWithDevice:(RB:(int)a4 :RenderFrame *)a3 frame:synchronized:
{
  uint64_t v4 = a1;
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v8 = *(id *)(a1 + 8);
    RB::ColorMode::ColorMode(v48, *(unsigned int *)(v4 + 68));
    if (!v8)
    {
      CGFloat v9 = objc_opt_new();

      [v9 setProfile:2];
      [v9 setDefaultColorSpace:rb_color_space(((v48[4] & 1) == 0) | 0x100u)];
      id v8 = v9;
    }
    if (!*(void *)(v4 + 16)) {
      operator new();
    }
    if (*(void *)(v4 + 24) != *((void *)a2 + 3))
    {
      [(id)v4 invalidate];
      char v10 = (void *)*((void *)a2 + 3);
      signed int v11 = *(void **)(v4 + 24);
      if (v11 != v10)
      {

        *(void *)(v4 + 24) = v10;
      }
    }
    char v12 = *(unsigned char *)(v4 + 65) == 0;
    __int16 v47 = 0;
    int v46 = 0;
    unint64_t v13 = RB::ColorMode::pixel_format(v48, (uint64_t)a2, v12, (unsigned char *)&v47 + 1, (BOOL *)&v47, &v46);
    uint64_t v15 = v13;
    uint64_t v16 = *(int32x2_t **)(v4 + 32);
    if (v16 && *(void *)&v16[7] == v13)
    {
      BOOL v17 = *(void *)(v4 + 40) == 0;
    }
    else
    {
      __n128 v18 = (__n128)vcvtq_s64_f64(*(float64x2_t *)(v4 + 80));
      v18.n128_u64[0] = (unint64_t)vmovn_s64((int64x2_t)v18);
      RB::Texture::alloc((uint64_t)a2, v13, 0, 1, 0, &v41, v18);
      CGBitmapInfo v19 = *(_DWORD **)(v4 + 32);
      uint64_t v16 = (int32x2_t *)v41;
      *(void *)(v4 + 32) = v41;
      *(void *)&long long v41 = v19;
      if (v19)
      {
        int v20 = v19[2] - 1;
        v19[2] = v20;
        if (!v20) {
          (*(void (**)(_DWORD *))(*(void *)v19 + 8))(v19);
        }
        uint64_t v16 = *(int32x2_t **)(v4 + 32);
      }
      if (!v16)
      {
        uint64_t v4 = 0;
LABEL_35:

        return v4;
      }
      if ((v46 & 4) != 0)
      {
        v16[9].i8[5] |= 4u;
        uint64_t v16 = *(int32x2_t **)(v4 + 32);
      }
      *(int32x2_t *)(v4 + 48) = vdup_n_s32(0xC0000001);
      *(void *)(v4 + 56) = 0x8000000080000000;
      *(void *)(v4 + 40) = 0;
      BOOL v17 = 1;
    }
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __50__RBSurface__updateWithDevice_frame_synchronized___block_invoke;
    v45[3] = &__block_descriptor_40_e19____MTLTexture__8__0l;
    v45[4] = v16;
    int32x2_t v21 = v16[8];
    int32x2_t v43 = 0;
    int32x2_t v44 = v21;
    int v22 = 1;
    if (v17)
    {
      if (*(unsigned char *)(v4 + 64)) {
        int v22 = 2;
      }
      else {
        int v22 = 1;
      }
      RB::Bounds::intersect(&v43, *(int32x2_t *)(v4 + 48), *(int32x2_t *)(v4 + 56));
    }
    v14.i64[0] = *(void *)(v4 + 96);
    v14.i32[2] = *(_DWORD *)(v4 + 104);
    float32x4_t v39 = v14;
    v14.i32[0] = *(_DWORD *)(v4 + 108);
    float32x4_t v38 = v14;
    v23 = a3;
    v40 = a3;
    if (!a3)
    {
      v24 = RB::Drawable::begin_frame(*(RB::Drawable **)(v4 + 16));
      MEMORY[0x270FA5388](v24, v25);
      v23 = (RB::RenderFrame *)v37;
      memset(v37, 0, sizeof(v37));
      RB::RenderFrame::RenderFrame((RB::RenderFrame *)v37, a2, *(RB::Drawable **)(v4 + 16), 0);
    }
    double v26 = *(double *)&v16[8];
    double v27 = *(double *)(v4 + 72);
    char v28 = HIBYTE(v47);
    char v29 = v47;
    char v30 = v48[0];
    char HasExtendedRange = RBColorModeHasExtendedRange(*(_DWORD *)(v4 + 68));
    float v32 = v27;
    RB::RenderParams::RenderParams((uint64_t)&v41, (uint64_t)v23, v15, v28, v29, v30, HasExtendedRange, v26, v32);
    char v42 = (2 * v46) & 8 | v42 & 0xF7;
    v33 = (const RB::DisplayList::Contents *)objc_msgSend(v8, "_rb_contents");
    v34 = v33;
    if (v33)
    {
      float32x4_t v35 = v39;
      v35.i32[3] = 1.0;
      RB::DisplayList::render(v33, &v41, (uint64_t)v45, v22, *(void *)(v4 + 40), v43, v44, (__n128)vmulq_n_f32(v35, v38.f32[0]));
      *(void *)(v4 + 40) = *((void *)v34 + 41);
    }
    if (a4) {
      RBStrokeRef::clip(v23);
    }
    if (!v40) {
      RB::RenderFrame::~RenderFrame(v23);
    }
    *(void *)(v4 + 48) = 0;
    *(void *)(v4 + 56) = 0;
    RBXMLRecorderMarkFrame((const void *)v4, v8, HIBYTE(v47), *(double *)(v4 + 80), *(double *)(v4 + 88));
    uint64_t v4 = 1;
    goto LABEL_35;
  }
  return v4;
}

- (void)updateUsingDevice:(id)a3
{
  float32x2_t v5 = [a3 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  int32x2_t v6[2] = __31__RBSurface_updateUsingDevice___block_invoke;
  v6[3] = &unk_2641F9C98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __31__RBSurface_updateUsingDevice___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(void *)(a1 + 40));
  return -[RBSurface _updateWithDevice:frame:synchronized:](v1, v2, 0, 0);
}

- (void)invalidate
{
  p = self->_texture._p;
  self->_texture._p = 0;
  if (p)
  {
    int v4 = *((_DWORD *)p + 2) - 1;
    *((_DWORD *)p + 2) = v4;
    if (!v4) {
      (*(void (**)(void))(*(void *)p + 8))();
    }
  }
}

uint64_t __50__RBSurface__updateWithDevice_frame_synchronized___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (int)colorMode
{
  return self->_colorMode;
}

- (BOOL)clearsBackground
{
  return self->_clearsBackground;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float red = self->_clearColor.red;
  float green = self->_clearColor.green;
  float blue = self->_clearColor.blue;
  float alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (void).cxx_destruct
{
  p = self->_texture._p;
  if (p)
  {
    int v4 = *((_DWORD *)p + 2) - 1;
    *((_DWORD *)p + 2) = v4;
    if (!v4) {
      (*(void (**)(Texture *, SEL))(*(void *)p + 8))(p, a2);
    }
  }

  float32x2_t v5 = self->_drawable._p;
  if (v5 && atomic_fetch_add_explicit((atomic_uint *volatile)v5 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    (*(void (**)(Drawable *))(*(void *)v5 + 8))(v5);
  }
  v6 = self->_displayList._p;
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end