@interface STSSearchBrowserHeaderView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (STSSearchBrowserHeaderView)init;
- (UISearchBar)searchBar;
- (void)updateConstraints;
@end

@implementation STSSearchBrowserHeaderView

- (STSSearchBrowserHeaderView)init
{
  v31[1] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)STSSearchBrowserHeaderView;
  v2 = [(STSSearchBrowserHeaderView *)&v29 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultBackgroundColor");
    [(STSSearchBrowserHeaderView *)v2 setBackgroundColor:v3];

    v4 = objc_alloc_init(STSSearchBar);
    searchBar = v2->_searchBar;
    v2->_searchBar = &v4->super;

    v6 = [(UISearchBar *)v2->_searchBar searchField];
    [(UISearchBar *)v2->_searchBar setSearchBarStyle:2];
    v7 = [(UISearchBar *)v2->_searchBar searchTextField];
    v8 = objc_msgSend(MEMORY[0x263F825C8], "sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor");
    [v7 setBackgroundColor:v8];

    v9 = v2->_searchBar;
    v10 = [MEMORY[0x263F825C8] systemPinkColor];
    [(UISearchBar *)v9 setTintColor:v10];

    [(UISearchBar *)v2->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = STSLocalizedString(@"SEARCHBAR_PLACEHOLDER");
    id v12 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v30 = *MEMORY[0x263F81500];
    v13 = [MEMORY[0x263F825C8] lightGrayColor];
    v31[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v15 = (void *)[v12 initWithString:v11 attributes:v14];

    [v6 setAttributedPlaceholder:v15];
    [(UISearchBar *)v2->_searchBar setShowsCancelButton:1];
    v16 = [(UISearchBar *)v2->_searchBar cancelButton];
    [v16 setEnabled:1];

    [(UISearchBar *)v2->_searchBar _setAutoDisableCancelButton:0];
    [(STSSearchBrowserHeaderView *)v2 addSubview:v2->_searchBar];
    v17 = [MEMORY[0x263EFF980] array];
    v18 = [MEMORY[0x263EFF980] array];

    v19 = [(UISearchBar *)v2->_searchBar leadingAnchor];
    v20 = [(STSSearchBrowserHeaderView *)v2 leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v18 addObject:v21];

    v22 = [(UISearchBar *)v2->_searchBar trailingAnchor];
    v23 = [(STSSearchBrowserHeaderView *)v2 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v18 addObject:v24];

    v25 = [(UISearchBar *)v2->_searchBar topAnchor];
    v26 = [(STSSearchBrowserHeaderView *)v2 topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v18 addObject:v27];

    [MEMORY[0x263F08938] activateConstraints:v18];
  }
  return v2;
}

- (void)updateConstraints
{
  v14[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)STSSearchBrowserHeaderView;
  [(STSSearchBrowserHeaderView *)&v12 updateConstraints];
  if (self->_searchBarHeight)
  {
    v3 = (void *)MEMORY[0x263F08938];
    v14[0] = self->_searchBarHeight;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v3 deactivateConstraints:v4];

    searchBarHeight = self->_searchBarHeight;
    self->_searchBarHeight = 0;
  }
  [(UISearchBar *)self->_searchBar sizeToFit];
  v6 = [(UISearchBar *)self->_searchBar heightAnchor];
  [(UISearchBar *)self->_searchBar bounds];
  v8 = [v6 constraintEqualToConstant:v7];
  v9 = self->_searchBarHeight;
  self->_searchBarHeight = v8;

  v10 = (void *)MEMORY[0x263F08938];
  v13 = self->_searchBarHeight;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v10 activateConstraints:v11];
}

- (CGSize)intrinsicContentSize
{
  [(STSSearchBrowserHeaderView *)self frame];

  -[STSSearchBrowserHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 7.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);

  objc_storeStrong((id *)&self->_searchBarHeight, 0);
}

@end