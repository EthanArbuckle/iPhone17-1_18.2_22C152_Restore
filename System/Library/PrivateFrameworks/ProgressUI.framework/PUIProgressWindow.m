@interface PUIProgressWindow
+ (BOOL)_usesPreBoardAppearance;
+ (id)_errorDescriptionForAppleLogoNotFound;
+ (id)_errorDescriptionForUnknownDeviceClass;
+ (id)_errorDescriptionForUnsupportedScreenClass;
+ (void)setUsesPreBoardAppearance;
- (BOOL)_currentDeviceShouldMuteErrors;
- (CALayer)layer;
- (CGColor)_copyBlackCGColorRef;
- (CGColor)_copyCGColorRefWithComponents:(const double *)a3;
- (CGColor)_copyWhiteCGColorRef;
- (CGImage)_createImageWithName:(const char *)a3 scale:(int)a4 displayHeight:(int)a5;
- (NSString)errorDescription;
- (PUIProgressWindow)init;
- (PUIProgressWindow)initWithForceInverted:(BOOL)a3;
- (PUIProgressWindow)initWithOptions:(unint64_t)a3 contextLevel:(float)a4 appearance:(int64_t)a5;
- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3;
- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 context:(id)a4;
- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 createContext:(BOOL)a4 contextLevel:(float)a5 appearance:(int64_t)a6;
- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 level:(float)a4;
- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 level:(float)a4 forceInverted:(BOOL)a5;
- (const)_appleTVProductSuffix;
- (const)_productSuffix;
- (id)_initWithOptions:(unint64_t)a3 contextLevel:(float)a4 appearance:(int64_t)a5 environment:(id)a6;
- (void)_appendErrorDescriptionWithString:(id)a3;
- (void)_collectDisplayInfo;
- (void)_createContext;
- (void)_createLayer;
- (void)_drawProgressLayerInContext:(CGContext *)a3;
- (void)_layoutScreen;
- (void)_unsupportedScreenClass;
- (void)_updateIOSurface;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)setProgressValue:(float)a3;
- (void)setStatusText:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation PUIProgressWindow

+ (void)setUsesPreBoardAppearance
{
  v2 = sem_open("puiprogresswindow.pba", 512, 256, 0);
  if (v2 == (sem_t *)-1)
  {
    v3 = __error();
    strerror(*v3);
    _DMLogFunc();
  }
  else
  {
    sem_close(v2);
    _DMLogFunc();
  }
}

+ (BOOL)_usesPreBoardAppearance
{
  v2 = sem_open("puiprogresswindow.pba", 0);
  v3 = v2;
  if (v2 != (sem_t *)-1) {
    sem_close(v2);
  }
  _DMLogFunc();
  return v3 != (sem_t *)-1;
}

- (PUIProgressWindow)init
{
  LODWORD(v2) = 1161527296;
  return [(PUIProgressWindow *)self initWithProgressBarVisibility:1 level:0 forceInverted:v2];
}

