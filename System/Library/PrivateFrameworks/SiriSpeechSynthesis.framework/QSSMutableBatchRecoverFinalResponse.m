@interface QSSMutableBatchRecoverFinalResponse
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (QSSMutableBatchRecoverFinalResponse)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)error_code;
- (int)num_of_processed;
- (int)num_of_requested;
- (int)num_of_succeeded;
- (void)setError_code:(int)a3;
- (void)setError_str:(id)a3;
- (void)setNum_of_processed:(int)a3;
- (void)setNum_of_requested:(int)a3;
- (void)setNum_of_succeeded:(int)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation QSSMutableBatchRecoverFinalResponse

- (void)setNum_of_succeeded:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)num_of_succeeded
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"num_of_succeeded"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setNum_of_processed:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)num_of_processed
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"num_of_processed"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setNum_of_requested:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)num_of_requested
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"num_of_requested"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setError_str:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)error_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_str"];
}

- (void)setError_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)error_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_code"];
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

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBatchRecoverFinalResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchRecoverFinalResponse;
  v2 = [(QSSMutableBatchRecoverFinalResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end