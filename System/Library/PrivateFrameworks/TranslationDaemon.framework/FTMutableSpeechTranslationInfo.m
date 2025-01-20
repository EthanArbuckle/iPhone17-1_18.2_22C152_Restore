@interface FTMutableSpeechTranslationInfo
- (FTMutableSpeechTranslationInfo)init;
- (FTRecognitionSausage)raw_sausage;
- (NSArray)raw_nbest_choices;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRaw_nbest_choices:(id)a3;
- (void)setRaw_sausage:(id)a3;
@end

@implementation FTMutableSpeechTranslationInfo

- (FTMutableSpeechTranslationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableSpeechTranslationInfo;
  v2 = [(FTMutableSpeechTranslationInfo *)&v6 init];
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

- (FTRecognitionSausage)raw_sausage
{
  return (FTRecognitionSausage *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"raw_sausage"];
}

- (void)setRaw_sausage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)raw_nbest_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"raw_nbest_choices"];
}

- (void)setRaw_nbest_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end