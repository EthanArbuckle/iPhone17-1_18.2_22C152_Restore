@interface QSSMutableBatchTranslationStreamingRequest
- (QSSBatchTranslationFeedbackRequest)contentAsQSSBatchTranslationFeedbackRequest;
- (QSSBatchTranslationLoggingRequest)contentAsQSSBatchTranslationLoggingRequest;
- (QSSBatchTranslationRequest)contentAsQSSBatchTranslationRequest;
- (QSSMutableBatchTranslationStreamingRequest)init;
- (QSSTranslationSupportedLanguagesRequest)contentAsQSSTranslationSupportedLanguagesRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContentAsQSSBatchTranslationFeedbackRequest:(id)a3;
- (void)setContentAsQSSBatchTranslationLoggingRequest:(id)a3;
- (void)setContentAsQSSBatchTranslationRequest:(id)a3;
- (void)setContentAsQSSTranslationSupportedLanguagesRequest:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation QSSMutableBatchTranslationStreamingRequest

- (void)setContentAsQSSTranslationSupportedLanguagesRequest:(id)a3
{
  id v5 = a3;
  [(QSSMutableBatchTranslationStreamingRequest *)self setContent_type:4];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSTranslationSupportedLanguagesRequest)contentAsQSSTranslationSupportedLanguagesRequest
{
  if ([(QSSMutableBatchTranslationStreamingRequest *)self content_type] == 4)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSTranslationSupportedLanguagesRequest *)v3;
}

- (void)setContentAsQSSBatchTranslationLoggingRequest:(id)a3
{
  id v5 = a3;
  [(QSSMutableBatchTranslationStreamingRequest *)self setContent_type:3];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSBatchTranslationLoggingRequest)contentAsQSSBatchTranslationLoggingRequest
{
  if ([(QSSMutableBatchTranslationStreamingRequest *)self content_type] == 3)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSBatchTranslationLoggingRequest *)v3;
}

- (void)setContentAsQSSBatchTranslationFeedbackRequest:(id)a3
{
  id v5 = a3;
  [(QSSMutableBatchTranslationStreamingRequest *)self setContent_type:2];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSBatchTranslationFeedbackRequest)contentAsQSSBatchTranslationFeedbackRequest
{
  if ([(QSSMutableBatchTranslationStreamingRequest *)self content_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSBatchTranslationFeedbackRequest *)v3;
}

- (void)setContentAsQSSBatchTranslationRequest:(id)a3
{
  id v5 = a3;
  [(QSSMutableBatchTranslationStreamingRequest *)self setContent_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (QSSBatchTranslationRequest)contentAsQSSBatchTranslationRequest
{
  if ([(QSSMutableBatchTranslationStreamingRequest *)self content_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    v3 = 0;
  }
  return (QSSBatchTranslationRequest *)v3;
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

- (QSSMutableBatchTranslationStreamingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchTranslationStreamingRequest;
  v2 = [(QSSMutableBatchTranslationStreamingRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end