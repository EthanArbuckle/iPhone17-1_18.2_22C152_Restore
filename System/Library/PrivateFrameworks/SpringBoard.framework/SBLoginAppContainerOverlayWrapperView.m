@interface SBLoginAppContainerOverlayWrapperView
- (SBLockOverlayView)overlayView;
- (SBLoginAppContainerOverlayWrapperView)initWithFrame:(CGRect)a3 overlayView:(id)a4;
- (void)layoutSubviews;
@end

@implementation SBLoginAppContainerOverlayWrapperView

- (SBLoginAppContainerOverlayWrapperView)initWithFrame:(CGRect)a3 overlayView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBLoginAppContainerOverlayWrapperView;
  v11 = -[SBLoginAppContainerOverlayWrapperView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_overlayView = (id *)&v11->_overlayView;
    objc_storeStrong((id *)&v11->_overlayView, a4);
    v14 = [*p_overlayView underlayPropertiesFactory];
    v15 = [v14 propertiesWithDeviceDefaultGraphicsQuality];

    v16 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:-2];
    [v16 setBackdropVisible:1];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F430A8]) initWithSettings:v16];
    backdropView = v12->_backdropView;
    v12->_backdropView = (_UIBackdropView *)v17;

    v19 = [(_UIBackdropView *)v12->_backdropView inputSettings];
    [v15 blurRadius];
    objc_msgSend(v19, "setBlurRadius:");

    v20 = [(_UIBackdropView *)v12->_backdropView inputSettings];
    v21 = [v15 tintColor];
    [v20 setColorTint:v21];

    v22 = [(_UIBackdropView *)v12->_backdropView inputSettings];
    [v15 tintAlpha];
    objc_msgSend(v22, "setColorTintAlpha:");

    [(SBLoginAppContainerOverlayWrapperView *)v12 addSubview:v12->_backdropView];
    [(SBLoginAppContainerOverlayWrapperView *)v12 addSubview:*p_overlayView];
  }
  return v12;
}

- (void)layoutSubviews
{
  [(SBLoginAppContainerOverlayWrapperView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  overlayView = self->_overlayView;
  -[SBLockOverlayView setFrame:](overlayView, "setFrame:", v4, v6, v8, v10);
}

- (SBLockOverlayView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end