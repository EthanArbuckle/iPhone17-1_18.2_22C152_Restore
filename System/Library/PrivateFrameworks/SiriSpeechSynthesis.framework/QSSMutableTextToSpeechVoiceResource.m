@interface QSSMutableTextToSpeechVoiceResource
- (NSData)data;
- (QSSMutableTextToSpeechVoiceResource)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)data:(id)a3;
- (void)setData:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation QSSMutableTextToSpeechVoiceResource

- (void)data:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutableTextToSpeechVoiceResource *)self data];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutableTextToSpeechVoiceResource *)self data];
  v7[2](v7, v5, [v6 length]);
}

- (void)setData:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)data
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"data"];
}

- (void)setType:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"type"];
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

- (QSSMutableTextToSpeechVoiceResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechVoiceResource;
  v2 = [(QSSMutableTextToSpeechVoiceResource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end