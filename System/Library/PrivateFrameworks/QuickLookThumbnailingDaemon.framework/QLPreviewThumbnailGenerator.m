@interface QLPreviewThumbnailGenerator
+ (BOOL)canGenerateThumbnailForContentType:(id)a3 atSize:(CGSize)a4;
+ (double)cornerRadiusForSize:(CGSize)a3;
+ (id)generateIconDataFromThumbnailData:(id)a3 inputFormat:(id)a4 outputFormat:(id *)a5 outputContentRect:(CGRect *)a6 desiredSize:(CGSize)a7 desiredScale:(double)a8 desiredFlavor:(int)a9 extensionBadge:(id)a10 wantsLowQuality:(BOOL)a11 iconVariant:(int64_t)a12;
- (BOOL)resultHasIconModeApplied;
- (BOOL)resultIsLowQuality;
- (BOOL)wantsLowQuality;
- (CGContext)_beginContext;
- (CGContext)_beginContextWithSize:(CGSize)a3;
- (CGContext)_beginContextWithSize:(CGSize)a3 scale:(double)a4;
- (CGRect)contentRect;
- (NSArray)thumbnailImages;
- (NSString)extensionBadge;
- (OS_dispatch_queue)generationQueue;
- (QLPlatformImage)thumbnailImage;
- (QLPreviewThumbnailGenerator)initWithGeneratorRequest:(id)a3 lowQuality:(BOOL)a4 thumbnailItem:(id)a5;
- (QLTGeneratorThumbnailRequest)request;
- (QLThumbnailExtensionGenerator)extensionGenerator;
- (QLThumbnailItem)item;
- (QLThumbnailMetadata)generatedProperties;
- (double)_minimumDimensionForPDFPageRect:(CGRect)a3 requestThumbnailSize:(CGSize)a4 scale:(double)a5;
- (int)flavor;
- (int)status;
- (unint64_t)sandboxExtension;
- (void)_createThumbnailForPDF:(id)a3;
- (void)_drawRemotePDFPage:(id)a3 atIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)_generateThumbnailFromExtensionAndReplyWith:(id)a3;
- (void)_generateThumbnailWithWillStartBlock:(id)a3 completionHandler:(id)a4;
- (void)_replyWithImages:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)cancel;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
- (void)generateWithCompletionBlock:(id)a3;
- (void)generateWithWillStartBlock:(id)a3 completionBlock:(id)a4;
- (void)setContentRect:(CGRect)a3;
- (void)setExtensionBadge:(id)a3;
- (void)setExtensionGenerator:(id)a3;
- (void)setFlavor:(int)a3;
- (void)setGeneratedProperties:(id)a3;
- (void)setGenerationQueue:(id)a3;
- (void)setItem:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResultHasIconModeApplied:(BOOL)a3;
- (void)setResultIsLowQuality:(BOOL)a3;
- (void)setSandboxExtension:(unint64_t)a3;
- (void)setStatus:(int)a3;
- (void)setThumbnailImages:(id)a3;
- (void)setWantsLowQuality:(BOOL)a3;
@end

@implementation QLPreviewThumbnailGenerator

- (QLPreviewThumbnailGenerator)initWithGeneratorRequest:(id)a3 lowQuality:(BOOL)a4 thumbnailItem:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)QLPreviewThumbnailGenerator;
  v11 = [(QLPreviewThumbnailGenerator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v12->_wantsLowQuality = a4;
    objc_storeStrong((id *)&v12->_item, a5);
  }

  return v12;
}

+ (BOOL)canGenerateThumbnailForContentType:(id)a3 atSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  v7 = +[QLThumbnailExtensionMonitor shared];
  char v8 = objc_msgSend(v7, "canGenerateThumbnailWith:at:", v6, width, height);

  return v8;
}

