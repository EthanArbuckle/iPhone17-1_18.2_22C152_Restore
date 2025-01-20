@interface PKPGSVFooterView
- (CGSize)sizeThatFits:(CGSize)result;
- (PKPGSVFooterView)initWithFrame:(CGRect)a3;
- (PKPGSVFooterViewDelegate)delegate;
- (int64_t)expiredSectionCount;
- (void)_editTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setExpiredSectionCount:(int64_t)a3;
@end

@implementation PKPGSVFooterView

- (void)setExpiredSectionCount:(int64_t)a3
{
  if (self->_expiredSectionCount != a3)
  {
    self->_expiredSectionCount = a3;
    int refreshed = PKExpiredPassesRefreshEnabled();
    if (a3)
    {
      if (refreshed)
      {
        editButton = self->_editButton;
        v7 = PKLocalizedString(&cfstr_TableFooterExp.isa, &cfstr_Lu.isa, a3);
        [(PKContinuousButton *)editButton setTitle:v7 forState:0];

        [(PKPGSVFooterView *)self setNeedsLayout];
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 64.0;
  result.height = v3;
  return result;
}

- (PKPGSVFooterView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKPGSVFooterView;
  double v3 = -[PKPGSVFooterView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v11 = 0x401C000000000000;
    int64x2_t v12 = vdupq_n_s64(1uLL);
    int64x2_t v13 = vdupq_n_s64(2uLL);
    v4 = [[PKContinuousButton alloc] initWithConfiguration:&v11];
    editButton = v3->_editButton;
    v3->_editButton = v4;

    -[PKContinuousButton setContentEdgeInsets:](v3->_editButton, "setContentEdgeInsets:", 7.0, 14.0, 7.0, 14.0);
    -[PKContinuousButton _setTouchInsets:](v3->_editButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v6 = v3->_editButton;
    v7 = PKLocalizedString(&cfstr_TableFooterEdi.isa);
    [(PKContinuousButton *)v6 setTitle:v7 forState:0];

    v8 = [(PKContinuousButton *)v3->_editButton titleLabel];
    v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    [v8 setFont:v9];

    [(PKPGSVFooterView *)v3 addSubview:v3->_editButton];
    [(PKContinuousButton *)v3->_editButton addTarget:v3 action:sel__editTapped_ forControlEvents:64];
  }
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPGSVFooterView;
  [(PKPGSVFooterView *)&v6 layoutSubviews];
  [(PKPGSVFooterView *)self bounds];
  memset(&slice, 0, sizeof(slice));
  memset(&v4, 0, sizeof(v4));
  CGRectDivide(v7, &slice, &v4, 64.0, CGRectMinYEdge);
  [(PKContinuousButton *)self->_editButton sizeToFit];
  editButton = self->_editButton;
  [(PKContinuousButton *)editButton frame];
  PKSizeAlignedInRect();
  -[PKContinuousButton setFrame:](editButton, "setFrame:");
}

- (void)_editTapped:(id)a3
{
  if (PKUIStoreDemoGatewayWithView(self))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained viewTapped:self];
      id WeakRetained = v5;
    }
  }
}

- (PKPGSVFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPGSVFooterViewDelegate *)WeakRetained;
}

- (int64_t)expiredSectionCount
{
  return self->_expiredSectionCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_editButton, 0);
}

@end