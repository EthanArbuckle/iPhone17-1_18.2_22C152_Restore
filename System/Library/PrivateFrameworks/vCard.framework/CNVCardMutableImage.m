@interface CNVCardMutableImage
+ (CGRect)scaleRect:(CGRect)a3 byFactor:(double)a4;
+ (id)CGImageCreateWithData:(id)a3 maxSizeValue:(id)a4;
+ (id)scaleCropRects:(id)a3 factor:(double)a4;
- (BOOL)attemptedCGImage;
- (BOOL)hasAlphaChannel;
- (BOOL)isSourceLossless;
- (BOOL)shouldReturnPNG;
- (CGImage)CGImage;
- (CGSize)originalSize;
- (CGSize)size;
- (CNVCardMutableImage)initWithData:(id)a3 cropRects:(id)a4 size:(CGSize)a5;
- (NSData)originalData;
- (NSDictionary)originalCropRects;
- (NSNumber)compressionQuality;
- (NSValue)targetSizeValue;
- (__CFString)sourceImageFormatUTI;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cropRects;
- (id)data;
- (id)renderCGImage:(CGImage *)a3;
- (void)dealloc;
- (void)describePropertiesWithBuilder:(id)a3;
- (void)nts_initCGImage;
- (void)nts_invalidateImageQuality;
- (void)nts_invalidateImageSize;
- (void)nts_updateRepresentation;
- (void)setCompressionQuality:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSourceImageFormatUTI:(__CFString *)a3;
- (void)setTargetSizeValue:(id)a3;
@end

@implementation CNVCardMutableImage

- (CNVCardMutableImage)initWithData:(id)a3 cropRects:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNVCardMutableImage;
  v11 = -[CNVCardImage initWithData:cropRects:size:](&v18, sel_initWithData_cropRects_size_, v9, v10, width, height);
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    originalData = v11->_originalData;
    v11->_originalData = (NSData *)v12;

    uint64_t v14 = [v10 copy];
    originalCropRects = v11->_originalCropRects;
    v11->_originalCropRects = (NSDictionary *)v14;

    v11->_originalSize.double width = width;
    v11->_originalSize.double height = height;
    v11->_CGImage = 0;
    v16 = v11;
  }

  return v11;
}

- (void)dealloc
{
  CGImage = self->_CGImage;
  if (CGImage) {
    CFRelease(CGImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNVCardMutableImage;
  [(CNVCardMutableImage *)&v4 dealloc];
}

- (void)describePropertiesWithBuilder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNVCardMutableImage;
  [(CNVCardImage *)&v21 describePropertiesWithBuilder:v4];
  v5 = NSString;
  v6 = NSNumber;
  v7 = [(CNVCardMutableImage *)self originalData];
  v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  id v9 = [v5 stringWithFormat:@"%@ bytes", v8];
  id v10 = (id)[v4 appendName:@"originalData" object:v9];

  v11 = [(CNVCardMutableImage *)self originalCropRects];
  id v12 = (id)[v4 appendName:@"originalCropRects" object:v11];

  v13 = NSString;
  uint64_t v14 = NSNumber;
  [(CNVCardMutableImage *)self originalSize];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v16 = NSNumber;
  [(CNVCardMutableImage *)self originalSize];
  objc_super v18 = [v16 numberWithDouble:v17];
  v19 = [v13 stringWithFormat:@"%@x%@", v15, v18];
  id v20 = (id)[v4 appendName:@"originalSize" object:v19];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNVCardImage alloc];
  v5 = [(CNVCardMutableImage *)self data];
  v6 = [(CNVCardMutableImage *)self cropRects];
  v7 = [(CNVCardImage *)v4 initWithData:v5 cropRects:v6];

  return v7;
}

