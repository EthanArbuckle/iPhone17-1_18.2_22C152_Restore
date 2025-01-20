@interface VKCImageAnalyzerRequest
+ (unint64_t)newQueryIDForParsec;
- (BOOL)_wantsFormFieldDetection;
- (BOOL)_wantsRectangleDetection;
- (BOOL)cancelled;
- (BOOL)hasImageData;
- (BOOL)isMultiPartAnalysis;
- (BOOL)isPhotosAssetRequest;
- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4;
- (CGImage)blockingGenerateCGImage;
- (CGImage)cgImageRef;
- (CGSize)imageSize;
- (CGSize)imageSizeFromCGImageSource:(CGImageSource *)a3;
- (CGSize)photosImageSize;
- (CIImage)ciImage;
- (CLLocation)location;
- (NSArray)barcodeSymbologies;
- (NSArray)defaultBarcodeSymbologies;
- (NSArray)locales;
- (NSDate)processDate;
- (NSString)description;
- (NSString)localIdentifier;
- (NSURL)URL;
- (NSURL)imageURL;
- (NSURL)pageURL;
- (UIImage)image;
- (VKCImageAnalysis)inProcessAnalysis;
- (VKCImageAnalyzerRequest)init;
- (VKCImageAnalyzerRequest)initWithCGImage:(CGImage *)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5;
- (VKCImageAnalyzerRequest)initWithCIImage:(id)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5;
- (VKCImageAnalyzerRequest)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5;
- (VKCImageAnalyzerRequest)initWithImage:(id)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5;
- (VKCImageAnalyzerRequest)initWithImage:(id)a3 requestType:(unint64_t)a4;
- (VKCImageAnalyzerRequest)initWithImageURL:(id)a3 requestType:(unint64_t)a4;
- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 cgImage:(CGImage *)a5 orientation:(int64_t)a6 requestType:(unint64_t)a7;
- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 imageSize:(CGSize)a5 requestType:(unint64_t)a6;
- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 pixelBuffer:(__CVBuffer *)a5 orientation:(int64_t)a6 requestType:(unint64_t)a7;
- (VKCImageAnalyzerRequest)initWithView:(id)a3 requestType:(unint64_t)a4;
- (__CVBuffer)pixelBuffer;
- (__CVBuffer)tempPixelBufferRef;
- (double)screenScale;
- (id)blockingCreatePNGAssetDataWithError:(id *)a3;
- (id)blockingGenerateCIImage;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVNRequestHandler;
- (id)madRequests;
- (id)processedBarcodeSymbologies;
- (id)progressHandler;
- (id)requestIDValue;
- (id)shortLoggingDescription;
- (id)updateHandler;
- (id)viImageType;
- (int)madRequestID;
- (int)requestID;
- (int64_t)imageOrientation;
- (unint64_t)analysisTypes;
- (unint64_t)imageSource;
- (unint64_t)processedAnalysisTypes;
- (unint64_t)queryID;
- (unint64_t)requestType;
- (unint64_t)requestedAnalysisTypes;
- (unsigned)cgimageOrientation;
- (void)dealloc;
- (void)setAnalysisTypes:(unint64_t)a3;
- (void)setBarcodeSymbologies:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCgImageRef:(CGImage *)a3;
- (void)setCgimageOrientation:(unsigned int)a3;
- (void)setCiImage:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDefaultBarcodeSymbologies:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageOrientation:(int64_t)a3;
- (void)setImageSource:(unint64_t)a3;
- (void)setImageURL:(id)a3;
- (void)setInProcessAnalysis:(id)a3;
- (void)setIsMultiPartAnalysis:(BOOL)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setLocales:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMadRequestID:(int)a3;
- (void)setPageURL:(id)a3;
- (void)setPhotosImageSize:(CGSize)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setProcessDate:(id)a3;
- (void)setProcessedAnalysisTypes:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
- (void)setQueryID:(unint64_t)a3;
- (void)setRequestID:(int)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setScreenScale:(double)a3;
- (void)setURL:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)set_wantsFormFieldDetection:(BOOL)a3;
- (void)set_wantsRectangleDetection:(BOOL)a3;
- (void)tempPixelBufferRef;
@end

@implementation VKCImageAnalyzerRequest

- (void)dealloc
{
  cgImageRef = self->_cgImageRef;
  if (cgImageRef) {
    CGImageRelease(cgImageRef);
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CVBufferRelease(pixelBuffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)VKCImageAnalyzerRequest;
  [(VKCImageAnalyzerRequest *)&v5 dealloc];
}

- (VKCImageAnalyzerRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)VKCImageAnalyzerRequest;
  v2 = [(VKCImageAnalyzerRequest *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_imageOrientation = 0;
    v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 scale];
    v3->_screenScale = v5;

    v3->_queryID = [(id)objc_opt_class() newQueryIDForParsec];
  }
  return v3;
}

+ (unint64_t)newQueryIDForParsec
{
  unint64_t result = newQueryIDForParsec_sCurrentQueryID + arc4random_uniform(0x10u) + 1;
  newQueryIDForParsec_sCurrentQueryID = result;
  return result;
}

