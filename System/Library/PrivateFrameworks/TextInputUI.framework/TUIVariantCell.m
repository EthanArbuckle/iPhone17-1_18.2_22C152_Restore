@interface TUIVariantCell
- (BOOL)isHighlighted;
- (BOOL)isPrimaryVariant;
- (BOOL)requiresConstraintBasedLayout;
- (NSArray)cellConstraints;
- (NSString)displayString;
- (TUIVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6;
- (UIEdgeInsets)annotationLabelInsets;
- (UIEdgeInsets)backgroundInsets;
- (UIEdgeInsets)labelInsets;
- (UIKBRenderTraits)traits;
- (UILabel)annotationLabelView;
- (UILabel)labelView;
- (UIView)backgroundView;
- (double)backgroundCornerRadius;
- (id)constraintsToEmbedView:(id)a3 withinView:(id)a4 withInsets:(UIEdgeInsets)a5;
- (id)fontForSymbolStyle:(id)a3;
- (id)highlightColor;
- (id)unhighlightedTextColor;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)backgroundMaskedCorners;
- (unint64_t)indexNumber;
- (void)layoutSubviews;
- (void)setCellConstraints:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIndexNumber:(unint64_t)a3;
- (void)setPrimaryVariant:(BOOL)a3;
- (void)setTraits:(id)a3;
- (void)transitionToHighlighted:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation TUIVariantCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConstraints, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_annotationLabelView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

- (void)setCellConstraints:(id)a3
{
}

- (NSArray)cellConstraints
{
  return self->_cellConstraints;
}

- (void)setTraits:(id)a3
{
}

- (UIKBRenderTraits)traits
{
  return self->_traits;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UILabel)annotationLabelView
{
  return self->_annotationLabelView;
}

- (UILabel)labelView
{
  return self->_labelView;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setPrimaryVariant:(BOOL)a3
{
  self->_primaryVariant = a3;
}

- (BOOL)isPrimaryVariant
{
  return self->_primaryVariant;
}

- (void)setIndexNumber:(unint64_t)a3
{
  self->_indexNumber = a3;
}

- (unint64_t)indexNumber
{
  return self->_indexNumber;
}

- (unint64_t)backgroundMaskedCorners
{
  return 15;
}

- (double)backgroundCornerRadius
{
  return 5.0;
}

- (id)unhighlightedTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)highlightColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBlueColor];
}

- (UIEdgeInsets)annotationLabelInsets
{
  double v2 = 2.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = -2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)labelInsets
{
  double v3 = [(TUIVariantCell *)self traits];
  double v4 = [v3 symbolStyle];
  [v4 textOffset];
  double v6 = v5;
  v7 = [(TUIVariantCell *)self traits];
  v8 = [v7 symbolStyle];
  [v8 textOffset];
  double v10 = v9;

  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v6;
  double v14 = v10;
  result.right = v12;
  result.bottom = v14;
  result.left = v13;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2 = 6.0;
  double v3 = 0.0;
  double v4 = 15.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_labelView;
}

- (id)viewForLastBaselineLayout
{
  return self->_labelView;
}

- (id)constraintsToEmbedView:(id)a3 withinView:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v26[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  v25 = [v11 topAnchor];
  v24 = [v10 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:top];
  v26[0] = v23;
  double v12 = [v11 leadingAnchor];
  double v13 = [v10 leadingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13 constant:left];
  v26[1] = v14;
  v15 = [v10 bottomAnchor];
  v16 = [v11 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:bottom];
  v26[2] = v17;
  v18 = [v10 trailingAnchor];

  v19 = [v11 trailingAnchor];

  v20 = [v18 constraintEqualToAnchor:v19 constant:right];
  v26[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  return v21;
}

- (id)fontForSymbolStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 fontName];
  [v3 fontWeight];
  double v6 = v5;
  [v3 fontSize];
  double v8 = v7;

  int v9 = [v4 isEqualToString:*MEMORY[0x1E4FB2AC0]];
  double v10 = 22.0;
  if (v8 > 0.0) {
    double v10 = v8;
  }
  if (v9) {
    [MEMORY[0x1E4FB08E0] systemFontOfSize:v10 weight:v6];
  }
  else {
  id v11 = [MEMORY[0x1E4FB08E0] fontWithName:v4 size:4096 traits:v10];
  }

  return v11;
}

- (void)transitionToHighlighted:(BOOL)a3
{
  double v5 = 0.0;
  if (a3) {
    double v5 = 1.0;
  }
  [(UIView *)self->_backgroundView setAlpha:v5];
  if (a3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v6 = [(TUIVariantCell *)self unhighlightedTextColor];
  }
  [(UILabel *)self->_labelView setTextColor:v6];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    -[TUIVariantCell transitionToHighlighted:](self, "transitionToHighlighted:");
    self->_highlighted = a3;
  }
}

