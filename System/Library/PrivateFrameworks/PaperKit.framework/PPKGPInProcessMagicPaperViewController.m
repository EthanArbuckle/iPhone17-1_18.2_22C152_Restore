@interface PPKGPInProcessMagicPaperViewController
+ (__CVBuffer)_createPixelBufferFromUIImage:(id)a3 pixelFormat:(unsigned int)a4;
+ (id)_uiImageFromPixelBuffer:(__CVBuffer *)a3;
+ (id)decodeRecipeData:(id)a3;
+ (id)promptsFromRecipeData:(id)a3;
+ (void)preload;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)generateCaptionFromImage;
- (BOOL)isAnimating;
- (BOOL)isUpscaleRequestSupported;
- (BOOL)wasFirstResponderAtLeastOnce;
- (CGRect)magicViewFullFrame;
- (GPInProcessMagicPaperViewController)magicPaperVC;
- (GPRecipe)influxRecipe;
- (NSData)encodedRecipe;
- (NSUndoManager)discreteUndoManager;
- (PPKGPInProcessMagicPaperViewController)initWithTokenProvider:(id)a3;
- (PPKGPInProcessMagicPaperViewControllerDelegate)delegate;
- (PPKMagicGenerativePlaygroundTokenProvider)tokenProvider;
- (UIImage)sketchImage;
- (UIImage)sketchMask;
- (UIImage)sourceImage;
- (double)sketchComplexityMeasure;
- (double)sourceImageRatio;
- (id)_getOrCreateDrawOnImageRecipe;
- (id)_getOrCreateRecipe;
- (id)_titleElements;
- (id)concepts;
- (id)magicPaperViewControllerImageGenerationEvent:(id)a3;
- (id)promptElements;
- (id)suggestions;
- (int64_t)sanitizationCategory;
- (void)_finalizeDueToFirstResponderChange;
- (void)_handleFirstResponderDidChangeNotification:(id)a3;
- (void)_setDrawOnImageRecipe:(id)a3;
- (void)_setRecipe:(id)a3 withInvocation:(int64_t)a4;
- (void)_updateTelemetryWithImagesCount:(int64_t)a3 shapesCount:(int64_t)a4 signaturesCount:(int64_t)a5 strokesCount:(int64_t)a6 invocation:(int64_t)a7;
- (void)addConcepts:(id)a3;
- (void)addSuggestions:(id)a3;
- (void)beginRecipe;
- (void)commitRecipeWithImagesCount:(int64_t)a3 shapesCount:(int64_t)a4 signaturesCount:(int64_t)a5 strokesCount:(int64_t)a6 invocation:(int64_t)a7;
- (void)finishSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4;
- (void)magicPaperViewController:(id)a3 didGenerateImage:(id)a4;
- (void)magicPaperViewControllerDidCancel:(id)a3;
- (void)setConcepts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscreteUndoManager:(id)a3;
- (void)setEncodedRecipe:(id)a3 withInvocation:(int64_t)a4;
- (void)setGenerateCaptionFromImage:(BOOL)a3;
- (void)setInfluxRecipe:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setMagicPaperVC:(id)a3;
- (void)setPromptElements:(id)a3;
- (void)setSanitizationCategory:(int64_t)a3;
- (void)setSketchComplexityMeasure:(double)a3;
- (void)setSketchImage:(id)a3;
- (void)setSketchMask:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)setSourceImageRatio:(double)a3;
- (void)setState:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTokenProvider:(id)a3;
- (void)setWasFirstResponderAtLeastOnce:(BOOL)a3;
- (void)startSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4;
- (void)updateSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation PPKGPInProcessMagicPaperViewController

+ (void)preload
{
  if (preload_onceToken != -1) {
    dispatch_once(&preload_onceToken, &__block_literal_global_97);
  }
}

id __49__PPKGPInProcessMagicPaperViewController_preload__block_invoke()
{
  getGPAppleConnectTokenProviderClass();
  getGPInProcessMagicPaperViewControllerClass();
  return getGPRecipeClass();
}

