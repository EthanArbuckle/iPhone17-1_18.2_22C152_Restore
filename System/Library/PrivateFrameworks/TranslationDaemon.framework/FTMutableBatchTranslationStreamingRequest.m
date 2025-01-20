@interface FTMutableBatchTranslationStreamingRequest
+ (Class)content_mutableClassForType:(int64_t)a3;
+ (int64_t)content_typeForMutableObject:(id)a3;
+ (int64_t)content_typeForObject:(id)a3;
- (FTBatchTranslationFeedbackRequest)contentAsFTBatchTranslationFeedbackRequest;
- (FTBatchTranslationLoggingRequest)contentAsFTBatchTranslationLoggingRequest;
- (FTBatchTranslationRequest)contentAsFTBatchTranslationRequest;
- (FTMutableBatchTranslationStreamingRequest)init;
- (FTTranslationSupportedLanguagesRequest)contentAsFTTranslationSupportedLanguagesRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)content_type;
- (void)setContent:(id)a3;
- (void)setContentAsFTBatchTranslationFeedbackRequest:(id)a3;
- (void)setContentAsFTBatchTranslationLoggingRequest:(id)a3;
- (void)setContentAsFTBatchTranslationRequest:(id)a3;
- (void)setContentAsFTTranslationSupportedLanguagesRequest:(id)a3;
- (void)setContent_type:(int64_t)a3;
@end

@implementation FTMutableBatchTranslationStreamingRequest

- (FTMutableBatchTranslationStreamingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBatchTranslationStreamingRequest;
  v2 = [(FTMutableBatchTranslationStreamingRequest *)&v6 init];
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

- (int64_t)content_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setContent_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTBatchTranslationRequest)contentAsFTBatchTranslationRequest
{
  if ([(FTMutableBatchTranslationStreamingRequest *)self content_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationRequest *)v3;
}

- (void)setContentAsFTBatchTranslationRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBatchTranslationStreamingRequest *)self setContent_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTBatchTranslationFeedbackRequest)contentAsFTBatchTranslationFeedbackRequest
{
  if ([(FTMutableBatchTranslationStreamingRequest *)self content_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationFeedbackRequest *)v3;
}

- (void)setContentAsFTBatchTranslationFeedbackRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBatchTranslationStreamingRequest *)self setContent_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTBatchTranslationLoggingRequest)contentAsFTBatchTranslationLoggingRequest
{
  if ([(FTMutableBatchTranslationStreamingRequest *)self content_type] == 3)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationLoggingRequest *)v3;
}

- (void)setContentAsFTBatchTranslationLoggingRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBatchTranslationStreamingRequest *)self setContent_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (FTTranslationSupportedLanguagesRequest)contentAsFTTranslationSupportedLanguagesRequest
{
  if ([(FTMutableBatchTranslationStreamingRequest *)self content_type] == 4)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"content"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTTranslationSupportedLanguagesRequest *)v3;
}

- (void)setContentAsFTTranslationSupportedLanguagesRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBatchTranslationStreamingRequest *)self setContent_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

- (void)setContent:(id)a3
{
  id v5 = a3;
  -[FTMutableBatchTranslationStreamingRequest setContent_type:](self, "setContent_type:", objc_msgSend((id)objc_opt_class(), "content_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"content"];
}

+ (Class)content_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)content_typeForMutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)content_typeForObject:(id)a3
{
  id v3 = a3;
  if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 2;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 3;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end