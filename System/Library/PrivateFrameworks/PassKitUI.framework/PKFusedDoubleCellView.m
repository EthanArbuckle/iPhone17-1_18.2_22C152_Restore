@interface PKFusedDoubleCellView
- (BOOL)enableDisclosure;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)leftDetail;
- (NSString)leftSubDetail;
- (NSString)leftTitle;
- (NSString)rightDetail;
- (NSString)rightSubDetail;
- (NSString)rightTitle;
- (PKFusedDoubleCellView)init;
- (PKFusedDoubleCellView)initWithFrame:(CGRect)a3;
- (PKPaymentPass)pass;
- (UIColor)leftDetailColor;
- (UIColor)leftSubDetailColor;
- (UIColor)leftTitleColor;
- (UIColor)rightDetailColor;
- (UIColor)rightSubDetailColor;
- (UIColor)rightTitleColor;
- (UIFont)titleFont;
- (double)_layoutLabelsSideBySide:(CGRect)a3 halfSize:(CGSize)a4 leftTitleSize:(CGSize)a5 leftDetailSize:(CGSize)a6 leftSubDetailSize:(CGSize)a7 disclosureSize:(CGSize)a8 disclosurePadding:(double)a9 rightSize:(CGSize)a10 rightTitleSize:(CGSize)a11 rightDetailSize:(CGSize)a12 rightSubDetailSize:(CGSize)a13 isTemplateLayout:(BOOL)a14;
- (double)_layoutLabelsStacked:(CGRect)a3 disclosureSize:(CGSize)a4 disclosurePadding:(double)a5 isTemplateLayout:(BOOL)a6;
- (id)_detailFont;
- (id)_subDetailFont;
- (id)_titleFont;
- (int64_t)viewType;
- (void)_performInit;
- (void)_setupViews;
- (void)_updateContent:(BOOL)a3;
- (void)beginUpdates;
- (void)endUpdates:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setEnableDisclosure:(BOOL)a3;
- (void)setLeftDetail:(id)a3;
- (void)setLeftDetailColor:(id)a3;
- (void)setLeftSubDetail:(id)a3;
- (void)setLeftSubDetailColor:(id)a3;
- (void)setLeftTitle:(id)a3;
- (void)setLeftTitleColor:(id)a3;
- (void)setPass:(id)a3;
- (void)setRightDetail:(id)a3;
- (void)setRightDetailColor:(id)a3;
- (void)setRightSubDetail:(id)a3;
- (void)setRightSubDetailColor:(id)a3;
- (void)setRightTitle:(id)a3;
- (void)setRightTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKFusedDoubleCellView

- (PKFusedDoubleCellView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKFusedDoubleCellView;
  v2 = [(PKFusedDoubleCellView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKFusedDoubleCellView *)v2 _performInit];
  }
  return v3;
}

- (PKFusedDoubleCellView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKFusedDoubleCellView;
  v3 = -[PKFusedDoubleCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKFusedDoubleCellView *)v3 _performInit];
  }
  return v4;
}

- (int64_t)viewType
{
  return 1;
}

- (void)prepareForReuse
{
  [(UILabel *)self->_leftTitleView setText:0];
  [(UILabel *)self->_leftDetailView setText:0];
  [(UILabel *)self->_leftSubDetailView setText:0];
  [(UILabel *)self->_rightTitleView setText:0];
  [(UILabel *)self->_rightDetailView setText:0];
  [(UILabel *)self->_rightSubDetailView setText:0];
  [(UIView *)self->_separatorView setAlpha:0.0];
  disclosureView = self->_disclosureView;

  [(UIImageView *)disclosureView setAlpha:0.0];
}

- (void)_performInit
{
  self->_deferUpdateCounter = 0;
  [(PKFusedDoubleCellView *)self _setupViews];
}

