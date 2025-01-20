@interface WFImage
+ (BOOL)supportsSecureCoding;
+ (id)_applicationIconImageLoadingQueue;
+ (id)applicationIconImageForBundleIdentifier:(id)a3;
+ (id)applicationIconImageForBundleIdentifier:(id)a3 format:(unint64_t)a4;
+ (id)applicationIconImageForBundleIdentifier:(id)a3 length:(double)a4 scale:(double)a5;
+ (id)applicationIconImageForCalendarDate:(id)a3 descriptor:(id)a4;
+ (id)documentIconImageForFileType:(id)a3;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 inCatalogs:(id)a5;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 scaleFactor:(double)a6;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 scaleFactor:(double)a6 rightToLeft:(BOOL)a7 appearanceName:(id)a8;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 symbolWeight:(int64_t)a6 scaleFactor:(double)a7 rightToLeft:(BOOL)a8 appearanceName:(id)a9 inCatalogs:(id)a10;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolWeight:(int64_t)a5 scaleFactor:(double)a6;
+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolWeight:(int64_t)a5 scaleFactor:(double)a6 inCatalogs:(id)a7;
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
+ (id)imageNamed:(id)a3 inBundle:(id)a4 scale:(double)a5;
+ (id)imageWithCGImage:(CGImage *)a3;
+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5;
+ (id)imageWithContentsOfURL:(id)a3;
+ (id)imageWithData:(id)a3;
+ (id)imageWithData:(id)a3 scale:(double)a4;
+ (id)imageWithData:(id)a3 scale:(double)a4 allowAnimated:(BOOL)a5;
+ (id)imageWithDeviceScreenScaleImageData:(id)a3;
+ (id)systemImageNamed:(id)a3 configuration:(id)a4 renderingMode:(unint64_t)a5;
+ (void)applicationIconImageForBundleIdentifier:(id)a3 length:(double)a4 scale:(double)a5 completionHandler:(id)a6;
- (BOOL)allowsAnimated;
- (BOOL)hasValidImage;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)contentsTransformForDrawingWithSize:(SEL)a3 scale:(CGSize)a4;
- (CGImage)CGImage;
- (CGImage)createNonRotatedCGImageRepresentation;
- (CGImage)internalCGImage;
- (CGImageSource)internalImageSource;
- (CGSize)CGImageSize;
- (CGSize)sizeInPixels;
- (CGSize)sizeInPoints;
- (NSBundle)bundle;
- (NSData)PNGRepresentation;
- (NSData)data;
- (NSImage)NSImage;
- (NSImage)untintedNSImage;
- (NSString)name;
- (NSString)symbolName;
- (NSURL)URL;
- (UIImage)UIImage;
- (UIImage)platformImage;
- (UIImage)untintedUIImage;
- (WFColor)tintColor;
- (WFImage)imageWithDisplayStyle:(unint64_t)a3;
- (WFImage)imageWithRenderingMode:(unint64_t)a3;
- (WFImage)imageWithTintColor:(id)a3;
- (WFImage)init;
- (WFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5;
- (WFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5 renderingMode:(unint64_t)a6;
- (WFImage)initWithCoder:(id)a3;
- (WFImage)initWithContentsOfURL:(id)a3;
- (WFImage)initWithData:(id)a3 scale:(double)a4 allowAnimated:(BOOL)a5;
- (WFImage)initWithName:(id)a3 bundle:(id)a4 scale:(double)a5;
- (WFImage)initWithPlatformImage:(id)a3;
- (WFImage)initWithPlatformImage:(id)a3 scale:(double)a4;
- (WFImage)initWithRepresentationType:(int64_t)a3;
- (WFImage)initWithSymbolName:(id)a3 configuration:(id)a4 renderingMode:(unint64_t)a5;
- (WFImageSymbolConfiguration)symbolConfiguration;
- (double)scale;
- (id)applicationIconImageWithFormat:(unint64_t)a3;
- (id)imageByTintingBitmapWithTintColor:(id)a3;
- (id)resizedImageWithSizeInPoints:(CGSize)a3;
- (id)resizedImageWithSizeInPoints:(CGSize)a3 scale:(double)a4;
- (id)roundedWithContinuousCornerRadius:(double)a3 size:(CGSize)a4;
- (id)tintedImageWithColor:(id)a3;
- (int64_t)representationType;
- (unint64_t)displayStyle;
- (unint64_t)hash;
- (unint64_t)renderingMode;
- (unsigned)orientation;
- (void)dealloc;
- (void)drawInContext:(id)a3 inRect:(CGRect)a4;
- (void)drawInContext:(id)a3 inRect:(CGRect)a4 blendMode:(int)a5 alpha:(double)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation WFImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_untintedNSImage, 0);
  objc_destroyWeak((id *)&self->_UIImage);
  objc_destroyWeak((id *)&self->_NSImage);
  objc_destroyWeak(&self->_internalImageSource);
  objc_destroyWeak(&self->_internalCGImage);
}

- (unint64_t)hash
{
  int64_t v3 = [(WFImage *)self representationType];
  [(WFImage *)self scale];
  return v3 ^ [(WFImage *)self orientation] ^ (unint64_t)v4;
}

