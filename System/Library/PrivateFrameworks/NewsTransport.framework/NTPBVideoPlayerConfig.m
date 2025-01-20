@interface NTPBVideoPlayerConfig
- (BOOL)hasDiscoverMoreVideosSubtitle;
- (BOOL)hasDiscoverMoreVideosTitle;
- (BOOL)hasDiscoverMoreVideosUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)discoverMoreVideosSubtitle;
- (NSString)discoverMoreVideosTitle;
- (NSString)discoverMoreVideosUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDiscoverMoreVideosSubtitle:(id)a3;
- (void)setDiscoverMoreVideosTitle:(id)a3;
- (void)setDiscoverMoreVideosUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBVideoPlayerConfig

- (BOOL)hasDiscoverMoreVideosTitle
{
  return self->_discoverMoreVideosTitle != 0;
}

- (BOOL)hasDiscoverMoreVideosSubtitle
{
  return self->_discoverMoreVideosSubtitle != 0;
}

- (BOOL)hasDiscoverMoreVideosUrl
{
  return self->_discoverMoreVideosUrl != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBVideoPlayerConfig;
  v4 = [(NTPBVideoPlayerConfig *)&v8 description];
  v5 = [(NTPBVideoPlayerConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  discoverMoreVideosTitle = self->_discoverMoreVideosTitle;
  if (discoverMoreVideosTitle) {
    [v3 setObject:discoverMoreVideosTitle forKey:@"discover_more_videos_title"];
  }
  discoverMoreVideosSubtitle = self->_discoverMoreVideosSubtitle;
  if (discoverMoreVideosSubtitle) {
    [v4 setObject:discoverMoreVideosSubtitle forKey:@"discover_more_videos_subtitle"];
  }
  discoverMoreVideosUrl = self->_discoverMoreVideosUrl;
  if (discoverMoreVideosUrl) {
    [v4 setObject:discoverMoreVideosUrl forKey:@"discover_more_videos_url"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVideoPlayerConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_discoverMoreVideosTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_discoverMoreVideosSubtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_discoverMoreVideosUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_discoverMoreVideosTitle copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_discoverMoreVideosSubtitle copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_discoverMoreVideosUrl copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((discoverMoreVideosTitle = self->_discoverMoreVideosTitle, !((unint64_t)discoverMoreVideosTitle | v4[2]))
     || -[NSString isEqual:](discoverMoreVideosTitle, "isEqual:"))
    && ((discoverMoreVideosSubtitle = self->_discoverMoreVideosSubtitle,
         !((unint64_t)discoverMoreVideosSubtitle | v4[1]))
     || -[NSString isEqual:](discoverMoreVideosSubtitle, "isEqual:")))
  {
    discoverMoreVideosUrl = self->_discoverMoreVideosUrl;
    if ((unint64_t)discoverMoreVideosUrl | v4[3]) {
      char v8 = -[NSString isEqual:](discoverMoreVideosUrl, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_discoverMoreVideosTitle hash];
  NSUInteger v4 = [(NSString *)self->_discoverMoreVideosSubtitle hash] ^ v3;
  return v4 ^ [(NSString *)self->_discoverMoreVideosUrl hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[NTPBVideoPlayerConfig setDiscoverMoreVideosTitle:](self, "setDiscoverMoreVideosTitle:");
  }
  if (v4[1]) {
    -[NTPBVideoPlayerConfig setDiscoverMoreVideosSubtitle:](self, "setDiscoverMoreVideosSubtitle:");
  }
  if (v4[3]) {
    -[NTPBVideoPlayerConfig setDiscoverMoreVideosUrl:](self, "setDiscoverMoreVideosUrl:");
  }
}

- (NSString)discoverMoreVideosTitle
{
  return self->_discoverMoreVideosTitle;
}

- (void)setDiscoverMoreVideosTitle:(id)a3
{
}

- (NSString)discoverMoreVideosSubtitle
{
  return self->_discoverMoreVideosSubtitle;
}

- (void)setDiscoverMoreVideosSubtitle:(id)a3
{
}

- (NSString)discoverMoreVideosUrl
{
  return self->_discoverMoreVideosUrl;
}

- (void)setDiscoverMoreVideosUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverMoreVideosUrl, 0);
  objc_storeStrong((id *)&self->_discoverMoreVideosTitle, 0);

  objc_storeStrong((id *)&self->_discoverMoreVideosSubtitle, 0);
}

@end