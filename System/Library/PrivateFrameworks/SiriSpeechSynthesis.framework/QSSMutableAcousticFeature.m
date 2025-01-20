@interface QSSMutableAcousticFeature
- (NSArray)acoustic_feature_per_frame;
- (QSSMutableAcousticFeature)init;
- (float)frame_duration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAcoustic_feature_per_frame:(id)a3;
- (void)setFrame_duration:(float)a3;
@end

@implementation QSSMutableAcousticFeature

- (void)setFrame_duration:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)frame_duration
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"frame_duration"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setAcoustic_feature_per_frame:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)acoustic_feature_per_frame
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"acoustic_feature_per_frame"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableAcousticFeature)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableAcousticFeature;
  v2 = [(QSSMutableAcousticFeature *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end