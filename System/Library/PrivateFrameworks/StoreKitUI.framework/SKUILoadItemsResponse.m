@interface SKUILoadItemsResponse
- (NSDictionary)loadedItems;
- (NSSet)invalidItemIdentifiers;
- (void)setInvalidItemIdentifiers:(id)a3;
- (void)setLoadedItems:(id)a3;
@end

@implementation SKUILoadItemsResponse

- (NSDictionary)loadedItems
{
  return self->_loadedItems;
}

- (void)setLoadedItems:(id)a3
{
}

- (NSSet)invalidItemIdentifiers
{
  return self->_invalidItemIdentifiers;
}

- (void)setInvalidItemIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_loadedItems, 0);
}

@end