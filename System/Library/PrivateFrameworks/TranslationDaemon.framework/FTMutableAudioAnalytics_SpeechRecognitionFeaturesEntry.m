@interface FTMutableAudioAnalytics_SpeechRecognitionFeaturesEntry
- (FTMutableAudioAnalytics_SpeechRecognitionFeaturesEntry)init;
- (NSString)key;
- (float)value;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setKey:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation FTMutableAudioAnalytics_SpeechRecognitionFeaturesEntry

- (FTMutableAudioAnalytics_SpeechRecognitionFeaturesEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableAudioAnalytics_SpeechRecognitionFeaturesEntry;
  v2 = [(FTMutableAudioAnalytics_SpeechRecognitionFeaturesEntry *)&v6 init];
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

- (float)value
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"value"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setValue:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end