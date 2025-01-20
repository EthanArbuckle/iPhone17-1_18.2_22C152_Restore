@interface RemoteUISectionFooter
- (CGSize)_labelSizeForWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSURL)linkURL;
- (RUILinkLabel)linkLabel;
- (RUITableFooterDelegate)delegate;
- (RemoteUISectionFooter)initWithAttributes:(id)a3;
- (UIButton)linkButton;
- (UILabel)textLabel;
- (double)_footerHeightForWidth:(double)a3;
- (id)linkAction;
- (void)_linkPressed;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setLinkAction:(id)a3;
- (void)setLinkURL:(id)a3;
- (void)setText:(id)a3 attributes:(id)a4;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTopMargin:(double)a3;
@end

@implementation RemoteUISectionFooter

- (RemoteUISectionFooter)initWithAttributes:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)RemoteUISectionFooter;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  v7 = -[RemoteUISectionFooter initWithFrame:](&v37, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], v4, v5, v6);
  if (v7)
  {
    v8 = -[RUILinkLabel initWithFrame:]([RUILinkLabel alloc], "initWithFrame:", v3, v4, v5, v6);
    linkLabel = v7->_linkLabel;
    v7->_linkLabel = v8;

    v10 = RemoteUIFooterFont();
    v11 = [(RUILinkLabel *)v7->_linkLabel textLabel];
    [v11 setFont:v10];

    v12 = RemoteUIFooterTextColor();
    v13 = [(RUILinkLabel *)v7->_linkLabel textLabel];
    [v13 setTextColor:v12];

    v14 = [MEMORY[0x263F825C8] clearColor];
    v15 = [(RUILinkLabel *)v7->_linkLabel textLabel];
    [v15 setBackgroundColor:v14];

    [(RUILinkLabel *)v7->_linkLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v16 = objc_alloc(MEMORY[0x263F82BF8]);
    v39[0] = v7->_linkLabel;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    v18 = (UIStackView *)[v16 initWithArrangedSubviews:v17];

    [(UIStackView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v18 setAxis:1];
    [(UIStackView *)v18 setDistribution:3];
    [(UIStackView *)v18 setAlignment:1];
    stackView = v7->_stackView;
    v7->_stackView = v18;
    v20 = v18;

    [(RemoteUISectionFooter *)v7 addSubview:v20];
    v21 = [(UIStackView *)v20 topAnchor];
    v22 = [(RemoteUISectionFooter *)v7 topAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22 constant:8.0];
    topContraint = v7->_topContraint;
    v7->_topContraint = (NSLayoutConstraint *)v23;

    v34 = (void *)MEMORY[0x263F08938];
    v38[0] = v7->_topContraint;
    v36 = [(UIStackView *)v20 leadingAnchor];
    v35 = [(RemoteUISectionFooter *)v7 leadingAnchor];
    v25 = [v36 constraintEqualToAnchor:v35];
    v38[1] = v25;
    v26 = [(UIStackView *)v20 trailingAnchor];
    v27 = [(RemoteUISectionFooter *)v7 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v38[2] = v28;
    v29 = [(UIStackView *)v20 bottomAnchor];
    v30 = [(RemoteUISectionFooter *)v7 bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:-7.0];
    v38[3] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
    [v34 activateConstraints:v32];
  }
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[RemoteUISectionFooter footerHeightForWidth:inView:](self, "footerHeightForWidth:inView:", self, a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (UILabel)textLabel
{
  return [(RUILinkLabel *)self->_linkLabel textLabel];
}

- (UIButton)linkButton
{
  if (!self->_usesCustomTextAlignment)
  {
    [(RUILinkLabel *)self->_linkLabel setTextAlignment:1];
    [(RemoteUISectionFooter *)self setNeedsLayout];
  }
  linkLabel = self->_linkLabel;
  return [(RUILinkLabel *)linkLabel linkButton];
}

- (void)setLinkURL:(id)a3
{
  double v5 = (NSURL *)a3;
  double v6 = v5;
  if (self->_linkURL != v5)
  {
    if (v5)
    {
      id linkAction = self->_linkAction;
      self->_id linkAction = 0;
    }
    objc_storeStrong((id *)&self->_linkURL, a3);
    objc_initWeak(&location, self);
    linkLabel = self->_linkLabel;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __36__RemoteUISectionFooter_setLinkURL___block_invoke;
    v12 = &unk_264211570;
    objc_copyWeak(&v13, &location);
    [(RUILinkLabel *)linkLabel setAction:&v9];
    [(RemoteUISectionFooter *)self setNeedsLayout];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __36__RemoteUISectionFooter_setLinkURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _linkPressed];
}

- (void)setLinkAction:(id)a3
{
  id v4 = a3;
  if (self->_linkAction != v4)
  {
    id v8 = v4;
    if (v4)
    {
      linkURL = self->_linkURL;
      self->_linkURL = 0;
    }
    double v6 = (void *)[v8 copy];
    id linkAction = self->_linkAction;
    self->_id linkAction = v6;

    [(RUILinkLabel *)self->_linkLabel setAction:self->_linkAction];
    [(RemoteUISectionFooter *)self setNeedsLayout];
    id v4 = v8;
  }
}

- (void)setText:(id)a3 attributes:(id)a4
{
  -[RUILinkLabel setText:](self->_linkLabel, "setText:", a3, a4);
  [(RemoteUISectionFooter *)self setNeedsLayout];
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(RUILinkLabel *)self->_linkLabel textAlignment] != a3)
  {
    self->_usesCustomTextAlignment = 1;
    [(RUILinkLabel *)self->_linkLabel setTextAlignment:a3];
    [(RemoteUISectionFooter *)self setNeedsLayout];
  }
  if ((unint64_t)a3 <= 4)
  {
    uint64_t v5 = qword_214612810[a3];
    stackView = self->_stackView;
    [(UIStackView *)stackView setAlignment:v5];
  }
}

- (void)setTextColor:(id)a3
{
  linkLabel = self->_linkLabel;
  id v4 = a3;
  id v5 = [(RUILinkLabel *)linkLabel textLabel];
  [v5 setTextColor:v4];
}

- (void)setTopMargin:(double)a3
{
}

- (void)setFont:(id)a3
{
}

- (double)_footerHeightForWidth:(double)a3
{
  [(RemoteUISectionFooter *)self _labelSizeForWidth:a3];
  return v3;
}

- (CGSize)_labelSizeForWidth:(double)a3
{
  -[RemoteUISectionFooter systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a3, *(double *)(MEMORY[0x263F83810] + 8));
  result.height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)_linkPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [(RemoteUISectionFooter *)self linkURL];
  [WeakRetained footerView:self activatedLinkWithURL:v3];
}

- (RUITableFooterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUITableFooterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (id)linkAction
{
  return self->_linkAction;
}

- (RUILinkLabel)linkLabel
{
  return self->_linkLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomContraint, 0);
  objc_storeStrong((id *)&self->_topContraint, 0);
  objc_storeStrong((id *)&self->_linkLabel, 0);
}

@end