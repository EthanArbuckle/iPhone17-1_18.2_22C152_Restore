@interface TabThumbnailCloseButton
+ (UIColor)backgroundColor;
+ (double)defaultButtonSize;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (TabThumbnailCloseButton)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
@end

@implementation TabThumbnailCloseButton

+ (UIColor)backgroundColor
{
  v2 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  v3 = [v2 colorWithAlphaComponent:0.85];

  return (UIColor *)v3;
}

- (TabThumbnailCloseButton)initWithFrame:(CGRect)a3
{
  v58[12] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)TabThumbnailCloseButton;
  v3 = -[TabThumbnailCloseButton initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    backdropEffectView = v3->_backdropEffectView;
    v3->_backdropEffectView = v4;

    [(UIVisualEffectView *)v3->_backdropEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TabThumbnailCloseButton *)v3 addSubview:v3->_backdropEffectView];
    v6 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    vibrantEffectView = v3->_vibrantEffectView;
    v3->_vibrantEffectView = v6;

    [(UIVisualEffectView *)v3->_vibrantEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TabThumbnailCloseButton *)v3 addSubview:v3->_vibrantEffectView];
    v8 = [(UIVisualEffectView *)v3->_vibrantEffectView contentView];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    uint64_t v11 = [v9 initWithImage:v10];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v11;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:12.0];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v13];

    [(UIImageView *)v3->_imageView _sf_setMatchesIntrinsicContentSize];
    [v8 addSubview:v3->_imageView];
    if (usesVibrantAppearance_onceToken != -1) {
      dispatch_once(&usesVibrantAppearance_onceToken, &__block_literal_global_61);
    }
    if (usesVibrantAppearance_flag)
    {
      v14 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
      [(UIVisualEffectView *)v3->_backdropEffectView setEffect:v14];
      v15 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v14 style:1];
      [(UIVisualEffectView *)v3->_vibrantEffectView setEffect:v15];
    }
    else
    {
      v16 = [(id)objc_opt_class() backgroundColor];
      v17 = [(UIVisualEffectView *)v3->_backdropEffectView contentView];
      [v17 setBackgroundColor:v16];

      v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UIImageView *)v3->_imageView setTintColor:v14];
    }

    v42 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(UIVisualEffectView *)v3->_backdropEffectView centerXAnchor];
    v55 = [(TabThumbnailCloseButton *)v3 centerXAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v58[0] = v54;
    v53 = [(UIVisualEffectView *)v3->_backdropEffectView centerYAnchor];
    v52 = [(TabThumbnailCloseButton *)v3 centerYAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v58[1] = v51;
    v50 = [(UIVisualEffectView *)v3->_backdropEffectView widthAnchor];
    v49 = [(TabThumbnailCloseButton *)v3 widthAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v58[2] = v48;
    v47 = [(UIVisualEffectView *)v3->_backdropEffectView heightAnchor];
    v46 = [(TabThumbnailCloseButton *)v3 heightAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v58[3] = v45;
    v44 = [(UIVisualEffectView *)v3->_vibrantEffectView centerXAnchor];
    v43 = [(TabThumbnailCloseButton *)v3 centerXAnchor];
    v41 = [v44 constraintEqualToAnchor:v43];
    v58[4] = v41;
    v40 = [(UIVisualEffectView *)v3->_vibrantEffectView centerYAnchor];
    v39 = [(TabThumbnailCloseButton *)v3 centerYAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v58[5] = v38;
    v36 = [(UIVisualEffectView *)v3->_vibrantEffectView widthAnchor];
    v35 = [(TabThumbnailCloseButton *)v3 widthAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v58[6] = v34;
    v33 = [(UIVisualEffectView *)v3->_vibrantEffectView heightAnchor];
    v32 = [(TabThumbnailCloseButton *)v3 heightAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v58[7] = v31;
    v30 = [(UIImageView *)v3->_imageView centerXAnchor];
    v29 = [v8 centerXAnchor];
    v18 = [v30 constraintEqualToAnchor:v29];
    v58[8] = v18;
    v19 = [(UIImageView *)v3->_imageView centerYAnchor];
    v20 = [v8 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v58[9] = v21;
    v22 = [(TabThumbnailCloseButton *)v3 widthAnchor];
    [(id)objc_opt_class() defaultButtonSize];
    objc_msgSend(v22, "constraintEqualToConstant:");
    v23 = v37 = v8;
    v58[10] = v23;
    v24 = [(TabThumbnailCloseButton *)v3 heightAnchor];
    [(id)objc_opt_class() defaultButtonSize];
    v25 = objc_msgSend(v24, "constraintEqualToConstant:");
    v58[11] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:12];
    [v42 activateConstraints:v26];

    v27 = v3;
  }

  return v3;
}

+ (double)defaultButtonSize
{
  return 22.0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TabThumbnailCloseButton;
  [(TabThumbnailCloseButton *)&v3 layoutSubviews];
  [(UIVisualEffectView *)self->_backdropEffectView frame];
  [(UIVisualEffectView *)self->_backdropEffectView _setCornerRadius:CGRectGetWidth(v4) * 0.5];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LODWORD(self) = [(TabThumbnailCloseButton *)self isEnabled] ^ 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TabThumbnailCloseButton;
    LOBYTE(self) = [(TabThumbnailCloseButton *)&v6 gestureRecognizerShouldBegin:v4];
  }

  return (char)self;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_vibrantEffectView, 0);
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
}

@end