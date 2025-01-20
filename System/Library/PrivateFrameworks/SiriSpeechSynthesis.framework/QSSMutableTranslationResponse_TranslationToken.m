@interface QSSMutableTranslationResponse_TranslationToken
- (BOOL)add_space_after;
- (NSString)token;
- (QSSAlignment)mt_alignment;
- (QSSMutableTranslationResponse_TranslationToken)init;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAdd_space_after:(BOOL)a3;
- (void)setConfidence:(float)a3;
- (void)setMt_alignment:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation QSSMutableTranslationResponse_TranslationToken

- (void)setAdd_space_after:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)add_space_after
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"add_space_after"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setMt_alignment:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSAlignment)mt_alignment
{
  return (QSSAlignment *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"mt_alignment"];
}

- (void)setConfidence:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"confidence"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setToken:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)token
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"token"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTranslationResponse_TranslationToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTranslationResponse_TranslationToken;
  v2 = [(QSSMutableTranslationResponse_TranslationToken *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end