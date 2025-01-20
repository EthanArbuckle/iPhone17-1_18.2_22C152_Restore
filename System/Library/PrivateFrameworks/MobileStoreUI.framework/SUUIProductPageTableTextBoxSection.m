@interface SUUIProductPageTableTextBoxSection
- (NSString)subtitle;
- (NSString)title;
- (SUUIColorScheme)colorScheme;
- (SUUILayoutCache)textLayoutCache;
- (SUUIProductPageTableTextBoxSection)initWithClientContext:(id)a3;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)stringIndex;
- (void)setColorScheme:(id)a3;
- (void)setStringIndex:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextLayoutCache:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIProductPageTableTextBoxSection

- (SUUIProductPageTableTextBoxSection)initWithClientContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageTableTextBoxSection;
  v6 = [(SUUIProductPageTableTextBoxSection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  id v5 = -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  [(SUUIProductPageTableSection *)self heightForTextLayout:v5 isExpanded:self->_isExpanded];
  double v7 = v6;

  return v7;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = -[SUUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  double v6 = v5;
  if (self->_isExpanded || ![v5 requiresTruncation])
  {
    double v7 = 0;
  }
  else
  {
    self->_isExpanded = 1;
    double v7 = +[SUUIProductPageAction actionWithType:0];
  }

  return v7;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = [(SUUIProductPageTableSection *)self textBoxTableViewCellForTableView:a3 indexPath:a4];
  double v6 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];

  if (v6)
  {
    double v7 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
    [v5 setBottomBorderColor:v7];
  }
  v8 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_stringIndex];
  objc_super v9 = [v5 textBoxView];
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v8, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"MORE_BUTTON"];
    }
    else {
    v12 = +[SUUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
    }
    [v10 setMoreButtonTitle:v12];

    if (self->_isExpanded) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 5;
    }
    [v10 setNumberOfVisibleLines:v13];
    v14 = [(SUUIProductPageTableTextBoxSection *)self subtitle];
    [v10 setSubtitle:v14];

    v15 = [(SUUIProductPageTableTextBoxSection *)self title];
    [v10 setTitle:v15];

    [v10 setColorScheme:self->_colorScheme];
  }
  else
  {
    [v9 reset];
  }

  return v5;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (int64_t)stringIndex
{
  return self->_stringIndex;
}

- (void)setStringIndex:(int64_t)a3
{
  self->_stringIndex = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end