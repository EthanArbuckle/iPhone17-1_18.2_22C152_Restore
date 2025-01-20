@interface WFBitmapContext
+ (id)HDRCapableContextWithSize:(CGSize)a3 scale:(double)a4;
+ (id)contextWithDeviceScreenScaleAndSize:(CGSize)a3;
+ (id)contextWithSize:(CGSize)a3 scale:(double)a4;
+ (id)contextWithSize:(CGSize)a3 scale:(double)a4 flipped:(BOOL)a5;
+ (id)currentContextWithScale:(double)a3;
- (CGContext)CGContext;
- (CGSize)size;
- (WFBitmapContext)initWithCGContext:(CGContext *)a3 scale:(double)a4;
- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5;
- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6;
- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 flipped:(BOOL)a7;
- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 flipped:(BOOL)a7 hdrCapable:(BOOL)a8;
- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 hdrCapable:(BOOL)a7;
- (double)scale;
- (id)image;
- (id)imageWithOrientation:(unsigned int)a3;
- (void)becomeCurrent;
- (void)dealloc;
- (void)resignCurrent;
@end

@implementation WFBitmapContext

- (CGContext)CGContext
{
  return self->_CGContext;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)resignCurrent
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (void (*)(void))getUIGraphicsPopContextSymbolLoc_ptr;
  v9 = getUIGraphicsPopContextSymbolLoc_ptr;
  if (!getUIGraphicsPopContextSymbolLoc_ptr)
  {
    v3 = UIKitLibrary_19083();
    v7[3] = (uint64_t)dlsym(v3, "UIGraphicsPopContext");
    getUIGraphicsPopContextSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    v2 = (void (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    v2();
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"void soft_UIGraphicsPopContext(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFBitmapContext.m", 24, @"%s", dlerror());

    __break(1u);
  }
}

- (void)becomeCurrent
{
  v2 = [(WFBitmapContext *)self CGContext];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (void (*)(CGContext *))getUIGraphicsPushContextSymbolLoc_ptr;
  v10 = getUIGraphicsPushContextSymbolLoc_ptr;
  if (!getUIGraphicsPushContextSymbolLoc_ptr)
  {
    v4 = UIKitLibrary_19083();
    v8[3] = (uint64_t)dlsym(v4, "UIGraphicsPushContext");
    getUIGraphicsPushContextSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    v3 = (void (*)(CGContext *))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    v3(v2);
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"void soft_UIGraphicsPushContext(CGContextRef)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"WFBitmapContext.m", 23, @"%s", dlerror());

    __break(1u);
  }
}

- (id)imageWithOrientation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = self;
  CGImageRef Image = CGBitmapContextCreateImage([(WFBitmapContext *)v4 CGContext]);
  if (Image)
  {
    uint64_t v6 = Image;
    [(WFBitmapContext *)v4 scale];
    uint64_t v7 = +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v6, v3);
    CGImageRelease(v6);
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  return v7;
}

