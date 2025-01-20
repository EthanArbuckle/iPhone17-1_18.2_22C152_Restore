@interface PKPaymentPassTableViewCell
+ (double)heightForCellWithMinimum:(double)a3 hasSubTitle:(BOOL)a4;
+ (id)subTitleFont;
+ (id)titleFont;
- (PKPaymentPass)pass;
- (PKPaymentPassTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKTransitBalanceModel)transitBalanceModel;
- (UIColor)disabledMainLabelColor;
- (UIColor)disabledSubTextLabelColor;
- (UIColor)mainLabelColor;
- (UIColor)subTextLabelColor;
- (void)_updateLabelText;
- (void)_updateLabelTextColors;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)setDisabledMainLabelColor:(id)a3;
- (void)setDisabledSubTextLabelColor:(id)a3;
- (void)setMainLabelColor:(id)a3;
- (void)setPass:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setSubTextLabelColor:(id)a3;
- (void)setTransitBalanceModel:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PKPaymentPassTableViewCell

- (PKPaymentPassTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentPassTableViewCell;
  v4 = [(PKPaymentPassTableViewCell *)&v27 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
    mainLabelColor = v4->_mainLabelColor;
    v4->_mainLabelColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    subTextLabelColor = v4->_subTextLabelColor;
    v4->_subTextLabelColor = (UIColor *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    disabledMainLabelColor = v4->_disabledMainLabelColor;
    v4->_disabledMainLabelColor = (UIColor *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    disabledSubTextLabelColor = v4->_disabledSubTextLabelColor;
    v4->_disabledSubTextLabelColor = (UIColor *)v11;

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = v13;

    v15 = v4->_mainLabel;
    v16 = [(id)objc_opt_class() titleFont];
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v4->_mainLabel setTextColor:v4->_mainLabelColor];
    v17 = [(PKPaymentPassTableViewCell *)v4 contentView];
    [v17 addSubview:v4->_mainLabel];

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subTextLabel = v4->_subTextLabel;
    v4->_subTextLabel = v18;

    v20 = v4->_subTextLabel;
    v21 = [(id)objc_opt_class() subTitleFont];
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v4->_subTextLabel setTextColor:v4->_subTextLabelColor];
    v22 = [(PKPaymentPassTableViewCell *)v4 contentView];
    [v22 addSubview:v4->_subTextLabel];

    [(PKPaymentPassTableViewCell *)v4 setAutoresizingMask:18];
    v23 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    v24 = [(PKPaymentPassTableViewCell *)v4 contentView];
    [v24 addSubview:v23];

    [(UIView *)v23 startAnimating];
    cardSnapshotView = v4->_cardSnapshotView;
    v4->_cardSnapshotView = v23;
  }
  return v4;
}

+ (id)titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)subTitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (double)heightForCellWithMinimum:(double)a3 hasSubTitle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a1 titleFont];
  [v7 lineHeight];
  double v9 = v8;

  if (v4)
  {
    v10 = [a1 subTitleFont];
    [v10 lineHeight];
    double v9 = v9 + v11;
  }
  double result = v9 + 16.0;
  if (v9 + 16.0 <= a3) {
    return a3;
  }
  return result;
}

- (void)setPass:(id)a3
{
  id v5 = a3;
  p_pass = &self->_pass;
  objc_storeStrong((id *)&self->_pass, a3);
  if ([(PKPaymentPass *)self->_pass isStoredValuePass])
  {
    uint64_t v7 = (PKTransitBalanceModel *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:*p_pass];
    transitBalanceModel = self->_transitBalanceModel;
    self->_transitBalanceModel = v7;

    double v9 = self->_transitBalanceModel;
    v10 = [MEMORY[0x1E4F850D8] passPropertiesForPass:*p_pass];
    [(PKTransitBalanceModel *)v9 setTransitProperties:v10 andApplyStoredValueBalances:1];
  }
  else
  {
    v10 = self->_transitBalanceModel;
    self->_transitBalanceModel = 0;
  }

  [(PKPaymentPassTableViewCell *)self _updateLabelText];
  double v11 = +[PKPassSnapshotter sharedInstance];
  v12 = *p_pass;
  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__PKPaymentPassTableViewCell_setPass___block_invoke;
  v14[3] = &unk_1E59CA898;
  v14[4] = self;
  objc_msgSend(v11, "snapshotWithPass:size:completion:", v12, v14, 66.0, v13);
}

