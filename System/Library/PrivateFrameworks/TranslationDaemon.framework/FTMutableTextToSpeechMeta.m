@interface FTMutableTextToSpeechMeta
- (FTMutableTextToSpeechMeta)init;
- (FTQSSVersionInfo)server_info;
- (FTTextToSpeechResource)resource;
- (FTTextToSpeechVoice)voice;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setResource:(id)a3;
- (void)setServer_info:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation FTMutableTextToSpeechMeta

- (FTMutableTextToSpeechMeta)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechMeta;
  v2 = [(FTMutableTextToSpeechMeta *)&v6 init];
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

- (FTTextToSpeechVoice)voice
{
  return (FTTextToSpeechVoice *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"voice"];
}

- (void)setVoice:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechResource)resource
{
  return (FTTextToSpeechResource *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"resource"];
}

- (void)setResource:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTQSSVersionInfo)server_info
{
  return (FTQSSVersionInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"server_info"];
}

- (void)setServer_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end