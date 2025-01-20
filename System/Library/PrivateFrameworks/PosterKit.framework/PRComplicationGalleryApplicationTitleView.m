@interface PRComplicationGalleryApplicationTitleView
+ (CGSize)iconImageSize;
- (CGSize)imageSize;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSLayoutAnchor)titleLabelLeadingAnchor;
- (NSLayoutConstraint)contentBottomConstraint;
- (NSLayoutConstraint)contentLeadingConstraint;
- (NSLayoutConstraint)contentTopConstraint;
- (NSLayoutConstraint)contentTrailingConstraint;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSString)title;
- (PRComplicationGalleryApplicationTitleView)initWithFrame:(CGRect)a3;
- (UIImage)iconImage;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (id)_textLabelFont;
- (unint64_t)_textLabelNumberOfLines;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)setContentBottomConstraint:(id)a3;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setContentLeadingConstraint:(id)a3;
- (void)setContentTopConstraint:(id)a3;
- (void)setContentTrailingConstraint:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageView:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PRComplicationGalleryApplicationTitleView

- (PRComplicationGalleryApplicationTitleView)initWithFrame:(CGRect)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)PRComplicationGalleryApplicationTitleView;
  v3 = -[PRComplicationGalleryApplicationTitleView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v5 = (void *)*((void *)v3 + 52);
    *((void *)v3 + 52) = v4;

    [*((id *)v3 + 52) setContentMode:1];
    [*((id *)v3 + 52) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:*((void *)v3 + 52)];
    *(int64x2_t *)(v3 + 472) = vdupq_n_s64(0x4048000000000000uLL);
    v6 = [*((id *)v3 + 52) widthAnchor];
    uint64_t v7 = [v6 constraintEqualToConstant:48.0];
    v8 = (void *)*((void *)v3 + 53);
    *((void *)v3 + 53) = v7;

    LODWORD(v9) = 1148829696;
    [*((id *)v3 + 53) setPriority:v9];
    v10 = [*((id *)v3 + 52) heightAnchor];
    uint64_t v11 = [v10 constraintEqualToConstant:48.0];
    v12 = (void *)*((void *)v3 + 54);
    *((void *)v3 + 54) = v11;

    LODWORD(v13) = 1148829696;
    [*((id *)v3 + 54) setPriority:v13];
    v14 = (void *)MEMORY[0x1E4F28DC8];
    v47[0] = *((void *)v3 + 53);
    v47[1] = *((void *)v3 + 54);
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    [v14 activateConstraints:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v17 = (void *)*((void *)v3 + 51);
    *((void *)v3 + 51) = v16;

    v18 = (void *)*((void *)v3 + 51);
    v19 = [v3 _textLabelFont];
    [v18 setFont:v19];

    objc_msgSend(*((id *)v3 + 51), "setNumberOfLines:", objc_msgSend(v3, "_textLabelNumberOfLines"));
    LODWORD(v20) = 1148846080;
    [*((id *)v3 + 51) setContentCompressionResistancePriority:1 forAxis:v20];
    id v21 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v46[0] = *((void *)v3 + 52);
    v46[1] = *((void *)v3 + 51);
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    v23 = (void *)[v21 initWithArrangedSubviews:v22];

    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v23 setAxis:0];
    [v23 setSpacing:16.0];
    [v3 addSubview:v23];
    v24 = [v23 leadingAnchor];
    v25 = [v3 leadingAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25];
    v27 = (void *)*((void *)v3 + 55);
    *((void *)v3 + 55) = v26;

    v28 = [v23 trailingAnchor];
    v29 = [v3 trailingAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29];
    v31 = (void *)*((void *)v3 + 56);
    *((void *)v3 + 56) = v30;

    v32 = [v23 topAnchor];
    v33 = [v3 topAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    v35 = (void *)*((void *)v3 + 57);
    *((void *)v3 + 57) = v34;

    v36 = [v23 bottomAnchor];
    v37 = [v3 bottomAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37];
    v39 = (void *)*((void *)v3 + 58);
    *((void *)v3 + 58) = v38;

    v45[0] = *((void *)v3 + 55);
    v45[1] = *((void *)v3 + 56);
    v40 = (void *)MEMORY[0x1E4F28DC8];
    v45[2] = *((void *)v3 + 57);
    v45[3] = *((void *)v3 + 58);
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v40 activateConstraints:v41];

    objc_msgSend(v3, "setContentInsets:", 12.0, 27.0, 12.0, 27.0);
    v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 addObserver:v3 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return (PRComplicationGalleryApplicationTitleView *)v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PRComplicationGalleryApplicationTitleView;
  [(PRComplicationGalleryApplicationTitleView *)&v4 dealloc];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_textLabel text];
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:");
  imageView = self->_imageView;
  [(UIImageView *)imageView setHidden:a3 == 0];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_imageView image];
}

