@interface PNAssetFetcherLimiter
- (PNAssetFetcherLimiter)init;
- (PNAssetFetcherLimiter)initWithType:(int64_t)a3 limit:(int64_t)a4;
- (int64_t)limit;
- (int64_t)limitType;
- (int64_t)type;
@end

@implementation PNAssetFetcherLimiter

- (PNAssetFetcherLimiter)initWithType:(int64_t)a3 limit:(int64_t)a4
{
  return (PNAssetFetcherLimiter *)AssetFetcherLimiter.init(type:limit:)(a3, a4);
}

- (int64_t)type
{
  return AssetFetcherLimiter.type.getter();
}

- (int64_t)limit
{
  return AssetFetcherLimiter.limit.getter();
}

- (PNAssetFetcherLimiter)init
{
}

- (int64_t)limitType
{
  v2 = self;
  unint64_t v3 = AssetFetcherLimiter.limitType.getter();

  return v3;
}

@end