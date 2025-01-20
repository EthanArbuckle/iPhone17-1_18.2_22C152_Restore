@interface PSIGroupAggregateItem
- (NSArray)assetIds;
- (NSArray)collectionIds;
- (NSValue)rangeMatchingToken;
- (PSIGroup)group;
- (PSIQueryToken)searchToken;
- (void)reset;
- (void)setAssetIds:(id)a3;
- (void)setCollectionIds:(id)a3;
- (void)setGroup:(id)a3;
- (void)setRangeMatchingToken:(id)a3;
- (void)setSearchToken:(id)a3;
@end

@implementation PSIGroupAggregateItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_assetIds, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_rangeMatchingToken, 0);
  objc_storeStrong((id *)&self->_searchToken, 0);
}

- (void)setCollectionIds:(id)a3
{
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setAssetIds:(id)a3
{
}

- (NSArray)assetIds
{
  return self->_assetIds;
}

- (void)setGroup:(id)a3
{
}

- (PSIGroup)group
{
  return self->_group;
}

- (void)setRangeMatchingToken:(id)a3
{
}

- (NSValue)rangeMatchingToken
{
  return self->_rangeMatchingToken;
}

- (void)setSearchToken:(id)a3
{
}

- (PSIQueryToken)searchToken
{
  return self->_searchToken;
}

- (void)reset
{
  searchToken = self->_searchToken;
  self->_searchToken = 0;

  rangeMatchingToken = self->_rangeMatchingToken;
  self->_rangeMatchingToken = 0;

  group = self->_group;
  self->_group = 0;

  assetIds = self->_assetIds;
  self->_assetIds = 0;

  collectionIds = self->_collectionIds;
  self->_collectionIds = 0;
}

@end