@interface PKFDICSignageView
- (BOOL)isEqualToFooter:(id)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKFDICSignageView)initWithConfiguration:(id)a3;
- (PKFDICSignageView)initWithFeature:(unint64_t)a3 displayingBankName:(BOOL)a4;
- (UIEdgeInsets)contentInsets;
- (void)_updateFDICInsuredText;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation PKFDICSignageView

- (PKFDICSignageView)initWithFeature:(unint64_t)a3 displayingBankName:(BOOL)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    BOOL v4 = a4;
    v35.receiver = self;
    v35.super_class = (Class)PKFDICSignageView;
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[PKFDICSignageView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
    p_isa = (id *)&v10->super.super.super.isa;
    if (v10)
    {
      v10->_feature = a3;
      v10->_displayingBankName = v4;
      v10->_forceWrapNaturally = 0;
      v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithDynamicProvider:&__block_literal_global_136];
      id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
      v14 = PKUIImageNamed(@"FDICLogo");
      uint64_t v15 = [v13 initWithImage:v14];
      id v16 = p_isa[55];
      p_isa[55] = (id)v15;

      [p_isa[55] setTintColor:v12];
      [p_isa addSubview:p_isa[55]];
      v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithDynamicProvider:&__block_literal_global_32];
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
      id v19 = p_isa[56];
      p_isa[56] = (id)v18;

      id v20 = p_isa[56];
      v21 = objc_msgSend(MEMORY[0x1E4FB08E0], "pk_fdicSignageFont");
      [v20 setFont:v21];

      [p_isa[56] setTextColor:v17];
      [p_isa _updateFDICInsuredText];
      [p_isa addSubview:p_isa[56]];
      if (v4)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v23 = p_isa[53];
        p_isa[53] = v22;

        v24 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
        v25 = [v24 traitCollectionByModifyingTraits:&__block_literal_global_38];

        id v26 = p_isa[53];
        v27 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] compatibleWithTraitCollection:v25];
        [v26 setFont:v27];

        [p_isa[53] setTextColor:v17];
        [p_isa[53] setNumberOfLines:0];
        [p_isa addSubview:p_isa[53]];
        id v28 = p_isa[53];
        v29 = PKLocalizedFeatureString();
        [v28 setText:v29];

        uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
        id v31 = p_isa[54];
        p_isa[54] = (id)v30;

        v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithDynamicProvider:&__block_literal_global_44];
        [p_isa[54] setBackgroundColor:v32];
        [p_isa addSubview:p_isa[54]];
      }
    }
    self = p_isa;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

id __56__PKFDICSignageView_initWithFeature_displayingBankName___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 userInterfaceStyle];
  if ((unint64_t)v2 >= 2)
  {
    if (v2 == (void *)2)
    {
      v2 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }
  else
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithRed:0.0 green:0.196 blue:0.337 alpha:1.0];
  }

  return v2;
}

id __56__PKFDICSignageView_initWithFeature_displayingBankName___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 userInterfaceStyle];
  if ((unint64_t)v2 >= 2)
  {
    if (v2 == (void *)2)
    {
      v2 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v2;
}

uint64_t __56__PKFDICSignageView_initWithFeature_displayingBankName___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setLegibilityWeight:0];
}

id __56__PKFDICSignageView_initWithFeature_displayingBankName___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 userInterfaceStyle];
  if ((unint64_t)v2 >= 2)
  {
    if (v2 == (void *)2)
    {
      v2 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  }

  return v2;
}

- (PKFDICSignageView)initWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 feature];
  uint64_t v6 = [v4 displayingBankName];

  return [(PKFDICSignageView *)self initWithFeature:v5 displayingBankName:v6];
}

