@interface FTMutableSiriPayloadTranslationInfo
- (FTMutableSiriPayloadTranslationInfo)init;
- (FTRecognitionSausage)pre_sausage_payload;
- (NSString)post_itn_payload;
- (NSString)pre_itn_payload;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPost_itn_payload:(id)a3;
- (void)setPre_itn_payload:(id)a3;
- (void)setPre_sausage_payload:(id)a3;
@end

@implementation FTMutableSiriPayloadTranslationInfo

- (FTMutableSiriPayloadTranslationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableSiriPayloadTranslationInfo;
  v2 = [(FTMutableSiriPayloadTranslationInfo *)&v6 init];
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

- (NSString)pre_itn_payload
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn_payload"];
}

- (void)setPre_itn_payload:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)post_itn_payload
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"post_itn_payload"];
}

- (void)setPost_itn_payload:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTRecognitionSausage)pre_sausage_payload
{
  return (FTRecognitionSausage *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_sausage_payload"];
}

- (void)setPre_sausage_payload:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end