- (VKCImageAnalyzerRequest)initWithImage:(id)a3 requestType:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = -[VKCImageAnalyzerRequest initWithImage:orientation:requestType:](self, "initWithImage:orientation:requestType:", v6, objc_msgSend(v6, "vk_imageOrientation"), a4);

  return v7;
}

- (VKCImageAnalyzerRequest)initWithImage:(id)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  id v9 = a3;
  v10 = [(VKCImageAnalyzerRequest *)self init];
  if (v10)
  {
    if (!v9)
    {
      v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalyzerRequest initWithImage:orientation:requestType:]();
      }
    }
    objc_storeStrong((id *)&v10->_image, a3);
    v10->_imageOrientation = a4;
    v10->_analysisTypes = a5;
    v10->_requestType = 0;
  }

  return v10;
}

- (VKCImageAnalyzerRequest)initWithCIImage:(id)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  id v9 = a3;
  v10 = [(VKCImageAnalyzerRequest *)self init];
  if (v10)
  {
    if (!v9)
    {
      v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalyzerRequest initWithCIImage:orientation:requestType:]();
      }
    }
    objc_storeStrong((id *)&v10->_ciImage, a3);
    v10->_imageOrientation = a4;
    v10->_analysisTypes = a5;
    v10->_requestType = 2;
  }

  return v10;
}

- (VKCImageAnalyzerRequest)initWithCGImage:(CGImage *)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  v8 = [(VKCImageAnalyzerRequest *)self init];
  if (v8)
  {
    if (!a3)
    {
      id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalyzerRequest initWithCGImage:orientation:requestType:]();
      }
    }
    v8->_cgImageRef = CGImageRetain(a3);
    v8->_imageOrientation = a4;
    v8->_analysisTypes = a5;
    v8->_requestType = 1;
  }
  return v8;
}

- (VKCImageAnalyzerRequest)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  if (a3 && !CVPixelBufferGetIOSurface(a3))
  {
    v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1DB266000, v10, OS_LOG_TYPE_DEFAULT, "pixelBuffer is not IOSurfaceBacked, converting to CIImage", v15, 2u);
    }

    v11 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a3];
    v12 = [(VKCImageAnalyzerRequest *)self initWithCIImage:v11 orientation:a4 requestType:a5];
  }
  else
  {
    id v9 = [(VKCImageAnalyzerRequest *)self init];
    if (v9)
    {
      if (a3)
      {
        v9->_pixelBuffer = CVPixelBufferRetain(a3);
      }
      else
      {
        v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[VKCImageAnalyzerRequest initWithCVPixelBuffer:orientation:requestType:]();
        }
      }
      v9->_imageOrientation = a4;
      v9->_analysisTypes = a5;
      v9->_requestType = 3;
    }
    v12 = v9;
  }

  return v12;
}

- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 imageSize:(CGSize)a5 requestType:(unint64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  v14 = [(VKCImageAnalyzerRequest *)self init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_URL, a4);
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    v15->_analysisTypes = a6;
    v15->_requestType = 5;
    v15->_photosImageSize.CGFloat width = width;
    v15->_photosImageSize.CGFloat height = height;
  }

  return v15;
}

- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 cgImage:(CGImage *)a5 orientation:(int64_t)a6 requestType:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = [(VKCImageAnalyzerRequest *)self init];
  if (v15)
  {
    if (!a5)
    {
      v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalyzerRequest initWithCGImage:orientation:requestType:]();
      }
    }
    v15->_cgImageRef = CGImageRetain(a5);
    objc_storeStrong((id *)&v15->_URL, a4);
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    v15->_imageOrientation = a6;
    v15->_analysisTypes = a7;
    v15->_requestType = 6;
  }

  return v15;
}

- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 pixelBuffer:(__CVBuffer *)a5 orientation:(int64_t)a6 requestType:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = [(VKCImageAnalyzerRequest *)self init];
  if (v15)
  {
    if (a5)
    {
      v15->_pixelBuffer = CVPixelBufferRetain(a5);
    }
    else
    {
      v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalyzerRequest initWithLocalIdentifier:photoLibraryURL:pixelBuffer:orientation:requestType:]();
      }
    }
    objc_storeStrong((id *)&v15->_URL, a4);
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    v15->_imageOrientation = a6;
    v15->_analysisTypes = a7;
    v15->_requestType = 7;
  }

  return v15;
}

- (VKCImageAnalyzerRequest)initWithImageURL:(id)a3 requestType:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(VKCImageAnalyzerRequest *)self init];
  if (v8)
  {
    if (!v7)
    {
      id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalyzerRequest initWithImageURL:requestType:]();
      }
    }
    objc_storeStrong((id *)&v8->_URL, a3);
    v8->_analysisTypes = a4;
    v8->_requestType = 4;
  }

  return v8;
}

- (VKCImageAnalyzerRequest)initWithView:(id)a3 requestType:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VKCImageAnalyzerRequest initWithView:requestType:]();
    }
  }
  v8 = objc_msgSend(v6, "vk_renderImageFromViewBackingStore");
  id v9 = [(VKCImageAnalyzerRequest *)self initWithImage:v8 orientation:0 requestType:a4];

  return v9;
}

