@interface QSSMutableRecognitionChoice
- (NSArray)alternative_index;
- (QSSMutableRecognitionChoice)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)confidence;
- (void)setAlternative_index:(id)a3;
- (void)setConfidence:(int)a3;
@end

@implementation QSSMutableRecognitionChoice

- (void)setConfidence:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)confidence
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"confidence"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setAlternative_index:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)alternative_index
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"alternative_index"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableRecognitionChoice)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionChoice;
  v2 = [(QSSMutableRecognitionChoice *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end