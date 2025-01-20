@interface _TVRUIMediaInfoCell
+ (CGSize)preferredImageSize;
+ (double)preferredHeight;
- (TVRCMediaInfo)mediaInfo;
- (TVRUIUpNextProviding)upNextProvider;
- (UIImageView)imageView;
- (UILabel)factoidsLabel;
- (UILabel)titleLabel;
- (_TVRUIMediaInfoCell)initWithFrame:(CGRect)a3;
- (_TVRUITemplateImageProviding)imageProvider;
- (void)_configureHierarchy;
- (void)prepareForReuse;
- (void)setImageProvider:(id)a3;
- (void)setMediaInfo:(id)a3;
- (void)setUpNextProvider:(id)a3;
@end

@implementation _TVRUIMediaInfoCell

- (_TVRUIMediaInfoCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUIMediaInfoCell;
  v3 = -[_TVRUIMediaInfoCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUIMediaInfoCell *)v3 _configureHierarchy];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)_TVRUIMediaInfoCell;
  [(_TVRUIMediaInfoCell *)&v5 prepareForReuse];
  v3 = [(_TVRUIMediaInfoCell *)self imageView];
  [v3 setImage:0];

  v4 = [(_TVRUIMediaInfoCell *)self titleLabel];
  [v4 setText:0];
}

+ (CGSize)preferredImageSize
{
  double v2 = 102.0;
  double v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)preferredHeight
{
  return 77.0;
}