- (id)requestIDValue
{
  v2 = NSNumber;
  uint64_t v3 = [(VKCImageAnalyzerRequest *)self requestID];
  return (id)[v2 numberWithInt:v3];
}

- (void)setRequestID:(int)a3
{
  double v5 = [(VKCImageAnalyzerRequest *)self processDate];

  if (a3 >= 1 && !v5) {
    self->_requestID = a3;
  }
}

- (void)setLocales:(id)a3
{
  id v6 = a3;
  double v5 = [(VKCImageAnalyzerRequest *)self processDate];

  if (!v5) {
    objc_storeStrong((id *)&self->_locales, a3);
  }
}

- (void)setBarcodeSymbologies:(id)a3
{
  id v6 = a3;
  double v5 = [(VKCImageAnalyzerRequest *)self processDate];

  if (!v5) {
    objc_storeStrong((id *)&self->_barcodeSymbologies, a3);
  }
}

- (unint64_t)requestedAnalysisTypes
{
  return self->_analysisTypes;
}

- (BOOL)isPhotosAssetRequest
{
  return [(VKCImageAnalyzerRequest *)self requestType] == 5;
}

- (id)processedBarcodeSymbologies
{
  uint64_t v3 = [(VKCImageAnalyzerRequest *)self barcodeSymbologies];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(VKCImageAnalyzerRequest *)self defaultBarcodeSymbologies];
  }
  id v6 = v5;

  if (([(VKCImageAnalyzerRequest *)self analysisTypes] & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(v6, "vk_arrayByAddingNonNilObject:", *MEMORY[0x1E4F45B78]);

    id v6 = (void *)v7;
  }
  return v6;
}

- (unsigned)cgimageOrientation
{
  uint64_t v2 = [(VKCImageAnalyzerRequest *)self imageOrientation];
  return vk_cgImagePropertyOrientationFromVKOrientation(v2);
}

- (NSString)description
{
  if ([(VKCImageAnalyzerRequest *)self requestID])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[VKCImageAnalyzerRequest requestID](self, "requestID"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = @"(Not Set)";
  }
  if ([(VKCImageAnalyzerRequest *)self madRequestID])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[VKCImageAnalyzerRequest madRequestID](self, "madRequestID"));
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = @"(Not Set)";
  }
  id v15 = (id)NSString;
  v18.receiver = self;
  v18.super_class = (Class)VKCImageAnalyzerRequest;
  v4 = [(VKCImageAnalyzerRequest *)&v18 description];
  id v5 = VKMUIStringForBool([(VKCImageAnalyzerRequest *)self cancelled]);
  id v6 = VKMUIStringForAnalysisTypes([(VKCImageAnalyzerRequest *)self analysisTypes]);
  uint64_t v7 = VKMUIStringForAnalyzerRequestType([(VKCImageAnalyzerRequest *)self requestType]);
  v8 = [(VKCImageAnalyzerRequest *)self locales];
  id v9 = [(VKCImageAnalyzerRequest *)self barcodeSymbologies];
  [(VKCImageAnalyzerRequest *)self imageSize];
  id v12 = VKMUIStringForSize(v10, v11);
  id v13 = VKMUIStringForImageOrientation([(VKCImageAnalyzerRequest *)self imageOrientation]);
  id v16 = [v15 stringWithFormat:@"%@ \n requestID: %@ \n madRequestID: %@ \n cancelled: %@ \n analysisTypes: %@ \n requestType: %@ \n locales: %@ \n barcodeSymbologies %@ \n imageSize %@ \n orientation: %@", v4, v17, v3, v5, v6, v7, v8, v9, v12, v13];

  return (NSString *)v16;
}

- (id)shortLoggingDescription
{
  if ([(VKCImageAnalyzerRequest *)self requestID])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[VKCImageAnalyzerRequest requestID](self, "requestID"));
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = @"(Not Set)";
  }
  if ([(VKCImageAnalyzerRequest *)self madRequestID])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[VKCImageAnalyzerRequest madRequestID](self, "madRequestID"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"(Not Set)";
  }
  id v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VKCImageAnalyzerRequest;
  id v6 = [(VKCImageAnalyzerRequest *)&v10 description];
  uint64_t v7 = VKMUIStringForBool([(VKCImageAnalyzerRequest *)self cancelled]);
  v8 = [v5 stringWithFormat:@"%@ requestID: %@ madRequestID: %@ cancelled: %@", v6, v3, v4, v7];

  return v8;
}

