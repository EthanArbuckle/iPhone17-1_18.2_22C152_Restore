@interface MRImage
- (BOOL)filtersNearest;
- (BOOL)hasKBOrShader;
- (BOOL)hasKenBurns;
- (BOOL)isEmpty;
- (BOOL)isOpaque;
- (BOOL)mipmapFiltersNearest;
- (BOOL)preservesAspectRatio;
- (BOOL)scaleWasFixedForTargetAspectRatio;
- (BOOL)usesBackgroundColorAsBorderColor;
- (BOOL)usesMipmap;
- (CGSize)relativeSizeInContextPixelSize:(CGSize)a3;
- (CGSize)size;
- (EAGLContext)updateGLContext;
- (MRImage)init;
- (MRImage)initWithImage:(id)a3;
- (MRImage)initWithTextureSource:(id)a3 andSize:(CGSize)a4;
- (MRImageManager)imageManager;
- (MRTexture)texture;
- (NSDictionary)shader;
- (NSMutableDictionary)userData;
- (NSString)filterID;
- (NSString)label;
- (double)aspectRatio;
- (double)centerX;
- (double)centerY;
- (double)height;
- (double)renderTime;
- (double)rotationAngle;
- (double)scale;
- (double)sourceTimestamp;
- (double)width;
- (id)insertingInCollection;
- (id)retainByUser;
- (id)retainedByUserImage;
- (id)retainedByUserImageWithShader:(id)a3;
- (int)clampMode;
- (int)retainByUserCount;
- (void)cleanup;
- (void)dealloc;
- (void)getMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4;
- (void)kenburnsMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4;
- (void)releaseByUser;
- (void)removingFromCollection;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setClampMode:(int)a3;
- (void)setFilterID:(id)a3;
- (void)setFiltersNearest:(BOOL)a3;
- (void)setHasKenBurns:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMipmapFiltersNearest:(BOOL)a3;
- (void)setOnContext:(id)a3 onTextureUnit:(unint64_t)a4 withReferenceAspectRatio:(float)a5 state:(id *)a6;
- (void)setPreservesAspectRatio:(BOOL)a3;
- (void)setRenderTime:(double)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setScaleWasFixedForTargetAspectRatio:(BOOL)a3;
- (void)setShader:(id)a3;
- (void)setSourceTimestamp:(double)a3;
- (void)setUsesBackgroundColorAsBorderColor:(BOOL)a3;
- (void)setUsesMipmap:(BOOL)a3;
- (void)unsetOnContext:(id)a3 onTextureUnit:(unint64_t)a4 state:(id *)a5;
- (void)uploadCGImage:(CGImage *)a3 toTextureRect:(CGRect)a4;
@end

@implementation MRImage

- (MRImage)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRImage;
  result = [(MRImage *)&v3 init];
  if (result)
  {
    result->_scale = 1.0;
    result->_flags |= 2u;
    result->_clampMode = 2;
  }
  return result;
}

- (MRImage)initWithImage:(id)a3
{
  v4 = [(MRImage *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_imageManager = (MRImageManager *)*((void *)a3 + 5);
    v4->_referenceImage = (MRImage *)[a3 retainByUser];
    v5->_size = *(CGSize *)((char *)a3 + 136);
    v5->_flags = *((_DWORD *)a3 + 6) & 0x4B;
  }
  return v5;
}

- (MRImage)initWithTextureSource:(id)a3 andSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v7 = [(MRImage *)self init];
  if (v7)
  {
    v7->_imageManager = (MRImageManager *)[a3 imageManager];
    v7->_textureSource = (MRTextureSource *)a3;
    v7->_size.CGFloat width = width;
    v7->_size.CGFloat height = height;
    if (*((unsigned char *)[a3 textureOptions] + 4)) {
      v7->_flags |= 8u;
    }
  }
  return v7;
}

