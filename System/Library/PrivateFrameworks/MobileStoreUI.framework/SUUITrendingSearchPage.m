@interface SUUITrendingSearchPage
- (NSArray)searches;
- (NSString)title;
- (void)setSearches:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUITrendingSearchPage

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)searches
{
  return self->_searches;
}

- (void)setSearches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searches, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end