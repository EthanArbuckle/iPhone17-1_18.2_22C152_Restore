@interface PKTitleDetailValueTextView
- (BOOL)centerPrimaryText;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)amountText;
- (NSAttributedString)primaryText;
- (NSAttributedString)secondaryText;
- (NSAttributedString)tertiaryText;
- (PKTitleDetailValueTextView)init;
- (PKTitleDetailValueTextView)initWithFrame:(CGRect)a3;
- (PKTitleDetailValueTextView)initWithSize:(CGSize)a3;
- (UIColor)amountTextColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)tertiaryTextColor;
- (UIFont)amountFont;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (UIFont)tertiaryFont;
- (UIImage)primaryIcon;
- (UIImage)secondaryIcon;
- (UIImage)tertiaryIcon;
- (double)labelPadding;
- (unint64_t)accessory;
- (void)_configureView;
- (void)_useDefaultFont;
- (void)layoutSubviews;
- (void)setAccessory:(unint64_t)a3;
- (void)setAmountFont:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setAmountTextColor:(id)a3;
- (void)setCenterPrimaryText:(BOOL)a3;
- (void)setLabelPadding:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryIcon:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryIcon:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setTertiaryFont:(id)a3;
- (void)setTertiaryIcon:(id)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTertiaryTextColor:(id)a3;
@end

@implementation PKTitleDetailValueTextView