- (void)dealloc
{
  [(MRImage *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRImage;
  [(MRImage *)&v3 dealloc];
}

- (void)cleanup
{
  if (self->_imageManager)
  {
    objc_sync_enter(self);
    referenceImage = self->_referenceImage;
    if (referenceImage)
    {
      [(MRImage *)referenceImage releaseByUser];
      self->_referenceImage = 0;
    }
    textureSource = self->_textureSource;
    if (textureSource)
    {

      self->_textureSource = 0;
    }
    texture = self->_texture;
    if (texture)
    {
      if ([(MRTexture *)texture isShared]) {
        [(MRImageManager *)self->_imageManager recycleTexture:self->_texture];
      }

      self->_texture = 0;
    }
    self->_imageManager = 0;
    self->_size.CGFloat width = 0.0;
    self->_size.CGFloat height = 0.0;
    userData = self->_userData;
    if (userData)
    {

      self->_userData = 0;
    }
    shader = self->_shader;
    if (shader)
    {

      self->_shader = 0;
    }
    filterID = self->_filterID;
    if (filterID)
    {

      self->_filterID = 0;
    }
    label = self->_label;
    if (label)
    {

      self->_label = 0;
    }
    objc_sync_exit(self);
  }
}

- (id)retainByUser
{
  return self;
}

- (void)releaseByUser
{
  if (atomic_fetch_add(&self->_retainByUserCount, 0xFFFFFFFF) == 1)
  {
    v2 = self;
    [(MRImage *)self cleanup];
    self = v2;
  }
}

- (id)insertingInCollection
{
  return self;
}

- (void)removingFromCollection
{
  v2 = self;
  [(MRImage *)v2 releaseByUser];
}

- (id)retainedByUserImage
{
  v2 = [[MRImage alloc] initWithImage:self];

  return v2;
}

- (id)retainedByUserImageWithShader:(id)a3
{
  v4 = [[MRImage alloc] initWithImage:self];

  [(MRImage *)v4 setShader:a3];
  return v4;
}

- (BOOL)usesBackgroundColorAsBorderColor
{
  return self->_flags & 1;
}

- (void)setUsesBackgroundColorAsBorderColor:(BOOL)a3
{
  unsigned int flags = self->_flags;
  if (a3)
  {
    self->_unsigned int flags = flags | 1;
    self->_clampMode = 1;
  }
  else
  {
    self->_unsigned int flags = flags & 0xFFFFFFFE;
  }
}

- (BOOL)filtersNearest
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)setFiltersNearest:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFEF | v3;
}

- (BOOL)isOpaque
{
  v2 = [(MRImage *)self texture];
  return [(MRTexture *)v2 isOpaque];
}

- (BOOL)usesMipmap
{
  referenceImage = self->_referenceImage;
  if (referenceImage) {
    LOBYTE(v4) = [(MRImage *)referenceImage usesMipmap];
  }
  else {
    return (LOBYTE(self->_flags) >> 3) & 1;
  }
  return v4;
}

- (void)setUsesMipmap:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFF7 | v3;
}

- (BOOL)mipmapFiltersNearest
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (void)setMipmapFiltersNearest:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFDF | v3;
}

- (BOOL)preservesAspectRatio
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)setPreservesAspectRatio:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFFD | v3;
}

- (BOOL)hasKenBurns
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (void)setHasKenBurns:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFFB | v3;
}

- (BOOL)scaleWasFixedForTargetAspectRatio
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (void)setScaleWasFixedForTargetAspectRatio:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_unsigned int flags = self->_flags & 0xFFFFFFBF | v3;
}

- (void)setLabel:(id)a3
{
  label = self->_label;
  if (label != a3)
  {

    v6 = (NSString *)[a3 copy];
    self->_label = v6;
    texture = self->_texture;
    if (texture)
    {
      [(MRTexture *)texture setLabel:v6];
    }
  }
}

- (NSMutableDictionary)userData
{
  objc_sync_enter(self);
  userData = self->_userData;
  if (!userData)
  {
    userData = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_userData = userData;
  }
  BOOL v4 = userData;
  objc_sync_exit(self);
  return v4;
}

- (double)width
{
  return self->_size.width;
}

- (double)height
{
  return self->_size.height;
}

- (double)aspectRatio
{
  return self->_size.width / self->_size.height;
}

- (BOOL)isEmpty
{
  return self->_size.width <= 0.0 || self->_size.height <= 0.0;
}

