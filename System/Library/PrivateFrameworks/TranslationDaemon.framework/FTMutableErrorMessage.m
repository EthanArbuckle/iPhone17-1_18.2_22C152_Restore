@interface FTMutableErrorMessage
- (FTMutableErrorMessage)init;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)error_code;
- (void)setError_code:(unsigned int)a3;
- (void)setReason:(id)a3;
@end

@implementation FTMutableErrorMessage

- (FTMutableErrorMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableErrorMessage;
  v2 = [(FTMutableErrorMessage *)&v6 init];
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

- (unsigned)error_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_code"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setError_code:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)reason
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"reason"];
}

- (void)setReason:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end