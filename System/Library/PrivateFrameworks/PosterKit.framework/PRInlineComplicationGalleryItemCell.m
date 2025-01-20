@interface PRInlineComplicationGalleryItemCell
+ (double)checkmarkInset;
+ (double)suggestionInset;
- (BOOL)isSeparatorVisible;
- (BOOL)showsCheckmark;
- (NSString)title;
- (PRInlineComplicationGalleryItemCell)initWithFrame:(CGRect)a3;
- (UIImage)iconImage;
- (UIViewController)contentViewController;
- (void)prepareForReuse;
- (void)setContentViewController:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setSeparatorVisible:(BOOL)a3;
- (void)setShowsCheckmark:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PRInlineComplicationGalleryItemCell

+ (double)suggestionInset
{
  return 52.0;
}

+ (double)checkmarkInset
{
  return 48.0;
}

- (PRInlineComplicationGalleryItemCell)initWithFrame:(CGRect)a3
{
  v64[2] = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)PRInlineComplicationGalleryItemCell;
  v3 = -[PRInlineComplicationGalleryItemCell initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    widgetContainerView = v3->_widgetContainerView;
    v3->_widgetContainerView = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v6;

    v8 = v3->_label;
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = v3->_label;
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v3->_label setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_label setAlpha:0.6];
    id v12 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v64[0] = v3->_widgetContainerView;
    v64[1] = v3->_label;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
    v14 = (void *)[v12 initWithArrangedSubviews:v13];

    [v14 setAxis:1];
    v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v15;

    [(UIImageView *)v3->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = [(UIImageView *)v3->_iconImageView widthAnchor];
    v19 = [v18 constraintEqualToConstant:40.0];
    v63[0] = v19;
    v20 = [(UIImageView *)v3->_iconImageView heightAnchor];
    v21 = [v20 constraintEqualToConstant:40.0];
    v63[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    [v17 activateConstraints:v22];

    id v23 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v62[0] = v3->_iconImageView;
    v62[1] = v14;
    v24 = v14;
    v59 = v14;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    v26 = (void *)[v23 initWithArrangedSubviews:v25];

    [v26 setSpacing:12.0];
    [v26 setAlignment:3];
    [v26 setUserInteractionEnabled:0];
    v27 = [(PRInlineComplicationGalleryItemCell *)v3 contentView];
    [v27 addSubview:v26];

    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = [v26 leadingAnchor];
    v29 = [(PRInlineComplicationGalleryItemCell *)v3 contentView];
    v30 = [v29 leadingAnchor];
    uint64_t v31 = [v28 constraintEqualToAnchor:v30 constant:8.0];
    leadingConstraint = v3->_leadingConstraint;
    v3->_leadingConstraint = (NSLayoutConstraint *)v31;

    v52 = (void *)MEMORY[0x1E4F28DC8];
    v61[0] = v3->_leadingConstraint;
    v57 = [v26 trailingAnchor];
    v58 = [(PRInlineComplicationGalleryItemCell *)v3 contentView];
    v56 = [v58 trailingAnchor];
    v55 = [v57 constraintLessThanOrEqualToAnchor:v56 constant:-8.0];
    v61[1] = v55;
    v53 = [v26 topAnchor];
    v54 = [(PRInlineComplicationGalleryItemCell *)v3 contentView];
    v51 = [v54 topAnchor];
    v50 = [v53 constraintEqualToAnchor:v51 constant:8.0];
    v61[2] = v50;
    v49 = [v26 bottomAnchor];
    v33 = [(PRInlineComplicationGalleryItemCell *)v3 contentView];
    v34 = [v33 bottomAnchor];
    v35 = [v49 constraintEqualToAnchor:v34 constant:-8.0];
    v61[3] = v35;
    v36 = [(PRInlineComplicationGalleryItemCell *)v3 separatorLayoutGuide];
    v37 = [v36 leadingAnchor];
    v38 = [v24 leadingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v61[4] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];
    [v52 activateConstraints:v40];

    v41 = (UICellAccessory *)objc_alloc_init(MEMORY[0x1E4FB14F8]);
    checkmarkAccessory = v3->_checkmarkAccessory;
    v3->_checkmarkAccessory = v41;

    v43 = v3->_checkmarkAccessory;
    v44 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UICellAccessory *)v43 setTintColor:v44];

    v45 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    v46 = [MEMORY[0x1E4FB1618] blackColor];
    v47 = [v46 colorWithAlphaComponent:0.3];
    [v45 setBackgroundColor:v47];

    [(PRInlineComplicationGalleryItemCell *)v3 setBackgroundConfiguration:v45];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationGalleryItemCell;
  [(PRInlineComplicationGalleryItemCell *)&v3 prepareForReuse];
  [(PRInlineComplicationGalleryItemCell *)self setContentViewController:0];
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  if (a3) {
    double v5 = 8.0;
  }
  else {
    double v5 = 16.0;
  }
  [(UIImageView *)self->_iconImageView setHidden:a3 == 0];
  leadingConstraint = self->_leadingConstraint;
  [(NSLayoutConstraint *)leadingConstraint setConstant:v5];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconImageView image];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_label text];
}

- (void)setContentViewController:(id)a3
{
  v29[5] = *MEMORY[0x1E4F143B8];
  double v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v5)
  {
    v8 = [(UIViewController *)contentViewController view];
    v9 = [(PRInlineComplicationGalleryItemCell *)self contentView];
    int v10 = [v8 isDescendantOfView:v9];

    if (v10)
    {
      v11 = [(UIViewController *)*p_contentViewController parentViewController];
      objc_msgSend(v11, "bs_removeChildViewController:", *p_contentViewController);
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      id v12 = [(UIViewController *)*p_contentViewController view];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_widgetContainerView addSubview:v12];
      id v23 = (void *)MEMORY[0x1E4F28DC8];
      v28 = [v12 heightAnchor];
      v27 = [v28 constraintEqualToConstant:26.0];
      v29[0] = v27;
      v26 = [v12 leadingAnchor];
      v25 = [(UIView *)self->_widgetContainerView leadingAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v29[1] = v24;
      v22 = [v12 trailingAnchor];
      v21 = [(UIView *)self->_widgetContainerView trailingAnchor];
      v13 = [v22 constraintEqualToAnchor:v21];
      v29[2] = v13;
      v14 = [v12 topAnchor];
      v15 = [(UIView *)self->_widgetContainerView topAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v29[3] = v16;
      v17 = [v12 bottomAnchor];
      v18 = [(UIView *)self->_widgetContainerView bottomAnchor];
      v19 = [v17 constraintEqualToAnchor:v18];
      v29[4] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
      [v23 activateConstraints:v20];
    }
  }
}

- (BOOL)showsCheckmark
{
  v2 = self;
  objc_super v3 = [(PRInlineComplicationGalleryItemCell *)self accessories];
  LOBYTE(v2) = [v3 containsObject:v2->_checkmarkAccessory];

  return (char)v2;
}

- (void)setShowsCheckmark:(BOOL)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6[0] = self->_checkmarkAccessory;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(PRInlineComplicationGalleryItemCell *)self setAccessories:v4];
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    [(PRInlineComplicationGalleryItemCell *)self setAccessories:v5];
  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (void)setSeparatorVisible:(BOOL)a3
{
  self->_separatorVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkAccessory, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_widgetContainerView, 0);
}

@end