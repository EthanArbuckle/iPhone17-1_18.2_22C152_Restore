@interface ICFavoriteEntityResponse
- (BOOL)updateRequired;
- (NSDictionary)addedItems;
- (void)setAddedItems:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICFavoriteEntityResponse

- (void).cxx_destruct
{
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setAddedItems:(id)a3
{
}

- (NSDictionary)addedItems
{
  return self->_addedItems;
}

@end