- (PPKGPInProcessMagicPaperViewController)initWithTokenProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPKGPInProcessMagicPaperViewController;
  v5 = [(PPKGPInProcessMagicPaperViewController *)&v13 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = (NSUndoManager *)objc_alloc_init(MEMORY[0x263F08C50]);
    discreteUndoManager = v5->_discreteUndoManager;
    v5->_discreteUndoManager = v6;

    [(PPKGPInProcessMagicPaperViewController *)v5 setTokenProvider:v4];
    v8 = objc_msgSend(objc_alloc((Class)getGPInProcessMagicPaperViewControllerClass()), "initForMagicWandDrawingInFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v8 setDelegate:v5];
    [(PPKGPInProcessMagicPaperViewController *)v5 setMagicPaperVC:v8];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v5 selector:sel__handleFirstResponderDidChangeNotification_ name:*MEMORY[0x263F83E28] object:0];

    v10 = objc_alloc_init(PPKGPMagicPaperImageGenerationEvent);
    imageGenerationEvent = v5->_imageGenerationEvent;
    v5->_imageGenerationEvent = v10;
  }
  return v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PPKGPInProcessMagicPaperViewController;
  BOOL v3 = [(PPKGPInProcessMagicPaperViewController *)&v5 becomeFirstResponder];
  if (v3) {
    [(PPKGPInProcessMagicPaperViewController *)self setWasFirstResponderAtLeastOnce:1];
  }
  return v3;
}

- (id)_getOrCreateRecipe
{
  BOOL v3 = [(PPKGPInProcessMagicPaperViewController *)self influxRecipe];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_3:
    v6 = v5;
    goto LABEL_5;
  }
  v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  v6 = [v7 recipe];

  if (!v6)
  {
    id v5 = (id)[objc_alloc((Class)getGPRecipeClass()) initWithPromptElements:MEMORY[0x263EFFA68] sourceImage:0];
    goto LABEL_3;
  }
LABEL_5:

  return v6;
}

- (id)_getOrCreateDrawOnImageRecipe
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateRecipe];
  BOOL v3 = [v2 drawOnImageRecipe];
  if (!v3)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    id v4 = (void *)getGPDrawOnImageRecipeClass_softClass;
    uint64_t v11 = getGPDrawOnImageRecipeClass_softClass;
    if (!getGPDrawOnImageRecipeClass_softClass)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __getGPDrawOnImageRecipeClass_block_invoke;
      v7[3] = &unk_2640D3AD8;
      v7[4] = &v8;
      __getGPDrawOnImageRecipeClass_block_invoke((uint64_t)v7);
      id v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    BOOL v3 = (void *)[[v5 alloc] initWithBaseImage:0 sketchImage:0 sketchMask:0 sketchComplexityMeasure:1 drawOnImageAssignmentOptions:1.0];
  }

  return v3;
}

- (void)_setDrawOnImageRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateRecipe];
  [v5 setDrawOnImageRecipe:v4];

  [(PPKGPInProcessMagicPaperViewController *)self _setRecipe:v5 withInvocation:0];
}

- (void)_setRecipe:(id)a3 withInvocation:(int64_t)a4
{
  id v8 = a3;
  v6 = [(PPKGPInProcessMagicPaperViewController *)self influxRecipe];

  if (v6)
  {
    [(PPKGPInProcessMagicPaperViewController *)self setInfluxRecipe:v8];
  }
  else
  {
    v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
    [v7 setRecipe:v8];

    [(PPKGPInProcessMagicPaperViewController *)self _updateTelemetryWithImagesCount:0 shapesCount:0 signaturesCount:0 strokesCount:0 invocation:a4];
  }
}

- (void)beginRecipe
{
  BOOL v3 = [(PPKGPInProcessMagicPaperViewController *)self influxRecipe];
  if (!v3)
  {
    id v4 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateRecipe];
    [(PPKGPInProcessMagicPaperViewController *)self setInfluxRecipe:v4];

    BOOL v3 = 0;
  }
}

