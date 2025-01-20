@interface QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry
- (NSString)key;
- (QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry)init;
- (float)value;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setKey:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry

- (void)setValue:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)value
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"value"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setKey:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)key
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"key"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry;
  v2 = [(QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end