- (CGSize)sizeInPoints
{
  [(WFImage *)self sizeInPixels];
  double v4 = v3;
  double v6 = v5;
  [(WFImage *)self scale];
  double v8 = v4 / v7;
  [(WFImage *)self scale];
  double v10 = v6 / v9;
  double v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)sizeInPixels
{
  [(WFImage *)self CGImageSize];
  double v4 = v3;
  double v6 = v5;
  unsigned int v7 = [(WFImage *)self orientation] - 5;
  if (v7 >= 4) {
    double v8 = v4;
  }
  else {
    double v8 = v6;
  }
  if (v7 >= 4) {
    double v9 = v6;
  }
  else {
    double v9 = v4;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)CGImageSize
{
  if (![(WFImage *)self internalImageSource])
  {
LABEL_13:
    v18 = [(WFImage *)self CGImage];
    double Width = (double)CGImageGetWidth(v18);
    double Height = (double)CGImageGetHeight(v18);
    goto LABEL_14;
  }
  soft_CGImageSourceCopyProperties((uint64_t)[(WFImage *)self internalImageSource]);
  double v4 = v3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  double v5 = (void *)getkCGImagePropertyPixelWidthSymbolLoc_ptr;
  uint64_t v31 = getkCGImagePropertyPixelWidthSymbolLoc_ptr;
  if (!getkCGImagePropertyPixelWidthSymbolLoc_ptr)
  {
    double v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getkCGImagePropertyPixelWidthSymbolLoc_block_invoke;
    v26 = &unk_1E6079C28;
    v27 = &v28;
    double v6 = ImageIOLibrary();
    v29[3] = (uint64_t)dlsym(v6, "kCGImagePropertyPixelWidth");
    getkCGImagePropertyPixelWidthSymbolLoc_ptr = *(void *)(v27[1] + 24);
    double v5 = (void *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyPixelWidth(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFImage.m", 49, @"%s", dlerror(), *(void *)&v23, v24, v25, v26);
LABEL_17:

    __break(1u);
    goto LABEL_18;
  }
  unsigned int v7 = [v4 objectForKeyedSubscript:*v5];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  double v8 = (void *)getkCGImagePropertyPixelHeightSymbolLoc_ptr;
  uint64_t v31 = getkCGImagePropertyPixelHeightSymbolLoc_ptr;
  if (!getkCGImagePropertyPixelHeightSymbolLoc_ptr)
  {
    double v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getkCGImagePropertyPixelHeightSymbolLoc_block_invoke;
    v26 = &unk_1E6079C28;
    v27 = &v28;
    double v9 = ImageIOLibrary();
    v29[3] = (uint64_t)dlsym(v9, "kCGImagePropertyPixelHeight");
    getkCGImagePropertyPixelHeightSymbolLoc_ptr = *(void *)(v27[1] + 24);
    double v8 = (void *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v8)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyPixelHeight(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFImage.m", 48, @"%s", dlerror(), *(void *)&v23, v24, v25, v26);
    goto LABEL_17;
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:*v8];
  double v11 = (void *)v10;
  v12 = 0;
  if (v7 && v10)
  {
    v13 = (void *)MEMORY[0x1E4F29238];
    double v23 = (double)[v7 integerValue];
    *(double *)&uint64_t v24 = (double)[v11 integerValue];
    v12 = [v13 valueWithBytes:&v23 objCType:"{CGSize=dd}"];
  }

  if (!v12) {
    goto LABEL_13;
  }
  objc_msgSend(v12, "wf_CGSizeValue");
  double Width = v14;
  double Height = v16;

LABEL_14:
  double v19 = Width;
  double v20 = Height;
LABEL_18:
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGImageSource)internalImageSource
{
  p_internalImageSource = &self->_internalImageSource;
  id WeakRetained = objc_loadWeakRetained(&self->_internalImageSource);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
LABEL_3:
    CFAutorelease(v5);
    return (CGImageSource *)v5;
  }
  int64_t v7 = [(WFImage *)self representationType];
  if (v7 == 1)
  {
    double v8 = [(WFImage *)self URL];
    uint64_t v18 = 0;
    double v19 = &v18;
    uint64_t v20 = 0x2020000000;
    double v9 = (uint64_t (*)(void *, void))getCGImageSourceCreateWithURLSymbolLoc_ptr;
    v21 = (void *)getCGImageSourceCreateWithURLSymbolLoc_ptr;
    if (!getCGImageSourceCreateWithURLSymbolLoc_ptr)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __getCGImageSourceCreateWithURLSymbolLoc_block_invoke;
      v17 = &unk_1E6079C28;
      v13 = ImageIOLibrary();
      v19[3] = (uint64_t)dlsym(v13, "CGImageSourceCreateWithURL");
      getCGImageSourceCreateWithURLSymbolLoc_ptr = v19[3];
      double v9 = (uint64_t (*)(void *, void))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v9)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageSourceRef  _Nullable soft_CGImageSourceCreateWithURL(CFURLRef _Nonnull, CFDictionaryRef _Nullable)");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFImage.m", 40, @"%s", dlerror(), v14, v15, v16, v17);
      goto LABEL_18;
    }
LABEL_14:
    double v5 = (void *)v9(v8, 0);

    objc_storeWeak(p_internalImageSource, v5);
    if (!v5) {
      return (CGImageSource *)v5;
    }
    goto LABEL_3;
  }
  if (v7 != 2)
  {
    objc_storeWeak(p_internalImageSource, 0);
    return 0;
  }
  double v8 = [(WFImage *)self data];
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  double v9 = (uint64_t (*)(void *, void))getCGImageSourceCreateWithDataSymbolLoc_ptr;
  v21 = getCGImageSourceCreateWithDataSymbolLoc_ptr;
  if (!getCGImageSourceCreateWithDataSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __getCGImageSourceCreateWithDataSymbolLoc_block_invoke;
    v17 = &unk_1E6079C28;
    uint64_t v10 = ImageIOLibrary();
    v19[3] = (uint64_t)dlsym(v10, "CGImageSourceCreateWithData");
    getCGImageSourceCreateWithDataSymbolLoc_ptr = (_UNKNOWN *)v19[3];
    double v9 = (uint64_t (*)(void *, void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v9) {
    goto LABEL_14;
  }
  double v11 = [MEMORY[0x1E4F28B00] currentHandler];
  v12 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageSourceRef  _Nullable soft_CGImageSourceCreateWithData(CFDataRef _Nonnull, CFDictionaryRef _Nullable)");
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFImage.m", 41, @"%s", dlerror(), v14, v15, v16, v17);
LABEL_18:

  __break(1u);
  return result;
}

- (UIImage)UIImage
{
  double v3 = [(WFImage *)self tintColor];

  if (v3)
  {
    double v4 = [(WFImage *)self tintColor];
    double v5 = [(WFImage *)self imageWithTintColor:v4];
    double v6 = [v5 untintedUIImage];
  }
  else
  {
    double v6 = [(WFImage *)self untintedUIImage];
  }
  return (UIImage *)v6;
}

- (WFColor)tintColor
{
  return self->_tintColor;
}

- (UIImage)untintedUIImage
{
  p_UIImage = &self->_UIImage;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_UIImage);
  if (!WeakRetained)
  {
    switch([(WFImage *)self representationType])
    {
      case 0:
        getUIImageClass();
        uint64_t v5 = objc_opt_new();
        goto LABEL_20;
      case 1:
        id v11 = objc_alloc(getUIImageClass());
        int64_t v7 = [(WFImage *)self URL];
        double v8 = [v7 path];
        uint64_t v12 = [v11 initWithContentsOfFile:v8];
        goto LABEL_16;
      case 2:
        if (![(WFImage *)self allowsAnimated]) {
          goto LABEL_22;
        }
        id v13 = [(WFImage *)self data];
        if ((unint64_t)[v13 length] >= 5
          && (id v14 = v13, v15 = (unsigned char *)[v14 bytes], *v15 == 71)
          && v15[1] == 73)
        {
          int v16 = v15[2];

          if (v16 == 70)
          {
            int64_t v7 = [(WFImage *)self data];
            [(WFImage *)self scale];
            uint64_t v18 = WFUIImageWithAnimatedGIFDataAndOptions(v7, v17);
            goto LABEL_23;
          }
        }
        else
        {
        }
LABEL_22:
        id v26 = objc_alloc(getUIImageClass());
        int64_t v7 = [(WFImage *)self data];
        [(WFImage *)self scale];
        uint64_t v18 = objc_msgSend(v26, "initWithData:scale:", v7);
LABEL_23:
        uint64_t v10 = (void *)v18;
LABEL_24:

LABEL_25:
        id WeakRetained = objc_msgSend(v10, "imageWithRenderingMode:", -[WFImage renderingMode](self, "renderingMode"));

        objc_storeWeak((id *)p_UIImage, WeakRetained);
        break;
      case 3:
        id v19 = objc_alloc(getUIImageClass());
        uint64_t v20 = [(WFImage *)self CGImage];
        [(WFImage *)self scale];
        double v22 = v21;
        unsigned int v23 = [(WFImage *)self orientation] - 2;
        if (v23 > 6) {
          uint64_t v24 = 0;
        }
        else {
          uint64_t v24 = qword_1B3D88BA8[v23];
        }
        uint64_t v5 = [v19 initWithCGImage:v20 scale:v24 orientation:v22];
LABEL_20:
        uint64_t v10 = (void *)v5;
        goto LABEL_25;
      case 4:
        Class UIImageClass = getUIImageClass();
        int64_t v7 = [(WFImage *)self symbolName];
        double v8 = [(WFImage *)self symbolConfiguration];
        double v9 = [v8 uiKitConfiguration];
        uint64_t v10 = [(objc_class *)UIImageClass _systemImageNamed:v7 withConfiguration:v9];

        goto LABEL_17;
      case 5:
        Class v25 = getUIImageClass();
        int64_t v7 = [(WFImage *)self name];
        double v8 = [(WFImage *)self bundle];
        uint64_t v12 = [(objc_class *)v25 imageNamed:v7 inBundle:v8 withConfiguration:0];
LABEL_16:
        uint64_t v10 = (void *)v12;
LABEL_17:

        goto LABEL_24;
      default:
        uint64_t v10 = 0;
        goto LABEL_25;
    }
  }
  id v27 = WeakRetained;

  return (UIImage *)v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if ([(WFImage *)self representationType] == 2)
  {
    double v4 = [(WFImage *)self data];
    [v9 encodeObject:v4 forKey:@"data"];

    objc_msgSend(v9, "encodeBool:forKey:", -[WFImage allowsAnimated](self, "allowsAnimated"), @"allowsAnimated");
  }
  else
  {
    uint64_t v5 = [(WFImage *)self PNGRepresentation];
    if (v5) {
      [v9 encodeObject:v5 forKey:@"data"];
    }
  }
  [(WFImage *)self scale];
  objc_msgSend(v9, "encodeDouble:forKey:", @"scale");
  objc_msgSend(v9, "encodeInteger:forKey:", -[WFImage renderingMode](self, "renderingMode"), @"renderingMode");
  double v6 = [(WFImage *)self tintColor];
  [v9 encodeObject:v6 forKey:@"tintColor"];

  int64_t v7 = [(WFImage *)self symbolName];
  [v9 encodeObject:v7 forKey:@"symbolName"];

  double v8 = [(WFImage *)self symbolConfiguration];
  [v9 encodeObject:v8 forKey:@"symbolConfiguration"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[WFImage displayStyle](self, "displayStyle"), @"displayStyle");
}

- (double)scale
{
  double result = self->_scale;
  if (result == 0.0)
  {
    double v3 = +[WFDevice currentDevice];
    [v3 screenScale];
    double v5 = v4;

    return v5;
  }
  return result;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (WFImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (NSData)PNGRepresentation
{
  v51[1] = *MEMORY[0x1E4F143B8];
  if ([(WFImage *)self hasValidImage])
  {
    double v3 = objc_opt_new();
    double v4 = [(id)*MEMORY[0x1E4F44460] identifier];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    double v5 = (uint64_t (*)(void *, void *, uint64_t, void))getCGImageDestinationCreateWithDataSymbolLoc_ptr;
    v49 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
    if (!getCGImageDestinationCreateWithDataSymbolLoc_ptr)
    {
      double v6 = ImageIOLibrary_5532();
      v47[3] = (uint64_t)dlsym(v6, "CGImageDestinationCreateWithData");
      getCGImageDestinationCreateWithDataSymbolLoc_ptr = (_UNKNOWN *)v47[3];
      double v5 = (uint64_t (*)(void *, void *, uint64_t, void))v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v5)
    {
      uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageDestinationRef  _Nullable soft_CGImageDestinationCreateWithData(CFMutableDataRef _Nonnull, CFStringRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"WFImage+Representations.m", 19, @"%s", dlerror());

      goto LABEL_46;
    }
    id v7 = (id)v5(v3, v4, 1, 0);

    if (!v7)
    {
LABEL_33:

      goto LABEL_35;
    }
    double v8 = objc_opt_new();
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    id v9 = (uint64_t *)getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr;
    v49 = (void *)getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr;
    if (!getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr)
    {
      uint64_t v10 = ImageIOLibrary_5532();
      v47[3] = (uint64_t)dlsym(v10, "kCGImagePropertyPNGCompressionFilter");
      getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr = v47[3];
      id v9 = (uint64_t *)v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v9)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyPNGCompressionFilter(void)"];
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"WFImage+Representations.m", 23, @"%s", dlerror());

      goto LABEL_46;
    }
    uint64_t v50 = *v9;
    v51[0] = &unk_1F0CB1898;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v12 = (void *)getkCGImagePropertyPNGDictionarySymbolLoc_ptr;
    v49 = (void *)getkCGImagePropertyPNGDictionarySymbolLoc_ptr;
    if (!getkCGImagePropertyPNGDictionarySymbolLoc_ptr)
    {
      id v13 = ImageIOLibrary_5532();
      v47[3] = (uint64_t)dlsym(v13, "kCGImagePropertyPNGDictionary");
      getkCGImagePropertyPNGDictionarySymbolLoc_ptr = v47[3];
      uint64_t v12 = (void *)v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v12)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyPNGDictionary(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFImage+Representations.m", 22, @"%s", dlerror());

      goto LABEL_46;
    }
    [v8 setObject:v11 forKeyedSubscript:*v12];

    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    id v14 = (void *)getkCGImagePropertyPNGBandCountSymbolLoc_ptr;
    v49 = (void *)getkCGImagePropertyPNGBandCountSymbolLoc_ptr;
    if (!getkCGImagePropertyPNGBandCountSymbolLoc_ptr)
    {
      uint64_t v15 = ImageIOLibrary_5532();
      v47[3] = (uint64_t)dlsym(v15, "kCGImagePropertyPNGBandCount");
      getkCGImagePropertyPNGBandCountSymbolLoc_ptr = v47[3];
      id v14 = (void *)v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v14)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      v37 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyPNGBandCount(void)"];
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"WFImage+Representations.m", 24, @"%s", dlerror());

      goto LABEL_46;
    }
    [v8 setObject:&unk_1F0CB18B0 forKeyedSubscript:*v14];
    [(WFImage *)self scale];
    if (v16 != 1.0)
    {
      double v17 = [NSNumber numberWithDouble:v16 * 72.0];
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      uint64_t v18 = (void *)getkCGImagePropertyDPIWidthSymbolLoc_ptr;
      v49 = (void *)getkCGImagePropertyDPIWidthSymbolLoc_ptr;
      if (!getkCGImagePropertyDPIWidthSymbolLoc_ptr)
      {
        id v19 = ImageIOLibrary_5532();
        v47[3] = (uint64_t)dlsym(v19, "kCGImagePropertyDPIWidth");
        getkCGImagePropertyDPIWidthSymbolLoc_ptr = v47[3];
        uint64_t v18 = (void *)v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (!v18)
      {
        v42 = [MEMORY[0x1E4F28B00] currentHandler];
        v43 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyDPIWidth(void)"];
        objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"WFImage+Representations.m", 25, @"%s", dlerror());

        goto LABEL_46;
      }
      [v8 setObject:v17 forKeyedSubscript:*v18];
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      uint64_t v20 = (void *)getkCGImagePropertyDPIHeightSymbolLoc_ptr;
      v49 = (void *)getkCGImagePropertyDPIHeightSymbolLoc_ptr;
      if (!getkCGImagePropertyDPIHeightSymbolLoc_ptr)
      {
        double v21 = ImageIOLibrary_5532();
        v47[3] = (uint64_t)dlsym(v21, "kCGImagePropertyDPIHeight");
        getkCGImagePropertyDPIHeightSymbolLoc_ptr = v47[3];
        uint64_t v20 = (void *)v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (!v20)
      {
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        v45 = [NSString stringWithUTF8String:"CFStringRef getkCGImagePropertyDPIHeight(void)"];
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"WFImage+Representations.m", 26, @"%s", dlerror());

        goto LABEL_46;
      }
      [v8 setObject:v17 forKeyedSubscript:*v20];
    }
    double v22 = [(WFImage *)self createNonRotatedCGImageRepresentation];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    unsigned int v23 = (void (*)(id, CGImage *, void *))getCGImageDestinationAddImageSymbolLoc_ptr;
    v49 = getCGImageDestinationAddImageSymbolLoc_ptr;
    if (!getCGImageDestinationAddImageSymbolLoc_ptr)
    {
      uint64_t v24 = ImageIOLibrary_5532();
      v47[3] = (uint64_t)dlsym(v24, "CGImageDestinationAddImage");
      getCGImageDestinationAddImageSymbolLoc_ptr = (_UNKNOWN *)v47[3];
      unsigned int v23 = (void (*)(id, CGImage *, void *))v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (v23)
    {
      v23(v7, v22, v8);
      CGImageRelease(v22);
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      Class v25 = (uint64_t (*)(id))getCGImageDestinationFinalizeSymbolLoc_ptr;
      v49 = getCGImageDestinationFinalizeSymbolLoc_ptr;
      if (!getCGImageDestinationFinalizeSymbolLoc_ptr)
      {
        id v26 = ImageIOLibrary_5532();
        v47[3] = (uint64_t)dlsym(v26, "CGImageDestinationFinalize");
        getCGImageDestinationFinalizeSymbolLoc_ptr = (_UNKNOWN *)v47[3];
        Class v25 = (uint64_t (*)(id))v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (v25)
      {
        int v27 = v25(v7);
        CFRelease(v7);
        if (v27) {
          uint64_t v28 = v3;
        }
        else {
          uint64_t v28 = 0;
        }
        id v7 = v28;

        goto LABEL_33;
      }
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = [NSString stringWithUTF8String:"_Bool soft_CGImageDestinationFinalize(CGImageDestinationRef _Nonnull)"];
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, @"WFImage+Representations.m", 21, @"%s", dlerror());
    }
    else
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = objc_msgSend(NSString, "stringWithUTF8String:", "void soft_CGImageDestinationAddImage(CGImageDestinationRef _Nonnull, CGImageRef _Nonnull, CFDictionaryRef _Nullable)");
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"WFImage+Representations.m", 20, @"%s", dlerror());
    }
