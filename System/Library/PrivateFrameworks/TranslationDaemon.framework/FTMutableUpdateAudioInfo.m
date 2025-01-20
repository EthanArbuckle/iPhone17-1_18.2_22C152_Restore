@interface FTMutableUpdateAudioInfo
- (FTMutableUpdateAudioInfo)init;
- (NSString)product_id;
- (NSString)vendor_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setProduct_id:(id)a3;
- (void)setVendor_id:(id)a3;
@end

@implementation FTMutableUpdateAudioInfo

- (FTMutableUpdateAudioInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableUpdateAudioInfo;
  v2 = [(FTMutableUpdateAudioInfo *)&v6 init];
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

- (NSString)product_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"product_id"];
}

- (void)setProduct_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)vendor_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"vendor_id"];
}

- (void)setVendor_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end