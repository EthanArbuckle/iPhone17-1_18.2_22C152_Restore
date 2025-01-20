@interface TUIEmojiUpscaler
+ (CGColorSpace)sRGB;
+ (id)sharedInstance;
- (TUIEmojiUpscaler)init;
- (id)imageFromEmoji:(id)a3;
- (void)generateEmoji:(id)a3 completion:(id)a4;
- (void)generateEmoji:(id)a3 forImage:(id)a4 completion:(id)a5;
@end

@implementation TUIEmojiUpscaler

- (void).cxx_destruct
{
}

- (void)generateEmoji:(id)a3 forImage:(id)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v8 = a4;
  id v41 = a5;
  v9 = (void *)MEMORY[0x1E4F1E050];
  id v10 = v8;
  v11 = objc_msgSend(v9, "imageWithCGImage:", objc_msgSend(v10, "CGImage"));
  [v11 extent];
  v12 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v49 = *MEMORY[0x1E4F1E218];
  uint64_t v50 = MEMORY[0x1E4F1CC28];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  v14 = [v12 contextWithOptions:v13];

  [v11 extent];
  v40 = v14;
  v19 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:format:colorSpace:", v11, *MEMORY[0x1E4F1E2F0], objc_msgSend((id)objc_opt_class(), "sRGB"), v15, v16, v17, v18);

  uint64_t v20 = [(id)objc_opt_class() sRGB];
  DeviceRGB = (CGColorSpace *)v20;
  if (!v20) {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  uint64_t v22 = *MEMORY[0x1E4F24CA8];
  v51[0] = *MEMORY[0x1E4F24D20];
  v51[1] = v22;
  *(void *)buf = MEMORY[0x1E4F1CC08];
  uint64_t v53 = MEMORY[0x1E4F1CC38];
  v51[2] = *MEMORY[0x1E4F24CA0];
  uint64_t v54 = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v51 count:3];
  v24 = DeviceRGB;
  if (!DeviceRGB) {
    v24 = CGColorSpaceCreateDeviceRGB();
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (!v19
    || (unint64_t Width = CGImageGetWidth(v19),
        unint64_t Height = CGImageGetHeight(v19),
        CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Width, Height, 0x42475241u, v23, &pixelBufferOut)))
  {
    if (DeviceRGB) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  v39 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, v24, 0x2002u);
  v56.size.width = (double)Width;
  v56.size.height = (double)Height;
  v56.origin.x = 0.0;
  v56.origin.y = 0.0;
  CGContextDrawImage(v39, v56, v19);
  CGContextRelease(v39);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if (!DeviceRGB) {
LABEL_8:
  }
    CGColorSpaceRelease(v24);
LABEL_9:
  v27 = pixelBufferOut;

  if (!v20) {
    CGColorSpaceRelease(DeviceRGB);
  }

  CGImageRelease(v19);
  v28 = NSClassFromString(&cfstr_Madmlscalingre.isa);
  if (v28)
  {
    v29 = (void *)[[v28 alloc] initWithScaledImageWidth:320 scaledImageHeight:320];
    madService = self->_madService;
    v48 = v29;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke;
    v43[3] = &unk_1E5593D68;
    id v44 = v29;
    v32 = v41;
    id v46 = v41;
    id v45 = v10;
    id v33 = v29;
    v34 = madService;
    v35 = v42;
    [(MADService *)v34 performRequests:v31 onPixelBuffer:v27 withOrientation:1 andIdentifier:v42 completionHandler:v43];

    CVPixelBufferRelease(v27);
  }
  else
  {
    v36 = TUIEmojiUpscalerLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D47E000, v36, OS_LOG_TYPE_DEFAULT, "Failed to load MADMLScalingRequest class", buf, 2u);
    }

    v32 = v41;
    (*((void (**)(id, id, id, void))v41 + 2))(v41, v10, v10, 0);
    v35 = v42;
    if (v27) {
      CVPixelBufferRelease(v27);
    }
  }
}

void __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke_2;
  v6[3] = &unk_1E5593D40;
  id v7 = v4;
  id v8 = a1[4];
  id v10 = a1[6];
  id v9 = a1[5];
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) error];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) error];

    id v2 = (id)v4;
  }
  if (v2)
  {
    id v5 = TUIEmojiUpscalerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v2;
      _os_log_impl(&dword_18D47E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to upscale emoji, %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = [*(id *)(a1 + 40) results];
    id v7 = [v6 firstObject];

    uint64_t v8 = [v7 image];
    id v9 = [MEMORY[0x1E4FB1818] imageWithCGImage:v8];
    id v10 = UIImagePNGRepresentation(v9);
    v11 = [MEMORY[0x1E4FB1818] imageWithData:v10];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)generateEmoji:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TUIEmojiUpscalerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_18D47E000, v8, OS_LOG_TYPE_DEFAULT, "Generating emoji", v10, 2u);
  }

  id v9 = [(TUIEmojiUpscaler *)self imageFromEmoji:v6];
  if (v9) {
    [(TUIEmojiUpscaler *)self generateEmoji:v6 forImage:v9 completion:v7];
  }
}

- (id)imageFromEmoji:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  id v4 = a3;
  id v5 = [v3 systemFontOfSize:160.0];
  v17[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  [v4 sizeWithAttributes:v6];
  double v8 = v7;
  double v10 = v9;
  v11 = (CGColorSpace *)[(id)objc_opt_class() sRGB];
  int v12 = CGBitmapContextCreate(0, 0xA0uLL, 0xA0uLL, 8uLL, 0, v11, 1u);
  UIGraphicsPushContext(v12);
  CGContextScaleCTM(v12, 1.0, -1.0);
  CGContextTranslateCTM(v12, 0.0, -160.0);
  objc_msgSend(v4, "drawAtPoint:withAttributes:", v6, (160.0 - v8) * 0.5, (160.0 - v10) * 0.5);

  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  if (Image)
  {
    uint64_t v14 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
    CGImageRelease(Image);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (TUIEmojiUpscaler)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiUpscaler;
  id v2 = [(TUIEmojiUpscaler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F74680] service];
    madService = v2->_madService;
    v2->_madService = (MADService *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5899 != -1) {
    dispatch_once(&sharedInstance_onceToken_5899, &__block_literal_global_20);
  }
  id v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __34__TUIEmojiUpscaler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TUIEmojiUpscaler);
  uint64_t v1 = sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (CGColorSpace)sRGB
{
  if (sRGB_onceToken != -1) {
    dispatch_once(&sRGB_onceToken, &__block_literal_global_5901);
  }
  return (CGColorSpace *)sRGB_sRGB;
}

CGColorSpaceRef __24__TUIEmojiUpscaler_sRGB__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  sRGB_sRGB = (uint64_t)result;
  return result;
}

@end