- (PUIProgressWindow)initWithForceInverted:(BOOL)a3
{
  LODWORD(v3) = 1161527296;
  return [(PUIProgressWindow *)self initWithProgressBarVisibility:1 level:a3 forceInverted:v3];
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3
{
  LODWORD(v3) = 1161527296;
  return [(PUIProgressWindow *)self initWithProgressBarVisibility:a3 level:0 forceInverted:v3];
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 level:(float)a4
{
  return -[PUIProgressWindow initWithProgressBarVisibility:level:forceInverted:](self, "initWithProgressBarVisibility:level:forceInverted:", a3, 0);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 context:(id)a4
{
  return [(PUIProgressWindow *)self initWithProgressBarVisibility:a3 createContext:0 contextLevel:0 appearance:0.0];
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 level:(float)a4 forceInverted:(BOOL)a5
{
  return -[PUIProgressWindow initWithProgressBarVisibility:createContext:contextLevel:appearance:](self, "initWithProgressBarVisibility:createContext:contextLevel:appearance:", a3, 1, a5);
}

- (PUIProgressWindow)initWithProgressBarVisibility:(BOOL)a3 createContext:(BOOL)a4 contextLevel:(float)a5 appearance:(int64_t)a6
{
  if (a4) {
    *(void *)&a3 = a3 | 4;
  }
  else {
    *(void *)&a3 = a3;
  }
  return -[PUIProgressWindow initWithOptions:contextLevel:appearance:](self, "initWithOptions:contextLevel:appearance:", a3, a6);
}

- (PUIProgressWindow)initWithOptions:(unint64_t)a3 contextLevel:(float)a4 appearance:(int64_t)a5
{
  v9 = objc_alloc_init(PUIEnvironment);
  *(float *)&double v10 = a4;
  v11 = [(PUIProgressWindow *)self _initWithOptions:a3 contextLevel:a5 appearance:v9 environment:v10];

  return v11;
}

- (id)_initWithOptions:(unint64_t)a3 contextLevel:(float)a4 appearance:(int64_t)a5 environment:(id)a6
{
  id v11 = a6;
  v12 = [NSNumber numberWithUnsignedInteger:a3];
  *(float *)&double v13 = a4;
  v14 = [NSNumber numberWithFloat:v13];
  v29 = [NSNumber numberWithInteger:a5];
  _DMLogFunc();

  v30.receiver = self;
  v30.super_class = (Class)PUIProgressWindow;
  v15 = [(PUIProgressWindow *)&v30 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a6);
    BYTE2(v16->_progressLayer) = a3 & 1;
    LOWORD(v16->_progressLayer) = a5 == 1;
    *(void *)&v16->_productType = [(PUIEnvironment *)v16->_environment productType];
    uint64_t v17 = [(PUIEnvironment *)v16->_environment deviceClass];
    v16->_screenClass = v17;
    v25 = [NSNumber numberWithInt:v17];
    _DMLogFunc();

    if (v16->_screenClass == -1)
    {
      v26 = objc_msgSend(NSNumber, "numberWithInt:", 0xFFFFFFFFLL, v25);
      _DMLogFunc();

      v18 = +[PUIProgressWindow _errorDescriptionForUnknownDeviceClass];
      [(PUIProgressWindow *)v16 _appendErrorDescriptionWithString:v18];
    }
    uint64_t v19 = [(PUIEnvironment *)v16->_environment mainScreenClass];
    *(_DWORD *)&v16->_isSecurityResearchDevice = v19;
    v27 = [NSNumber numberWithInt:v19];
    _DMLogFunc();

    uint64_t v20 = MGGetBoolAnswer();
    LOBYTE(v16->_displaySize.width) = v20;
    v28 = objc_msgSend(NSNumber, "numberWithBool:", v20, v27);
    _DMLogFunc();

    [(PUIProgressWindow *)v16 _collectDisplayInfo];
    if ((a3 & 4) == 0)
    {
      v16->_weCreatedTheContext = 0;
      context = v16->_context;
      v16->_context = 0;

LABEL_8:
      [(PUIProgressWindow *)v16 _createLayer];
      goto LABEL_9;
    }
    [(PUIProgressWindow *)v16 _createContext];
    v23 = v16->_context;
    if (v23)
    {
      *(float *)&double v22 = a4;
      [(CAContext *)v23 setLevel:v22];
      goto LABEL_8;
    }
  }
LABEL_9:

  return v16;
}

- (BOOL)_currentDeviceShouldMuteErrors
{
  return self->_screenClass == 7;
}

- (void)_appendErrorDescriptionWithString:(id)a3
{
  id v9 = a3;
  if (![(PUIProgressWindow *)self _currentDeviceShouldMuteErrors])
  {
    layer = self->_layer;
    if (layer)
    {
      v5 = [(CALayer *)layer stringByAppendingString:@", "];
    }
    else
    {
      v5 = (CALayer *)&stru_26C6B1588;
    }
    v6 = self->_layer;
    self->_layer = v5;

    v7 = [(CALayer *)self->_layer stringByAppendingString:v9];
    v8 = self->_layer;
    self->_layer = v7;
  }
}

+ (id)_errorDescriptionForUnknownDeviceClass
{
  return @"unknown device class";
}

+ (id)_errorDescriptionForUnsupportedScreenClass
{
  return @"unsupported screen class";
}

+ (id)_errorDescriptionForAppleLogoNotFound
{
  return @"no apple logo found";
}

- (void)_unsupportedScreenClass
{
  double v3 = [NSNumber numberWithInt:*(unsigned int *)&self->_isSecurityResearchDevice];
  _DMLogFunc();

  id v4 = +[PUIProgressWindow _errorDescriptionForUnsupportedScreenClass];
  [(PUIProgressWindow *)self _appendErrorDescriptionWithString:v4];
}

- (void)dealloc
{
  if (*(void *)&self->_currentProgress)
  {
    double v3 = +[PUIFramebufferSizeChangeNotifier sharedInstance];
    [v3 removeListener:*(void *)&self->_currentProgress];
  }
  if (self->_weCreatedTheContext) {
    [(CAContext *)self->_context invalidate];
  }
  double progressXDelta = self->_progressXDelta;
  if (progressXDelta != 0.0) {
    CFRelease(*(CFTypeRef *)&progressXDelta);
  }
  [(NSString *)self->_errorDescription setContents:0];
  ioSurfaceLayer = self->_ioSurfaceLayer;
  if (ioSurfaceLayer) {
    CFRelease(ioSurfaceLayer);
  }
  [(CATextLayer *)self->_statusTextLayer setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)PUIProgressWindow;
  [(PUIProgressWindow *)&v6 dealloc];
}

- (void)_collectDisplayInfo
{
  if (self->_screenClass == 4)
  {
    *(_DWORD *)(&self->_renderWithIOSurface + 3) = 0;
    LOBYTE(self->_framebufferListenerToken) = 0;
    double v3 = [MEMORY[0x263F15778] mainDisplay];
    id v4 = v3;
    if (!v3 || ([v3 bounds], v5 == 0.0) || (objc_msgSend(v4, "bounds"), v6 == 0.0))
    {
      _DMLogFunc();
      *(_OWORD *)&self->_displaySize.height = xmmword_2160E67E0;
      *(_OWORD *)&self->_framebufferSize.height = *(_OWORD *)&self->_displaySize.height;
    }
    else
    {
      [v4 bounds];
      self->_framebufferSize.height = v7;
      self->_layerPositioningSize.width = v8;
      p_height = &self->_displaySize.height;
      if (v7 > 1920.0)
      {
        *(_OWORD *)p_height = xmmword_2160E67E0;
        float v10 = v7 / 1920.0;
LABEL_15:
        *(float *)&self->_sideways = v10;
        objc_initWeak(&valuePtr, self);
        v21 = +[PUIFramebufferSizeChangeNotifier sharedInstance];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __40__PUIProgressWindow__collectDisplayInfo__block_invoke;
        v54[3] = &unk_264265ED0;
        objc_copyWeak(&v55, &valuePtr);
        uint64_t v22 = [v21 addListener:v54];
        v23 = *(void **)&self->_currentProgress;
        *(void *)&self->_currentProgress = v22;

        objc_destroyWeak(&v55);
        objc_destroyWeak(&valuePtr);

        float v24 = 0.0;
        goto LABEL_45;
      }
      *(_OWORD *)p_height = *(_OWORD *)&self->_framebufferSize.height;
    }
    float v10 = 1.0;
    goto LABEL_15;
  }
  LODWORD(valuePtr) = 0;
  id v11 = [(PUIEnvironment *)self->_environment mainScreenScale];
  v12 = v11;
  if (v11)
  {
    [v11 floatValue];
    *(_DWORD *)&self->_sideways = v13;
  }
  CFNumberRef v14 = (const __CFNumber *)MGCopyAnswer();
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFNumberGetValue(v14, kCFNumberFloat32Type, &valuePtr);
    *(_DWORD *)(&self->_renderWithIOSurface + 3) = valuePtr;
    CFRelease(v15);
  }
  v16 = [MEMORY[0x263F15778] mainDisplay];
  [v16 bounds];
  self->_framebufferSize.height = v17;
  self->_layerPositioningSize.width = v18;

  CFNumberRef v19 = (const __CFNumber *)MGCopyAnswer();
  if (v19)
  {
    CFNumberRef v20 = v19;
    CFNumberGetValue(v19, kCFNumberFloat32Type, &valuePtr);
    self->_displaySize.height = *(float *)&valuePtr;
    CFRelease(v20);
  }
  else
  {
    self->_displaySize.height = self->_framebufferSize.height;
  }
  CFNumberRef v25 = (const __CFNumber *)MGCopyAnswer();
  if (v25)
  {
    CFNumberRef v26 = v25;
    CFNumberGetValue(v25, kCFNumberFloat32Type, &valuePtr);
    self->_framebufferSize.width = *(float *)&valuePtr;
    CFRelease(v26);
  }
  else
  {
    self->_framebufferSize.width = self->_layerPositioningSize.width;
  }
  v27 = (void *)MGCopyAnswer();
  v28 = v27;
  if (v27)
  {
    [v27 floatValue];
    float v24 = v29;
    if (v29 != 0.0)
    {
      float v30 = v29 + -90.0;
      if ((float)(v24 + -90.0) < 0.0) {
        float v30 = -(float)(v24 + -90.0);
      }
      if (v30 >= 0.01)
      {
        float v34 = v24 + -180.0;
        if ((float)(v24 + -180.0) < 0.0) {
          float v34 = -(float)(v24 + -180.0);
        }
        if (v34 < 0.01)
        {
          float v35 = *(float *)(&self->_renderWithIOSurface + 3) + 3.14159265;
          *(float *)(&self->_renderWithIOSurface + 3) = v35;
          goto LABEL_37;
        }
        float v36 = v24 + -270.0;
        if ((float)(v24 + -270.0) < 0.0) {
          float v36 = -(float)(v24 + -270.0);
        }
        if (v36 >= 0.01) {
          goto LABEL_37;
        }
        double v31 = *(float *)(&self->_renderWithIOSurface + 3);
        double v32 = 1.57079633;
      }
      else
      {
        double v31 = *(float *)(&self->_renderWithIOSurface + 3);
        double v32 = 4.71238898;
      }
      float v33 = v31 + v32;
      *(float *)(&self->_renderWithIOSurface + 3) = v33;
      *(int8x16_t *)&self->_displaySize.height = vextq_s8(*(int8x16_t *)&self->_displaySize.height, *(int8x16_t *)&self->_displaySize.height, 8uLL);
    }
  }
  else
  {
    float v24 = 0.0;
  }
LABEL_37:
  double v37 = *(float *)(&self->_renderWithIOSurface + 3);
  double v38 = -(v37 + -1.57079633);
  if (v37 + -1.57079633 >= 0.0) {
    double v38 = v37 + -1.57079633;
  }
  if (v38 >= 0.01)
  {
    double v40 = v37 + -4.71238898;
    if (v40 < 0.0) {
      double v40 = -v40;
    }
    BOOL v39 = v40 < 0.01;
  }
  else
  {
    BOOL v39 = 1;
  }
  LOBYTE(self->_framebufferListenerToken) = v39;

LABEL_45:
  v53 = [NSNumber numberWithDouble:self->_displaySize.height];
  v41 = [NSNumber numberWithDouble:self->_framebufferSize.width];
  v42 = [NSNumber numberWithDouble:self->_framebufferSize.height];
  v43 = [NSNumber numberWithDouble:self->_layerPositioningSize.width];
  LODWORD(v44) = *(_DWORD *)&self->_sideways;
  v45 = [NSNumber numberWithFloat:v44];
  LODWORD(v46) = *(_DWORD *)(&self->_renderWithIOSurface + 3);
  v47 = [NSNumber numberWithFloat:v46];
  v48 = [NSNumber numberWithBool:LOBYTE(self->_framebufferListenerToken)];
  *(float *)&double v49 = v24;
  v52 = [NSNumber numberWithFloat:v49];
  v50 = v53;
  _DMLogFunc();

  if (MGGetSInt32Answer() == 1
    || !BYTE1(self->_progressLayer)
    && objc_msgSend((id)objc_opt_class(), "_usesPreBoardAppearance", v53, v41, v42, v43, v45, v47, v48, v52))
  {
    _DMLogFunc();
    BYTE1(self->_progressLayer) = 1;
  }
  if (LOBYTE(self->_progressLayer)) {
    BYTE1(self->_progressLayer) ^= 1u;
  }
  *(_OWORD *)&self->_layerPositioningSize.height = *(_OWORD *)&self->_framebufferSize.height;
  v51 = objc_msgSend(NSNumber, "numberWithBool:", BYTE1(self->_framebufferListenerToken), v50);
  _DMLogFunc();
}

void __40__PUIProgressWindow__collectDisplayInfo__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLayerForFramebufferSize:", a2, a3);
}

- (void)_createContext
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = *MEMORY[0x263EFFB40];
  id v9 = v3;
  if (*(float *)&self->_sideways == 2.0)
  {
    [v3 setObject:v4 forKey:*MEMORY[0x263F159F0]];
    [v9 setObject:v4 forKey:*MEMORY[0x263F159F8]];
    id v3 = v9;
  }
  [v3 setObject:v4 forKey:*MEMORY[0x263F159E8]];
  int v5 = 3;
  while (1)
  {
    double v6 = [MEMORY[0x263F15770] remoteContextWithOptions:v9];
    context = self->_context;
    self->_context = v6;

    CGFloat v8 = self->_context;
    if (v8) {
      break;
    }
    _DMLogFunc();
    sleep(2u);
    if (!--v5) {
      goto LABEL_8;
    }
  }
  [(CAContext *)v8 setSecure:1];
  self->_weCreatedTheContext = 1;
LABEL_8:
  if (!self->_context) {
    _DMLogFunc();
  }
}