- (void)dealloc
{
  CGContextRelease(self->_CGContext);
  v3.receiver = self;
  v3.super_class = (Class)WFBitmapContext;
  [(WFBitmapContext *)&v3 dealloc];
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 flipped:(BOOL)a7 hdrCapable:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a3.height;
  double width = a3.width;
  v35[1] = *MEMORY[0x1E4F143B8];
  double v16 = WFEffectiveScaleForScale(a5);
  if (width <= 0.0 || height <= 0.0) {
    goto LABEL_11;
  }
  double v17 = v16;
  if (v16 == 0.0)
  {
    v18 = +[WFDevice currentDevice];
    [v18 screenScale];
    double v17 = v19;
  }
  size_t v20 = vcvtpd_u64_f64(width * v17);
  size_t v21 = vcvtpd_u64_f64(height * v17);
  if (!v8)
  {
    v29 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    v25 = CGBitmapContextCreate(0, v20, v21, 8uLL, 4 * v20, v29, 1u);
    CGColorSpaceRelease(v29);
    if (v25) {
      goto LABEL_7;
    }
LABEL_11:
    v28 = 0;
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __WFCreateBitmapContext_block_invoke;
  aBlock[3] = &__block_descriptor_41_e91_B32__0_CGBitmapContextContentInfo_IiIBB_8__CGBitmapContextInfo_IQQQQiII__CGColorSpace_BI_24l;
  BOOL v33 = a4;
  aBlock[4] = a6;
  v22 = _Block_copy(aBlock);
  uint64_t v34 = *MEMORY[0x1E4F1DB58];
  v23 = [NSNumber numberWithInt:5];
  v35[0] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

  v25 = (CGContext *)CGBitmapContextCreateWithCallbacks();
  if (!v25) {
    goto LABEL_11;
  }
LABEL_7:
  v36.size.double width = (double)v20;
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.double height = (double)v21;
  CGContextClearRect(v25, v36);
  double v26 = v17;
  if (v9)
  {
    CGContextTranslateCTM(v25, 0.0, (double)v21);
    double v26 = -v17;
  }
  CGContextScaleCTM(v25, v17, v26);
  CGContextGetCTM(&v31, v25);
  CGContextSetBaseCTM();
  v27 = [(WFBitmapContext *)self initWithCGContext:v25 scale:a5];
  CGContextRelease(v25);
  self = v27;
  v28 = self;
LABEL_12:

  return v28;
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 flipped:(BOOL)a7
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:hdrCapable:](self, "initWithSize:opaque:scale:colorspace:flipped:hdrCapable:", a4, a6, a7, 0, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6 hdrCapable:(BOOL)a7
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:hdrCapable:](self, "initWithSize:opaque:scale:colorspace:flipped:hdrCapable:", a4, a6, 1, a7, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 colorspace:(CGColorSpace *)a6
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:hdrCapable:](self, "initWithSize:opaque:scale:colorspace:hdrCapable:", a4, a6, 0, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5
{
  return -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:](self, "initWithSize:opaque:scale:colorspace:flipped:", a4, 0, 1, a3.width, a3.height, a5);
}

- (WFBitmapContext)initWithCGContext:(CGContext *)a3 scale:(double)a4
{
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFBitmapContext.m", 37, @"Invalid parameter not satisfying: %@", @"CGContext" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFBitmapContext;
  uint64_t v7 = [(WFBitmapContext *)&v12 init];
  if (v7)
  {
    v7->_scale = WFEffectiveScaleForScale(a4);
    v7->_CGContext = CGContextRetain(a3);
    BOOL v8 = v7;
  }

  return v7;
}

- (id)image
{
  return [(WFBitmapContext *)self imageWithOrientation:1];
}

+ (id)currentContextWithScale:(double)a3
{
  v4 = [WFBitmapContext alloc];
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v5 = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  v14 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    uint64_t v6 = UIKitLibrary_19083();
    v12[3] = (uint64_t)dlsym(v6, "UIGraphicsGetCurrentContext");
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    v5 = (uint64_t (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    uint64_t v7 = [(WFBitmapContext *)v4 initWithCGContext:v5() scale:a3];
    return v7;
  }
  else
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"CGContextRef  _Nullable soft_UIGraphicsGetCurrentContext(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFBitmapContext.m", 22, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

+ (id)HDRCapableContextWithSize:(CGSize)a3 scale:(double)a4
{
  v4 = -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:hdrCapable:]([WFBitmapContext alloc], "initWithSize:opaque:scale:colorspace:flipped:hdrCapable:", 0, 0, 1, 1, a3.width, a3.height, a4);
  return v4;
}

+ (id)contextWithDeviceScreenScaleAndSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "contextWithSize:scale:", a3.width, a3.height, 0.0);
}

+ (id)contextWithSize:(CGSize)a3 scale:(double)a4 flipped:(BOOL)a5
{
  v5 = -[WFBitmapContext initWithSize:opaque:scale:colorspace:flipped:]([WFBitmapContext alloc], "initWithSize:opaque:scale:colorspace:flipped:", 0, 0, a5, a3.width, a3.height, a4);
  return v5;
}

+ (id)contextWithSize:(CGSize)a3 scale:(double)a4
{
  v4 = -[WFBitmapContext initWithSize:opaque:scale:]([WFBitmapContext alloc], "initWithSize:opaque:scale:", 0, a3.width, a3.height, a4);
  return v4;
}

@end