void __38__PKPaymentPassTableViewCell_setPass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PKPaymentPassTableViewCell_setPass___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __38__PKPaymentPassTableViewCell_setPass___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1072);
  *(void *)(v2 + 1072) = 0;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1072);
  *(void *)(v5 + 1072) = v4;

  [*(id *)(*(void *)(a1 + 32) + 1072) setAccessibilityIgnoresInvertColors:1];
  uint64_t v7 = [*(id *)(a1 + 32) contentView];
  [v7 addSubview:*(void *)(*(void *)(a1 + 32) + 1072)];

  double v8 = *(void **)(a1 + 32);

  return [v8 setNeedsLayout];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassTableViewCell;
  [(PKPaymentPassTableViewCell *)&v4 setUserInteractionEnabled:a3];
  [(PKPaymentPassTableViewCell *)self _updateLabelTextColors];
}

- (void)setMainLabelColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_mainLabelColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mainLabelColor, a3);
    [(PKPaymentPassTableViewCell *)self _updateLabelTextColors];
    uint64_t v5 = v6;
  }
}

- (void)setSubTextLabelColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_subTextLabelColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_subTextLabelColor, a3);
    [(PKPaymentPassTableViewCell *)self _updateLabelTextColors];
    uint64_t v5 = v6;
  }
}

- (void)setDisabledMainLabelColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_disabledMainLabelColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_disabledMainLabelColor, a3);
    [(PKPaymentPassTableViewCell *)self _updateLabelTextColors];
    uint64_t v5 = v6;
  }
}

- (void)setDisabledSubTextLabelColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_disabledSubTextLabelColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_disabledSubTextLabelColor, a3);
    [(PKPaymentPassTableViewCell *)self _updateLabelTextColors];
    uint64_t v5 = v6;
  }
}