- (CGColor)_copyCGColorRefWithComponents:(const double *)a3
{
  result = CGColorSpaceCreateDeviceRGB();
  if (result)
  {
    int v5 = result;
    double v6 = CGColorCreate(result, a3);
    CFRelease(v5);
    return v6;
  }
  return result;
}

- (CGColor)_copyWhiteCGColorRef
{
  return [(PUIProgressWindow *)self _copyCGColorRefWithComponents:&_copyWhiteCGColorRef_white];
}

- (CGColor)_copyBlackCGColorRef
{
  return [(PUIProgressWindow *)self _copyCGColorRefWithComponents:&_copyBlackCGColorRef_black];
}

- (void)_createLayer
{
  id v3 = [MEMORY[0x263F157E8] layer];
  [v3 setDisableUpdateMask:16];
  if (BYTE1(self->_progressLayer)) {
    uint64_t v4 = [(PUIProgressWindow *)self _copyWhiteCGColorRef];
  }
  else {
    uint64_t v4 = [(PUIProgressWindow *)self _copyBlackCGColorRef];
  }
  int v5 = v4;
  if (v4)
  {
    [v3 setBackgroundColor:v4];
    CFRelease(v5);
  }
  CGAffineTransformMakeRotation(&v112, (float)-*(float *)(&self->_renderWithIOSurface + 3));
  CGAffineTransform v111 = v112;
  [v3 setAffineTransform:&v111];
  objc_msgSend(v3, "setPosition:", self->_layerPositioningSize.height * 0.5, *(double *)&self->_displayScale * 0.5);
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, self->_displaySize.height, self->_framebufferSize.width);
  double v6 = NSNumber;
  [v3 position];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  CGFloat v8 = NSNumber;
  [v3 position];
  float v10 = [v8 numberWithDouble:v9];
  id v11 = NSNumber;
  [v3 bounds];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  int v13 = NSNumber;
  [v3 bounds];
  CFNumberRef v15 = [v13 numberWithDouble:v14];
  v16 = NSNumber;
  [v3 bounds];
  CGFloat v18 = [v16 numberWithDouble:v17];
  CFNumberRef v19 = NSNumber;
  [v3 bounds];
  v77 = [v19 numberWithDouble:v20];
  _DMLogFunc();

  objc_msgSend(v3, "setHidden:", 1, v7, v10, v12, v15, v18, v77);
  v21 = self + 1;
  objc_storeStrong((id *)&self[1].super.isa, v3);
  context = self->_context;
  if (context) {
    [(CAContext *)context setLayer:v3];
  }
  if (BYTE1(self->_framebufferListenerToken))
  {
    _IOSurfacePropertyDictionaryForRect(0.0, 0.0, self->_displaySize.height, self->_framebufferSize.width);
    CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    self->_ioSurfaceLayer = (CALayer *)IOSurfaceCreate(v23);
    float v24 = [MEMORY[0x263F157E8] layer];
    errorDescription = self->_errorDescription;
    self->_errorDescription = v24;

    [(NSString *)self->_errorDescription setAllowsDisplayCompositing:1];
    CGAffineTransformMakeRotation(&v110, (float)-*(float *)(&self->_renderWithIOSurface + 3));
    CFNumberRef v26 = self->_errorDescription;
    CGAffineTransform v109 = v110;
    [(NSString *)v26 setAffineTransform:&v109];
    -[NSString setFrame:](self->_errorDescription, "setFrame:", 0.0, 0.0, self->_framebufferSize.height, self->_layerPositioningSize.width);
    [(NSString *)self->_errorDescription setContents:self->_ioSurfaceLayer];
    [(NSString *)self->_errorDescription setHidden:1];
    [(CAContext *)self->_context setLayer:self->_errorDescription];
  }
  uint64_t v27 = 80;
  if (LOBYTE(self->_framebufferListenerToken)) {
    uint64_t v28 = 80;
  }
  else {
    uint64_t v28 = 72;
  }
  if (LOBYTE(self->_framebufferListenerToken)) {
    uint64_t v27 = 72;
  }
  double v29 = *(double *)((char *)&self->super.isa + v27);
  double v30 = *(double *)((char *)&self->super.isa + v28);
  if (v30 != self->_displaySize.height || v29 != self->_framebufferSize.width)
  {
    double v31 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v32 = *(double *)&v108;
    }
    else
    {
      long long v107 = 0u;
      long long v108 = 0u;
      long long v106 = 0u;
      double v32 = 0.0;
    }
    float v33 = [v31 numberWithDouble:v32];
    float v34 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v35 = *((double *)&v105 + 1);
    }
    else
    {
      long long v104 = 0u;
      long long v105 = 0u;
      long long v103 = 0u;
      double v35 = 0.0;
    }
    float v36 = [v34 numberWithDouble:v35];
    double v37 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v38 = *(double *)&v100;
    }
    else
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v100 = 0u;
      double v38 = 0.0;
    }
    BOOL v39 = [v37 numberWithDouble:v38];
    double v40 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v41 = *((double *)&v97 + 1);
    }
    else
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v97 = 0u;
      double v41 = 0.0;
    }
    v42 = [v40 numberWithDouble:v41];
    v43 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v44 = *(double *)&v95;
    }
    else
    {
      long long v95 = 0u;
      long long v96 = 0u;
      long long v94 = 0u;
      double v44 = 0.0;
    }
    v45 = [v43 numberWithDouble:v44];
    double v46 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v47 = *((double *)&v92 + 1);
    }
    else
    {
      long long v92 = 0u;
      long long v93 = 0u;
      long long v91 = 0u;
      double v47 = 0.0;
    }
    [v46 numberWithDouble:v47];
    v79 = v76 = v45;
    v72 = v39;
    v74 = v42;
    v68 = v33;
    v70 = v36;
    _DMLogFunc();

    memset(&v90, 0, sizeof(v90));
    CGAffineTransformMakeScale(&v90, v30 / self->_displaySize.height, v29 / self->_framebufferSize.width);
    Class isa = self[1].super.isa;
    if (isa)
    {
      [(objc_class *)isa affineTransform];
      Class v49 = v21->super.isa;
    }
    else
    {
      Class v49 = 0;
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v90;
    CGAffineTransformConcat(&v89, &t1, &t2);
    CGAffineTransform v86 = v89;
    [(objc_class *)v49 setAffineTransform:&v86];
    v50 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v51 = v85;
    }
    else
    {
      double v51 = 0.0;
    }
    v52 = objc_msgSend(v50, "numberWithDouble:", v51, v68, v70, v72, v74, v76, v79);
    v53 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v54 = v84;
    }
    else
    {
      double v54 = 0.0;
    }
    id v55 = [v53 numberWithDouble:v54];
    v56 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v57 = v83;
    }
    else
    {
      double v57 = 0.0;
    }
    v58 = [v56 numberWithDouble:v57];
    v59 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v60 = v82;
    }
    else
    {
      double v60 = 0.0;
    }
    v61 = [v59 numberWithDouble:v60];
    v62 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v63 = v81;
    }
    else
    {
      double v63 = 0.0;
    }
    v64 = [v62 numberWithDouble:v63];
    v65 = NSNumber;
    if (v21->super.isa)
    {
      [(objc_class *)v21->super.isa affineTransform];
      double v66 = v80;
    }
    else
    {
      double v66 = 0.0;
    }
    [v65 numberWithDouble:v66];
    v78 = v75 = v64;
    v71 = v58;
    v73 = v61;
    v67 = v52;
    v69 = v55;
    _DMLogFunc();
  }
  [(PUIProgressWindow *)self _layoutScreen];
}

