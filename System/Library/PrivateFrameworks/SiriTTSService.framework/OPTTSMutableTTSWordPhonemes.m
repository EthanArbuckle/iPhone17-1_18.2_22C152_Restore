@interface OPTTSMutableTTSWordPhonemes
- (NSArray)phonemes;
- (OPTTSMutableTTSWordPhonemes)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPhonemes:(id)a3;
@end

@implementation OPTTSMutableTTSWordPhonemes

- (void)setPhonemes:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)phonemes
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"phonemes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableTTSWordPhonemes)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTTSWordPhonemes;
  v2 = [(OPTTSMutableTTSWordPhonemes *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end