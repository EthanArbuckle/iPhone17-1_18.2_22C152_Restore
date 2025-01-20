@interface PKPaymentAuthorizationTotalView
- (BOOL)_shouldUseLargeTextLayout;
- (BOOL)isPendingTotal;
- (BOOL)isProcessing;
- (BOOL)showsBoldValueText;
- (PKPaymentAuthorizationLayout)layout;
- (PKPaymentAuthorizationTotalView)init;
- (PKPaymentAuthorizationTotalView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (double)_initialLeading;
- (id)_labelAttributedStringWithString:(id)a3;
- (id)_valueAttributedStringWithString:(id)a3;
- (int64_t)labelNumberOfLines;
- (int64_t)style;
- (void)_createSubviews;
- (void)_prepareConstraints;
- (void)dealloc;
- (void)setIsPendingTotal:(BOOL)a3;
- (void)setLabel:(id)a3 value:(id)a4;
- (void)setLabelNumberOfLines:(int64_t)a3;
- (void)setLayout:(id)a3;
- (void)setProcessing:(BOOL)a3;
- (void)setShowsBoldValueText:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation PKPaymentAuthorizationTotalView

- (PKPaymentAuthorizationTotalView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationTotalView;
  v5 = -[PKPaymentAuthorizationTotalView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_labelNumberOfLines = 2;
    v5->_showsBoldValueText = 0;
    [(PKPaymentAuthorizationTotalView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaymentAuthorizationTotalView *)v6 _createSubviews];
    [(PKPaymentAuthorizationTotalView *)v6 _prepareConstraints];
  }
  return v6;
}

- (PKPaymentAuthorizationTotalView)init
{
  return -[PKPaymentAuthorizationTotalView initWithFrame:style:](self, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dealloc
{
  if (self->_processing) {
    [(UIActivityIndicatorView *)self->_processingIndicator stopAnimating];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationTotalView;
  [(PKPaymentAuthorizationTotalView *)&v3 dealloc];
}

- (void)setLabel:(id)a3 value:(id)a4
{
  labelView = self->_labelView;
  v7 = (__CFString *)a4;
  objc_super v8 = objc_msgSend(a3, "pk_uppercaseStringForPreferredLocale");
  v9 = [(PKPaymentAuthorizationTotalView *)self _labelAttributedStringWithString:v8];
  [(UILabel *)labelView setAttributedText:v9];

  valueView = self->_valueView;
  if ([(__CFString *)v7 length]) {
    v11 = v7;
  }
  else {
    v11 = @" ";
  }
  v12 = [(PKPaymentAuthorizationTotalView *)self _valueAttributedStringWithString:v11];

  [(UILabel *)valueView setAttributedText:v12];

  [(PKPaymentAuthorizationTotalView *)self setNeedsUpdateConstraints];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  [(UIView *)self->_separatorView setHidden:a3 != 2];

  [(PKPaymentAuthorizationTotalView *)self setNeedsUpdateConstraints];
}

- (void)setLabelNumberOfLines:(int64_t)a3
{
  if (self->_labelNumberOfLines != a3)
  {
    self->_labelNumberOfLines = a3;
    -[UILabel setNumberOfLines:](self->_labelView, "setNumberOfLines:");
    [(PKPaymentAuthorizationTotalView *)self setNeedsUpdateConstraints];
  }
}

- (void)setProcessing:(BOOL)a3
{
  if (((!self->_processing ^ a3) & 1) == 0)
  {
    self->_processing = a3;
    processingIndicator = self->_processingIndicator;
    if (a3) {
      [(UIActivityIndicatorView *)processingIndicator startAnimating];
    }
    else {
      [(UIActivityIndicatorView *)processingIndicator stopAnimating];
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__PKPaymentAuthorizationTotalView_setProcessing___block_invoke;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v5 completion:0];
  }
}

uint64_t __49__PKPaymentAuthorizationTotalView_setProcessing___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  LOBYTE(a2) = *(unsigned char *)(v3 + 505);
  [*(id *)(v3 + 424) setAlpha:(double)*(unint64_t *)&a2];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 416);
  double v6 = 0.0;
  if (!*(unsigned char *)(v4 + 505)) {
    double v6 = 1.0;
  }

  return [v5 setAlpha:v6];
}

- (void)_createSubviews
{
  uint64_t v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  [(UIView *)self->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = self->_separatorView;
  double v6 = PKAuthorizationSeparatorColor();
  [(UIView *)v5 setBackgroundColor:v6];

  [(PKPaymentAuthorizationTotalView *)self addSubview:self->_separatorView];
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelView = self->_labelView;
  self->_labelView = v7;

  [(UILabel *)self->_labelView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_labelView setNumberOfLines:self->_labelNumberOfLines];
  v9 = self->_labelView;
  v10 = [(PKPaymentAuthorizationTotalView *)self _labelAttributedStringWithString:&stru_1EF1B5B50];
  [(UILabel *)v9 setAttributedText:v10];

  [(UILabel *)self->_labelView setOpaque:0];
  [(PKPaymentAuthorizationTotalView *)self addSubview:self->_labelView];
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  valueView = self->_valueView;
  self->_valueView = v11;

  [(UILabel *)self->_valueView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_valueView setNumberOfLines:1];
  LODWORD(v13) = 1148846080;
  [(UILabel *)self->_valueView setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UILabel *)self->_valueView setContentHuggingPriority:0 forAxis:v14];
  v15 = self->_valueView;
  v16 = [(PKPaymentAuthorizationTotalView *)self _valueAttributedStringWithString:@" "];
  [(UILabel *)v15 setAttributedText:v16];

  [(UILabel *)self->_valueView setOpaque:0];
  [(PKPaymentAuthorizationTotalView *)self addSubview:self->_valueView];
  v17 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  processingIndicator = self->_processingIndicator;
  self->_processingIndicator = v17;

  [(UIActivityIndicatorView *)self->_processingIndicator sizeToFit];
  [(UIActivityIndicatorView *)self->_processingIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_processingIndicator setAlpha:0.0];
  v19 = self->_processingIndicator;

  [(PKPaymentAuthorizationTotalView *)self addSubview:v19];
}

- (BOOL)_shouldUseLargeTextLayout
{
  BOOL v2 = [(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  uint64_t v3 = (id *)MEMORY[0x1E4FB2608];
  uint64_t v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  double v6 = [*v3 preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]);

  if (v2 && IsAccessibilityCategory) {
    return 1;
  }
  else {
    return (v7 == NSOrderedDescending) & ~v2;
  }
}

- (void)updateConstraints
{
  BOOL v3 = [(PKPaymentAuthorizationTotalView *)self _shouldUseLargeTextLayout];
  leftMarginConstraint = self->_leftMarginConstraint;
  if (v3)
  {
    double v5 = 20.0;
    int v6 = 1148813312;
    int v7 = 1148846080;
  }
  else
  {
    [(PKPaymentAuthorizationLayout *)self->_layout valueLeftMargin];
    int v6 = 1148846080;
    int v7 = 1144750080;
  }
  [(NSLayoutConstraint *)leftMarginConstraint setConstant:v5];
  rightMarginConstraint = self->_rightMarginConstraint;
  [(PKPaymentAuthorizationLayout *)self->_layout contentHorizontalMargin];
  [(NSLayoutConstraint *)rightMarginConstraint setConstant:-v9];
  rightMarginLargeTextConstraint = self->_rightMarginLargeTextConstraint;
  [(PKPaymentAuthorizationLayout *)self->_layout contentHorizontalMargin];
  [(NSLayoutConstraint *)rightMarginLargeTextConstraint setConstant:-v11];
  labelBaselineConstraint = self->_labelBaselineConstraint;
  [(PKPaymentAuthorizationTotalView *)self _initialLeading];
  -[NSLayoutConstraint setConstant:](labelBaselineConstraint, "setConstant:");
  LODWORD(v13) = v6;
  [(NSLayoutConstraint *)self->_leftMarginConstraint setPriority:v13];
  [(NSLayoutConstraint *)self->_valueBaselineLargeTextConstraint setActive:v3];
  [(NSLayoutConstraint *)self->_valueBaselineConstraint setActive:v3 ^ 1];
  [(NSLayoutConstraint *)self->_labelValueRelationLargeTextConstraint setActive:v3];
  [(NSLayoutConstraint *)self->_labelValueRelationConstraint setActive:v3 ^ 1];
  [(NSLayoutConstraint *)self->_rightMarginLargeTextConstraint setActive:v3];
  [(NSLayoutConstraint *)self->_rightMarginConstraint setActive:v3 ^ 1];
  LODWORD(v14) = v7;
  [(UILabel *)self->_labelView setContentHuggingPriority:0 forAxis:v14];
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentAuthorizationTotalView;
  [(PKPaymentAuthorizationTotalView *)&v15 updateConstraints];
}

- (double)_initialLeading
{
  BOOL v3 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
  [v3 _bodyLeading];
  double v5 = v4;

  if (self->_style) {
    double v6 = 58.0;
  }
  else {
    double v6 = 24.0;
  }
  BOOL v7 = [(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  double v8 = v6 + 10.0;
  if (!v7) {
    double v8 = v6;
  }
  return round(v5 * v8 * 0.03125);
}

- (void)_prepareConstraints
{
  BOOL v3 = [(PKPaymentAuthorizationTotalView *)self _shouldUseLargeTextLayout];
  id v55 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [v55 addObject:v4];

  double v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [v55 addObject:v5];

  double v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [v55 addObject:v6];

  BOOL v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_separatorView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:PKUIPixelLength()];
  [v55 addObject:v7];

  double v8 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
  [v8 _bodyLeading];
  double v10 = v9;

  [(PKPaymentAuthorizationTotalView *)self _initialLeading];
  double v12 = v11;
  double v13 = (void *)MEMORY[0x1E4F28DC8];
  p_labelView = &self->_labelView;
  labelView = self->_labelView;
  double v16 = 20.0;
  if (!v3)
  {
    [(PKPaymentAuthorizationLayout *)self->_layout valueLeftMargin];
    double v16 = v17;
  }
  v18 = [v13 constraintWithItem:labelView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:v16];
  leftMarginConstraint = self->_leftMarginConstraint;
  self->_leftMarginConstraint = v18;

  if (v3)
  {
    LODWORD(v20) = 1148813312;
    [(NSLayoutConstraint *)self->_leftMarginConstraint setPriority:v20];
  }
  [v55 addObject:self->_leftMarginConstraint];
  v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_labelView attribute:12 relatedBy:0 toItem:self->_separatorView attribute:4 multiplier:1.0 constant:v12];
  labelBaselineConstraint = self->_labelBaselineConstraint;
  self->_labelBaselineConstraint = v21;

  LODWORD(v23) = 1148829696;
  [(NSLayoutConstraint *)self->_labelBaselineConstraint setPriority:v23];
  [v55 addObject:self->_labelBaselineConstraint];
  v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_labelView attribute:6 relatedBy:0 toItem:self->_valueView attribute:5 multiplier:1.0 constant:-8.0];
  labelValueRelationConstraint = self->_labelValueRelationConstraint;
  self->_labelValueRelationConstraint = v24;

  v26 = (void *)MEMORY[0x1E4F28DC8];
  valueView = self->_valueView;
  [(PKPaymentAuthorizationLayout *)self->_layout contentHorizontalMargin];
  v29 = [v26 constraintWithItem:valueView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-v28];
  rightMarginConstraint = self->_rightMarginConstraint;
  self->_rightMarginConstraint = v29;

  v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_valueView attribute:6 relatedBy:0 toItem:*p_labelView attribute:6 multiplier:1.0 constant:0.0];
  labelValueRelationLargeTextConstraint = self->_labelValueRelationLargeTextConstraint;
  self->_labelValueRelationLargeTextConstraint = v31;

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v34 = *p_labelView;
  [(PKPaymentAuthorizationLayout *)self->_layout contentHorizontalMargin];
  v36 = [v33 constraintWithItem:v34 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-v35];
  rightMarginLargeTextConstraint = self->_rightMarginLargeTextConstraint;
  self->_rightMarginLargeTextConstraint = v36;

  v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_valueView attribute:12 relatedBy:0 toItem:*p_labelView attribute:11 multiplier:1.0 constant:0.0];
  valueBaselineConstraint = self->_valueBaselineConstraint;
  self->_valueBaselineConstraint = v38;

  v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_valueView attribute:3 relatedBy:0 toItem:*p_labelView attribute:4 multiplier:1.0 constant:0.0];
  valueBaselineLargeTextConstraint = self->_valueBaselineLargeTextConstraint;
  self->_valueBaselineLargeTextConstraint = v40;

  LODWORD(v42) = 1148829696;
  [(NSLayoutConstraint *)self->_valueBaselineConstraint setPriority:v42];
  LODWORD(v43) = 1148829696;
  [(NSLayoutConstraint *)self->_valueBaselineLargeTextConstraint setPriority:v43];
  [v55 addObject:self->_valueBaselineConstraint];
  [v55 addObject:self->_valueBaselineLargeTextConstraint];
  v44 = [(UIActivityIndicatorView *)self->_processingIndicator rightAnchor];
  v45 = [(UILabel *)self->_valueView rightAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v55 addObject:v46];

  v47 = [(UIActivityIndicatorView *)self->_processingIndicator centerYAnchor];
  v48 = [(UILabel *)self->_valueView centerYAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v55 addObject:v49];

  LODWORD(v50) = 1148829696;
  [(NSLayoutConstraint *)self->_rightMarginConstraint setPriority:v50];
  LODWORD(v51) = 1148829696;
  [(NSLayoutConstraint *)self->_rightMarginLargeTextConstraint setPriority:v51];
  [v55 addObject:self->_rightMarginConstraint];
  [v55 addObject:self->_rightMarginLargeTextConstraint];
  [v55 addObject:self->_labelValueRelationConstraint];
  [v55 addObject:self->_labelValueRelationLargeTextConstraint];
  double v52 = round(v10 * 37.0 * 0.03125);
  if (v3) {
    p_valueView = &self->_valueView;
  }
  else {
    p_valueView = &self->_labelView;
  }
  v54 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:4 relatedBy:0 toItem:*p_valueView attribute:11 multiplier:1.0 constant:v52];
  [v55 addObject:v54];

  [(PKPaymentAuthorizationTotalView *)self addConstraints:v55];
}

