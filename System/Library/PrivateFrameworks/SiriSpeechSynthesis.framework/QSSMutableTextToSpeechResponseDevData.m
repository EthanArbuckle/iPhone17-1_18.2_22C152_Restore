@interface QSSMutableTextToSpeechResponseDevData
- (BOOL)has_click;
- (NSString)log;
- (NSString)worker_process_type;
- (QSSMutableTextToSpeechResponseDevData)init;
- (QSSQSSVersionInfo)server_info;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHas_click:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setServer_info:(id)a3;
- (void)setWorker_process_type:(id)a3;
@end

@implementation QSSMutableTextToSpeechResponseDevData

- (void)setWorker_process_type:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)worker_process_type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"worker_process_type"];
}

- (void)setHas_click:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)has_click
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"has_click"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setServer_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSQSSVersionInfo)server_info
{
  return (QSSQSSVersionInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"server_info"];
}

- (void)setLog:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)log
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"log"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechResponseDevData)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechResponseDevData;
  v2 = [(QSSMutableTextToSpeechResponseDevData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end