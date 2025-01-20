@interface FTMutableCorrectionsAlignment
- (FTMutableCorrectionsAlignment)init;
- (NSString)corrected_words;
- (NSString)original_words;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCorrected_words:(id)a3;
- (void)setOriginal_words:(id)a3;
@end

@implementation FTMutableCorrectionsAlignment

- (FTMutableCorrectionsAlignment)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableCorrectionsAlignment;
  v2 = [(FTMutableCorrectionsAlignment *)&v6 init];
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

- (NSString)original_words
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"original_words"];
}

- (void)setOriginal_words:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)corrected_words
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"corrected_words"];
}

- (void)setCorrected_words:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end