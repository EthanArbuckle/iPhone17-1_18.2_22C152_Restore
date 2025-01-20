@interface OPTTSMutableTTSRequestFeatureFlags
- (BOOL)fe_feature;
- (BOOL)fe_feature_only;
- (OPTTSMutableTTSRequestFeatureFlags)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFe_feature:(BOOL)a3;
- (void)setFe_feature_only:(BOOL)a3;
@end

@implementation OPTTSMutableTTSRequestFeatureFlags

- (void)setFe_feature_only:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)fe_feature_only
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"fe_feature_only"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setFe_feature:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)fe_feature
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"fe_feature"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableTTSRequestFeatureFlags)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTTSRequestFeatureFlags;
  v2 = [(OPTTSMutableTTSRequestFeatureFlags *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end