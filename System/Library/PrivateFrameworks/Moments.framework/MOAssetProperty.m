@interface MOAssetProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)favorite;
- (CLLocation)location;
- (MOAssetProperty)initWithCoder:(id)a3;
- (MOAssetProperty)initWithLocalToPhotoLibraryIdentifier:(id)a3 location:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 favorite:(BOOL)a7;
- (NSString)localToPhotoLibraryIdentifier;
- (id)description;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (void)encodeWithCoder:(id)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setLocalToPhotoLibraryIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMediaSubtypes:(unint64_t)a3;
- (void)setMediaType:(int64_t)a3;
@end

@implementation MOAssetProperty

- (MOAssetProperty)initWithLocalToPhotoLibraryIdentifier:(id)a3 location:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 favorite:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MOAssetProperty;
  v14 = [(MOAssetProperty *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    localToPhotoLibraryIdentifier = v14->_localToPhotoLibraryIdentifier;
    v14->_localToPhotoLibraryIdentifier = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    location = v14->_location;
    v14->_location = (CLLocation *)v17;

    v14->_mediaType = a5;
    v14->_mediaSubtypes = a6;
    v14->_favorite = a7;
  }

  return v14;
}

- (id)description
{
  if ([(MOAssetProperty *)self mediaType])
  {
    if ([(MOAssetProperty *)self mediaType] == 1)
    {
      v3 = @"image";
    }
    else if ([(MOAssetProperty *)self mediaType] == 2)
    {
      v3 = @"video";
    }
    else if ([(MOAssetProperty *)self mediaType] == 3)
    {
      v3 = @"audio";
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = @"unknown";
  }
  if (![(MOAssetProperty *)self mediaSubtypes])
  {
    v6 = @"SubtypeNone";
    goto LABEL_39;
  }
  v4 = objc_opt_new();
  if ([(MOAssetProperty *)self mediaSubtypes]) {
    [v4 addObject:@"PhotoPanorama"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 2) != 0) {
    [v4 addObject:@"PhotoHDR"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 4) != 0) {
    [v4 addObject:@"PhotoScreenshot"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 8) != 0) {
    [v4 addObject:@"PhotoLive"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 0x10) != 0) {
    [v4 addObject:@"PhotoDepthEffect"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 0x20) != 0) {
    [v4 addObject:@"SpatialOverCapture"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 0x10000) != 0) {
    [v4 addObject:@"VideoStreamed"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 0x20000) != 0) {
    [v4 addObject:@"VideoHighFrameRate"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 0x40000) != 0) {
    [v4 addObject:@"VideoTimelapse"];
  }
  if (([(MOAssetProperty *)self mediaSubtypes] & 0x200000) != 0) {
    [v4 addObject:@"VideoCinematic"];
  }
  if ((unint64_t)[v4 count] < 2)
  {
    if ([v4 count] != 1)
    {
      v6 = @"SubtypeUnknown";
      goto LABEL_38;
    }
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v5 = [v4 componentsJoinedByString:@"_"];
  }
  v6 = (__CFString *)v5;
LABEL_38:

LABEL_39:
  v7 = NSString;
  v8 = [(MOAssetProperty *)self localToPhotoLibraryIdentifier];
  v9 = [(MOAssetProperty *)self location];
  BOOL v10 = [(MOAssetProperty *)self favorite];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  id v12 = [v7 stringWithFormat:@"<MOAssetProperty localToPhotoLibraryIdentifier: %@, location: %@, mediaType: %@, mediaSubtypes: %@, favorite: %@>", v8, v9, v3, v6, v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localToPhotoLibraryIdentifier = self->_localToPhotoLibraryIdentifier;
  id v7 = a3;
  [v7 encodeObject:localToPhotoLibraryIdentifier forKey:@"localToPhotoLibraryIdentifier"];
  [v7 encodeObject:self->_location forKey:@"location"];
  uint64_t v5 = [NSNumber numberWithInteger:self->_mediaType];
  [v7 encodeObject:v5 forKey:@"mediaType"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_mediaSubtypes];
  [v7 encodeObject:v6 forKey:@"mediaSubtypes"];

  [v7 encodeBool:self->_favorite forKey:@"favorite"];
}

- (MOAssetProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localToPhotoLibraryIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaSubtypes"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = [v4 decodeBoolForKey:@"favorite"];
  id v12 = [(MOAssetProperty *)self initWithLocalToPhotoLibraryIdentifier:v5 location:v6 mediaType:v8 mediaSubtypes:v10 favorite:v11];

  return v12;
}

- (NSString)localToPhotoLibraryIdentifier
{
  return self->_localToPhotoLibraryIdentifier;
}

- (void)setLocalToPhotoLibraryIdentifier:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_localToPhotoLibraryIdentifier, 0);
}

@end