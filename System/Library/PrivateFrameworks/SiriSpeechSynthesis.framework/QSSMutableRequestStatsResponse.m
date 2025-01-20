@interface QSSMutableRequestStatsResponse
- (NSArray)BOOL_stats;
- (NSArray)double_stats;
- (NSArray)int32_stats;
- (NSString)language;
- (NSString)request_locale;
- (NSString)speech_id;
- (QSSMutableRequestStatsResponse)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBool_stats:(id)a3;
- (void)setDouble_stats:(id)a3;
- (void)setInt32_stats:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setRequest_locale:(id)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation QSSMutableRequestStatsResponse

- (void)setRequest_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_locale"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setDouble_stats:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)double_stats
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"double_stats"];
}

- (void)setInt32_stats:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)int32_stats
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"int32_stats"];
}

- (void)setBool_stats:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)BOOL_stats
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"BOOL_stats"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableRequestStatsResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRequestStatsResponse;
  v2 = [(QSSMutableRequestStatsResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end