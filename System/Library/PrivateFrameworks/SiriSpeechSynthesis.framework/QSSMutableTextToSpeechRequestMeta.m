@interface QSSMutableTextToSpeechRequestMeta
- (BOOL)is_synthesis;
- (NSString)app_id;
- (QSSMutableTextToSpeechRequestMeta)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)channel_type;
- (void)setApp_id:(id)a3;
- (void)setChannel_type:(int64_t)a3;
- (void)setIs_synthesis:(BOOL)a3;
@end

@implementation QSSMutableTextToSpeechRequestMeta

- (void)setIs_synthesis:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)is_synthesis
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"is_synthesis"];
  char v3 = [v2 BOOLValue];

  return v3;
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

- (void)setChannel_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)channel_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"channel_type"];
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

- (QSSMutableTextToSpeechRequestMeta)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechRequestMeta;
  v2 = [(QSSMutableTextToSpeechRequestMeta *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end