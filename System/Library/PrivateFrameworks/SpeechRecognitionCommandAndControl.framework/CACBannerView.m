@interface CACBannerView
- (CACBannerView)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (NSLayoutConstraint)imageToTextConstraint;
- (NSString)symbolImage;
- (NSString)text;
- (UIImageView)accessoryImageView;
- (UILabel)textLabel;
- (UIView)baseView;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAccessoryImageView:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setBaseView:(id)a3;
- (void)setImageToTextConstraint:(id)a3;
- (void)setSymbolImage:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation CACBannerView

- (CACBannerView)initWithFrame:(CGRect)a3
{
  v139[19] = *MEMORY[0x263EF8340];
  v138.receiver = self;
  v138.super_class = (Class)CACBannerView;
  v3 = -[CACBannerView initWithFrame:](&v138, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F82438] sharedApplication];
    v5 = [v4 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    v7 = (void *)MEMORY[0x263F83570];
    if (IsAccessibilityCategory)
    {
      uint64_t v8 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    }
    else
    {
      v9 = [MEMORY[0x263F82770] defaultMetrics];
      v10 = [MEMORY[0x263F82760] systemFontOfSize:14.0 weight:*MEMORY[0x263F83638]];
      uint64_t v8 = [v9 scaledFontForFont:v10];
    }
    if (initWithFrame__onceToken != -1) {
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_4);
    }
    v11 = [(id)initWithFrame__sSizingLabel font];
    char v12 = [v11 isEqual:v8];

    if ((v12 & 1) == 0) {
      [(id)initWithFrame__sSizingLabel setFont:v8];
    }
    v13 = [(CACBannerView *)v3 traitCollection];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if (v14 == 3) {
      double v15 = 10.0;
    }
    else {
      double v15 = 13.0;
    }
    v16 = objc_opt_new();
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [MEMORY[0x263F825C8] clearColor];
    [v16 setBackgroundColor:v17];

    id v18 = [MEMORY[0x263F825C8] blackColor];
    uint64_t v19 = [v18 CGColor];
    v20 = [v16 layer];
    [v20 setShadowColor:v19];

    v21 = [v16 layer];
    double v22 = 0.0;
    objc_msgSend(v21, "setShadowOffset:", 0.0, 5.0);

    v23 = [v16 layer];
    LODWORD(v24) = 1045220557;
    [v23 setShadowOpacity:v24];

    v25 = [v16 layer];
    [v25 setShadowRadius:10.0];

    v26 = [v16 layer];
    [v26 setMasksToBounds:0];

    [(CACBannerView *)v3 addSubview:v16];
    [(CACBannerView *)v3 setBaseView:v16];
    uint64_t v27 = [MEMORY[0x263F824D8] effectWithStyle:1200];
    v28 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v27];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [v28 layer];
    [v29 setCornerRadius:v15];

    uint64_t v30 = *MEMORY[0x263F15A20];
    v31 = [v28 layer];
    [v31 setCornerCurve:v30];

    v32 = [v28 layer];
    [v32 setMasksToBounds:1];

    [v16 addSubview:v28];
    id v33 = objc_alloc(MEMORY[0x263F82E50]);
    v136 = (void *)v27;
    v34 = [MEMORY[0x263F82DF0] _effectForBlurEffect:v27 vibrancyStyle:102];
    v35 = (void *)[v33 initWithEffect:v34];

    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = [v28 contentView];
    [v36 addSubview:v35];

    id v37 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v37 setFont:v8];
    [v37 setNumberOfLines:0];
    [v37 setTextAlignment:4];
    v38 = [v35 contentView];
    [v38 addSubview:v37];

    v39 = v37;
    [(CACBannerView *)v3 setTextLabel:v37];
    uint64_t v40 = [MEMORY[0x263F82818] configurationWithTextStyle:*v7 scale:2];
    v41 = [(CACBannerView *)v3 symbolImage];

    if (v41)
    {
      v42 = (void *)MEMORY[0x263F827E8];
      v43 = [(CACBannerView *)v3 symbolImage];
      v41 = [v42 systemImageNamed:v43];
    }
    v137 = (void *)v8;
    v134 = v41;
    v44 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v41];
    [v44 setPreferredSymbolConfiguration:v40];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v44 setContentMode:2];
    v135 = (void *)v40;
    [v44 setPreferredSymbolConfiguration:v40];
    v45 = [v35 contentView];
    [v45 addSubview:v44];

    v133 = v44;
    [(CACBannerView *)v3 setAccessoryImageView:v44];
    v46 = [(CACBannerView *)v3 accessoryImageView];
    v47 = [v46 image];
    if (v47)
    {
      v48 = [MEMORY[0x263F82770] defaultMetrics];
      [v48 scaledValueForValue:10.0];
      double v22 = v49;
    }
    v50 = v39;
    v51 = [v39 leadingAnchor];
    v52 = [(CACBannerView *)v3 accessoryImageView];
    v53 = [v52 trailingAnchor];
    v54 = [v51 constraintEqualToAnchor:v53 constant:v22];
    [(CACBannerView *)v3 setImageToTextConstraint:v54];

    v104 = (void *)MEMORY[0x263F08938];
    v132 = [v16 topAnchor];
    v131 = [(CACBannerView *)v3 topAnchor];
    v130 = [v132 constraintEqualToAnchor:v131];
    v139[0] = v130;
    v129 = [v16 bottomAnchor];
    v128 = [(CACBannerView *)v3 bottomAnchor];
    v127 = [v129 constraintEqualToAnchor:v128];
    v139[1] = v127;
    v126 = [v16 centerXAnchor];
    v125 = [(CACBannerView *)v3 centerXAnchor];
    v124 = [v126 constraintEqualToAnchor:v125];
    v139[2] = v124;
    v123 = [v16 widthAnchor];
    v122 = [v123 constraintGreaterThanOrEqualToConstant:24.0];
    v139[3] = v122;
    v121 = [v16 widthAnchor];
    v120 = [v28 widthAnchor];
    v119 = [v121 constraintEqualToAnchor:v120];
    v139[4] = v119;
    v118 = [v16 heightAnchor];
    v117 = [v28 heightAnchor];
    v116 = [v118 constraintEqualToAnchor:v117];
    v139[5] = v116;
    v115 = [v28 contentView];
    v114 = [v115 widthAnchor];
    v113 = [(CACBannerView *)v3 widthAnchor];
    v112 = [v114 constraintLessThanOrEqualToAnchor:v113];
    v139[6] = v112;
    v111 = [v28 topAnchor];
    v110 = [v16 topAnchor];
    v109 = [v111 constraintEqualToAnchor:v110];
    v139[7] = v109;
    v108 = [v28 leadingAnchor];
    v107 = [v16 leadingAnchor];
    v106 = [v108 constraintEqualToAnchor:v107];
    v139[8] = v106;
    v105 = [v28 contentView];
    v103 = [v105 trailingAnchor];
    v102 = [v50 trailingAnchor];
    v101 = [v103 constraintEqualToAnchor:v102 constant:12.0];
    v139[9] = v101;
    v100 = [v35 contentView];
    v98 = [v100 topAnchor];
    v99 = [v28 contentView];
    v97 = [v99 topAnchor];
    v95 = [v98 constraintEqualToAnchor:v97];
    v139[10] = v95;
    v91 = [v35 contentView];
    v89 = [v91 leadingAnchor];
    v90 = [v28 contentView];
    v88 = [v90 leadingAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v139[11] = v87;
    v86 = [v35 contentView];
    v84 = [v86 bottomAnchor];
    v85 = [v28 contentView];
    v83 = [v85 bottomAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v139[12] = v82;
    v81 = [v35 contentView];
    v79 = [v81 trailingAnchor];
    v80 = [v28 contentView];
    v78 = [v80 trailingAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v139[13] = v77;
    v76 = [(CACBannerView *)v3 accessoryImageView];
    v75 = [v76 centerYAnchor];
    v74 = [v50 centerYAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v139[14] = v73;
    v72 = [(CACBannerView *)v3 accessoryImageView];
    v70 = [v72 leadingAnchor];
    v71 = [v35 contentView];
    v69 = [v71 leadingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69 constant:12.0];
    v139[15] = v68;
    v55 = v50;
    v92 = v50;
    v67 = [v50 topAnchor];
    v56 = [v35 contentView];
    v57 = [v56 topAnchor];
    v58 = [v67 constraintEqualToAnchor:v57 constant:12.0];
    v139[16] = v58;
    [v28 contentView];
    v59 = v96 = v35;
    v60 = [v59 bottomAnchor];
    [v55 bottomAnchor];
    v61 = v93 = v28;
    [v60 constraintEqualToAnchor:v61 constant:12.0];
    v62 = v94 = v16;
    v139[17] = v62;
    v63 = [(CACBannerView *)v3 imageToTextConstraint];
    v139[18] = v63;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:19];
    v65 = v64 = v3;
    [v104 activateConstraints:v65];

    v3 = v64;
  }
  return v3;
}

uint64_t __31__CACBannerView_initWithFrame___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)initWithFrame__sSizingLabel;
  initWithFrame__sSizingLabel = v0;

  v2 = (void *)initWithFrame__sSizingLabel;
  return [v2 setText:@"a"];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(CACBannerView *)self baseView];
  v9 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);

  return v9;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(CACBannerView *)self baseView];
  uint64_t v8 = objc_msgSend(v7, "hitTest:forEvent:", a4, x, y);

  return v8;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(CACBannerView *)self textLabel];
  [v5 setText:v4];
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(CACBannerView *)self textLabel];
  [v5 setAttributedText:v4];
}

