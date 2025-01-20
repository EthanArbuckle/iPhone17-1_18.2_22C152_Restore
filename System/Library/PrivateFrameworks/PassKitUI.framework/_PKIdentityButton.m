@interface _PKIdentityButton
+ (Class)layerClass;
+ (id)buttonWithLabel:(int64_t)a3 style:(int64_t)a4;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_singleLineFitsSize:(CGSize)a3;
- (CGSize)_baseIntrinsicMultiLineSize;
- (CGSize)_baseIntrinsicSingleLineSize;
- (CGSize)_intrinsicContentSizeForSingleLine:(BOOL)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_PKIdentityButton)init;
- (_PKIdentityButton)initWithCoder:(id)a3;
- (_PKIdentityButton)initWithLabel:(int64_t)a3 style:(int64_t)a4;
- (double)_adjustedCornerRadiusForScale:(double)a3;
- (double)cornerRadius;
- (id)_singleLineTitle;
- (id)_splitSurtitle;
- (id)_splitTitle;
- (void)_adjustVisibleLabelWithBounds:(CGRect)a3;
- (void)_applyStyle;
- (void)_createHighlightFilterIfNecessary;
- (void)_sharedInit;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _PKIdentityButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)buttonWithLabel:(int64_t)a3 style:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:a3 style:a4];

  return v4;
}

- (_PKIdentityButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PKIdentityButton;
  v5 = [(_PKIdentityButton *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_label = [v4 decodeIntegerForKey:@"PKIdentityButtonLabel"];
    v5->_style = [v4 decodeIntegerForKey:@"PKIdentityButtonStyle"];
    [v4 decodeFloatForKey:@"PKIdentityButtonCornerRadius"];
    v5->_cornerRadius = v6;
    [(_PKIdentityButton *)v5 _sharedInit];
  }

  return v5;
}

- (_PKIdentityButton)init
{
  return [(_PKIdentityButton *)self initWithLabel:0 style:0];
}

- (_PKIdentityButton)initWithLabel:(int64_t)a3 style:(int64_t)a4
{
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v11.receiver = self;
  v11.super_class = (Class)_PKIdentityButton;
  objc_super v8 = -[_PKIdentityButton initWithFrame:](&v11, sel_initWithFrame_, v6, v7, 190.0, 57.0);
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    v8->_label = a3;
    v8->_cornerRadius = 4.0;
    [(_PKIdentityButton *)v8 _sharedInit];
  }
  return v9;
}

