@interface OPTTSMutableTextToSpeechRequestDevConfig
- (BOOL)return_log;
- (BOOL)return_server_info;
- (NSString)resource_asset_path;
- (NSString)voice_asset_path;
- (OPTTSMutableTextToSpeechRequestDevConfig)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setResource_asset_path:(id)a3;
- (void)setReturn_log:(BOOL)a3;
- (void)setReturn_server_info:(BOOL)a3;
- (void)setVoice_asset_path:(id)a3;
@end

@implementation OPTTSMutableTextToSpeechRequestDevConfig

- (void)setReturn_server_info:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)return_server_info
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_server_info"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setResource_asset_path:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)resource_asset_path
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"resource_asset_path"];
}

- (void)setVoice_asset_path:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)voice_asset_path
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"voice_asset_path"];
}

- (void)setReturn_log:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)return_log
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_log"];
  char v3 = [v2 BOOLValue];

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

- (OPTTSMutableTextToSpeechRequestDevConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechRequestDevConfig;
  v2 = [(OPTTSMutableTextToSpeechRequestDevConfig *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end