- (void)_generateThumbnailWithWillStartBlock:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  request = self->_request;
  id v6 = a4;
  v7 = [(QLTGeneratorThumbnailRequest *)request request];
  char v8 = (void (**)(void, void))[v6 copy];

  if (self->_status == 3)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3A738] code:5 userInfo:0];
    ((void (**)(void, void *))v8)[2](v8, v9);

    goto LABEL_7;
  }
  id v10 = [(QLThumbnailItem *)self->_item contentType];
  if ([v10 conformsToType:*MEMORY[0x1E4F44450]])
  {

LABEL_6:
    [(QLPreviewThumbnailGenerator *)self _createThumbnailForPDF:v8];
    goto LABEL_7;
  }
  v11 = [(QLThumbnailItem *)self->_item contentType];
  v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.localized-pdf-bundle"];
  int v13 = [v11 conformsToType:v12];

  if (v13) {
    goto LABEL_6;
  }
  objc_super v14 = +[QLThumbnailExtensionMonitor shared];
  v15 = [v14 bestExtensionFor:v7 matching:3];

  if (v15)
  {
    [(QLPreviewThumbnailGenerator *)self _generateThumbnailFromExtensionAndReplyWith:v8];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F3A6C8];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v17 = NSString;
    v18 = [(QLThumbnailItem *)self->_item contentType];
    v19 = [v17 stringWithFormat:@"No extension found for %@", v18];
    v23[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v21 = [v16 errorWithCode:4 request:v7 additionalUserInfo:v20];

    self->_status = 2;
    ((void (**)(void, void *))v8)[2](v8, v21);
  }
LABEL_7:
}

+ (double)cornerRadiusForSize:(CGSize)a3
{
  if (a3.width < a3.height) {
    a3.double width = a3.height;
  }
  double result = a3.width * 6.0 * 0.0078125 + -1.0;
  if (result < 3.0) {
    return 3.0;
  }
  return result;
}

+ (id)generateIconDataFromThumbnailData:(id)a3 inputFormat:(id)a4 outputFormat:(id *)a5 outputContentRect:(CGRect *)a6 desiredSize:(CGSize)a7 desiredScale:(double)a8 desiredFlavor:(int)a9 extensionBadge:(id)a10 wantsLowQuality:(BOOL)a11 iconVariant:(int64_t)a12
{
  double height = a7.height;
  double width = a7.width;
  id v18 = a4;
  v19 = CGDataProviderCreateWithCFData((CFDataRef)a3);
  v20 = CGImageCreate([v18 width], objc_msgSend(v18, "height"), objc_msgSend(v18, "bitsPerComponent"), objc_msgSend(v18, "bitsPerPixel"), objc_msgSend(v18, "bytesPerRow"), (CGColorSpaceRef)objc_msgSend(v18, "colorSpace"), objc_msgSend(v18, "bitmapInfo"), v19, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v19);
  if (!v20)
  {
    v28 = _log_2();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:](v28);
    }

    goto LABEL_13;
  }
  double v21 = (double)(unint64_t)[v18 width] / a8;
  double v22 = (double)(unint64_t)[v18 height] / a8;
  CGColorSpaceIsWideGamutRGB((CGColorSpaceRef)[v18 colorSpace]);
  uint64_t v23 = QLTCreateCGContext();
  if (!v23)
  {
    v29 = _log_2();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:](v29);
    }

    CGImageRelease(v20);
