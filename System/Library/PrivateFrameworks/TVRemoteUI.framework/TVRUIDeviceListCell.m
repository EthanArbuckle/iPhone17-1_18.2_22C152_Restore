@interface TVRUIDeviceListCell
- (BOOL)showSeparator;
- (NSLayoutConstraint)deviceLabelTrailingContentViewConstraint;
- (NSLayoutConstraint)deviceLabelTrailingFindMyButtonConstraint;
- (TVRUIDevice)device;
- (TVRUIDeviceListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TVRUIStyleProvider)styleProvider;
- (UIAction)findButtonTapAction;
- (UIButton)findMyButton;
- (UIImageView)checkmarkImageView;
- (UIImageView)modelImageView;
- (UILabel)deviceLabel;
- (UIView)separator;
- (void)_configureViews;
- (void)_setupConstraints;
- (void)_updateConnectionStatus;
- (void)_updateFindMyButton;
- (void)prepareForReuse;
- (void)setCheckmarkImageView:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceLabel:(id)a3;
- (void)setDeviceLabelTrailingContentViewConstraint:(id)a3;
- (void)setDeviceLabelTrailingFindMyButtonConstraint:(id)a3;
- (void)setFindButtonTapAction:(id)a3;
- (void)setFindMyButton:(id)a3;
- (void)setModelImageView:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setShowSeparator:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation TVRUIDeviceListCell

