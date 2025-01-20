@interface FTMutableShortcutFuzzyMatchResponse
- (FTMutableShortcutFuzzyMatchResponse)init;
- (NSArray)shortcut_score_pairs;
- (NSString)utterance;
- (id)copyWithZone:(_NSZone *)a3;
- (int)return_code;
- (void)setReturn_code:(int)a3;
- (void)setShortcut_score_pairs:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation FTMutableShortcutFuzzyMatchResponse

- (FTMutableShortcutFuzzyMatchResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableShortcutFuzzyMatchResponse;
  v2 = [(FTMutableShortcutFuzzyMatchResponse *)&v6 init];
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

- (NSString)utterance
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"utterance"];
}

- (void)setUtterance:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)shortcut_score_pairs
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"shortcut_score_pairs"];
}

- (void)setShortcut_score_pairs:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)return_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_code"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setReturn_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end