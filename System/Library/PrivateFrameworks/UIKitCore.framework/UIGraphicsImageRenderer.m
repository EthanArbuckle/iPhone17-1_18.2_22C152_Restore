@interface UIGraphicsImageRenderer
+ (CGContext)contextWithFormat:(id)a3;
+ (Class)rendererContextClass;
+ (void)prepareCGContext:(CGContext *)a3 withRendererContext:(id)a4;
- (BOOL)allowsImageOutput;
- (NSData)JPEGDataWithCompressionQuality:(CGFloat)compressionQuality actions:(UIGraphicsImageDrawingActions)actions;
- (NSData)PNGDataWithActions:(UIGraphicsImageDrawingActions)actions;
- (UIGraphicsImageRenderer)init;
- (UIGraphicsImageRenderer)initWithBounds:(CGRect)a3;
- (UIGraphicsImageRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsImageRendererFormat *)format;
- (UIGraphicsImageRenderer)initWithSize:(CGSize)size;
- (UIGraphicsImageRenderer)initWithSize:(CGSize)size format:(UIGraphicsImageRendererFormat *)format;
- (UIImage)imageWithActions:(UIGraphicsImageDrawingActions)actions;
- (void)_prepareContextForReuse:(CGContext *)a3;
- (void)pushContext:(id)a3;
@end

@implementation UIGraphicsImageRenderer

- (UIGraphicsImageRenderer)initWithSize:(CGSize)size format:(UIGraphicsImageRendererFormat *)format
{
  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsImageRenderer;
  return -[UIGraphicsRenderer initWithBounds:format:](&v5, sel_initWithBounds_format_, format, 0.0, 0.0, size.width, size.height);
}

- (UIImage)imageWithActions:(UIGraphicsImageDrawingActions)actions
{
  UIGraphicsImageDrawingActions v4 = actions;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__108;
  v14 = __Block_byref_object_dispose__108;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__UIGraphicsImageRenderer_imageWithActions___block_invoke;
  v9[3] = &unk_1E52F1630;
  v9[4] = &v10;
  [(UIGraphicsRenderer *)self runDrawingActions:v4 completionActions:v9 error:0];
  objc_super v5 = (void *)v11[5];
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = objc_alloc_init(UIImage);
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)allowsImageOutput
{
  return 1;
}

+ (Class)rendererContextClass
{
  return (Class)objc_opt_class();
}

void __44__UIGraphicsImageRenderer_imageWithActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 currentImage];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)pushContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = malloc_type_malloc(0x10uLL, 0x10000409B4BCFF8uLL);
  objc_super v5 = [v3 format];
  [v5 scale];
  *(void *)uint64_t v4 = v6;

  v7 = [v3 format];
  v4[8] = [v7 opaque];

  v8 = (CGContext *)[v3 CGContext];
  ContextStack = (int *)GetContextStack(1);
  CGContextRef v10 = CGContextRetain(v8);
  int v11 = *ContextStack;
  uint64_t v12 = &ContextStack[6 * *ContextStack];
  *((void *)v12 + 1) = v10;
  v12[4] = 1;
  *((void *)v12 + 3) = v4;
  int *ContextStack = v11 + 1;
}

+ (void)prepareCGContext:(CGContext *)a3 withRendererContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 format];
  int Type = CGContextGetType();
  [v6 _contextScale];
  double v9 = v8;
  if (Type == 9)
  {
    [v6 bounds];
    size_t Width = vcvtpd_u64_f64(v9 * v10);
    size_t Height = vcvtpd_u64_f64(v9 * v12);
  }
  else
  {
    size_t Width = CGBitmapContextGetWidth(a3);
    size_t Height = CGBitmapContextGetHeight(a3);
  }
  v22.size.width = (double)Width;
  CGFloat v14 = (double)Height;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.height = (double)Height;
  CGContextClearRect(a3, v22);
  CGContextTranslateCTM(a3, 0.0, v14);
  CGContextScaleCTM(a3, v9, -v9);
  id v15 = [v5 format];

  [v15 bounds];
  double v17 = v16;
  double v19 = v18;

  if (v17 != *MEMORY[0x1E4F1DAD8] || v19 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
    CGContextTranslateCTM(a3, -v17, -v19);
  }
  CGContextGetCTM(&v21, a3);
  CGContextSetBaseCTM();
}