- (void)commitRecipeWithImagesCount:(int64_t)a3 shapesCount:(int64_t)a4 signaturesCount:(int64_t)a5 strokesCount:(int64_t)a6 invocation:(int64_t)a7
{
  uint64_t v13 = [(PPKGPInProcessMagicPaperViewController *)self influxRecipe];
  if (v13)
  {
    id v15 = (id)v13;
    v14 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
    [v14 setRecipe:v15];

    [(PPKGPInProcessMagicPaperViewController *)self _updateTelemetryWithImagesCount:a3 shapesCount:a4 signaturesCount:a5 strokesCount:a6 invocation:a7];
  }
}

- (void)_updateTelemetryWithImagesCount:(int64_t)a3 shapesCount:(int64_t)a4 signaturesCount:(int64_t)a5 strokesCount:(int64_t)a6 invocation:(int64_t)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v11 = [MEMORY[0x263F14B90] activePencil];
  -[PPKGPMagicPaperImageGenerationEvent setIsPencilPaired:](self->_imageGenerationEvent, "setIsPencilPaired:", [v11 isConnected]);

  v12 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = [(PPKGPInProcessMagicPaperViewController *)self _titleElements];
  if (v13) {
    [v12 addObjectsFromArray:v13];
  }
  v14 = [(PPKGPInProcessMagicPaperViewController *)self concepts];
  if (v14) {
    [v12 addObjectsFromArray:v14];
  }
  v29 = [(PPKGPInProcessMagicPaperViewController *)self suggestions];
  if (v29) {
    objc_msgSend(v12, "addObjectsFromArray:");
  }
  int64_t v24 = a3;
  int64_t v25 = a4;
  v27 = (void *)v13;
  v28 = self;
  id v15 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:0];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v16 = (void *)[v12 copy];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v15 setString:v20];
        uint64_t v21 = [v20 length];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __126__PPKGPInProcessMagicPaperViewController__updateTelemetryWithImagesCount_shapesCount_signaturesCount_strokesCount_invocation___block_invoke;
        v30[3] = &unk_2640D3ED8;
        v30[4] = &v35;
        objc_msgSend(v15, "enumerateTokensInRange:usingBlock:", 0, v21, v30);
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v17);
  }

  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setWordsCount:v36[3]];
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setHandwrittenWordsCount:0];
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setImagesCount:v24];
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setShapesCount:v25];
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setSignaturesCount:a5];
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setStrokesCount:a6];
  if (!a7)
  {
    v22 = PPKGPInProcessMagicPaperViewControllerLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PPKGPInProcessMagicPaperViewController _updateTelemetryWithImagesCount:shapesCount:signaturesCount:strokesCount:invocation:](v22);
    }
  }
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setInvocation:+[PPKGPMagicPaperImageGenerationEvent imageGenerationInvocationFromPPKInvocation:a7]];
  [(PPKGPMagicPaperImageGenerationEvent *)v28->_imageGenerationEvent setMode:+[PPKGPMagicPaperImageGenerationEvent imageGenerationModeFromPPKMode:0]];
  _Block_object_dispose(&v35, 8);
}

