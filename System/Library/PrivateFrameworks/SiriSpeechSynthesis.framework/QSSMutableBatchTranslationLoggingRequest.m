@interface QSSMutableBatchTranslationLoggingRequest
- (NSString)session_id;
- (QSSMutableBatchTranslationLoggingRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)time_to_first_response;
- (int)time_to_page_complete;
- (int)time_to_viewport_complete;
- (void)setSession_id:(id)a3;
- (void)setTime_to_first_response:(int)a3;
- (void)setTime_to_page_complete:(int)a3;
- (void)setTime_to_viewport_complete:(int)a3;
@end

@implementation QSSMutableBatchTranslationLoggingRequest

- (void)setTime_to_page_complete:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)time_to_page_complete
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"time_to_page_complete"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setTime_to_viewport_complete:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)time_to_viewport_complete
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"time_to_viewport_complete"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setTime_to_first_response:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)time_to_first_response
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"time_to_first_response"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBatchTranslationLoggingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchTranslationLoggingRequest;
  v2 = [(QSSMutableBatchTranslationLoggingRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end