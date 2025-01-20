@interface FTMutableWord
- (FTMutableWord)init;
- (NSData)pronunciations;
- (NSString)orthography;
- (NSString)tag;
- (id)copyWithZone:(_NSZone *)a3;
- (int)frequency;
- (void)pronunciations:(id)a3;
- (void)setFrequency:(int)a3;
- (void)setOrthography:(id)a3;
- (void)setPronunciations:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation FTMutableWord

- (FTMutableWord)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableWord;
  v2 = [(FTMutableWord *)&v6 init];
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

- (NSString)orthography
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"orthography"];
}

- (void)setOrthography:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)pronunciations
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pronunciations"];
}

- (void)setPronunciations:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (void)pronunciations:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(FTMutableWord *)self pronunciations];
  uint64_t v5 = [v4 bytes];
  objc_super v6 = [(FTMutableWord *)self pronunciations];
  v7[2](v7, v5, [v6 length]);
}

- (int)frequency
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"frequency"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setFrequency:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)tag
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"tag"];
}

- (void)setTag:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end