uint64_t __126__PPKGPInProcessMagicPaperViewController__updateTelemetryWithImagesCount_shapesCount_signaturesCount_strokesCount_invocation___block_invoke(uint64_t result)
{
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v35[4] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)PPKGPInProcessMagicPaperViewController;
  [(PPKGPInProcessMagicPaperViewController *)&v34 viewIsAppearing:a3];
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  id v5 = [v4 view];
  v6 = [v5 superview];
  v7 = [(PPKGPInProcessMagicPaperViewController *)self view];

  if (v6 != v7)
  {
    id v8 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
    v9 = [v8 view];

    uint64_t v10 = [(PPKGPInProcessMagicPaperViewController *)self view];
    [v10 addSubview:v9];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = (void *)MEMORY[0x263F08938];
    long long v32 = [v9 bottomAnchor];
    long long v33 = [(PPKGPInProcessMagicPaperViewController *)self view];
    long long v31 = [v33 bottomAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v28 = [v9 topAnchor];
    v29 = [(PPKGPInProcessMagicPaperViewController *)self view];
    v27 = [v29 topAnchor];
    int64_t v25 = [v28 constraintEqualToAnchor:v27];
    v35[1] = v25;
    int64_t v24 = [v9 leadingAnchor];
    uint64_t v11 = [(PPKGPInProcessMagicPaperViewController *)self view];
    v12 = [v11 leadingAnchor];
    uint64_t v13 = [v24 constraintEqualToAnchor:v12];
    v35[2] = v13;
    v14 = [v9 trailingAnchor];
    id v15 = [(PPKGPInProcessMagicPaperViewController *)self view];
    v16 = [v15 trailingAnchor];
    uint64_t v17 = [v14 constraintEqualToAnchor:v16];
    v35[3] = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
    [v26 activateConstraints:v18];

    v19 = [PPKGPAppleConnectAuthenticator alloc];
    v20 = [(PPKGPInProcessMagicPaperViewController *)self tokenProvider];
    uint64_t v21 = [(PPKGPAppleConnectAuthenticator *)v19 initWithTokenProvider:v20];

    v22 = (void *)[objc_alloc((Class)getGPAppleConnectTokenProviderClass()) initWithAuthenticatingProtocol:v21];
    v23 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
    [v23 setAppleConnectTokenProvider:v22];
  }
}

- (NSData)encodedRecipe
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  BOOL v3 = [v2 recipe];
  id v4 = [v3 additionalMetadata];

  return (NSData *)v4;
}

- (void)setEncodedRecipe:(id)a3 withInvocation:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateRecipe];
  [v7 setAdditionalMetadata:v6];

  [(PPKGPInProcessMagicPaperViewController *)self _setRecipe:v7 withInvocation:a4];
}

+ (__CVBuffer)_createPixelBufferFromUIImage:(id)a3 pixelFormat:(unsigned int)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 CIImage];
  if (v6
    || (id v22 = v5, [v22 CGImage])
    && (id v6 = objc_msgSend(objc_alloc(MEMORY[0x263F00650]), "initWithCGImage:", objc_msgSend(v22, "CGImage"))) != 0)
  {
    [v6 extent];
    if ((uint64_t)v7 != 512 || ([v6 extent], (uint64_t)v8 != 512))
    {
      v9 = [MEMORY[0x263F00640] lanczosScaleTransformFilter];
      [v9 setInputImage:v6];
      [v6 extent];
      double v11 = v10;
      [v6 extent];
      if (v11 >= v12) {
        double v13 = v11;
      }
      else {
        double v13 = v12;
      }
      double v14 = 512.0 / v13;
      *(float *)&double v14 = v14;
      [v9 setScale:v14];
      LODWORD(v15) = 1.0;
      [v9 setAspectRatio:v15];
      uint64_t v16 = [v9 outputImage];

      id v6 = (void *)v16;
    }
    CVPixelBufferRef v25 = 0;
    uint64_t v28 = *MEMORY[0x263F04130];
    uint64_t v26 = *MEMORY[0x263F0ED58];
    v27 = &unk_26C180288;
    uint64_t v17 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, 0);
    v29[0] = v17;
    CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    v19 = 0;
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x200uLL, 0x200uLL, a4, v18, &v25))
    {
      id v20 = objc_alloc_init(MEMORY[0x263F00628]);
      if (a4 == 1111970369) {
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      }
      else {
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
      }
      v23 = DeviceRGB;
      if (DeviceRGB)
      {
        objc_msgSend(v20, "render:toCVPixelBuffer:bounds:colorSpace:", v6, v25, DeviceRGB, 0.0, 0.0, 512.0, 512.0);
        CGColorSpaceRelease(v23);
        v19 = v25;
      }
      else
      {
        v19 = 0;
      }
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)_uiImageFromPixelBuffer:(__CVBuffer *)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v4 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a3];
    id v5 = [MEMORY[0x263F00628] contextWithOptions:0];
    double Width = (double)CVPixelBufferGetWidth(v3);
    uint64_t v7 = objc_msgSend(v5, "createCGImage:fromRect:", v4, 0.0, 0.0, Width, (double)CVPixelBufferGetHeight(v3));
    if (v7)
    {
      double v8 = (CGImage *)v7;
      BOOL v3 = [MEMORY[0x263F827E8] imageWithCGImage:v7];
      CGImageRelease(v8);
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (void)setState:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v5 = (void *)getGPMagicPaperStateClass_softClass;
  uint64_t v18 = getGPMagicPaperStateClass_softClass;
  if (!getGPMagicPaperStateClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getGPMagicPaperStateClass_block_invoke;
    v14[3] = &unk_2640D3AD8;
    v14[4] = &v15;
    __getGPMagicPaperStateClass_block_invoke((uint64_t)v14);
    id v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  id v7 = [v6 alloc];
  [v4 frame];
  double v12 = objc_msgSend(v7, "initWithFrame:isEditing:", objc_msgSend(v4, "isEditing"), v8, v9, v10, v11);
  double v13 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  [v13 setState:v12];
}

- (BOOL)isAnimating
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  char v3 = [v2 isAnimating];

  return v3;
}

