@interface NTKTrackedPhotosContent
+ (BOOL)supportsSecureCoding;
- (NSUUID)albumUUID;
- (NSUUID)shuffleUUID;
- (NTKTrackedPhotosContent)initWithAlbumUUID:(id)a3;
- (NTKTrackedPhotosContent)initWithCoder:(id)a3;
- (NTKTrackedPhotosContent)initWithShuffleUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKTrackedPhotosContent

- (NTKTrackedPhotosContent)initWithAlbumUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTrackedPhotosContent;
  v6 = [(NTKTrackedPhotosContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_albumUUID, a3);
  }

  return v7;
}

- (NTKTrackedPhotosContent)initWithShuffleUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTrackedPhotosContent;
  v6 = [(NTKTrackedPhotosContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shuffleUUID, a3);
  }

  return v7;
}

- (NTKTrackedPhotosContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKTrackedPhotosContent;
  id v5 = [(NTKTrackedPhotosContent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"albumUUID"];
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"shuffleUUID"];
    shuffleUUID = v5->_shuffleUUID;
    v5->_shuffleUUID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  albumUUID = self->_albumUUID;
  id v5 = a3;
  [v5 encodeObject:albumUUID forKey:@"albumUUID"];
  [v5 encodeObject:self->_shuffleUUID forKey:@"shuffleUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)albumUUID
{
  return self->_albumUUID;
}

- (NSUUID)shuffleUUID
{
  return self->_shuffleUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleUUID, 0);
  objc_storeStrong((id *)&self->_albumUUID, 0);
}

@end