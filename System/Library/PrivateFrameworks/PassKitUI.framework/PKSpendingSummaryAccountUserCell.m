@interface PKSpendingSummaryAccountUserCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)amount;
- (NSString)identifier;
- (NSString)name;
- (PKSpendingSummaryAccountUserCell)initWithFrame:(CGRect)a3;
- (UIImage)avatar;
- (void)layoutSubviews;
- (void)setAmount:(id)a3;
- (void)setAvatar:(id)a3;
- (void)setName:(id)a3;
@end

@implementation PKSpendingSummaryAccountUserCell

- (PKSpendingSummaryAccountUserCell)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)PKSpendingSummaryAccountUserCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    amountLabel = v3->_amountLabel;
    v3->_amountLabel = (UILabel *)v12;

    [(UILabel *)v3->_amountLabel setNumberOfLines:1];
    v14 = v3->_amountLabel;
    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v14 setTextColor:v15];

    uint64_t v16 = PKUIGetMinScreenWidthType();
    v17 = v3->_amountLabel;
    BOOL v18 = v16 == 0;
    if (v16) {
      v19 = (void *)*MEMORY[0x1E4FB28C8];
    }
    else {
      v19 = (void *)*MEMORY[0x1E4FB2950];
    }
    v20 = (void *)*MEMORY[0x1E4FB27F0];
    if (v18) {
      v21 = (void *)*MEMORY[0x1E4FB28F0];
    }
    else {
      v21 = (void *)*MEMORY[0x1E4FB2950];
    }
    v22 = PKFontForDefaultDesign(v19, (void *)*MEMORY[0x1E4FB27F0], 0x8000, 0);
    [(UILabel *)v17 setFont:v22];

    v23 = [(PKSpendingSummaryAccountUserCell *)v3 contentView];
    [v23 addSubview:v3->_amountLabel];

    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v24;

    [(UILabel *)v3->_nameLabel setNumberOfLines:1];
    v26 = v3->_nameLabel;
    v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v26 setTextColor:v27];

    v28 = v3->_nameLabel;
    v29 = PKFontForDefaultDesign(v21, v20, 0x8000, 0);
    [(UILabel *)v28 setFont:v29];

    v30 = [(PKSpendingSummaryAccountUserCell *)v3 contentView];
    [v30 addSubview:v3->_nameLabel];

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v8, v9, v10, v11);
    avatarView = v3->_avatarView;
    v3->_avatarView = (UIImageView *)v31;

    v33 = [(UIImageView *)v3->_avatarView layer];
    id v34 = [MEMORY[0x1E4FB1618] systemGray6Color];
    objc_msgSend(v33, "setBorderColor:", objc_msgSend(v34, "CGColor"));

    v35 = [(UIImageView *)v3->_avatarView layer];
    [v35 setBorderWidth:1.0];

    v36 = [(UIImageView *)v3->_avatarView layer];
    [v36 setMasksToBounds:1];

    v37 = [(UIImageView *)v3->_avatarView layer];
    [v37 setCornerRadius:12.0];

    v38 = [(PKSpendingSummaryAccountUserCell *)v3 contentView];
    [v38 addSubview:v3->_avatarView];

    [(PKDashboardCollectionViewCell *)v3 setMaskType:3];
    [(UILabel *)v3->_nameLabel setText:@" "];
    [(UILabel *)v3->_amountLabel setText:@" "];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryAccountUserCell;
  [(PKDashboardCollectionViewCell *)&v3 layoutSubviews];
  [(PKSpendingSummaryAccountUserCell *)self bounds];
  [(PKSpendingSummaryAccountUserCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKSpendingSummaryAccountUserCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double width = a3.size.width;
  CGFloat v5 = a3.origin.x + 12.0;
  CGFloat v6 = a3.origin.y + 11.0;
  CGFloat v7 = a3.size.height + -18.0;
  memset(&slice, 0, sizeof(slice));
  [(PKSpendingSummaryAccountUserCell *)self _shouldReverseLayoutDirection];
  v17.origin.x = v5;
  v17.origin.y = v6;
  v17.size.double width = width + -24.0;
  v17.size.height = v7;
  v20.origin.x = v5;
  v20.origin.y = v6;
  v20.size.double width = width + -24.0;
  v20.size.height = v7;
  CGRectDivide(v20, &slice, &v17, 24.0, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    avatarView = self->_avatarView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](avatarView, "setFrame:");
  }
  CGRectDivide(v17, &slice, &v17, 2.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", v17.size.width, v17.size.height);
  double v10 = v9;
  CGRectDivide(v17, &slice, &v17, v9, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    nameLabel = self->_nameLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](nameLabel, "setFrame:");
  }
  CGRectDivide(v17, &slice, &v17, 0.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", v17.size.width, v17.size.height);
  double v13 = v12;
  CGRectDivide(v17, &slice, &v17, v12, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    amountLabel = self->_amountLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](amountLabel, "setFrame:");
  }
  CGRectDivide(v17, &slice, &v17, 0.0, CGRectMinYEdge);
  double v15 = v10 + 0.0 + 37.0 + v13 + 7.0;
  double v16 = width;
  result.height = v15;
  result.double width = v16;
  return result;
}

- (void)setAmount:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UILabel *)self->_amountLabel text];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_amountLabel setText:v8];
    [(PKSpendingSummaryAccountUserCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setName:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UILabel *)self->_nameLabel text];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_nameLabel setText:v8];
    [(PKSpendingSummaryAccountUserCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setAvatar:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_avatarView image];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(UIImageView *)self->_avatarView setImage:v6];
    [(PKSpendingSummaryAccountUserCell *)self setNeedsLayout];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)amount
{
  return self->_amount;
}

- (UIImage)avatar
{
  return self->_avatar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_amountLabel, 0);
}

@end