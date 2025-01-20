@interface SFSiteCardSourceView
- (NSString)text;
- (SFSiteCardSourceView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SFSiteCardSourceView

- (SFSiteCardSourceView)initWithFrame:(CGRect)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)SFSiteCardSourceView;
  v3 = -[SFSiteCardSourceView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFSiteCardSourceView *)v3 setTintAdjustmentMode:1];
    v5 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(SFSiteCardSourceView *)v4 setTintColor:v5];

    v34 = [(SFSiteCardSourceView *)v4 contentView];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    v8 = (void *)MEMORY[0x1E4FB1830];
    v9 = subtitleFont();
    v10 = [v8 configurationWithFont:v9];
    [(UIImageView *)v4->_imageView setPreferredSymbolConfiguration:v10];

    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_imageView _sf_setMatchesIntrinsicContentSize];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v4->_label;
    v4->_label = v11;

    v13 = subtitleFont();
    [(UILabel *)v4->_label setFont:v13];

    [(UILabel *)v4->_label setNumberOfLines:1];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_label setTextColor:v14];

    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_label _setUseShortcutIntrinsicContentSize:1];
    [(UILabel *)v4->_label setAdjustsFontForContentSizeCategory:1];
    id v15 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v37[0] = v4->_imageView;
    v37[1] = v4->_label;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v17 = (void *)[v15 initWithArrangedSubviews:v16];

    [v17 setAxis:0];
    [v17 setSpacing:3.0];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v34 addSubview:v17];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [v17 leadingAnchor];
    v32 = [(SFSiteCardSourceView *)v4 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v36[0] = v31;
    v30 = [v17 trailingAnchor];
    v29 = [(SFSiteCardSourceView *)v4 trailingAnchor];
    v18 = [v30 constraintEqualToAnchor:v29];
    v36[1] = v18;
    v19 = [v17 topAnchor];
    v20 = [(SFSiteCardSourceView *)v4 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v36[2] = v21;
    v22 = [v17 bottomAnchor];
    v23 = [(SFSiteCardSourceView *)v4 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v36[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [v28 activateConstraints:v25];

    v26 = v4;
  }

  return v4;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(UIImageView *)imageView setImage:v5];
  int v6 = [v5 _isSymbolImage];

  v7 = self->_imageView;

  [(UIImageView *)v7 setHidden:v6 ^ 1u];
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end