LABEL_13:
    dispatch_data_t subrange = 0;
    goto LABEL_16;
  }
  v24 = (CGContext *)v23;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F3A698]) initWithBitmapContext:v23];
  v26 = v25;
  if (a5) {
    *a5 = v25;
  }
  Data = CGBitmapContextGetData(v24);
  CGContextScaleCTM(v24, a8, a8);
  objc_msgSend(a1, "cornerRadiusForSize:", width, height);
  if (a12 == 2)
  {
    CGContextSetRGBFillColor(v24, 1.0, 1.0, 1.0, 1.0);
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.double width = v21;
    v36.size.double height = v22;
    CGContextFillRect(v24, v36);
    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.double width = v21;
    v37.size.double height = v22;
    CGContextDrawImage(v24, v37, v20);
  }
  else
  {
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.double width = v21;
    v38.size.double height = v22;
    CGRectInset(v38, 1.0, 1.0);
    v31 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
    CGContextAddPath(v24, v31);
    CGContextSaveGState(v24);
    CGContextClip(v24);
    CGPathRelease(v31);
    CGContextSetRGBFillColor(v24, 1.0, 1.0, 1.0, 1.0);
    v39.origin.x = 0.0;
    v39.origin.y = 0.0;
    v39.size.double width = v21;
    v39.size.double height = v22;
    CGContextFillRect(v24, v39);
    v40.origin.x = 0.0;
    v40.origin.y = 0.0;
    v40.size.double width = v21;
    v40.size.double height = v22;
    CGContextDrawImage(v24, v40, v20);
    CGContextRestoreGState(v24);
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.double width = v21;
    v41.size.double height = v22;
    CGRectInset(v41, 0.5, 0.5);
    v32 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
    CGContextBeginPath(v24);
    CGContextAddPath(v24, v32);
    CGContextSetRGBStrokeColor(v24, 0.0, 0.0, 0.0, 0.121568627);
    CGContextStrokePath(v24);
    CGPathRelease(v32);
  }
  v33 = dispatch_data_create(Data, 0, 0, (dispatch_block_t)*MEMORY[0x1E4F143F8]);
  CGContextRelease(v24);
  CGImageRelease(v20);
  dispatch_data_t subrange = dispatch_data_create_subrange(v33, 0, [v26 height] * objc_msgSend(v26, "bytesPerRow"));

LABEL_16:
  return subrange;
}

- (void)generateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__QLPreviewThumbnailGenerator_generateWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E6D0CCD0;
  id v7 = v4;
  id v5 = v4;
  [(QLPreviewThumbnailGenerator *)self generateWithWillStartBlock:0 completionBlock:v6];
}

uint64_t __59__QLPreviewThumbnailGenerator_generateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__QLPreviewThumbnailGenerator_generateThumbnailWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6D0C6D8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(QLPreviewThumbnailGenerator *)self generateWithWillStartBlock:0 completionBlock:v6];
}

void __70__QLPreviewThumbnailGenerator_generateThumbnailWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 thumbnailImages];
  id v5 = [v6 firstObject];
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);
}

- (void)generateWithWillStartBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((self->_status - 1) >= 2)
  {
    self->_status = 1;
    generationQueue = self->_generationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__QLPreviewThumbnailGenerator_generateWithWillStartBlock_completionBlock___block_invoke;
    block[3] = &unk_1E6D0CF18;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(generationQueue, block);
  }
}

void __74__QLPreviewThumbnailGenerator_generateWithWillStartBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C5C90]();
  [*(id *)(a1 + 32) _generateThumbnailWithWillStartBlock:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)cancel
{
  [(QLPreviewThumbnailGenerator *)self setStatus:3];
  extensionGenerator = self->_extensionGenerator;
  if (extensionGenerator)
  {
    [(QLThumbnailExtensionGenerator *)extensionGenerator cancel];
  }
}

- (void)_replyWithImages:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(QLPreviewThumbnailGenerator *)self item];
  v12 = _log_2();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v13)
    {
      uint64_t v14 = [v8 count];
      v15 = [v8 firstObject];
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      id v32 = v15;
      __int16 v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "QLPreviewThumbnailGenerator did generate %lu images: %@ for item: %@.", buf, 0x20u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke_12;
    block[3] = &unk_1E6D0CF68;
    block[4] = self;
    id v25 = v10;
    id v22 = v8;
    id v23 = v9;
    id v24 = v11;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v18 = v22;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = (uint64_t)v11;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "QLPreviewThumbnailGenerator did not generate an image for item: %@. Error: %@", buf, 0x16u);
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke;
    v26[3] = &unk_1E6D0CF40;
    id v27 = v9;
    id v28 = v10;
    id v19 = v9;
    id v20 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v26);

    id v18 = v28;
  }
}