- (id)madRequests
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v4 = [(VKCImageAnalyzerRequest *)self processedAnalysisTypes];
  if (v4)
  {
    id v5 = [(VKCImageAnalyzerRequest *)self locales];
    if ([v5 count]) {
      [(VKCImageAnalyzerRequest *)self locales];
    }
    else {
    id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F746A8]);
    objc_msgSend(v7, "setUsesFormFieldDetection:", -[VKCImageAnalyzerRequest _wantsFormFieldDetection](self, "_wantsFormFieldDetection"));
    [v7 setLanguages:v6];
    [v7 setMaximumCandidateCount:3];
    [v7 setUsesLanguageDetection:1];
    [v3 addObject:v7];
  }
  if ((v4 & 0xC) != 0)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F746C8]);
    id v9 = [(VKCImageAnalyzerRequest *)self processedBarcodeSymbologies];
    objc_super v10 = (void *)[v8 initWithSymbologies:v9];

    [v3 addObject:v10];
  }
  if ([(VKCImageAnalyzerRequest *)self _wantsRectangleDetection])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F746D8]);
    [v11 setMaximumObservations:0];
    [v11 setMinimumAspectRatio:0.0];
    [v11 setMinimumSize:0.0];
    LODWORD(v12) = 0.5;
    [v11 setMinimumConfidence:v12];
    LODWORD(v13) = 20.0;
    [v11 setQuadratureTolerance:v13];
    [v3 addObject:v11];
  }
  if ((v4 & 0x10) != 0)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F74720]);
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VKCImageAnalyzerRequest queryID](self, "queryID"));
    [v14 setQueryID:v15];

    id v16 = [(VKCImageAnalyzerRequest *)self viImageType];
    [v14 setImageType:v16];

    v17 = [(VKCImageAnalyzerRequest *)self imageURL];
    [v14 setImageURL:v17];

    objc_super v18 = [(VKCImageAnalyzerRequest *)self pageURL];
    [v14 setReferralURL:v18];

    v19 = [(VKCImageAnalyzerRequest *)self location];
    [v14 setLocation:v19];

    [v3 addObject:v14];
  }
  v20 = (void *)[v3 copy];

  return v20;
}

- (id)viImageType
{
  unint64_t v2 = [(VKCImageAnalyzerRequest *)self imageSource];
  if (v2 > 2) {
    return 0;
  }
  else {
    return (id)qword_1E6BF34B0[v2];
  }
}

- (__CVBuffer)tempPixelBufferRef
{
  if (![(VKCImageAnalyzerRequest *)self requestType])
  {
    char v4 = [(VKCImageAnalyzerRequest *)self image];
    uint64_t v5 = objc_msgSend(v4, "vk_cgImageGeneratingIfNecessary");

    if (v5)
    {
      id v3 = (CGImage *)v5;
      goto LABEL_6;
    }
    id v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(VKCImageAnalyzerRequest *)(uint64_t)self tempPixelBufferRef];
    }

    return 0;
  }
  if ([(VKCImageAnalyzerRequest *)self requestType] != 1) {
    return 0;
  }
  id v3 = [(VKCImageAnalyzerRequest *)self cgImageRef];
LABEL_6:
  return vk_ioSurfaceBackedPixelBufferFromCGImage(v3, 0);
}

- (BOOL)hasImageData
{
  return [(VKCImageAnalyzerRequest *)self requestType] < 5;
}

- (id)blockingGenerateCIImage
{
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1E330];
  v20[0] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F1E3C8];
  v19[0] = v3;
  v19[1] = v4;
  uint64_t v17 = *MEMORY[0x1E4F2FCA0];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", vk_cgImagePropertyOrientationFromVKOrientation(-[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation")));
  objc_super v18 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  switch([(VKCImageAnalyzerRequest *)self requestType])
  {
    case 0uLL:
      id v8 = (void *)MEMORY[0x1E4F1E050];
      id v9 = [(VKCImageAnalyzerRequest *)self image];
      objc_super v10 = objc_msgSend(v8, "imageWithCGImage:options:", objc_msgSend(v9, "vk_cgImage"), v7);

      break;
    case 1uLL:
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:options:", -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"), v7);
      goto LABEL_7;
    case 2uLL:
      uint64_t v11 = [(VKCImageAnalyzerRequest *)self ciImage];
      goto LABEL_7;
    case 3uLL:
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:options:", -[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"), v7);
LABEL_7:
      objc_super v10 = (void *)v11;
      break;
    case 4uLL:
      double v12 = (void *)MEMORY[0x1E4F1E050];
      double v13 = (void *)MEMORY[0x1E4F42A80];
      id v14 = [(VKCImageAnalyzerRequest *)self URL];
      id v15 = objc_msgSend(v13, "vk_imageWithContentsOfURL:", v14);
      objc_super v10 = objc_msgSend(v12, "imageWithCGImage:options:", objc_msgSend(v15, "vk_cgImage"), v7);

      break;
    default:
      objc_super v10 = 0;
      break;
  }

  return v10;
}

