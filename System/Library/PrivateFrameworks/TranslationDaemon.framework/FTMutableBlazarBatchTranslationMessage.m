@interface FTMutableBlazarBatchTranslationMessage
+ (Class)session_message_mutableClassForType:(int64_t)a3;
+ (int64_t)session_message_typeForMutableObject:(id)a3;
+ (int64_t)session_message_typeForObject:(id)a3;
- (FTBatchTranslationFeedbackRequest)session_messageAsFTBatchTranslationFeedbackRequest;
- (FTBatchTranslationLoggingRequest)session_messageAsFTBatchTranslationLoggingRequest;
- (FTBatchTranslationRequest)session_messageAsFTBatchTranslationRequest;
- (FTBatchTranslationResponse)session_messageAsFTBatchTranslationResponse;
- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse;
- (FTMutableBlazarBatchTranslationMessage)init;
- (FTTranslationSupportedLanguagesRequest)session_messageAsFTTranslationSupportedLanguagesRequest;
- (FTTranslationSupportedLanguagesResponse)session_messageAsFTTranslationSupportedLanguagesResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)session_message_type;
- (void)setSession_message:(id)a3;
- (void)setSession_messageAsFTBatchTranslationFeedbackRequest:(id)a3;
- (void)setSession_messageAsFTBatchTranslationLoggingRequest:(id)a3;
- (void)setSession_messageAsFTBatchTranslationRequest:(id)a3;
- (void)setSession_messageAsFTBatchTranslationResponse:(id)a3;
- (void)setSession_messageAsFTFinalBlazarResponse:(id)a3;
- (void)setSession_messageAsFTTranslationSupportedLanguagesRequest:(id)a3;
- (void)setSession_messageAsFTTranslationSupportedLanguagesResponse:(id)a3;
- (void)setSession_message_type:(int64_t)a3;
@end

@implementation FTMutableBlazarBatchTranslationMessage

- (FTMutableBlazarBatchTranslationMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableBlazarBatchTranslationMessage;
  v2 = [(FTMutableBlazarBatchTranslationMessage *)&v6 init];
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

- (int64_t)session_message_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSession_message_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTBatchTranslationRequest)session_messageAsFTBatchTranslationRequest
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 1)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationRequest *)v3;
}

- (void)setSession_messageAsFTBatchTranslationRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:1];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTBatchTranslationFeedbackRequest)session_messageAsFTBatchTranslationFeedbackRequest
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 2)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationFeedbackRequest *)v3;
}

- (void)setSession_messageAsFTBatchTranslationFeedbackRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:2];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTBatchTranslationLoggingRequest)session_messageAsFTBatchTranslationLoggingRequest
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 3)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationLoggingRequest *)v3;
}

- (void)setSession_messageAsFTBatchTranslationLoggingRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:3];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTTranslationSupportedLanguagesRequest)session_messageAsFTTranslationSupportedLanguagesRequest
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 4)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTTranslationSupportedLanguagesRequest *)v3;
}

- (void)setSession_messageAsFTTranslationSupportedLanguagesRequest:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:4];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTBatchTranslationResponse)session_messageAsFTBatchTranslationResponse
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 5)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTBatchTranslationResponse *)v3;
}

- (void)setSession_messageAsFTBatchTranslationResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:5];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 6)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTFinalBlazarResponse *)v3;
}

- (void)setSession_messageAsFTFinalBlazarResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:6];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (FTTranslationSupportedLanguagesResponse)session_messageAsFTTranslationSupportedLanguagesResponse
{
  if ([(FTMutableBlazarBatchTranslationMessage *)self session_message_type] == 7)
  {
    int64_t v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_message"];
  }
  else
  {
    int64_t v3 = 0;
  }
  return (FTTranslationSupportedLanguagesResponse *)v3;
}

- (void)setSession_messageAsFTTranslationSupportedLanguagesResponse:(id)a3
{
  id v5 = a3;
  [(FTMutableBlazarBatchTranslationMessage *)self setSession_message_type:7];
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

- (void)setSession_message:(id)a3
{
  id v5 = a3;
  -[FTMutableBlazarBatchTranslationMessage setSession_message_type:](self, "setSession_message_type:", objc_msgSend((id)objc_opt_class(), "session_message_typeForObject:", v5));
  id v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"session_message"];
}

+ (Class)session_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (int64_t)session_message_typeForMutableObject:(id)a3
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
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)session_message_typeForObject:(id)a3
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
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 4;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 5;
  }
  else if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0 {
         || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  }
  {
    int64_t v4 = 6;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end