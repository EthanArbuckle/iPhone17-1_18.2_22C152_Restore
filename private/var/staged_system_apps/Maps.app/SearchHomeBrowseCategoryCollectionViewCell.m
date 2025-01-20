@interface SearchHomeBrowseCategoryCollectionViewCell
+ (id)identifier;
- (BOOL)canBecomeFirstResponder;
- (NSLayoutConstraint)bottomLabelToBottomConstraint;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageLeadingConstraint;
- (NSLayoutConstraint)imageToLabelConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSLayoutConstraint)topLabelToTopConstraint;
- (NSUUID)updateIdentifier;
- (SearchHomeBrowseCategoryCellSizeController)sizeController;
- (SearchHomeBrowseCategoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)browseImageView;
- (UILabel)titleLabel;
- (void)prepareForReuse;
- (void)setBottomLabelToBottomConstraint:(id)a3;
- (void)setBrowseImageView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageLeadingConstraint:(id)a3;
- (void)setImageToLabelConstraint:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setSizeController:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopLabelToTopConstraint:(id)a3;
- (void)setUpdateIdentifier:(id)a3;
@end

@implementation SearchHomeBrowseCategoryCollectionViewCell

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (SearchHomeBrowseCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v53.receiver = self;
  v53.super_class = (Class)SearchHomeBrowseCategoryCollectionViewCell;
  v3 = -[SearchHomeBrowseCategoryCollectionViewCell initWithFrame:](&v53, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(SearchHomeBrowseCategoryCollectionViewCell *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc_init((Class)UIView);
    [(SearchHomeBrowseCategoryCollectionViewCell *)v3 setBackgroundView:v5];

    v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    browseImageView = v3->_browseImageView;
    v3->_browseImageView = v6;

    [(UIImageView *)v3->_browseImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = +[UIColor clearColor];
    [(UIImageView *)v3->_browseImageView setBackgroundColor:v8];

    LODWORD(v9) = 1148846080;
    [(UIImageView *)v3->_browseImageView setContentHuggingPriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [(UIImageView *)v3->_browseImageView setContentCompressionResistancePriority:0 forAxis:v10];
    [(UIImageView *)v3->_browseImageView setAccessibilityIdentifier:@"SearchHomeBrowseCategoryIcon"];
    v11 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    [v11 addSubview:v3->_browseImageView];

    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v12;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[UIColor clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v14];

    v15 = +[UIFont system17];
    [(UILabel *)v3->_titleLabel setFont:v15];

    [(UILabel *)v3->_titleLabel setAccessibilityIdentifier:@"SearchHomeBrowseCategoryTitle"];
    v16 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    [v16 addSubview:v3->_titleLabel];

    v17 = [(UILabel *)v3->_titleLabel topAnchor];
    v18 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    v19 = [v18 topAnchor];
    uint64_t v20 = [v17 constraintEqualToAnchor:v19];
    topLabelToTopConstraint = v3->_topLabelToTopConstraint;
    v3->_topLabelToTopConstraint = (NSLayoutConstraint *)v20;

    v22 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v23 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    v24 = [v23 bottomAnchor];
    uint64_t v25 = [v22 constraintEqualToAnchor:v24];
    bottomLabelToBottomConstraint = v3->_bottomLabelToBottomConstraint;
    v3->_bottomLabelToBottomConstraint = (NSLayoutConstraint *)v25;

    v27 = [(UIImageView *)v3->_browseImageView leadingAnchor];
    v28 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    v29 = [v28 leadingAnchor];
    uint64_t v30 = [v27 constraintEqualToAnchor:v29];
    imageLeadingConstraint = v3->_imageLeadingConstraint;
    v3->_imageLeadingConstraint = (NSLayoutConstraint *)v30;

    v32 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v33 = [(UIImageView *)v3->_browseImageView trailingAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    imageToLabelConstraint = v3->_imageToLabelConstraint;
    v3->_imageToLabelConstraint = (NSLayoutConstraint *)v34;

    v36 = [(UIImageView *)v3->_browseImageView widthAnchor];
    uint64_t v37 = [v36 constraintEqualToConstant:0.0];
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v37;

    v39 = [(UIImageView *)v3->_browseImageView heightAnchor];
    uint64_t v40 = [v39 constraintEqualToConstant:0.0];
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v40;

    v54[0] = v3->_imageLeadingConstraint;
    v42 = [(UIImageView *)v3->_browseImageView centerYAnchor];
    v43 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    v44 = [v43 centerYAnchor];
    v45 = [v42 constraintEqualToAnchor:v44];
    v54[1] = v45;
    v54[2] = v3->_imageWidthConstraint;
    v54[3] = v3->_imageHeightConstraint;
    v54[4] = v3->_imageToLabelConstraint;
    v46 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v47 = [(SearchHomeBrowseCategoryCollectionViewCell *)v3 contentView];
    v48 = [v47 trailingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    v54[5] = v49;
    v54[6] = v3->_topLabelToTopConstraint;
    v54[7] = v3->_bottomLabelToBottomConstraint;
    v50 = +[NSArray arrayWithObjects:v54 count:8];
    +[NSLayoutConstraint activateConstraints:v50];

    if (sub_1000BBB44(v3) == 5)
    {
      [(SearchHomeBrowseCategoryCollectionViewCell *)v3 _maps_setCollectionViewCellBackgroundConfiguration];
      v51 = +[UIColor systemWhiteColor];
      [(UILabel *)v3->_titleLabel setHighlightedTextColor:v51];
    }
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1000BBB44(self) == 5;
}

- (void)setSizeController:(id)a3
{
  id v33 = a3;
  id v5 = [(SearchHomeBrowseCategoryCollectionViewCell *)self sizeController];
  unsigned __int8 v6 = [v33 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sizeController, a3);
    [v33 labelTopAndBottomPadding];
    double v8 = v7;
    double v9 = [(SearchHomeBrowseCategoryCollectionViewCell *)self topLabelToTopConstraint];
    [v9 setConstant:v8];

    [v33 labelTopAndBottomPadding];
    double v11 = -v10;
    v12 = [(SearchHomeBrowseCategoryCollectionViewCell *)self bottomLabelToBottomConstraint];
    [v12 setConstant:v11];

    v13 = [v33 titleLabelFont];
    v14 = [(SearchHomeBrowseCategoryCollectionViewCell *)self titleLabel];
    [v14 setFont:v13];

    [v33 imageLeadingPadding];
    double v16 = v15;
    v17 = [(SearchHomeBrowseCategoryCollectionViewCell *)self imageLeadingConstraint];
    [v17 setConstant:v16];

    v18 = [(SearchHomeBrowseCategoryCollectionViewCell *)self traitCollection];
    id v19 = [v18 userInterfaceIdiom];

    if (v19 == (id)5)
    {
      uint64_t v20 = [(SearchHomeBrowseCategoryCollectionViewCell *)self imageToLabelConstraint];
      v21 = v20;
      double v22 = 10.0;
    }
    else
    {
      [v33 imageToLabelPadding];
      double v24 = v23;
      uint64_t v20 = [(SearchHomeBrowseCategoryCollectionViewCell *)self imageToLabelConstraint];
      v21 = v20;
      double v22 = v24;
    }
    [v20 setConstant:v22];

    uint64_t v25 = [(SearchHomeBrowseCategoryCollectionViewCell *)self sizeController];
    [v25 imageSize];
    double v27 = v26;
    v28 = [(SearchHomeBrowseCategoryCollectionViewCell *)self imageWidthConstraint];
    [v28 setConstant:v27];

    v29 = [(SearchHomeBrowseCategoryCollectionViewCell *)self sizeController];
    [v29 imageSize];
    double v31 = v30;
    v32 = [(SearchHomeBrowseCategoryCollectionViewCell *)self imageHeightConstraint];
    [v32 setConstant:v31];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)SearchHomeBrowseCategoryCollectionViewCell;
  [(SearchHomeBrowseCategoryCollectionViewCell *)&v5 prepareForReuse];
  v3 = [(SearchHomeBrowseCategoryCollectionViewCell *)self browseImageView];
  [v3 setImage:0];

  v4 = [(SearchHomeBrowseCategoryCollectionViewCell *)self titleLabel];
  [v4 setText:0];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchHomeBrowseCategoryCollectionViewCell *)self browseImageView];
  [v5 setImage:v4];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchHomeBrowseCategoryCollectionViewCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
}

- (SearchHomeBrowseCategoryCellSizeController)sizeController
{
  return self->_sizeController;
}

- (UIImageView)browseImageView
{
  return self->_browseImageView;
}

- (void)setBrowseImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)topLabelToTopConstraint
{
  return self->_topLabelToTopConstraint;
}

- (void)setTopLabelToTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomLabelToBottomConstraint
{
  return self->_bottomLabelToBottomConstraint;
}

- (void)setBottomLabelToBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageToLabelConstraint
{
  return self->_imageToLabelConstraint;
}

- (void)setImageToLabelConstraint:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageToLabelConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelToTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_browseImageView, 0);
  objc_storeStrong((id *)&self->_sizeController, 0);

  objc_storeStrong((id *)&self->_updateIdentifier, 0);
}

@end