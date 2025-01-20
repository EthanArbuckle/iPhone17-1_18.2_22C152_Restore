@interface PKPeerPaymentMessagesMultiActionView
- (BOOL)isEnabled;
- (BOOL)usesFlexibleButtonWidth;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forStyle:(unint64_t)a4;
- (PKPeerPaymentMessagesMultiActionView)init;
- (double)_heightForPrimaryButtonForAvailableSize:(CGSize)a3;
- (id)_axIdentifierForAction:(unint64_t)a3;
- (id)_primaryButton;
- (id)_secondaryButton;
- (id)_titleForAction:(unint64_t)a3;
- (id)actionHandler;
- (unint64_t)centerAction;
- (unint64_t)leadingAction;
- (unint64_t)style;
- (unint64_t)trailingAction;
- (void)_handleActionButton:(id)a3;
- (void)layoutSubviews;
- (void)setActionHandler:(id)a3;
- (void)setActivityIndicatorVisible:(BOOL)a3 forAction:(unint64_t)a4;
- (void)setCenterAction:(unint64_t)a3;
- (void)setCenterButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setLeadingAction:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTrailingAction:(unint64_t)a3;
- (void)setUsesFlexibleButtonWidth:(BOOL)a3;
@end

@implementation PKPeerPaymentMessagesMultiActionView

