@interface FTMutableLanguageDetectionPrediction
- (BOOL)is_low_confidence;
- (FTMutableLanguageDetectionPrediction)init;
- (NSString)locale;
- (float)confidence;
- (float)threshold;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConfidence:(float)a3;
- (void)setIs_low_confidence:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setThreshold:(float)a3;
@end

@implementation FTMutableLanguageDetectionPrediction

- (FTMutableLanguageDetectionPrediction)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableLanguageDetectionPrediction;
  v2 = [(FTMutableLanguageDetectionPrediction *)&v6 init];
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

- (NSString)locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"locale"];
}

- (void)setLocale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"confidence"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setConfidence:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)threshold
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"threshold"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setThreshold:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)is_low_confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"is_low_confidence"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIs_low_confidence:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end