- (void)setIsAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  [v4 setIsAnimating:v3];
}

- (UIImage)sourceImage
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  BOOL v3 = [v2 recipe];
  id v4 = [v3 drawOnImageRecipe];
  id v5 = +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", [v4 baseImage]);

  return (UIImage *)v5;
}

- (void)setSourceImage:(id)a3
{
  id v6 = a3;
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  if (v6) {
    id v5 = +[PPKGPInProcessMagicPaperViewController _createPixelBufferFromUIImage:v6 pixelFormat:1111970369];
  }
  else {
    id v5 = 0;
  }
  [v4 setBaseImage:v5];
  [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v4];
}

- (double)sourceImageRatio
{
  BOOL v3 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  id v4 = [v3 recipe];
  id v5 = [v4 drawOnImageRecipe];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1.0;
  }
  id v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  double v8 = [v7 recipe];
  double v9 = [v8 drawOnImageRecipe];
  [v9 baseImageRatio];
  double v11 = v10;

  return v11;
}

- (void)setSourceImageRatio:(double)a3
{
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  if (objc_opt_respondsToSelector())
  {
    [v5 setBaseImageRatio:a3];
    [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v5];
  }
}

- (UIImage)sketchImage
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  BOOL v3 = [v2 recipe];
  id v4 = [v3 drawOnImageRecipe];
  id v5 = +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", [v4 sketchImage]);

  return (UIImage *)v5;
}

- (void)setSketchImage:(id)a3
{
  id v4 = a3;
  id v6 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  id v5 = +[PPKGPInProcessMagicPaperViewController _createPixelBufferFromUIImage:v4 pixelFormat:1111970369];

  [v6 setSketchImage:v5];
  [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v6];
}

- (UIImage)sketchMask
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  BOOL v3 = [v2 recipe];
  id v4 = [v3 drawOnImageRecipe];
  id v5 = +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", [v4 sketchMask]);

  return (UIImage *)v5;
}

- (void)setSketchMask:(id)a3
{
  id v4 = a3;
  id v6 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  id v5 = +[PPKGPInProcessMagicPaperViewController _createPixelBufferFromUIImage:v4 pixelFormat:1278226488];

  [v6 setSketchMask:v5];
  [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v6];
}

- (double)sketchComplexityMeasure
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  BOOL v3 = [v2 recipe];
  id v4 = [v3 drawOnImageRecipe];
  [v4 sketchComplexityMeasure];
  double v6 = v5;

  return v6;
}

- (void)setSketchComplexityMeasure:(double)a3
{
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  [v5 setSketchComplexityMeasure:a3];
  [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v5];
}