- (void)_sharedInit
{
  [(_PKIdentityButton *)self setOpaque:0];
  v3 = [(_PKIdentityButton *)self layer];
  layer = self->_layer;
  self->_layer = v3;

  v5 = self->_layer;
  id v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.11373 green:0.11765 blue:0.11765 alpha:1.0];
  -[CAShapeLayer setFillColor:](v5, "setFillColor:", [v6 CGColor]);

  double v7 = self->_layer;
  objc_super v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  [(CAShapeLayer *)v7 setLineWidth:1.0 / v9];

  v10 = objc_alloc_init(PKShapeView);
  maskView = self->_maskView;
  self->_maskView = v10;

  v12 = self->_layer;
  v13 = [(PKShapeView *)self->_maskView layer];
  [(CAShapeLayer *)v12 setMask:v13];

  v14 = (void *)MEMORY[0x1E4F84780];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v43 = [v14 imageNamed:@"AddPass_Icon" inBundle:v15];

  v42 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithAspectFitToSize:", 28.0, 20.0);
  v41 = [v43 resizedImageWithConstraints:v42];
  v16 = [MEMORY[0x1E4FB1818] imageWithPKImage:v41];
  [v16 size];
  self->_iconSize.width = v17;
  self->_iconSize.height = v18;
  v19 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v16];
  iconView = self->_iconView;
  self->_iconView = v19;

  [(_PKIdentityButton *)self addSubview:self->_iconView];
  v21 = [(_PKIdentityButton *)self _singleLineTitle];
  v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  singleLineLabel = self->_singleLineLabel;
  self->_singleLineLabel = v22;

  v24 = self->_singleLineLabel;
  v25 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v24 setBackgroundColor:v25];

  v26 = self->_singleLineLabel;
  v27 = TitleFormattedString(0, v21, 1, &self->_singleLineAlignmentInset.top);
  [(UILabel *)v26 setAttributedText:v27];

  [(UILabel *)self->_singleLineLabel setNumberOfLines:1];
  [(UILabel *)self->_singleLineLabel sizeToFit];
  [(_PKIdentityButton *)self addSubview:self->_singleLineLabel];
  if ([(_PKIdentityButton *)self _shouldReverseLayoutDirection]) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 0;
  }
  v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  multiLineLabel = self->_multiLineLabel;
  self->_multiLineLabel = v29;

  v31 = self->_multiLineLabel;
  v32 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v31 setBackgroundColor:v32];

  v33 = self->_multiLineLabel;
  v34 = [(_PKIdentityButton *)self _splitSurtitle];
  v35 = [(_PKIdentityButton *)self _splitTitle];
  v36 = TitleFormattedString(v34, v35, v28, &self->_multiLineAlignmentInset.top);
  [(UILabel *)v33 setAttributedText:v36];

  [(UILabel *)self->_multiLineLabel setNumberOfLines:2];
  [(UILabel *)self->_multiLineLabel sizeToFit];
  [(_PKIdentityButton *)self addSubview:self->_multiLineLabel];
  [(UILabel *)self->_singleLineLabel frame];
  self->_singleLineSize.width = v37;
  self->_singleLineSize.height = v38;
  [(UILabel *)self->_multiLineLabel frame];
  self->_multiLineSize.width = v39;
  self->_multiLineSize.height = v40;
  [(_PKIdentityButton *)self _applyStyle];
  [(_PKIdentityButton *)self bounds];
  -[_PKIdentityButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:");
  [(_PKIdentityButton *)self setAccessibilityLabel:v21];
  [(_PKIdentityButton *)self setAccessibilityTraits:*MEMORY[0x1E4FB2540]];
  [(_PKIdentityButton *)self sizeToFit];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PKIdentityButton;
  id v4 = a3;
  [(_PKIdentityButton *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, @"PKIdentityButtonStyle", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_label forKey:@"PKIdentityButtonLabel"];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_PKIdentityButton;
    BOOL v5 = [(_PKIdentityButton *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  [(_PKIdentityButton *)self _intrinsicContentSizeForSingleLine:0];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  [(_PKIdentityButton *)self _intrinsicContentSizeForSingleLine:[(_PKIdentityButton *)self _singleLineFitsSize:a3.width]];
  double v5 = fmin(height / v4, 1.0);
  double v7 = v6 * v5;
  double v8 = v4 * v5;
  result.double height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_intrinsicContentSizeForSingleLine:(BOOL)a3
{
  if (a3) {
    [(_PKIdentityButton *)self _baseIntrinsicSingleLineSize];
  }
  else {
    [(_PKIdentityButton *)self _baseIntrinsicMultiLineSize];
  }
  double v5 = v3;
  double v6 = v4;
  PKFloatRoundToPixel();
  double v8 = v6 + v7 * 2.0;
  double v9 = v5 + v7 * 2.0;
  result.double height = v8;
  result.width = v9;
  return result;
}

- (CGSize)_baseIntrinsicSingleLineSize
{
  double v2 = self->_iconSize.width
     + 8.0
     + self->_singleLineSize.width
     - self->_singleLineAlignmentInset.left
     - self->_singleLineAlignmentInset.right;
  double v3 = fmax(self->_iconSize.height, self->_singleLineSize.height - self->_singleLineAlignmentInset.top - self->_singleLineAlignmentInset.bottom);
  result.double height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_baseIntrinsicMultiLineSize
{
  double v2 = self->_iconSize.width
     + 8.0
     + self->_multiLineSize.width
     - self->_multiLineAlignmentInset.left
     - self->_multiLineAlignmentInset.right;
  double v3 = fmax(self->_iconSize.height, self->_multiLineSize.height - self->_multiLineAlignmentInset.top - self->_multiLineAlignmentInset.bottom);
  result.double height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v139.receiver = self;
  v139.super_class = (Class)_PKIdentityButton;
  [(_PKIdentityButton *)&v139 layoutSubviews];
  [(_PKIdentityButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(_PKIdentityButton *)self _shouldReverseLayoutDirection];
  if (v11) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  -[PKShapeView setFrame:](self->_maskView, "setFrame:", v4, v6, v8, v10);
  double v126 = v6;
  -[_PKIdentityButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:", v4, v6, v8, v10);
  [(UILabel *)self->_singleLineLabel alpha];
  double v14 = v13;
  [(_PKIdentityButton *)self _intrinsicContentSizeForSingleLine:v13 > 0.0];
  double v16 = v15;
  PKFloatRoundToPixel();
  double v18 = v17;
  double v19 = fmin(v10 / v16, 1.0);
  memset(&v138, 0, sizeof(v138));
  if (v19 == 1.0)
  {
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v138.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v138.m33 = v20;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v138.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v138.m43 = v21;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v138.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v138.m13 = v22;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v138.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v138.m23 = v23;
  }
  else
  {
    CATransform3DMakeScale(&v138, v19, v19, 1.0);
  }
  double v120 = v14;
  double height = self->_iconSize.height;
  double width = self->_singleLineSize.width;
  double top = self->_singleLineAlignmentInset.top;
  double bottom = self->_singleLineAlignmentInset.bottom;
  double left = self->_singleLineAlignmentInset.left;
  double right = self->_singleLineAlignmentInset.right;
  double v119 = v19 * self->_iconSize.width;
  double v26 = v19 * 8.0;
  double v27 = v19 * self->_multiLineSize.width;
  double v29 = self->_multiLineAlignmentInset.top;
  double v28 = self->_multiLineAlignmentInset.left;
  double v31 = self->_multiLineAlignmentInset.bottom;
  double v30 = self->_multiLineAlignmentInset.right;
  if (v8 != self->_boundsSize.width || v10 != self->_boundsSize.height)
  {
    self->_boundsSize.double width = v8;
    self->_boundsSize.double height = v10;
    v32 = (void *)MEMORY[0x1E4F84F58];
    double v33 = v18;
    double v34 = v4;
    double v36 = *MEMORY[0x1E4F1DAD8];
    double v35 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v129 = height;
    double v132 = v27;
    double v124 = width;
    double v121 = v30;
    double v117 = v31;
    double v105 = v29;
    double v107 = v28;
    [(_PKIdentityButton *)self _adjustedCornerRadiusForScale:v19];
    double v38 = v37;
    double v39 = v36;
    double v4 = v34;
    double v18 = v33;
    double v40 = v35;
    double v26 = v19 * 8.0;
    v41 = objc_msgSend(v32, "pathWithRoundedRect:cornerRadius:", v39, v40, v8, v10, v38);
    layer = self->_layer;
    id v43 = v41;
    -[CAShapeLayer setPath:](layer, "setPath:", [v43 CGPath]);
    v44 = [(PKShapeView *)self->_maskView shapeLayer];
    id v45 = v43;
    objc_msgSend(v44, "setPath:", objc_msgSend(v45, "CGPath"));

    double v29 = v105;
    double v28 = v107;
    double v31 = v117;
    double v30 = v121;
    double width = v124;
    double height = v129;
    double v27 = v132;
  }
  double v100 = v19 * height;
  double v118 = v19 * width;
  double v133 = v19 * v29;
  CGFloat amount = v26;
  double v130 = v19 * v28;
  double v102 = v19 * v31;
  double v101 = v19 * v30;
  double v46 = v18 * v19;
  memset(&slice, 0, sizeof(slice));
  double v47 = v4 + v18 * v19;
  CGFloat v48 = v126 + v46;
  double v49 = v46 + v46;
  double v50 = v8 - v49;
  double v51 = v10 - v49;
  CGFloat v52 = v27;
  double v53 = 0.0;
  CGFloat v106 = v48;
  PKSizeAlignedInRect();
  CGRect remainder = v140;
  CGRectDivide(v140, &slice, &remainder, v119, v12);
  double v54 = 0.0;
  double v55 = 0.0;
  double v56 = 0.0;
  if (v120 <= 0.0)
  {
    PKSizeAlignedInRect();
    double v53 = v57;
  }
  double v122 = v54;
  double v123 = v56;
  double v125 = v55;
  double v127 = v53;
  double v110 = v19 * top;
  double v112 = v19 * bottom;
  double v114 = v19 * left;
  double v116 = v19 * right;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v52, v12);
  double v58 = v133 + v102;
  PKSizeAlignedInRect();
  double v103 = v60;
  double v104 = v59;
  double v62 = v61;
  double v109 = v130 + v101 + v63;
  remainder.origin.x = v47;
  remainder.origin.y = v106;
  remainder.size.double width = v50;
  remainder.size.double height = v51;
  PKSizeAlignedInRect();
  CGRect remainder = v141;
  CGRectDivide(v141, &slice, &remainder, v119, v12);
  if (v120 > 0.0)
  {
    PKSizeAlignedInRect();
    double v123 = v64;
    double v125 = v65;
    double v122 = v66;
    double v127 = v67;
  }
  double v68 = v104 - v130;
  double v131 = v58 + v62;
  double v134 = v103 - v133;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v118, v12);
  PKSizeAlignedInRect();
  double v73 = v69 - v114;
  double v74 = v70 - v110;
  double v75 = v114 + v116 + v71;
  double v76 = v110 + v112 + v72;
  if (v120 <= 0.0) {
    double v77 = v114 + v116 + v71;
  }
  else {
    double v77 = v109;
  }
  double v78 = v69 - v114;
  double v79 = v70 - v110;
  double v80 = v114 + v116 + v71;
  double v81 = v110 + v112 + v72;
  if (v120 <= 0.0)
  {
    double v78 = v68;
    double v81 = v131;
    double v79 = v134;
    double v80 = v109;
  }
  if (v11) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v78) - v77;
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v78);
  }
  if (v120 <= 0.0) {
    double v83 = v68;
  }
  else {
    double v83 = MinX;
  }
  if (v120 <= 0.0) {
    double v84 = MinX;
  }
  else {
    double v84 = v73;
  }
  v85 = [(UIImageView *)self->_iconView layer];
  [v85 anchorPoint];
  double v87 = v86;
  double v89 = v88;
  CATransform3D v135 = v138;
  [v85 setTransform:&v135];
  objc_msgSend(v85, "setPosition:", v123 + v87 * v122, v125 + v89 * v127);
  v90 = [(UILabel *)self->_multiLineLabel layer];

  [v90 anchorPoint];
  double v92 = v91;
  double v94 = v93;
  CATransform3D v135 = v138;
  [v90 setTransform:&v135];
  objc_msgSend(v90, "setPosition:", v83 + v92 * v109, v134 + v94 * v131);
  v95 = [(UILabel *)self->_singleLineLabel layer];

  [v95 anchorPoint];
  double v97 = v96;
  double v99 = v98;
  CATransform3D v135 = v138;
  [v95 setTransform:&v135];
  objc_msgSend(v95, "setPosition:", v84 + v97 * v75, v74 + v99 * v76);
}

- (void)_adjustVisibleLabelWithBounds:(CGRect)a3
{
  unsigned int v4 = -[_PKIdentityButton _singleLineFitsSize:](self, "_singleLineFitsSize:", a3.size.width, a3.size.height);
  [(UILabel *)self->_multiLineLabel setAlpha:(double)(v4 ^ 1)];
  singleLineLabel = self->_singleLineLabel;

  [(UILabel *)singleLineLabel setAlpha:(double)v4];
}

- (BOOL)_singleLineFitsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_PKIdentityButton *)self _intrinsicContentSizeForSingleLine:1];
  return v6 * fmin(height / v5, 1.0) <= width;
}

