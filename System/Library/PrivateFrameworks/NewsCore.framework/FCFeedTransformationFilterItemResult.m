@interface FCFeedTransformationFilterItemResult
- (BOOL)isFiltered;
- (FCFeedTransformationFilterItemResult)initWithItem:(id)a3 filtered:(BOOL)a4 filteredReasons:(unint64_t)a5;
- (id)item;
- (unint64_t)filteredReasons;
- (void)setFiltered:(BOOL)a3;
- (void)setFilteredReasons:(unint64_t)a3;
@end

@implementation FCFeedTransformationFilterItemResult

- (FCFeedTransformationFilterItemResult)initWithItem:(id)a3 filtered:(BOOL)a4 filteredReasons:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCFeedTransformationFilterItemResult;
  v10 = [(FCFeedTransformationFilterItemResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_item, a3);
    v11->_filtered = a4;
    v11->_filteredReasons = a5;
  }

  return v11;
}

- (id)item
{
  return self->_item;
}

- (BOOL)isFiltered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (unint64_t)filteredReasons
{
  return self->_filteredReasons;
}

- (void)setFilteredReasons:(unint64_t)a3
{
  self->_filteredReasons = a3;
}

- (void).cxx_destruct
{
}

@end