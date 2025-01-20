@interface PKAddPassButton
+ (Class)layerClass;
+ (PKAddPassButton)addPassButtonWithStyle:(PKAddPassButtonStyle)addPassButtonStyle;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_singleLineFitsSize:(CGSize)a3;
- (CGSize)_baseIntrinsicMultiLineSize;
- (CGSize)_baseIntrinsicSingleLineSize;
- (CGSize)_intrinsicContentSizeForSingleLine:(BOOL)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKAddPassButton)init;
- (PKAddPassButton)initWithAddPassButtonStyle:(PKAddPassButtonStyle)style;
- (PKAddPassButton)initWithAddPassButtonStyle:(int64_t)a3 addPassButtonType:(int64_t)a4;
- (PKAddPassButton)initWithCoder:(id)a3;
- (PKAddPassButton)initWithFrame:(CGRect)a3;
- (PKAddPassButtonStyle)addPassButtonStyle;
- (int64_t)addPassButtonType;
- (void)_adjustVisibleLabelWithBounds:(CGRect)a3;
- (void)_applyStyle;
- (void)_createHighlightFilterIfNecessary;
- (void)_sharedInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setAddPassButtonStyle:(PKAddPassButtonStyle)addPassButtonStyle;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PKAddPassButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (PKAddPassButton)addPassButtonWithStyle:(PKAddPassButtonStyle)addPassButtonStyle
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAddPassButtonStyle:addPassButtonStyle];

  return (PKAddPassButton *)v3;
}

