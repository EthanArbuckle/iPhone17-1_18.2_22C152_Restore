@interface PKFooterHyperlinkCell
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)sources;
- (NSDirectionalEdgeInsets)edgeInsets;
- (NSString)text;
- (PKFooterHyperlinkCell)initWithCoder:(id)a3;
- (PKFooterHyperlinkCell)initWithFrame:(CGRect)a3;
- (PKFooterHyperlinkCell)initWithSize:(CGSize)a3;
- (UIColor)linkTextColor;
- (UIColor)textColor;
- (int64_t)textAlignment;
- (void)_commonInit;
- (void)_configureHyperlinkViewIfNecessary;
- (void)layoutSubviews;
- (void)setEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setSources:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKFooterHyperlinkCell

- (PKFooterHyperlinkCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKFooterHyperlinkCell;
  v3 = [(PKFooterHyperlinkCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PKFooterHyperlinkCell *)v3 _commonInit];
  }
  return v4;
}

- (PKFooterHyperlinkCell)initWithSize:(CGSize)a3
{
  return -[PKFooterHyperlinkCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
}

- (PKFooterHyperlinkCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKFooterHyperlinkCell;
  v3 = -[PKFooterHyperlinkCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKFooterHyperlinkCell *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  self->_textAlignment = 1;
  v3 = [MEMORY[0x1E4FB1618] linkColor];
  linkTextColor = self->_linkTextColor;
  self->_linkTextColor = v3;

  double v5 = PKTableViewCellTextInset();
  double v6 = PKTableViewCellTextInset();
  self->_edgeInsets.top = 15.0;
  self->_edgeInsets.leading = v5;
  self->_edgeInsets.bottom = 15.0;
  self->_edgeInsets.trailing = v6;
  uint64_t v7 = *MEMORY[0x1E4F855B0];

  [(PKFooterHyperlinkCell *)self setAccessibilityIdentifier:v7];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKFooterHyperlinkCell;
  [(PKFooterHyperlinkCell *)&v4 layoutSubviews];
  v3 = [(PKFooterHyperlinkCell *)self contentView];
  [v3 bounds];
  -[PKFooterHyperlinkCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKFooterHyperlinkCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  int v8 = [(PKFooterHyperlinkCell *)self _shouldReverseLayoutDirection];
  p_edgeInsets = &self->_edgeInsets;
  uint64_t v10 = 8;
  if (v8) {
    uint64_t v11 = 24;
  }
  else {
    uint64_t v11 = 8;
  }
  if (!v8) {
    uint64_t v10 = 24;
  }
  double v12 = width - (*(double *)((char *)&p_edgeInsets->top + v11) + *(double *)((char *)&p_edgeInsets->top + v10));
  double v13 = p_edgeInsets->top + self->_edgeInsets.bottom;
  [(PKMultiHyperlinkView *)self->_hyperLinkView frame];
  -[PKMultiHyperlinkView sizeThatFits:](self->_hyperLinkView, "sizeThatFits:", v12, height - v13);
  PKRectCenteredIntegralRect();
  double v15 = v14;
  if (!a4) {
    -[PKMultiHyperlinkView setFrame:](self->_hyperLinkView, "setFrame:");
  }
  double v16 = v13 + v15 + 0.0;
  double v17 = width;
  result.double height = v16;
  result.double width = v17;
  return result;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  uint64_t v7 = text;
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
    objc_storeStrong((id *)&self->_text, a3);
    [(PKFooterHyperlinkCell *)self _configureHyperlinkViewIfNecessary];
  }
LABEL_9:
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(PKFooterHyperlinkCell *)self _configureHyperlinkViewIfNecessary];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    [(PKFooterHyperlinkCell *)self _configureHyperlinkViewIfNecessary];
    id v5 = v6;
  }
}

- (void)setLinkTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_linkTextColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_linkTextColor, a3);
    [(PKFooterHyperlinkCell *)self _configureHyperlinkViewIfNecessary];
    id v5 = v6;
  }
}

- (void)setSources:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    [(PKFooterHyperlinkCell *)self _configureHyperlinkViewIfNecessary];
  }
}

- (void)_configureHyperlinkViewIfNecessary
{
  hyperLinkView = self->_hyperLinkView;
  if (!hyperLinkView)
  {
    double v4 = objc_alloc_init(PKMultiHyperlinkView);
    id v5 = self->_hyperLinkView;
    self->_hyperLinkView = v4;

    double v6 = [(PKFooterHyperlinkCell *)self contentView];
    [v6 addSubview:self->_hyperLinkView];

    hyperLinkView = self->_hyperLinkView;
  }
  [(PKMultiHyperlinkView *)hyperLinkView setText:self->_text];
  [(PKMultiHyperlinkView *)self->_hyperLinkView setSources:self->_sources];
  [(PKMultiHyperlinkView *)self->_hyperLinkView setTextAlignment:self->_textAlignment];
  [(PKMultiHyperlinkView *)self->_hyperLinkView setLinkTextColor:self->_linkTextColor];
  [(PKMultiHyperlinkView *)self->_hyperLinkView setTextColor:self->_textColor];

  [(PKFooterHyperlinkCell *)self setNeedsLayout];
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSArray)sources
{
  return self->_sources;
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double leading = self->_edgeInsets.leading;
  double bottom = self->_edgeInsets.bottom;
  double trailing = self->_edgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_hyperLinkView, 0);
}

@end