@interface FTMutableTextToSpeechCacheContainerRpcV2
- (FTMutableTextToSpeechCacheContainerRpcV2)init;
- (FTTextToSpeechRequest)cached_request;
- (FTTextToSpeechResponse)cached_response;
- (NSString)original_session_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCached_request:(id)a3;
- (void)setCached_response:(id)a3;
- (void)setOriginal_session_id:(id)a3;
@end

@implementation FTMutableTextToSpeechCacheContainerRpcV2

- (FTMutableTextToSpeechCacheContainerRpcV2)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechCacheContainerRpcV2;
  v2 = [(FTMutableTextToSpeechCacheContainerRpcV2 *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSString)original_session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"original_session_id"];
}

- (void)setOriginal_session_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequest)cached_request
{
  return (FTTextToSpeechRequest *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"cached_request"];
}

- (void)setCached_request:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechResponse)cached_response
{
  return (FTTextToSpeechResponse *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"cached_response"];
}

- (void)setCached_response:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end