LABEL_46:
    __break(1u);
  }
  id v7 = 0;
LABEL_35:
  return (NSData *)v7;
}

- (BOOL)hasValidImage
{
  return [(WFImage *)self internalCGImage] != 0;
}

- (CGImage)internalCGImage
{
  p_internalCGImage = &self->_internalCGImage;
  id WeakRetained = (CGImage *)objc_loadWeakRetained(&self->_internalCGImage);
  if (!WeakRetained)
  {
    double v5 = 0;
    switch([(WFImage *)self representationType])
    {
      case 0:
        return v5;
      case 1:
      case 2:
        double v6 = [(WFImage *)self internalImageSource];
        uint64_t v14 = 0;
        uint64_t v15 = &v14;
        uint64_t v16 = 0x2020000000;
        id v7 = getCGImageSourceCreateImageAtIndexSymbolLoc_ptr;
        double v17 = getCGImageSourceCreateImageAtIndexSymbolLoc_ptr;
        if (!getCGImageSourceCreateImageAtIndexSymbolLoc_ptr)
        {
          double v8 = ImageIOLibrary();
          v15[3] = (uint64_t)dlsym(v8, "CGImageSourceCreateImageAtIndex");
          getCGImageSourceCreateImageAtIndexSymbolLoc_ptr = (_UNKNOWN *)v15[3];
          id v7 = (void *)v15[3];
        }
        _Block_object_dispose(&v14, 8);
        if (!v7)
        {
          uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
          id v13 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nullable soft_CGImageSourceCreateImageAtIndex(CGImageSourceRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"WFImage.m", 42, @"%s", dlerror());

          __break(1u);
          return result;
        }
        CGImageRef v9 = (CGImageRef)((uint64_t (*)(CGImageSource *, void, void))v7)(v6, 0, 0);
LABEL_11:
        double v5 = v9;
LABEL_12:
        objc_storeWeak(p_internalCGImage, v5);
        if (v5) {
          goto LABEL_13;
        }
        return v5;
      case 3:
        CGImageRef v9 = CGImageRetain(self->_CGImage);
        goto LABEL_11;
      case 4:
      case 5:
        uint64_t v10 = [(WFImage *)self platformImage];
        double v5 = CGImageRetain((CGImageRef)[v10 CGImage]);

        goto LABEL_12;
      default:
        objc_storeWeak(p_internalCGImage, 0);
        return 0;
    }
  }
  double v5 = WeakRetained;
LABEL_13:
  CFAutorelease(v5);
  return v5;
}

