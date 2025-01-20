@interface QSSMutableTextToSpeechSpeechFeatureModelIdentifier
- (NSString)language;
- (NSString)name;
- (NSString)type;
- (QSSMutableTextToSpeechSpeechFeatureModelIdentifier)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation QSSMutableTextToSpeechSpeechFeatureModelIdentifier

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"name"];
}

- (void)setType:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"type"];
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

- (QSSMutableTextToSpeechSpeechFeatureModelIdentifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechSpeechFeatureModelIdentifier;
  v2 = [(QSSMutableTextToSpeechSpeechFeatureModelIdentifier *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end