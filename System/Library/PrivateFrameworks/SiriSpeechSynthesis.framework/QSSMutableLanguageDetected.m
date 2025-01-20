@interface QSSMutableLanguageDetected
- (NSArray)predictions;
- (NSString)detected_locale;
- (QSSMutableLanguageDetected)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetected_locale:(id)a3;
- (void)setPredictions:(id)a3;
@end

@implementation QSSMutableLanguageDetected

- (void)setPredictions:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)predictions
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"predictions"];
}

- (void)setDetected_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)detected_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"detected_locale"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableLanguageDetected)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableLanguageDetected;
  v2 = [(QSSMutableLanguageDetected *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end