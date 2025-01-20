@interface SearchResultSection
- (NSArray)searchResults;
- (NSString)title;
- (SearchResultSection)initWithTitle:(id)a3 type:(int64_t)a4 searchResults:(id)a5;
- (int64_t)type;
@end

@implementation SearchResultSection

- (SearchResultSection)initWithTitle:(id)a3 type:(int64_t)a4 searchResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SearchResultSection;
  v10 = [(SearchResultSection *)&v14 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    title = v10->_title;
    v10->_title = v11;

    v10->_type = a4;
    objc_storeStrong((id *)&v10->_searchResults, a5);
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end