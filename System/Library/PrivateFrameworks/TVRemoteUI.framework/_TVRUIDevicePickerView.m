@interface _TVRUIDevicePickerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (TVRUIDevicePickerViewController)viewController;
- (id)_initWithViewController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _TVRUIDevicePickerView

- (id)_initWithViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TVRUIDevicePickerView;
  v5 = [(_TVRUIDevicePickerView *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = [(_TVRUIDevicePickerView *)v6 layer];
    [v7 setAllowsGroupOpacity:0];

    v8 = [(_TVRUIDevicePickerView *)v6 layer];
    [v8 setAllowsGroupBlending:0];
  }
  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = [(_TVRUIDevicePickerView *)self viewController];
  int v9 = [v8 isDevicePickerShowing];

  if (v9)
  {
    v45.receiver = self;
    v45.super_class = (Class)_TVRUIDevicePickerView;
    BOOL v10 = -[_TVRUIDevicePickerView pointInside:withEvent:](&v45, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    v11 = [(_TVRUIDevicePickerView *)self viewController];
    v12 = [v11 muteButton];
    [v12 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v21 = [(_TVRUIDevicePickerView *)self viewController];
    v22 = [v21 deviceTitleView];
    [v22 frame];
    v59.origin.double x = v23;
    v59.origin.double y = v24;
    v59.size.CGFloat width = v25;
    v59.size.CGFloat height = v26;
    v53.origin.double x = v14;
    v53.origin.double y = v16;
    v53.size.CGFloat width = v18;
    v53.size.CGFloat height = v20;
    CGRect v54 = CGRectUnion(v53, v59);
    CGFloat v27 = v54.origin.x;
    CGFloat v28 = v54.origin.y;
    CGFloat width = v54.size.width;
    CGFloat height = v54.size.height;

    v31 = [(_TVRUIDevicePickerView *)self viewController];
    v32 = [v31 powerButton];
    [v32 frame];
    v60.origin.double x = v33;
    v60.origin.double y = v34;
    v60.size.CGFloat width = v35;
    v60.size.CGFloat height = v36;
    v55.origin.double x = v27;
    v55.origin.double y = v28;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    CGRect v56 = CGRectUnion(v55, v60);
    CGFloat v37 = v56.origin.x;
    CGFloat v38 = v56.origin.y;
    CGFloat v39 = v56.size.width;
    CGFloat v40 = v56.size.height;

    v57.origin.double x = v37;
    v57.origin.double y = v38;
    v57.size.CGFloat width = v39;
    v57.size.CGFloat height = v40;
    v52.double x = x;
    v52.double y = y;
    if (CGRectContainsPoint(v57, v52))
    {
      v41 = _TVRUIDevicePickerLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v58.origin.double x = v37;
        v58.origin.double y = v38;
        v58.size.CGFloat width = v39;
        v58.size.CGFloat height = v40;
        v42 = NSStringFromCGRect(v58);
        v51.double x = x;
        v51.double y = y;
        v43 = NSStringFromCGPoint(v51);
        *(_DWORD *)buf = 138412546;
        v47 = v42;
        __int16 v48 = 2112;
        v49 = v43;
        _os_log_impl(&dword_227326000, v41, OS_LOG_TYPE_DEFAULT, "boundingRect: %@ point: %@", buf, 0x16u);
      }
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (TVRUIDevicePickerViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (TVRUIDevicePickerViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end