- (CGImage)blockingGenerateCGImage
{
  switch([(VKCImageAnalyzerRequest *)self requestType])
  {
    case 0uLL:
      uint64_t v3 = [(VKCImageAnalyzerRequest *)self image];
      uint64_t v4 = (__CVBuffer *)objc_msgSend(v3, "vk_cgImage");

      return v4;
    case 1uLL:
      return [(VKCImageAnalyzerRequest *)self cgImageRef];
    case 2uLL:
      id v6 = [(VKCImageAnalyzerRequest *)self ciImage];
      uint64_t v4 = (__CVBuffer *)[v6 CGImage];

      if (v4) {
        return v4;
      }
      id v7 = [MEMORY[0x1E4F1E018] context];
      id v8 = [(VKCImageAnalyzerRequest *)self ciImage];
      [(VKCImageAnalyzerRequest *)self imageSize];
      uint64_t v4 = (__CVBuffer *)[v7 createCGImage:v8 fromRect:VKMRectWithSize()];

      if (!v4) {
        return v4;
      }
      goto LABEL_11;
    case 3uLL:
      uint64_t v4 = vk_cgImageFromPixelBuffer([(VKCImageAnalyzerRequest *)self pixelBuffer]);
      if (v4) {
LABEL_11:
      }
        CFAutorelease(v4);
      return v4;
    case 4uLL:
      id v9 = (void *)MEMORY[0x1E4F42A80];
      objc_super v10 = [(VKCImageAnalyzerRequest *)self URL];
      uint64_t v11 = objc_msgSend(v9, "vk_imageWithContentsOfURL:", v10);
      double v12 = (CGImage *)objc_msgSend(v11, "vk_cgImage");

      return v12;
    default:
      return 0;
  }
}

- (id)createVNRequestHandler
{
  switch([(VKCImageAnalyzerRequest *)self requestType])
  {
    case 0uLL:
      id v3 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v4 = [(VKCImageAnalyzerRequest *)self image];
      uint64_t v5 = objc_msgSend(v4, "vk_cgImage");
      uint64_t v6 = [(VKCImageAnalyzerRequest *)self cgimageOrientation];
      uint64_t v7 = [v3 initWithCGImage:v5 orientation:v6 options:MEMORY[0x1E4F1CC08]];
      goto LABEL_9;
    case 1uLL:
      id v9 = objc_alloc(MEMORY[0x1E4F45890]);
      objc_super v10 = [(VKCImageAnalyzerRequest *)self cgImageRef];
      uint64_t v11 = [(VKCImageAnalyzerRequest *)self cgimageOrientation];
      uint64_t v12 = [v9 initWithCGImage:v10 orientation:v11 options:MEMORY[0x1E4F1CC08]];
      goto LABEL_7;
    case 2uLL:
      id v13 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v4 = [(VKCImageAnalyzerRequest *)self ciImage];
      uint64_t v14 = [(VKCImageAnalyzerRequest *)self cgimageOrientation];
      uint64_t v7 = [v13 initWithCIImage:v4 orientation:v14 options:MEMORY[0x1E4F1CC08]];
      goto LABEL_9;
    case 3uLL:
      id v15 = objc_alloc(MEMORY[0x1E4F45890]);
      id v16 = [(VKCImageAnalyzerRequest *)self pixelBuffer];
      uint64_t v17 = [(VKCImageAnalyzerRequest *)self cgimageOrientation];
      uint64_t v12 = [v15 initWithCVPixelBuffer:v16 orientation:v17 options:MEMORY[0x1E4F1CC08]];
LABEL_7:
      id v8 = (void *)v12;
      break;
    case 4uLL:
      id v18 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v4 = [(VKCImageAnalyzerRequest *)self URL];
      uint64_t v19 = [(VKCImageAnalyzerRequest *)self cgimageOrientation];
      uint64_t v7 = [v18 initWithURL:v4 orientation:v19 options:MEMORY[0x1E4F1CC08]];
LABEL_9:
      id v8 = (void *)v7;

      break;
    default:
      id v8 = 0;
      break;
  }
  return v8;
}

- (CGSize)imageSize
{
  double Width = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  switch([(VKCImageAnalyzerRequest *)self requestType])
  {
    case 0uLL:
      id v9 = [(VKCImageAnalyzerRequest *)self image];
      [v9 size];
      double Width = v10;
      double v4 = v11;
      goto LABEL_8;
    case 1uLL:
    case 6uLL:
      uint64_t v5 = [(VKCImageAnalyzerRequest *)self cgImageRef];
      double Width = (double)CGImageGetWidth(v5);
      size_t Height = CGImageGetHeight(v5);
      goto LABEL_5;
    case 2uLL:
      id v9 = [(VKCImageAnalyzerRequest *)self ciImage];
      [v9 extent];
      double Width = v12;
      double v4 = v13;
LABEL_8:

      goto LABEL_12;
    case 3uLL:
    case 7uLL:
      uint64_t v7 = [(VKCImageAnalyzerRequest *)self pixelBuffer];
      if (!v7) {
        goto LABEL_12;
      }
      id v8 = v7;
      double Width = (double)CVPixelBufferGetWidth(v7);
      size_t Height = CVPixelBufferGetHeight(v8);
LABEL_5:
      double v4 = (double)Height;
LABEL_12:
      double v22 = Width;
      double v23 = v4;
      result.CGFloat height = v23;
      result.CGFloat width = v22;
      return result;
    case 4uLL:
      id v16 = [(VKCImageAnalyzerRequest *)self URL];
      int v17 = [v16 checkResourceIsReachableAndReturnError:0];

      if (v17)
      {
        CFURLRef v18 = [(VKCImageAnalyzerRequest *)self URL];
        CGImageSourceRef v19 = CGImageSourceCreateWithURL(v18, 0);

        [(VKCImageAnalyzerRequest *)self imageSizeFromCGImageSource:v19];
        double Width = v20;
        double v4 = v21;
        CFRelease(v19);
      }
      goto LABEL_12;
    case 5uLL:
      [(VKCImageAnalyzerRequest *)self photosImageSize];
      double Width = v14;
      double v4 = v15;
      goto LABEL_12;
    default:
      goto LABEL_12;
  }
}

