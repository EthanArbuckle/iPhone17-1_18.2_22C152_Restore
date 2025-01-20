@interface SearchBarSearchResultSet
- (NSArray)results;
- (SearchBarSearchResultSet)initWithResults:(id)a3 maxCount:(unint64_t)a4;
- (unint64_t)count;
@end

@implementation SearchBarSearchResultSet

- (SearchBarSearchResultSet)initWithResults:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(SearchBarSearchResultSet *)self init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    results = v7->_results;
    v7->_results = v8;

    v7->_count = a4;
  }

  return v7;
}

- (NSArray)results
{
  return self->_results;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end