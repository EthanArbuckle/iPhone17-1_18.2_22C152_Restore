@interface QSSMutableTextToSpeechCacheContainer
- (NSArray)cache_object;
- (QSSMutableTextToSpeechCacheContainer)init;
- (QSSTextToSpeechCacheMetaInfo)cache_meta_info;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCache_meta_info:(id)a3;
- (void)setCache_object:(id)a3;
@end

@implementation QSSMutableTextToSpeechCacheContainer

- (void)setCache_object:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)cache_object
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"cache_object"];
}

- (void)setCache_meta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechCacheMetaInfo)cache_meta_info
{
  return (QSSTextToSpeechCacheMetaInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"cache_meta_info"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechCacheContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechCacheContainer;
  v2 = [(QSSMutableTextToSpeechCacheContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end