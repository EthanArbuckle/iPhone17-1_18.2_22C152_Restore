@interface APPBVideoAsset
+ (id)options;
- (BOOL)hasVideoFileURL;
- (BOOL)hasVideoFormat;
- (BOOL)hasVideoSoundCheckData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)videoSoundCheckData;
- (NSString)videoFileURL;
- (NSString)videoFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setVideoFileURL:(id)a3;
- (void)setVideoFormat:(id)a3;
- (void)setVideoSoundCheckData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBVideoAsset

+ (id)options
{
  if (qword_1002898C0 != -1) {
    dispatch_once(&qword_1002898C0, &stru_100235560);
  }
  v2 = (void *)qword_1002898B8;

  return v2;
}

- (BOOL)hasVideoFormat
{
  return self->_videoFormat != 0;
}

- (BOOL)hasVideoFileURL
{
  return self->_videoFileURL != 0;
}

- (BOOL)hasVideoSoundCheckData
{
  return self->_videoSoundCheckData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBVideoAsset;
  v3 = [(APPBVideoAsset *)&v7 description];
  v4 = [(APPBVideoAsset *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  videoFormat = self->_videoFormat;
  if (videoFormat) {
    [v3 setObject:videoFormat forKey:@"videoFormat"];
  }
  videoFileURL = self->_videoFileURL;
  if (videoFileURL) {
    [v4 setObject:videoFileURL forKey:@"videoFileURL"];
  }
  videoSoundCheckData = self->_videoSoundCheckData;
  if (videoSoundCheckData) {
    [v4 setObject:videoSoundCheckData forKey:@"videoSoundCheckData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBVideoAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_videoFormat)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_videoFileURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_videoSoundCheckData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_videoFormat)
  {
    [v4 setVideoFormat:];
    id v4 = v5;
  }
  if (self->_videoFileURL)
  {
    [v5 setVideoFileURL:];
    id v4 = v5;
  }
  if (self->_videoSoundCheckData)
  {
    [v5 setVideoSoundCheckData:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_videoFormat copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_videoFileURL copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSData *)self->_videoSoundCheckData copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((videoFormat = self->_videoFormat, !((unint64_t)videoFormat | v4[2]))
     || -[NSString isEqual:](videoFormat, "isEqual:"))
    && ((videoFileURL = self->_videoFileURL, !((unint64_t)videoFileURL | v4[1]))
     || -[NSString isEqual:](videoFileURL, "isEqual:")))
  {
    videoSoundCheckData = self->_videoSoundCheckData;
    if ((unint64_t)videoSoundCheckData | v4[3]) {
      unsigned __int8 v8 = -[NSData isEqual:](videoSoundCheckData, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_videoFormat hash];
  unint64_t v4 = [(NSString *)self->_videoFileURL hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_videoSoundCheckData hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[APPBVideoAsset setVideoFormat:](self, "setVideoFormat:");
  }
  if (v4[1]) {
    -[APPBVideoAsset setVideoFileURL:](self, "setVideoFileURL:");
  }
  if (v4[3]) {
    -[APPBVideoAsset setVideoSoundCheckData:](self, "setVideoSoundCheckData:");
  }
}

- (NSString)videoFormat
{
  return self->_videoFormat;
}

- (void)setVideoFormat:(id)a3
{
}

- (NSString)videoFileURL
{
  return self->_videoFileURL;
}

- (void)setVideoFileURL:(id)a3
{
}

- (NSData)videoSoundCheckData
{
  return self->_videoSoundCheckData;
}

- (void)setVideoSoundCheckData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSoundCheckData, 0);
  objc_storeStrong((id *)&self->_videoFormat, 0);

  objc_storeStrong((id *)&self->_videoFileURL, 0);
}

@end