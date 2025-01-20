@interface QSSMutableTextToSpeechVoice
- (NSString)gender;
- (NSString)language;
- (NSString)name;
- (NSString)quality;
- (NSString)type;
- (NSString)version;
- (QSSMutableTextToSpeechVoice)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGender:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setQuality:(id)a3;
- (void)setType:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation QSSMutableTextToSpeechVoice

- (void)setType:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"type"];
}

- (void)setQuality:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)quality
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"quality"];
}

- (void)setVersion:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"version"];
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"name"];
}

- (void)setGender:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)gender
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"gender"];
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechVoice)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechVoice;
  v2 = [(QSSMutableTextToSpeechVoice *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end