- (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateConstraints
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(TUIVariantCell *)self cellConstraints];

  if (!v3)
  {
    [(TUIVariantCell *)self labelInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(TUIVariantCell *)self backgroundInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(TUIVariantCell *)self annotationLabelInsets];
    double v37 = v20;
    double v39 = v21;
    v22 = [(TUIVariantCell *)self backgroundView];
    v23 = -[TUIVariantCell constraintsToEmbedView:withinView:withInsets:](self, "constraintsToEmbedView:withinView:withInsets:", v22, self, v13, v15, v17, v19);
    v24 = [(TUIVariantCell *)self labelView];
    v25 = -[TUIVariantCell constraintsToEmbedView:withinView:withInsets:](self, "constraintsToEmbedView:withinView:withInsets:", v24, v22, v5, v7, v9, v11);

    v26 = [v23 arrayByAddingObjectsFromArray:v25];
    v27 = [(TUIVariantCell *)self annotationLabelView];
    v28 = v27;
    if (v27)
    {
      v36 = [v27 topAnchor];
      v35 = [v22 topAnchor];
      v29 = [v36 constraintEqualToAnchor:v35 constant:v37];
      v41[0] = v29;
      v30 = [v28 trailingAnchor];
      [v22 trailingAnchor];
      v31 = v38 = v23;
      v32 = [v30 constraintEqualToAnchor:v31 constant:v39];
      v41[1] = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];

      uint64_t v34 = [v26 arrayByAddingObjectsFromArray:v33];

      v26 = (void *)v34;
      v23 = v38;
    }
    [(TUIVariantCell *)self setCellConstraints:v26];
    [MEMORY[0x1E4F28DC8] activateConstraints:v26];
  }
  v40.receiver = self;
  v40.super_class = (Class)TUIVariantCell;
  [(TUIVariantCell *)&v40 updateConstraints];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TUIVariantCell;
  [(TUIVariantCell *)&v8 layoutSubviews];
  [(TUIVariantCell *)self backgroundCornerRadius];
  double v4 = v3;
  double v5 = [(UIView *)self->_backgroundView layer];
  [v5 setCornerRadius:v4];

  unint64_t v6 = [(TUIVariantCell *)self backgroundMaskedCorners];
  double v7 = [(UIView *)self->_backgroundView layer];
  [v7 setMaskedCorners:v6];
}

- (TUIVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v42.receiver = self;
  v42.super_class = (Class)TUIVariantCell;
  double v17 = -[TUIVariantCell initWithFrame:](&v42, sel_initWithFrame_, x, y, width, height);
  double v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayString, a4);
    uint64_t v19 = [v16 variantTraits];
    double v20 = (void *)v19;
    if (v19) {
      double v21 = (void *)v19;
    }
    else {
      double v21 = v16;
    }
    objc_storeStrong((id *)&v18->_traits, v21);

    id v22 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v23 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v27 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], v24, v25, v26);
    backgroundView = v18->_backgroundView;
    v18->_backgroundView = (UIView *)v27;

    [(UIView *)v18->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [(UIView *)v18->_backgroundView layer];
    [v29 setMasksToBounds:1];

    v30 = [(TUIVariantCell *)v18 highlightColor];
    [(UIView *)v18->_backgroundView setBackgroundColor:v30];

    [(UIView *)v18->_backgroundView setAlpha:0.0];
    [(TUIVariantCell *)v18 addSubview:v18->_backgroundView];
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v23, v24, v25, v26);
    labelView = v18->_labelView;
    v18->_labelView = (UILabel *)v31;

    [(UILabel *)v18->_labelView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v18->_labelView setTextAlignment:1];
    [(UILabel *)v18->_labelView setText:v14];
    v33 = [(UIKBRenderTraits *)v18->_traits symbolStyle];
    uint64_t v34 = [(TUIVariantCell *)v18 fontForSymbolStyle:v33];
    [(UILabel *)v18->_labelView setFont:v34];

    [(UILabel *)v18->_labelView setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v18->_labelView setMinimumScaleFactor:0.6];
    v35 = [(TUIVariantCell *)v18 unhighlightedTextColor];
    [(UILabel *)v18->_labelView setTextColor:v35];

    LODWORD(v36) = 1144782848;
    [(UILabel *)v18->_labelView setContentCompressionResistancePriority:0 forAxis:v36];
    [(TUIVariantCell *)v18 addSubview:v18->_labelView];
    if ([v15 length])
    {
      uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v23, v24, v25, v26);
      annotationLabelView = v18->_annotationLabelView;
      v18->_annotationLabelView = (UILabel *)v37;

      [(UILabel *)v18->_annotationLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v18->_annotationLabelView setTextAlignment:1];
      [(UILabel *)v18->_annotationLabelView setText:v15];
      double v39 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
      [(UILabel *)v18->_annotationLabelView setFont:v39];

      objc_super v40 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v18->_annotationLabelView setTextColor:v40];

      [(TUIVariantCell *)v18 addSubview:v18->_annotationLabelView];
    }
    [(TUIVariantCell *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v18;
}

@end