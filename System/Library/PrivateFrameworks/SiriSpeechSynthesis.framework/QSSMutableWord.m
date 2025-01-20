@interface QSSMutableWord
- (NSData)pronunciations;
- (NSString)orthography;
- (NSString)tag;
- (QSSMutableWord)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)frequency;
- (void)pronunciations:(id)a3;
- (void)setFrequency:(int)a3;
- (void)setOrthography:(id)a3;
- (void)setPronunciations:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation QSSMutableWord

- (void)setTag:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)tag
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"tag"];
}

- (void)setFrequency:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)frequency
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"frequency"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)pronunciations:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutableWord *)self pronunciations];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutableWord *)self pronunciations];
  v7[2](v7, v5, [v6 length]);
}

- (void)setPronunciations:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)pronunciations
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pronunciations"];
}

- (void)setOrthography:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)orthography
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"orthography"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableWord)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableWord;
  v2 = [(QSSMutableWord *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end