- (void)_setupViews
{
  id v30 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(UIView *)self pkui_setMaskType:3];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  leftTitleView = self->_leftTitleView;
  self->_leftTitleView = v8;

  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  rightTitleView = self->_rightTitleView;
  self->_rightTitleView = v10;

  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  leftDetailView = self->_leftDetailView;
  self->_leftDetailView = v12;

  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  rightDetailView = self->_rightDetailView;
  self->_rightDetailView = v14;

  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  leftSubDetailView = self->_leftSubDetailView;
  self->_leftSubDetailView = v16;

  v18 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  rightSubDetailView = self->_rightSubDetailView;
  self->_rightSubDetailView = v18;

  v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
  separatorView = self->_separatorView;
  self->_separatorView = v20;

  v22 = self->_separatorView;
  v23 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)v22 setBackgroundColor:v23];

  [(UIView *)self->_separatorView setAlpha:0.0];
  id v24 = objc_alloc(MEMORY[0x1E4FB1838]);
  v25 = PKUIChevronImage();
  v26 = (UIImageView *)[v24 initWithImage:v25];
  disclosureView = self->_disclosureView;
  self->_disclosureView = v26;

  v28 = self->_disclosureView;
  v29 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)v28 setTintColor:v29];

  [(UIImageView *)self->_disclosureView setAlpha:0.0];
  [(UILabel *)self->_leftTitleView setAccessibilityIdentifier:@"PKFusedDoubleCellView.leftTitleView"];
  [(UILabel *)self->_rightTitleView setAccessibilityIdentifier:@"PKFusedDoubleCellView.rightTitleView"];
  [(UILabel *)self->_leftDetailView setAccessibilityIdentifier:@"PKFusedDoubleCellView.leftDetailView"];
  [(UILabel *)self->_rightDetailView setAccessibilityIdentifier:@"PKFusedDoubleCellView.rightDetailView"];
  [(UILabel *)self->_leftSubDetailView setAccessibilityIdentifier:@"PKFusedDoubleCellView.leftSubDetailView"];
  [(UILabel *)self->_rightSubDetailView setAccessibilityIdentifier:@"PKFusedDoubleCellView.rightSubDetailView"];
  [(PKFusedDoubleCellView *)self addSubview:self->_leftTitleView];
  [(PKFusedDoubleCellView *)self addSubview:self->_leftDetailView];
  [(PKFusedDoubleCellView *)self addSubview:self->_leftSubDetailView];
  [(PKFusedDoubleCellView *)self addSubview:self->_rightTitleView];
  [(PKFusedDoubleCellView *)self addSubview:self->_rightDetailView];
  [(PKFusedDoubleCellView *)self addSubview:self->_rightSubDetailView];
  [(PKFusedDoubleCellView *)self addSubview:self->_disclosureView];
  [(PKFusedDoubleCellView *)self addSubview:self->_separatorView];
  [(PKFusedDoubleCellView *)self setBackgroundColor:v30];
}

- (id)_titleFont
{
  titleFont = self->_titleFont;
  if (titleFont)
  {
    id v3 = titleFont;
  }
  else
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    id v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_detailFont
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double v3 = 28.0;
  if (!v2) {
    double v3 = 24.0;
  }
  double v4 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2780], v3);
  double v5 = *MEMORY[0x1E4FB09B8];

  return PKRoundedSystemFontOfSizeAndWeight(v4, v5);
}

