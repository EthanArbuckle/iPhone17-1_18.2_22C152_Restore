@interface QSSMutableLatnnMitigatorResult
- (BOOL)processed;
- (NSString)version;
- (QSSMutableLatnnMitigatorResult)init;
- (double)score;
- (double)threshold;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setProcessed:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setThreshold:(double)a3;
- (void)setVersion:(id)a3;
@end

@implementation QSSMutableLatnnMitigatorResult

- (void)setScore:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)score
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"score"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setThreshold:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)threshold
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"threshold"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setVersion:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"version"];
}

- (void)setProcessed:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)processed
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"processed"];
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

- (QSSMutableLatnnMitigatorResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableLatnnMitigatorResult;
  v2 = [(QSSMutableLatnnMitigatorResult *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end