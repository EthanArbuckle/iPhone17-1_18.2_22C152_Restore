@interface SFCloseButton
- (SFCloseButton)initWithStyle:(int64_t)a3 primaryAction:(id)a4;
- (UIImageView)imageView;
- (double)opaqueBackgroundVisibility;
- (id)_makeXmarkImageView;
- (void)layoutSubviews;
- (void)setOpaqueBackgroundVisibility:(double)a3;
@end

@implementation SFCloseButton

- (SFCloseButton)initWithStyle:(int64_t)a3 primaryAction:(id)a4
{
  v117[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v114.receiver = self;
  v114.super_class = (Class)SFCloseButton;
  v7 = -[SFCloseButton initWithFrame:](&v114, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (!v7) {
    goto LABEL_16;
  }
  if ((unint64_t)(a3 - 1) < 2)
  {
    id v111 = v6;
    [(SFCloseButton *)v7 _setContinuousCornerRadius:1.79769313e308];
    if (a3 == 1) {
      uint64_t v9 = 10;
    }
    else {
      uint64_t v9 = 8;
    }
    uint64_t v10 = [MEMORY[0x1E4FB14C8] effectWithStyle:v9];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v10];
    blurEffectView = v8->_blurEffectView;
    v8->_blurEffectView = (UIVisualEffectView *)v11;

    [(UIVisualEffectView *)v8->_blurEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v8->_blurEffectView setUserInteractionEnabled:0];
    [(SFCloseButton *)v8 addSubview:v8->_blurEffectView];
    v109 = (void *)v10;
    uint64_t v108 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v10 style:1];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v108];
    vibrantEffectView = v8->_vibrantEffectView;
    v8->_vibrantEffectView = (UIVisualEffectView *)v13;

    [(UIVisualEffectView *)v8->_vibrantEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v8->_vibrantEffectView setUserInteractionEnabled:0];
    [(SFCloseButton *)v8 addSubview:v8->_vibrantEffectView];
    v15 = [(UIVisualEffectView *)v8->_vibrantEffectView contentView];
    uint64_t v16 = [(SFCloseButton *)v8 _makeXmarkImageView];
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v16;

    int64_t v110 = a3;
    if (a3 == 1)
    {
      v18 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      v19 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] compatibleWithTraitCollection:v18];
      v20 = (void *)MEMORY[0x1E4FB1830];
      [v19 pointSize];
      v21 = objc_msgSend(v20, "configurationWithPointSize:weight:scale:", 7, 2);

      [(UIImageView *)v8->_imageView setPreferredSymbolConfiguration:v21];
      double v22 = 22.0;
    }
    else
    {
      v42 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:2 scale:15.0];
      [(UIImageView *)v8->_imageView setPreferredSymbolConfiguration:v42];

      uint64_t v43 = [(SFCloseButton *)v8 _makeXmarkImageView];
      opaqueImageView = v8->_opaqueImageView;
      v8->_opaqueImageView = (UIImageView *)v43;

      v45 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:2 scale:15.0];
      [(UIImageView *)v8->_opaqueImageView setPreferredSymbolConfiguration:v45];

      v46 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      opaqueBackgroundView = v8->_opaqueBackgroundView;
      v8->_opaqueBackgroundView = v46;

      [(UIView *)v8->_opaqueBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
      v48 = [MEMORY[0x1E4FB1618] systemFillColor];
      [(UIView *)v8->_opaqueBackgroundView setBackgroundColor:v48];

      [(UIView *)v8->_opaqueBackgroundView setUserInteractionEnabled:0];
      [(UIView *)v8->_opaqueBackgroundView setAlpha:0.0];
      [(UIView *)v8->_opaqueBackgroundView addSubview:v8->_opaqueImageView];
      [(SFCloseButton *)v8 addSubview:v8->_opaqueBackgroundView];
      v93 = (void *)MEMORY[0x1E4F28DC8];
      v89 = [(UIView *)v8->_opaqueBackgroundView centerXAnchor];
      v105 = [(SFCloseButton *)v8 centerXAnchor];
      v103 = [v89 constraintEqualToAnchor:v105];
      v116[0] = v103;
      v101 = [(UIView *)v8->_opaqueBackgroundView centerYAnchor];
      v99 = [(SFCloseButton *)v8 centerYAnchor];
      v97 = [v101 constraintEqualToAnchor:v99];
      v116[1] = v97;
      v95 = [(UIView *)v8->_opaqueBackgroundView widthAnchor];
      v91 = [(SFCloseButton *)v8 widthAnchor];
      v87 = [v95 constraintEqualToAnchor:v91];
      v116[2] = v87;
      v85 = [(UIView *)v8->_opaqueBackgroundView heightAnchor];
      v83 = [(SFCloseButton *)v8 heightAnchor];
      v81 = [v85 constraintEqualToAnchor:v83];
      v116[3] = v81;
      v49 = [(UIImageView *)v8->_opaqueImageView centerXAnchor];
      v50 = [(UIView *)v8->_opaqueBackgroundView centerXAnchor];
      [v49 constraintEqualToAnchor:v50];
      v51 = v113 = v15;
      v116[4] = v51;
      v52 = [(UIImageView *)v8->_opaqueImageView centerYAnchor];
      v53 = [(UIView *)v8->_opaqueBackgroundView centerYAnchor];
      v54 = [v52 constraintEqualToAnchor:v53];
      v116[5] = v54;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:6];
      [v93 activateConstraints:v55];

      v21 = v89;
      v15 = v113;

      double v22 = 30.0;
    }

    [v15 addSubview:v8->_imageView];
    v88 = (void *)MEMORY[0x1E4F28DC8];
    v86 = [(UIVisualEffectView *)v8->_blurEffectView centerXAnchor];
    uint64_t v94 = [(SFCloseButton *)v8 centerXAnchor];
    uint64_t v92 = [v86 constraintEqualToAnchor:v94];
    v115[0] = v92;
    v56 = [(UIVisualEffectView *)v8->_blurEffectView centerYAnchor];
    uint64_t v79 = [(SFCloseButton *)v8 centerYAnchor];
    v112 = v56;
    v107 = [v56 constraintEqualToAnchor:v79];
    v115[1] = v107;
    v106 = [(UIVisualEffectView *)v8->_blurEffectView widthAnchor];
    v104 = [(SFCloseButton *)v8 widthAnchor];
    v102 = [v106 constraintEqualToAnchor:v104];
    v115[2] = v102;
    v100 = [(UIVisualEffectView *)v8->_blurEffectView heightAnchor];
    v98 = [(SFCloseButton *)v8 heightAnchor];
    v96 = [v100 constraintEqualToAnchor:v98];
    v115[3] = v96;
    v90 = [(UIVisualEffectView *)v8->_vibrantEffectView centerXAnchor];
    v84 = [(SFCloseButton *)v8 centerXAnchor];
    v82 = [v90 constraintEqualToAnchor:v84];
    v115[4] = v82;
    v80 = [(UIVisualEffectView *)v8->_vibrantEffectView centerYAnchor];
    v78 = [(SFCloseButton *)v8 centerYAnchor];
    v77 = [v80 constraintEqualToAnchor:v78];
    v115[5] = v77;
    v76 = [(UIVisualEffectView *)v8->_vibrantEffectView widthAnchor];
    v75 = [(SFCloseButton *)v8 widthAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v115[6] = v74;
    v73 = [(UIVisualEffectView *)v8->_vibrantEffectView heightAnchor];
    v72 = [(SFCloseButton *)v8 heightAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v115[7] = v71;
    v70 = [(UIImageView *)v8->_imageView centerXAnchor];
    v69 = [v15 centerXAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v115[8] = v68;
    v57 = [(UIImageView *)v8->_imageView centerYAnchor];
    v58 = [v15 centerYAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    v115[9] = v59;
    v60 = [(SFCloseButton *)v8 widthAnchor];
    v61 = [v60 constraintEqualToConstant:v22];
    v115[10] = v61;
    [(SFCloseButton *)v8 heightAnchor];
    v63 = v62 = v15;
    v64 = [v63 constraintEqualToConstant:v22];
    v115[11] = v64;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:12];
    [v88 activateConstraints:v65];

    v41 = (void *)v79;
    v35 = v62;
    v36 = v86;

    v38 = (void *)v92;
    v37 = (void *)v94;

    a3 = v110;
    id v6 = v111;
    v34 = (void *)v108;
    id v23 = v109;
    goto LABEL_12;
  }
  if (!a3)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    [(SFCloseButton *)v8 bounds];
    objc_msgSend(v23, "setFrame:");
    [v23 setAutoresizingMask:18];
    v24 = (void *)MEMORY[0x1E4FB1EA0];
    v25 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    v26 = [v24 effectForBlurEffect:v25 style:1];
    [v23 setEffect:v26];

    [v23 setUserInteractionEnabled:0];
    [(SFCloseButton *)v8 addSubview:v23];
    id v27 = objc_alloc(MEMORY[0x1E4FB1838]);
    v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    uint64_t v29 = [v27 initWithImage:v28];
    v30 = v8->_imageView;
    v8->_imageView = (UIImageView *)v29;

    [(UIImageView *)v8->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = objc_msgSend(MEMORY[0x1E4FB1830], "_sf_staticConfigurationWithTextStyle:scale:", *MEMORY[0x1E4FB28C8], 1);
    [(UIImageView *)v8->_imageView setPreferredSymbolConfiguration:v31];

    [(UIImageView *)v8->_imageView _sf_setMatchesIntrinsicContentSize];
    v32 = [v23 contentView];
    [v32 addSubview:v8->_imageView];

    v33 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UIImageView *)v8->_imageView centerYAnchor];
    v35 = [v23 centerYAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v117[0] = v36;
    v37 = [(UIImageView *)v8->_imageView centerXAnchor];
    v38 = [v23 centerXAnchor];
    v112 = [v37 constraintEqualToAnchor:v38];
    v117[1] = v112;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
    v40 = v33;
    v41 = (void *)v39;
    [v40 activateConstraints:v39];
LABEL_12:
  }
  v8->_style = a3;
  if (v6) {
    [(SFCloseButton *)v8 addAction:v6 forControlEvents:0x2000];
  }
  v66 = v8;
LABEL_16:

  return v8;
}

