@interface MRTextureSource
- ($34D90DBCE5BAE006D482B7C15EEFCEBA)textureOptions;
- ($85CD2974BE96D4886BB301820D1C36C2)size;
- (BOOL)wantsSharedTexture;
- (MRImageManager)imageManager;
- (MRTexture)texture;
- (MRTextureSource)initWithCGContext:(CGContext *)a3 imageManager:(id)a4;
- (MRTextureSource)initWithCGContext:(CGContext *)a3 size:(id)a4 imageManager:(id)a5;
- (MRTextureSource)initWithCGImage:(CGImage *)a3 textureSize:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7;
- (MRTextureSource)initWithCVPixelBuffer:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7;
- (MRTextureSource)initWithCVTexture:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7;
- (MRTextureSource)initWithSize:(id)a3 andColor:(const float *)a4 imageManager:(id)a5;
- (void)addOverlayForROI:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)generateMipmap;
- (void)setWantsSharedTexture:(BOOL)a3;
@end

@implementation MRTextureSource

- (MRTextureSource)initWithSize:(id)a3 andColor:(const float *)a4 imageManager:(id)a5
{
  result = [(MRTextureSource *)self init];
  if (result)
  {
    result->_imageManager = (MRImageManager *)a5;
    result->_size = ($DFC8CE4431498B03249AF47446AA0C66)a3;
    if (a4)
    {
      result->_color[0] = *a4;
      result->_color[1] = a4[1];
      result->_color[2] = a4[2];
      float v9 = a4[3];
    }
    else
    {
      float v9 = -1.0;
    }
    result->_color[3] = v9;
    result->_isOpaque = v9 >= 1.0;
  }
  return result;
}

- (MRTextureSource)initWithCGImage:(CGImage *)a3 textureSize:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7
{
  BOOL v7 = a7;
  unsigned __int8 v9 = a5;
  v12 = [(MRTextureSource *)self init];
  v13 = v12;
  if (!v12) {
    return v13;
  }
  v12->_imageManager = (MRImageManager *)a6;
  v12->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
  v12->_orientation = v9;
  ColorSpace = CGImageGetColorSpace(a3);
  if (v7)
  {
    v13->_textureOptions.wantsMonochromatic = 1;
    *($85CD2974BE96D4886BB301820D1C36C2 *)&v13->_dataWidth = a4;
    unsigned int var0 = a4.var0;
  }
  else
  {
    if (ColorSpace)
    {
      CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
      v13->_textureOptions.wantsMonochromatic = Model == kCGColorSpaceModelMonochrome;
      *($85CD2974BE96D4886BB301820D1C36C2 *)&v13->_dataWidth = a4;
      unsigned int var0 = a4.var0;
      if (Model == kCGColorSpaceModelMonochrome) {
        goto LABEL_9;
      }
    }
    else
    {
      v13->_textureOptions.wantsMonochromatic = 0;
      *($85CD2974BE96D4886BB301820D1C36C2 *)&v13->_dataWidth = a4;
    }
    unsigned int var0 = 4 * a4.var0;
  }
LABEL_9:
  v13->_dataRowBytes = var0;
  size_t v17 = var0 * a4.var1;
  v13->_dataSize = v17;
  v13->_datas[0] = malloc_type_malloc(v17, 0x5A6CDCADuLL);
  v13->_ownsData = 1;
  if (v13->_textureOptions.wantsMonochromatic) {
    v18 = [(MRContext *)[(MRImageManager *)v13->_imageManager baseContext] monochromaticColorSpace];
  }
  else {
    v18 = (CGColorSpace *)objc_msgSend(objc_msgSend(a6, "baseContext"), "colorSpace");
  }
  v13->_colorspace = v18;
  CGColorSpaceRetain(v18);
  if (v13->_textureOptions.wantsMonochromatic) {
    uint32_t v19 = 0;
  }
  else {
    uint32_t v19 = 8194;
  }
  v20 = CGBitmapContextCreate(v13->_datas[0], v13->_dataWidth, v13->_dataHeight, 8uLL, v13->_dataRowBytes, v13->_colorspace, v19);
  v13->_isPremultiplied = 1;
  CGContextSetBlendMode(v20, kCGBlendModeCopy);
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = (double)a4.var0;
  v23.size.height = (double)a4.var1;
  CGContextDrawImage(v20, v23, a3);
  CGContextRelease(v20);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  v13->_isOpaque = (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo);
  return v13;
}

