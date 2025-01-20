@interface OPTTSMutableTextToSpeechResource
- (NSString)language;
- (NSString)version;
- (OPTTSMutableTextToSpeechResource)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLanguage:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation OPTTSMutableTextToSpeechResource

- (void)setVersion:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"version"];
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

- (OPTTSMutableTextToSpeechResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechResource;
  v2 = [(OPTTSMutableTextToSpeechResource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end