- (TVRUIDeviceListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v29.receiver = self;
  v29.super_class = (Class)TVRUIDeviceListCell;
  v4 = [(TVRUIDeviceListCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIDeviceListCell *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x263F825C8] whiteColor];
    [(TVRUIDeviceListCell *)v4 setTintColor:v6];

    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = v7;

    v9 = [(TVRUIDeviceListCell *)v4 contentView];
    [v9 addSubview:v4->_checkmarkImageView];

    [(UIImageView *)v4->_checkmarkImageView setContentMode:4];
    [(UIImageView *)v4->_checkmarkImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    [(UIImageView *)v4->_checkmarkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    modelImageView = v4->_modelImageView;
    v4->_modelImageView = v10;

    v12 = [(TVRUIDeviceListCell *)v4 contentView];
    [v12 addSubview:v4->_modelImageView];

    [(UIImageView *)v4->_modelImageView setContentMode:4];
    [(UIImageView *)v4->_modelImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    [(UIImageView *)v4->_modelImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    deviceLabel = v4->_deviceLabel;
    v4->_deviceLabel = v13;

    v15 = [(TVRUIDeviceListCell *)v4 contentView];
    [v15 addSubview:v4->_deviceLabel];

    [(UILabel *)v4->_deviceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1132068864;
    [(UILabel *)v4->_deviceLabel setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1132068864;
    [(UILabel *)v4->_deviceLabel setContentHuggingPriority:0 forAxis:v17];
    [(UILabel *)v4->_deviceLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_deviceLabel setMinimumScaleFactor:0.4];
    v18 = [MEMORY[0x263F824F0] filledButtonConfiguration];
    [v18 setImagePlacement:2];
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"TVRemoteFindButtonTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    [v18 setTitle:v20];

    [v18 setCornerStyle:4];
    [v18 setButtonSize:1];
    [v18 setTitleLineBreakMode:4];
    v21 = [MEMORY[0x263F825C8] clearColor];
    [v18 setBaseBackgroundColor:v21];

    uint64_t v22 = [MEMORY[0x263F824E8] buttonWithConfiguration:v18 primaryAction:0];
    findMyButton = v4->_findMyButton;
    v4->_findMyButton = (UIButton *)v22;

    v24 = [(TVRUIDeviceListCell *)v4 contentView];
    [v24 addSubview:v4->_findMyButton];

    [(UIButton *)v4->_findMyButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_findMyButton setHidden:1];
    -[UIButton setHitTestInsets:](v4->_findMyButton, "setHitTestInsets:", -5.0, -10.0, -5.0, -10.0);
    v25 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separator = v4->_separator;
    v4->_separator = v25;

    v27 = [(TVRUIDeviceListCell *)v4 contentView];
    [v27 addSubview:v4->_separator];

    [(UIView *)v4->_separator setTranslatesAutoresizingMaskIntoConstraints:0];
    v4->_showSeparator = 1;
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIDeviceListCell;
  [(TVRUIDeviceListCell *)&v3 prepareForReuse];
  [(TVRUIDeviceListCell *)self setFindButtonTapAction:0];
}

- (void)setStyleProvider:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = (TVRUIStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    v6 = _TVRUIDevicePickerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Setting new styleProvider: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_styleProvider, a3);
    v7 = [(TVRUIDeviceListCell *)self findMyButton];
    v8 = [v7 configuration];

    v9 = [(TVRUIDeviceListCell *)self styleProvider];
    v10 = [v9 buttonBackgroundColor];
    [v8 setBaseBackgroundColor:v10];

    v11 = [(TVRUIDeviceListCell *)self styleProvider];
    v12 = [v11 tvRemoteImage];
    [v8 setImage:v12];

    [v8 setImagePadding:10.0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __40__TVRUIDeviceListCell_setStyleProvider___block_invoke;
    v25[3] = &unk_264800A60;
    v25[4] = self;
    [v8 setTitleTextAttributesTransformer:v25];
    v13 = [(TVRUIDeviceListCell *)self findMyButton];
    [v13 setConfiguration:v8];

    v14 = [(TVRUIDeviceListCell *)self styleProvider];
    v15 = [v14 cellSeparatorBackgroundColor];
    double v16 = [(TVRUIDeviceListCell *)self separator];
    [v16 setBackgroundColor:v15];

    double v17 = [(TVRUIDeviceListCell *)self styleProvider];
    v18 = [v17 cellBackgroundColor];
    [(TVRUIDeviceListCell *)self setBackgroundColor:v18];

    v19 = [(TVRUIDeviceListCell *)self styleProvider];
    v20 = [v19 fontForDeviceListRow];
    v21 = [(TVRUIDeviceListCell *)self deviceLabel];
    [v21 setFont:v20];

    uint64_t v22 = [(TVRUIDeviceListCell *)self styleProvider];
    v23 = [v22 checkmarkImage];
    v24 = [(TVRUIDeviceListCell *)self checkmarkImageView];
    [v24 setImage:v23];

    [(TVRUIDeviceListCell *)self _setupConstraints];
  }
}

id __40__TVRUIDeviceListCell_setStyleProvider___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)[a2 mutableCopy];
  v4 = [*(id *)(a1 + 32) styleProvider];
  v5 = [v4 fontForDeviceListRow];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F814F0]];

  return v3;
}

- (void)setDevice:(id)a3
{
  v5 = (TVRUIDevice *)a3;
  p_device = &self->_device;
  v7 = v5;
  if (self->_device != v5)
  {
    objc_storeStrong((id *)p_device, a3);
    p_device = (TVRUIDevice **)[(TVRUIDeviceListCell *)self _configureViews];
    v5 = v7;
  }
  if (v5)
  {
    p_device = (TVRUIDevice **)[(TVRUIDeviceListCell *)self _updateConnectionStatus];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_device, v5);
}

- (void)setShowSeparator:(BOOL)a3
{
  if (self->_showSeparator != a3)
  {
    self->_showSeparator = a3;
    BOOL v3 = !a3;
    id v4 = [(TVRUIDeviceListCell *)self separator];
    [v4 setHidden:v3];
  }
}

- (void)setFindButtonTapAction:(id)a3
{
  v5 = (UIAction *)a3;
  v6 = v5;
  p_findButtonTapAction = &self->_findButtonTapAction;
  if (self->_findButtonTapAction != v5)
  {
    v10 = v5;
    v8 = [(TVRUIDeviceListCell *)self findMyButton];
    v9 = v8;
    if (v10) {
      [v8 addAction:v10 forControlEvents:64];
    }
    else {
      [v8 removeAction:*p_findButtonTapAction forControlEvents:64];
    }

    objc_storeStrong((id *)p_findButtonTapAction, a3);
    v6 = v10;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)_configureViews
{
  BOOL v3 = [(TVRUIDeviceListCell *)self device];

  if (v3)
  {
    if (+[TVRUIFeatures isCorianderDebugUIEnabled]
      || +[TVRUIFeatures isAWDLEnabled])
    {
      id v4 = [(TVRUIDeviceListCell *)self device];
      uint64_t v5 = [v4 debugName];
    }
    else
    {
      id v4 = [(TVRUIDeviceListCell *)self device];
      uint64_t v5 = [v4 name];
    }
    id v12 = (id)v5;

    v6 = [(TVRUIDeviceListCell *)self deviceLabel];
    [v6 setText:v12];

    v7 = [(TVRUIDeviceListCell *)self device];
    v8 = [v7 model];

    v9 = [(TVRUIDeviceListCell *)self styleProvider];
    v10 = [v9 devicePickerIconForDeviceModel:v8];

    v11 = [(TVRUIDeviceListCell *)self modelImageView];
    [v11 setImage:v10];

    [(TVRUIDeviceListCell *)self _updateFindMyButton];
  }
}

- (void)_setupConstraints
{
  id v95 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v3 = [(TVRUIDeviceListCell *)self checkmarkImageView];
  id v4 = [v3 leadingAnchor];
  uint64_t v5 = [(TVRUIDeviceListCell *)self contentView];
  v6 = [v5 leadingAnchor];
  v7 = [(TVRUIDeviceListCell *)self styleProvider];
  [v7 touchpadInsets];
  v9 = [v4 constraintEqualToAnchor:v6 constant:v8];
  [v95 addObject:v9];

  v10 = [(TVRUIDeviceListCell *)self checkmarkImageView];
  v11 = [v10 centerYAnchor];
  id v12 = [(TVRUIDeviceListCell *)self contentView];
  v13 = [v12 centerYAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v95 addObject:v14];

  v15 = [(TVRUIDeviceListCell *)self checkmarkImageView];
  double v16 = [v15 widthAnchor];
  double v17 = [v16 constraintEqualToConstant:25.0];
  [v95 addObject:v17];

  v18 = [(TVRUIDeviceListCell *)self modelImageView];
  v19 = [v18 leadingAnchor];
  v20 = [(TVRUIDeviceListCell *)self checkmarkImageView];
  v21 = [v20 trailingAnchor];
  uint64_t v22 = [v19 constraintEqualToAnchor:v21 constant:10.0];
  [v95 addObject:v22];

  v23 = [(TVRUIDeviceListCell *)self modelImageView];
  v24 = [v23 centerYAnchor];
  v25 = [(TVRUIDeviceListCell *)self contentView];
  v26 = [v25 centerYAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v95 addObject:v27];

  uint64_t v28 = [(TVRUIDeviceListCell *)self modelImageView];
  objc_super v29 = [v28 widthAnchor];
  v30 = [v29 constraintEqualToConstant:44.0];
  [v95 addObject:v30];

  v31 = [(TVRUIDeviceListCell *)self deviceLabel];
  v32 = [v31 leadingAnchor];
  v33 = [(TVRUIDeviceListCell *)self modelImageView];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:10.0];
  [v95 addObject:v35];

  v36 = [(TVRUIDeviceListCell *)self deviceLabel];
  v37 = [v36 centerYAnchor];
  v38 = [(TVRUIDeviceListCell *)self contentView];
  v39 = [v38 centerYAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v95 addObject:v40];

  v41 = [(TVRUIDeviceListCell *)self findMyButton];
  v42 = [v41 trailingAnchor];
  v43 = [(TVRUIDeviceListCell *)self contentView];
  v44 = [v43 trailingAnchor];
  v45 = [(TVRUIDeviceListCell *)self styleProvider];
  [v45 touchpadInsets];
  v47 = [v42 constraintEqualToAnchor:v44 constant:-v46];
  [v95 addObject:v47];

  v48 = [(TVRUIDeviceListCell *)self findMyButton];
  v49 = [v48 centerYAnchor];
  v50 = [(TVRUIDeviceListCell *)self contentView];
  v51 = [v50 centerYAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  [v95 addObject:v52];

  v53 = [(TVRUIDeviceListCell *)self findMyButton];
  v54 = [v53 topAnchor];
  v55 = [(TVRUIDeviceListCell *)self contentView];
  v56 = [v55 topAnchor];
  v57 = [v54 constraintGreaterThanOrEqualToAnchor:v56 constant:5.0];
  [v95 addObject:v57];

  v58 = [(TVRUIDeviceListCell *)self findMyButton];
  v59 = [v58 bottomAnchor];
  v60 = [(TVRUIDeviceListCell *)self contentView];
  v61 = [v60 bottomAnchor];
  v62 = [v59 constraintLessThanOrEqualToAnchor:v61 constant:-5.0];
  [v95 addObject:v62];

  v63 = [(TVRUIDeviceListCell *)self deviceLabel];
  v64 = [v63 trailingAnchor];
  v65 = [(TVRUIDeviceListCell *)self findMyButton];
  v66 = [v65 leadingAnchor];
  v67 = [v64 constraintLessThanOrEqualToAnchor:v66 constant:-10.0];
  deviceLabelTrailingFindMyButtonConstraint = self->_deviceLabelTrailingFindMyButtonConstraint;
  self->_deviceLabelTrailingFindMyButtonConstraint = v67;

  v69 = [(TVRUIDeviceListCell *)self deviceLabel];
  v70 = [v69 trailingAnchor];
  v71 = [(TVRUIDeviceListCell *)self contentView];
  v72 = [v71 trailingAnchor];
  v73 = [v70 constraintLessThanOrEqualToAnchor:v72 constant:-10.0];
  deviceLabelTrailingContentViewConstraint = self->_deviceLabelTrailingContentViewConstraint;
  self->_deviceLabelTrailingContentViewConstraint = v73;

  [v95 addObject:self->_deviceLabelTrailingContentViewConstraint];
  [v95 addObject:self->_deviceLabelTrailingFindMyButtonConstraint];
  v75 = [(TVRUIDeviceListCell *)self findMyButton];
  LODWORD(v70) = [v75 isHidden];

  if (v70) {
    [(TVRUIDeviceListCell *)self deviceLabelTrailingContentViewConstraint];
  }
  else {
  v76 = [(TVRUIDeviceListCell *)self deviceLabelTrailingFindMyButtonConstraint];
  }
  [v76 setActive:0];

  v77 = [(TVRUIDeviceListCell *)self separator];
  v78 = [v77 bottomAnchor];
  v79 = [(TVRUIDeviceListCell *)self contentView];
  v80 = [v79 bottomAnchor];
  v81 = [v78 constraintEqualToAnchor:v80];
  [v95 addObject:v81];

  v82 = [(TVRUIDeviceListCell *)self separator];
  v83 = [v82 leadingAnchor];
  v84 = [(TVRUIDeviceListCell *)self modelImageView];
  v85 = [v84 leadingAnchor];
  v86 = [v83 constraintEqualToAnchor:v85];
  [v95 addObject:v86];

  v87 = [(TVRUIDeviceListCell *)self separator];
  v88 = [v87 trailingAnchor];
  v89 = [(TVRUIDeviceListCell *)self findMyButton];
  v90 = [v89 trailingAnchor];
  v91 = [v88 constraintEqualToAnchor:v90];
  [v95 addObject:v91];

  v92 = [(TVRUIDeviceListCell *)self separator];
  v93 = [v92 heightAnchor];
  v94 = [v93 constraintEqualToConstant:1.0];
  [v95 addObject:v94];

  [MEMORY[0x263F08938] activateConstraints:v95];
}

- (void)_updateConnectionStatus
{
  BOOL v3 = [(TVRUIDeviceListCell *)self device];
  int v4 = [v3 isConnected];

  uint64_t v5 = [(TVRUIDeviceListCell *)self styleProvider];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 colorForConnectedDevice];
    double v8 = [(TVRUIDeviceListCell *)self deviceLabel];
    [v8 setTextColor:v7];

    v9 = [(TVRUIDeviceListCell *)self styleProvider];
    v10 = [v9 colorForConnectedDevice];
    v11 = [(TVRUIDeviceListCell *)self modelImageView];
    [v11 setTintColor:v10];

    id v12 = [(TVRUIDeviceListCell *)self checkmarkImageView];
    id v19 = v12;
    uint64_t v13 = 0;
  }
  else
  {
    v14 = [v5 colorForDisconnectedDevice];
    v15 = [(TVRUIDeviceListCell *)self deviceLabel];
    [v15 setTextColor:v14];

    double v16 = [(TVRUIDeviceListCell *)self styleProvider];
    double v17 = [v16 colorForDisconnectedDevice];
    v18 = [(TVRUIDeviceListCell *)self modelImageView];
    [v18 setTintColor:v17];

    id v12 = [(TVRUIDeviceListCell *)self checkmarkImageView];
    id v19 = v12;
    uint64_t v13 = 1;
  }
  [v12 setHidden:v13];
}

