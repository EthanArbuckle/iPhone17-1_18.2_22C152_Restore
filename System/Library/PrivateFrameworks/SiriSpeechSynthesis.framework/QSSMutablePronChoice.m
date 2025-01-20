@interface QSSMutablePronChoice
- (NSString)pron_sequence;
- (QSSMutablePronChoice)init;
- (float)log_weight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLog_weight:(float)a3;
- (void)setPron_sequence:(id)a3;
@end

@implementation QSSMutablePronChoice

- (void)setLog_weight:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)log_weight
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"log_weight"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setPron_sequence:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)pron_sequence
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pron_sequence"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutablePronChoice)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutablePronChoice;
  v2 = [(QSSMutablePronChoice *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end