@interface SFCacheEntry
- (NSDate)lastUsed;
- (NSObject)item;
- (SFCacheEntry)initWithCacheItem:(id)a3;
- (void)setItem:(id)a3;
- (void)setLastUsed:(id)a3;
@end

@implementation SFCacheEntry

- (SFCacheEntry)initWithCacheItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCacheEntry;
  v6 = [(SFCacheEntry *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    lastUsed = v7->_lastUsed;
    v7->_lastUsed = (NSDate *)v8;
  }
  return v7;
}

- (NSObject)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end