- (void)_updateIOSurface
{
  IOSurfaceLock((IOSurfaceRef)self->_ioSurfaceLayer, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress((IOSurfaceRef)self->_ioSurfaceLayer);
  size_t Width = IOSurfaceGetWidth((IOSurfaceRef)self->_ioSurfaceLayer);
  unint64_t Height = IOSurfaceGetHeight((IOSurfaceRef)self->_ioSurfaceLayer);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow((IOSurfaceRef)self->_ioSurfaceLayer);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGFloat v8 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  if (v8)
  {
    CGContextTranslateCTM(v8, 0.0, (double)Height);
    CGContextScaleCTM(v8, 1.0, -1.0);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextSetBaseCTM();
    uint64_t v9 = [(objc_class *)self[1].super.isa isHidden];
    [(objc_class *)self[1].super.isa setHidden:0];
    [(objc_class *)self[1].super.isa renderInContext:v8];
    [(objc_class *)self[1].super.isa setHidden:v9];
    CGContextRelease(v8);
  }
  IOSurfaceUnlock((IOSurfaceRef)self->_ioSurfaceLayer, 0, 0);
  [(NSString *)self->_errorDescription setContents:0];
  [(NSString *)self->_errorDescription setContents:self->_ioSurfaceLayer];
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F158F8] begin];
  [(objc_class *)self[1].super.isa setHidden:!v3];
  [(NSString *)self->_errorDescription setHidden:!v3];
  [MEMORY[0x263F158F8] commit];
  _DMLogFunc();
}

