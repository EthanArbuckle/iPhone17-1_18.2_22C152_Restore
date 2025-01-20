@interface PKApplyPrimaryActionCell
- (BOOL)loading;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKApplyPrimaryActionCell)initWithFrame:(CGRect)a3;
- (id)action;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAction:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKApplyPrimaryActionCell

- (PKApplyPrimaryActionCell)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PKApplyPrimaryActionCell;
  v3 = -[PKApplyPrimaryActionCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKApplyPrimaryActionCell *)v3 contentView];
    objc_initWeak(&location, v4);
    v6 = (void *)MEMORY[0x1E4FB13F0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__PKApplyPrimaryActionCell_initWithFrame___block_invoke;
    v18[3] = &unk_1E59CE6B8;
    objc_copyWeak(&v20, &location);
    v7 = v4;
    v19 = v7;
    v8 = [v6 actionWithHandler:v18];
    uint64_t v15 = 0x402C000000000000;
    long long v16 = xmmword_1A040E960;
    int64x2_t v17 = vdupq_n_s64(2uLL);
    v9 = [[PKContinuousButton alloc] initWithConfiguration:&v15];
    id v10 = v7[80];
    v7[80] = v9;

    [v7[80] setExclusiveTouch:1];
    [v7[80] setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    v11 = [v7[80] titleLabel];
    [v11 setNumberOfLines:1];
    [v11 setAdjustsFontSizeToFitWidth:1];
    [v11 setTextAlignment:1];
    v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2908], (NSString *)*MEMORY[0x1E4FB2790]);
    [v11 setFont:v12];

    [v11 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v7[80] addAction:v8 forControlEvents:64];
    [v5 addSubview:v7[80]];
    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v13];

    objc_msgSend(v5, "setDirectionalLayoutMargins:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__PKApplyPrimaryActionCell_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(unsigned char *)(*(void *)(a1 + 32) + 649) && WeakRetained[83])
  {
    v3 = WeakRetained;
    [WeakRetained setLoading:1];
    (*(void (**)(void))(v3[83] + 16))();
    WeakRetained = v3;
  }
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_title, a3);
    [(PKContinuousButton *)self->_button setTitle:v9 forState:0];
    [(PKApplyPrimaryActionCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setLoading:(BOOL)a3
{
  if (((!self->_loading ^ a3) & 1) == 0)
  {
    self->_loading = a3;
    -[PKContinuousButton setShowSpinner:](self->_button, "setShowSpinner:");
    button = self->_button;
    BOOL v5 = !self->_loading;
    [(PKContinuousButton *)button setEnabled:v5];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplyPrimaryActionCell;
  [(PKApplyPrimaryActionCell *)&v3 layoutSubviews];
  [(PKApplyPrimaryActionCell *)self bounds];
  [(PKApplyPrimaryActionCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKApplyPrimaryActionCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  -[PKContinuousButton sizeThatFits:](self->_button, "sizeThatFits:", a3.size.width, a3.size.height);
  if (v5 >= 50.0) {
    double v6 = v5;
  }
  else {
    double v6 = 50.0;
  }
  if (!self->_isTemplateLayout)
  {
    button = self->_button;
    PKSizeAlignedInRect();
    -[PKContinuousButton setFrame:](button, "setFrame:");
  }
  double v8 = width;
  double v9 = v6;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKApplyPrimaryActionCell;
  [(PKApplyPrimaryActionCell *)&v3 prepareForReuse];
  [(PKApplyPrimaryActionCell *)self setLoading:0];
  [(PKApplyPrimaryActionCell *)self setTitle:0];
  [(PKApplyPrimaryActionCell *)self setAction:0];
}

- (NSString)title
{
  return self->_title;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)loading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end