- (id)_singleLineTitle
{
  unint64_t v2 = self->_label - 1;
  if (v2 > 2) {
    double v3 = @"IDENTITY_VERIFY_IDENTITY_BUTTON_TITLE";
  }
  else {
    double v3 = off_1E59DC698[v2];
  }
  unsigned int v4 = PKLocalizedString(&v3->isa);

  return v4;
}

- (id)_splitSurtitle
{
  unint64_t v2 = self->_label - 1;
  if (v2 > 2) {
    double v3 = @"IDENTITY_VERIFY_IDENTITY_BUTTON_SPLIT_SURTITLE";
  }
  else {
    double v3 = off_1E59DC6B0[v2];
  }
  unsigned int v4 = PKLocalizedString(&v3->isa);

  return v4;
}

- (id)_splitTitle
{
  return (id)PKLocalizedString(&cfstr_IdentityButton.isa);
}

- (void)_createHighlightFilterIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_highlightFilter)
  {
    double v3 = [(_PKIdentityButton *)self layer];
    id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
    double v5 = (CAFilter *)[v4 initWithType:*MEMORY[0x1E4F3A2A8]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v5;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    double v7 = self->_highlightFilter;
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", [v8 CGColor], @"inputColor");

    v10[0] = self->_highlightFilter;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setFilters:v9];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PKIdentityButton;
  -[_PKIdentityButton setHighlighted:](&v16, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    [(_PKIdentityButton *)self _createHighlightFilterIfNecessary];
    double v5 = 0.6;
    if (!v3) {
      double v5 = 1.0;
    }
    double v6 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", v5);
    double v7 = (void *)MEMORY[0x1E4FB1618];
    id v8 = [(CAShapeLayer *)self->_layer presentationLayer];
    uint64_t v9 = [v8 valueForKeyPath:@"filters.highlightFilter.inputColor"];
    if (!v9) {
      uint64_t v9 = [(CAShapeLayer *)self->_layer valueForKeyPath:@"filters.highlightFilter.inputColor"];
    }
    double v10 = [v7 colorWithCGColor:v9];

    layer = self->_layer;
    id v12 = v6;
    -[CAShapeLayer setValue:forKeyPath:](layer, "setValue:forKeyPath:", [v12 CGColor], @"filters.highlightFilter.inputColor");
    double v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
    [v13 setDuration:0.15];
    [v13 setFillMode:*MEMORY[0x1E4F39FA8]];
    id v14 = v10;
    objc_msgSend(v13, "setFromValue:", objc_msgSend(v14, "CGColor"));
    id v15 = v12;
    objc_msgSend(v13, "setToValue:", objc_msgSend(v15, "CGColor"));
    [(CAShapeLayer *)self->_layer removeAnimationForKey:@"highlight"];
    [(CAShapeLayer *)self->_layer addAnimation:v13 forKey:@"highlight"];
  }
}

- (void)_applyStyle
{
  layer = self->_layer;
  if (self->_style == 1)
  {
    id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.3];
    -[CAShapeLayer setStrokeColor:](layer, "setStrokeColor:", [v4 CGColor]);
  }
  else
  {
    BOOL v3 = [(CAShapeLayer *)self->_layer fillColor];
    [(CAShapeLayer *)layer setStrokeColor:v3];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(_PKIdentityButton *)self setNeedsDisplay];
  }
}

- (double)_adjustedCornerRadiusForScale:(double)a3
{
  [(_PKIdentityButton *)self cornerRadius];

  PKFloatRoundToPixelWithScale();
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_multiLineLabel, 0);
  objc_storeStrong((id *)&self->_singleLineLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end