- (CGSize)imageSizeFromCGImageSource:(CGImageSource *)a3
{
  CFDictionaryRef v3 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  CFDictionaryRef v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    [v5 doubleValue];
    double v7 = v6;

    uint64_t v8 = *MEMORY[0x1E4F2FCE8];
    id v9 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = [(__CFDictionary *)v4 objectForKeyedSubscript:v8];
    int v13 = [v12 integerValue];

    if ((v13 - 5) >= 4) {
      double v14 = v11;
    }
    else {
      double v14 = v7;
    }
    if ((v13 - 5) < 4) {
      double v7 = v11;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v15 = v7;
  double v16 = v14;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (NSArray)defaultBarcodeSymbologies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F45BA0];
  unint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFDictionaryRef v4 = [(VKCImageAnalyzerRequest *)self image];

  if (v4)
  {
    uint64_t v5 = [VKCImageAnalyzerRequest alloc];
    double v6 = [(VKCImageAnalyzerRequest *)self image];
    uint64_t v7 = [(VKCImageAnalyzerRequest *)v5 initWithImage:v6 orientation:[(VKCImageAnalyzerRequest *)self imageOrientation] requestType:[(VKCImageAnalyzerRequest *)self analysisTypes]];
LABEL_5:
    double v10 = (VKCImageAnalyzerRequest *)v7;
LABEL_6:

    return v10;
  }
  uint64_t v8 = [(VKCImageAnalyzerRequest *)self ciImage];

  if (v8)
  {
    id v9 = [VKCImageAnalyzerRequest alloc];
    double v6 = [(VKCImageAnalyzerRequest *)self ciImage];
    uint64_t v7 = [(VKCImageAnalyzerRequest *)v9 initWithCIImage:v6 orientation:[(VKCImageAnalyzerRequest *)self imageOrientation] requestType:[(VKCImageAnalyzerRequest *)self analysisTypes]];
    goto LABEL_5;
  }
  if ([(VKCImageAnalyzerRequest *)self cgImageRef])
  {
    double v12 = [VKCImageAnalyzerRequest alloc];
    int v13 = [(VKCImageAnalyzerRequest *)self cgImageRef];
    int64_t v14 = [(VKCImageAnalyzerRequest *)self imageOrientation];
    unint64_t v15 = [(VKCImageAnalyzerRequest *)self analysisTypes];
    return [(VKCImageAnalyzerRequest *)v12 initWithCGImage:v13 orientation:v14 requestType:v15];
  }
  else if ([(VKCImageAnalyzerRequest *)self pixelBuffer])
  {
    double v16 = [VKCImageAnalyzerRequest alloc];
    int v17 = [(VKCImageAnalyzerRequest *)self pixelBuffer];
    int64_t v18 = [(VKCImageAnalyzerRequest *)self imageOrientation];
    unint64_t v19 = [(VKCImageAnalyzerRequest *)self analysisTypes];
    return [(VKCImageAnalyzerRequest *)v16 initWithCVPixelBuffer:v17 orientation:v18 requestType:v19];
  }
  else
  {
    double v20 = [(VKCImageAnalyzerRequest *)self localIdentifier];

    if (v20)
    {
      double v21 = [VKCImageAnalyzerRequest alloc];
      double v6 = [(VKCImageAnalyzerRequest *)self localIdentifier];
      double v22 = [(VKCImageAnalyzerRequest *)self URL];
      [(VKCImageAnalyzerRequest *)self imageSize];
      double v10 = -[VKCImageAnalyzerRequest initWithLocalIdentifier:photoLibraryURL:imageSize:requestType:](v21, "initWithLocalIdentifier:photoLibraryURL:imageSize:requestType:", v6, v22, [(VKCImageAnalyzerRequest *)self analysisTypes], v23, v24);

      goto LABEL_6;
    }
    v25 = [(VKCImageAnalyzerRequest *)self URL];

    if (v25)
    {
      v26 = [VKCImageAnalyzerRequest alloc];
      double v6 = [(VKCImageAnalyzerRequest *)self URL];
      uint64_t v7 = [(VKCImageAnalyzerRequest *)v26 initWithImageURL:v6 requestType:[(VKCImageAnalyzerRequest *)self analysisTypes]];
      goto LABEL_5;
    }
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCImageAnalyzerRequest copyWithZone:]", 0, 0, @"Unable to create a copy of VKImageAnalyzerRequest");
    return 0;
  }
}

