@interface FTMutableTranslationOptions
- (BOOL)disable_payload_logging;
- (BOOL)enable_disambiguation_alternatives;
- (BOOL)mask_profanity;
- (FTMutableTranslationOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisable_payload_logging:(BOOL)a3;
- (void)setEnable_disambiguation_alternatives:(BOOL)a3;
- (void)setMask_profanity:(BOOL)a3;
@end

@implementation FTMutableTranslationOptions

- (FTMutableTranslationOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTranslationOptions;
  v2 = [(FTMutableTranslationOptions *)&v6 init];
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

- (BOOL)enable_disambiguation_alternatives
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_disambiguation_alternatives"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnable_disambiguation_alternatives:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)mask_profanity
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"mask_profanity"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMask_profanity:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)disable_payload_logging
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"disable_payload_logging"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDisable_payload_logging:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end