- (CGImage)createNonRotatedCGImageRepresentation
{
  if ([(WFImage *)self orientation] == 1)
  {
    double v3 = [(WFImage *)self CGImage];
    return CGImageRetain(v3);
  }
  else
  {
    [(WFImage *)self sizeInPoints];
    double v6 = v5;
    double v8 = v7;
    [(WFImage *)self scale];
    uint64_t v10 = +[WFBitmapContext HDRCapableContextWithSize:scale:](WFBitmapContext, "HDRCapableContextWithSize:scale:", v6, v8, v9);
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(WFImage *)self sizeInPoints];
    -[WFImage drawInContext:inRect:](self, "drawInContext:inRect:", v10, v11, v12, v13, v14);
    id v15 = v10;
    Image = CGBitmapContextCreateImage((CGContextRef)[v15 CGContext]);

    return Image;
  }
}

- (unsigned)orientation
{
  if ((unint64_t)([(WFImage *)self representationType] - 1) > 1) {
    return self->_orientation;
  }
  double v3 = [(WFImage *)self internalImageSource];
  soft_CGImageSourceCopyProperties((uint64_t)v3);
  double v5 = v4;
  getkCGImagePropertyOrientation();
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {
    double v8 = (void *)v7;
LABEL_4:
    unsigned int v9 = [v8 integerValue];

LABEL_5:
    return v9;
  }
  uint64_t v24 = 0;
  Class v25 = &v24;
  uint64_t v26 = 0x2020000000;
  double v11 = (uint64_t (*)(CGImageSource *))getCGImageSourceGetCountSymbolLoc_ptr;
  int v27 = getCGImageSourceGetCountSymbolLoc_ptr;
  if (!getCGImageSourceGetCountSymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    double v22 = __getCGImageSourceGetCountSymbolLoc_block_invoke;
    unsigned int v23 = &unk_1E6079C28;
    double v12 = ImageIOLibrary();
    v25[3] = (uint64_t)dlsym(v12, "CGImageSourceGetCount");
    getCGImageSourceGetCountSymbolLoc_ptr = (_UNKNOWN *)v25[3];
    double v11 = (uint64_t (*)(CGImageSource *))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v11)
  {
    if (!v11(v3))
    {
      unsigned int v9 = 1;
      goto LABEL_5;
    }
    uint64_t v24 = 0;
    Class v25 = &v24;
    uint64_t v26 = 0x2020000000;
    double v13 = getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr;
    int v27 = getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr;
    if (!getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v22 = __getCGImageSourceCopyPropertiesAtIndexSymbolLoc_block_invoke;
      unsigned int v23 = &unk_1E6079C28;
      double v14 = ImageIOLibrary();
      v25[3] = (uint64_t)dlsym(v14, "CGImageSourceCopyPropertiesAtIndex");
      getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr = (_UNKNOWN *)v25[3];
      double v13 = (void *)v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (v13)
    {
      id v15 = (void *)((uint64_t (*)(CGImageSource *, void, void))v13)(v3, 0, 0);

      getkCGImagePropertyOrientation();
      uint64_t v17 = [v15 objectForKeyedSubscript:v16];
      if (!v17)
      {
        unsigned int v9 = 1;
        double v5 = v15;
        goto LABEL_5;
      }
      double v8 = (void *)v17;
      double v5 = v15;
      goto LABEL_4;
    }
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    id v19 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDictionaryRef  _Nullable soft_CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFImage.m", 44, @"%s", dlerror(), v20, v21, v22, v23);
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    id v19 = [NSString stringWithUTF8String:"size_t soft_CGImageSourceGetCount(CGImageSourceRef _Nonnull)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFImage.m", 45, @"%s", dlerror(), v20, v21, v22, v23);
  }

  __break(1u);
  return result;
}

- (int64_t)representationType
{
  return self->_representationType;
}

- (CGImage)CGImage
{
  CGImage = self->_CGImage;
  if (CGImage)
  {
    CGImageRef v4 = CGImageRetain(CGImage);
    CFAutorelease(v4);
    return self->_CGImage;
  }
  else
  {
    return [(WFImage *)self internalCGImage];
  }
}

- (UIImage)platformImage
{
  double v3 = [(WFImage *)self tintColor];

  if (v3)
  {
    CGImageRef v4 = [(WFImage *)self tintColor];
    double v5 = [(WFImage *)self imageWithTintColor:v4];
    uint64_t v6 = [v5 untintedPlatformImage];
  }
  else
  {
    uint64_t v6 = [(WFImage *)self untintedPlatformImage];
  }
  return (UIImage *)v6;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (WFImage)imageWithTintColor:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(WFImage *)self copy];
  [v5 setTintColor:v4];

  return (WFImage *)v5;
}

- (WFImage)imageWithDisplayStyle:(unint64_t)a3
{
  id v4 = (void *)[(WFImage *)self copy];
  v4[8] = a3;
  return (WFImage *)v4;
}

- (void)setTintColor:(id)a3
{
}

- (WFImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"renderingMode"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"displayStyle"];
  double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  if ([v8 length])
  {
    unsigned int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolConfiguration"];
    uint64_t v10 = [(WFImage *)self initWithSymbolName:v8 configuration:v9 renderingMode:v5];

    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  tintColor = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!tintColor)
  {
    uint64_t v10 = [(WFImage *)self initWithRepresentationType:0];
    goto LABEL_9;
  }
  uint64_t v12 = [v4 decodeBoolForKey:@"allowsAnimated"];
  [v4 decodeDoubleForKey:@"scale"];
  double v13 = -[WFImage initWithData:scale:allowAnimated:](self, "initWithData:scale:allowAnimated:", tintColor, v12);
  uint64_t v10 = v13;
  if (v13)
  {
    v13->_renderingMode = v5;

LABEL_7:
    v10->_displayStyle = v7;
    double v14 = v6;
    tintColor = v10->_tintColor;
    v10->_tintColor = v14;
  }
LABEL_9:

LABEL_10:
  return v10;
}

+ (id)systemImageNamed:(id)a3 configuration:(id)a4 renderingMode:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  unsigned int v9 = [[WFImage alloc] initWithSymbolName:v8 configuration:v7 renderingMode:a5];

  return v9;
}

- (WFImage)initWithSymbolName:(id)a3 configuration:(id)a4 renderingMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(WFImage *)self initWithRepresentationType:4];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    symbolName = v10->_symbolName;
    v10->_symbolName = (NSString *)v11;

    v10->_renderingMode = a5;
    objc_storeStrong((id *)&v10->_symbolConfiguration, a4);
    double v13 = v10;
  }

  return v10;
}

