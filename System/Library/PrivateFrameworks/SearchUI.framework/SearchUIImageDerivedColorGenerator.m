@interface SearchUIImageDerivedColorGenerator
+ (id)colorsForImageRef:(CGImage *)a3;
+ (void)fetchColorsForImage:(id)a3 withCompletionHandler:(id)a4;
- (SearchUIImage)searchUIImage;
- (void)generateUIColorsForSFImage:(id)a3 isDark:(BOOL)a4 completionHandler:(id)a5;
- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4;
- (void)setSearchUIImage:(id)a3;
@end

@implementation SearchUIImageDerivedColorGenerator

+ (id)colorsForImageRef:(CGImage *)a3
{
  CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  if ((double)Height <= 160.0) {
    double v5 = (double)Height;
  }
  else {
    double v5 = 160.0;
  }
  uint64_t v6 = (unint64_t)v5;
  v7 = (char *)malloc_type_malloc(vcvtd_n_u64_f64(v5, 2uLL), 0x8FBE2ADBuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(v7, 1uLL, (unint64_t)v5, 8uLL, 4uLL, DeviceRGB, 0x4001u);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = 1.0;
  v25.size.height = v5;
  CGContextDrawImage(v9, v25, a3);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceRGB);
  unint64_t v10 = 0;
  if ((unint64_t)v5)
  {
    v11 = v7 + 3;
    while (!*(v11 - 3) && !*(v11 - 2) && !*(v11 - 1) || !*v11)
    {
      ++v10;
      v11 += 4;
      if (v6 == v10)
      {
        unint64_t v10 = (unint64_t)v5;
        break;
      }
    }
    unint64_t v12 = v6 - 1;
    if (v6 - 1 >= 0)
    {
      v13 = &v7[4 * v6 - 2];
      while (!*(v13 - 2) && !*(v13 - 1) && !*v13 || !v13[1])
      {
        --v6;
        v13 -= 4;
        if (v6 <= 0) {
          goto LABEL_19;
        }
      }
      unint64_t v12 = v6 - 1;
    }
  }
  else
  {
LABEL_19:
    unint64_t v12 = -1;
  }
  v14 = objc_opt_new();
  if (v12 > v10)
  {
    unint64_t v16 = 0.25;
    double v15 = (double)(v12 - v10) * 0.25;
    unint64_t v20 = vcvtpd_u64_f64(v15);
    v21 = &v7[4 * v10 + 3];
    do
    {
      LOBYTE(v15) = *(v21 - 3);
      LOBYTE(v16) = *(v21 - 2);
      LOBYTE(v17) = *(v21 - 1);
      LOBYTE(v18) = *v21;
      objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v15 / 255.0, (double)v16 / 255.0, (double)v17 / 255.0, (double)v18 / 255.0));
      v10 += v20;
      v21 += 4 * v20;
    }
    while (v10 < v12);
  }
  v22 = &v7[4 * v12];
  LOBYTE(v15) = *v22;
  LOBYTE(v16) = v22[1];
  LOBYTE(v17) = v22[2];
  LOBYTE(v19) = v22[3];
  objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v15 / 255.0, (double)v16 / 255.0, (double)v17 / 255.0, (double)v19 / 255.0));
  free(v7);
  return v14;
}

+ (void)fetchColorsForImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fetchColorsForImage_withCompletionHandler__onceToken[0] != -1) {
    dispatch_once(fetchColorsForImage_withCompletionHandler__onceToken, block);
  }
  v8 = fetchColorsForImage_withCompletionHandler__queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E6E73740;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v6 = objc_claimAutoreleasedReturnValue();
  v1 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v4 = dispatch_queue_create(v1, v3);
  double v5 = (void *)fetchColorsForImage_withCompletionHandler__queue;
  fetchColorsForImage_withCompletionHandler__queue = (uint64_t)v4;
}