- (NSLayoutAnchor)titleLabelLeadingAnchor
{
  return (NSLayoutAnchor *)[(UILabel *)self->_textLabel leadingAnchor];
}

- (void)setImageSize:(CGSize)a3
{
  p_imageSize = &self->_imageSize;
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    p_imageSize->width = a3.width;
    self->_imageSize.double height = a3.height;
    -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");
    double height = p_imageSize->height;
    imageHeightConstraint = self->_imageHeightConstraint;
    [(NSLayoutConstraint *)imageHeightConstraint setConstant:height];
  }
}

+ (CGSize)iconImageSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.double height = v3;
  result.width = v2;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  p_contentInsets = &self->_contentInsets;
  if (self->_contentInsets.leading != a3.leading
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.trailing != a3.trailing
    || self->_contentInsets.bottom != a3.bottom)
  {
    p_contentInsets->top = a3.top;
    self->_contentInsets.leading = a3.leading;
    self->_contentInsets.bottom = a3.bottom;
    self->_contentInsets.trailing = a3.trailing;
    [(NSLayoutConstraint *)self->_contentLeadingConstraint setConstant:a3.leading];
    [(NSLayoutConstraint *)self->_contentTrailingConstraint setConstant:-p_contentInsets->trailing];
    [(NSLayoutConstraint *)self->_contentTopConstraint setConstant:p_contentInsets->top];
    contentBottomConstraint = self->_contentBottomConstraint;
    double v9 = -p_contentInsets->bottom;
    [(NSLayoutConstraint *)contentBottomConstraint setConstant:v9];
  }
}

- (id)_textLabelFont
{
  double v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  v5 = [(PRComplicationGalleryApplicationTitleView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:4 contentSizeCategory:v6];

  return v7;
}

- (unint64_t)_textLabelNumberOfLines
{
  double v2 = [(PRComplicationGalleryApplicationTitleView *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  if (v3)
  {
    if (UIContentSizeCategoryIsAccessibilityCategory(v3)) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 1;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v5 = [(PRComplicationGalleryApplicationTitleView *)self textLabel];
  unint64_t v4 = [(PRComplicationGalleryApplicationTitleView *)self _textLabelFont];
  [v5 setFont:v4];

  objc_msgSend(v5, "setNumberOfLines:", -[PRComplicationGalleryApplicationTitleView _textLabelNumberOfLines](self, "_textLabelNumberOfLines"));
  [(PRComplicationGalleryApplicationTitleView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRComplicationGalleryApplicationTitleView;
  id v4 = a3;
  [(PRComplicationGalleryApplicationTitleView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(PRComplicationGalleryApplicationTitleView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(PRComplicationGalleryApplicationTitleView *)self _contentSizeCategoryDidChange:0];
  }
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentLeadingConstraint
{
  return self->_contentLeadingConstraint;
}

- (void)setContentLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentTrailingConstraint
{
  return self->_contentTrailingConstraint;
}

- (void)setContentTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentTopConstraint
{
  return self->_contentTopConstraint;
}

- (void)setContentTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentBottomConstraint
{
  return self->_contentBottomConstraint;
}

- (void)setContentBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end