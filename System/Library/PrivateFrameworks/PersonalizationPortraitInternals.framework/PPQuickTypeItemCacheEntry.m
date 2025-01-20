@interface PPQuickTypeItemCacheEntry
@end

@implementation PPQuickTypeItemCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedAtDate, 0);
  objc_storeStrong((id *)&self->query, 0);
  objc_storeStrong((id *)&self->items, 0);
}

@end