- (id)_labelAttributedStringWithString:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v3 = (void *)MEMORY[0x1E4FB0850];
    id v4 = a3;
    double v5 = [v3 defaultParagraphStyle];
    double v6 = (void *)[v5 mutableCopy];

    [v6 setLineBreakMode:0];
    v14[0] = *MEMORY[0x1E4FB06F8];
    BOOL v7 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
    uint64_t v8 = *MEMORY[0x1E4FB0738];
    v15[0] = v7;
    v15[1] = v6;
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    v14[1] = v8;
    v14[2] = v9;
    double v10 = PKAuthorizationViewValueLabelColor();
    v15[2] = v10;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v11];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)_valueAttributedStringWithString:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4FB0850];
    id v5 = a3;
    double v6 = [v4 defaultParagraphStyle];
    BOOL v7 = (void *)[v6 mutableCopy];

    [v7 setLineBreakMode:0];
    uint64_t v8 = (void *)*MEMORY[0x1E4FB2790];
    BOOL showsBoldValueText = self->_showsBoldValueText;
    if (self->_isPendingTotal) {
      PKConstrainedAuthorizationViewCellLabelSmallFont(v8, showsBoldValueText);
    }
    else {
    double v11 = PKConstrainedAuthorizationViewCellLabelLargeFont(v8, showsBoldValueText);
    }
    uint64_t v12 = *MEMORY[0x1E4FB0738];
    v16[0] = *MEMORY[0x1E4FB06F8];
    v16[1] = v12;
    v17[0] = v11;
    v17[1] = v7;
    v16[2] = *MEMORY[0x1E4FB0700];
    double v13 = PKAuthorizationViewValueLabelColor();
    v17[2] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v14];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (PKPaymentAuthorizationLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isPendingTotal
{
  return self->_isPendingTotal;
}

- (void)setIsPendingTotal:(BOOL)a3
{
  self->_isPendingTotal = a3;
}

- (BOOL)isProcessing
{
  return self->_processing;
}

- (int64_t)labelNumberOfLines
{
  return self->_labelNumberOfLines;
}

- (BOOL)showsBoldValueText
{
  return self->_showsBoldValueText;
}

- (void)setShowsBoldValueText:(BOOL)a3
{
  self->_BOOL showsBoldValueText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_rightMarginLargeTextConstraint, 0);
  objc_storeStrong((id *)&self->_labelValueRelationLargeTextConstraint, 0);
  objc_storeStrong((id *)&self->_valueBaselineLargeTextConstraint, 0);
  objc_storeStrong((id *)&self->_labelValueRelationConstraint, 0);
  objc_storeStrong((id *)&self->_valueBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_labelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_rightMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leftMarginConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_processingIndicator, 0);
  objc_storeStrong((id *)&self->_valueView, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end