void __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v2 = [*(id *)(a1 + 32) hash];
  v3 = SearchUIGeneralLog();
  dispatch_queue_t v4 = v3;
  unint64_t v53 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E45B5000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "SearchUIImageDerivedColorFetchColors", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) ioSurface];
  uint64_t v55 = a1;
  if (v5) {
    objc_msgSend(MEMORY[0x1E4F1E050], "imageWithIOSurface:", v5, v2);
  }
  else {
  id v6 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:", objc_msgSend(*(id *)(a1 + 32), "CGImage", v2));
  }
  [v6 extent];
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_alloc(MEMORY[0x1E4F45890]);
  id v12 = (void *)[v11 initWithCIImage:v6 options:MEMORY[0x1E4F1CC08]];
  id v13 = objc_opt_new();
  [v13 setRevision:2];
  v61[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
  id v58 = 0;
  v52 = v12;
  char v15 = [v12 performRequests:v14 error:&v58];
  id v16 = v58;

  if (v16 || (v15 & 1) == 0)
  {
    unint64_t v17 = SearchUIGeneralLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2_cold_1((uint64_t)v16, v17);
    }
  }
  v50 = v16;
  v51 = v13;
  unint64_t v18 = [v13 results];
  unint64_t v19 = [v18 firstObject];

  v49 = v19;
  unint64_t v20 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:", objc_msgSend(v19, "pixelBuffer"));
  [v20 extent];
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v8 / v21, v10 / v22);
  CGAffineTransform v56 = buf;
  uint64_t v23 = [v20 imageByApplyingTransform:&v56];
  v24 = [MEMORY[0x1E4F1E040] colorThresholdFilter];
  v48 = (void *)v23;
  [v24 setInputImage:v23];
  LODWORD(v25) = 0.5;
  [v24 setThreshold:v25];
  uint64_t v26 = [v24 outputImage];
  v27 = [MEMORY[0x1E4F1E040] maskToAlphaFilter];
  v47 = (void *)v26;
  [v27 setInputImage:v26];
  v28 = [v27 outputImage];
  v29 = [MEMORY[0x1E4F1E040] sourceOutCompositingFilter];
  v54 = v6;
  [v29 setInputImage:v6];
  [v29 setBackgroundImage:v28];
  v30 = [v29 outputImage];
  v59[0] = @"inputWidth";
  v31 = [NSNumber numberWithDouble:v8];
  v59[1] = @"inputHeight";
  v60[0] = v31;
  v32 = [NSNumber numberWithDouble:v10];
  v60[1] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
  id v34 = [v30 imageByApplyingFilter:@"CISmartGradient" withInputParameters:v33];

  if (!v34) {
    id v34 = v30;
  }
  [v34 extent];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v41 = [MEMORY[0x1E4F1E018] context];
  v42 = (CGImage *)objc_msgSend(v41, "createCGImage:fromRect:", v34, v36, v38, 8.0, v40);

  v43 = [(id)objc_opt_class() colorsForImageRef:v42];
  if (v42) {
    CGImageRelease(v42);
  }
  v44 = SearchUIGeneralLog();
  v45 = v44;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    LOWORD(v56.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E45B5000, v45, OS_SIGNPOST_INTERVAL_END, spid, "SearchUIImageDerivedColorFetchColors", "", (uint8_t *)&v56, 2u);
  }

  (*(void (**)(void))(*(void *)(v55 + 40) + 16))();
}

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(SearchUIColorGenerator *)self sfColor];
  double v8 = [v7 image];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  double v9 = [v8 contactIdentifiers];
  if ([v9 count] != 1)
  {

LABEL_5:
    [(SearchUIImageDerivedColorGenerator *)self generateUIColorsForSFImage:v8 isDark:v4 completionHandler:v6];
    goto LABEL_6;
  }
  double v10 = +[SearchUIContactCache sharedCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__SearchUIImageDerivedColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v11[3] = &unk_1E6E73768;
  id v13 = v6;
  void v11[4] = self;
  id v12 = v8;
  BOOL v14 = v4;
  [v10 fetchContactsForIdentifiers:v9 completionHandler:v11];

LABEL_6:
}

void __79__SearchUIImageDerivedColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 firstObject];
  id v4 = [v3 contactImageBackgroundColors];

  if ([v4 count]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 32) generateUIColorsForSFImage:*(void *)(a1 + 40) isDark:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)generateUIColorsForSFImage:(id)a3 isDark:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke;
  v12[3] = &unk_1E6E726B8;
  id v13 = v8;
  BOOL v14 = self;
  BOOL v16 = a4;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  +[SearchUIUtilities dispatchMainIfNecessary:v12];
}

void __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2 = +[SearchUIImage imageWithSFImage:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setSfColor:0];
  [*(id *)(a1 + 40) setSearchUIImage:v2];
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  double v5 = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 setRequiresImageDataToLoad:1];
  }
  if (v2 && ([v2 isTemplate] & 1) == 0)
  {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6E726E0;
    double v7 = *(void **)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    id v9 = v7;
    [v2 loadImageWithScale:v6 isDarkStyle:v8 completionHandler:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [(id)objc_opt_class() fetchColorsForImage:v3 withCompletionHandler:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (SearchUIImage)searchUIImage
{
  return self->_searchUIImage;
}

- (void)setSearchUIImage:(id)a3
{
}

- (void).cxx_destruct
{
}

void __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Error performing VNGenerateObjectnessBasedSaliencyImageRequest in fetchColorsForImage: %@", (uint8_t *)&v2, 0xCu);
}

@end