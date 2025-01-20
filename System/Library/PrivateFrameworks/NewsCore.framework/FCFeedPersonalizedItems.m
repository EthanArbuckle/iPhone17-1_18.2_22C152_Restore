@interface FCFeedPersonalizedItems
- (FCMapTable)scoreProfiles;
- (NSArray)sortedItems;
- (void)setScoreProfiles:(id)a3;
- (void)setSortedItems:(id)a3;
@end

@implementation FCFeedPersonalizedItems

- (NSArray)sortedItems
{
  return self->_sortedItems;
}

- (void)setSortedItems:(id)a3
{
}

- (FCMapTable)scoreProfiles
{
  return self->_scoreProfiles;
}

- (void)setScoreProfiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreProfiles, 0);
  objc_storeStrong((id *)&self->_sortedItems, 0);
}

@end