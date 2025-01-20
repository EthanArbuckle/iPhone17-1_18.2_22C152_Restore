@interface FTMutableVocToken
- (FTMutableVocToken)init;
- (NSData)blob;
- (NSString)orthography;
- (id)copyWithZone:(_NSZone *)a3;
- (void)blob:(id)a3;
- (void)setBlob:(id)a3;
- (void)setOrthography:(id)a3;
@end

@implementation FTMutableVocToken

- (FTMutableVocToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableVocToken;
  v2 = [(FTMutableVocToken *)&v6 init];
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

- (NSData)blob
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"blob"];
}

- (void)setBlob:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (void)blob:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(FTMutableVocToken *)self blob];
  uint64_t v5 = [v4 bytes];
  objc_super v6 = [(FTMutableVocToken *)self blob];
  v7[2](v7, v5, [v6 length]);
}

@end