@interface FTMutableTextToSpeechResponseDevData
- (BOOL)has_click;
- (FTMutableTextToSpeechResponseDevData)init;
- (FTQSSVersionInfo)server_info;
- (NSString)engine_error_message;
- (NSString)log;
- (NSString)worker_process_type;
- (id)copyWithZone:(_NSZone *)a3;
- (int)engine_error_code;
- (void)setEngine_error_code:(int)a3;
- (void)setEngine_error_message:(id)a3;
- (void)setHas_click:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setServer_info:(id)a3;
- (void)setWorker_process_type:(id)a3;
@end

@implementation FTMutableTextToSpeechResponseDevData

- (FTMutableTextToSpeechResponseDevData)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechResponseDevData;
  v2 = [(FTMutableTextToSpeechResponseDevData *)&v6 init];
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

- (NSString)log
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"log"];
}

- (void)setLog:(id)a3
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

- (BOOL)has_click
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"has_click"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHas_click:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)worker_process_type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"worker_process_type"];
}

- (void)setWorker_process_type:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)engine_error_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"engine_error_code"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setEngine_error_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)engine_error_message
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"engine_error_message"];
}

- (void)setEngine_error_message:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end