uint64_t __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke_12(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) status] == 3)
  {
    uint64_t v2 = _log_2();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 56);
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1DDC5E000, v2, OS_LOG_TYPE_INFO, "Cancelled during generation for %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 64);
    id v5 = [MEMORY[0x1E4F3A6C8] errorWithCode:5 request:0 additionalUserInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    [*(id *)(a1 + 32) setThumbnailImages:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setStatus:2];
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v6();
  }
}

- (CGContext)_beginContext
{
  uint64_t v3 = [(QLTGeneratorThumbnailRequest *)self->_request request];
  [v3 size];
  uint64_t v4 = -[QLPreviewThumbnailGenerator _beginContextWithSize:](self, "_beginContextWithSize:");

  return v4;
}

- (CGContext)_beginContextWithSize:(CGSize)a3
{
  uint64_t v3 = [(QLTGeneratorThumbnailRequest *)self->_request request];
  [v3 scale];
  uint64_t v4 = (CGContext *)QLTCreateCGContext();

  return v4;
}

- (CGContext)_beginContextWithSize:(CGSize)a3 scale:(double)a4
{
  return (CGContext *)QLTCreateCGContext();
}

- (void)_createThumbnailForPDF:(id)a3
{
  id v4 = a3;
  id v5 = [(QLTGeneratorThumbnailRequest *)self->_request request];
  p_item = &self->_item;
  uint64_t v7 = [(QLThumbnailItem *)self->_item data];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = 0;
    id v10 = 0;
LABEL_3:
    id v11 = [MEMORY[0x1E4F1DB38] sharedInstance];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke;
    v24[3] = &unk_1E6D0CFB8;
    id v10 = v10;
    id v25 = v10;
    v26 = self;
    id v28 = v4;
    id v27 = v5;
    [v11 newRemotePDFDocumentWithData:v8 completion:v24];

    v12 = v25;
    goto LABEL_20;
  }
  id v10 = [(QLThumbnailItem *)*p_item urlWrapper];

  if (v10)
  {
    BOOL v13 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v14 = [(QLThumbnailItem *)*p_item fileURL];
    v15 = [v13 bundleWithURL:v14];

    id v16 = [(QLThumbnailItem *)*p_item fileURL];
    id v17 = v16;
    if (v15)
    {
      id v18 = [v16 lastPathComponent];
      id v19 = [v18 stringByDeletingPathExtension];

      id v20 = [v15 URLForResource:v19 withExtension:@"pdf"];
      double v21 = v20;
      if (v20)
      {
        id v17 = CFRetain(v20);
      }
      else
      {
        id v17 = 0;
      }
    }
    if ([v17 startAccessingSecurityScopedResource]) {
      id v10 = v17;
    }
    else {
      id v10 = 0;
    }
    id v29 = 0;
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v17 options:1 error:&v29];
    id v9 = v29;

    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v22 = _log_2();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    [(QLPreviewThumbnailGenerator *)(id *)&self->_item _createThumbnailForPDF:v22];
  }

  id v23 = objc_opt_new();
  uint64_t v8 = v23;
  if (v9) {
    [v23 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3A738] code:0 userInfo:v8];
  [(QLPreviewThumbnailGenerator *)self _replyWithImages:0 error:v12 completionHandler:v4];