+ (CGContext)contextWithFormat:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 _contextScale];
  double v5 = v4;
  [v3 bounds];
  size_t v7 = vcvtpd_u64_f64(v5 * v6);
  size_t v9 = vcvtpd_u64_f64(v5 * v8);
  uint64_t v10 = [v3 preferredRange];
  size_t v11 = 0;
  uint32_t v12 = 0;
  char v13 = 1;
  if (v10 > 99)
  {
    if (v10 > 32765)
    {
      if (v10 == 32766)
      {
        [v3 opaque];
        if (qword_1EB25CE90 != -1) {
          dispatch_once(&qword_1EB25CE90, &__block_literal_global_121);
        }
        CGFloat v14 = (CGColorSpace *)qword_1EB25CE88;
        uint32_t v12 = [v3 opaque] ^ 1;
LABEL_47:
        size_t v11 = 8;
      }
      else
      {
        if (v10 == 0x7FFF) {
          size_t v11 = 8;
        }
        else {
          size_t v11 = 0;
        }
        if (v10 == 0x7FFF) {
          uint32_t v12 = 7;
        }
        else {
          uint32_t v12 = 0;
        }
        CGFloat v14 = 0;
        char v13 = 1;
      }
    }
    else
    {
      if (v10 == 100)
      {
        if (qword_1EB25CE60 != -1) {
          dispatch_once(&qword_1EB25CE60, &__block_literal_global_115);
        }
        CGFloat v14 = (CGColorSpace *)qword_1EB25CE58;
      }
      else
      {
        CGFloat v14 = 0;
        if (v10 != 101) {
          goto LABEL_48;
        }
        if (qword_1EB25CE70 != -1) {
          dispatch_once(&qword_1EB25CE70, &__block_literal_global_117_0);
        }
        CGFloat v14 = (CGColorSpace *)qword_1EB25CE68;
      }
LABEL_40:
      if ([v3 opaque]) {
        uint32_t v12 = 4357;
      }
      else {
        uint32_t v12 = 4353;
      }
      size_t v11 = 16;
    }
  }
  else
  {
    CGFloat v14 = 0;
    switch(v10)
    {
      case -1:
        id v15 = (CGColorSpace *)[v3 _overrideColorSpace];
        if (!v15) {
          goto LABEL_28;
        }
        CGColorSpaceModel Model = CGColorSpaceGetModel(v15);
        CGFloat v14 = (CGColorSpace *)[v3 _overrideColorSpace];
        CGColorSpaceGetNumberOfComponents(v14);
        if (Model == kCGColorSpaceModelRGB)
        {
          size_t v11 = [v3 _overrideBitsPerComponent];
          int v17 = [v3 opaque];
          if (v17) {
            int v18 = 8198;
          }
          else {
            int v18 = 8194;
          }
          if (v17) {
            int v19 = 4101;
          }
          else {
            int v19 = 4097;
          }
          if (v11 == 8) {
            uint32_t v12 = v18;
          }
          else {
            uint32_t v12 = v19;
          }
        }
        else
        {
          [v3 opaque];
          size_t v11 = [v3 _overrideBitsPerComponent];
          uint32_t v12 = [v3 opaque] ^ 1;
        }
        break;
      case 0:
LABEL_28:
        size_t v11 = 0;
        uint32_t v12 = 0;
        CGFloat v14 = 0;
        char v13 = 0;
        break;
      case 1:
        if (qword_1EB25CE50 != -1) {
          dispatch_once(&qword_1EB25CE50, &__block_literal_global_280);
        }
        CGFloat v14 = (CGColorSpace *)_MergedGlobals_3_15;
        goto LABEL_40;
      case 2:
        if (qword_1EB25CE80 != -1) {
          dispatch_once(&qword_1EB25CE80, &__block_literal_global_119);
        }
        CGFloat v14 = (CGColorSpace *)qword_1EB25CE78;
        if ([v3 opaque]) {
          uint32_t v12 = 8198;
        }
        else {
          uint32_t v12 = 8194;
        }
        goto LABEL_47;
      default:
        break;
    }
  }
