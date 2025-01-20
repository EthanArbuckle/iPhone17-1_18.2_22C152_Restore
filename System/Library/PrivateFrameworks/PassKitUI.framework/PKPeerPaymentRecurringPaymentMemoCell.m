@interface PKPeerPaymentRecurringPaymentMemoCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentRecurringPaymentMemoCell)initWithFrame:(CGRect)a3;
- (PKPeerPaymentRecurringPaymentMemoCellDelegate)delegate;
- (PKPeerPaymentRecurringPaymentMemoRowItem)item;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentMemoCell

- (PKPeerPaymentRecurringPaymentMemoCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentRecurringPaymentMemoCell;
  v3 = -[PKPeerPaymentRecurringPaymentMemoCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)MEMORY[0x1E4FB14D0];
    v5 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v6 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __55__PKPeerPaymentRecurringPaymentMemoCell_initWithFrame___block_invoke;
    v20 = &unk_1E59CBEE0;
    objc_copyWeak(&v21, &location);
    v7 = [v6 actionWithHandler:&v17];
    uint64_t v8 = objc_msgSend(v4, "buttonWithConfiguration:primaryAction:", v5, v7, v17, v18, v19, v20);
    iconButton = v3->_iconButton;
    v3->_iconButton = (UIButton *)v8;

    v10 = [(PKPeerPaymentRecurringPaymentMemoCell *)v3 contentView];
    [v10 addSubview:v3->_iconButton];

    v11 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    textField = v3->_textField;
    v3->_textField = v11;

    [(UITextField *)v3->_textField setDelegate:v3];
    [(UITextField *)v3->_textField setClearButtonMode:1];
    [(UITextField *)v3->_textField setReturnKeyType:9];
    v13 = v3->_textField;
    v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    [(UITextField *)v13 setFont:v14];

    v15 = [(PKPeerPaymentRecurringPaymentMemoCell *)v3 contentView];
    [v15 addSubview:v3->_textField];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __55__PKPeerPaymentRecurringPaymentMemoCell_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[110] resignFirstResponder];
    id v2 = objc_loadWeakRetained(v3 + 112);
    [v2 memoIconWasTapped];

    WeakRetained = v3;
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentRecurringPaymentMemoCell;
  [(PKPeerPaymentRecurringPaymentMemoCell *)&v12 layoutSubviews];
  v3 = [(PKPeerPaymentRecurringPaymentMemoCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKPeerPaymentRecurringPaymentMemoCell _layoutWithBounds:](self, "_layoutWithBounds:", v5, v7, v9, v11);
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UITextField sizeThatFits:](self->_textField, "sizeThatFits:", a3.size.width, a3.size.height);
  double v8 = fmax(v7 + 16.0, 61.0);
  memset(&slice, 0, sizeof(slice));
  if ([(PKPeerPaymentRecurringPaymentMemoCell *)self _shouldReverseLayoutDirection])uint64_t v9 = 2; {
  else
  }
    uint64_t v9 = 0x200000000;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.height = v8;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.height = v8;
  CGRectDivide(v22, &slice, &v19, 8.0, CGRectMinYEdge);
  CGRectDivide(v19, &slice, &v19, 8.0, CGRectMaxYEdge);
  CGRectDivide(v19, &slice, &v19, 16.0, (CGRectEdge)v9);
  CGRectDivide(v19, &slice, &v19, 16.0, HIDWORD(v9));
  if ([(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item hasIcon]
    || [(PKPeerPaymentRecurringPaymentDetailRowItem *)self->_item isEditable])
  {
    CGRectDivide(v19, &slice, &v19, 45.0, CGRectMinXEdge);
    iconButton = self->_iconButton;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](iconButton, "setFrame:");
    emojiLabel = self->_emojiLabel;
    [(UIButton *)self->_iconButton bounds];
    -[UILabel setFrame:](emojiLabel, "setFrame:");
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  [(UIButton *)self->_iconButton setHidden:v12 ^ 1u];
  [(UILabel *)self->_emojiLabel setHidden:v12 ^ 1u];
  if ([(PKPeerPaymentRecurringPaymentDetailRowItem *)self->_item isEditable]
    || (([(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item memo],
         v13 = objc_claimAutoreleasedReturnValue(),
         [v13 text],
         v14 = objc_claimAutoreleasedReturnValue(),
         ![v14 length])
      ? (char v15 = v12)
      : (char v15 = 0),
        v14,
        v13,
        (v15 & 1) == 0))
  {
    if (v12) {
      CGRectDivide(v19, &slice, &v19, 16.0, CGRectMinXEdge);
    }
    -[UITextField setFrame:](self->_textField, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 1;
  }
  [(UITextField *)self->_textField setHidden:v16];
  double v17 = width;
  double v18 = v8;
  result.height = v18;
  result.CGFloat width = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPeerPaymentRecurringPaymentMemoCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)setItem:(id)a3
{
  id v33 = a3;
  p_item = &self->_item;
  objc_storeStrong((id *)&self->_item, a3);
  double v6 = [(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item memo];
  double v7 = [(UIButton *)self->_iconButton configuration];
  double v8 = [v7 background];
  [v8 setCornerRadius:6.0];
  if ([(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item hasIcon])
  {
    [v8 setImage:0];
    uint64_t v9 = PKPeerPaymentMessageColorFromSemanticColor([v6 color]);
    [v8 setBackgroundColor:v9];

    if (!self->_emojiLabel)
    {
      double v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      emojiLabel = self->_emojiLabel;
      self->_emojiLabel = v10;

      [(UILabel *)self->_emojiLabel setTextAlignment:1];
      int v12 = self->_emojiLabel;
      v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:24.75];
      [(UILabel *)v12 setFont:v13];

      [(UIButton *)self->_iconButton addSubview:self->_emojiLabel];
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:27.0];
    char v15 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v17 = [v15 configurationWithHierarchicalColor:v16];
    double v18 = [v14 configurationByApplyingConfiguration:v17];

    CGRect v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus" withConfiguration:v18];
    [v8 setImage:v19];
    [v8 setImageContentMode:4];
    v20 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    [v8 setBackgroundColor:v20];
  }
  [(UIButton *)self->_iconButton setConfiguration:v7];
  id v21 = self->_emojiLabel;
  CGRect v22 = [v6 emoji];
  [(UILabel *)v21 setText:v22];

  objc_super v23 = [v6 text];
  uint64_t v24 = [v23 length];

  textField = self->_textField;
  if (v24) {
    [v6 text];
  }
  else {
  v26 = [(PKPeerPaymentRecurringPaymentMemoRowItem *)*p_item suggestedText];
  }
  [(UITextField *)textField setText:v26];

  uint64_t v27 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)*p_item isEditable];
  [(UIButton *)self->_iconButton setUserInteractionEnabled:v27];
  [(UITextField *)self->_textField setUserInteractionEnabled:v27];
  v28 = self->_textField;
  if (v27) {
    v29 = @"DETAILS_MEMO_TEXT_PLACEHOLDER_EDITING";
  }
  else {
    v29 = @"DETAILS_MEMO_TEXT_PLACEHOLDER_NOT_EDITING";
  }
  v30 = PKLocalizedPeerPaymentRecurringString(&v29->isa);
  [(UITextField *)v28 setPlaceholder:v30];

  v31 = self->_textField;
  v32 = [v33 titleColor];
  [(UITextField *)v31 setTextColor:v32];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  double v10 = [a3 text];
  double v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  unint64_t v12 = [v11 length];
  if (v12 <= 0x24)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained memoTextWasUpdated:v11];
  }
  return v12 < 0x25;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained memoTextWasUpdated:0];

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return [(UITextField *)self->_textField becomeFirstResponder];
}

- (PKPeerPaymentRecurringPaymentMemoRowItem)item
{
  return self->_item;
}

- (PKPeerPaymentRecurringPaymentMemoCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentRecurringPaymentMemoCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);

  objc_storeStrong((id *)&self->_emojiLabel, 0);
}

@end