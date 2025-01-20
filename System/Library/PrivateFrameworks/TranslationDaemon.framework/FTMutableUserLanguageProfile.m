@interface FTMutableUserLanguageProfile
- (FTMutableUserLanguageProfile)init;
- (NSData)profile_blob;
- (NSString)profile_blob_version;
- (NSString)profile_checksum;
- (id)copyWithZone:(_NSZone *)a3;
- (void)profile_blob:(id)a3;
- (void)setProfile_blob:(id)a3;
- (void)setProfile_blob_version:(id)a3;
- (void)setProfile_checksum:(id)a3;
@end

@implementation FTMutableUserLanguageProfile

- (FTMutableUserLanguageProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableUserLanguageProfile;
  v2 = [(FTMutableUserLanguageProfile *)&v6 init];
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

- (NSData)profile_blob
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_blob"];
}

- (void)setProfile_blob:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (void)profile_blob:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(FTMutableUserLanguageProfile *)self profile_blob];
  uint64_t v5 = [v4 bytes];
  objc_super v6 = [(FTMutableUserLanguageProfile *)self profile_blob];
  v7[2](v7, v5, [v6 length]);
}

- (NSString)profile_blob_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_blob_version"];
}

- (void)setProfile_blob_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)profile_checksum
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_checksum"];
}

- (void)setProfile_checksum:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end