- (MRTextureSource)initWithCVPixelBuffer:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7
{
  unsigned __int8 v9 = a5;
  v12 = [(MRTextureSource *)self init];
  v13 = v12;
  if (v12)
  {
    v12->_imageManager = (MRImageManager *)a6;
    v12->_cvPixelBuffer = CVPixelBufferRetain(a3);
    v13->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
    v13->_orientation = v9;
    v13->_textureOptions.wantsMonochromatic = a7;
    v13->_isOpaque = 1;
  }
  return v13;
}

- (MRTextureSource)initWithCVTexture:(__CVBuffer *)a3 size:(id)a4 orientation:(int64_t)a5 imageManager:(id)a6 monochromatic:(BOOL)a7
{
  unsigned __int8 v9 = a5;
  v12 = [(MRTextureSource *)self init];
  v13 = v12;
  if (v12)
  {
    v12->_imageManager = (MRImageManager *)a6;
    v12->_cvTexture = CVBufferRetain(a3);
    v13->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
    v13->_orientation = v9;
    v13->_textureOptions.wantsMonochromatic = a7;
    v13->_isOpaque = 1;
  }
  return v13;
}

- (MRTextureSource)initWithCGContext:(CGContext *)a3 size:(id)a4 imageManager:(id)a5
{
  v8 = [(MRTextureSource *)self init];
  unsigned __int8 v9 = v8;
  if (v8)
  {
    v8->_imageManager = (MRImageManager *)a5;
    v8->_size = ($DFC8CE4431498B03249AF47446AA0C66)a4;
    v8->_textureOptions.wantsMonochromatic = CGBitmapContextGetBitsPerPixel(a3) < 9;
    v9->_cgContext = CGContextRetain(a3);
    v9->_dataWidth = CGBitmapContextGetWidth(a3);
    v9->_dataHeight = CGBitmapContextGetHeight(a3);
    unsigned int BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    v9->_dataRowBytes = BytesPerRow;
    v9->_dataSize = v9->_size.height * BytesPerRow;
    v9->_datas[0] = CGBitmapContextGetData(a3);
    CGImageAlphaInfo AlphaInfo = CGBitmapContextGetAlphaInfo(a3);
    v9->_isPremultiplied = AlphaInfo - 1 < 2;
    v9->_isOpaque = (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo);
  }
  return v9;
}

- (MRTextureSource)initWithCGContext:(CGContext *)a3 imageManager:(id)a4
{
  unsigned int Width = CGBitmapContextGetWidth(a3);
  unint64_t v8 = Width | ((unint64_t)CGBitmapContextGetHeight(a3) << 32);
  return [(MRTextureSource *)self initWithCGContext:a3 size:v8 imageManager:a4];
}

