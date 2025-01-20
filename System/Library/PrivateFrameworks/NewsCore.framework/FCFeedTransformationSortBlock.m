@interface FCFeedTransformationSortBlock
+ (id)transformationWithSortBlock:(id)a3;
- (id)sortBlock;
- (id)transformFeedItems:(id)a3;
- (void)setSortBlock:(id)a3;
@end

@implementation FCFeedTransformationSortBlock

+ (id)transformationWithSortBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FCFeedTransformationSortBlock);
  [(FCFeedTransformationSortBlock *)v4 setSortBlock:v3];

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  v5 = [(FCFeedTransformationSortBlock *)self sortBlock];
  v6 = [v4 sortedArrayUsingComparator:v5];

  return v6;
}

- (id)sortBlock
{
  return self->_sortBlock;
}

- (void)setSortBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end