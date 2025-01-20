@interface SFSearchBarContainerCell
+ (NSString)dataSourceItemIdentifier;
+ (NSString)dataSourceSectionIdentifier;
- (UISearchBar)searchBar;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setSearchBar:(id)a3;
@end

@implementation SFSearchBarContainerCell

+ (NSString)dataSourceSectionIdentifier
{
  return (NSString *)@"SearchBarContainerSection";
}

+ (NSString)dataSourceItemIdentifier
{
  return (NSString *)@"SearchBarContainer";
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFSearchBarContainerCell;
  [(SFSearchBarContainerCell *)&v3 layoutSubviews];
  [(SFSearchBarContainerCell *)self bounds];
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:");
}

- (void)setSearchBar:(id)a3
{
  v5 = (UISearchBar *)a3;
  searchBar = self->_searchBar;
  v7 = v5;
  if (searchBar != v5)
  {
    [(UISearchBar *)searchBar removeFromSuperview];
    objc_storeStrong((id *)&self->_searchBar, a3);
    [(SFSearchBarContainerCell *)self addSubview:v7];
    [(SFSearchBarContainerCell *)self setNeedsLayout];
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFSearchBarContainerCell;
  v4 = [(SFSearchBarContainerCell *)&v8 preferredLayoutAttributesFittingAttributes:a3];
  [(UISearchBar *)self->_searchBar frame];
  objc_msgSend(v4, "setSize:", v5, v6);
  return v4;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void).cxx_destruct
{
}

@end