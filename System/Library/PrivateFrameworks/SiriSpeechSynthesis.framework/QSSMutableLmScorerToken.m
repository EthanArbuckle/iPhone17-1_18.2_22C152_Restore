@interface QSSMutableLmScorerToken
- (NSString)token_str;
- (QSSMutableLmScorerToken)init;
- (double)log10_score;
- (id)copyWithZone:(_NSZone *)a3;
- (int)ngram_used;
- (void)setLog10_score:(double)a3;
- (void)setNgram_used:(int)a3;
- (void)setToken_str:(id)a3;
@end

@implementation QSSMutableLmScorerToken

- (void)setNgram_used:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)ngram_used
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"ngram_used"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setLog10_score:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)log10_score
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"log10_score"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setToken_str:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)token_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"token_str"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableLmScorerToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableLmScorerToken;
  v2 = [(QSSMutableLmScorerToken *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end