- (id)_subDetailFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB2790]);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKFusedDoubleCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKFusedDoubleCellView;
  [(PKFusedDoubleCellView *)&v3 layoutSubviews];
  [(PKFusedDoubleCellView *)self bounds];
  -[PKFusedDoubleCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.origin.y;
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double v7 = [(PKFusedDoubleCellView *)self traitCollection];
  v8 = [v7 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  double v10 = PKUIPixelLength();
  double v54 = width + -20.0;
  double v11 = (width + -20.0) * 0.5 + -6.5;
  double v12 = v10 * 0.5;
  double v13 = v11 - v12;
  if (self->_leftTitle)
  {
    -[UILabel sizeThatFits:](self->_leftTitleView, "sizeThatFits:", v11 - v12, 3.40282347e38);
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v45 = v15;
  double v50 = v14;
  if (self->_leftDetail)
  {
    -[UILabel sizeThatFits:](self->_leftDetailView, "sizeThatFits:", v13, 3.40282347e38);
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    uint64_t v17 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  uint64_t v44 = v17;
  double v49 = v16;
  if (self->_leftSubDetail)
  {
    -[UILabel sizeThatFits:](self->_leftSubDetailView, "sizeThatFits:", v13, 3.40282347e38);
    double v48 = v18;
    uint64_t v43 = v19;
  }
  else
  {
    double v48 = *MEMORY[0x1E4F1DB30];
    uint64_t v43 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [(UIImageView *)self->_disclosureView alpha];
  if (v20 <= 0.0)
  {
    double v22 = *MEMORY[0x1E4F1DB30];
    double v47 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v13, 3.40282347e38);
    double v22 = v21;
    double v47 = v23;
  }
  if (v22 <= 0.0) {
    double v24 = 0.0;
  }
  else {
    double v24 = 10.0;
  }
  if (self->_rightTitle)
  {
    -[UILabel sizeThatFits:](self->_rightTitleView, "sizeThatFits:", v13 - v22 + -10.0, 3.40282347e38);
    double v46 = v25;
    uint64_t v42 = v26;
  }
  else
  {
    double v46 = *MEMORY[0x1E4F1DB30];
    uint64_t v42 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_rightDetail)
  {
    -[UILabel sizeThatFits:](self->_rightDetailView, "sizeThatFits:", v13 - v22 + -10.0, 3.40282347e38);
    double v28 = v27;
    uint64_t v41 = v29;
  }
  else
  {
    double v28 = *MEMORY[0x1E4F1DB30];
    uint64_t v41 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_rightSubDetail)
  {
    -[UILabel sizeThatFits:](self->_rightSubDetailView, "sizeThatFits:", v13 - v22 + -10.0, 3.40282347e38);
    double v31 = v30;
    uint64_t v33 = v32;
  }
  else
  {
    double v31 = *MEMORY[0x1E4F1DB30];
    uint64_t v33 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v34 = x + 10.0;
  double v35 = y + 12.0;
  double v36 = height + -24.0;
  if (fmax(v50, fmax(v49, v48)) > v13
    || (v24 + v22 + fmax(v46, fmax(v28, v31)) > v13 ? (int v37 = 1) : (int v37 = IsAccessibilityCategory), v37 == 1))
  {
    -[PKFusedDoubleCellView _layoutLabelsStacked:disclosureSize:disclosurePadding:isTemplateLayout:](self, "_layoutLabelsStacked:disclosureSize:disclosurePadding:isTemplateLayout:", v4, v34, v35, v54, v36, v22, v47, v24);
  }
  else
  {
    -[PKFusedDoubleCellView _layoutLabelsSideBySide:halfSize:leftTitleSize:leftDetailSize:leftSubDetailSize:disclosureSize:disclosurePadding:rightSize:rightTitleSize:rightDetailSize:rightSubDetailSize:isTemplateLayout:](self, "_layoutLabelsSideBySide:halfSize:leftTitleSize:leftDetailSize:leftSubDetailSize:disclosureSize:disclosurePadding:rightSize:rightTitleSize:rightDetailSize:rightSubDetailSize:isTemplateLayout:", v4, v34, v35, v54, v36, v13, 3.40282347e38, v50, v45, *(void *)&v49, v44, *(void *)&v48, v43, *(void *)&v22, *(void *)&v47, *(void *)&v24,
      v13 - v22 + -10.0,
      0x47EFFFFFE0000000,
      *(void *)&v46,
      v42,
      *(void *)&v28,
      v41,
      *(void *)&v31,
      v33);
  }
  double v39 = v38 + 0.0 + 12.0 + 12.0;
  double v40 = width;
  result.double height = v39;
  result.double width = v40;
  return result;
}

- (double)_layoutLabelsSideBySide:(CGRect)a3 halfSize:(CGSize)a4 leftTitleSize:(CGSize)a5 leftDetailSize:(CGSize)a6 leftSubDetailSize:(CGSize)a7 disclosureSize:(CGSize)a8 disclosurePadding:(double)a9 rightSize:(CGSize)a10 rightTitleSize:(CGSize)a11 rightDetailSize:(CGSize)a12 rightSubDetailSize:(CGSize)a13 isTemplateLayout:(BOOL)a14
{
  char width_low = LOBYTE(a6.width);
  CGFloat rect = a3.size.height;
  double height = a5.height;
  CGFloat width = a3.size.width;
  CGFloat amount = a4.width;
  CGFloat y = a3.origin.y;
  CGFloat v56 = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v18 = [(PKFusedDoubleCellView *)self _shouldReverseLayoutDirection];
  if (v18) {
    CGRectEdge v19 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v19 = CGRectMaxXEdge;
  }
  if (v18) {
    CGRectEdge v20 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v20 = CGRectMinXEdge;
  }
  memset(&v72, 0, sizeof(v72));
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.CGFloat width = width;
  remainder.size.double height = rect;
  double v21 = fmax(height + a10.width + a11.width, fmax(v73 + v74 + v75, a12.width));
  double v22 = PKUIPixelLength();
  memset(&slice, 0, sizeof(slice));
  v76.origin.CGFloat x = x;
  v76.origin.CGFloat y = v56;
  v76.size.CGFloat width = width;
  v76.size.double height = rect;
  CGRectDivide(v76, &slice, &remainder, amount, v20);
  CGRectDivide(remainder, &v72, &remainder, 6.5, v20);
  memset(&v69, 0, sizeof(v69));
  CGRectDivide(remainder, &v69, &remainder, v22, v20);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v69.origin.CGFloat x = v23;
  v69.origin.CGFloat y = v24;
  v69.size.CGFloat width = v25;
  v69.size.double height = v26;
  CGRectDivide(remainder, &v72, &remainder, 6.5, v20);
  memset(&v68, 0, sizeof(v68));
  CGRectDivide(remainder, &v68, &remainder, a11.height, v19);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v68.origin.CGFloat x = v27;
  v68.origin.CGFloat y = v28;
  v68.size.CGFloat width = v29;
  v68.size.double height = v30;
  CGRectDivide(remainder, &v72, &remainder, a12.height, v19);
  memset(&v67, 0, sizeof(v67));
  CGRectDivide(remainder, &v67, &remainder, a13.width, v19);
  memset(&v66, 0, sizeof(v66));
  CGRectDivide(slice, &v66, &slice, height, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v66.origin.CGFloat x = v31;
  v66.origin.CGFloat y = v32;
  v66.size.CGFloat width = v33;
  v66.size.double height = v34;
  memset(&v65, 0, sizeof(v65));
  CGRectDivide(slice, &v65, &slice, a10.width, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v65.origin.CGFloat x = v35;
  v65.origin.CGFloat y = v36;
  v65.size.CGFloat width = v37;
  v65.size.double height = v38;
  memset(&v64, 0, sizeof(v64));
  CGRectDivide(slice, &v64, &slice, a11.width, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v64.origin.CGFloat x = v39;
  v64.origin.CGFloat y = v40;
  v64.size.CGFloat width = v41;
  v64.size.double height = v42;
  memset(&v63, 0, sizeof(v63));
  CGRectDivide(v67, &v63, &v67, v73, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v63.origin.CGFloat x = v43;
  v63.origin.CGFloat y = v44;
  v63.size.CGFloat width = v45;
  v63.size.double height = v46;
  memset(&v62, 0, sizeof(v62));
  CGRectDivide(v67, &v62, &v67, v74, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v62.origin.CGFloat x = v47;
  v62.origin.CGFloat y = v48;
  v62.size.CGFloat width = v49;
  v62.size.double height = v50;
  memset(&v61, 0, sizeof(v61));
  CGRectDivide(v67, &v61, &v67, v75, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v61.origin.CGFloat x = v51;
  v61.origin.CGFloat y = v52;
  v61.size.CGFloat width = v53;
  v61.size.double height = v54;
  if ((width_low & 1) == 0)
  {
    -[UILabel setFrame:](self->_leftTitleView, "setFrame:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
    -[UILabel setFrame:](self->_leftDetailView, "setFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    -[UILabel setFrame:](self->_leftSubDetailView, "setFrame:", v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
    -[UILabel setFrame:](self->_rightTitleView, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
    -[UILabel setFrame:](self->_rightDetailView, "setFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    -[UILabel setFrame:](self->_rightSubDetailView, "setFrame:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v68.origin.x, v68.origin.y, v68.size.width, v68.size.height);
  }
  return v21;
}

- (double)_layoutLabelsStacked:(CGRect)a3 disclosureSize:(CGSize)a4 disclosurePadding:(double)a5 isTemplateLayout:(BOOL)a6
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v13 = [(PKFusedDoubleCellView *)self _shouldReverseLayoutDirection];
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  CGFloat rect = y;
  if (v13) {
    CGRectEdge v14 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v14 = CGRectMaxXEdge;
  }
  remainder.size.double width = v9;
  remainder.size.double height = v8;
  double v63 = PKUIPixelLength();
  if (self->_leftTitle)
  {
    -[UILabel sizeThatFits:](self->_leftTitleView, "sizeThatFits:", v9, v8);
    double v16 = v15;
  }
  else
  {
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_leftDetail)
  {
    -[UILabel sizeThatFits:](self->_leftDetailView, "sizeThatFits:", v9, v8);
    double v18 = v17;
  }
  else
  {
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  CGFloat v67 = width;
  double v19 = v9 - width;
  if (self->_leftSubDetail)
  {
    -[UILabel sizeThatFits:](self->_leftSubDetailView, "sizeThatFits:", v9, v8);
    double v21 = v20;
  }
  else
  {
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v22 = v19 + -10.0;
  if (self->_rightTitle)
  {
    -[UILabel sizeThatFits:](self->_rightTitleView, "sizeThatFits:", v22, v8);
    double v64 = v23;
  }
  else
  {
    double v64 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_rightDetail)
  {
    -[UILabel sizeThatFits:](self->_rightDetailView, "sizeThatFits:", v22, v8);
    double v25 = v24;
  }
  else
  {
    double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_rightSubDetail)
  {
    -[UILabel sizeThatFits:](self->_rightSubDetailView, "sizeThatFits:", v22, v8);
    double v27 = v26;
  }
  else
  {
    double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  memset(&v80, 0, sizeof(v80));
  memset(&slice, 0, sizeof(slice));
  v81.origin.CGFloat x = x;
  v81.origin.CGFloat y = rect;
  v81.size.double width = v9;
  v81.size.double height = v8;
  double recta = v16 + v18 + v21;
  CGRectDivide(v81, &slice, &remainder, recta, CGRectMinYEdge);
  memset(&v77, 0, sizeof(v77));
  CGRectDivide(slice, &v77, &slice, v16, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v77.origin.CGFloat x = v28;
  v77.origin.CGFloat y = v29;
  v77.size.double width = v30;
  v77.size.double height = v31;
  memset(&v76, 0, sizeof(v76));
  CGRectDivide(slice, &v76, &slice, v18, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v76.origin.CGFloat x = v32;
  v76.origin.CGFloat y = v33;
  v76.size.double width = v34;
  v76.size.double height = v35;
  memset(&v75, 0, sizeof(v75));
  CGRectDivide(slice, &v75, &slice, v21, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v75.origin.CGFloat x = v36;
  v75.origin.CGFloat y = v37;
  v75.size.double width = v38;
  v75.size.double height = v39;
  CGRectDivide(remainder, &v80, &remainder, 6.5, CGRectMinYEdge);
  memset(&v74, 0, sizeof(v74));
  CGRectDivide(remainder, &v74, &remainder, v63, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v74.origin.CGFloat x = v40;
  v74.origin.CGFloat y = v41;
  v74.size.double width = v42;
  v74.size.double height = v43;
  CGRectDivide(remainder, &v80, &remainder, 6.5, CGRectMinYEdge);
  double v44 = v74.size.height;
  double v45 = fmax(v64 + v25 + v27, height);
  memset(&v73, 0, sizeof(v73));
  CGRectDivide(remainder, &v73, &remainder, v45, CGRectMinYEdge);
  memset(&v72, 0, sizeof(v72));
  CGRectDivide(v73, &v72, &v73, v67, v14);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v72.origin.CGFloat x = v46;
  v72.origin.CGFloat y = v47;
  v72.size.double width = v48;
  v72.size.double height = v49;
  memset(&v71, 0, sizeof(v71));
  CGRectDivide(v73, &v71, &v73, v64, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v71.origin.CGFloat x = v50;
  v71.origin.CGFloat y = v51;
  v71.size.double width = v52;
  v71.size.double height = v53;
  memset(&v70, 0, sizeof(v70));
  CGRectDivide(v73, &v70, &v73, v25, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v70.origin.CGFloat x = v54;
  v70.origin.CGFloat y = v55;
  v70.size.double width = v56;
  v70.size.double height = v57;
  memset(&v69, 0, sizeof(v69));
  CGRectDivide(v73, &v69, &v73, v27, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v69.origin.CGFloat x = v58;
  v69.origin.CGFloat y = v59;
  v69.size.double width = v60;
  v69.size.double height = v61;
  if (!a6)
  {
    -[UILabel setFrame:](self->_leftTitleView, "setFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    -[UILabel setFrame:](self->_leftDetailView, "setFrame:", v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
    -[UILabel setFrame:](self->_leftSubDetailView, "setFrame:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height);
    -[UILabel setFrame:](self->_rightTitleView, "setFrame:", v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
    -[UILabel setFrame:](self->_rightDetailView, "setFrame:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
    -[UILabel setFrame:](self->_rightSubDetailView, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v74.origin.x, v74.origin.y, v74.size.width, v74.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
  }
  return v45 + recta + 0.0 + 13.0 + v44;
}

- (void)setPass:(id)a3
{
  p_pass = &self->_pass;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_pass, a3);
  }
}

- (void)setEnableDisclosure:(BOOL)a3
{
  if (self->_enableDisclosure != a3) {
    self->_enableDisclosure = a3;
  }
}

- (void)setLeftTitle:(id)a3
{
  id v4 = a3;
  id v5 = self->_leftTitle;
  double v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    leftTitle = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = v8;
    leftTitle = self->_leftTitle;
    self->_leftTitle = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setLeftDetail:(id)a3
{
  id v4 = a3;
  id v5 = self->_leftDetail;
  double v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    leftDetail = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = v8;
    leftDetail = self->_leftDetail;
    self->_leftDetail = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setLeftSubDetail:(id)a3
{
  id v4 = a3;
  id v5 = self->_leftSubDetail;
  double v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    leftSubDetail = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = v8;
    leftSubDetail = self->_leftSubDetail;
    self->_leftSubDetail = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setRightTitle:(id)a3
{
  id v4 = a3;
  id v5 = self->_rightTitle;
  double v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    rightTitle = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = v8;
    rightTitle = self->_rightTitle;
    self->_rightTitle = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setRightDetail:(id)a3
{
  id v4 = a3;
  id v5 = self->_rightDetail;
  double v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    rightDetail = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = v8;
    rightDetail = self->_rightDetail;
    self->_rightDetail = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setRightSubDetail:(id)a3
{
  id v4 = a3;
  id v5 = self->_rightSubDetail;
  double v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    rightSubDetail = v11;
LABEL_9:

    double v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    double v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  double v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = v8;
    rightSubDetail = self->_rightSubDetail;
    self->_rightSubDetail = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setLeftTitleColor:(id)a3
{
  p_leftTitleColor = &self->_leftTitleColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_leftTitleColor, a3);
  }
}

- (void)setTitleFont:(id)a3
{
  p_titleFont = &self->_titleFont;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_titleFont, a3);
  }
}

- (void)setLeftDetailColor:(id)a3
{
  p_leftDetailColor = &self->_leftDetailColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_leftDetailColor, a3);
  }
}

- (void)setLeftSubDetailColor:(id)a3
{
  p_leftSubDetailColor = &self->_leftSubDetailColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_leftSubDetailColor, a3);
  }
}

- (void)setRightTitleColor:(id)a3
{
  p_rightTitleColor = &self->_rightTitleColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_rightTitleColor, a3);
  }
}

- (void)setRightDetailColor:(id)a3
{
  p_rightDetailColor = &self->_rightDetailColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_rightDetailColor, a3);
  }
}

- (void)setRightSubDetailColor:(id)a3
{
  p_rightSubDetailColor = &self->_rightSubDetailColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_rightSubDetailColor, a3);
  }
}

- (void)beginUpdates
{
}

- (void)endUpdates:(BOOL)a3
{
  unint64_t v3 = self->_deferUpdateCounter - 1;
  self->_deferUpdateCounter = v3;
  if (!v3) {
    [(PKFusedDoubleCellView *)self _updateContent:a3];
  }
}

- (void)_updateContent:(BOOL)a3
{
  if (!self->_deferUpdateCounter)
  {
    BOOL v3 = a3;
    id v31 = [(PKFusedDoubleCellView *)self _titleFont];
    id v5 = [(PKFusedDoubleCellView *)self _detailFont];
    double v6 = [(PKFusedDoubleCellView *)self _subDetailFont];
    [(UILabel *)self->_leftTitleView setFont:v31];
    leftTitleView = self->_leftTitleView;
    leftTitle = self->_leftTitle;
    leftTitleColor = self->_leftTitleColor;
    if (leftTitleColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftTitleView, (uint64_t)self->_leftTitle, leftTitleColor, 0, v3);
    }
    else
    {
      double v10 = [MEMORY[0x1E4FB1618] labelColor];
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftTitleView, (uint64_t)leftTitle, v10, 0, v3);
    }
    [(UILabel *)self->_rightTitleView setFont:v31];
    rightTitleView = self->_rightTitleView;
    rightTitle = self->_rightTitle;
    rightTitleColor = self->_rightTitleColor;
    if (rightTitleColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightTitleView, (uint64_t)self->_rightTitle, rightTitleColor, 0, v3);
    }
    else
    {
      CGRectEdge v14 = [MEMORY[0x1E4FB1618] labelColor];
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightTitleView, (uint64_t)rightTitle, v14, 0, v3);
    }
    [(UILabel *)self->_leftDetailView setFont:v5];
    [(UILabel *)self->_leftDetailView setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_leftDetailView setMinimumScaleFactor:0.5];
    leftDetailView = self->_leftDetailView;
    leftDetail = self->_leftDetail;
    leftDetailColor = self->_leftDetailColor;
    if (leftDetailColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftDetailView, (uint64_t)self->_leftDetail, leftDetailColor, 1, v3);
    }
    else
    {
      double v18 = [MEMORY[0x1E4FB1618] labelColor];
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftDetailView, (uint64_t)leftDetail, v18, 1, v3);
    }
    [(UILabel *)self->_rightDetailView setFont:v5];
    [(UILabel *)self->_rightDetailView setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_rightDetailView setMinimumScaleFactor:0.5];
    rightDetailView = self->_rightDetailView;
    rightDetail = self->_rightDetail;
    rightDetailColor = self->_rightDetailColor;
    if (rightDetailColor)
    {
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightDetailView, (uint64_t)self->_rightDetail, rightDetailColor, 1, v3);
    }
    else
    {
      double v22 = [MEMORY[0x1E4FB1618] labelColor];
      __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightDetailView, (uint64_t)rightDetail, v22, 1, v3);
    }
    if (self->_leftSubDetail)
    {
      [(UILabel *)self->_leftSubDetailView setFont:v6];
      leftSubDetailView = self->_leftSubDetailView;
      leftSubDetail = self->_leftSubDetail;
      leftSubDetailColor = self->_leftSubDetailColor;
      if (leftSubDetailColor)
      {
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftSubDetailView, (uint64_t)leftSubDetail, leftSubDetailColor, 0, v3);
      }
      else
      {
        double v26 = [MEMORY[0x1E4FB1618] labelColor];
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(leftSubDetailView, (uint64_t)leftSubDetail, v26, 0, v3);
      }
    }
    if (self->_rightSubDetail)
    {
      [(UILabel *)self->_rightSubDetailView setFont:v6];
      rightSubDetailView = self->_rightSubDetailView;
      rightSubDetail = self->_rightSubDetail;
      rightSubDetailColor = self->_rightSubDetailColor;
      if (rightSubDetailColor)
      {
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightSubDetailView, (uint64_t)rightSubDetail, rightSubDetailColor, 0, v3);
      }
      else
      {
        CGFloat v30 = [MEMORY[0x1E4FB1618] labelColor];
        __40__PKFusedDoubleCellView__updateContent___block_invoke_2(rightSubDetailView, (uint64_t)rightSubDetail, v30, 0, v3);
      }
    }
    __45__PKAdjustableSingleCellView__updateContent___block_invoke(self->_disclosureView, self->_enableDisclosure, v3);
    __45__PKAdjustableSingleCellView__updateContent___block_invoke(self->_separatorView, 1u, v3);
    [(PKFusedDoubleCellView *)self setNeedsLayout];
    if (v3) {
      [(PKFusedDoubleCellView *)self layoutIfNeeded];
    }
    [(PKFusedDoubleCellView *)self setNeedsLayout];
  }
}

void __40__PKFusedDoubleCellView__updateContent___block_invoke_2(void *a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  id v9 = a1;
  if (v9)
  {
    if (a3)
    {
      id v19 = v9;
      id v10 = a3;
      [v19 setText:a2];
      [v19 setTextColor:v10];

      [v19 setLineBreakMode:0];
      [v19 setNumberOfLines:a4];
      id v9 = v19;
      if (a5)
      {
        double v11 = [v19 layer];
        double v12 = v11;
        if (a2) {
          double v13 = 1.0;
        }
        else {
          double v13 = 0.0;
        }
        [v11 opacity];
        double v15 = v14;
        if (v13 != v14)
        {
          double v16 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
          objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v15, v13);
          id v17 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v16);

          double v18 = 0.0;
          if (a2) {
            *(float *)&double v18 = 1.0;
          }
          [v12 setOpacity:v18];
        }

        id v9 = v19;
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKFusedDoubleCellView;
  [(PKFusedDoubleCellView *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKFusedDoubleCellView *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      BOOL v7 = [v4 preferredContentSizeCategory];
      double v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        id v10 = [v4 preferredContentSizeCategory];
        double v11 = (void *)*MEMORY[0x1E4FB27F0];

        if (v10 != v11) {
          [(PKFusedDoubleCellView *)self _updateContent:0];
        }
      }
    }
  }
}

- (BOOL)enableDisclosure
{
  return self->_enableDisclosure;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)leftTitleColor
{
  return self->_leftTitleColor;
}

- (UIColor)leftDetailColor
{
  return self->_leftDetailColor;
}

- (UIColor)leftSubDetailColor
{
  return self->_leftSubDetailColor;
}

- (UIColor)rightTitleColor
{
  return self->_rightTitleColor;
}

- (UIColor)rightDetailColor
{
  return self->_rightDetailColor;
}

- (UIColor)rightSubDetailColor
{
  return self->_rightSubDetailColor;
}

- (NSString)leftTitle
{
  return self->_leftTitle;
}

- (NSString)leftDetail
{
  return self->_leftDetail;
}

- (NSString)leftSubDetail
{
  return self->_leftSubDetail;
}

- (NSString)rightTitle
{
  return self->_rightTitle;
}

- (NSString)rightDetail
{
  return self->_rightDetail;
}

- (NSString)rightSubDetail
{
  return self->_rightSubDetail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSubDetail, 0);
  objc_storeStrong((id *)&self->_rightDetail, 0);
  objc_storeStrong((id *)&self->_rightTitle, 0);
  objc_storeStrong((id *)&self->_leftSubDetail, 0);
  objc_storeStrong((id *)&self->_leftDetail, 0);
  objc_storeStrong((id *)&self->_leftTitle, 0);
  objc_storeStrong((id *)&self->_rightSubDetailColor, 0);
  objc_storeStrong((id *)&self->_rightDetailColor, 0);
  objc_storeStrong((id *)&self->_rightTitleColor, 0);
  objc_storeStrong((id *)&self->_leftSubDetailColor, 0);
  objc_storeStrong((id *)&self->_leftDetailColor, 0);
  objc_storeStrong((id *)&self->_leftTitleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_rightSubDetailView, 0);
  objc_storeStrong((id *)&self->_rightDetailView, 0);
  objc_storeStrong((id *)&self->_rightTitleView, 0);
  objc_storeStrong((id *)&self->_leftSubDetailView, 0);
  objc_storeStrong((id *)&self->_leftDetailView, 0);
  objc_storeStrong((id *)&self->_leftTitleView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);

  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end