- (id)_makeXmarkImageView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  v4 = (void *)[v2 initWithImage:v3];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v4 setTintColor:v5];

  objc_msgSend(v4, "_sf_setMatchesIntrinsicContentSize");

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFCloseButton;
  [(SFCloseButton *)&v3 layoutSubviews];
  [(SFCloseButton *)self bounds];
  [(UIVisualEffectView *)self->_blurEffectView _setContinuousCornerRadius:CGRectGetWidth(v4) * 0.5];
  [(SFCloseButton *)self bounds];
  [(UIView *)self->_opaqueBackgroundView _setContinuousCornerRadius:CGRectGetWidth(v5) * 0.5];
}

- (UIImageView)imageView
{
  p_opaqueImageView = &self->_opaqueImageView;
  [(UIImageView *)self->_opaqueImageView alpha];
  if (v4 == 0.0) {
    p_opaqueImageView = &self->_imageView;
  }
  CGRect v5 = *p_opaqueImageView;

  return v5;
}

- (void)setOpaqueBackgroundVisibility:(double)a3
{
  if (self->_style == 2 && self->_opaqueBackgroundVisibility != a3)
  {
    self->_opaqueBackgroundVisibility = a3;
    [(UIView *)self->_opaqueBackgroundView setAlpha:a3];
    double v5 = 1.0 - a3;
    [(UIVisualEffectView *)self->_vibrantEffectView setAlpha:v5];
    blurEffectView = self->_blurEffectView;
    [(UIVisualEffectView *)blurEffectView setAlpha:v5];
  }
}

- (double)opaqueBackgroundVisibility
{
  return self->_opaqueBackgroundVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueBackgroundView, 0);
  objc_storeStrong((id *)&self->_opaqueImageView, 0);
  objc_storeStrong((id *)&self->_vibrantEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end