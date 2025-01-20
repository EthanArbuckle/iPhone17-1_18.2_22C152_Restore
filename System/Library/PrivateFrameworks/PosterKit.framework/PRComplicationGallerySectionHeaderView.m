@interface PRComplicationGallerySectionHeaderView
+ (CGSize)iconImageSize;
- (NSString)title;
- (PRComplicationGallerySectionHeaderView)initWithFrame:(CGRect)a3;
- (UIImage)iconImage;
- (void)prepareForReuse;
- (void)setIconImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PRComplicationGallerySectionHeaderView

- (PRComplicationGallerySectionHeaderView)initWithFrame:(CGRect)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PRComplicationGallerySectionHeaderView;
  v3 = -[PRComplicationGallerySectionHeaderView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    LODWORD(v6) = 1148846080;
    [(UIImageView *)v3->_iconImageView setContentCompressionResistancePriority:1 forAxis:v6];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v7;

    v9 = v3->_label;
    v10 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v9 setTextColor:v10];

    v11 = v3->_label;
    v12 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] weight:*MEMORY[0x1E4FB09E0]];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v3->_label setAdjustsFontForContentSizeCategory:1];
    id v13 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v37[0] = v3->_iconImageView;
    v37[1] = v3->_label;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v15 = (void *)[v13 initWithArrangedSubviews:v14];

    [v15 setAlignment:3];
    [v15 setSpacing:8.0];
    [(PRComplicationGallerySectionHeaderView *)v3 addSubview:v15];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UIImageView *)v3->_iconImageView widthAnchor];
    v33 = [v34 constraintEqualToConstant:24.0];
    v36[0] = v33;
    v32 = [(UIImageView *)v3->_iconImageView heightAnchor];
    v31 = [v32 constraintEqualToConstant:24.0];
    v36[1] = v31;
    v30 = [v15 leadingAnchor];
    v29 = [(PRComplicationGallerySectionHeaderView *)v3 leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:8.0];
    v36[2] = v28;
    v26 = [v15 trailingAnchor];
    v25 = [(PRComplicationGallerySectionHeaderView *)v3 trailingAnchor];
    v16 = [v26 constraintLessThanOrEqualToAnchor:v25 constant:-8.0];
    v36[3] = v16;
    v17 = [v15 topAnchor];
    v18 = [(PRComplicationGallerySectionHeaderView *)v3 topAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v36[4] = v19;
    v20 = [v15 bottomAnchor];
    v21 = [(PRComplicationGallerySectionHeaderView *)v3 bottomAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v36[5] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:6];
    [v27 activateConstraints:v23];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGallerySectionHeaderView;
  [(PRComplicationGallerySectionHeaderView *)&v3 prepareForReuse];
  [(UIImageView *)self->_iconImageView setHidden:0];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_label text];
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  iconImageView = self->_iconImageView;
  [(UIImageView *)iconImageView setHidden:a3 == 0];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconImageView image];
}

+ (CGSize)iconImageSize
{
  double v2 = 24.0;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end