- (PKPeerPaymentMessagesMultiActionView)init
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentMessagesMultiActionView;
  v2 = [(PKPeerPaymentMessagesMultiActionView *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPeerPaymentMessagesMultiActionView *)v3 setBackgroundColor:v4];

    uint64_t v5 = [(PKPeerPaymentMessagesMultiActionView *)v3 _secondaryButton];
    centerButton = v3->_centerButton;
    v3->_centerButton = (UIButton *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v8 = (void *)[v7 initWithType:*MEMORY[0x1E4F3A0D0]];
    [v8 setName:@"gaussianBlur"];
    v9 = [(UIButton *)v3->_centerButton layer];
    v17[0] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v9 setFilters:v10];

    [(PKPeerPaymentMessagesMultiActionView *)v3 addSubview:v3->_centerButton];
    uint64_t v11 = [(PKPeerPaymentMessagesMultiActionView *)v3 _primaryButton];
    leadingButton = v3->_leadingButton;
    v3->_leadingButton = (PKPeerPaymentMessagesRoundedRectangleButton *)v11;

    [(PKPeerPaymentMessagesMultiActionView *)v3 addSubview:v3->_leadingButton];
    uint64_t v13 = [(PKPeerPaymentMessagesMultiActionView *)v3 _primaryButton];
    trailingButton = v3->_trailingButton;
    v3->_trailingButton = (PKPeerPaymentMessagesRoundedRectangleButton *)v13;

    [(PKPeerPaymentMessagesMultiActionView *)v3 addSubview:v3->_trailingButton];
    [(PKPeerPaymentMessagesMultiActionView *)v3 setCenterButtonVisible:1 animated:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3 forStyle:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if (self->_leadingAction) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = self->_trailingAction != 0;
  }
  if (a4) {
    BOOL v8 = self->_centerAction == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = v8;
  if (PKIsPad()) {
    double v10 = 178.0;
  }
  else {
    double v10 = 168.0;
  }
  if (PKIsPad()) {
    double v11 = 163.0;
  }
  else {
    double v11 = 153.0;
  }
  if (v10 + v11 < width)
  {
    if (PKIsPad()) {
      double v12 = 178.0;
    }
    else {
      double v12 = 168.0;
    }
    if (PKIsPad()) {
      double v13 = 163.0;
    }
    else {
      double v13 = 153.0;
    }
    double width = v12 + v13;
  }
  -[PKPeerPaymentMessagesMultiActionView _heightForPrimaryButtonForAvailableSize:](self, "_heightForPrimaryButtonForAvailableSize:", width, height);
  double v15 = v14;
  -[UIButton sizeThatFits:](self->_centerButton, "sizeThatFits:", width, height - v14);
  double v17 = v16 + 0.0;
  if (v9) {
    double v17 = 0.0;
  }
  double v18 = v15 + 0.0;
  if (!v7) {
    double v18 = v17;
  }
  double v19 = v15 + 16.0 + v16;
  if ((!v7 | v9)) {
    double v19 = v18;
  }
  double v20 = width;
  result.double height = v19;
  result.double width = v20;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:forStyle:](self, "sizeThatFits:forStyle:", self->_style, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)PKPeerPaymentMessagesMultiActionView;
  [(PKPeerPaymentMessagesMultiActionView *)&v40 layoutSubviews];
  [(PKPeerPaymentMessagesMultiActionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[PKPeerPaymentMessagesMultiActionView sizeThatFits:](self, "sizeThatFits:", v7, v9);
  v41.origin.x = v4;
  v41.origin.double y = v6;
  v41.size.double width = v8;
  v41.size.double height = v10;
  CGRectGetHeight(v41);
  if (self->_usesFlexibleButtonWidth)
  {
    v42.origin.x = v4;
    v42.origin.double y = v6;
    v42.size.double width = v8;
    v42.size.double height = v10;
    CGRectGetWidth(v42);
  }
  memset(&slice, 0, sizeof(slice));
  UIRectCenteredXInRect();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  remainder.origin.x = v11;
  remainder.origin.double y = v13;
  remainder.size.double width = v15;
  remainder.size.double height = v17;
  int v19 = [(PKPeerPaymentMessagesMultiActionView *)self _shouldReverseLayoutDirection];
  unint64_t leadingAction = self->_leadingAction;
  unint64_t trailingAction = self->_trailingAction;
  if (v19) {
    CGRectEdge v22 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v22 = CGRectMinXEdge;
  }
  unint64_t centerAction = self->_centerAction;
  memset(&v37, 0, sizeof(v37));
  -[PKPeerPaymentMessagesMultiActionView _heightForPrimaryButtonForAvailableSize:](self, "_heightForPrimaryButtonForAvailableSize:", v16, v18, 0);
  CGFloat v25 = v24;
  v43.origin.x = v12;
  v43.origin.double y = v14;
  v43.size.double width = v16;
  v43.size.double height = v18;
  CGRectDivide(v43, &v37, &remainder, v25, CGRectMinYEdge);
  if (leadingAction && trailingAction)
  {
    double Width = CGRectGetWidth(remainder);
    if (self->_usesFlexibleButtonWidth
      || (!PKIsPad() ? (double v27 = 153.0) : (double v27 = 163.0), v27 * 2.0 + 15.0 > Width))
    {
      PKFloatRoundToPixel();
      double v29 = v28 * 0.5;
    }
    else if (PKIsPad())
    {
      double v29 = 163.0;
    }
    else
    {
      double v29 = 153.0;
    }
    p_CGRect slice = &slice;
    CGRectDivide(v37, &slice, &v37, v29, v22);
    -[PKPeerPaymentMessagesRoundedRectangleButton setFrame:](self->_leadingButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(v37, &slice, &v37, 15.0, v22);
    CGRectDivide(v37, &slice, &v37, v29, v22);
    p_trailingButton = &self->_trailingButton;
    double y = slice.origin.y;
    double v34 = slice.size.width;
  }
  else
  {
    if (leadingAction)
    {
      uint64_t v30 = 408;
    }
    else
    {
      if (!trailingAction) {
        goto LABEL_24;
      }
      uint64_t v30 = 416;
    }
    p_trailingButton = (PKPeerPaymentMessagesRoundedRectangleButton **)((char *)self + v30);
    p_CGRect slice = &v37;
    double y = v37.origin.y;
    double v34 = v37.size.width;
  }
  -[PKPeerPaymentMessagesRoundedRectangleButton setFrame:](*p_trailingButton, "setFrame:", p_slice->origin.x, y, v34, p_slice->size.height);
LABEL_24:
  if (centerAction)
  {
    CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
    -[UIButton sizeThatFits:](self->_centerButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &slice, &remainder, v35, CGRectMinYEdge);
    centerButton = self->_centerButton;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](centerButton, "setFrame:");
  }
  [(PKPeerPaymentMessagesRoundedRectangleButton *)self->_leadingButton setHidden:leadingAction == 0];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)self->_trailingButton setHidden:trailingAction == 0];
  [(UIButton *)self->_centerButton setHidden:centerAction == 0];
}

