@interface ICPaperStyleHeaderView
- (ICPaperStyleHeaderView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)labelConstraintBottom;
- (NSLayoutConstraint)labelConstraintLeading;
- (NSLayoutConstraint)labelConstraintTop;
- (NSLayoutConstraint)labelConstraintTrailing;
- (NSString)title;
- (UIEdgeInsets)titleInsets;
- (UILabel)label;
- (void)contentSizeCategoryDidChange;
- (void)setLabel:(id)a3;
- (void)setLabelConstraintBottom:(id)a3;
- (void)setLabelConstraintLeading:(id)a3;
- (void)setLabelConstraintTop:(id)a3;
- (void)setLabelConstraintTrailing:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleInsets:(UIEdgeInsets)a3;
@end

@implementation ICPaperStyleHeaderView

- (ICPaperStyleHeaderView)initWithFrame:(CGRect)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)ICPaperStyleHeaderView;
  v3 = -[ICPaperStyleHeaderView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(ICPaperStyleHeaderView *)v3 setLabel:v4];

    v5 = [(ICPaperStyleHeaderView *)v3 label];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(ICPaperStyleHeaderView *)v3 label];
    [v6 setTextAlignment:1];

    v7 = [(ICPaperStyleHeaderView *)v3 label];
    [v7 setNumberOfLines:0];

    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    }
    else {
    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    v9 = [(ICPaperStyleHeaderView *)v3 label];
    [v9 setTextColor:v8];

    v10 = [(ICPaperStyleHeaderView *)v3 label];
    [(ICPaperStyleHeaderView *)v3 addSubview:v10];

    v11 = [MEMORY[0x1E4FB1618] ICGroupedBackgroundColor];
    [(ICPaperStyleHeaderView *)v3 setBackgroundColor:v11];

    v30 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(ICPaperStyleHeaderView *)v3 label];
    v33 = [v34 leadingAnchor];
    v32 = [(ICPaperStyleHeaderView *)v3 leadingAnchor];
    uint64_t v12 = [v33 constraintEqualToAnchor:v32];
    labelConstraintLeading = v3->_labelConstraintLeading;
    v3->_labelConstraintLeading = (NSLayoutConstraint *)v12;

    v36[0] = v12;
    v31 = [(ICPaperStyleHeaderView *)v3 label];
    v14 = [v31 topAnchor];
    v15 = [(ICPaperStyleHeaderView *)v3 topAnchor];
    uint64_t v16 = [v14 constraintEqualToAnchor:v15];
    labelConstraintTop = v3->_labelConstraintTop;
    v3->_labelConstraintTop = (NSLayoutConstraint *)v16;

    v36[1] = v16;
    v18 = [(ICPaperStyleHeaderView *)v3 label];
    v19 = [v18 trailingAnchor];
    v20 = [(ICPaperStyleHeaderView *)v3 trailingAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    labelConstraintTrailing = v3->_labelConstraintTrailing;
    v3->_labelConstraintTrailing = (NSLayoutConstraint *)v21;

    v36[2] = v21;
    v23 = [(ICPaperStyleHeaderView *)v3 label];
    v24 = [v23 bottomAnchor];
    v25 = [(ICPaperStyleHeaderView *)v3 bottomAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25];
    labelConstraintBottom = v3->_labelConstraintBottom;
    v3->_labelConstraintBottom = (NSLayoutConstraint *)v26;

    v36[3] = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [v30 activateConstraints:v28];

    [(ICPaperStyleHeaderView *)v3 contentSizeCategoryDidChange];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ICPaperStyleHeaderView *)self label];
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = [(ICPaperStyleHeaderView *)self label];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v8 = [(ICPaperStyleHeaderView *)self labelConstraintLeading];
  [v8 setConstant:left];

  v9 = [(ICPaperStyleHeaderView *)self labelConstraintTop];
  [v9 setConstant:top];

  v10 = [(ICPaperStyleHeaderView *)self labelConstraintTrailing];
  [v10 setConstant:-right];

  id v11 = [(ICPaperStyleHeaderView *)self labelConstraintBottom];
  [v11 setConstant:-bottom];
}

- (UIEdgeInsets)titleInsets
{
  v3 = [(ICPaperStyleHeaderView *)self labelConstraintTop];
  [v3 constant];
  double v5 = v4;
  v6 = [(ICPaperStyleHeaderView *)self labelConstraintLeading];
  [v6 constant];
  double v8 = v7;
  v9 = [(ICPaperStyleHeaderView *)self labelConstraintBottom];
  [v9 constant];
  double v11 = -v10;
  uint64_t v12 = [(ICPaperStyleHeaderView *)self labelConstraintTrailing];
  [v12 constant];
  double v14 = -v13;

  double v15 = v5;
  double v16 = v8;
  double v17 = v11;
  double v18 = v14;
  result.double right = v18;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (void)contentSizeCategoryDidChange
{
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v3 = objc_msgSend(v5, "ic_fontWithSingleLineA");
  double v4 = [(ICPaperStyleHeaderView *)self label];
  [v4 setFont:v3];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSLayoutConstraint)labelConstraintLeading
{
  return self->_labelConstraintLeading;
}

- (void)setLabelConstraintLeading:(id)a3
{
}

- (NSLayoutConstraint)labelConstraintTop
{
  return self->_labelConstraintTop;
}

- (void)setLabelConstraintTop:(id)a3
{
}

- (NSLayoutConstraint)labelConstraintTrailing
{
  return self->_labelConstraintTrailing;
}

- (void)setLabelConstraintTrailing:(id)a3
{
}

- (NSLayoutConstraint)labelConstraintBottom
{
  return self->_labelConstraintBottom;
}

- (void)setLabelConstraintBottom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraintBottom, 0);
  objc_storeStrong((id *)&self->_labelConstraintTrailing, 0);
  objc_storeStrong((id *)&self->_labelConstraintTop, 0);
  objc_storeStrong((id *)&self->_labelConstraintLeading, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end