- (void)_updateFDICInsuredText
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_displayingBankName && !self->_forceWrapNaturally) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = PKLocalizedFeatureString();
  [(UILabel *)self->_fdicInsuredLabel setNumberOfLines:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v5 setLineHeightMultiple:0.8];
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  v10[0] = v5;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  double v8 = (void *)[v6 initWithString:v4 attributes:v7];

  [(UILabel *)self->_fdicInsuredLabel setAttributedText:v8];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKFDICSignageView;
  [(PKFDICSignageView *)&v3 layoutSubviews];
  [(PKFDICSignageView *)self bounds];
  -[PKFDICSignageView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKFDICSignageView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[PKFDICSignageView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PKFDICSignageView *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v10 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v10 = CGRectMinXEdge;
  }
  memset(&slice, 0, sizeof(slice));
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double v13 = x + left;
  double v14 = y + top;
  double v15 = width - (left + self->_contentInsets.right);
  double v16 = height - (top + self->_contentInsets.bottom);
  v44.origin.double x = v13;
  v44.origin.double y = v14;
  v44.size.double width = v15;
  v44.size.double height = v16;
  double v18 = *MEMORY[0x1E4F1DB30];
  double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (self->_displayingBankName)
  {
    -[UILabel sizeThatFits:](self->_bankNameLabel, "sizeThatFits:", v15, 1.79769313e308);
    CGFloat v20 = v19;
    double v22 = v21;
    v47.origin.double x = v13;
    v47.origin.double y = v14;
    v47.size.double width = v15;
    v47.size.double height = v16;
    CGRectDivide(v47, &slice, &v44, v20, v10);
    if (!a4)
    {
      bankNameLabel = self->_bankNameLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](bankNameLabel, "setFrame:");
    }
    CGRectDivide(v44, &slice, &v44, 12.0, v10);
    double v24 = v18 + v20 + 12.0;
    double v25 = PKUIPixelLength();
    CGRectDivide(v44, &slice, &v44, v25, v10);
    if (!a4)
    {
      divider = self->_divider;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIView setFrame:](divider, "setFrame:");
    }
    double v17 = v17 + v22;
    CGRectDivide(v44, &slice, &v44, 12.0, v10);
    double v18 = v24 + v25 + 12.0;
  }
  v27 = [(UIImageView *)self->_fdicLogoView image];
  [v27 size];
  CGFloat v29 = v28;
  double v31 = v30;

  CGRectDivide(v44, &slice, &v44, v29, v10);
  if (!a4)
  {
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](self->_fdicLogoView, "setFrame:");
  }
  CGRectDivide(v44, &slice, &v44, 9.0, v10);
  fdicInsuredLabel = self->_fdicInsuredLabel;
  if (!self->_displayingBankName) {
    goto LABEL_17;
  }
  -[UILabel sizeThatFits:](fdicInsuredLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v34 = v33;
  double v36 = v35;
  PKFloatRoundToPixel();
  double v38 = v37;
  PKFloatRoundToPixel();
  if (v38 < v39)
  {
    if (!self->_forceWrapNaturally)
    {
      self->_forceWrapNaturalldouble y = 1;
      [(PKFDICSignageView *)self _updateFDICInsuredText];
    }
    fdicInsuredLabel = self->_fdicInsuredLabel;
LABEL_17:
    -[UILabel sizeThatFits:](fdicInsuredLabel, "sizeThatFits:", v44.size.width, 1.79769313e308);
    double v34 = v40;
    double v36 = v41;
    goto LABEL_20;
  }
  if (self->_forceWrapNaturally)
  {
    self->_forceWrapNaturalldouble y = 0;
    [(PKFDICSignageView *)self _updateFDICInsuredText];
  }
LABEL_20:
  if (!a4)
  {
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](self->_fdicInsuredLabel, "setFrame:");
  }
  double v42 = v18 + v29 + 9.0 + v34 + self->_contentInsets.left + self->_contentInsets.right;
  double v43 = fmax(fmax(v17, v31), v36) + self->_contentInsets.top + self->_contentInsets.bottom;
  result.double height = v43;
  result.double width = v42;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(PKFDICSignageView *)self setNeedsLayout];
  }
}

- (BOOL)isEqualToFooter:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_feature == *((void *)v4 + 51)
    && self->_displayingBankName == v4[416];

  return v5;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdicInsuredLabel, 0);
  objc_storeStrong((id *)&self->_fdicLogoView, 0);
  objc_storeStrong((id *)&self->_divider, 0);

  objc_storeStrong((id *)&self->_bankNameLabel, 0);
}

@end