- (void)setMediaInfo:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mediaInfo, a3);
  if (v5)
  {
    objc_super v6 = [v5 title];
    v7 = [(_TVRUIMediaInfoCell *)self titleLabel];
    [v7 setText:v6];

    v8 = objc_msgSend(v5, "tvrui_formattedSummary");
    v9 = [(_TVRUIMediaInfoCell *)self factoidsLabel];
    [v9 setText:v8];

    objc_initWeak(&location, self);
    v10 = [(_TVRUIMediaInfoCell *)self imageProvider];
    v11 = [v5 imageURLTemplate];
    [(id)objc_opt_class() preferredImageSize];
    double v13 = v12;
    double v15 = v14;
    v16 = [v5 identifier];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __36___TVRUIMediaInfoCell_setMediaInfo___block_invoke;
    v17[3] = &unk_264800418;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v10, "requestImageForTemplate:size:identifier:completion:", v11, v16, v17, v13, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)_configureHierarchy
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  double v3 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
  id v4 = objc_alloc(MEMORY[0x263F82828]);
  id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v6 = objc_alloc_init(MEMORY[0x263F82E00]);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v7];
  [v6 addSubview:v8];
  v9 = [(_TVRUIMediaInfoCell *)self contentView];
  v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)v7 setFont:v10];

  [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v7 setTextColor:v11];

  [(UILabel *)v7 setNumberOfLines:2];
  [(UILabel *)v7 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v7 setAdjustsFontSizeToFitWidth:1];
  v97 = v7;
  LODWORD(v12) = 1148846080;
  [(UILabel *)v7 setContentHuggingPriority:1 forAxis:v12];
  double v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
  [(UILabel *)v8 setFont:v13];

  double v14 = [MEMORY[0x263F825C8] lightGrayColor];
  [(UILabel *)v8 setTextColor:v14];

  [(UILabel *)v8 setNumberOfLines:0];
  v98 = v8;
  [(UILabel *)v8 setAdjustsFontForContentSizeCategory:1];
  [(UIImageView *)v3 _setContinuousCornerRadius:8.0];
  [(UIImageView *)v3 setClipsToBounds:1];
  [(UIImageView *)v3 setContentMode:2];
  id v15 = [MEMORY[0x263F825C8] grayColor];
  uint64_t v16 = [v15 CGColor];
  v17 = [(UIImageView *)v3 layer];
  [v17 setBorderColor:v16];

  id v18 = [(UIImageView *)v3 layer];
  [v18 setBorderWidth:0.5];

  v19 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.right"];
  [v5 setImage:v19];

  v20 = [MEMORY[0x263F825C8] lightGrayColor];
  [v5 setTintColor:v20];

  LODWORD(v21) = 1148846080;
  [v5 setContentHuggingPriority:0 forAxis:v21];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v104[0] = v3;
  v104[1] = v6;
  v104[2] = v5;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:3];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v99 objects:v105 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v100 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v9 addSubview:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v99 objects:v105 count:16];
    }
    while (v24);
  }

  [(id)objc_opt_class() preferredImageSize];
  double v29 = v28;
  double v31 = v30;
  v74 = (void *)MEMORY[0x263F08938];
  v96 = [(UIImageView *)v3 leadingAnchor];
  v95 = [v9 leadingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95 constant:15.0];
  v103[0] = v94;
  v93 = [(UIImageView *)v3 centerYAnchor];
  v92 = [v9 centerYAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v103[1] = v91;
  v90 = [(UIImageView *)v3 widthAnchor];
  v89 = [v90 constraintEqualToConstant:v29];
  v103[2] = v89;
  v88 = [(UIImageView *)v3 heightAnchor];
  v87 = [v88 constraintEqualToConstant:v31];
  v103[3] = v87;
  v86 = [(UIImageView *)v3 topAnchor];
  v85 = [v9 topAnchor];
  v84 = [v86 constraintGreaterThanOrEqualToAnchor:v85 constant:8.0];
  v103[4] = v84;
  v83 = [(UIImageView *)v3 bottomAnchor];
  v82 = [v9 topAnchor];
  v81 = [v83 constraintLessThanOrEqualToAnchor:v82 constant:-8.0];
  v103[5] = v81;
  v80 = [v6 centerYAnchor];
  v79 = [v9 centerYAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v103[6] = v78;
  v76 = [v6 leadingAnchor];
  v75 = [(UIImageView *)v3 trailingAnchor];
  v72 = [v76 constraintEqualToAnchor:v75 constant:15.0];
  v103[7] = v72;
  v71 = [v6 trailingAnchor];
  v70 = [v5 leadingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:-15.0];
  v103[8] = v69;
  v66 = [v5 centerYAnchor];
  v65 = [v9 centerYAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v103[9] = v64;
  v63 = [v5 trailingAnchor];
  v62 = [v9 trailingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:-15.0];
  v103[10] = v61;
  v60 = [(UILabel *)v97 topAnchor];
  v59 = [v6 topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v103[11] = v58;
  v57 = [(UILabel *)v97 leadingAnchor];
  v56 = [v6 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v103[12] = v55;
  v54 = [(UILabel *)v97 trailingAnchor];
  v53 = [v6 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v103[13] = v52;
  v51 = [(UILabel *)v98 topAnchor];
  v50 = [(UILabel *)v97 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:2.0];
  v103[14] = v49;
  v48 = [(UILabel *)v98 leadingAnchor];
  v32 = [v6 leadingAnchor];
  v33 = [v48 constraintEqualToAnchor:v32];
  v103[15] = v33;
  [(UILabel *)v98 trailingAnchor];
  v34 = v67 = self;
  [v6 trailingAnchor];
  v35 = v68 = v3;
  v36 = [v34 constraintEqualToAnchor:v35];
  v103[16] = v36;
  v37 = [(UILabel *)v98 bottomAnchor];
  [v6 bottomAnchor];
  v38 = v77 = v5;
  [v37 constraintEqualToAnchor:v38];
  v39 = v73 = v6;
  v103[17] = v39;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:18];
  [v74 activateConstraints:v40];

  id v41 = objc_alloc_init(MEMORY[0x263F82E00]);
  v42 = [MEMORY[0x263F825C8] colorWithWhite:0.25 alpha:1.0];
  [v41 setBackgroundColor:v42];

  [(_TVRUIMediaInfoCell *)v67 setSelectedBackgroundView:v41];
  imageView = v67->_imageView;
  v67->_imageView = v68;
  v44 = v68;

  titleLabel = v67->_titleLabel;
  v67->_titleLabel = v97;
  v46 = v97;

  factoidsLabel = v67->_factoidsLabel;
  v67->_factoidsLabel = v98;

  [(_TVRUIMediaInfoCell *)v67 setOverrideUserInterfaceStyle:2];
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (_TVRUITemplateImageProviding)imageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);
  return (_TVRUITemplateImageProviding *)WeakRetained;
}

- (void)setImageProvider:(id)a3
{
}

- (TVRUIUpNextProviding)upNextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_upNextProvider);
  return (TVRUIUpNextProviding *)WeakRetained;
}

- (void)setUpNextProvider:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)factoidsLabel
{
  return self->_factoidsLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoidsLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_upNextProvider);
  objc_destroyWeak((id *)&self->_imageProvider);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

@end