@interface FTMutableAudioAnalytics_AcousticFeaturesEntry
- (FTAcousticFeature)value;
- (FTMutableAudioAnalytics_AcousticFeaturesEntry)init;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation FTMutableAudioAnalytics_AcousticFeaturesEntry

- (FTMutableAudioAnalytics_AcousticFeaturesEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableAudioAnalytics_AcousticFeaturesEntry;
  v2 = [(FTMutableAudioAnalytics_AcousticFeaturesEntry *)&v6 init];
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

- (NSString)key
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"key"];
}

- (void)setKey:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTAcousticFeature)value
{
  return (FTAcousticFeature *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"value"];
}

- (void)setValue:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end