@interface QSSMutableShortcutFuzzyMatchRequest
- (NSArray)shortcuts;
- (NSString)context;
- (NSString)device_type;
- (NSString)interaction_id;
- (NSString)locale;
- (NSString)request_id;
- (NSString)session_id;
- (QSSMutableShortcutFuzzyMatchRequest)init;
- (QSSShortcutFuzzyMatchRequest_StringTokenPair)utterance;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContext:(id)a3;
- (void)setDevice_type:(id)a3;
- (void)setInteraction_id:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setShortcuts:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation QSSMutableShortcutFuzzyMatchRequest

- (void)setContext:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)context
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context"];
}

- (void)setDevice_type:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)device_type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"device_type"];
}

- (void)setLocale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"locale"];
}

- (void)setInteraction_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)interaction_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"interaction_id"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (void)setShortcuts:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)shortcuts
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"shortcuts"];
}

- (void)setUtterance:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSShortcutFuzzyMatchRequest_StringTokenPair)utterance
{
  return (QSSShortcutFuzzyMatchRequest_StringTokenPair *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"utterance"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableShortcutFuzzyMatchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableShortcutFuzzyMatchRequest;
  v2 = [(QSSMutableShortcutFuzzyMatchRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end