@interface _TVRUIRoleCell
+ (CGSize)preferredImageSize;
+ (double)preferredHeight;
- (TVRCMediaInfoRole)role;
- (UIImageView)imageView;
- (UILabel)characterNameLabel;
- (UILabel)nameLabel;
- (_TVRUIAvatarGenerator)avatarGenerator;
- (_TVRUIRoleCell)initWithFrame:(CGRect)a3;
- (_TVRUITemplateImageProviding)imageProvider;
- (void)_configureHierarchy;
- (void)_updateFallbackImageForRole:(id)a3;
- (void)_updateUIWithRole:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarGenerator:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation _TVRUIRoleCell

- (_TVRUIRoleCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUIRoleCell;
  v3 = -[_TVRUIRoleCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUIRoleCell *)v3 _configureHierarchy];
  }
  return v4;
}

+ (double)preferredHeight
{
  return 70.0;
}

+ (CGSize)preferredImageSize
{
  double v2 = 100.0;
  double v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRUIRoleCell;
  [(_TVRUIRoleCell *)&v3 prepareForReuse];
  [(_TVRUIRoleCell *)self setRole:0];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_TVRUIRoleCell;
  [(_TVRUIRoleCell *)&v8 layoutSubviews];
  objc_super v3 = [(_TVRUIRoleCell *)self imageView];
  [v3 bounds];
  double v5 = v4;

  if (v5 > 0.0)
  {
    objc_super v6 = [(_TVRUIRoleCell *)self imageView];
    v7 = [v6 layer];
    [v7 setCornerRadius:v5 * 0.5];
  }
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
  id v5 = a3;
  [(_TVRUIRoleCell *)self _updateUIWithRole:v5];

  [(_TVRUIRoleCell *)self setNeedsLayout];
}

- (void)_updateUIWithRole:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVRUIRoleCell *)self imageView];
  [v5 setImage:0];

  objc_super v6 = [v4 actorName];
  v7 = [(_TVRUIRoleCell *)self nameLabel];
  [v7 setText:v6];

  objc_super v8 = [v4 characterName];
  v9 = [(_TVRUIRoleCell *)self characterNameLabel];
  [v9 setText:v8];

  v10 = [v4 imageURLTemplate];
  if ([v10 length])
  {
    objc_initWeak(&location, self);
    v11 = [(_TVRUIRoleCell *)self imageProvider];
    v12 = [v4 imageURLTemplate];
    [(id)objc_opt_class() preferredImageSize];
    double v14 = v13;
    double v16 = v15;
    v17 = [v4 canonicalID];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __36___TVRUIRoleCell__updateUIWithRole___block_invoke;
    v18[3] = &unk_2648006B0;
    objc_copyWeak(&v20, &location);
    id v19 = v4;
    objc_msgSend(v11, "requestImageForTemplate:size:identifier:completion:", v12, v17, v18, v14, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_TVRUIRoleCell *)self _updateFallbackImageForRole:v4];
  }
}

