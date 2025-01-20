@interface QSSMutableTranslationLocalePair
- (NSString)source_locale;
- (NSString)target_locale;
- (QSSMutableTranslationLocalePair)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSource_locale:(id)a3;
- (void)setTarget_locale:(id)a3;
@end

@implementation QSSMutableTranslationLocalePair

- (void)setTarget_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)target_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_locale"];
}

- (void)setSource_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)source_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_locale"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTranslationLocalePair)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTranslationLocalePair;
  v2 = [(QSSMutableTranslationLocalePair *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end