- (PKTitleDetailValueTextView)init
{
  return -[PKTitleDetailValueTextView initWithSize:](self, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (PKTitleDetailValueTextView)initWithSize:(CGSize)a3
{
  return -[PKTitleDetailValueTextView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKTitleDetailValueTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKTitleDetailValueTextView;
  v3 = -[PKTitleDetailValueTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKTitleDetailValueTextView *)v3 _useDefaultFont];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKTitleDetailValueTextView;
  [(PKTitleDetailValueTextView *)&v3 layoutSubviews];
  [(PKTitleDetailValueTextView *)self bounds];
  -[PKTitleDetailValueTextView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKTitleDetailValueTextView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v10 = [(PKTitleDetailValueTextView *)self _shouldReverseLayoutDirection];
  if (v10) {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  if (v10) {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  CGFloat v88 = x;
  CGFloat v89 = y;
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.double height = height;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", width, height);
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_amountText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", width, height);
    double v19 = v18;
    double v90 = v20;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB30];
    double v90 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_primaryText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", width, height);
    double v23 = v22;
  }
  else
  {
    double v23 = *MEMORY[0x1E4F1DB30];
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v24 = height;
  memset(&v100, 0, sizeof(v100));
  double v25 = 11.0;
  if (!self->_accessoryView) {
    double v25 = 0.0;
  }
  CGFloat v87 = v19;
  double v26 = v15 + v19 + v23 + v25;
  double v27 = fmax(v21, v17);
  double v28 = fmax(v21, fmax(v17, v90));
  CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGSize v91 = v29;
  CGPoint v92 = (CGPoint)*MEMORY[0x1E4F1DB28];
  if (v26 <= width) {
    CGFloat v30 = v28;
  }
  else {
    CGFloat v30 = v27;
  }
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v29;
  CGFloat v31 = v88;
  CGFloat v32 = v89;
  double v33 = width;
  CGRectDivide(*(CGRect *)(&v24 - 3), &slice, &remainder, v30, CGRectMinYEdge);
  CGSize v35 = v91;
  CGPoint v34 = v92;
  v97.origin = v92;
  v97.size = v91;
  if (v15 > 0.0)
  {
    CGRectDivide(slice, &v97, &slice, v15, v12);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v97.origin.CGFloat x = v36;
    v97.origin.CGFloat y = v37;
    v97.size.double width = v38;
    v97.size.double height = v39;
    CGRectDivide(slice, &v100, &slice, 11.0, v12);
    CGSize v35 = v91;
    CGPoint v34 = v92;
  }
  double v40 = v30 + 0.0;
  v96.origin = v34;
  v96.size = v35;
  BOOL v41 = v26 <= width;
  v95.origin = v34;
  v95.size = v35;
  double v42 = v30;
  if (v41)
  {
    if (v87 > 0.0)
    {
      CGRectDivide(slice, &v95, &slice, v87, v12);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v95.origin.CGFloat x = v55;
      v95.origin.CGFloat y = v56;
      CGSize v35 = v91;
      CGPoint v34 = v92;
      v95.size.double width = v57;
      v95.size.double height = v58;
    }
    if (v23 > 0.0)
    {
      CGRectDivide(slice, &v96, &slice, v23, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v96.origin.CGFloat x = v59;
      v96.origin.CGFloat y = v60;
      v96.size.double width = v61;
      v96.size.double height = v62;
      if (self->_centerPrimaryText)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v96.origin.CGFloat x = v63;
        v96.origin.CGFloat y = v64;
        v96.size.double width = v65;
        v96.size.double height = v66;
      }
      CGSize v35 = v91;
      CGPoint v34 = v92;
    }
  }
  else
  {
    if (v23 > 0.0)
    {
      CGRectDivide(slice, &v96, &slice, v23, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v96.origin.CGFloat x = v43;
      v96.origin.CGFloat y = v44;
      CGSize v35 = v91;
      CGPoint v34 = v92;
      v96.size.double width = v45;
      v96.size.double height = v46;
      if (self->_centerPrimaryText)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v96.origin.CGFloat x = v47;
        v96.origin.CGFloat y = v48;
        CGSize v35 = v91;
        CGPoint v34 = v92;
        v96.size.double width = v49;
        v96.size.double height = v50;
      }
    }
    slice.origin = v34;
    slice.size = v35;
    if (v87 > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, v90, CGRectMinYEdge);
      CGRectDivide(slice, &v95, &slice, v87, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v95.origin.CGFloat x = v51;
      v95.origin.CGFloat y = v52;
      CGSize v35 = v91;
      CGPoint v34 = v92;
      v95.size.double width = v53;
      v95.size.double height = v54;
    }
    double v40 = v90 + v40;
  }
  if (self->_secondaryText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v68 = v67;
    CGFloat v70 = v69;
    CGSize v35 = v91;
    CGPoint v34 = v92;
  }
  else
  {
    double v68 = *MEMORY[0x1E4F1DB30];
    CGFloat v70 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v94.origin = v34;
  v94.size = v35;
  slice.origin = v34;
  slice.size = v35;
  if (v68 > 0.0)
  {
    if (v42 > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, self->_labelPadding, CGRectMinYEdge);
      double v40 = v40 + self->_labelPadding;
    }
    CGRectDivide(remainder, &slice, &remainder, v70, CGRectMinYEdge);
    CGRectDivide(slice, &v94, &slice, v68, v11);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v94.origin.CGFloat x = v71;
    v94.origin.CGFloat y = v72;
    v94.size.double width = v73;
    v94.size.double height = v74;
    CGSize v35 = v91;
    CGPoint v34 = v92;
  }
  if (self->_tertiaryText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_tertiaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v76 = v75;
    CGFloat v78 = v77;
    CGSize v35 = v91;
    CGPoint v34 = v92;
  }
  else
  {
    double v76 = *MEMORY[0x1E4F1DB30];
    CGFloat v78 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v93.origin = v34;
  v93.size = v35;
  slice.origin = v34;
  slice.size = v35;
  if (v76 <= 0.0)
  {
    double v80 = v93.size.height;
  }
  else
  {
    if (v42 > 0.0 || v94.size.height > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, self->_labelPadding, CGRectMinYEdge);
      double v40 = v40 + self->_labelPadding;
    }
    CGRectDivide(remainder, &slice, &remainder, v78, CGRectMinYEdge);
    CGRectDivide(slice, &v93, &slice, v76, v11);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v80 = v79;
    v93.origin.CGFloat x = v81;
    v93.origin.CGFloat y = v82;
    v93.size.double width = v83;
    v93.size.double height = v79;
  }
  double v84 = v94.size.height;
  if (!a4)
  {
    -[PKIconTextLabel setFrame:](self->_primaryLabel, "setFrame:", v96.origin.x, v96.origin.y, v96.size.width, v96.size.height);
    -[PKIconTextLabel setFrame:](self->_secondaryLabel, "setFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
    -[PKIconTextLabel setFrame:](self->_tertiaryLabel, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    -[PKIconTextLabel setFrame:](self->_amountLabel, "setFrame:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
    -[UIView setFrame:](self->_accessoryView, "setFrame:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
  }
  double v85 = v80 + v40 + v84;
  double v86 = width;
  result.double height = v85;
  result.double width = v86;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryText, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setAmountText:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountText, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setSecondaryText:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryText, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setTertiaryText:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tertiaryText, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessorCGFloat y = a3;
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setLabelPadding:(double)a3
{
  if (self->_labelPadding != a3)
  {
    self->_labelPadding = a3;
    [(PKTitleDetailValueTextView *)self setNeedsLayout];
  }
}

- (void)setPrimaryTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryTextColor, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setAmountTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountTextColor, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setSecondaryTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryTextColor, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setTertiaryTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tertiaryTextColor, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setPrimaryFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryFont, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setSecondaryFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryFont, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setTertiaryFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tertiaryFont, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setAmountFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountFont, a3);
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)setCenterPrimaryText:(BOOL)a3
{
  if (self->_centerPrimaryText != a3)
  {
    self->_centerPrimaryText = a3;
    [(PKTitleDetailValueTextView *)self _configureView];
  }
}

- (void)_configureView
{
  primaryText = self->_primaryText;
  primaryLabel = self->_primaryLabel;
  if (primaryText)
  {
    if (!primaryLabel)
    {
      id v5 = objc_alloc_init(PKIconTextLabel);
      objc_super v6 = self->_primaryLabel;
      self->_primaryLabel = v5;

      [(PKTitleDetailValueTextView *)self addSubview:self->_primaryLabel];
      primaryLabel = self->_primaryLabel;
      primaryText = self->_primaryText;
    }
    [(PKIconTextLabel *)primaryLabel setText:primaryText];
    [(PKIconTextLabel *)self->_primaryLabel setTextColor:self->_primaryTextColor];
    [(PKIconTextLabel *)self->_primaryLabel setTextFont:self->_primaryFont];
    [(PKIconTextLabel *)self->_primaryLabel setIcon:self->_primaryIcon];
    [(PKIconTextLabel *)self->_primaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  }
  else
  {
    [(PKIconTextLabel *)primaryLabel removeFromSuperview];
    v7 = self->_primaryLabel;
    self->_primaryLabel = 0;
  }
  amountText = self->_amountText;
  amountLabel = self->_amountLabel;
  if (amountText)
  {
    if (!amountLabel)
    {
      int v10 = objc_alloc_init(PKIconTextLabel);
      CGRectEdge v11 = self->_amountLabel;
      self->_amountLabel = v10;

      [(PKTitleDetailValueTextView *)self addSubview:self->_amountLabel];
      amountLabel = self->_amountLabel;
      amountText = self->_amountText;
    }
    [(PKIconTextLabel *)amountLabel setText:amountText];
    [(PKIconTextLabel *)self->_amountLabel setTextColor:self->_amountTextColor];
    [(PKIconTextLabel *)self->_amountLabel setTextFont:self->_amountFont];
    [(PKIconTextLabel *)self->_amountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
  }
  else
  {
    [(PKIconTextLabel *)amountLabel removeFromSuperview];
    CGRectEdge v12 = self->_amountLabel;
    self->_amountLabel = 0;
  }
  secondaryText = self->_secondaryText;
  secondaryLabel = self->_secondaryLabel;
  if (secondaryText)
  {
    if (!secondaryLabel)
    {
      double v15 = objc_alloc_init(PKIconTextLabel);
      double v16 = self->_secondaryLabel;
      self->_secondaryLabel = v15;

      [(PKTitleDetailValueTextView *)self addSubview:self->_secondaryLabel];
      secondaryLabel = self->_secondaryLabel;
      secondaryText = self->_secondaryText;
    }
    [(PKIconTextLabel *)secondaryLabel setText:secondaryText];
    [(PKIconTextLabel *)self->_secondaryLabel setIcon:self->_secondaryIcon];
    [(PKIconTextLabel *)self->_secondaryLabel setTextFont:self->_secondaryFont];
    [(PKIconTextLabel *)self->_secondaryLabel setTextColor:self->_secondaryTextColor];
    [(PKIconTextLabel *)self->_secondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  }
  else
  {
    [(PKIconTextLabel *)secondaryLabel removeFromSuperview];
    double v17 = self->_secondaryLabel;
    self->_secondaryLabel = 0;
  }
  tertiaryText = self->_tertiaryText;
  tertiaryLabel = self->_tertiaryLabel;
  if (tertiaryText)
  {
    if (!tertiaryLabel)
    {
      double v20 = objc_alloc_init(PKIconTextLabel);
      double v21 = self->_tertiaryLabel;
      self->_tertiaryLabel = v20;

      [(PKTitleDetailValueTextView *)self addSubview:self->_tertiaryLabel];
      tertiaryLabel = self->_tertiaryLabel;
      tertiaryText = self->_tertiaryText;
    }
    [(PKIconTextLabel *)tertiaryLabel setText:tertiaryText];
    [(PKIconTextLabel *)self->_tertiaryLabel setTextFont:self->_tertiaryFont];
    [(PKIconTextLabel *)self->_tertiaryLabel setIcon:self->_tertiaryIcon];
    [(PKIconTextLabel *)self->_tertiaryLabel setTextColor:self->_tertiaryTextColor];
    [(PKIconTextLabel *)self->_tertiaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AA8]];
  }
  else
  {
    [(PKIconTextLabel *)tertiaryLabel removeFromSuperview];
    double v22 = self->_tertiaryLabel;
    self->_tertiaryLabel = 0;
  }
  accessorCGFloat y = self->_accessory;
  if (accessory)
  {
    if (accessory == 2)
    {
      [(UIView *)self->_accessoryView removeFromSuperview];
      CGFloat v32 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      accessoryView = self->_accessoryView;
      self->_accessoryView = v32;

      [(UIView *)self->_accessoryView startAnimating];
      CGFloat v30 = self->_accessoryView;
      goto LABEL_27;
    }
    if (accessory == 1)
    {
      [(UIView *)self->_accessoryView removeFromSuperview];
      id v24 = objc_alloc(MEMORY[0x1E4FB1838]);
      double v25 = PKUIChevronImage();
      double v26 = (UIView *)[v24 initWithImage:v25];
      double v27 = self->_accessoryView;
      self->_accessoryView = v26;

      double v28 = self->_accessoryView;
      CGSize v29 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [(UIView *)v28 setTintColor:v29];

      CGFloat v30 = self->_accessoryView;
LABEL_27:
      [(PKTitleDetailValueTextView *)self addSubview:v30];
    }
  }
  else
  {
    [(UIView *)self->_accessoryView removeFromSuperview];
    CGFloat v31 = self->_accessoryView;
    self->_accessoryView = 0;
  }
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PKTitleDetailValueTextView__configureView__block_invoke;
  aBlock[3] = &unk_1E59CA8C0;
  id v39 = v34;
  id v35 = v34;
  CGFloat v36 = (void (**)(void *, NSAttributedString *))_Block_copy(aBlock);
  v36[2](v36, self->_primaryText);
  v36[2](v36, self->_secondaryText);
  v36[2](v36, self->_tertiaryText);
  v36[2](v36, self->_amountText);
  CGFloat v37 = [v35 componentsJoinedByString:@","];
  [(PKTitleDetailValueTextView *)self setAccessibilityLabel:v37];

  [(PKTitleDetailValueTextView *)self setIsAccessibilityElement:1];
  [(PKTitleDetailValueTextView *)self setNeedsLayout];
}

void __44__PKTitleDetailValueTextView__configureView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 string];
  double v4 = [v3 attribute:*MEMORY[0x1E4FB0768] atIndex:0 effectiveRange:0];

  if (v4)
  {
    uint64_t v5 = PKLocalizedCocoonString(&cfstr_PaymentSchedul.isa, &stru_1EF1B4C70.isa, v7);

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [*(id *)(a1 + 32) safelyAddObject:v6];
}

- (void)_useDefaultFont
{
  id v3 = (NSString *)*MEMORY[0x1E4FB28C8];
  double v4 = (NSString *)*MEMORY[0x1E4FB2790];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
  uint64_t v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  primaryFont = self->_primaryFont;
  self->_primaryFont = v5;

  PKFontForDefaultDesign(v3, v4);
  id v7 = (UIFont *)objc_claimAutoreleasedReturnValue();
  secondaryFont = self->_secondaryFont;
  self->_secondaryFont = v7;

  PKFontForDefaultDesign(v3, v4);
  v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
  amountFont = self->_amountFont;
  self->_amountFont = v9;
}

- (NSAttributedString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)secondaryText
{
  return self->_secondaryText;
}

- (NSAttributedString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSAttributedString)amountText
{
  return self->_amountText;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (BOOL)centerPrimaryText
{
  return self->_centerPrimaryText;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)tertiaryFont
{
  return self->_tertiaryFont;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (UIImage)primaryIcon
{
  return self->_primaryIcon;
}

- (void)setPrimaryIcon:(id)a3
{
}

- (UIImage)secondaryIcon
{
  return self->_secondaryIcon;
}

- (void)setSecondaryIcon:(id)a3
{
}

- (UIImage)tertiaryIcon
{
  return self->_tertiaryIcon;
}

- (void)setTertiaryIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryIcon, 0);
  objc_storeStrong((id *)&self->_secondaryIcon, 0);
  objc_storeStrong((id *)&self->_primaryIcon, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_tertiaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end