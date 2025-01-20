@interface SSLRUCacheItem
- (NSCopying)key;
- (SSLRUCacheItem)initWithKey:(id)a3 object:(id)a4;
- (void)setKey:(id)a3;
@end

@implementation SSLRUCacheItem

- (SSLRUCacheItem)initWithKey:(id)a3 object:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSLRUCacheItem;
  v7 = [(SSDoubleLinkedListNode *)&v10 initWithObject:a4];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_key, v6);
  }

  return v8;
}

- (NSCopying)key
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_key);
  return (NSCopying *)WeakRetained;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end