- (void)dealloc
{
  [(MRTextureSource *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRTextureSource;
  [(MRTextureSource *)&v3 dealloc];
}

- (void)cleanup
{
  p_imageManager = &self->_imageManager;
  if (self->_imageManager)
  {
    objc_sync_enter(self);
    cgContext = self->_cgContext;
    if (cgContext)
    {
      CGContextRelease(cgContext);
      self->_cgContext = 0;
    }
    colorspace = self->_colorspace;
    if (colorspace)
    {
      CGColorSpaceRelease(colorspace);
      self->_colorspace = 0;
    }
    cgImage = self->_cgImage;
    if (cgImage)
    {
      CGImageRelease(cgImage);
      self->_cgImage = 0;
    }
    cvTexture = self->_cvTexture;
    if (cvTexture)
    {
      CVBufferRelease(cvTexture);
      self->_cvTexture = 0;
    }
    for (uint64_t i = 80; i != 104; i += 8)
    {
      unsigned __int8 v9 = *(Class *)((char *)&self->super.isa + i);
      if (v9)
      {
        if (i != 80 || self->_ownsData) {
          free(v9);
        }
        *(Class *)((char *)&self->super.isa + i) = 0;
      }
    }
    self->_dataSize = 0;
    *(void *)&self->_dataRowBytes = 0;
    self->_dataHeight = 0;
    cvPixelBuffer = self->_cvPixelBuffer;
    if (cvPixelBuffer)
    {
      CVPixelBufferRelease(cvPixelBuffer);
      self->_cvPixelBuffer = 0;
    }
    texture = self->_texture;
    if (texture)
    {

      self->_texture = 0;
    }
    self->_pixelFormat = 0;
    *p_imageManager = 0;
    p_imageManager[1] = 0;
    objc_sync_exit(self);
  }
}

- (void)generateMipmap
{
  self->_textureOptions.wantsMipmap = 1;
  if (self->_datas[0])
  {
    uint64_t v3 = 0;
    dataunsigned int Width = self->_dataWidth;
    size_t dataHeight = self->_dataHeight;
    size_t dataRowBytes = self->_dataRowBytes;
    size_t dataSize = self->_dataSize;
    do
    {
      if (self->_textureOptions.wantsMonochromatic) {
        CGBitmapInfo v8 = 0;
      }
      else {
        CGBitmapInfo v8 = 8194;
      }
      CGImageRef v9 = CGImageRetain(self->_cgImage);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
      }
      else
      {
        v11 = CGDataProviderCreateWithData(0, self->_datas[v3], dataSize, 0);
        if (v11)
        {
          if (self->_textureOptions.wantsMonochromatic) {
            size_t v13 = 8;
          }
          else {
            size_t v13 = 32;
          }
          v10 = CGImageCreate(dataWidth, dataHeight, 8uLL, v13, dataRowBytes, self->_colorspace, v8, v11, 0, 1, kCGRenderingIntentDefault);
          char v12 = 0;
          goto LABEL_14;
        }
        v10 = 0;
      }
      char v12 = 1;
LABEL_14:
      dataWidth >>= 1;
      dataHeight >>= 1;
      if (self->_textureOptions.wantsMonochromatic) {
        size_t dataRowBytes = dataWidth;
      }
      else {
        size_t dataRowBytes = 4 * dataWidth;
      }
      size_t dataSize = dataRowBytes * dataHeight;
      v14 = malloc_type_malloc(dataRowBytes * dataHeight, 0x7BEA59BDuLL);
      self->_datas[v3 + 1] = v14;
      v15 = CGBitmapContextCreate(v14, dataWidth, dataHeight, 8uLL, dataRowBytes, self->_colorspace, v8);
      CGContextSetBlendMode(v15, kCGBlendModeCopy);
      v17.origin.x = 0.0;
      v17.origin.y = 0.0;
      v17.size.width = (double)dataWidth;
      v17.size.height = (double)dataHeight;
      CGContextDrawImage(v15, v17, v10);
      CGContextRelease(v15);
      if ((v12 & 1) == 0) {
        CGDataProviderRelease(v11);
      }
      CGImageRelease(v10);
      ++v3;
    }
    while (v3 != 2);
  }
  cgImage = self->_cgImage;
  if (cgImage)
  {
    CGImageRelease(cgImage);
    self->_cgImage = 0;
  }
}

- ($34D90DBCE5BAE006D482B7C15EEFCEBA)textureOptions
{
  return ($34D90DBCE5BAE006D482B7C15EEFCEBA *)&self->_textureOptions;
}

- (MRTexture)texture
{
  if (!self->_size.width || !self->_size.height) {
    return 0;
  }
  texture = self->_texture;
  if (!texture)
  {
    objc_sync_enter(self);
    imageManager = self->_imageManager;
    if (imageManager)
    {
      texture = self->_texture;
      if (!texture)
      {
        self->_textureOptions.textureTarget = 3553;
        if (self->_cvTexture)
        {
          v5 = [MRTexture alloc];
          uint64_t Name = CVOpenGLESTextureGetName(self->_cvTexture);
          BOOL v7 = [(MRTexture *)v5 initWithTextureName:Name textureTarget:CVOpenGLESTextureGetTarget(self->_cvTexture) size:*(void *)&self->_size inGLContext:[(MRImageManager *)self->_imageManager imageGLContext] options:&self->_textureOptions];
LABEL_8:
          self->_texture = v7;
LABEL_9:
          [(MRTexture *)self->_texture setOrientation:self->_orientation];
          [(MRTexture *)self->_texture setIsPremultiplied:self->_isPremultiplied];
          [(MRTexture *)self->_texture setIsOpaque:self->_isOpaque];
          objc_sync_exit(self);
          return self->_texture;
        }
        if (self->_cvPixelBuffer)
        {
          self->_textureOptions.wantsYUV = CVPixelBufferGetPixelFormatType(self->_cvPixelBuffer) == 846624121;
          if (!CVPixelBufferLockBaseAddress(self->_cvPixelBuffer, 0))
          {
            BaseAddress = CVPixelBufferGetBaseAddress(self->_cvPixelBuffer);
            if (BaseAddress)
            {
              v10 = [MRTexture alloc];
              size_t Width = CVPixelBufferGetWidth(self->_cvPixelBuffer);
              size_t Height = CVPixelBufferGetHeight(self->_cvPixelBuffer);
              self->_texture = [(MRTexture *)v10 initWithData:BaseAddress width:Width height:Height rowBytes:CVPixelBufferGetBytesPerRow(self->_cvPixelBuffer) inGLContext:[(MRImageManager *)self->_imageManager imageGLContext] options:&self->_textureOptions];
            }
            CVPixelBufferUnlockBaseAddress(self->_cvPixelBuffer, 0);
          }
          goto LABEL_9;
        }
        datas = self->_datas;
        if (!self->_datas[0])
        {
          if (!self->_textureOptions.wantsFloatTexture)
          {
            self->_texture = (MRTexture *)[(MRImageManager *)imageManager fboTextureWithSize:*(void *)&self->_size];
            if (self->_color[3] >= 0.0)
            {
              v29 = +[EAGLContext currentContext];
              v30 = v29;
              if (v29 != [(MRTexture *)self->_texture glContext]) {
                +[EAGLContext setCurrentContext:[(MRTexture *)self->_texture glContext]];
              }
              glClearColor(self->_color[0], self->_color[1], self->_color[2], self->_color[3]);
              glClear(0x4000u);
              glFlush();
              if (+[EAGLContext currentContext] != v29) {
                +[EAGLContext setCurrentContext:v29];
              }
            }
            goto LABEL_9;
          }
          BOOL v7 = [[MRTexture alloc] initWithSize:*(void *)&self->_size inGLContext:[(MRImageManager *)self->_imageManager imageGLContext] options:&self->_textureOptions];
          goto LABEL_8;
        }
        if (self->_datas[1])
        {
          v14 = [MRTexture alloc];
          v15 = self->_datas[2];
          datasize_t Width = self->_dataWidth;
          uint64_t dataHeight = self->_dataHeight;
          uint64_t dataRowBytes = self->_dataRowBytes;
          uint32_t v19 = [(MRImageManager *)self->_imageManager imageGLContext];
          if (v15) {
            uint64_t v20 = 3;
          }
          else {
            uint64_t v20 = 2;
          }
          v21 = [(MRTexture *)v14 initWithDatas:self->_datas dataCount:v20 width:dataWidth height:dataHeight rowBytes:dataRowBytes inGLContext:v19 options:&self->_textureOptions];
        }
        else
        {
          if (self->_wantsSharedTexture)
          {
            self->_textureOptions.wantsFloatTexture = 0;
            self->_textureOptions.wantsMipmap = 0;
            v22 = (MRTexture *)[(MRImageManager *)imageManager textureWithSize:*(void *)&self->_size options:&self->_textureOptions];
            self->_texture = v22;
            LODWORD(v23) = self->_size.width;
            LODWORD(v24) = self->_size.height;
            -[MRTexture uploadData:rowBytes:toRect:](v22, "uploadData:rowBytes:toRect:", self->_datas[0], self->_dataRowBytes, 0.0, 0.0, (double)v23, (double)v24);
            goto LABEL_30;
          }
          v21 = [[MRTexture alloc] initWithData:self->_datas[0] width:self->_dataWidth height:self->_dataHeight rowBytes:self->_dataRowBytes inGLContext:[(MRImageManager *)self->_imageManager imageGLContext] options:&self->_textureOptions];
        }
        self->_texture = v21;
LABEL_30:
        cgContext = self->_cgContext;
        if (cgContext)
        {
          CGContextRelease(cgContext);
          self->_cgContext = 0;
        }
        for (uint64_t i = 0; i != 3; ++i)
        {
          v27 = datas[i];
          if (v27)
          {
            if (i * 8 || self->_ownsData) {
              free(v27);
            }
            datas[i] = 0;
          }
        }
        self->_size_t dataSize = 0;
        *(void *)&self->_uint64_t dataRowBytes = 0;
        *(void *)((char *)&self->_dataWidth + 1) = 0;
        cgImage = self->_cgImage;
        if (cgImage)
        {
          CGImageRelease(cgImage);
          self->_cgImage = 0;
        }
        goto LABEL_9;
      }
    }
    else
    {
      texture = 0;
    }
    objc_sync_exit(self);
  }
  return texture;
}

- (void)addOverlayForROI:(id)a3
{
  v4 = self->_datas[0];
  if (v4)
  {
    if (self->_textureOptions.wantsMonochromatic) {
      uint32_t v6 = 0;
    }
    else {
      uint32_t v6 = 8194;
    }
    BOOL v7 = CGBitmapContextCreate(v4, self->_dataWidth, self->_dataHeight, 8uLL, self->_dataRowBytes, self->_colorspace, v6);
    v12[0] = xmmword_165860;
    v12[1] = unk_165870;
    CGContextSetStrokeColorSpace(v7, self->_colorspace);
    CGContextSetStrokeColor(v7, (const CGFloat *)v12);
    CGContextSetBlendMode(v7, kCGBlendModeNormal);
    CGContextSetLineWidth(v7, 3.0);
    CGRect v13 = CGRectFromString((NSString *)a3);
    LODWORD(v8) = self->_dataWidth;
    LODWORD(v9) = self->_dataHeight;
    double v10 = (double)v8;
    v13.origin.x = v13.origin.x * v10;
    double v11 = (double)v9;
    v13.origin.y = v13.origin.y * v11;
    v13.size.width = v13.size.width * v10;
    v13.size.height = v13.size.height * v11;
    CGContextStrokeRect(v7, v13);
    CGContextRelease(v7);
  }
}

- (MRImageManager)imageManager
{
  return self->_imageManager;
}

- ($85CD2974BE96D4886BB301820D1C36C2)size
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_size;
}

- (BOOL)wantsSharedTexture
{
  return self->_wantsSharedTexture;
}

- (void)setWantsSharedTexture:(BOOL)a3
{
  self->_wantsSharedTexture = a3;
}

@end