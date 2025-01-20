@interface PKShowStoreId
- (PKShowStoreId)initWithInteger:(int64_t)a3;
- (PKShowStoreId)initWithNumber:(id)a3;
- (id)initWithString:;
@end

@implementation PKShowStoreId

- (PKShowStoreId)initWithInteger:(int64_t)a3
{
  return (PKShowStoreId *)StoreId.init(value:)(a3);
}

- (PKShowStoreId)initWithNumber:(id)a3
{
  return (PKShowStoreId *)StoreId.init(value:)(a3);
}

- (id)initWithString:
{
  uint64_t v0 = sub_23F0BF6A0();
  return StoreId.init(value:)(v0, v1);
}

@end