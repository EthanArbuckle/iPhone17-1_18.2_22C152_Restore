@interface QSSMutableUserAcousticProfile
- (NSData)acoustic_profile_blob;
- (NSString)acoustic_profile_version;
- (NSString)profile_checksum;
- (QSSMutableUserAcousticProfile)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)acoustic_profile_blob:(id)a3;
- (void)setAcoustic_profile_blob:(id)a3;
- (void)setAcoustic_profile_version:(id)a3;
- (void)setProfile_checksum:(id)a3;
@end

@implementation QSSMutableUserAcousticProfile

- (void)setProfile_checksum:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)profile_checksum
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile_checksum"];
}

- (void)acoustic_profile_blob:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutableUserAcousticProfile *)self acoustic_profile_blob];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutableUserAcousticProfile *)self acoustic_profile_blob];
  v7[2](v7, v5, [v6 length]);
}

- (void)setAcoustic_profile_blob:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)acoustic_profile_blob
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"acoustic_profile_blob"];
}

- (void)setAcoustic_profile_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)acoustic_profile_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"acoustic_profile_version"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableUserAcousticProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableUserAcousticProfile;
  v2 = [(QSSMutableUserAcousticProfile *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end