- (BOOL)generateCaptionFromImage
{
  BOOL v3 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  id v4 = [v3 recipe];
  id v5 = [v4 drawOnImageRecipe];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  double v8 = [v7 recipe];
  double v9 = [v8 drawOnImageRecipe];
  char v10 = [v9 generateCaptionFromImage];

  return v10;
}

- (void)setGenerateCaptionFromImage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  if (objc_opt_respondsToSelector())
  {
    [v5 setGenerateCaptionFromImage:v3];
    [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v5];
  }
}

- (int64_t)sanitizationCategory
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  BOOL v3 = [v2 recipe];
  id v4 = [v3 drawOnImageRecipe];
  int64_t v5 = [v4 sanitizationCategory];

  return v5;
}

- (void)setSanitizationCategory:(int64_t)a3
{
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateDrawOnImageRecipe];
  [v5 setSanitizationCategory:a3];
  [(PPKGPInProcessMagicPaperViewController *)self _setDrawOnImageRecipe:v5];
}

- (CGRect)magicViewFullFrame
{
  BOOL v3 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
    [v5 magicViewFullFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)startSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  objc_msgSend(v7, "startSelectionWithPath:atPencilLocation:", a3, x, y);
}

- (void)updateSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  objc_msgSend(v7, "updateSelectionWithPath:atPencilLocation:", a3, x, y);
}

- (void)finishSelectionWithPath:(CGPath *)a3 pencilLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  objc_msgSend(v7, "finishSelectionWithPath:atPencilLocation:", a3, x, y);
}

- (id)promptElements
{
  v2 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateRecipe];
  BOOL v3 = [v2 promptElements];

  return v3;
}

- (void)setPromptElements:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self _getOrCreateRecipe];
  [v5 setPromptElements:v4];

  [(PPKGPInProcessMagicPaperViewController *)self _setRecipe:v5 withInvocation:0];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  double v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"isTitle == false"];
  id v7 = [v5 filteredArrayUsingPredicate:v6];
  id v9 = (id)[v7 mutableCopy];

  double v8 = (void *)[objc_alloc((Class)getGPPromptElementClass()) initWithText:v4];
  [v8 setIsTitle:1];
  [v9 addObject:v8];
  [(PPKGPInProcessMagicPaperViewController *)self setPromptElements:v9];
}

- (id)_titleElements
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"isTitle == true"];
  double v6 = [v4 filteredArrayUsingPredicate:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__PPKGPInProcessMagicPaperViewController__titleElements__block_invoke;
  v10[3] = &unk_2640D3F00;
  id v11 = v3;
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v10];

  double v8 = (void *)[v7 copy];
  return v8;
}

void __56__PPKGPInProcessMagicPaperViewController__titleElements__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 text];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 text];
    [v4 addObject:v5];
  }
}

- (id)suggestions
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__PPKGPInProcessMagicPaperViewController_suggestions__block_invoke;
  v7[3] = &unk_2640D3F00;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __53__PPKGPInProcessMagicPaperViewController_suggestions__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 needsSuggestableConceptsExtraction])
  {
    BOOL v3 = [v4 text];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)addSuggestions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  id v6 = (void *)[v5 mutableCopy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "length", (void)v14))
        {
          double v13 = (void *)[objc_alloc((Class)getGPPromptElementClass()) initWithText:v12];
          [v13 setNeedsSuggestableConceptsExtraction:1];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(PPKGPInProcessMagicPaperViewController *)self setPromptElements:v6];
}

- (void)setSuggestions:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"needsSuggestableConceptsExtraction == false"];
  id v7 = [v5 filteredArrayUsingPredicate:v6];
  uint64_t v8 = (void *)[v7 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "length", (void)v16))
        {
          long long v15 = (void *)[objc_alloc((Class)getGPPromptElementClass()) initWithText:v14];
          [v15 setNeedsSuggestableConceptsExtraction:1];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(PPKGPInProcessMagicPaperViewController *)self setPromptElements:v8];
}

