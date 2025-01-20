@interface FTMutableLanguageDetected
- (FTMutableLanguageDetected)init;
- (NSArray)predictions;
- (NSString)detected_locale;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetected_locale:(id)a3;
- (void)setPredictions:(id)a3;
@end

@implementation FTMutableLanguageDetected

- (FTMutableLanguageDetected)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableLanguageDetected;
  v2 = [(FTMutableLanguageDetected *)&v6 init];
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

- (NSString)detected_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"detected_locale"];
}

- (void)setDetected_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)predictions
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"predictions"];
}

- (void)setPredictions:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end