LABEL_20:
}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  if (v5)
  {
    [*(id *)(a1 + 48) size];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    [*(id *)(a1 + 48) scale];
    uint64_t v12 = v11;
    BOOL v13 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_20;
    v19[3] = &unk_1E6D0CF90;
    id v14 = v5;
    uint64_t v24 = v8;
    uint64_t v25 = v10;
    uint64_t v15 = *(void *)(a1 + 40);
    id v20 = v14;
    uint64_t v21 = v15;
    uint64_t v26 = v12;
    id v23 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 48);
    [v13 _drawRemotePDFPage:v14 atIndex:0 completionHandler:v19];

    id v16 = v20;
  }
  else
  {
    id v17 = _log_2();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_cold_1();
    }

    id v18 = *(void **)(a1 + 40);
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3A738] code:0 userInfo:0];
    [v18 _replyWithImages:0 error:v16 completionHandler:*(void *)(a1 + 56)];
  }
}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_20(uint64_t a1, CGImage *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x1E4F945C8];
    [*(id *)(a1 + 48) scale];
    uint64_t v7 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", a2, 1);
    CGImageRelease(a2);
    uint64_t v8 = *(void **)(a1 + 40);
    id v16 = v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v10 = &v16;
LABEL_11:
    uint64_t v15 = [v9 arrayWithObjects:v10 count:1];
    [v8 _replyWithImages:v15 error:0 completionHandler:*(void *)(a1 + 56)];

    goto LABEL_12;
  }
  if (([*(id *)(a1 + 32) isUnlocked] & 1) == 0)
  {
    QLAdaptSizeInSize();
    BOOL v13 = (CGContext *)[*(id *)(a1 + 40) _beginContextWithSize:v12];
    QLDrawLockIcon();
    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    if (Image)
    {
      uint64_t v7 = [MEMORY[0x1E4F945C8] imageWithCGImage:Image scale:1 orientation:*(double *)(a1 + 80)];
      CGImageRelease(Image);
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void **)(a1 + 40);
    v17[0] = v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v10 = (void **)v17;
    goto LABEL_11;
  }
  uint64_t v11 = _log_2();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_20_cold_1();
  }

  uint64_t v7 = [MEMORY[0x1E4F3A6C8] errorWithCode:0 request:0 additionalUserInfo:0];
  [*(id *)(a1 + 40) _replyWithImages:0 error:v7 completionHandler:*(void *)(a1 + 56)];
LABEL_12:
}

- (double)_minimumDimensionForPDFPageRect:(CGRect)a3 requestThumbnailSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  QLGetDrawRectFromPageRectWithMinimumDimension();
  if (v8 >= v9) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }
  if (v8 >= v9) {
    double v11 = v9;
  }
  else {
    double v11 = v8;
  }
  if (v10 / v11 < 5.0) {
    return 0.0;
  }
  if (width >= height) {
    double v13 = height;
  }
  else {
    double v13 = width;
  }
  return ceil(v13 * 0.5 * a5);
}

