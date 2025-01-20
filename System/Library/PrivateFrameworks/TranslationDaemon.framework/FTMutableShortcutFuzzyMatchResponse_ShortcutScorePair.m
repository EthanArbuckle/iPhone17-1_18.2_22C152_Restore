@interface FTMutableShortcutFuzzyMatchResponse_ShortcutScorePair
- (FTMutableShortcutFuzzyMatchResponse_ShortcutScorePair)init;
- (NSString)shortcut;
- (double)similarity_score;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setShortcut:(id)a3;
- (void)setSimilarity_score:(double)a3;
@end

@implementation FTMutableShortcutFuzzyMatchResponse_ShortcutScorePair

- (FTMutableShortcutFuzzyMatchResponse_ShortcutScorePair)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableShortcutFuzzyMatchResponse_ShortcutScorePair;
  v2 = [(FTMutableShortcutFuzzyMatchResponse_ShortcutScorePair *)&v6 init];
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

- (NSString)shortcut
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"shortcut"];
}

- (void)setShortcut:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)similarity_score
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"similarity_score"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setSimilarity_score:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end