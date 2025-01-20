@interface ICPlayActivityEventContainerIDs
+ (BOOL)supportsSecureCoding;
- (ICPlayActivityEventContainerIDs)initWithCoder:(id)a3;
- (NSString)cloudAlbumID;
- (NSString)globalPlaylistID;
- (NSString)playlistVersionHash;
- (NSString)stationHash;
- (NSString)stationStringID;
- (id)_copyWithClass:(Class)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)adamID;
- (int64_t)stationID;
- (unint64_t)cloudPlaylistID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICPlayActivityEventContainerIDs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_playlistVersionHash, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);

  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (NSString)playlistVersionHash
{
  return self->_playlistVersionHash;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (unint64_t)cloudPlaylistID
{
  return self->_cloudPlaylistID;
}

- (NSString)cloudAlbumID
{
  return self->_cloudAlbumID;
}

- (int64_t)adamID
{
  return self->_adamID;
}

- (id)_copyWithClass:(Class)a3
{
  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    v4[1] = self->_adamID;
    objc_storeStrong(v4 + 2, self->_cloudAlbumID);
    v5[3] = self->_cloudPlaylistID;
    objc_storeStrong(v5 + 4, self->_globalPlaylistID);
    objc_storeStrong(v5 + 5, self->_playlistVersionHash);
    objc_storeStrong(v5 + 7, self->_stationHash);
    objc_storeStrong(v5 + 8, self->_stationStringID);
    v5[6] = self->_stationID;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(ICPlayActivityEventContainerIDs *)self _copyWithClass:v4];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t adamID = self->_adamID;
  id v5 = a3;
  [v5 encodeInt64:adamID forKey:@"ICPlayActivityEventContainerIDsAdamID"];
  [v5 encodeObject:self->_cloudAlbumID forKey:@"ICPlayActivityEventContainerIDsCloudAlbumID"];
  [v5 encodeInt64:self->_cloudPlaylistID forKey:@"ICPlayActivityEventContainerIDsCloudPlaylistID"];
  [v5 encodeObject:self->_globalPlaylistID forKey:@"ICPlayActivityEventContainerIDsGlobalPlaylistID"];
  [v5 encodeObject:self->_playlistVersionHash forKey:@"ICPlayActivityEventContainerIDsPlaylistVersionHash"];
  [v5 encodeObject:self->_stationHash forKey:@"ICPlayActivityEventContainerIDsStationHash"];
  [v5 encodeObject:self->_stationStringID forKey:@"ICPlayActivityEventContainerIDsStationStringID"];
  [v5 encodeInt64:self->_stationID forKey:@"ICPlayActivityEventContainerIDsStationID"];
}

- (ICPlayActivityEventContainerIDs)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICPlayActivityEventContainerIDs *)self init];
  if (v5)
  {
    v5->_int64_t adamID = [v4 decodeInt64ForKey:@"ICPlayActivityEventContainerIDsAdamID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPlayActivityEventContainerIDsCloudAlbumID"];
    cloudAlbumID = v5->_cloudAlbumID;
    v5->_cloudAlbumID = (NSString *)v6;

    v5->_cloudPlaylistID = [v4 decodeInt64ForKey:@"ICPlayActivityEventContainerIDsCloudPlaylistID"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPlayActivityEventContainerIDsGlobalPlaylistID"];
    globalPlaylistID = v5->_globalPlaylistID;
    v5->_globalPlaylistID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPlayActivityEventContainerIDsPlaylistVersionHash"];
    playlistVersionHash = v5->_playlistVersionHash;
    v5->_playlistVersionHash = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPlayActivityEventContainerIDsStationHash"];
    stationHash = v5->_stationHash;
    v5->_stationHash = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPlayActivityEventContainerIDsStationStringID"];
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v14;

    v5->_stationID = [v4 decodeInt64ForKey:@"ICPlayActivityEventContainerIDsStationID"];
  }

  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  if (self->_adamID) {
    objc_msgSend(v6, "appendFormat:", @" adamID: %lli", self->_adamID);
  }
  if ([(NSString *)self->_cloudAlbumID length]) {
    [v6 appendFormat:@" cloudAlbumID: %@", self->_cloudAlbumID];
  }
  if (self->_cloudPlaylistID) {
    objc_msgSend(v6, "appendFormat:", @" cloudPlaylistID: %llu", self->_cloudPlaylistID);
  }
  if ([(NSString *)self->_globalPlaylistID length]) {
    [v6 appendFormat:@" globalPlaylistID: %@", self->_globalPlaylistID];
  }
  if ([(NSString *)self->_playlistVersionHash length]) {
    [v6 appendFormat:@" playlistVersionHash: %@", self->_playlistVersionHash];
  }
  if ([(NSString *)self->_stationHash length]) {
    [v6 appendFormat:@" stationHash: %@", self->_stationHash];
  }
  if ([(NSString *)self->_stationStringID length]) {
    [v6 appendFormat:@" stationStringID: %@", self->_stationStringID];
  }
  if (self->_stationID) {
    objc_msgSend(v6, "appendFormat:", @" stationID: %lli", self->_stationID);
  }
  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end