- (void)_drawRemotePDFPage:(id)a3 atIndex:(int64_t)a4 completionHandler:(id)a5
{
  v56[6] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  request = self->_request;
  id v10 = a3;
  double v11 = [(QLTGeneratorThumbnailRequest *)request request];
  double v12 = objc_msgSend(v10, "sync_pageAtIndex:", a4);

  if (v12)
  {
    [v11 size];
    [v11 scale];
    [v11 size];
    [v11 scale];
    [v11 minimumDimension];
    double v14 = v13;
    [v11 scale];
    double v16 = v14 * v15;
    QLGetCGPDFPageProxyRect();
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    if (v16 == 0.0)
    {
      [v11 size];
      double v26 = v25;
      double v28 = v27;
      [v11 scale];
      -[QLPreviewThumbnailGenerator _minimumDimensionForPDFPageRect:requestThumbnailSize:scale:](self, "_minimumDimensionForPDFPageRect:requestThumbnailSize:scale:", v18, v20, v22, v24, v26, v28, v29);
      double v16 = v30;
    }
    QLGetDrawRectFromPageRectWithMinimumDimension();
    double v51 = v31;
    double v33 = v32;
    QLGetCGPDFPageProxyRect();
    double v35 = v34;
    double v37 = v36;
    QLGetDrawRectFromPageRectWithMinimumDimension();
    QLAdaptSizeToRectWithRounding2();
    uint64_t v38 = MEMORY[0x1E4F1CC38];
    uint64_t v39 = *MEMORY[0x1E4F1DCD8];
    v55[0] = *MEMORY[0x1E4F1DCE0];
    v55[1] = v39;
    v56[0] = MEMORY[0x1E4F1CC38];
    v56[1] = MEMORY[0x1E4F1CC38];
    uint64_t v40 = *MEMORY[0x1E4F1DCD0];
    v56[2] = MEMORY[0x1E4F1CC38];
    uint64_t v41 = *MEMORY[0x1E4F1DCF0];
    v55[2] = v40;
    v55[3] = v41;
    v54[0] = v42;
    *(double *)&v54[1] = v35 + v37 - v43;
    v54[2] = v44;
    *(double *)&v54[3] = v43;
    v45 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", v54, "{CGRect={CGPoint=dd}{CGSize=dd}}", *(void *)&v16);
    uint64_t v46 = *MEMORY[0x1E4F1DCF8];
    v56[3] = v45;
    v56[4] = v38;
    uint64_t v47 = *MEMORY[0x1E4F1DCE8];
    v55[4] = v46;
    v55[5] = v47;
    v56[5] = MEMORY[0x1E4F1CC28];
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:6];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __76__QLPreviewThumbnailGenerator__drawRemotePDFPage_atIndex_completionHandler___block_invoke;
    v52[3] = &unk_1E6D0CFE0;
    id v53 = v8;
    objc_msgSend(v12, "drawWithBox:size:colorSpace:options:completion:", 1, 0, v48, v52, v51, v33);

    v49 = v53;
  }
  else
  {
    v50 = _log_2();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[QLPreviewThumbnailGenerator _drawRemotePDFPage:atIndex:completionHandler:]();
    }

    v49 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3A738] code:0 userInfo:0];
    (*((void (**)(id, void, void *, double, double))v8 + 2))(v8, 0, v49, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
}

void __76__QLPreviewThumbnailGenerator__drawRemotePDFPage_atIndex_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v5;
  if (a3)
  {
    uint64_t v9 = [v5 createImageWithData:a3];
    double v10 = (double)(unint64_t)[v13 width];
    v11.n128_f64[0] = (double)(unint64_t)[v13 height];
    v12.n128_f64[0] = v10;
    (*(void (**)(uint64_t, uint64_t, void, __n128, __n128))(v8 + 16))(v8, v9, 0, v12, v11);
  }
  else
  {
    v6.n128_u64[0] = *MEMORY[0x1E4F1DB30];
    v7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB30] + 8);
    (*(void (**)(uint64_t, void, void, __n128, __n128))(v8 + 16))(v8, 0, 0, v6, v7);
  }
}

- (void)_generateThumbnailFromExtensionAndReplyWith:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(QLTGeneratorThumbnailRequest *)self->_request request];
  __n128 v6 = _log_2();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = _log_2();
  uint64_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    double v10 = [v5 fileURL];
    __n128 v11 = [v5 uuid];
    *(_DWORD *)buf = 138412546;
    double v23 = v10;
    __int16 v24 = 2112;
    double v25 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DDC5E000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "quicklook.thumbnail.extensionGeneration", "fileURL : %@ UUID: %@", buf, 0x16u);
  }
  __n128 v12 = (QLThumbnailExtensionGenerator *)objc_opt_new();
  extensionGenerator = self->_extensionGenerator;
  self->_extensionGenerator = v12;

  double v14 = self->_extensionGenerator;
  request = self->_request;
  item = self->_item;
  BOOL wantsLowQuality = self->_wantsLowQuality;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__QLPreviewThumbnailGenerator__generateThumbnailFromExtensionAndReplyWith___block_invoke;
  v19[3] = &unk_1E6D0D008;
  void v19[4] = self;
  id v20 = v4;
  os_signpost_id_t v21 = v7;
  id v18 = v4;
  [(QLThumbnailExtensionGenerator *)v14 generateThumbnailWithThumbnailRequest:request item:item flavor:0 wantsLowQuality:wantsLowQuality generationData:0 completionHandler:v19];
}

