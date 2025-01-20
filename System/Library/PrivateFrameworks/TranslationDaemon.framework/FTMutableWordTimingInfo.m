@interface FTMutableWordTimingInfo
- (FTMutableWordTimingInfo)init;
- (NSString)word;
- (float)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)length;
- (unsigned)offset;
- (unsigned)sample_idx;
- (void)setLength:(unsigned int)a3;
- (void)setOffset:(unsigned int)a3;
- (void)setSample_idx:(unsigned int)a3;
- (void)setTimestamp:(float)a3;
- (void)setWord:(id)a3;
@end

@implementation FTMutableWordTimingInfo

- (FTMutableWordTimingInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableWordTimingInfo;
  v2 = [(FTMutableWordTimingInfo *)&v6 init];
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

- (NSString)word
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"word"];
}

- (void)setWord:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)sample_idx
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sample_idx"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setSample_idx:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)offset
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"offset"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setOffset:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)length
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"length"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setLength:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)timestamp
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"timestamp"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setTimestamp:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end