- (id)data
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__0;
  v8 = __Block_byref_object_dispose__0;
  id v9 = 0;
  cn_runWithObjectLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __27__CNVCardMutableImage_data__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_updateRepresentation");
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (BOOL)isSourceLossless
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  cn_runWithObjectLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__CNVCardMutableImage_isSourceLossless__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_initCGImage");
  char v2 = (uint64_t (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 104);
  uint64_t v4 = getkUTTypeJPEG();
  uint64_t result = v2(v3, v4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (BOOL)hasAlphaChannel
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  cn_runWithObjectLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __38__CNVCardMutableImage_hasAlphaChannel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_initCGImage");
  uint64_t result = softLinkCGImageGetAlphaInfo(*(void *)(*(void *)(a1 + 32) + 72));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (result > 6) | (0x1Eu >> result) & 1;
  return result;
}

- (CGSize)size
{
  uint64_t v6 = 0;
  char v7 = (double *)&v6;
  uint64_t v8 = 0x3010000000;
  id v9 = &unk_1DC1BB5E2;
  long long v10 = *MEMORY[0x1E4F28AE0];
  cn_runWithObjectLock();
  double v2 = v7[4];
  double v3 = v7[5];
  _Block_object_dispose(&v6, 8);
  double v4 = v2;
  double v5 = v3;
  result.double height = v5;
  result.double width = v4;
  return result;
}

__n128 __27__CNVCardMutableImage_size__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_updateRepresentation");
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 24);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setSize:(CGSize)a3
{
}

void __31__CNVCardMutableImage_setSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_invalidateImageSize");
  if (NSEqualSizes(*MEMORY[0x1E4F28AE0], *(NSSize *)(a1 + 40))
    || (double v2 = *(double *)(a1 + 40), [*(id *)(a1 + 32) originalSize], v2 >= v3)
    || (double v4 = *(double *)(a1 + 48), [*(id *)(a1 + 32) originalSize], v4 >= v5))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 setTargetSizeValue:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setTargetSizeValue:v7];
  }
}

- (void)nts_invalidateImageSize
{
  data = self->super._data;
  self->super._data = 0;

  cropRects = self->super._cropRects;
  self->super._cropRects = 0;

  targetSizeValue = self->_targetSizeValue;
  self->_targetSizeValue = 0;

  CGImage = self->_CGImage;
  if (CGImage) {
    CFRelease(CGImage);
  }
  self->_CGImage = 0;
  self->_attemptedCGImage = 0;
}

- (NSNumber)compressionQuality
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__0;
  uint64_t v8 = __Block_byref_object_dispose__0;
  id v9 = 0;
  cn_runWithObjectLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSNumber *)v2;
}

void __41__CNVCardMutableImage_compressionQuality__block_invoke(uint64_t a1)
{
}

- (void)setCompressionQuality:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  cn_runWithObjectLock();
}

void *__45__CNVCardMutableImage_setCompressionQuality___block_invoke(uint64_t a1)
{
  __n128 result = *(void **)(a1 + 32);
  if (result[12] != *(void *)(a1 + 40))
  {
    objc_msgSend(result, "nts_invalidateImageQuality");
    *(void *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 40) copy];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)nts_invalidateImageQuality
{
  self->super._data = 0;
  MEMORY[0x1F41817F8]();
}

- (id)cropRects
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__0;
  uint64_t v8 = __Block_byref_object_dispose__0;
  id v9 = 0;
  cn_runWithObjectLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __32__CNVCardMutableImage_cropRects__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_updateRepresentation");
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)nts_initCGImage
{
  if (!self->_CGImage && !self->_attemptedCGImage)
  {
    id v3 = [(id)objc_opt_class() CGImageCreateWithData:self->_originalData maxSizeValue:self->_targetSizeValue];
    self->_attemptedCGImage = 1;
    if (v3)
    {
      id v9 = v3;
      uint64_t v4 = (CGImage *)[v3 imageRef];
      self->_CGImage = v4;
      if (v4)
      {
        self->_sourceImageFormatUTI = (__CFString *)[v9 sourceImageFormatUTI];
        if (self->_targetSizeValue)
        {
          CGFloat Width = (double)(unint64_t)softLinkCGImageGetWidth((uint64_t)self->_CGImage);
          unint64_t Height = softLinkCGImageGetHeight((uint64_t)self->_CGImage);
          self->super._size.double width = Width;
          self->super._size.double height = (double)Height;
          id v7 = [(id)objc_opt_class() scaleCropRects:self->_originalCropRects factor:Width / self->_originalSize.width];
          cropRects = self->super._cropRects;
          self->super._cropRects = v7;
        }
        else
        {
          objc_storeStrong((id *)&self->super._cropRects, self->_originalCropRects);
          self->super._size = self->_originalSize;
        }
      }
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)nts_updateRepresentation
{
  [(CNVCardMutableImage *)self nts_initCGImage];
  if (!self->super._data)
  {
    self->super._data = [(CNVCardMutableImage *)self renderCGImage:self->_CGImage];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)CGImageCreateWithData:(id)a3 maxSizeValue:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (CGImageRefWithFormat *)softLinkCGImageSourceCreateWithData((uint64_t)a3, 0);
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:getkCGImageSourceCreateThumbnailFromImageAlways()];
    if (v5)
    {
      uint64_t v8 = NSNumber;
      [v5 sizeValue];
      double v10 = v9;
      [v5 sizeValue];
      if (v10 >= v11) {
        double v12 = v10;
      }
      else {
        double v12 = v11;
      }
      v13 = [v8 numberWithDouble:v12];
      [v7 setObject:v13 forKeyedSubscript:getkCGImageSourceThumbnailMaxPixelSize()];
    }
    uint64_t ThumbnailAtIndex = softLinkCGImageSourceCreateThumbnailAtIndex((uint64_t)v6, 0, (uint64_t)v7);
    uint64_t v6 = [[CGImageRefWithFormat alloc] initWithImage:ThumbnailAtIndex andFormat:softLinkCGImageSourceGetType((uint64_t)v6)];
  }
  return v6;
}