- (WFImage)initWithRepresentationType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFImage;
  id v4 = [(WFImage *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_representationType = a3;
    v4->_scale = 1.0;
    v4->_orientation = 1;
    v4->_renderingMode = 0;
    uint64_t v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)WFImage;
  [(WFImage *)&v3 dealloc];
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 scaleFactor:(double)a6
{
  id v10 = a3;
  uint64_t v11 = [a1 glyphNamed:v10 pointSize:a5 symbolSize:4 symbolWeight:WFShouldReverseLayoutDirection() scaleFactor:@"UIAppearanceLight" rightToLeft:0 appearanceName:a4 inCatalogs:a6];

  return v11;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 symbolWeight:(int64_t)a6 scaleFactor:(double)a7 rightToLeft:(BOOL)a8 appearanceName:(id)a9 inCatalogs:(id)a10
{
  BOOL v12 = a8;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a9;
  id v21 = a10;
  double v22 = v21;
  if (v19)
  {
    if (v21) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, a1, @"WFImage+Glyphs.m", 189, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  if (!v22)
  {
LABEL_3:
    double v22 = WFImageBeginUsingCoreGlyphsCatalogs();
    WFImageEndUsingCoreGlyphsCatalogs();
  }
LABEL_4:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v22;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    if (v12) {
      uint64_t v27 = 4;
    }
    else {
      uint64_t v27 = 5;
    }
    if (a5 < 3) {
      unint64_t v28 = a5 + 1;
    }
    else {
      unint64_t v28 = 0;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v30 = [*(id *)(*((void *)&v35 + 1) + 8 * i) namedVectorGlyphWithName:v19 scaleFactor:0 deviceIdiom:v27 layoutDirection:v28 glyphSize:a6 glyphWeight:v20 glyphPointSize:a7 appearanceName:a4];
        if (v30)
        {
          v32 = v30;
          uint64_t v31 = -[WFImage initWithCGImage:scale:orientation:renderingMode:]([WFImage alloc], "initWithCGImage:scale:orientation:renderingMode:", [v30 image], 1, 2, a7);

          goto LABEL_19;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
  uint64_t v31 = 0;
LABEL_19:

  return v31;
}

- (WFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5 renderingMode:(unint64_t)a6
{
  if (a3 && (self = [(WFImage *)self initWithRepresentationType:3]) != 0)
  {
    id v10 = self;
    self->_CGImage = CGImageRetain(a3);
    v10->_scale = a4;
    v10->_orientation = a5;
    v10->_renderingMode = a6;
    self = v10;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 scale:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  uint64_t v11 = v10;
  BOOL v12 = [[WFImage alloc] initWithName:v7 bundle:v10 scale:a5];

  return v12;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return (id)[a1 imageNamed:a3 inBundle:a4 scale:0.0];
}

- (id)tintedImageWithColor:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFImage+Tinting.m", 17, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }
  uint64_t v6 = [WFBitmapContext alloc];
  [(WFImage *)self sizeInPoints];
  double v8 = v7;
  double v10 = v9;
  [(WFImage *)self scale];
  BOOL v12 = -[WFBitmapContext initWithSize:opaque:scale:](v6, "initWithSize:opaque:scale:", 0, v8, v10, v11);
  double v13 = [(WFBitmapContext *)v12 CGContext];
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(WFImage *)self sizeInPoints];
  double v17 = v16;
  double v19 = v18;
  id v20 = v5;
  CGContextSetFillColorWithColor(v13, (CGColorRef)[v20 CGColor]);
  v26.origin.x = v14;
  v26.origin.y = v15;
  v26.size.width = v17;
  v26.size.height = v19;
  CGContextFillRect(v13, v26);
  -[WFImage drawInContext:inRect:blendMode:alpha:](self, "drawInContext:inRect:blendMode:alpha:", v12, 22, v14, v15, v17, v19, 1.0);
  id v21 = [(WFBitmapContext *)v12 image];
  double v22 = [v21 imageWithRenderingMode:1];

  return v22;
}

- (BOOL)allowsAnimated
{
  return self->_allowsAnimated;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)data
{
  return self->_data;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSImage)untintedNSImage
{
  return self->_untintedNSImage;
}

- (NSImage)NSImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_NSImage);
  return (NSImage *)WeakRetained;
}

- (CGAffineTransform)contentsTransformForDrawingWithSize:(SEL)a3 scale:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [(WFImage *)self CGImageSize];
  double v11 = v10;
  [(WFImage *)self scale];
  double v13 = v11 / v12;
  [(WFImage *)self CGImageSize];
  double v15 = v14;
  [(WFImage *)self scale];
  double v17 = v15 / v16;
  [(WFImage *)self sizeInPoints];
  double v19 = v18;
  double v21 = v20;
  if (a5 == 0.0)
  {
    double v22 = +[WFDevice currentDevice];
    [v22 screenScale];
    a5 = v23;
  }
  uint64_t v24 = MEMORY[0x1E4F1DAB8];
  long long v66 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long rect = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v66;
  long long v65 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)&retstr->tx = v65;
  CGAffineTransformMakeTranslation(&t2, v13 * -0.5, v17 * -0.5);
  *(_OWORD *)&t1.a = rect;
  *(_OWORD *)&t1.c = v66;
  *(_OWORD *)&t1.tx = v65;
  CGAffineTransformConcat(retstr, &t1, &t2);
  memset(&v78, 0, sizeof(v78));
  double v63 = v17;
  double v64 = v13;
  switch([(WFImage *)self orientation])
  {
    case 2u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      v78.a = -1.0;
      v78.b = 0.0;
      CGFloat v25 = 1.0;
      goto LABEL_8;
    case 3u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      CGFloat v25 = -1.0;
      v78.a = -1.0;
      v78.b = 0.0;
      goto LABEL_8;
    case 4u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      v78.a = 1.0;
      v78.b = 0.0;
      CGFloat v25 = -1.0;
LABEL_8:
      v78.c = 0.0;
      v78.d = v25;
      break;
    case 5u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      __asm { FMOV            V0.2D, #-1.0 }
      goto LABEL_13;
    case 6u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      _Q0 = xmmword_1B3D88A00;
      goto LABEL_13;
    case 7u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      goto LABEL_13;
    case 8u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      _Q0 = xmmword_1B3D88A10;
LABEL_13:
      *(_OWORD *)&v78.b = _Q0;
      break;
    default:
      *(_OWORD *)&v78.a = rect;
      *(_OWORD *)&v78.c = v66;
      *(_OWORD *)&v78.tx = v65;
      break;
  }
  double v31 = round(height * a5) / a5;
  long long v32 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v32;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  double v33 = round(width * a5) / a5;
  CGAffineTransformConcat(&t1, &v77, &v78);
  long long v34 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v34;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v76, v19 * 0.5, v21 * 0.5);
  long long v35 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v35;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v76);
  long long v36 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v36;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeScale(&v75, v33 / v19, v31 / v21);
  long long v37 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v37;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v75);
  long long v38 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v38;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  uint64_t v39 = *MEMORY[0x1E4F1DAD8];
  uint64_t v40 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  long long v41 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v41;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  uint64_t v42 = v39;
  *(void *)&long long v41 = v40;
  double v43 = v19;
  double v44 = v21;
  CGRect v81 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v41 - 8), &t1);
  double recta = v19;
  double v45 = v81.size.width;
  double v46 = v21;
  double v47 = v81.size.height;
  CGAffineTransformMakeTranslation(&v74, v33 * -0.5, v31 * -0.5);
  long long v48 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v48;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v74);
  long long v49 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v49;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeScale(&v73, round(a5 * v45) / a5 / v45, round(a5 * v47) / a5 / v47);
  long long v50 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v50;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v73);
  long long v51 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v51;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v72, v33 * 0.5, v31 * 0.5);
  long long v52 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v52;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v72);
  long long v53 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v53;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  long long v54 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v54;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  uint64_t v55 = v39;
  *(void *)&long long v54 = v40;
  double v56 = recta;
  double v57 = v46;
  CGRect v82 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v54 - 8), &t1);
  CGAffineTransformMakeTranslation(&v71, round(a5 * v82.origin.x) / a5 - v82.origin.x, round(a5 * v82.origin.y) / a5 - v82.origin.y);
  long long v58 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v58;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v71);
  long long v59 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v59;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t1, v33 / v64, v31 / v63);
  CGAffineTransform v77 = t1;
  CGAffineTransformInvert(&v70, &v77);
  long long v60 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v69.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v69.c = v60;
  *(_OWORD *)&v69.tx = *(_OWORD *)&retstr->tx;
  unsigned int result = CGAffineTransformConcat(&v77, &v70, &v69);
  long long v62 = *(_OWORD *)&v77.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v77.a;
  *(_OWORD *)&retstr->c = v62;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v77.tx;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFImage *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v7 = [(WFImage *)self representationType];
    if (v7 == [(WFImage *)v6 representationType])
    {
      [(WFImage *)self scale];
      double v9 = v8;
      [(WFImage *)v6 scale];
      if (v9 == v10)
      {
        unsigned int v11 = [(WFImage *)self orientation];
        if (v11 == [(WFImage *)v6 orientation])
        {
          unint64_t v12 = [(WFImage *)self renderingMode];
          if (v12 == [(WFImage *)v6 renderingMode])
          {
            switch([(WFImage *)self representationType])
            {
              case 1:
                double v13 = [(WFImage *)self URL];
                double v14 = [(WFImage *)v6 URL];
                id v15 = v13;
                id v16 = v14;
                double v17 = v16;
                if (v15 == v16)
                {
                  LOBYTE(v18) = 1;
                }
                else
                {
                  LOBYTE(v18) = 0;
                  if (v15 && v16) {
                    LOBYTE(v18) = [v15 isEqual:v16];
                  }
                }

                goto LABEL_34;
              case 2:
                BOOL v20 = [(WFImage *)self allowsAnimated];
                if (v20 != [(WFImage *)v6 allowsAnimated]) {
                  goto LABEL_14;
                }
                id v15 = [(WFImage *)self data];
                double v17 = [(WFImage *)v6 data];
                LOBYTE(v18) = [v15 isEqual:v17];
LABEL_34:

                goto LABEL_15;
              case 3:
                double v21 = [(WFImage *)self CGImage];
                LOBYTE(v18) = v21 == [(WFImage *)v6 CGImage];
                goto LABEL_15;
              case 4:
                double v22 = [(WFImage *)self symbolName];
                double v23 = [(WFImage *)v6 symbolName];
                id v24 = v22;
                id v25 = v23;
                CGRect v26 = v25;
                if (v24 == v25)
                {

LABEL_36:
                  long long v32 = [(WFImage *)self symbolConfiguration];
                  uint64_t v33 = [(WFImage *)v6 symbolConfiguration];
                  goto LABEL_39;
                }
                LOBYTE(v18) = 0;
                uint64_t v27 = v25;
                id v28 = v24;
                if (v24 && v25)
                {
                  int v18 = [v24 isEqualToString:v25];

                  if (!v18) {
                    goto LABEL_46;
                  }
                  goto LABEL_36;
                }
LABEL_45:

LABEL_46:
                break;
              case 5:
                v29 = [(WFImage *)self name];
                uint64_t v30 = [(WFImage *)v6 name];
                id v24 = v29;
                id v31 = v30;
                CGRect v26 = v31;
                if (v24 == v31)
                {
                }
                else
                {
                  LOBYTE(v18) = 0;
                  uint64_t v27 = v31;
                  id v28 = v24;
                  if (!v24 || !v31) {
                    goto LABEL_45;
                  }
                  int v18 = [v24 isEqualToString:v31];

                  if (!v18) {
                    goto LABEL_46;
                  }
                }
                long long v32 = [(WFImage *)self bundle];
                uint64_t v33 = [(WFImage *)v6 bundle];
LABEL_39:
                long long v34 = (void *)v33;
                id v28 = v32;
                id v35 = v34;
                uint64_t v27 = v35;
                if (v28 == v35)
                {
                  LOBYTE(v18) = 1;
                }
                else
                {
                  LOBYTE(v18) = 0;
                  if (v28 && v35) {
                    LOBYTE(v18) = [v28 isEqual:v35];
                  }
                }

                goto LABEL_45;
              default:
                LOBYTE(v18) = 1;
                goto LABEL_15;
            }
            goto LABEL_15;
          }
        }
      }
    }
  }
  else
  {

    uint64_t v6 = 0;
  }