- (void)kenburnsMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4
{
  *(float *)v4.i32 = a4;
  double scale = self->_scale;
  if (scale > 0.0)
  {
    float v8 = 1.0 / scale;
    float v9 = v8;
  }
  else
  {
    float v9 = 1.0;
  }
  float v10 = self->_size.width / self->_size.height;
  if (self->_rotationAngle == 0.0)
  {
    MRMatrix_SetDiagonal((uint64_t)a3, v9, (float)(v9 * v10) / *(float *)v4.i32, 1.0);
  }
  else
  {
    int32x2_t v13 = v4;
    MRMatrix_SetDiagonal((uint64_t)a3, 1.0, 1.0 / *(float *)v4.i32, 1.0);
    float v11 = self->_rotationAngle * 57.2957764;
    MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)a3, 0.0, 0.0, v11);
    float32x2_t v12 = vdiv_f32(*(float32x2_t *)(a3 + 4), (float32x2_t)vdup_lane_s32(v13, 0));
    *((float32x2_t *)a3 + 2) = v12;
    v12.f32[0] = v9;
    MRMatrix_Scale((float32x2_t *)a3, v12, v9 * v10, 1.0);
  }
  *((float32x2_t *)a3 + 6) = vcvt_f32_f64(vaddq_f64(*(float64x2_t *)&self->_centerX, vcvtq_f64_f32(*(float32x2_t *)(a3 + 12))));
}

- (void)getMatrix:(float)a3[16] forReferenceAspectRatio:(float)a4
{
  referenceImage = self->_referenceImage;
  if (referenceImage)
  {
    double v8 = 0.0;
    if (a4 > 0.0)
    {
      [(MRImage *)self aspectRatio];
      *(float *)&double v8 = v8;
    }
    [(MRImage *)referenceImage getMatrix:a3 forReferenceAspectRatio:v8];
    goto LABEL_26;
  }
  unsigned int v9 = [(MRTexture *)[(MRImage *)self texture] textureTarget];
  if (a4 <= 0.0)
  {
    if (v9 == 3553)
    {
      float var1 = 1.0;
      float var0 = 1.0;
      float v13 = -1.0;
    }
    else
    {
      $85CD2974BE96D4886BB301820D1C36C2 v17 = [(MRTexture *)self->_texture size];
      float var0 = (float)v17.var0;
      float var1 = (float)v17.var1;
      float v13 = -(float)v17.var1;
    }
    MRMatrix_SetDiagonal((uint64_t)a3, var0, v13, 1.0);
  }
  else
  {
    if (v9 == 3553)
    {
      float var1 = 0.5;
      MRMatrix_SetDiagonal((uint64_t)a3, 0.5, -0.5, 1.0);
      a3[13] = 0.5;
      uint64_t v11 = 12;
      goto LABEL_14;
    }
    $85CD2974BE96D4886BB301820D1C36C2 v14 = [(MRTexture *)self->_texture size];
    float v15 = (float)v14.var0 * 0.5;
    float v16 = (float)v14.var1;
    MRMatrix_SetDiagonal((uint64_t)a3, v15, (float)v14.var1 * -0.5, 1.0);
    a3[12] = v15;
    float var1 = v16 * 0.5;
  }
  uint64_t v11 = 13;
LABEL_14:
  a3[v11] = var1;
  unsigned __int8 v18 = [(MRTexture *)[(MRImage *)self texture] orientation];
  if ((v18 & 0xFE) != 0)
  {
    unsigned __int8 v19 = v18;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    MRMatrix_Clear((uint64_t)&v26);
    switch(v19)
    {
      case 2u:
        goto LABEL_20;
      case 3u:
        DWORD1(v27) = -1082130432;
LABEL_20:
        LODWORD(v26) = -1082130432;
        break;
      case 4u:
        DWORD1(v27) = -1082130432;
        break;
      case 5u:
        uint64_t v20 = 3212836864;
        unint64_t v21 = 0xBF80000000000000;
        goto LABEL_22;
      case 6u:
        unint64_t v22 = 0x3F80000000000000;
        uint64_t v23 = 3212836864;
        goto LABEL_24;
      case 7u:
        uint64_t v20 = 1065353216;
        unint64_t v21 = 0x3F80000000000000;
LABEL_22:
        *(void *)&long long v27 = v20;
        *(void *)&long long v26 = v21;
        break;
      case 8u:
        unint64_t v22 = 0xBF80000000000000;
        uint64_t v23 = 1065353216;
LABEL_24:
        *(void *)&long long v26 = v22;
        *(void *)&long long v27 = v23;
        break;
      default:
        break;
    }
    MRMatrix_PreMultiply((float *)&v26, (uint64_t)a3);
  }
LABEL_26:
  if (a4 > 0.0 && (self->_flags & 2) != 0)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    [(MRImage *)self kenburnsMatrix:&v26 forReferenceAspectRatio:COERCE_DOUBLE((unint64_t)LODWORD(a4))];
    MRMatrix_PreMultiply((float *)&v26, (uint64_t)a3);
  }
  else
  {
    double scale = self->_scale;
    float v25 = 1.0;
    if (scale > 0.0) {
      float v25 = 1.0 / scale;
    }
    *a3 = v25 * *a3;
    a3[5] = v25 * a3[5];
    *((float32x2_t *)a3 + 6) = vcvt_f32_f64(vsubq_f64(vcvtq_f64_f32(*(float32x2_t *)(a3 + 12)), *(float64x2_t *)&self->_centerX));
  }
}