- (void)_configureHierarchy
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  objc_super v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  id v9 = objc_alloc_init(MEMORY[0x263F82E00]);
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
  v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
  v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v4, v5, v6, v7);
  double v13 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.right"];
  [v12 setImage:v13];

  double v14 = [MEMORY[0x263F825C8] lightGrayColor];
  [v12 setTintColor:v14];

  LODWORD(v15) = 1148846080;
  [v12 setContentHuggingPriority:0 forAxis:v15];
  [(UIImageView *)v8 setContentMode:2];
  id v16 = [MEMORY[0x263F825C8] colorWithWhite:0.2 alpha:1.0];
  uint64_t v17 = [v16 CGColor];
  v18 = [(UIImageView *)v8 layer];
  [v18 setBorderColor:v17];

  id v19 = [(UIImageView *)v8 layer];
  [v19 setBorderWidth:1.0];

  [(UIImageView *)v8 setClipsToBounds:1];
  id v20 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83588] variant:1024];
  [(UILabel *)v10 setFont:v20];

  v21 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v10 setTextColor:v21];

  v22 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
  [(UILabel *)v11 setFont:v22];

  v23 = [MEMORY[0x263F825C8] lightGrayColor];
  [(UILabel *)v11 setTextColor:v23];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v112[0] = v10;
  v100 = v11;
  v112[1] = v11;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:2];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v106 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v29 setAdjustsFontForContentSizeCategory:1];
        [v9 addSubview:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v105 objects:v113 count:16];
    }
    while (v26);
  }

  v99 = self;
  v30 = [(_TVRUIRoleCell *)self contentView];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v110[0] = v8;
  v110[1] = v9;
  v110[2] = v12;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:3];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v102 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v101 + 1) + 8 * j);
        [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v30 addSubview:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v101 objects:v111 count:16];
    }
    while (v33);
  }

  v76 = (void *)MEMORY[0x263F08938];
  v98 = [(UIImageView *)v8 topAnchor];
  v97 = [v30 topAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:10.0];
  v109[0] = v96;
  v95 = [(UIImageView *)v8 bottomAnchor];
  v94 = [v30 bottomAnchor];
  v93 = [v95 constraintEqualToAnchor:v94 constant:-10.0];
  v109[1] = v93;
  v92 = [(UIImageView *)v8 leadingAnchor];
  v91 = [v30 leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91 constant:10.0];
  v109[2] = v90;
  v89 = [(UIImageView *)v8 widthAnchor];
  v88 = [(UIImageView *)v8 heightAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v109[3] = v87;
  v85 = [v9 leadingAnchor];
  v84 = [(UIImageView *)v8 trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84 constant:10.0];
  v109[4] = v83;
  v81 = [v9 trailingAnchor];
  v80 = [v12 leadingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80 constant:-10.0];
  v109[5] = v79;
  v77 = [v9 centerYAnchor];
  v75 = [v30 centerYAnchor];
  v74 = [v77 constraintEqualToAnchor:v75];
  v109[6] = v74;
  v73 = [(UILabel *)v10 topAnchor];
  v72 = [v9 topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v109[7] = v71;
  v70 = [(UILabel *)v10 leadingAnchor];
  v69 = [v9 leadingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v109[8] = v68;
  v67 = [(UILabel *)v10 trailingAnchor];
  v66 = [v9 trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v109[9] = v65;
  v64 = [(UILabel *)v100 topAnchor];
  v63 = [(UILabel *)v10 bottomAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:0.0];
  v109[10] = v62;
  v61 = [(UILabel *)v100 leadingAnchor];
  v60 = [v9 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v109[11] = v59;
  v58 = [(UILabel *)v100 trailingAnchor];
  v57 = [v9 trailingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v109[12] = v56;
  v55 = [(UILabel *)v100 bottomAnchor];
  v54 = [v9 bottomAnchor];
  v37 = [v55 constraintEqualToAnchor:v54];
  v109[13] = v37;
  v38 = [v12 centerYAnchor];
  v39 = [v30 centerYAnchor];
  [v38 constraintEqualToAnchor:v39];
  v40 = v82 = v10;
  v109[14] = v40;
  v41 = [v12 trailingAnchor];
  [v30 trailingAnchor];
  v42 = v78 = v8;
  [v41 constraintEqualToAnchor:v42 constant:-10.0];
  v43 = v86 = v12;
  v109[15] = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:16];
  [v76 activateConstraints:v44];

  id v45 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v45 setClipsToBounds:1];
  [v45 _setContinuousCornerRadius:13.0];
  v46 = [MEMORY[0x263F825C8] colorWithWhite:0.18 alpha:1.0];
  [v45 setBackgroundColor:v46];

  [(_TVRUIRoleCell *)v99 setBackgroundView:v45];
  id v47 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v47 setClipsToBounds:1];
  [v47 _setContinuousCornerRadius:13.0];
  v48 = [MEMORY[0x263F825C8] colorWithWhite:0.35 alpha:1.0];
  [v47 setBackgroundColor:v48];

  [(_TVRUIRoleCell *)v99 setSelectedBackgroundView:v47];
  imageView = v99->_imageView;
  v99->_imageView = v78;
  v50 = v78;

  nameLabel = v99->_nameLabel;
  v99->_nameLabel = v82;
  v52 = v82;

  characterNameLabel = v99->_characterNameLabel;
  v99->_characterNameLabel = v100;

  [(_TVRUIRoleCell *)v99 setNeedsLayout];
}

- (void)_updateFallbackImageForRole:(id)a3
{
  id v4 = a3;
  double v5 = [(_TVRUIRoleCell *)self avatarGenerator];

  if (v5)
  {
    double v6 = [v4 actorName];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      objc_initWeak(&location, self);
      objc_super v8 = [(_TVRUIRoleCell *)self avatarGenerator];
      id v9 = [v4 actorName];
      v10 = [v4 canonicalID];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __46___TVRUIRoleCell__updateFallbackImageForRole___block_invoke;
      v11[3] = &unk_264800418;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v8, "generateAvatarForName:size:identifier:completion:", v9, v10, v11, 32.0, 32.0);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (_TVRUITemplateImageProviding)imageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);
  return (_TVRUITemplateImageProviding *)WeakRetained;
}

- (void)setImageProvider:(id)a3
{
}

- (_TVRUIAvatarGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (TVRCMediaInfoRole)role
{
  return self->_role;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)characterNameLabel
{
  return self->_characterNameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterNameLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_destroyWeak((id *)&self->_imageProvider);
}

@end