LABEL_14:
  LOBYTE(v18) = 0;
LABEL_15:

LABEL_17:
  return v18;
}

- (WFImage)imageWithRenderingMode:(unint64_t)a3
{
  if ([(WFImage *)self renderingMode] == a3)
  {
    id v5 = self;
  }
  else
  {
    uint64_t v6 = [WFImage alloc];
    int64_t v7 = [(WFImage *)self CGImage];
    [(WFImage *)self scale];
    id v5 = [(WFImage *)v6 initWithCGImage:v7 scale:[(WFImage *)self orientation] orientation:a3 renderingMode:v8];
    if (v5)
    {
      v5->_representationType = [(WFImage *)self representationType];
      uint64_t v9 = [(WFImage *)self symbolName];
      symbolName = v5->_symbolName;
      v5->_symbolName = (NSString *)v9;

      uint64_t v11 = [(WFImage *)self name];
      name = v5->_name;
      v5->_name = (NSString *)v11;

      uint64_t v13 = [(WFImage *)self bundle];
      bundle = v5->_bundle;
      v5->_bundle = (NSBundle *)v13;

      uint64_t v15 = [(WFImage *)self data];
      data = v5->_data;
      v5->_data = (NSData *)v15;

      double v17 = v5;
    }
  }
  return v5;
}

- (id)imageByTintingBitmapWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [WFBitmapContext alloc];
  [(WFImage *)self sizeInPoints];
  double v7 = v6;
  double v9 = v8;
  [(WFImage *)self scale];
  uint64_t v11 = -[WFBitmapContext initWithSize:opaque:scale:](v5, "initWithSize:opaque:scale:", 0, v7, v9, v10);
  unint64_t v12 = [(WFBitmapContext *)v11 CGContext];
  id v13 = v4;
  double v14 = (CGColor *)[v13 CGColor];

  CGContextSetFillColorWithColor(v12, v14);
  uint64_t v15 = v11;
  id v16 = [(WFBitmapContext *)v15 CGContext];
  [(WFImage *)self sizeInPixels];
  CGFloat v18 = v17;
  [(WFImage *)self sizeInPixels];
  v26.size.double height = v19;
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.double width = v18;
  CGContextFillRect(v16, v26);
  [(WFImage *)self sizeInPoints];
  double v21 = v20;
  [(WFImage *)self sizeInPoints];
  -[WFImage drawInContext:inRect:blendMode:alpha:](self, "drawInContext:inRect:blendMode:alpha:", v15, 22, 0.0, 0.0, v21, v22, 1.0);
  double v23 = [(WFBitmapContext *)v15 image];

  return v23;
}

- (void)drawInContext:(id)a3 inRect:(CGRect)a4 blendMode:(int)a5 alpha:(double)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  if (!CGRectIsEmpty(v21))
  {
    id v14 = v13;
    uint64_t v15 = (CGContext *)[v14 CGContext];
    CGContextSaveGState(v15);
    CGContextSetBlendMode(v15, (CGBlendMode)a5);
    CGContextSetAlpha(v15, a6);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    CGFloat MinX = CGRectGetMinX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    CGFloat MaxY = CGRectGetMaxY(v23);
    CGContextTranslateCTM(v15, MinX, MaxY);
    CGContextScaleCTM(v15, 1.0, -1.0);
    [v14 scale];
    -[WFImage contentsTransformForDrawingWithSize:scale:](self, "contentsTransformForDrawingWithSize:scale:", width, height, v18);
    CGContextConcatCTM(v15, &v20);
    CGFloat v19 = [(WFImage *)self CGImage];
    if (v19)
    {
      v24.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
      v24.origin.CGFloat y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
      v24.size.double width = width;
      v24.size.double height = height;
      CGContextDrawImage(v15, v24, v19);
    }
    CGContextRestoreGState(v15);
  }
}

- (WFImage)initWithPlatformImage:(id)a3 scale:(double)a4
{
  id v5 = [(WFImage *)self initWithPlatformImage:a3];
  double v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    double v7 = v5;
  }

  return v6;
}

- (WFImage)initWithPlatformImage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 renderingMode];
    unint64_t v7 = [v5 imageOrientation] - 1;
    if (v7 > 6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = dword_1B3D88B88[v7];
    }
    uint64_t v10 = [v5 CGImage];
    [v5 scale];
    self = -[WFImage initWithCGImage:scale:orientation:renderingMode:](self, "initWithCGImage:scale:orientation:renderingMode:", v10, v8, v6);
    double v9 = self;
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (WFImage)initWithName:(id)a3 bundle:(id)a4 scale:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(WFImage *)self initWithRepresentationType:5];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    objc_storeStrong((id *)&v10->_bundle, a4);
    v10->_scale = a5;
    id v13 = v10;
  }

  return v10;
}

