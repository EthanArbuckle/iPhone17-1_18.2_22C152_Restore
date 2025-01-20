@interface _PASLRUCacheData
- (_PASLRUCacheData)init;
@end

@implementation _PASLRUCacheData

- (_PASLRUCacheData)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PASLRUCacheData;
  v2 = [(_PASLRUCacheData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    items = v2->items;
    v2->items = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    keysMRU = v2->keysMRU;
    v2->keysMRU = (NSMutableArray *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keysMRU, 0);

  objc_storeStrong((id *)&self->items, 0);
}

@end