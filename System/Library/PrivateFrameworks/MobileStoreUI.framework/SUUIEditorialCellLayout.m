@interface SUUIEditorialCellLayout
- (SUUIEditorialCellLayout)initWithCollectionViewCell:(id)a3;
- (SUUIEditorialCellLayout)initWithParentView:(id)a3;
- (UIEdgeInsets)contentInset;
- (id)_linkView;
- (id)_textBoxView;
- (void)_initContentInset;
- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4 expanded:(BOOL)a5;
- (void)dealloc;
- (void)editorialLinkView:(id)a3 didSelectLink:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIEditorialCellLayout

- (void)_initContentInset
{
  *(_OWORD *)&self->_contentInset.top = xmmword_2568A0960;
  *(_OWORD *)&self->_contentInset.bottom = xmmword_2568A0960;
}

- (SUUIEditorialCellLayout)initWithCollectionViewCell:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithCollectionViewCell:a3];
  v4 = v3;
  if (v3) {
    [(SUUIEditorialCellLayout *)v3 _initContentInset];
  }
  return v4;
}

- (SUUIEditorialCellLayout)initWithParentView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithParentView:a3];
  v4 = v3;
  if (v3) {
    [(SUUIEditorialCellLayout *)v3 _initContentInset];
  }
  return v4;
}

- (void)dealloc
{
  [(SUUIEditorialLinkView *)self->_linkView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIEditorialCellLayout;
  [(SUUIEditorialCellLayout *)&v3 dealloc];
}

- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4 expanded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [v8 bodyTextLayoutForOrientation:a4];
  v10 = [v8 linkLayoutForOrientation:a4];
  uint64_t v11 = [v8 titleTextLayoutForOrientation:a4];
  if (v9 | v11)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = [v8 editorialComponent];
    v13 = v12;
    if (v12)
    {
      [v12 editorialStyle];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }

    self->_linkSpacing = *((float *)&v18 + 1);
    v14 = [(SUUIEditorialCellLayout *)self _textBoxView];
    [v14 titleInsets];
    objc_msgSend(v14, "setTitleInsets:");
    objc_msgSend(v14, "setFixedWidthTextFrame:", objc_msgSend((id)v9, "textFrame"));
    objc_msgSend(v14, "setFixedWidthTitleTextFrame:", objc_msgSend((id)v11, "textFrame"));
    if (v10)
    {
      v15 = [(SUUIEditorialCellLayout *)self _linkView];
      [v15 setHorizontalAlignment:(void)v17];
      [v15 setLinkLayout:v10];
    }
    else
    {
      [(SUUIEditorialLinkView *)self->_linkView setLinkLayout:0];
    }
    objc_msgSend(v8, "layoutHeightForOrientation:expanded:", a4, v5, v17, v18, 0);
    self->_totalHeight = v16;
  }
  else
  {
    [(SUUIEditorialLinkView *)self->_linkView setLinkLayout:0];
    [(SUUITextBoxView *)self->_textBoxView reset];
  }
  [(SUUICellLayout *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SUUIEditorialCellLayout;
  [(SUUICellLayout *)&v15 layoutSubviews];
  objc_super v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;

  double v6 = v5 - self->_contentInset.left - self->_contentInset.right;
  v7 = [(SUUIEditorialCellLayout *)self _textBoxView];
  [v7 frame];
  double totalHeight = self->_totalHeight;
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  uint64_t v11 = [(SUUIEditorialLinkView *)self->_linkView linkLayout];

  linkView = self->_linkView;
  if (v11)
  {
    -[SUUIEditorialLinkView sizeThatFits:](linkView, "sizeThatFits:", v6, 1.79769313e308);
    double v14 = v13;
    -[SUUIEditorialLinkView setFrame:](self->_linkView, "setFrame:", self->_contentInset.left, self->_contentInset.top + self->_totalHeight - v13, v6, v13);
    [(SUUIEditorialLinkView *)self->_linkView setHidden:0];
    double totalHeight = totalHeight - (v14 + self->_linkSpacing);
  }
  else
  {
    [(SUUIEditorialLinkView *)linkView setHidden:1];
  }
  objc_msgSend(v7, "setFrame:", left, top, v6, totalHeight);
}

- (void)setBackgroundColor:(id)a3
{
  linkView = self->_linkView;
  id v5 = a3;
  [(SUUIEditorialLinkView *)linkView setBackgroundColor:v5];
  [(SUUITextBoxView *)self->_textBoxView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialCellLayout;
  [(SUUICellLayout *)&v6 setBackgroundColor:v5];
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIEditorialCellLayout *)self _linkView];
  [v5 setColoringWithColorScheme:v4];

  id v6 = [(SUUIEditorialCellLayout *)self _textBoxView];
  [v6 setColorScheme:v4];
}

- (void)editorialLinkView:(id)a3 didSelectLink:(id)a4
{
  id v8 = a4;
  id v5 = [(SUUICellLayout *)self parentCellView];
  id v6 = SUUICollectionViewForView(v5);
  v7 = [v6 delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 collectionView:v6 editorialView:v5 didSelectLink:v8];
  }
}

- (id)_linkView
{
  linkView = self->_linkView;
  if (!linkView)
  {
    id v4 = [(SUUICellLayout *)self contentView];
    id v5 = objc_alloc_init(SUUIEditorialLinkView);
    id v6 = self->_linkView;
    self->_linkView = v5;

    v7 = self->_linkView;
    id v8 = [(SUUICellLayout *)self parentCellView];
    uint64_t v9 = [v8 backgroundColor];
    [(SUUIEditorialLinkView *)v7 setBackgroundColor:v9];

    [(SUUIEditorialLinkView *)self->_linkView setDelegate:self];
    [v4 addSubview:self->_linkView];

    linkView = self->_linkView;
  }
  return linkView;
}

- (id)_textBoxView
{
  textBoxView = self->_textBoxView;
  if (!textBoxView)
  {
    id v4 = [(SUUICellLayout *)self contentView];
    id v5 = [SUUITextBoxView alloc];
    [v4 bounds];
    id v6 = -[SUUITextBoxView initWithFrame:](v5, "initWithFrame:");
    v7 = self->_textBoxView;
    self->_textBoxView = v6;

    id v8 = self->_textBoxView;
    uint64_t v9 = [(SUUICellLayout *)self parentCellView];
    v10 = [v9 backgroundColor];
    [(SUUITextBoxView *)v8 setBackgroundColor:v10];

    -[SUUITextBoxView setContentInsets:](self->_textBoxView, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    [(SUUITextBoxView *)self->_textBoxView setEnabled:0];
    [v4 addSubview:self->_textBoxView];

    textBoxView = self->_textBoxView;
  }
  return textBoxView;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
}

@end