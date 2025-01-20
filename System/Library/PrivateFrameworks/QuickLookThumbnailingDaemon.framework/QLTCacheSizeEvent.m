@interface QLTCacheSizeEvent
- (NSString)name;
- (QLTCacheSizeEvent)initWithCacheSize:(unint64_t)a3;
- (id)build;
- (id)propertiesBuilder;
- (unint64_t)cacheSize;
@end

@implementation QLTCacheSizeEvent

- (QLTCacheSizeEvent)initWithCacheSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLTCacheSizeEvent;
  result = [(QLTCacheSizeEvent *)&v5 init];
  if (result) {
    result->_cacheSize = a3;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.quicklook.cache.size";
}

- (id)propertiesBuilder
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__QLTCacheSizeEvent_propertiesBuilder__block_invoke;
  aBlock[3] = &unk_1E6D0D470;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  return v2;
}

uint64_t __38__QLTCacheSizeEvent_propertiesBuilder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) build];
}

- (id)build
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"com.apple.message.value";
  v2 = [NSNumber numberWithUnsignedInteger:self->_cacheSize];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

@end