- (PKAddPassButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKAddPassButton;
  v5 = [(PKAddPassButton *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_addPassButtonStyle = [v4 decodeIntegerForKey:@"PKButtonStyle"];
    v5->_addPassButtonType = [v4 decodeIntegerForKey:@"PKButtonType"];
    [(PKAddPassButton *)v5 _sharedInit];
  }

  return v5;
}

- (PKAddPassButton)init
{
  return [(PKAddPassButton *)self initWithAddPassButtonStyle:0];
}

- (PKAddPassButton)initWithFrame:(CGRect)a3
{
  return -[PKAddPassButton initWithAddPassButtonStyle:](self, "initWithAddPassButtonStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKAddPassButton)initWithAddPassButtonStyle:(PKAddPassButtonStyle)style
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v9.receiver = self;
  v9.super_class = (Class)PKAddPassButton;
  v6 = -[PKAddPassButton initWithFrame:](&v9, sel_initWithFrame_, v4, v5, 190.0, 57.0);
  objc_super v7 = v6;
  if (v6)
  {
    v6->_addPassButtonStyle = style;
    v6->_addPassButtonType = 0;
    [(PKAddPassButton *)v6 _sharedInit];
  }
  return v7;
}

- (PKAddPassButton)initWithAddPassButtonStyle:(int64_t)a3 addPassButtonType:(int64_t)a4
{
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v11.receiver = self;
  v11.super_class = (Class)PKAddPassButton;
  v8 = -[PKAddPassButton initWithFrame:](&v11, sel_initWithFrame_, v6, v7, 190.0, 57.0);
  objc_super v9 = v8;
  if (v8)
  {
    v8->_addPassButtonStyle = a3;
    v8->_addPassButtonType = a4;
    [(PKAddPassButton *)v8 _sharedInit];
  }
  return v9;
}

- (void)_sharedInit
{
  [(PKAddPassButton *)self setOpaque:0];
  v3 = [(PKAddPassButton *)self layer];
  layer = self->_layer;
  self->_layer = v3;

  double v5 = self->_layer;
  id v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.11373 green:0.11765 blue:0.11765 alpha:1.0];
  -[CAShapeLayer setFillColor:](v5, "setFillColor:", [v6 CGColor]);

  double v7 = self->_layer;
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
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
  id v47 = [v14 imageNamed:@"AddPass_Icon" inBundle:v15];

  v46 = objc_msgSend(MEMORY[0x1E4F84790], "constraintsWithAspectFitToSize:", 28.0, 20.0);
  v45 = objc_msgSend(v47, "resizedImageWithConstraints:");
  v16 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithPKImage:");
  [v16 size];
  self->_iconSize.width = v17;
  self->_iconSize.height = v18;
  v19 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v16];
  iconView = self->_iconView;
  self->_iconView = v19;

  [(PKAddPassButton *)self addSubview:self->_iconView];
  int64_t addPassButtonType = self->_addPassButtonType;
  if (!addPassButtonType)
  {
    v22 = @"ADD_PASS_BUTTON_SPLIT_TITLE";
    v23 = @"ADD_PASS_BUTTON_SPLIT_SURTITLE";
    v24 = @"ADD_PASS_BUTTON_TITLE";
    goto LABEL_5;
  }
  if (addPassButtonType == 1)
  {
    v22 = @"ADD_PASS_BUTTON_SPLIT_TITLE_TRACK";
    v23 = @"ADD_PASS_BUTTON_SPLIT_SURTITLE_TRACK";
    v24 = @"ADD_PASS_BUTTON_TITLE_TRACK";
LABEL_5:
    v25 = PKLocalizedString(&v24->isa);
    v26 = PKLocalizedString(&v23->isa);
    v27 = PKLocalizedString(&v22->isa);
    goto LABEL_7;
  }
  v27 = 0;
  v26 = 0;
  v25 = 0;
LABEL_7:
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  singleLineLabel = self->_singleLineLabel;
  self->_singleLineLabel = v28;

  v30 = self->_singleLineLabel;
  v31 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v30 setBackgroundColor:v31];

  v32 = self->_singleLineLabel;
  v33 = TitleFormattedString(0, v25, 1, &self->_singleLineAlignmentInset.top);
  [(UILabel *)v32 setAttributedText:v33];

  [(UILabel *)self->_singleLineLabel setNumberOfLines:1];
  [(UILabel *)self->_singleLineLabel sizeToFit];
  [(PKAddPassButton *)self addSubview:self->_singleLineLabel];
  if ([(PKAddPassButton *)self _shouldReverseLayoutDirection]) {
    uint64_t v34 = 2;
  }
  else {
    uint64_t v34 = 0;
  }
  v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  multiLineLabel = self->_multiLineLabel;
  self->_multiLineLabel = v35;

  v37 = self->_multiLineLabel;
  v38 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v37 setBackgroundColor:v38];

  v39 = self->_multiLineLabel;
  v40 = TitleFormattedString(v26, v27, v34, &self->_multiLineAlignmentInset.top);
  [(UILabel *)v39 setAttributedText:v40];

  [(UILabel *)self->_multiLineLabel setNumberOfLines:2];
  [(UILabel *)self->_multiLineLabel sizeToFit];
  [(PKAddPassButton *)self addSubview:self->_multiLineLabel];
  [(UILabel *)self->_singleLineLabel frame];
  self->_singleLineSize.width = v41;
  self->_singleLineSize.height = v42;
  [(UILabel *)self->_multiLineLabel frame];
  self->_multiLineSize.width = v43;
  self->_multiLineSize.height = v44;
  [(PKAddPassButton *)self _applyStyle];
  [(PKAddPassButton *)self bounds];
  -[PKAddPassButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:");
  [(PKAddPassButton *)self setAccessibilityLabel:v25];
  [(PKAddPassButton *)self setAccessibilityTraits:*MEMORY[0x1E4FB2540]];
  if (dyld_program_sdk_at_least()) {
    [(PKAddPassButton *)self sizeToFit];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddPassButton;
  id v4 = a3;
  [(PKAddPassButton *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_addPassButtonStyle, @"PKButtonStyle", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_addPassButtonType forKey:@"PKButtonType"];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKAddPassButton;
  [(PKAddPassButton *)&v2 dealloc];
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
    v7.super_class = (Class)PKAddPassButton;
    BOOL v5 = [(PKAddPassButton *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  [(PKAddPassButton *)self _intrinsicContentSizeForSingleLine:0];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  [(PKAddPassButton *)self _intrinsicContentSizeForSingleLine:[(PKAddPassButton *)self _singleLineFitsSize:a3.width]];
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
    [(PKAddPassButton *)self _baseIntrinsicSingleLineSize];
  }
  else {
    [(PKAddPassButton *)self _baseIntrinsicMultiLineSize];
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
  v136.receiver = self;
  v136.super_class = (Class)PKAddPassButton;
  [(PKAddPassButton *)&v136 layoutSubviews];
  [(PKAddPassButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(PKAddPassButton *)self _shouldReverseLayoutDirection];
  if (v11) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  -[PKShapeView setFrame:](self->_maskView, "setFrame:", v4, v6, v8, v10);
  -[PKAddPassButton _adjustVisibleLabelWithBounds:](self, "_adjustVisibleLabelWithBounds:", v4, v6, v8, v10);
  [(UILabel *)self->_singleLineLabel alpha];
  double v118 = v13;
  [(PKAddPassButton *)self _intrinsicContentSizeForSingleLine:v13 > 0.0];
  double v15 = v14;
  PKFloatRoundToPixel();
  double v17 = v16;
  double v18 = fmin(v10 / v15, 1.0);
  memset(&v135, 0, sizeof(v135));
  if (v18 == 1.0)
  {
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v135.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v135.m33 = v19;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v135.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v135.m43 = v20;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v135.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v135.m13 = v21;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v135.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v135.m23 = v22;
  }
  else
  {
    CATransform3DMakeScale(&v135, v18, v18, 1.0);
  }
  double height = self->_iconSize.height;
  double width = self->_singleLineSize.width;
  double top = self->_singleLineAlignmentInset.top;
  double bottom = self->_singleLineAlignmentInset.bottom;
  double left = self->_singleLineAlignmentInset.left;
  double right = self->_singleLineAlignmentInset.right;
  double v117 = v18 * self->_iconSize.width;
  double v25 = v18 * 8.0;
  double v26 = v18 * self->_multiLineSize.width;
  double v28 = self->_multiLineAlignmentInset.top;
  double v27 = self->_multiLineAlignmentInset.left;
  double v30 = self->_multiLineAlignmentInset.bottom;
  double v29 = self->_multiLineAlignmentInset.right;
  if (v8 != self->_boundsSize.width || v10 != self->_boundsSize.height)
  {
    self->_boundsSize.double width = v8;
    self->_boundsSize.double height = v10;
    v31 = (void *)MEMORY[0x1E4FB14C0];
    double v32 = v6;
    double v129 = v26;
    double v34 = *MEMORY[0x1E4F1DAD8];
    double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v122 = width;
    double v124 = height;
    double v119 = v29;
    double v113 = v30;
    double v103 = v28;
    double v105 = v27;
    PKFloatRoundToPixel();
    double v36 = v35;
    double v37 = v34;
    double v6 = v32;
    double v38 = v33;
    double v25 = v18 * 8.0;
    v39 = objc_msgSend(v31, "_bezierPathWithPillRect:cornerRadius:", v37, v38, v8, v10, v36);
    layer = self->_layer;
    id v41 = v39;
    -[CAShapeLayer setPath:](layer, "setPath:", [v41 CGPath]);
    CGFloat v42 = [(PKShapeView *)self->_maskView shapeLayer];
    id v43 = v41;
    objc_msgSend(v42, "setPath:", objc_msgSend(v43, "CGPath"));

    double v28 = v103;
    double v27 = v105;
    double v30 = v113;
    double v29 = v119;
    double width = v122;
    double height = v124;
    double v26 = v129;
  }
  double v98 = v18 * height;
  double v114 = v18 * width;
  double v130 = v18 * v28;
  CGFloat amount = v25;
  double v127 = v18 * v27;
  double v100 = v18 * v30;
  double v99 = v18 * v29;
  double v44 = v17 * v18;
  memset(&slice, 0, sizeof(slice));
  double v45 = v4 + v17 * v18;
  CGFloat v46 = v6 + v44;
  double v47 = v44 + v44;
  double v48 = v8 - v47;
  double v49 = v10 - v47;
  CGFloat v50 = v26;
  double v51 = 0.0;
  CGFloat v104 = v46;
  PKSizeAlignedInRect();
  CGRect remainder = v137;
  CGRectDivide(v137, &slice, &remainder, v117, v12);
  double v52 = 0.0;
  double v53 = 0.0;
  double v54 = 0.0;
  if (v118 <= 0.0)
  {
    PKSizeAlignedInRect();
    double v51 = v55;
  }
  double v120 = v52;
  double v121 = v54;
  double v123 = v53;
  double v125 = v51;
  double v112 = v18 * left;
  double v108 = v18 * top;
  double v110 = v18 * bottom;
  double v116 = v18 * right;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v50, v12);
  double v56 = v130 + v100;
  PKSizeAlignedInRect();
  double v101 = v58;
  double v102 = v57;
  double v60 = v59;
  double v107 = v127 + v99 + v61;
  remainder.origin.x = v45;
  remainder.origin.y = v104;
  remainder.size.double width = v48;
  remainder.size.double height = v49;
  PKSizeAlignedInRect();
  CGRect remainder = v138;
  CGRectDivide(v138, &slice, &remainder, v117, v12);
  if (v118 > 0.0)
  {
    PKSizeAlignedInRect();
    double v121 = v62;
    double v123 = v63;
    double v120 = v64;
    double v125 = v65;
  }
  double v66 = v102 - v127;
  double v128 = v56 + v60;
  double v131 = v101 - v130;
  CGRectDivide(remainder, &slice, &remainder, amount, v12);
  CGRectDivide(remainder, &slice, &remainder, v114, v12);
  PKSizeAlignedInRect();
  double v71 = v67 - v112;
  double v72 = v68 - v108;
  double v73 = v112 + v116 + v69;
  double v74 = v108 + v110 + v70;
  if (v118 <= 0.0) {
    double v75 = v112 + v116 + v69;
  }
  else {
    double v75 = v107;
  }
  double v76 = v67 - v112;
  double v77 = v68 - v108;
  double v78 = v112 + v116 + v69;
  double v79 = v108 + v110 + v70;
  if (v118 <= 0.0)
  {
    double v76 = v66;
    double v79 = v128;
    double v77 = v131;
    double v78 = v107;
  }
  if (v11) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v76) - v75;
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v76);
  }
  if (v118 <= 0.0) {
    double v81 = v66;
  }
  else {
    double v81 = MinX;
  }
  if (v118 <= 0.0) {
    double v82 = MinX;
  }
  else {
    double v82 = v71;
  }
  v83 = [(UIImageView *)self->_iconView layer];
  [v83 anchorPoint];
  double v85 = v84;
  double v87 = v86;
  CATransform3D v132 = v135;
  [v83 setTransform:&v132];
  objc_msgSend(v83, "setPosition:", v121 + v85 * v120, v123 + v87 * v125);
  v88 = [(UILabel *)self->_multiLineLabel layer];

  [v88 anchorPoint];
  double v90 = v89;
  double v92 = v91;
  CATransform3D v132 = v135;
  [v88 setTransform:&v132];
  objc_msgSend(v88, "setPosition:", v81 + v90 * v107, v131 + v92 * v128);
  v93 = [(UILabel *)self->_singleLineLabel layer];

  [v93 anchorPoint];
  double v95 = v94;
  double v97 = v96;
  CATransform3D v132 = v135;
  [v93 setTransform:&v132];
  objc_msgSend(v93, "setPosition:", v82 + v95 * v73, v72 + v97 * v74);
}

- (void)_adjustVisibleLabelWithBounds:(CGRect)a3
{
  unsigned int v4 = -[PKAddPassButton _singleLineFitsSize:](self, "_singleLineFitsSize:", a3.size.width, a3.size.height);
  [(UILabel *)self->_multiLineLabel setAlpha:(double)(v4 ^ 1)];
  singleLineLabel = self->_singleLineLabel;

  [(UILabel *)singleLineLabel setAlpha:(double)v4];
}

- (BOOL)_singleLineFitsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKAddPassButton *)self _intrinsicContentSizeForSingleLine:1];
  return v6 * fmin(height / v5, 1.0) <= width;
}

- (void)_createHighlightFilterIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_highlightFilter)
  {
    double v3 = [(PKAddPassButton *)self layer];
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
  v16.super_class = (Class)PKAddPassButton;
  -[PKAddPassButton setHighlighted:](&v16, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    [(PKAddPassButton *)self _createHighlightFilterIfNecessary];
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

- (void)setAddPassButtonStyle:(PKAddPassButtonStyle)addPassButtonStyle
{
  if (self->_addPassButtonStyle != addPassButtonStyle)
  {
    self->_addPassButtonStyle = addPassButtonStyle;
    [(PKAddPassButton *)self _applyStyle];
  }
}

- (void)_applyStyle
{
  layer = self->_layer;
  if (self->_addPassButtonStyle == 1)
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

- (PKAddPassButtonStyle)addPassButtonStyle
{
  return self->_addPassButtonStyle;
}

- (int64_t)addPassButtonType
{
  return self->_addPassButtonType;
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