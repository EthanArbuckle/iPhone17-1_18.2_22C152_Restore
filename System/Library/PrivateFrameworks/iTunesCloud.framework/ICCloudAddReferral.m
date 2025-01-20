@interface ICCloudAddReferral
+ (BOOL)supportsSecureCoding;
+ (id)referralWithAlbumAdamID:(int64_t)a3;
+ (id)referralWithPlaylistGlobalID:(id)a3;
- (ICCloudAddReferral)initWithCoder:(id)a3;
- (NSString)playlistGlobalID;
- (int64_t)albumAdamID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICCloudAddReferral

- (void).cxx_destruct
{
}

- (int64_t)albumAdamID
{
  return self->_albumAdamID;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (ICCloudAddReferral)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCloudAddReferral;
  v5 = [(ICCloudAddReferral *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playlistGlobalID"];
    playlistGlobalID = v5->_playlistGlobalID;
    v5->_playlistGlobalID = (NSString *)v6;

    v5->_albumAdamID = [v4 decodeInt64ForKey:@"albumAdamID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  playlistGlobalID = self->_playlistGlobalID;
  id v5 = a3;
  [v5 encodeObject:playlistGlobalID forKey:@"playlistGlobalID"];
  [v5 encodeInt64:self->_albumAdamID forKey:@"albumAdamID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)referralWithAlbumAdamID:(int64_t)a3
{
  id v4 = objc_alloc_init(ICCloudAddReferral);
  v4->_albumAdamID = a3;

  return v4;
}

+ (id)referralWithPlaylistGlobalID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ICCloudAddReferral);
  uint64_t v5 = [v3 copy];

  playlistGlobalID = v4->_playlistGlobalID;
  v4->_playlistGlobalID = (NSString *)v5;

  return v4;
}

@end