- (void)setProgressValue:(float)a3
{
  *(float *)&self->_appleLogo = a3;
  [(CATextLayer *)self->_statusTextLayer setNeedsDisplay];
  if (BYTE1(self->_framebufferListenerToken))
  {
    [(PUIProgressWindow *)self _updateIOSurface];
  }
}

- (void)setStatusText:(id)a3
{
  id v14 = a3;
  if (v14 && !self->_ioSurface)
  {
    uint64_t v4 = (__IOSurface *)objc_alloc_init(MEMORY[0x263F158E8]);
    ioSurface = self->_ioSurface;
    self->_ioSurface = v4;

    [(__IOSurface *)self->_ioSurface setString:0];
    [(__IOSurface *)self->_ioSurface setFontSize:50.0];
    double height = self->_displaySize.height;
    double v7 = 1000.0;
    if (height + -200.0 <= 1000.0) {
      double v7 = height + -200.0;
    }
    -[__IOSurface setFrame:](self->_ioSurface, "setFrame:", (height - v7) * 0.5, self->_framebufferSize.width + -300.0, v7, 300.0);
    [(__IOSurface *)self->_ioSurface setWrapped:1];
    [(__IOSurface *)self->_ioSurface setAlignmentMode:@"center"];
    if (BYTE1(self->_progressLayer)) {
      CGFloat v8 = [(PUIProgressWindow *)self _copyBlackCGColorRef];
    }
    else {
      CGFloat v8 = [(PUIProgressWindow *)self _copyWhiteCGColorRef];
    }
    uint64_t v9 = v8;
    if (v8)
    {
      [(__IOSurface *)self->_ioSurface setForegroundColor:v8];
      CFRelease(v9);
    }
    [(objc_class *)self[1].super.isa addSublayer:self->_ioSurface];
  }
  CGAffineTransform v10 = self->_ioSurface;
  if (v10)
  {
    id v11 = [(__IOSurface *)v10 string];
    if (v11 == v14)
    {
    }
    else
    {
      v12 = [(__IOSurface *)self->_ioSurface string];
      char v13 = [v14 isEqualToString:v12];

      if ((v13 & 1) == 0)
      {
        [(__IOSurface *)self->_ioSurface setString:v14];
        if (BYTE1(self->_framebufferListenerToken)) {
          [(PUIProgressWindow *)self _updateIOSurface];
        }
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (const)_productSuffix
{
  result = 0;
  switch(self->_screenClass)
  {
    case 1:
    case 2:
      result = "iphone";
      break;
    case 3:
      result = "ipad";
      break;
    case 4:
      result = "appletv";
      break;
    case 6:
      int v4 = *(_DWORD *)&self->_isSecurityResearchDevice;
      if (v4 <= 25)
      {
        switch(v4)
        {
          case 13:
            result = "watch-compact";
            break;
          case 16:
            result = "watch-394h";
            break;
          case 17:
            result = "watch-448h";
            break;
          default:
LABEL_18:
            result = "watch-regular";
            break;
        }
      }
      else
      {
        switch(v4)
        {
          case 26:
            result = "watch-484h";
            break;
          case 27:
            result = "watch-430h";
            break;
          case 29:
            result = "watch-502h";
            break;
          case 34:
            result = "watch-446h";
            break;
          case 35:
            result = "watch-496h";
            break;
          default:
            goto LABEL_18;
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

- (const)_appleTVProductSuffix
{
  return "appletv";
}

- (void)_layoutScreen
{
  int v3 = 0;
  if (BYTE1(self->_progressLayer)) {
    int v4 = "apple-logo-black";
  }
  else {
    int v4 = "apple-logo";
  }
  double v5 = 0.0;
  double v6 = 0.0;
  switch(self->_screenClass)
  {
    case 1:
    case 2:
      int v7 = *(_DWORD *)&self->_isSecurityResearchDevice;
      switch(v7)
      {
        case 18:
          CGFloat v8 = "apple-logo-black-d3x";
          uint64_t v9 = "apple-logo-d3x";
          goto LABEL_7;
        case 19:
          v16 = "apple-logo-black-n84";
          if (BYTE1(self->_progressLayer))
          {
            double v17 = "apple-logo-black-1792-SRD";
          }
          else
          {
            v16 = "apple-logo-n84";
            double v17 = "apple-logo-1792-SRD";
          }
          if (LOBYTE(self->_displaySize.width)) {
            int v4 = v17;
          }
          else {
            int v4 = v16;
          }
          if (LOBYTE(self->_displaySize.width)) {
            double v5 = -38.0;
          }
          else {
            double v5 = 0.0;
          }
          int v3 = 1;
          goto LABEL_58;
        case 20:
        case 21:
        case 23:
        case 26:
        case 27:
        case 28:
        case 29:
        case 32:
        case 33:
        case 34:
        case 35:
          goto LABEL_36;
        case 22:
        case 25:
        case 30:
        case 31:
        case 36:
        case 37:
          goto LABEL_6;
        case 24:
          if (LOBYTE(self->_displaySize.width))
          {
            if (BYTE1(self->_progressLayer)) {
              int v4 = "apple-logo-black-2532-SRD";
            }
            else {
              int v4 = "apple-logo-2532-SRD";
            }
            int v3 = 1;
            double v5 = -54.0;
          }
          else
          {
LABEL_6:
            CGFloat v8 = "apple-logo-black-d5x";
            uint64_t v9 = "apple-logo-d5x";
LABEL_7:
            if (BYTE1(self->_progressLayer)) {
              int v4 = v8;
            }
            else {
              int v4 = v9;
            }
            int v3 = 1;
          }
          goto LABEL_58;
        default:
          if (v7 == -1) {
            goto LABEL_37;
          }
LABEL_36:
          if (v7 >= 18) {
            goto LABEL_37;
          }
          goto LABEL_38;
      }
    case 3:
    case 5:
      int v10 = *(_DWORD *)&self->_isSecurityResearchDevice;
      if (v10 == 11)
      {
        if (MGGetBoolAnswer())
        {
LABEL_31:
          int v3 = 0;
          if (BYTE1(self->_progressLayer)) {
            int v4 = "apple-logo-black-j320";
          }
          else {
            int v4 = "apple-logo-j320";
          }
          double v6 = 286.0;
          goto LABEL_58;
        }
        int v10 = *(_DWORD *)&self->_isSecurityResearchDevice;
LABEL_29:
        if (v10 == -1) {
          goto LABEL_40;
        }
        if (v10 == 32) {
          goto LABEL_31;
        }
        if (v10 >= 29) {
LABEL_40:
        }
          [(PUIProgressWindow *)self _unsupportedScreenClass];
        int v3 = 0;
        double v6 = 224.0;
        goto LABEL_58;
      }
      if (v10 != 33 && v10 != 20) {
        goto LABEL_29;
      }
      int v3 = 0;
      if (BYTE1(self->_progressLayer)) {
        int v4 = "apple-logo-black-j317";
      }
      else {
        int v4 = "apple-logo-j317";
      }
      double v6 = 254.0;
LABEL_58:
      CGFloat v18 = [(PUIProgressWindow *)self _createImageWithName:v4 scale:(int)*(float *)&self->_sideways displayHeight:(int)self->_framebufferSize.width];
      *(void *)&self->_double progressXDelta = v18;
      int screenClass = self->_screenClass;
      if ((screenClass - 1) < 2)
      {
        float v23 = *(float *)&self->_sideways;
        double height = self->_displaySize.height;
        double v25 = (height - (double)CGImageGetWidth(v18)) * 0.5;
        double width = self->_framebufferSize.width;
        self->_double progressYDelta = ceil(self->_displaySize.height * 0.192647059);
        if (v3)
        {
          double v22 = floor((width - (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)) * 0.5);
          double v27 = v5
              + v22
              + (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)
              + (float)(*(float *)&self->_sideways * -12.0);
        }
        else
        {
          if (width <= 1136.0)
          {
            if (width <= 960.0)
            {
              self->_progresssize_t Width = 592.0;
              double v22 = 364.0;
            }
            else
            {
              self->_progresssize_t Width = 680.0;
              double v22 = 452.0;
            }
            goto LABEL_70;
          }
          double v22 = floor((double)(int)v23 * -18.5)
              + floor((width - (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)) * 0.5);
          double v27 = v22
              + (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)
              + (float)(*(float *)&self->_sideways * 35.0);
        }
        self->_progresssize_t Width = ceil(v27);
LABEL_70:
        double v21 = ceil(v25);
        double v37 = (float)(*(float *)&self->_sideways * 4.0);
        self->_progressunint64_t Height = self->_displaySize.height + self->_progressYDelta * -2.0;
        *(double *)&self->_forceInverted = v37;
        goto LABEL_71;
      }
      if (screenClass == 4)
      {
        double v21 = ceil((self->_displaySize.height - (double)CGImageGetWidth(v18)) * 0.5);
        double v22 = ceil((self->_framebufferSize.width - (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta)) * 0.5);
        self->_double progressYDelta = ceil(self->_displaySize.height * 0.15625);
        size_t v28 = CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta);
        double v29 = self->_displaySize.height + self->_progressYDelta * -2.0;
        self->_progresssize_t Width = v22 + (double)v28 + ceil(self->_framebufferSize.width * 0.037037037);
        self->_progressunint64_t Height = v29;
        *(double *)&self->_forceInverted = (float)(*(float *)&self->_sideways * 4.0);
        double v30 = objc_msgSend(NSNumber, "numberWithDouble:");
        double v31 = [NSNumber numberWithDouble:self->_progressWidth];
        double v32 = [NSNumber numberWithDouble:self->_progressHeight];
        [NSNumber numberWithDouble:*(double *)&self->_forceInverted];
        Class v49 = v48 = v32;
        double v46 = v30;
        double v47 = v31;
        _DMLogFunc();
      }
      else if (screenClass == 6)
      {
        int v20 = *(_DWORD *)&self->_isSecurityResearchDevice;
        switch(v20)
        {
          case 26:
            double v21 = 147.0;
            double v22 = 173.0;
            break;
          case 27:
            double v21 = 131.0;
            double v22 = 153.0;
            break;
          case 28:
          case 30:
          case 31:
          case 32:
          case 33:
LABEL_88:
            _DMLogFunc();
            goto LABEL_89;
          case 29:
            double v21 = 155.0;
            double v22 = 190.0;
            break;
          case 34:
          case 35:
LABEL_89:
            double v22 = 0.0;
            double v21 = 0.0;
            break;
          default:
            double v21 = 99.0;
            double v22 = 119.0;
            switch(v20)
            {
              case 12:
                double v21 = 113.0;
                goto LABEL_91;
              case 13:
                goto LABEL_71;
              case 16:
                double v21 = 122.0;
LABEL_91:
                double v22 = 137.0;
                break;
              case 17:
                double v21 = 135.0;
                double v22 = 155.0;
                break;
              default:
                goto LABEL_88;
            }
            break;
        }
      }
      else
      {
        double v21 = ceil((self->_displaySize.height - (double)CGImageGetWidth(v18)) * 0.5);
        double v33 = self->_framebufferSize.width;
        size_t v34 = CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta);
        float64x2_t v35 = vcvtq_f64_f32(vmul_n_f32((float32x2_t)0x40800000436F0000, *(float *)&self->_sideways));
        *(float64x2_t *)&self->_progressunint64_t Height = v35;
        double v22 = ceil((v33 - (double)v34) * 0.5);
        double v36 = ceil((self->_displaySize.height - v35.f64[0]) * 0.5);
        v35.f64[0] = v6 + ceil(self->_framebufferSize.width * 0.5);
        self->_double progressYDelta = v36;
        self->_progresssize_t Width = v35.f64[0];
      }
LABEL_71:
      if (BYTE2(self->_progressLayer))
      {
        double v38 = (CATextLayer *)objc_alloc_init(MEMORY[0x263F157E8]);
        statusTextLayer = self->_statusTextLayer;
        self->_statusTextLayer = v38;

        if (self->_screenClass == 6)
        {
          progressunint64_t Height = self->_displaySize.height;
          progresssize_t Width = self->_framebufferSize.width * 0.5 - progressHeight * 0.5;
          v42 = self->_statusTextLayer;
          double progressYDelta = 0.0;
          double v44 = progressHeight;
        }
        else
        {
          double progressYDelta = self->_progressYDelta;
          progresssize_t Width = self->_progressWidth;
          progressunint64_t Height = self->_progressHeight;
          double v44 = *(double *)&self->_forceInverted;
          v42 = self->_statusTextLayer;
        }
        -[CATextLayer setFrame:](v42, "setFrame:", progressYDelta, progressWidth, progressHeight, v44, v46, v47, v48, v49);
        [(CATextLayer *)self->_statusTextLayer setDelegate:self];
        [(CATextLayer *)self->_statusTextLayer setNeedsDisplay];
        [(objc_class *)self[1].super.isa addSublayer:self->_statusTextLayer];
      }
      objc_msgSend(MEMORY[0x263F157E8], "layer", v46, v47, v48, v49);
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      [v50 setContents:*(void *)&self->_progressXDelta];
      double v45 = (double)CGImageGetWidth(*(CGImageRef *)&self->_progressXDelta);
      objc_msgSend(v50, "setFrame:", v21, v22, v45, (double)CGImageGetHeight(*(CGImageRef *)&self->_progressXDelta));
      [(objc_class *)self[1].super.isa addSublayer:v50];
      if (BYTE1(self->_framebufferListenerToken)) {
        [(PUIProgressWindow *)self _updateIOSurface];
      }

      return;
    case 6:
      unsigned int v12 = *(_DWORD *)&self->_isSecurityResearchDevice;
      BOOL v13 = v12 > 0x23;
      uint64_t v14 = (1 << v12) & 0xC2C033000;
      if (v13 || v14 == 0) {
LABEL_37:
      }
        [(PUIProgressWindow *)self _unsupportedScreenClass];
LABEL_38:
      int v3 = 0;
      goto LABEL_58;
    default:
      goto LABEL_58;
  }
}

- (void)_drawProgressLayerInContext:(CGContext *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_screenClass == 6)
  {
    double v5 = self->_displaySize.height * 0.5;
    unsigned int v6 = *(_DWORD *)&self->_isSecurityResearchDevice;
    double v7 = 5.5;
    BOOL v8 = v6 > 0x22;
    uint64_t v9 = (1 << v6) & 0x408012000;
    if (v8 || v9 == 0) {
      double v7 = 6.0;
    }
    double v11 = v5 - v7 * *(float *)&self->_sideways;
    CGContextSaveGState(a3);
    *(_OWORD *)components = xmmword_2160E67F8;
    long long v32 = unk_2160E6808;
    v30[0] = xmmword_2160E6818;
    v30[1] = unk_2160E6828;
    CGContextSetLineWidth(a3, *(float *)&self->_sideways);
    [(CATextLayer *)self->_statusTextLayer bounds];
    CGFloat v13 = v12 * 0.5;
    [(CATextLayer *)self->_statusTextLayer bounds];
    CGContextTranslateCTM(a3, v13, v14 * 0.5);
    CGContextRotateCTM(a3, 3.14159265);
    signed int v15 = llroundf(*(float *)&self->_appleLogo * 100.0);
    CGContextSetStrokeColor(a3, components);
    signed int v16 = 0;
    char v17 = 0;
    do
    {
      if (v16 > v15 && (v17 & 1) == 0)
      {
        CGContextSetStrokeColor(a3, (const CGFloat *)v30);
        char v17 = 1;
      }
      CGContextMoveToPoint(a3, 0.0, v11);
      CGContextAddLineToPoint(a3, 0.0, v5);
      CGContextStrokePath(a3);
      CGContextRotateCTM(a3, 0.0628318531);
      ++v16;
    }
    while (v16 != 100);
    CGContextRestoreGState(a3);
  }
  else
  {
    progressunint64_t Height = self->_progressHeight;
    double v18 = *(double *)&self->_forceInverted;
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.double width = progressHeight;
    v35.size.double height = v18;
    int v20 = CGPathCreateWithRoundedRect(v35, v18 * 0.5, v18 * 0.5, 0);
    double v21 = floor(self->_progressHeight * *(float *)&self->_appleLogo);
    if (*(float *)&self->_sideways == 1.0) {
      double v22 = v21;
    }
    else {
      double v22 = self->_progressHeight * *(float *)&self->_appleLogo;
    }
    CGContextSaveGState(a3);
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.double width = v22;
    v36.size.double height = v18;
    CGContextClipToRect(a3, v36);
    CGContextAddPath(a3, v20);
    if (BYTE1(self->_progressLayer))
    {
      CGFloat v23 = 0.0;
      CGFloat v24 = 0.0;
      CGFloat v25 = 0.0;
    }
    else
    {
      CGFloat v23 = 1.0;
      CGFloat v24 = 1.0;
      CGFloat v25 = 1.0;
    }
    CGContextSetRGBFillColor(a3, v23, v24, v25, 1.0);
    CGContextFillPath(a3);
    CGContextRestoreGState(a3);
    v37.size.double width = progressHeight - v22;
    v37.origin.y = 0.0;
    v37.origin.x = v22;
    v37.size.double height = v18;
    CGContextClipToRect(a3, v37);
    CGContextAddPath(a3, v20);
    if (BYTE1(self->_progressLayer))
    {
      CGFloat v26 = 0.2;
      CGFloat v27 = 0.0;
      CGFloat v28 = 0.0;
      CGFloat v29 = 0.0;
    }
    else
    {
      CGFloat v26 = 0.3;
      CGFloat v27 = 1.0;
      CGFloat v28 = 1.0;
      CGFloat v29 = 1.0;
    }
    CGContextSetRGBFillColor(a3, v27, v28, v29, v26);
    CGContextFillPath(a3);
    CGPathRelease(v20);
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_statusTextLayer == a3) {
    [(PUIProgressWindow *)self _drawProgressLayerInContext:a4];
  }
}

- (CGImage)_createImageWithName:(const char *)a3 scale:(int)a4 displayHeight:(int)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v7 = [(PUIProgressWindow *)self _productSuffix];
  if (v7) {
    BOOL v8 = strcmp(v7, [(PUIProgressWindow *)self _appleTVProductSuffix]) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 resourcePath];
  double v11 = (const char *)[v10 UTF8String];

  if (!v7) {
    goto LABEL_27;
  }
  if (v8) {
    snprintf(__str, 0x400uLL, "%s/%s@%d~%s.png");
  }
  else {
    snprintf(__str, 0x400uLL, "%s/%s@%dx~%s.png");
  }
  if (access(__str, 0))
  {
LABEL_27:
    if (v8) {
      snprintf(__str, 0x400uLL, "%s/%s@%d.png");
    }
    else {
      snprintf(__str, 0x400uLL, "%s/%s@%dx.png");
    }
    if (access(__str, 0))
    {
      snprintf(__str, 0x400uLL, "%s/%s~%s.png", v11, a3, v7);
      if (access(__str, 0))
      {
        _DMLogFunc();
        double v12 = +[PUIProgressWindow _errorDescriptionForAppleLogoNotFound];
        [(PUIProgressWindow *)self _appendErrorDescriptionWithString:v12];

LABEL_21:
        ImageAtIndex = 0;
        goto LABEL_24;
      }
    }
  }
  _DMLogFunc();
  size_t v13 = strlen(__str);
  CFURLRef v14 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)__str, v13, 0);
  if (!v14)
  {
    _DMLogFunc();
    goto LABEL_21;
  }
  CFURLRef v15 = v14;
  uint64_t v20 = *MEMORY[0x263F0F600];
  uint64_t v21 = *MEMORY[0x263EFFB40];
  signed int v16 = CGImageSourceCreateWithURL(v14, (CFDictionaryRef)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, __str));
  if (v16)
  {
    char v17 = v16;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
    if (!ImageAtIndex) {
      _DMLogFunc();
    }
    CFRelease(v17);
  }
  else
  {
    _DMLogFunc();
    ImageAtIndex = 0;
  }
  CFRelease(v15);
LABEL_24:

  return ImageAtIndex;
}

- (NSString)errorDescription
{
  return (NSString *)&self->_layer->super.isa;
}

- (CALayer)layer
{
  return (CALayer *)self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
  objc_storeStrong((id *)&self->_statusTextLayer, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end