- (id)concepts
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__PPKGPInProcessMagicPaperViewController_concepts__block_invoke;
  v7[3] = &unk_2640D3F00;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __50__PPKGPInProcessMagicPaperViewController_concepts__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 needsConceptsExtraction])
  {
    BOOL v3 = [v4 text];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)addConcepts:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  id v6 = (void *)[v5 mutableCopy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "length", (void)v14))
        {
          double v13 = (void *)[objc_alloc((Class)getGPPromptElementClass()) initWithText:v12];
          [v13 setNeedsConceptsExtraction:1];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(PPKGPInProcessMagicPaperViewController *)self setPromptElements:v6];
}

- (void)setConcepts:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self promptElements];
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"needsConceptsExtraction == false"];
  id v7 = [v5 filteredArrayUsingPredicate:v6];
  uint64_t v8 = (void *)[v7 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "length", (void)v16))
        {
          long long v15 = (void *)[objc_alloc((Class)getGPPromptElementClass()) initWithText:v14];
          [v15 setNeedsConceptsExtraction:1];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(PPKGPInProcessMagicPaperViewController *)self setPromptElements:v8];
}

- (BOOL)isUpscaleRequestSupported
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__PPKGPInProcessMagicPaperViewController_isUpscaleRequestSupported__block_invoke;
  block[3] = &unk_2640D3C00;
  block[4] = self;
  if (isUpscaleRequestSupported_onceToken != -1) {
    dispatch_once(&isUpscaleRequestSupported_onceToken, block);
  }
  return isUpscaleRequestSupported_isSupported;
}

void __67__PPKGPInProcessMagicPaperViewController_isUpscaleRequestSupported__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) magicPaperVC];
  isUpscaleRequestSupported_isSupported = objc_opt_respondsToSelector() & 1;
}

- (void)_handleFirstResponderDidChangeNotification:(id)a3
{
  id v19 = a3;
  if (![(PPKGPInProcessMagicPaperViewController *)self wasFirstResponderAtLeastOnce]) {
    goto LABEL_26;
  }
  if (![(PPKGPInProcessMagicPaperViewController *)self isViewLoaded]) {
    goto LABEL_26;
  }
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self view];
  id v5 = [v4 window];

  if (!v5) {
    goto LABEL_26;
  }
  id v6 = [v19 userInfo];
  id v7 = [v6 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  if (!v7) {
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  id v9 = [(PPKGPInProcessMagicPaperViewController *)self view];
  uint64_t v10 = [v9 window];
  uint64_t v11 = [(PPKGPInProcessMagicPaperViewController *)v8 _responderWindow];

  if (v10 != v11
    || ![(PPKGPInProcessMagicPaperViewController *)self isUpscaleRequestSupported])
  {
    goto LABEL_24;
  }
  uint64_t v12 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  double v13 = v12;
  if (!v12) {
    goto LABEL_23;
  }
  if (![v12 isViewLoaded]) {
    goto LABEL_23;
  }
  long long v14 = [v13 view];
  long long v15 = [v14 window];

  if (!v15) {
    goto LABEL_23;
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__finalizeDueToFirstResponderChange object:0];
  while (1)
  {
    if (v8 == self)
    {
      uint64_t v8 = self;
      goto LABEL_23;
    }
    long long v16 = [(PPKGPInProcessMagicPaperViewController *)self view];

    if (v8 == v16) {
      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v17 = [(PPKGPInProcessMagicPaperViewController *)v8 superview];
LABEL_18:
    long long v18 = (PPKGPInProcessMagicPaperViewController *)v17;

    uint64_t v8 = v18;
    if (!v18) {
      goto LABEL_22;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = [(PPKGPInProcessMagicPaperViewController *)v8 parentViewController];
    goto LABEL_18;
  }

LABEL_22:
  [(PPKGPInProcessMagicPaperViewController *)self performSelectorOnMainThread:sel__finalizeDueToFirstResponderChange withObject:0 waitUntilDone:0];
  uint64_t v8 = 0;
LABEL_23:

LABEL_24:
LABEL_25:

LABEL_26:
}

- (void)_finalizeDueToFirstResponderChange
{
  id v2 = [(PPKGPInProcessMagicPaperViewController *)self magicPaperVC];
  [v2 upscaleIfPossible];
}

+ (id)promptsFromRecipeData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)getGPGenerationRecipeDataClass()) initWithUnderlyingData:v3];

  id v5 = [v4 getRecipeInfo];
  id v6 = [v5 objectForKey:@"prompt"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 firstObject],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    id v9 = (void *)[v6 copy];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)decodeRecipeData:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = (void *)[objc_alloc((Class)getGPGenerationRecipeDataClass()) initWithUnderlyingData:v4];

  id v7 = [v6 getRecipeInfo];
  if (v7)
  {
    [v5 setObject:v7 forKeyedSubscript:@"inputDict"];
    uint64_t v8 = [v6 getDrawOnImageRecipe];
    id v9 = v8;
    if (v8)
    {
      if ([v8 baseImage])
      {
        +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", [v9 baseImage]);
        uint64_t v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = UIImagePNGRepresentation(v10);
        [v5 setObject:v11 forKeyedSubscript:@"sourceImage"];
      }
      if ([v9 sketchImage])
      {
        +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", [v9 sketchImage]);
        uint64_t v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
        double v13 = UIImagePNGRepresentation(v12);
        [v5 setObject:v13 forKeyedSubscript:@"sketchImage"];
      }
      if ([v9 sketchMask])
      {
        +[PPKGPInProcessMagicPaperViewController _uiImageFromPixelBuffer:](PPKGPInProcessMagicPaperViewController, "_uiImageFromPixelBuffer:", [v9 sketchMask]);
        long long v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
        long long v15 = UIImagePNGRepresentation(v14);
        [v5 setObject:v15 forKeyedSubscript:@"sketchMask"];
      }
    }
    id v16 = v5;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)magicPaperViewController:(id)a3 didGenerateImage:(id)a4
{
  id v6 = a4;
  id v5 = [(PPKGPInProcessMagicPaperViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 magicPaperViewController:self didGenerateImage:v6];
  }
}

