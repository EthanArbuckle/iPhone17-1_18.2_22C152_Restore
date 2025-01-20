@interface QSSMutableRecognitionToken
- (BOOL)add_space_after;
- (NSString)ipa_phone_seq;
- (NSString)phone_seq;
- (NSString)token_text;
- (QSSMutableRecognitionToken)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)confidence;
- (int)end_milli_seconds;
- (int)silence_start_milli_seconds;
- (int)start_milli_seconds;
- (void)setAdd_space_after:(BOOL)a3;
- (void)setConfidence:(int)a3;
- (void)setEnd_milli_seconds:(int)a3;
- (void)setIpa_phone_seq:(id)a3;
- (void)setPhone_seq:(id)a3;
- (void)setSilence_start_milli_seconds:(int)a3;
- (void)setStart_milli_seconds:(int)a3;
- (void)setToken_text:(id)a3;
@end

@implementation QSSMutableRecognitionToken

- (void)setIpa_phone_seq:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)ipa_phone_seq
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"ipa_phone_seq"];
}

- (void)setPhone_seq:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)phone_seq
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"phone_seq"];
}

- (void)setAdd_space_after:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)add_space_after
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"add_space_after"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setConfidence:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"confidence"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSilence_start_milli_seconds:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)silence_start_milli_seconds
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"silence_start_milli_seconds"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setEnd_milli_seconds:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)end_milli_seconds
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"end_milli_seconds"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setStart_milli_seconds:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)start_milli_seconds
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_milli_seconds"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setToken_text:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)token_text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"token_text"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableRecognitionToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionToken;
  v2 = [(QSSMutableRecognitionToken *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end