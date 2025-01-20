@interface FLTMutableSSUMetadata
- (FLTMutableSSUMetadata)init;
- (NSArray)user_data;
- (NSString)data_version;
- (NSString)encoder_version;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)timestamp;
- (void)setData_version:(id)a3;
- (void)setEncoder_version:(id)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)setUser_data:(id)a3;
@end

@implementation FLTMutableSSUMetadata

- (void)setEncoder_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)encoder_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"encoder_version"];
}

- (void)setUser_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)user_data
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_data"];
}

- (void)setTimestamp:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)timestamp
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"timestamp"];
  int64_t v3 = [v2 longValue];

  return v3;
}

- (void)setData_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)data_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"data_version"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTMutableSSUMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableSSUMetadata;
  v2 = [(FLTMutableSSUMetadata *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end