- (WFImage)initWithData:(id)a3 scale:(double)a4 allowAnimated:(BOOL)a5
{
  id v8 = a3;
  if (v8
    && (self = [(WFImage *)self initWithRepresentationType:2]) != 0
    && (id v9 = (NSData *)[v8 copy],
        data = self->_data,
        self->_data = v9,
        data,
        self->_scale = a4,
        self->_allowsAnimated = a5,
        [(WFImage *)self hasValidImage]))
  {
    self = self;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (WFImage)initWithContentsOfURL:(id)a3
{
  id v5 = a3;
  if (v5
    && (uint64_t v6 = [(WFImage *)self initWithRepresentationType:1], (self = v6) != 0)
    && (objc_storeStrong((id *)&v6->_URL, a3), [(WFImage *)self hasValidImage]))
  {
    self = self;
    unint64_t v7 = self;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (WFImage)init
{
  return [(WFImage *)self initWithRepresentationType:0];
}

- (WFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5
{
  return [(WFImage *)self initWithCGImage:a3 scale:*(void *)&a5 orientation:0 renderingMode:a4];
}

- (void)drawInContext:(id)a3 inRect:(CGRect)a4
{
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5
{
  id v5 = [[WFImage alloc] initWithCGImage:a3 scale:*(void *)&a5 orientation:a4];
  return v5;
}

+ (id)imageWithData:(id)a3 scale:(double)a4 allowAnimated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [[WFImage alloc] initWithData:v7 scale:v5 allowAnimated:a4];

  return v8;
}

+ (id)imageWithContentsOfURL:(id)a3
{
  id v3 = a3;
  id v4 = [[WFImage alloc] initWithContentsOfURL:v3];

  return v4;
}

+ (id)imageWithCGImage:(CGImage *)a3
{
  return +[WFImage imageWithCGImage:a3 scale:1 orientation:1.0];
}

+ (id)imageWithDeviceScreenScaleImageData:(id)a3
{
  id v3 = a3;
  id v4 = +[WFDevice currentDevice];
  [v4 screenScale];
  BOOL v5 = +[WFImage imageWithData:scale:](WFImage, "imageWithData:scale:", v3);

  return v5;
}

+ (id)imageWithData:(id)a3
{
  return +[WFImage imageWithData:a3 scale:1.0];
}

+ (id)imageWithData:(id)a3 scale:(double)a4
{
  return +[WFImage imageWithData:a3 scale:1 allowAnimated:a4];
}

- (id)roundedWithContinuousCornerRadius:(double)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = [WFBitmapContext alloc];
  [(WFImage *)self scale];
  uint64_t v10 = -[WFBitmapContext initWithSize:opaque:scale:](v8, "initWithSize:opaque:scale:", 0, width, height, v9);
  uint64_t v11 = [(WFBitmapContext *)v10 CGContext];
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.double width = width;
  v16.size.double height = height;
  unint64_t v12 = CGPathCreateWithRoundedRect(v16, a3, a3, 0);
  CGContextAddPath(v11, v12);
  CGContextClip(v11);
  -[WFImage drawInContext:inRect:](self, "drawInContext:inRect:", v10, 0.0, 0.0, width, height);
  id v13 = [(WFBitmapContext *)v10 image];

  return v13;
}

- (id)applicationIconImageWithFormat:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(WFImage *)self createNonRotatedCGImageRepresentation];
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v6 = (void *)getISImageClass_softClass;
  uint64_t v19 = getISImageClass_softClass;
  if (!getISImageClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getISImageClass_block_invoke;
    v15[3] = &unk_1E6079C28;
    v15[4] = &v16;
    __getISImageClass_block_invoke((uint64_t)v15);
    uint64_t v6 = (void *)v17[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v16, 8);
  id v8 = [v7 alloc];
  [(WFImage *)self scale];
  double v9 = objc_msgSend(v8, "initWithCGImage:scale:", v5);
  CGImageRelease(v5);
  id v10 = objc_alloc((Class)getISIconClass());
  v20[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  unint64_t v12 = (void *)[v10 initWithImages:v11];

  id v13 = WFImageForIconAndFormat(v12, a3);

  return v13;
}

+ (id)applicationIconImageForCalendarDate:(id)a3 descriptor:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  if (!CalendarUIKitLibraryCore_frameworkLibrary)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = (uint64_t)__CalendarUIKitLibraryCore_block_invoke;
    CGRect v24 = (uint64_t (*)(uint64_t, uint64_t))&__block_descriptor_40_e5_v8__0l;
    id v25 = (void (*)(uint64_t))&v27;
    long long v28 = xmmword_1E6077E48;
    uint64_t v29 = 0;
    CalendarUIKitLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (CalendarUIKitLibraryCore_frameworkLibrary)
  {
    id v7 = v27;
    if (!v27) {
      goto LABEL_5;
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"void *CalendarUIKitLibrary(void)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"WFImage+Icons.m", 21, @"%s", v27);

    __break(1u);
  }
  free(v7);
LABEL_5:
  uint64_t v21 = 0;
  uint64_t v22 = (uint64_t)&v21;
  uint64_t v23 = 0x3032000000;
  CGRect v24 = __Block_byref_object_copy__5919;
  id v25 = __Block_byref_object_dispose__5920;
  id v26 = 0;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__5919;
  id v31 = __Block_byref_object_dispose__5920;
  id v32 = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v8 = objc_alloc((Class)getISIconClass());
    double v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [v8 initWithDate:v5 calendar:v9 format:0];
    uint64_t v11 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v10;

    uint64_t v12 = WFImageForIconAndDescriptor(*(void **)(v22 + 40), v6);
    id v13 = *(void **)(*((void *)&v28 + 1) + 40);
    *(void *)(*((void *)&v28 + 1) + 40) = v12;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__WFImage_Icons__applicationIconImageForCalendarDate_descriptor___block_invoke;
    block[3] = &unk_1E6077E10;
    uint64_t v19 = &v21;
    id v17 = v5;
    CGAffineTransform v20 = &v28;
    id v18 = v6;
    dispatch_sync(MEMORY[0x1E4F14428], block);

    id v13 = v17;
  }

  id v14 = *(id *)(*((void *)&v28 + 1) + 40);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __65__WFImage_Icons__applicationIconImageForCalendarDate_descriptor___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)getISIconClass());
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = [v2 initWithDate:v3 calendar:v4 format:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = WFImageForIconAndDescriptor(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void **)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

+ (id)documentIconImageForFileType:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F22430];
  uint64_t v5 = [v3 utType];
  uint64_t v6 = [v5 identifier];
  id v7 = [v3 MIMEType];
  id v8 = [v4 documentProxyForName:0 type:v6 MIMEType:v7];

  double v9 = (void *)[objc_alloc((Class)getISIconClass()) initWithResourceProxy:v8];
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v10 = (id *)getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr;
  uint64_t v44 = getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr)
  {
    uint64_t v11 = IconServicesLibrary();
    v42[3] = (uint64_t)dlsym(v11, "kISImageDescriptorCustomDocumentSize");
    getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr = v42[3];
    uint64_t v10 = (id *)v42[3];
  }
  _Block_object_dispose(&v41, 8);
  if (!v10)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v34 = [NSString stringWithUTF8String:"ISImageDescriptorName getkISImageDescriptorCustomDocumentSize(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"WFImage+Icons.m", 29, @"%s", dlerror());

    goto LABEL_23;
  }
  id v12 = *v10;
  v45[0] = v12;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  id v13 = (id *)getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr;
  uint64_t v44 = getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr)
  {
    id v14 = IconServicesLibrary();
    v42[3] = (uint64_t)dlsym(v14, "kISImageDescriptorBadgedDocumentSize");
    getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr = v42[3];
    id v13 = (id *)v42[3];
  }
  _Block_object_dispose(&v41, 8);
  if (!v13)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v36 = [NSString stringWithUTF8String:"ISImageDescriptorName getkISImageDescriptorBadgedDocumentSize(void)"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"WFImage+Icons.m", 30, @"%s", dlerror());

    goto LABEL_23;
  }
  id v15 = *v13;
  v45[1] = v15;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v16 = (id *)getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr;
  uint64_t v44 = getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr)
  {
    id v17 = IconServicesLibrary();
    v42[3] = (uint64_t)dlsym(v17, "kISImageDescriptorCustomDocumentScalableSize");
    getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr = v42[3];
    uint64_t v16 = (id *)v42[3];
  }
  _Block_object_dispose(&v41, 8);
  if (!v16)
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v38 = [NSString stringWithUTF8String:"ISImageDescriptorName getkISImageDescriptorCustomDocumentScalableSize(void)"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"WFImage+Icons.m", 31, @"%s", dlerror());

    goto LABEL_23;
  }
  id v18 = *v16;
  v45[2] = v18;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v19 = (id *)getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr;
  uint64_t v44 = getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr)
  {
    CGAffineTransform v20 = IconServicesLibrary();
    v42[3] = (uint64_t)dlsym(v20, "kISImageDescriptorBadgedDocumentScalableSize");
    getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr = v42[3];
    uint64_t v19 = (id *)v42[3];
  }
  _Block_object_dispose(&v41, 8);
  if (!v19)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v40 = [NSString stringWithUTF8String:"ISImageDescriptorName getkISImageDescriptorBadgedDocumentScalableSize(void)"];
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"WFImage+Icons.m", 32, @"%s", dlerror());

LABEL_23:
    __break(1u);
  }
  id v46 = *v19;
  uint64_t v21 = (void *)MEMORY[0x1E4F1C978];
  id v22 = v46;
  uint64_t v23 = [v21 arrayWithObjects:v45 count:4];

  CGRect v24 = objc_msgSend(v23, "if_compactMap:", &__block_literal_global_64);
  id v25 = WFISImagesForIconAndDescriptors(v9, v24);
  id v26 = objc_msgSend(v25, "if_firstObjectPassingTest:", &__block_literal_global_67);
  uint64_t v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    id v28 = [v25 firstObject];
  }
  uint64_t v29 = v28;
  uint64_t v30 = [v28 CGImage];
  [v29 scale];
  id v31 = +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v30, 1);

  return v31;
}