- (void)setPeerPaymentAccount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
    [(PKPaymentPassTableViewCell *)self _updateLabelText];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentPassTableViewCell;
  [(PKPaymentPassTableViewCell *)&v36 layoutSubviews];
  id v3 = [(PKPaymentPassTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  if ([(PKPaymentPassTableViewCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  v37.origin.double x = v5;
  v37.origin.y = v7;
  v37.size.double width = v9;
  v37.size.CGFloat height = v11;
  CGRectDivide(v37, &slice, &remainder, 20.0, v12);
  [(UIView *)self->_cardSnapshotView frame];
  [(PKPaymentPassTableViewCell *)self _shouldReverseLayoutDirection];
  PKSizeAlignedInRect();
  remainder.origin.double x = v13;
  remainder.origin.y = v14;
  remainder.size.double width = v15;
  remainder.size.CGFloat height = v16;
  -[UIView setFrame:](self->_cardSnapshotView, "setFrame:");
  memset(&v33, 0, sizeof(v33));
  if ([(PKPaymentPassTableViewCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v17 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v17 = CGRectMinXEdge;
  }
  v38.origin.double x = v5;
  v38.origin.y = v7;
  v38.size.double width = v9;
  v38.size.CGFloat height = v11;
  CGRectDivide(v38, &slice, &v33, 96.0, v17);
  if ([(PKPaymentPassTableViewCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v18 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v18 = CGRectMaxXEdge;
  }
  CGRectDivide(v33, &slice, &v33, 0.0, v18);
  [(UILabel *)self->_mainLabel frame];
  [(PKPaymentPassTableViewCell *)self _shouldReverseLayoutDirection];
  PKSizeAlignedInRect();
  v33.origin.double x = v19;
  v33.origin.y = v20;
  v33.size.double width = v21;
  v33.size.CGFloat height = v22;
  -[UILabel setFrame:](self->_mainLabel, "setFrame:");
  [(UILabel *)self->_subTextLabel frame];
  double v24 = v23;
  CGFloat height = v33.size.height;
  double v26 = v11 * 0.5 - (v33.size.height + v24) * 0.5;
  if (v26 <= 8.0)
  {
    v33.origin.y = v11 * 0.5 - (v33.size.height + v24) * 0.5;
    double width = v33.size.width;
    double x = v33.origin.x;
    CGFloat v30 = v33.origin.x;
    double v31 = v26;
    CGFloat v32 = v33.size.width;
    double MaxY = CGRectGetMaxY(*(CGRect *)(&height - 3));
  }
  else
  {
    v33.origin.y = 8.0;
    double MaxY = v11 + -8.0 - v24;
    double x = v33.origin.x;
    double width = v33.size.width;
  }
  -[UILabel setFrame:](self->_mainLabel, "setFrame:");
  -[UILabel setFrame:](self->_subTextLabel, "setFrame:", x, MaxY, width, v24);
}

- (void)_updateLabelText
{
  mainLabel = self->_mainLabel;
  double v4 = [(PKPaymentPass *)self->_pass localizedDescription];
  [(UILabel *)mainLabel setText:v4];

  [(UILabel *)self->_mainLabel sizeToFit];
  int v5 = [(PKPaymentPass *)self->_pass isAccessPass];
  pass = self->_pass;
  if (v5)
  {
    CGFloat v7 = [(PKPaymentPass *)pass fieldForKey:*MEMORY[0x1E4F87A28]];
    double v8 = [(PKPaymentPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A30]];
    if ([(PKPaymentPass *)self->_pass supportsSharing]) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    double v10 = v7;
    if (v9 && (double v10 = v8) == 0)
    {
      id v19 = 0;
    }
    else
    {
      id v19 = [v10 value];
    }

    goto LABEL_10;
  }
  if ([(PKPaymentPass *)pass isStoredValuePass])
  {
    uint64_t v11 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableListOfBalances];
LABEL_13:
    if (v11) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])
  {
    CGRectEdge v12 = [(PKPaymentPass *)self->_pass uniqueID];
    CGFloat v13 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    id v14 = v12;
    id v15 = v13;
    if (v14 == v15)
    {

LABEL_26:
      CGFloat v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
      id v19 = [v7 minimalFormattedStringValue];
LABEL_10:

      uint64_t v11 = (uint64_t)v19;
      goto LABEL_13;
    }
    CGFloat v16 = v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
    }
    else
    {
      char v18 = [v14 isEqualToString:v15];

      if (v18) {
        goto LABEL_26;
      }
    }
  }
LABEL_27:
  uint64_t v11 = PKSanitizedPrimaryAccountRepresentationForPass();
LABEL_28:
  id v20 = (id)v11;
  [(UILabel *)self->_subTextLabel setText:v11];
  [(UILabel *)self->_subTextLabel sizeToFit];
  [(PKPaymentPassTableViewCell *)self setNeedsLayout];
}

- (void)_updateLabelTextColors
{
  int v3 = [(PKPaymentPassTableViewCell *)self isUserInteractionEnabled];
  uint64_t v4 = 2;
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 3;
  }
  [(UILabel *)self->_mainLabel setTextColor:*(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPaymentPassTableViewCell__mainLabelColor[v4])];
  subTextLabel = self->_subTextLabel;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___PKPaymentPassTableViewCell__mainLabelColor[v5]);

  [(UILabel *)subTextLabel setTextColor:v7];
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (UIColor)mainLabelColor
{
  return self->_mainLabelColor;
}

- (UIColor)subTextLabelColor
{
  return self->_subTextLabelColor;
}

- (UIColor)disabledMainLabelColor
{
  return self->_disabledMainLabelColor;
}

- (UIColor)disabledSubTextLabelColor
{
  return self->_disabledSubTextLabelColor;
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void)setTransitBalanceModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_disabledSubTextLabelColor, 0);
  objc_storeStrong((id *)&self->_disabledMainLabelColor, 0);
  objc_storeStrong((id *)&self->_subTextLabelColor, 0);
  objc_storeStrong((id *)&self->_mainLabelColor, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_cardSnapshotView, 0);
  objc_storeStrong((id *)&self->_subTextLabel, 0);

  objc_storeStrong((id *)&self->_mainLabel, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassTableViewCell;
  id v4 = a3;
  [(PKTableViewCell *)&v10 pk_applyAppearance:v4];
  uint64_t v5 = objc_msgSend(v4, "textColor", v10.receiver, v10.super_class);
  [(PKPaymentPassTableViewCell *)self setMainLabelColor:v5];

  double v6 = [v4 altTextColor];
  [(PKPaymentPassTableViewCell *)self setSubTextLabelColor:v6];

  uint64_t v7 = [v4 altTextColor];
  [(PKPaymentPassTableViewCell *)self setDisabledMainLabelColor:v7];

  double v8 = [v4 altTextColor];
  [(PKPaymentPassTableViewCell *)self setDisabledSubTextLabelColor:v8];

  BOOL v9 = [v4 tintColor];

  [(PKPaymentPassTableViewCell *)self setTintColor:v9];
}

@end