- (void)setOnContext:(id)a3 onTextureUnit:(unint64_t)a4 withReferenceAspectRatio:(float)a5 state:(id *)a6
{
}

- (void)unsetOnContext:(id)a3 onTextureUnit:(unint64_t)a4 state:(id *)a5
{
}

- (CGSize)relativeSizeInContextPixelSize:(CGSize)a3
{
  double v3 = (self->_size.width + self->_size.width) / a3.width;
  double v4 = (self->_size.height + self->_size.height) / a3.height;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (NSString)filterID
{
  CGSize result = self->_filterID;
  if (!result)
  {
    CGSize result = (NSString *)&self->_referenceImage->super.isa;
    if (result) {
      return (NSString *)[(NSString *)result filterID];
    }
  }
  return result;
}

- (BOOL)hasKBOrShader
{
  return self->_shader
      || self->_centerX != 0.0
      || self->_centerY != 0.0
      || self->_scale != 1.0
      || self->_rotationAngle != 0.0;
}

- (MRTexture)texture
{
  referenceImage = self->_referenceImage;
  if (referenceImage)
  {
    return [(MRImage *)referenceImage texture];
  }
  else
  {
    CGSize result = self->_texture;
    if (!result)
    {
      CGSize result = (MRTexture *)self->_textureSource;
      if (result)
      {
        CGSize result = (MRTexture *)[(MRTexture *)result texture];
        self->_texture = result;
      }
    }
  }
  return result;
}

- (EAGLContext)updateGLContext
{
  v2 = [(MRImage *)self texture];
  return [(MRTexture *)v2 glContext];
}

- (void)uploadCGImage:(CGImage *)a3 toTextureRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  unsigned int v9 = [(MRImage *)self texture];
  unsigned int v10 = [(MRTexture *)v9 isMonochromatic];
  double v11 = 4.0;
  if (v10) {
    double v11 = 1.0;
  }
  size_t v12 = (unint64_t)(width * v11);
  if (v10) {
    uint32_t v13 = 0;
  }
  else {
    uint32_t v13 = 8194;
  }
  $85CD2974BE96D4886BB301820D1C36C2 v14 = malloc_type_malloc((unint64_t)(height * (double)(unint64_t)(width * v11)), 0x3938B2A8uLL);
  ColorSpace = CGImageGetColorSpace(a3);
  float v16 = CGBitmapContextCreate(v14, (unint64_t)width, (unint64_t)height, 8uLL, v12, ColorSpace, v13);
  CGContextSetBlendMode(v16, kCGBlendModeCopy);
  v18.origin.double x = 0.0;
  v18.origin.double y = 0.0;
  v18.size.double width = width;
  v18.size.double height = height;
  CGContextDrawImage(v16, v18, a3);
  CGContextRelease(v16);
  -[MRTexture uploadData:rowBytes:toRect:](v9, "uploadData:rowBytes:toRect:", v14, v12, x, y, width, height);
  free(v14);
}

- (MRImageManager)imageManager
{
  return self->_imageManager;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (void)setFilterID:(id)a3
{
}

- (NSDictionary)shader
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setShader:(id)a3
{
}

- (double)sourceTimestamp
{
  return self->_sourceTimestamp;
}

- (void)setSourceTimestamp:(double)a3
{
  self->_sourceTimestamp = a3;
}

- (double)renderTime
{
  return self->_renderTime;
}

- (void)setRenderTime:(double)a3
{
  self->_renderTime = a3;
}

- (int)clampMode
{
  return self->_clampMode;
}

- (void)setClampMode:(int)a3
{
  self->_clampMode = a3;
}

- (int)retainByUserCount
{
  return self->_retainByUserCount;
}

- (NSString)label
{
  return self->_label;
}

@end