uint64_t __47__WFImage_Icons__documentIconImageForFileType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 placeholder] ^ 1;
}

id __47__WFImage_Icons__documentIconImageForFileType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [getISImageDescriptorClass() imageDescriptorNamed:v2];

  return v3;
}

+ (void)applicationIconImageForBundleIdentifier:(id)a3 length:(double)a4 scale:(double)a5 completionHandler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v12 = +[WFImage applicationIconImageForBundleIdentifier:v10 length:a4 scale:a5];
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a4, a4, a5);
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v10];
    id v15 = [a1 _applicationIconImageLoadingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke;
    block[3] = &unk_1E6078FB0;
    id v19 = v14;
    id v20 = v13;
    uint64_t v21 = v11;
    id v16 = v13;
    id v17 = v14;
    dispatch_async(v15, block);
  }
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F302D0] sharedResolver];
  id v3 = [v2 resolvedAppMatchingDescriptor:*(void *)(a1 + 32)];

  if ([v3 isInstalled])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6F248]);
    uint64_t v5 = [v3 bundleIdentifier];
    uint64_t v6 = (void *)[v4 initWithBundleIdentifier:v5];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_2;
    v20[3] = &unk_1E6077D80;
    uint64_t v7 = *(void *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    [v6 getImageForImageDescriptor:v7 completion:v20];
  }
  else
  {
    [*(id *)(a1 + 40) size];
    double v9 = v8;
    [*(id *)(a1 + 40) scale];
    double v11 = v9 * v10;
    [*(id *)(a1 + 40) size];
    double v13 = v12;
    [*(id *)(a1 + 40) scale];
    double v15 = v13 * v14;
    id v16 = [v3 bundleIdentifier];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_4;
    v17[3] = &unk_1E6077DA8;
    id v19 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 40);
    +[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:](WFAppIconLoader, "loadIconWithBundleIdentifier:desiredSize:completionHandler:", v16, v17, v11, v15);

    uint64_t v6 = v19;
  }
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_3;
  v6[3] = &unk_1E6078CC0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_5;
  block[3] = &unk_1E6078FB0;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_5(void *a1)
{
  if (a1[4])
  {
    id v2 = *(void (**)(void))(a1[6] + 16);
    v2();
  }
  else
  {
    id v3 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
    id v7 = [v3 imageForDescriptor:a1[5]];

    uint64_t v4 = a1[6];
    uint64_t v5 = [v7 CGImage];
    [v7 scale];
    id v6 = +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v5, 1);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) CGImage];
  [*(id *)(a1 + 32) scale];
  +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v3, 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);
}

+ (id)applicationIconImageForBundleIdentifier:(id)a3 length:(double)a4 scale:(double)a5
{
  id v8 = a3;
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a4, a4, a5);
  [v9 setAppearance:0];
  if ([v8 isEqualToString:@"com.apple.mobilecal"]
    && ([MEMORY[0x1E4F1C9C8] date],
        double v10 = objc_claimAutoreleasedReturnValue(),
        [a1 applicationIconImageForCalendarDate:v10 descriptor:v9],
        double v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    double v12 = [MEMORY[0x1E4F1C9C8] date];
    double v13 = [a1 applicationIconImageForCalendarDate:v12 descriptor:v9];
  }
  else
  {
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v8];
    if (![v11 isInstalled])
    {
      double v13 = 0;
      goto LABEL_12;
    }
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v8];
    double v14 = [v12 imageForDescriptor:v9];
    double v15 = v14;
    if (v14 && ([v14 placeholder] & 1) == 0)
    {
      uint64_t v16 = [v15 CGImage];
      [v15 scale];
      double v13 = +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v16, 1);
    }
    else
    {
      double v13 = 0;
    }
  }
LABEL_12:

  return v13;
}

+ (id)_applicationIconImageLoadingQueue
{
  if (_applicationIconImageLoadingQueue_onceToken != -1) {
    dispatch_once(&_applicationIconImageLoadingQueue_onceToken, &__block_literal_global_5930);
  }
  uint64_t v2 = (void *)_applicationIconImageLoadingQueue_queue;
  return v2;
}

void __51__WFImage_Icons___applicationIconImageLoadingQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.shortcuts.WFImage-ApplicationIconLoading", v2);
  v1 = (void *)_applicationIconImageLoadingQueue_queue;
  _applicationIconImageLoadingQueue_queue = (uint64_t)v0;
}

+ (id)applicationIconImageForBundleIdentifier:(id)a3 format:(unint64_t)a4
{
  id v6 = a3;
  id v7 = WFImageApplicationIconCache();
  id v8 = [NSString stringWithFormat:@"%@-%lu", v6, a4];
  double v9 = [v7 objectForKey:v8];

  if (v9)
  {
    id v10 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v11 = v10;
    }
    else {
      double v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    if (![v6 isEqualToString:@"com.apple.mobilecal"]) {
      goto LABEL_8;
    }
    double v14 = WFISImageDescriptorNameFromWFImageApplicationIconFormat(a4, v13);
    double v15 = [getISImageDescriptorClass() imageDescriptorNamed:v14];
    [v15 setAppearance:0];
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = [a1 applicationIconImageForCalendarDate:v16 descriptor:v15];

    if (!v12)
    {
LABEL_8:
      id v17 = (void *)[objc_alloc((Class)getISIconClass()) initWithBundleIdentifier:v6];
      WFImageForIconAndFormat(v17, a4);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    WFImageApplicationIconCache();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v12;
    if (!v12)
    {
      id v18 = [MEMORY[0x1E4F1CA98] null];
    }
    id v19 = [NSString stringWithFormat:@"%@-%lu", v6, a4];
    [v10 setObject:v18 forKey:v19];

    if (!v12) {
  }
    }

  return v12;
}

+ (id)applicationIconImageForBundleIdentifier:(id)a3
{
  return (id)[a1 applicationIconImageForBundleIdentifier:a3 format:0];
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 scaleFactor:(double)a6 rightToLeft:(BOOL)a7 appearanceName:(id)a8
{
  return (id)[a1 glyphNamed:a3 pointSize:a5 symbolSize:4 symbolWeight:a7 scaleFactor:@"UIAppearanceLight" rightToLeft:0 appearanceName:a4 inCatalogs:a6];
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolWeight:(int64_t)a5 scaleFactor:(double)a6 inCatalogs:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  if (!v13)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"WFImage+Glyphs.m", 173, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  double v15 = [a1 glyphNamed:v13 pointSize:1 symbolSize:a5 symbolWeight:WFShouldReverseLayoutDirection() scaleFactor:@"UIAppearanceLight" rightToLeft:v14 appearanceName:a4 inCatalogs:a6];

  return v15;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 inCatalogs:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"WFImage+Glyphs.m", 165, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  double v11 = +[WFDevice currentDevice];
  [v11 screenScale];
  double v13 = v12;

  id v14 = [a1 glyphNamed:v9 pointSize:1 symbolSize:4 symbolWeight:WFShouldReverseLayoutDirection() scaleFactor:@"UIAppearanceLight" rightToLeft:v10 appearanceName:a4 inCatalogs:v13];

  return v14;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5
{
  id v9 = a3;
  if (!v9)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFImage+Glyphs.m", 157, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v10 = +[WFDevice currentDevice];
  [v10 screenScale];
  double v12 = v11;

  double v13 = [a1 glyphNamed:v9 pointSize:a5 symbolSize:4 symbolWeight:WFShouldReverseLayoutDirection() scaleFactor:@"UIAppearanceLight" rightToLeft:0 appearanceName:a4 inCatalogs:v12];

  return v13;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolWeight:(int64_t)a5 scaleFactor:(double)a6
{
  return (id)[a1 glyphNamed:a3 pointSize:1 symbolSize:a5 symbolWeight:0 scaleFactor:@"UIAppearanceLight" rightToLeft:0 appearanceName:a4 inCatalogs:a6];
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4
{
  return (id)[a1 glyphNamed:a3 pointSize:1 symbolSize:a4];
}

- (id)resizedImageWithSizeInPoints:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = +[WFBitmapContext HDRCapableContextWithSize:scale:](WFBitmapContext, "HDRCapableContextWithSize:scale:", a3.width, a3.height, a4);
  if (v7)
  {
    -[WFImage drawInContext:inRect:](self, "drawInContext:inRect:", v7, 0.0, 0.0, width, height);
    id v8 = [v7 image];
    id v9 = objc_msgSend(v8, "imageWithRenderingMode:", -[WFImage renderingMode](self, "renderingMode"));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)resizedImageWithSizeInPoints:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WFImage *)self scale];
  return -[WFImage resizedImageWithSizeInPoints:scale:](self, "resizedImageWithSizeInPoints:scale:", width, height, v6);
}

@end