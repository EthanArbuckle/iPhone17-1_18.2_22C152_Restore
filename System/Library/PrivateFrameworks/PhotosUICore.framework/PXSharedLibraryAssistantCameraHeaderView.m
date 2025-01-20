@interface PXSharedLibraryAssistantCameraHeaderView
- (PXSharedLibraryAssistantCameraHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PXSharedLibraryAssistantCameraHeaderView

- (void).cxx_destruct
{
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryAssistantCameraHeaderView;
  [(PXSharedLibraryAssistantCameraHeaderView *)&v9 layoutSubviews];
  if (!PLPhysicalDeviceIsIPad())
  {
    [(PXSharedLibraryAssistantCameraHeaderView *)self bounds];
    PXRectWithAspectRatioFittingRect();
  }
  [(PXSharedLibraryAssistantCameraHeaderView *)self bounds];
  double v4 = v3 + -100.0;
  double v5 = (v3 + -100.0) / self->_aspectRatio;
  [(PXSharedLibraryAssistantCameraHeaderView *)self bounds];
  double v6 = CGRectGetMaxY(v10) - v5;
  [(PXSharedLibraryAssistantCameraHeaderView *)self bounds];
  double MinY = CGRectGetMinY(v11);
  if (v6 >= MinY) {
    double v8 = v6;
  }
  else {
    double v8 = MinY;
  }
  -[UIView setFrame:](self->_cameraView, "setFrame:", 50.0, v8, v4, v5);
}

- (PXSharedLibraryAssistantCameraHeaderView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)PXSharedLibraryAssistantCameraHeaderView;
  double v3 = -[PXSharedLibraryAssistantCameraHeaderView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (PLPhysicalDeviceIsIPad())
    {
      double v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"SharedLibraryAssistantCameraPad");
      double v5 = 52.0;
    }
    else if (PLHasHomeButton())
    {
      double v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"SharedLibraryAssistantCameraLegacy");
      double v5 = 86.0;
    }
    else
    {
      double v4 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"SharedLibraryAssistantCamera");
      double v5 = 82.0;
    }
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v4 size];
    double v9 = v8;
    [v4 size];
    CGRect v11 = objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, v9, v10);
    [v11 addSubview:v6];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v13 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [v12 setBackgroundColor:v13];

    [v12 _setContinuousCornerRadius:2.0];
    [v11 addSubview:v12];
    id v14 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v15 = CEKFontOfSizeAndStyle();
    [v14 setFont:v15];

    v16 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_CameraRules_CameraBadge");
    [v14 setText:v16];

    v17 = [MEMORY[0x1E4FB1618] systemBlackColor];
    [v14 setTextColor:v17];

    [v11 addSubview:v14];
    [v14 sizeToFit];
    [v11 frame];
    double v19 = v18 * 0.5;
    [v14 frame];
    objc_msgSend(v14, "setCenter:", v19, v5 - v20);
    [v14 frame];
    CGRect v26 = CGRectInset(v25, -4.0, -2.0);
    objc_msgSend(v12, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
    [v11 bounds];
    uint64_t v21 = objc_msgSend(v11, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);

    cameraView = v3->_cameraView;
    v3->_cameraView = (UIView *)v21;

    [(UIView *)v3->_cameraView frame];
    PXSizeGetAspectRatio();
  }
  return 0;
}

@end