- (void)setSymbolImage:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = (NSString *)a3;
  p_symbolImage = &self->_symbolImage;
  if (self->_symbolImage != v5)
  {
    id v7 = self;
    objc_sync_enter(v7);
    objc_storeStrong((id *)p_symbolImage, a3);
    uint64_t v8 = [(CACBannerView *)v7 symbolImage];
    if (v8)
    {
      v9 = (void *)MEMORY[0x263F827E8];
      v10 = [(CACBannerView *)v7 symbolImage];
      v11 = [v9 _systemImageNamed:v10];
    }
    else
    {
      v11 = 0;
    }

    char v12 = [(CACBannerView *)v7 accessoryImageView];
    [v12 setImage:v11];

    v13 = (void *)MEMORY[0x263F08938];
    uint64_t v14 = [(CACBannerView *)v7 imageToTextConstraint];
    v30[0] = v14;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v13 deactivateConstraints:v15];

    v16 = [(CACBannerView *)v7 accessoryImageView];
    v17 = [v16 image];
    if (v17)
    {
      id v18 = [MEMORY[0x263F82770] defaultMetrics];
      [v18 scaledValueForValue:10.0];
      double v20 = v19;
    }
    else
    {
      double v20 = 0.0;
    }

    v21 = [(CACBannerView *)v7 textLabel];
    double v22 = [v21 leadingAnchor];
    v23 = [(CACBannerView *)v7 accessoryImageView];
    double v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:v20];
    [(CACBannerView *)v7 setImageToTextConstraint:v25];

    v26 = (void *)MEMORY[0x263F08938];
    uint64_t v27 = [(CACBannerView *)v7 imageToTextConstraint];
    v29 = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [v26 activateConstraints:v28];

    objc_sync_exit(v7);
  }
}

- (NSString)text
{
  v2 = [(CACBannerView *)self textLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)symbolImage
{
  return self->_symbolImage;
}

- (NSLayoutConstraint)imageToTextConstraint
{
  return self->_imageToTextConstraint;
}

- (void)setImageToTextConstraint:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
}

- (UIView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageToTextConstraint, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end