void __75__QLPreviewThumbnailGenerator__generateThumbnailFromExtensionAndReplyWith___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    objc_msgSend(*(id *)(a1 + 32), "setResultIsLowQuality:", objc_msgSend(v6, "isLowQuality"));
    [*(id *)(a1 + 32) setGeneratedProperties:v6];
    [*(id *)(a1 + 32) _replyWithImages:v5 error:0 completionHandler:*(void *)(a1 + 40)];
    os_signpost_id_t v7 = _log_2();
    uint64_t v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 48);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)__n128 v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDC5E000, v8, OS_SIGNPOST_INTERVAL_END, v9, "quicklook.thumbnail.extensionGeneration", "", v12, 2u);
    }
  }
  else
  {
    double v10 = *(void **)(a1 + 32);
    __n128 v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3A738] code:0 userInfo:0];
    [v10 _replyWithImages:0 error:v11 completionHandler:*(void *)(a1 + 40)];
  }
}

- (QLPlatformImage)thumbnailImage
{
  uint64_t v2 = [(QLPreviewThumbnailGenerator *)self thumbnailImages];
  uint64_t v3 = [v2 firstObject];

  return (QLPlatformImage *)v3;
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
}

- (int)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int)a3
{
  self->_flavor = a3;
}

- (BOOL)resultIsLowQuality
{
  return self->_resultIsLowQuality;
}

- (void)setResultIsLowQuality:(BOOL)a3
{
  self->_resultIsLowQuality = a3;
}

- (BOOL)wantsLowQuality
{
  return self->_wantsLowQuality;
}

- (void)setWantsLowQuality:(BOOL)a3
{
  self->_BOOL wantsLowQuality = a3;
}

- (QLThumbnailMetadata)generatedProperties
{
  return (QLThumbnailMetadata *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGeneratedProperties:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (QLTGeneratorThumbnailRequest)request
{
  return (QLTGeneratorThumbnailRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSArray)thumbnailImages
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setThumbnailImages:(id)a3
{
}

- (NSString)extensionBadge
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExtensionBadge:(id)a3
{
}

- (CGRect)contentRect
{
  objc_copyStruct(v6, &self->_contentRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_contentRect, &v3, 32, 1, 0);
}

- (BOOL)resultHasIconModeApplied
{
  return self->_resultHasIconModeApplied;
}

- (void)setResultHasIconModeApplied:(BOOL)a3
{
  self->_resultHasIconModeApplied = a3;
}

- (unint64_t)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(unint64_t)a3
{
  self->_sandboxExtension = a3;
}

- (QLThumbnailItem)item
{
  return (QLThumbnailItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItem:(id)a3
{
}

- (QLThumbnailExtensionGenerator)extensionGenerator
{
  return (QLThumbnailExtensionGenerator *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExtensionGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionGenerator, 0);
  objc_storeStrong((id *)&self->_extensionBadge, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
  objc_storeStrong((id *)&self->generatedProperties, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (void)generateIconDataFromThumbnailData:(os_log_t)log inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Could not create image from data passed to generateIconDataFromThumbnailData", v1, 2u);
}

+ (void)generateIconDataFromThumbnailData:(os_log_t)log inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Could not create a new context to draw the icon in", v1, 2u);
}

- (void)_createThumbnailForPDF:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v5 = [*a1 urlWrapper];
  OUTLINED_FUNCTION_4();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DDC5E000, a3, OS_LOG_TYPE_ERROR, "_createThumbnailForPDF failed : cannot load data from %@, error: %@", v6, 0x16u);
}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "_createThumbnailForPDF failed : could not create PDF document proxy, error: %@", v2, v3, v4, v5, v6);
}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "_createThumbnailForPDF failed : could not draw PDF page (error: %@)", v2, v3, v4, v5, v6);
}

- (void)_drawRemotePDFPage:atIndex:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "_createThumbnailForPDF failed : could not get page at index %ld", v2, v3, v4, v5, v6);
}

@end