@interface PUPhotosSharingProgressOverlay
- (PUPhotosSharingProgressOverlay)initWithFrame:(CGRect)a3;
- (UIView)progressView;
- (UIWindow)cachedMainWindow;
- (id)_grayScaleImageFromImage:(id)a3;
- (id)_mainWindow;
- (id)_screenshotImage;
- (void)_installInStatusBarWindow;
- (void)_setupOverlayAnimated:(BOOL)a3;
- (void)_tearDownOverlayAnimated:(BOOL)a3;
- (void)addProgressView:(id)a3;
- (void)setCachedMainWindow:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setShowing:(BOOL)a3 animated:(BOOL)a4;
- (void)willRemoveSubview:(id)a3;
@end

@implementation PUPhotosSharingProgressOverlay

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedMainWindow);
  objc_storeStrong((id *)&self->_progressView, 0);
}

- (void)setCachedMainWindow:(id)a3
{
}

- (UIWindow)cachedMainWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedMainWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setProgressView:(id)a3
{
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)willRemoveSubview:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosSharingProgressOverlay *)self progressView];

  if (v5 == v4)
  {
    dispatch_time_t v6 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PUPhotosSharingProgressOverlay_willRemoveSubview___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__PUPhotosSharingProgressOverlay_willRemoveSubview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowing:0 animated:1];
}

- (void)setShowing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isShowing != a3)
  {
    self->_isShowing = a3;
    if (a3) {
      [(PUPhotosSharingProgressOverlay *)self _setupOverlayAnimated:a4];
    }
    else {
      [(PUPhotosSharingProgressOverlay *)self _tearDownOverlayAnimated:a4];
    }
  }
}

- (void)addProgressView:(id)a3
{
  if (a3)
  {
    id v15 = a3;
    [(PUPhotosSharingProgressOverlay *)self _installInStatusBarWindow];
    [v15 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    v10 = [(PUPhotosSharingProgressOverlay *)self window];
    [v10 bounds];
    double MaxY = CGRectGetMaxY(v17);
    v18.origin.x = 0.0;
    v18.origin.y = v5;
    v18.size.width = v7;
    v18.size.height = v9;
    double v12 = MaxY - CGRectGetHeight(v18);

    v13 = [(PUPhotosSharingProgressOverlay *)self window];
    [v13 bounds];
    double Width = CGRectGetWidth(v19);

    -[PUPhotosSharingProgressOverlay convertRect:fromView:](self, "convertRect:fromView:", 0, 0.0, v12, Width, v9);
    objc_msgSend(v15, "setFrame:");
    [v15 setAutoresizingMask:10];
    [(PUPhotosSharingProgressOverlay *)self addSubview:v15];
    [(PUPhotosSharingProgressOverlay *)self setProgressView:v15];
  }
}

- (void)_tearDownOverlayAnimated:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke_2;
  v3[3] = &unk_1E5F2CEE8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_animateWithDuration:animations:completion:", v4, v3, 0.2);
}

uint64_t __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 32) cachedMainWindow];
  [v2 endDisablingInterfaceAutorotation];
}

- (void)_setupOverlayAnimated:(BOOL)a3
{
  double v4 = [(PUPhotosSharingProgressOverlay *)self cachedMainWindow];
  [v4 beginDisablingInterfaceAutorotation];

  [(PUPhotosSharingProgressOverlay *)self _installInStatusBarWindow];
  CGFloat v5 = [(PUPhotosSharingProgressOverlay *)self _screenshotImage];
  if (v5)
  {
    double v6 = [(PUPhotosSharingProgressOverlay *)self _grayScaleImageFromImage:v5];
    if (v6)
    {
      CGFloat v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
      [(PUPhotosSharingProgressOverlay *)self addSubview:v7];
      [(PUPhotosSharingProgressOverlay *)self bounds];
      objc_msgSend(v7, "setFrame:");
      id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PUPhotosSharingProgressOverlay *)self bounds];
      double v9 = objc_msgSend(v8, "initWithFrame:");
      [(PUPhotosSharingProgressOverlay *)self addSubview:v9];
      v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
      [v9 setBackgroundColor:v10];
    }
  }
  v11 = [(PUPhotosSharingProgressOverlay *)self progressView];
  [(PUPhotosSharingProgressOverlay *)self bringSubviewToFront:v11];

  [(PUPhotosSharingProgressOverlay *)self setAlpha:0.0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PUPhotosSharingProgressOverlay__setupOverlayAnimated___block_invoke;
  v12[3] = &unk_1E5F2ED10;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_animateWithDuration:animations:", v12, 0.2);
}

uint64_t __56__PUPhotosSharingProgressOverlay__setupOverlayAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (id)_grayScaleImageFromImage:(id)a3
{
  if (a3)
  {
    CGFloat v3 = *MEMORY[0x1E4F1DAD8];
    CGFloat v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id v5 = a3;
    [v5 size];
    double v7 = v6;
    double v9 = v8;
    [v5 scale];
    CGFloat v11 = v7 * v10;
    CGFloat v12 = v9 * v10;
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v14 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v12, 8uLL, 0, DeviceGray, 0);
    id v15 = v5;
    v16 = (CGImage *)[v15 CGImage];

    v21.origin.x = v3;
    v21.origin.y = v4;
    v21.size.width = v11;
    v21.size.height = v12;
    CGContextDrawImage(v14, v21, v16);
    CGImageRef Image = CGBitmapContextCreateImage(v14);
    CGRect v18 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
    CGColorSpaceRelease(DeviceGray);
    CGContextRelease(v14);
    CFRelease(Image);
  }
  else
  {
    CGRect v18 = 0;
  }
  return v18;
}

- (id)_screenshotImage
{
  id v2 = (void *)_UICreateScreenUIImageWithRotation();
  return v2;
}

- (void)_installInStatusBarWindow
{
  [(PUPhotosSharingProgressOverlay *)self setAlpha:0.0];
  id v3 = [(PUPhotosSharingProgressOverlay *)self _mainWindow];
  [v3 addSubview:self];
}

- (id)_mainWindow
{
  CGFloat v4 = [(PUPhotosSharingProgressOverlay *)self cachedMainWindow];

  if (!v4)
  {
    id v5 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "px_firstKeyWindow");
    [(PUPhotosSharingProgressOverlay *)self setCachedMainWindow:v5];
    if (!v5)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PUPhotosSharingProgressOverlay.m" lineNumber:63 description:@"Main window could not be determined for PUPhotosSharingProgressOverlay"];
    }
  }
  return [(PUPhotosSharingProgressOverlay *)self cachedMainWindow];
}

- (PUPhotosSharingProgressOverlay)initWithFrame:(CGRect)a3
{
  CGFloat v4 = [(PUPhotosSharingProgressOverlay *)self _mainWindow];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v14.receiver = self;
  v14.super_class = (Class)PUPhotosSharingProgressOverlay;
  return -[PUPhotosSharingProgressOverlay initWithFrame:](&v14, sel_initWithFrame_, v6, v8, v10, v12);
}

@end