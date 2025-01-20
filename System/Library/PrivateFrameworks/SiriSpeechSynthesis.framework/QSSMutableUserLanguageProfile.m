@interface QSSMutableUserLanguageProfile
- (NSData)profile_blob;
- (NSString)profile_blob_version;
- (NSString)profile_checksum;
- (QSSMutableUserLanguageProfile)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)profile_blob:(id)a3;
- (void)setProfile_blob:(id)a3;
- (void)setProfile_blob_version:(id)a3;
- (void)setProfile_checksum:(id)a3;
@end

@implementation QSSMutableUserLanguageProfile

- (void)setProfile_checksum:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)profile_checksum
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_checksum"];
}

- (void)setProfile_blob_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)profile_blob_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_blob_version"];
}

- (void)profile_blob:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutableUserLanguageProfile *)self profile_blob];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutableUserLanguageProfile *)self profile_blob];
  v7[2](v7, v5, [v6 length]);
}

- (void)setProfile_blob:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)profile_blob
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_blob"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableUserLanguageProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableUserLanguageProfile;
  v2 = [(QSSMutableUserLanguageProfile *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end