- (id)blockingCreatePNGAssetDataWithError:(id *)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__13;
  v41 = __Block_byref_object_dispose__13;
  id v42 = 0;
  uint64_t v5 = [(VKCImageAnalyzerRequest *)self image];

  if (v5)
  {
    uint64_t v6 = [(VKCImageAnalyzerRequest *)self image];
LABEL_5:
    uint64_t v7 = (void *)v38[5];
    v38[5] = v6;
    goto LABEL_6;
  }
  if ([(VKCImageAnalyzerRequest *)self cgImageRef])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"));
    goto LABEL_5;
  }
  if ([(VKCImageAnalyzerRequest *)self pixelBuffer])
  {
    int v13 = vk_cgImageFromPixelBuffer([(VKCImageAnalyzerRequest *)self pixelBuffer]);
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", v13);
    unint64_t v15 = (void *)v38[5];
    v38[5] = v14;

    CGImageRelease(v13);
    goto LABEL_7;
  }
  double v16 = [(VKCImageAnalyzerRequest *)self localIdentifier];

  if (!v16) {
    goto LABEL_7;
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  int v17 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v51 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    v45 = __getPHPhotoLibraryClass_block_invoke;
    v46 = &unk_1E6BF0A90;
    v47 = &v48;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)&v43);
    int v17 = (void *)v49[3];
  }
  int64_t v18 = v17;
  _Block_object_dispose(&v48, 8);
  id v19 = [v18 alloc];
  double v20 = [(VKCImageAnalyzerRequest *)self URL];
  uint64_t v7 = (void *)[v19 initWithPhotoLibraryURL:v20];

  if (v7)
  {
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    double v21 = (void *)getPHFetchOptionsClass_softClass;
    uint64_t v51 = getPHFetchOptionsClass_softClass;
    if (!getPHFetchOptionsClass_softClass)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getPHFetchOptionsClass_block_invoke;
      v46 = &unk_1E6BF0A90;
      v47 = &v48;
      __getPHFetchOptionsClass_block_invoke((uint64_t)&v43);
      double v21 = (void *)v49[3];
    }
    id v22 = v21;
    _Block_object_dispose(&v48, 8);
    double v23 = [v22 fetchOptionsWithPhotoLibrary:v7 orObject:0];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    double v24 = (void *)getPHAssetClass_softClass;
    uint64_t v51 = getPHAssetClass_softClass;
    if (!getPHAssetClass_softClass)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getPHAssetClass_block_invoke;
      v46 = &unk_1E6BF0A90;
      v47 = &v48;
      __getPHAssetClass_block_invoke((uint64_t)&v43);
      double v24 = (void *)v49[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v48, 8);
    v26 = [(VKCImageAnalyzerRequest *)self localIdentifier];
    v52[0] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    v28 = [v25 fetchAssetsWithLocalIdentifiers:v27 options:v23];
    v29 = [v28 firstObject];

    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    v30 = (void *)getPHImageRequestOptionsClass_softClass;
    uint64_t v51 = getPHImageRequestOptionsClass_softClass;
    if (!getPHImageRequestOptionsClass_softClass)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getPHImageRequestOptionsClass_block_invoke;
      v46 = &unk_1E6BF0A90;
      v47 = &v48;
      __getPHImageRequestOptionsClass_block_invoke((uint64_t)&v43);
      v30 = (void *)v49[3];
    }
    v31 = v30;
    _Block_object_dispose(&v48, 8);
    v32 = (void *)[[v31 alloc] init];
    [v32 setSynchronous:1];
    [v32 setNetworkAccessAllowed:1];
    [v32 setDeliveryMode:1];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2050000000;
    v33 = (void *)getPHImageManagerClass_softClass;
    uint64_t v51 = getPHImageManagerClass_softClass;
    if (!getPHImageManagerClass_softClass)
    {
      uint64_t v43 = MEMORY[0x1E4F143A8];
      uint64_t v44 = 3221225472;
      v45 = __getPHImageManagerClass_block_invoke;
      v46 = &unk_1E6BF0A90;
      v47 = &v48;
      __getPHImageManagerClass_block_invoke((uint64_t)&v43);
      v33 = (void *)v49[3];
    }
    id v34 = v33;
    _Block_object_dispose(&v48, 8);
    v35 = [v34 defaultManager];
    [(VKCImageAnalyzerRequest *)self imageSize];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63__VKCImageAnalyzerRequest_blockingCreatePNGAssetDataWithError___block_invoke;
    v36[3] = &unk_1E6BF3478;
    v36[4] = &v37;
    v36[5] = a3;
    objc_msgSend(v35, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v29, 0, v32, v36);
  }
LABEL_6:

LABEL_7:
  int64_t v8 = [(VKCImageAnalyzerRequest *)self imageOrientation];
  uint64_t v9 = v38[5];
  if (v8 && v9)
  {
    double v10 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_orientedImageFromImage:toOrientation:", v9, v8);
    double v11 = objc_msgSend(v10, "vk_PNGData");
  }
  else
  {
    double v11 = objc_msgSend((id)v38[5], "vk_PNGData");
  }
  _Block_object_dispose(&v37, 8);

  return v11;
}

