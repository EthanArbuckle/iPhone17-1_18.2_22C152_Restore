@interface QSSMutableStreamingTranslationStreamingResponse
- (QSSMutableStreamingTranslationStreamingResponse)init;
- (QSSTranslationResponse)contentAsQSSTranslationResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContentAsQSSTranslationResponse:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation QSSMutableStreamingTranslationStreamingResponse

- (void)setContentAsQSSTranslationResponse:(id)a3
{
  id v5 = a3;
  [(QSSMutableStreamingTranslationStreamingResponse *)self setContent_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSTranslationResponse)contentAsQSSTranslationResponse
{
  if ([(QSSMutableStreamingTranslationStreamingResponse *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSTranslationResponse *)v3;
}

- (void)setContent_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)content_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableStreamingTranslationStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableStreamingTranslationStreamingResponse;
  v2 = [(QSSMutableStreamingTranslationStreamingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end