+ (id)scaleCropRects:(id)a3 factor:(double)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CNVCardMutableImage_scaleCropRects_factor___block_invoke;
  v6[3] = &__block_descriptor_48_e26___NSValue_16__0__NSValue_8l;
  v6[4] = a1;
  *(double *)&v6[5] = a4;
  uint64_t v4 = objc_msgSend(a3, "_cn_mapValues:", v6);
  return v4;
}

uint64_t __45__CNVCardMutableImage_scaleCropRects_factor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  id v3 = *(void **)(a1 + 32);
  [a2 rectValue];
  objc_msgSend(v3, "scaleRect:byFactor:");
  NSRect v7 = NSIntegralRect(v6);
  return objc_msgSend(v2, "valueWithRect:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

+ (CGRect)scaleRect:(CGRect)a3 byFactor:(double)a4
{
  double v4 = a3.origin.x * a4;
  double v5 = a3.origin.y * a4;
  double v6 = a3.size.width * a4;
  double v7 = a3.size.height * a4;
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)renderCGImage:(CGImage *)a3
{
  double v4 = [(objc_class *)getCIImageClass() imageWithCGImage:a3];
  if (v4)
  {
    double v5 = [(objc_class *)getCIContextClass() context];
    if (v5)
    {
      double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      if ([(CNVCardMutableImage *)self shouldReturnPNG])
      {
        objc_msgSend(v5, "PNGRepresentationOfImage:format:colorSpace:options:", v4, getkCIFormatRGBA8(), objc_msgSend(v4, "colorSpace"), v6);
      }
      else
      {
        [v6 setObject:self->_compressionQuality forKeyedSubscript:getkCGImageDestinationLossyCompressionQuality()];
        objc_msgSend(v5, "JPEGRepresentationOfImage:colorSpace:options:", v4, objc_msgSend(v4, "colorSpace"), v6);
      double v7 = };
    }
    else
    {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)shouldReturnPNG
{
  if ([(CNVCardMutableImage *)self isSourceLossless]
    || (BOOL v3 = [(CNVCardMutableImage *)self hasAlphaChannel]))
  {
    compressionQuality = self->_compressionQuality;
    if (compressionQuality)
    {
      [(NSNumber *)compressionQuality doubleValue];
      LOBYTE(v3) = v5 >= 1.0;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (NSData)originalData
{
  return self->_originalData;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (BOOL)attemptedCGImage
{
  return self->_attemptedCGImage;
}

- (NSDictionary)originalCropRects
{
  return self->_originalCropRects;
}

- (CGSize)originalSize
{
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSValue)targetSizeValue
{
  return self->_targetSizeValue;
}

- (void)setTargetSizeValue:(id)a3
{
}

- (__CFString)sourceImageFormatUTI
{
  return self->_sourceImageFormatUTI;
}

- (void)setSourceImageFormatUTI:(__CFString *)a3
{
  self->_sourceImageFormatUTI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressionQuality, 0);
  objc_storeStrong((id *)&self->_targetSizeValue, 0);
  objc_storeStrong((id *)&self->_originalCropRects, 0);
  objc_storeStrong((id *)&self->_originalData, 0);
}

@end