- (void)setLeadingAction:(unint64_t)a3
{
  self->_unint64_t leadingAction = a3;
  leadingButton = self->_leadingButton;
  double v5 = -[PKPeerPaymentMessagesMultiActionView _axIdentifierForAction:](self, "_axIdentifierForAction:");
  [(PKPeerPaymentMessagesRoundedRectangleButton *)leadingButton setAccessibilityIdentifier:v5];

  id v6 = [(PKPeerPaymentMessagesMultiActionView *)self _titleForAction:self->_leadingAction];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)self->_leadingButton setTitle:v6 forState:0];
  [(PKPeerPaymentMessagesMultiActionView *)self setNeedsLayout];
}

- (void)setTrailingAction:(unint64_t)a3
{
  self->_unint64_t trailingAction = a3;
  trailingButton = self->_trailingButton;
  double v5 = -[PKPeerPaymentMessagesMultiActionView _axIdentifierForAction:](self, "_axIdentifierForAction:");
  [(PKPeerPaymentMessagesRoundedRectangleButton *)trailingButton setAccessibilityIdentifier:v5];

  id v6 = [(PKPeerPaymentMessagesMultiActionView *)self _titleForAction:self->_trailingAction];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)self->_trailingButton setTitle:v6 forState:0];
  [(PKPeerPaymentMessagesMultiActionView *)self setNeedsLayout];
}

- (void)setCenterAction:(unint64_t)a3
{
  self->_unint64_t centerAction = a3;
  centerButton = self->_centerButton;
  double v5 = -[PKPeerPaymentMessagesMultiActionView _axIdentifierForAction:](self, "_axIdentifierForAction:");
  [(UIButton *)centerButton setAccessibilityIdentifier:v5];

  id v6 = self->_centerButton;
  double v7 = [(PKPeerPaymentMessagesMultiActionView *)self _titleForAction:self->_centerAction];
  [(UIButton *)v6 setTitle:v7 forState:0];

  [(PKPeerPaymentMessagesMultiActionView *)self setNeedsLayout];
}

- (void)setActivityIndicatorVisible:(BOOL)a3 forAction:(unint64_t)a4
{
  BOOL v4 = a3;
  double v5 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__leadingButton;
  if (self->_leadingAction == a4
    || (double v5 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__trailingButton, self->_trailingAction == a4))
  {
    id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    [v6 setShowsActivityIndicator:v4];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[PKPeerPaymentMessagesMultiActionView setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    [(PKPeerPaymentMessagesRoundedRectangleButton *)self->_leadingButton setEnabled:v3];
    [(PKPeerPaymentMessagesRoundedRectangleButton *)self->_trailingButton setEnabled:v3];
    centerButton = self->_centerButton;
    [(UIButton *)centerButton setEnabled:v3];
  }
}

- (void)setUsesFlexibleButtonWidth:(BOOL)a3
{
  if (self->_usesFlexibleButtonWidth != a3)
  {
    self->_usesFlexibleButtondouble Width = a3;
    [(PKPeerPaymentMessagesMultiActionView *)self setNeedsLayout];
  }
}

- (id)_primaryButton
{
  BOOL v3 = objc_alloc_init(PKPeerPaymentMessagesRoundedRectangleButton);
  [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 addTarget:self action:sel__handleActionButton_ forControlEvents:64];
  BOOL v4 = +[PKPeerPaymentTheme platterColor];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 setBackgroundColor:v4];

  double v5 = +[PKPeerPaymentTheme primaryTextColor];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 setTitleColor:v5 forState:0];

  id v6 = +[PKPeerPaymentTheme disabledTextColor];
  [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 setTitleColor:v6 forState:2];

  double v7 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2798], 2, 0);
  CGFloat v8 = [(PKPeerPaymentMessagesRoundedRectangleButton *)v3 titleLabel];
  [v8 setFont:v7];

  return v3;
}

