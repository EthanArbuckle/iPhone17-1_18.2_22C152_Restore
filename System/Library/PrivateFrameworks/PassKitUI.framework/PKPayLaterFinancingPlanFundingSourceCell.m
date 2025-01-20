@interface PKPayLaterFinancingPlanFundingSourceCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPayLaterFinancingPlanFundingSource)fundingSource;
- (PKPayLaterFinancingPlanFundingSourceCell)init;
- (PKPayLaterFinancingPlanFundingSourceCell)initWithFrame:(CGRect)a3;
- (void)_populateIconForFundingSource;
- (void)_updateText;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setFundingSource:(id)a3;
@end

@implementation PKPayLaterFinancingPlanFundingSourceCell

- (PKPayLaterFinancingPlanFundingSourceCell)init
{
  return -[PKPayLaterFinancingPlanFundingSourceCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKPayLaterFinancingPlanFundingSourceCell)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterFinancingPlanFundingSourceCell;
  v3 = -[PKPayLaterFinancingPlanFundingSourceCell initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F84898] sharedInstance];
    passLibrary = v3->_passLibrary;
    v3->_passLibrary = (PKPassLibrary *)v4;

    v6 = [(PKPayLaterFinancingPlanFundingSourceCell *)v3 contentView];
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v7;

    [(UIImageView *)v3->_imageView setContentMode:1];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    [v6 addSubview:v3->_imageView];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v11 = v3->_titleLabel;
    v12 = PKLocalizedCocoonString(&cfstr_PaymentMethod.isa);
    [(UILabel *)v11 setText:v12];

    v13 = v3->_titleLabel;
    v14 = (NSString *)*MEMORY[0x1E4FB28C8];
    v15 = (NSString *)*MEMORY[0x1E4FB2790];
    v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UILabel *)v13 setFont:v16];

    [(UILabel *)v3->_titleLabel setTextAlignment:4];
    [v6 addSubview:v3->_titleLabel];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v17;

    [(UILabel *)v3->_detailLabel setNumberOfLines:0];
    v19 = v3->_detailLabel;
    v20 = PKFontForDefaultDesign(v14, v15);
    [(UILabel *)v19 setFont:v20];

    v21 = v3->_detailLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v3->_detailLabel setTextAlignment:4];
    [v6 addSubview:v3->_detailLabel];
  }
  return v3;
}

- (void)setFundingSource:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fundingSource, a3);
    [(PKPayLaterFinancingPlanFundingSourceCell *)self _populateIconForFundingSource];
    [(PKPayLaterFinancingPlanFundingSourceCell *)self _updateText];
    [(PKPayLaterFinancingPlanFundingSourceCell *)self setNeedsLayout];
  }
}

- (void)_populateIconForFundingSource
{
  if (([(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource type] | 2) == 3)
  {
    v3 = [(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource paymentPassDetails];
    uint64_t v4 = [v3 dpanIdentifier];
    id v5 = [v3 fpanIdentifier];
    if (v4)
    {
      v6 = [(PKPassLibrary *)self->_passLibrary passWithDPANIdentifier:v4];
      if (v6)
      {
LABEL_9:
        if (v6)
        {
          [v6 style];
          PKPassFrontFaceContentSize();
          PKSizeAspectFit();
          self->_iconSize.width = v8;
          self->_iconSize.height = v9;
          v10 = [[PKPassView alloc] initWithPass:v6 content:4 suppressedContent:2039];
          -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v10, "snapshotOfFrontFaceWithRequestedSize:", self->_iconSize.width, self->_iconSize.height);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          PKUINetworkImageForCredentialType([v3 cardNetwork]);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          [v13 size];
          self->_iconSize.width = v11;
          self->_iconSize.height = v12;
        }

        id v7 = v13;
        goto LABEL_13;
      }
    }
    else
    {
      v6 = 0;
    }
    if (v5)
    {
      v6 = [(PKPassLibrary *)self->_passLibrary passWithFPANIdentifier:v5];
    }
    goto LABEL_9;
  }
  id v7 = 0;
LABEL_13:
  id v14 = v7;
  [(UIImageView *)self->_imageView setImage:v7];
}

- (void)_updateText
{
  if (([(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource type] | 2) == 3)
  {
    id v6 = [(PKPayLaterFinancingPlanFundingSource *)self->_fundingSource paymentPassDetails];
    detailLabel = self->_detailLabel;
    uint64_t v4 = [v6 cardSuffix];
    id v5 = PKMaskedPaymentPAN();
    [(UILabel *)detailLabel setText:v5];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlanFundingSourceCell;
  [(PKPayLaterFinancingPlanFundingSourceCell *)&v4 layoutSubviews];
  v3 = [(PKPayLaterFinancingPlanFundingSourceCell *)self contentView];
  [v3 bounds];
  -[PKPayLaterFinancingPlanFundingSourceCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterFinancingPlanFundingSourceCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = [(PKPayLaterFinancingPlanFundingSourceCell *)self accessories];
  uint64_t v11 = [v10 count];

  double v12 = x + 16.0;
  double v13 = y + 16.0;
  double v14 = 32.0;
  if (v11) {
    double v14 = 26.0;
  }
  double v44 = width;
  double v15 = width - v14;
  double v16 = height + -32.0;
  int v17 = [(PKPayLaterFinancingPlanFundingSourceCell *)self _shouldReverseLayoutDirection];
  if (v17) {
    CGRectEdge v18 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v18 = CGRectMinXEdge;
  }
  if (v17) {
    CGRectEdge v19 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v19 = CGRectMaxXEdge;
  }
  memset(&v49, 0, sizeof(v49));
  remainder.origin.double x = x + 16.0;
  remainder.origin.double y = y + 16.0;
  remainder.size.double width = v15;
  remainder.size.double height = height + -32.0;
  double v20 = self->_iconSize.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15, height, *(void *)&self->_iconSize.width);
  CGFloat v22 = v21;
  double v24 = v23;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v15, height);
  CGFloat v26 = v25;
  double v28 = fmax(v24, fmax(v27, v20));
  memset(&slice, 0, sizeof(slice));
  v51.origin.double x = v12;
  v51.origin.double y = v13;
  v51.size.double width = v15;
  v51.size.double height = v16;
  CGRectDivide(v51, &slice, &remainder, v22, v18);
  PKSizeAlignedInRect();
  slice.origin.double x = v29;
  slice.origin.double y = v30;
  slice.size.double width = v31;
  slice.size.double height = v32;
  memset(&v46, 0, sizeof(v46));
  CGRectDivide(remainder, &v46, &remainder, v26, v19);
  PKSizeAlignedInRect();
  v46.origin.double x = v33;
  v46.origin.double y = v34;
  v46.size.double width = v35;
  v46.size.double height = v36;
  CGRectDivide(remainder, &v49, &remainder, 5.0, v19);
  memset(&v45, 0, sizeof(v45));
  CGRectDivide(remainder, &v45, &remainder, v43, v19);
  PKSizeAlignedInRect();
  v45.origin.double x = v37;
  v45.origin.double y = v38;
  v45.size.double width = v39;
  v45.size.double height = v40;
  if (!a4)
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  }
  double v41 = v28 + 0.0 + 32.0;
  double v42 = v44;
  result.double height = v41;
  result.double width = v42;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlanFundingSourceCell;
  [(PKPayLaterFinancingPlanFundingSourceCell *)&v4 prepareForReuse];
  fundingSource = self->_fundingSource;
  self->_fundingSource = 0;

  self->_iconSize = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (PKPayLaterFinancingPlanFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);

  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end