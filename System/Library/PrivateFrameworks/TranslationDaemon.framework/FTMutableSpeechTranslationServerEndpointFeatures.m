@interface FTMutableSpeechTranslationServerEndpointFeatures
- (FTMutableSpeechTranslationServerEndpointFeatures)init;
- (FTServerEndpointFeatures)server_endpoint_features;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)source_locale;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConversation_id:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setServer_endpoint_features:(id)a3;
- (void)setSource_locale:(id)a3;
@end

@implementation FTMutableSpeechTranslationServerEndpointFeatures

- (FTMutableSpeechTranslationServerEndpointFeatures)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableSpeechTranslationServerEndpointFeatures;
  v2 = [(FTMutableSpeechTranslationServerEndpointFeatures *)&v6 init];
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

- (NSString)conversation_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"conversation_id"];
}

- (void)setConversation_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)source_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_locale"];
}

- (void)setSource_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTServerEndpointFeatures)server_endpoint_features
{
  return (FTServerEndpointFeatures *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"server_endpoint_features"];
}

- (void)setServer_endpoint_features:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end