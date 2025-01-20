@interface QSSMutableBatchTranslationRequest
- (NSArray)paragraphs;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)session_id;
- (NSString)source_language;
- (NSString)target_language;
- (NSString)task;
- (NSString)url;
- (QSSMutableBatchTranslationRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)opt_in_status;
- (void)setApp_id:(id)a3;
- (void)setOpt_in_status:(int64_t)a3;
- (void)setParagraphs:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSource_language:(id)a3;
- (void)setTarget_language:(id)a3;
- (void)setTask:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation QSSMutableBatchTranslationRequest

- (void)setOpt_in_status:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)opt_in_status
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"opt_in_status"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setUrl:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)url
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"url"];
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

- (void)setApp_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)app_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"app_id"];
}

- (void)setParagraphs:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)paragraphs
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"paragraphs"];
}

- (void)setTarget_language:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)target_language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_language"];
}

- (void)setSource_language:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)source_language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_language"];
}

- (void)setTask:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)task
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"task"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBatchTranslationRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchTranslationRequest;
  v2 = [(QSSMutableBatchTranslationRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end