LABEL_48:
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();

  if (v7) {
    BOOL v21 = v9 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    CGRect v22 = 0;
  }
  else if (v13)
  {
    CGRect v22 = CGBitmapContextCreate(0, v7, v9, v11, AlignedBytesPerRow, v14, v12);
  }
  else
  {
    char v23 = [v3 opaque];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__UIGraphicsImageRenderer_contextWithFormat___block_invoke;
    v27[3] = &__block_descriptor_33_e91_B32__0_CGBitmapContextContentInfo_IiIBB_8__CGBitmapContextInfo_IQQQQiII__CGColorSpace_BI_24l;
    char v28 = v23;
    v24 = _Block_copy(v27);
    uint64_t v29 = *MEMORY[0x1E4F1DB58];
    v30[0] = &unk_1ED3F43F8;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    CGRect v22 = (CGContext *)CGBitmapContextCreateWithCallbacks();
  }
  return v22;
}

- (void)_prepareContextForReuse:(CGContext *)a3
{
  if (CGContextGetType() == 9)
  {
    CGContextClear();
  }
}

uint64_t __45__UIGraphicsImageRenderer_contextWithFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v4 = (a3 & 0x10000000000) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 1;
  }
  int v5 = *(_DWORD *)(a4 + 44) - 2;
  if (v5 > 2) {
    return 1;
  }
  uint64_t result = 0;
  *(_DWORD *)(a4 + 44) = dword_186B97760[v5];
  *(unsigned char *)(a4 + 64) = 0;
  return result;
}

- (UIGraphicsImageRenderer)initWithSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  double v6 = +[UIGraphicsImageRendererFormat preferredFormat];
  size_t v7 = -[UIGraphicsImageRenderer initWithSize:format:](self, "initWithSize:format:", v6, width, height);

  return v7;
}

- (UIGraphicsImageRenderer)initWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = +[UIGraphicsImageRendererFormat preferredFormat];
  size_t v9 = -[UIGraphicsImageRenderer initWithBounds:format:](self, "initWithBounds:format:", v8, x, y, width, height);

  return v9;
}

- (UIGraphicsImageRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsImageRendererFormat *)format
{
  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsImageRenderer;
  return -[UIGraphicsRenderer initWithBounds:format:](&v5, sel_initWithBounds_format_, format, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (UIGraphicsImageRenderer)init
{
  return -[UIGraphicsImageRenderer initWithSize:](self, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (NSData)PNGDataWithActions:(UIGraphicsImageDrawingActions)actions
{
  UIGraphicsImageDrawingActions v4 = actions;
  uint64_t v10 = 0;
  size_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__108;
  CGFloat v14 = __Block_byref_object_dispose__108;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__UIGraphicsImageRenderer_PNGDataWithActions___block_invoke;
  v9[3] = &unk_1E52F1630;
  v9[4] = &v10;
  [(UIGraphicsRenderer *)self runDrawingActions:v4 completionActions:v9 error:0];
  objc_super v5 = (UIImage *)v11[5];
  if (v5)
  {
    UIImagePNGRepresentation(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  }
  size_t v7 = v6;
  _Block_object_dispose(&v10, 8);

  return (NSData *)v7;
}

void __46__UIGraphicsImageRenderer_PNGDataWithActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 currentImage];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSData)JPEGDataWithCompressionQuality:(CGFloat)compressionQuality actions:(UIGraphicsImageDrawingActions)actions
{
  UIGraphicsImageDrawingActions v6 = actions;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__108;
  double v16 = __Block_byref_object_dispose__108;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__UIGraphicsImageRenderer_JPEGDataWithCompressionQuality_actions___block_invoke;
  v11[3] = &unk_1E52F1630;
  v11[4] = &v12;
  [(UIGraphicsRenderer *)self runDrawingActions:v6 completionActions:v11 error:0];
  size_t v7 = (void *)v13[5];
  if (v7)
  {
    _UIImageJPEGRepresentation(v7, 0, compressionQuality);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  }
  size_t v9 = v8;
  _Block_object_dispose(&v12, 8);

  return (NSData *)v9;
}

void __66__UIGraphicsImageRenderer_JPEGDataWithCompressionQuality_actions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 currentImage];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end