@interface SKUIProductPageTableTextBoxSection
- (NSString)subtitle;
- (NSString)title;
- (SKUIColorScheme)colorScheme;
- (SKUILayoutCache)textLayoutCache;
- (SKUIProductPageTableTextBoxSection)initWithClientContext:(id)a3;
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

@implementation SKUIProductPageTableTextBoxSection

- (SKUIProductPageTableTextBoxSection)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableTextBoxSection initWithClientContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIProductPageTableTextBoxSection;
  v6 = [(SKUIProductPageTableTextBoxSection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  id v5 = -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  [(SKUIProductPageTableSection *)self heightForTextLayout:v5 isExpanded:self->_isExpanded];
  double v7 = v6;

  return v7;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = -[SKUILayoutCache layoutForIndex:](self->_textLayoutCache, "layoutForIndex:", self->_stringIndex, a4);
  double v6 = v5;
  if (self->_isExpanded || ![v5 requiresTruncation])
  {
    double v7 = 0;
  }
  else
  {
    self->_isExpanded = 1;
    double v7 = +[SKUIProductPageAction actionWithType:0];
  }

  return v7;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = [(SKUIProductPageTableSection *)self textBoxTableViewCellForTableView:a3 indexPath:a4];
  double v6 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];

  if (v6)
  {
    double v7 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
    [v5 setBottomBorderColor:v7];
  }
  v8 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_stringIndex];
  objc_super v9 = [v5 textBoxView];
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v8, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"MORE_BUTTON"];
    }
    else {
    v12 = +[SKUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
    }
    [v10 setMoreButtonTitle:v12];

    if (self->_isExpanded) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 5;
    }
    [v10 setNumberOfVisibleLines:v13];
    v14 = [(SKUIProductPageTableTextBoxSection *)self subtitle];
    [v10 setSubtitle:v14];

    v15 = [(SKUIProductPageTableTextBoxSection *)self title];
    [v10 setTitle:v15];

    [v10 setColorScheme:self->_colorScheme];
  }
  else
  {
    [v9 reset];
  }

  return v5;
}

- (SKUIColorScheme)colorScheme
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

- (SKUILayoutCache)textLayoutCache
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

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageTableTextBoxSection initWithClientContext:]";
}

@end