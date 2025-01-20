@interface VSSearchBarDelegate
- (NSString)text;
- (UISearchBar)searchBar;
- (VSSearchBarDelegate)init;
- (void)clearText;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setSearchBar:(id)a3;
- (void)setText:(id)a3;
@end

@implementation VSSearchBarDelegate

- (VSSearchBarDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSSearchBarDelegate;
  v2 = [(VSSearchBarDelegate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_26F361E90;
  }
  return v3;
}

- (void)clearText
{
  v3 = [(VSSearchBarDelegate *)self searchBar];
  [v3 setText:&stru_26F361E90];

  [(VSSearchBarDelegate *)self setText:&stru_26F361E90];
}

- (void)setSearchBar:(id)a3
{
  v5 = (UISearchBar *)a3;
  searchBar = self->_searchBar;
  if (searchBar != v5)
  {
    v10 = v5;
    [(UISearchBar *)searchBar setDelegate:0];
    objc_storeStrong((id *)&self->_searchBar, a3);
    [(UISearchBar *)v10 setDelegate:self];
    v7 = [(UISearchBar *)v10 text];
    v8 = v7;
    if (v7) {
      v9 = v7;
    }
    else {
      v9 = &stru_26F361E90;
    }
    [(VSSearchBarDelegate *)self setText:v9];

    v5 = v10;
  }
  MEMORY[0x270F9A758](searchBar, v5);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end