void __63__VKCImageAnalyzerRequest_blockingCreatePNGAssetDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int64_t v8 = (id *)getPHImageErrorKeySymbolLoc_ptr;
  uint64_t v16 = getPHImageErrorKeySymbolLoc_ptr;
  if (!getPHImageErrorKeySymbolLoc_ptr)
  {
    uint64_t v9 = (void *)PhotosLibrary();
    v14[3] = (uint64_t)dlsym(v9, "PHImageErrorKey");
    getPHImageErrorKeySymbolLoc_ptr = v14[3];
    int64_t v8 = (id *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v8)
  {
    double v12 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  id v10 = *v8;
  double v11 = [v7 objectForKeyedSubscript:v10];

  if (v11 && *(void *)(a1 + 40)) {
    **(void **)(a1 + 40) = v11;
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [(VKCImageAnalyzerRequest *)self URL];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [(VKCImageAnalyzerRequest *)self localIdentifier];
    if (v10)
    {
    }
    else
    {
      double v11 = [(VKCImageAnalyzerRequest *)self URL];
      int v12 = [v11 isFileURL];

      if (v12)
      {
        uint64_t v13 = [(VKCImageAnalyzerRequest *)self URL];
        uint64_t v14 = [v13 lastPathComponent];
        uint64_t v15 = [v6 URLByAppendingPathComponent:v14];
        char v16 = [v7 copyItemAtURL:v13 toURL:v15 error:a4];

LABEL_9:
        goto LABEL_10;
      }
    }
  }
  uint64_t v17 = [(VKCImageAnalyzerRequest *)self blockingCreatePNGAssetDataWithError:a4];
  uint64_t v13 = (void *)v17;
  char v16 = a4 == 0;
  if (!a4 && v17)
  {
    uint64_t v14 = [v6 URLByAppendingPathComponent:@"RequestAsset.png"];
    char v16 = [v13 writeToURL:v14 options:2 error:0];
    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSArray)barcodeSymbologies
{
  return self->_barcodeSymbologies;
}

- (unint64_t)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(unint64_t)a3
{
  self->_imageSource = a3;
}

- (int)requestID
{
  return self->_requestID;
}

- (unint64_t)processedAnalysisTypes
{
  return self->_processedAnalysisTypes;
}

- (void)setProcessedAnalysisTypes:(unint64_t)a3
{
  self->_processedAnalysisTypes = a3;
}

- (BOOL)_wantsFormFieldDetection
{
  return self->__wantsFormFieldDetection;
}

- (void)set_wantsFormFieldDetection:(BOOL)a3
{
  self->__wantsFormFieldDetection = a3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (VKCImageAnalysis)inProcessAnalysis
{
  return self->_inProcessAnalysis;
}

- (void)setInProcessAnalysis:(id)a3
{
}

- (BOOL)isMultiPartAnalysis
{
  return self->_isMultiPartAnalysis;
}

- (void)setIsMultiPartAnalysis:(BOOL)a3
{
  self->_isMultiPartAnalysis = a3;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (void)setCgimageOrientation:(unsigned int)a3
{
  self->_cgimageOrientation = a3;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  self->_analysisTypes = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CIImage)ciImage
{
  return self->_ciImage;
}

- (void)setCiImage:(id)a3
{
}

- (CGImage)cgImageRef
{
  return self->_cgImageRef;
}

- (void)setCgImageRef:(CGImage *)a3
{
  self->_cgImageRef = a3;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (CGSize)photosImageSize
{
  double width = self->_photosImageSize.width;
  double height = self->_photosImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPhotosImageSize:(CGSize)a3
{
  self->_photosImageSize = a3;
}

- (int)madRequestID
{
  return self->_madRequestID;
}

- (void)setMadRequestID:(int)a3
{
  self->_madRequestID = a3;
}

- (NSDate)processDate
{
  return self->_processDate;
}

- (void)setProcessDate:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)_wantsRectangleDetection
{
  return self->__wantsRectangleDetection;
}

- (void)set_wantsRectangleDetection:(BOOL)a3
{
  self->__wantsRectangleDetection = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setDefaultBarcodeSymbologies:(id)a3
{
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(unint64_t)a3
{
  self->_queryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBarcodeSymbologies, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_processDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_ciImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_inProcessAnalysis, 0);
  objc_storeStrong((id *)&self->_barcodeSymbologies, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

- (void)initWithImage:orientation:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Analysis request with an image, but the provided image is nil.", v2, v3, v4, v5, v6);
}

- (void)initWithCIImage:orientation:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Analysis request with a CIImage, but the provided CIImage is nil.", v2, v3, v4, v5, v6);
}

- (void)initWithCGImage:orientation:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Analysis request with a CGImage, but the provided CGImageRef is NULL.", v2, v3, v4, v5, v6);
}

- (void)initWithCVPixelBuffer:orientation:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Analysis request with a CVPixelBuffer, but the provided CVPixelBufferRef is NULL.", v2, v3, v4, v5, v6);
}

- (void)initWithLocalIdentifier:photoLibraryURL:pixelBuffer:orientation:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Photos Analysis request with a CVPixelBuffer, but the provided CVPixelBufferRef is NULL.", v2, v3, v4, v5, v6);
}

- (void)initWithImageURL:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Analysis request with a URL, but the provided URL in nil.", v2, v3, v4, v5, v6);
}

- (void)initWithView:requestType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to create an Analysis request with a View, but the provided View in nil.", v2, v3, v4, v5, v6);
}

- (void)tempPixelBufferRef
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Unable to create CVPixelBuffer for request: %@", (uint8_t *)&v2, 0xCu);
}

@end