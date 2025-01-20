@interface QSSMutableTextNormalizationRequest
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)text;
- (QSSMutableTextNormalizationRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)nbest_variants_max;
- (void)setLanguage:(id)a3;
- (void)setNbest_variants_max:(int)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setText:(id)a3;
@end

@implementation QSSMutableTextNormalizationRequest

- (void)setNbest_variants_max:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)nbest_variants_max
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"nbest_variants_max"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
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

- (QSSMutableTextNormalizationRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextNormalizationRequest;
  v2 = [(QSSMutableTextNormalizationRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end