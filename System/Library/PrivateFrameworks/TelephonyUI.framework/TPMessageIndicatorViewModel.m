@interface TPMessageIndicatorViewModel
- (BOOL)isRead;
- (BOOL)isSensitive;
- (BOOL)isVideo;
- (CGSize)indicatorImageSize;
- (NSString)identifier;
- (NSURL)mediaURL;
- (NSURL)thumbnailURL;
- (NSUUID)messageUUID;
- (TPMessageIndicatorViewModel)init;
- (TPMessageIndicatorViewModel)initWithDuration:(double)a3 identifier:(id)a4 mediaURL:(id)a5 thumbnailURL:(id)a6 isRead:(BOOL)a7 isSensitive:(BOOL)a8 isVideo:(BOOL)a9 fromHandle:(id)a10;
- (TPMessageIndicatorViewModel)initWithIdentifier:(id)a3;
- (TUHandle)fromHandle;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)indicatorImageWithDefaultTintColor:(id)a3;
@end

@implementation TPMessageIndicatorViewModel

- (NSUUID)messageUUID
{
  if (self->_identifier) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_identifier];
  }
  else {
    v2 = 0;
  }
  return (NSUUID *)v2;
}

- (TPMessageIndicatorViewModel)initWithDuration:(double)a3 identifier:(id)a4 mediaURL:(id)a5 thumbnailURL:(id)a6 isRead:(BOOL)a7 isSensitive:(BOOL)a8 isVideo:(BOOL)a9 fromHandle:(id)a10
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  v31.receiver = self;
  v31.super_class = (Class)TPMessageIndicatorViewModel;
  v21 = [(TPMessageIndicatorViewModel *)&v31 init];
  v22 = v21;
  if (v21)
  {
    v21->_duration = a3;
    uint64_t v23 = [v17 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    mediaURL = v22->_mediaURL;
    v22->_mediaURL = (NSURL *)v25;

    uint64_t v27 = [v19 copy];
    thumbnailURL = v22->_thumbnailURL;
    v22->_thumbnailURL = (NSURL *)v27;

    v22->_isRead = a7;
    v22->_isSensitive = a8;
    v22->_isVideo = a9;
    objc_storeStrong((id *)&v22->_fromHandle, a10);
    v29 = v22;
  }

  return v22;
}

- (TPMessageIndicatorViewModel)initWithIdentifier:(id)a3
{
  return [(TPMessageIndicatorViewModel *)self initWithDuration:a3 identifier:0 mediaURL:0 thumbnailURL:0 isRead:0 isSensitive:0 isVideo:0.0 fromHandle:0];
}

- (TPMessageIndicatorViewModel)init
{
  return [(TPMessageIndicatorViewModel *)self initWithDuration:0 identifier:0 mediaURL:0 thumbnailURL:0 isRead:0 isSensitive:0 isVideo:0.0 fromHandle:0];
}

- (id)indicatorImageWithDefaultTintColor:(id)a3
{
  id v4 = a3;
  if (![(TPMessageIndicatorViewModel *)self isSensitive])
  {
    if (![(TPMessageIndicatorViewModel *)self isRead])
    {
      v6 = UIImageGetUnreadIndicator();
      v5 = v6;
      goto LABEL_8;
    }
    v5 = [MEMORY[0x1E4FB1818] videoMessageRecordGlyphImage];
LABEL_6:
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    v8 = [v5 imageWithTintColor:v7];

    goto LABEL_9;
  }
  v5 = [MEMORY[0x1E4FB1818] videoMessageSensitiveGlyphImage];
  if ([(TPMessageIndicatorViewModel *)self isRead]) {
    goto LABEL_6;
  }
  v6 = v5;
LABEL_8:
  v8 = [v6 imageWithTintColor:v4];
LABEL_9:

  return v8;
}

- (CGSize)indicatorImageSize
{
  if ([(TPMessageIndicatorViewModel *)self isRead]
    || (v3 = [(TPMessageIndicatorViewModel *)self isSensitive], double v4 = 11.0, v5 = 11.0, v3))
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)description
{
  BOOL v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p - duration: %f, identifier: %@, mediaURL: %@, thumbnailURL: %@, isRead: %d, isSensitive: %d, idVideo: %d>", v5, self, *(void *)&self->_duration, self->_identifier, self->_mediaURL, self->_thumbnailURL, self->_isRead, self->_isSensitive, self->_isVideo];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDuration:identifier:mediaURL:thumbnailURL:isRead:isSensitive:isVideo:fromHandle:", self->_identifier, self->_mediaURL, self->_thumbnailURL, self->_isRead, self->_isSensitive, self->_isVideo, self->_duration, self->_fromHandle);
}

- (double)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (TUHandle)fromHandle
{
  return self->_fromHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end