- (void)_updateFindMyButton
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRUIDevicePickerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(TVRUIDeviceListCell *)self device];
    uint64_t v5 = [v4 name];
    v6 = [(TVRUIDeviceListCell *)self device];
    int v7 = [v6 supportsFindMyRemote];
    double v8 = "no";
    if (v7) {
      double v8 = "yes";
    }
    int v18 = 138543618;
    id v19 = v5;
    __int16 v20 = 2080;
    v21 = v8;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "device - %{public}@ supportsFindMy: %s", (uint8_t *)&v18, 0x16u);
  }
  if (GestaltGetDeviceClass() != 3)
  {
    v9 = [(TVRUIDeviceListCell *)self device];
    uint64_t v10 = [v9 supportsFindMyRemote] ^ 1;
    v11 = [(TVRUIDeviceListCell *)self deviceLabelTrailingContentViewConstraint];
    [v11 setActive:v10];

    id v12 = [(TVRUIDeviceListCell *)self device];
    uint64_t v13 = [v12 supportsFindMyRemote];
    v14 = [(TVRUIDeviceListCell *)self deviceLabelTrailingFindMyButtonConstraint];
    [v14 setActive:v13];

    v15 = [(TVRUIDeviceListCell *)self device];
    uint64_t v16 = [v15 supportsFindMyRemote] ^ 1;
    double v17 = [(TVRUIDeviceListCell *)self findMyButton];
    [v17 setHidden:v16];
  }
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (UIAction)findButtonTapAction
{
  return self->_findButtonTapAction;
}

- (UIButton)findMyButton
{
  return self->_findMyButton;
}

- (void)setFindMyButton:(id)a3
{
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (UIImageView)modelImageView
{
  return self->_modelImageView;
}

- (void)setModelImageView:(id)a3
{
}

- (UILabel)deviceLabel
{
  return self->_deviceLabel;
}

- (void)setDeviceLabel:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (NSLayoutConstraint)deviceLabelTrailingContentViewConstraint
{
  return self->_deviceLabelTrailingContentViewConstraint;
}

- (void)setDeviceLabelTrailingContentViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)deviceLabelTrailingFindMyButtonConstraint
{
  return self->_deviceLabelTrailingFindMyButtonConstraint;
}

- (void)setDeviceLabelTrailingFindMyButtonConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLabelTrailingFindMyButtonConstraint, 0);
  objc_storeStrong((id *)&self->_deviceLabelTrailingContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_deviceLabel, 0);
  objc_storeStrong((id *)&self->_modelImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_findButtonTapAction, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end