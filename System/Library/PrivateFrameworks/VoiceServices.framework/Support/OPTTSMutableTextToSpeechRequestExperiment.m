@interface OPTTSMutableTextToSpeechRequestExperiment
- (NSString)experiment_identifier;
- (OPTTSMutableTextToSpeechRequestExperiment)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setExperiment_identifier:(id)a3;
@end

@implementation OPTTSMutableTextToSpeechRequestExperiment

- (void)setExperiment_identifier:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)experiment_identifier
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"experiment_identifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableTextToSpeechRequestExperiment)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechRequestExperiment;
  v2 = [(OPTTSMutableTextToSpeechRequestExperiment *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end