- (id)_secondaryButton
{
  BOOL v3 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2798]);
  id v4 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  double v5 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v4 setConfiguration:v5];
  id v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v6];

  [v4 addTarget:self action:sel__handleActionButton_ forControlEvents:64];
  double v7 = +[PKPeerPaymentTheme secondaryButtonTextColor];
  [v4 setTitleColor:v7 forState:0];

  CGFloat v8 = +[PKPeerPaymentTheme secondaryButtonTextPressedColor];
  [v4 setTitleColor:v8 forState:1];

  double v9 = +[PKPeerPaymentTheme disabledTextColor];
  [v4 setTitleColor:v9 forState:2];

  CGFloat v10 = [v4 titleLabel];
  [v10 setFont:v3];

  return v4;
}

- (double)_heightForPrimaryButtonForAvailableSize:(CGSize)a3
{
  return 50.0;
}

- (id)_titleForAction:(unint64_t)a3
{
  switch(a3)
  {
    case 7uLL:
      id v4 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentMes_14.isa);
      goto LABEL_9;
    case 2uLL:
      BOOL v3 = @"PEER_PAYMENT_MESSAGES_ACTION_REQUEST";
      goto LABEL_7;
    case 1uLL:
      BOOL v3 = @"PEER_PAYMENT_MESSAGES_ACTION_SEND";
LABEL_7:
      id v4 = PKLocalizedPeerPaymentString(&v3->isa);
      goto LABEL_9;
  }
  id v4 = 0;
LABEL_9:

  return v4;
}

- (id)_axIdentifierForAction:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 0;
  }
  else {
    return off_1E59D3C98[a3 - 1];
  }
}

- (void)_handleActionButton:(id)a3
{
  id v4 = (PKPeerPaymentMessagesRoundedRectangleButton *)a3;
  actionHandler = (void (**)(id, PKPeerPaymentMessagesMultiActionView *, void))self->_actionHandler;
  if (actionHandler)
  {
    id v6 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__leadingAction;
    CGFloat v8 = v4;
    if (self->_leadingButton == v4
      || (id v6 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__trailingAction, self->_trailingButton == v4)
      || (id v6 = &OBJC_IVAR___PKPeerPaymentMessagesMultiActionView__centerAction,
          (PKPeerPaymentMessagesRoundedRectangleButton *)self->_centerButton == v4))
    {
      uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa + *v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    actionHandler[2](actionHandler, self, v7);
    id v4 = v8;
  }
}

- (void)setCenterButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(UIButton *)self->_centerButton layer];
  [v6 opacity];
  if (*(float *)&v7 != (float)v5)
  {
    if (v4)
    {
      if (v5)
      {
        id v18 = 0;
        id v19 = 0;
        ContentViewVisibilityAnimations(0, &v19, &v18, 0);
        id v8 = v19;
        id v9 = v18;
        id v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v8);
        id v11 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

LABEL_6:
        LODWORD(v7) = 1.0;
        [v6 setOpacity:v7];
        [v6 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
        goto LABEL_9;
      }
      id v16 = 0;
      id v17 = 0;
      ContentViewVisibilityAnimations(&v17, 0, 0, &v16);
      id v12 = v17;
      id v13 = v16;
      id v14 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v13);
      id v15 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v12);
    }
    else if (v5)
    {
      goto LABEL_6;
    }
    [v6 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    [v6 setOpacity:0.0];
  }
LABEL_9:
}

- (unint64_t)leadingAction
{
  return self->_leadingAction;
}

- (unint64_t)trailingAction
{
  return self->_trailingAction;
}

- (unint64_t)centerAction
{
  return self->_centerAction;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)usesFlexibleButtonWidth
{
  return self->_usesFlexibleButtonWidth;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_trailingActivityIndicatorBackground, 0);
  objc_storeStrong((id *)&self->_leadingActivityIndicatorBackground, 0);
  objc_storeStrong((id *)&self->_trailingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_leadingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);

  objc_storeStrong((id *)&self->_leadingButton, 0);
}

@end