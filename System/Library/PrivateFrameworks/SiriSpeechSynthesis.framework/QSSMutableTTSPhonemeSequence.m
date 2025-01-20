@interface QSSMutableTTSPhonemeSequence
- (NSArray)word_phonemes;
- (QSSMutableTTSPhonemeSequence)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setWord_phonemes:(id)a3;
@end

@implementation QSSMutableTTSPhonemeSequence

- (void)setWord_phonemes:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)word_phonemes
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"word_phonemes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTTSPhonemeSequence)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTTSPhonemeSequence;
  v2 = [(QSSMutableTTSPhonemeSequence *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end