- (void)magicPaperViewControllerDidCancel:(id)a3
{
  id v4 = [(PPKGPInProcessMagicPaperViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 magicPaperViewControllerDidCancel:self];
  }
}

- (id)magicPaperViewControllerImageGenerationEvent:(id)a3
{
  return self->_imageGenerationEvent;
}

- (PPKGPInProcessMagicPaperViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PPKGPInProcessMagicPaperViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GPInProcessMagicPaperViewController)magicPaperVC
{
  return self->_magicPaperVC;
}

- (void)setMagicPaperVC:(id)a3
{
}

- (PPKMagicGenerativePlaygroundTokenProvider)tokenProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tokenProvider);
  return (PPKMagicGenerativePlaygroundTokenProvider *)WeakRetained;
}

- (void)setTokenProvider:(id)a3
{
}

- (NSUndoManager)discreteUndoManager
{
  return self->_discreteUndoManager;
}

- (void)setDiscreteUndoManager:(id)a3
{
}

- (BOOL)wasFirstResponderAtLeastOnce
{
  return self->_wasFirstResponderAtLeastOnce;
}

- (void)setWasFirstResponderAtLeastOnce:(BOOL)a3
{
  self->_wasFirstResponderAtLeastOnce = a3;
}

- (GPRecipe)influxRecipe
{
  return self->_influxRecipe;
}

- (void)setInfluxRecipe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_influxRecipe, 0);
  objc_storeStrong((id *)&self->_discreteUndoManager, 0);
  objc_destroyWeak((id *)&self->_tokenProvider);
  objc_storeStrong((id *)&self->_magicPaperVC, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageGenerationEvent, 0);
}

- (void)_updateTelemetryWithImagesCount:(os_log_t)log shapesCount:signaturesCount:strokesCount:invocation:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_20C2D7000, log, OS_LOG_TYPE_ERROR, "invocation shouldn't be none", v1, 2u);
}

@end