@interface QSSMutableRecognitionPhraseTokensAlternatives
- (BOOL)has_unsuggested_alternatives;
- (NSArray)tok_phrases;
- (QSSMutableRecognitionPhraseTokensAlternatives)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHas_unsuggested_alternatives:(BOOL)a3;
- (void)setTok_phrases:(id)a3;
@end

@implementation QSSMutableRecognitionPhraseTokensAlternatives

- (void)setHas_unsuggested_alternatives:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)has_unsuggested_alternatives
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"has_unsuggested_alternatives"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTok_phrases:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)tok_phrases
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"tok_phrases"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableRecognitionPhraseTokensAlternatives)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionPhraseTokensAlternatives;
  v2 = [(QSSMutableRecognitionPhraseTokensAlternatives *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end