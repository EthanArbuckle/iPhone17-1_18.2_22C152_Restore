@interface APPBNativeMediaCreativeMetadata
+ (id)options;
- (BOOL)hasBackgroundImage;
- (BOOL)hasEndCard;
- (BOOL)hasHeight;
- (BOOL)hasVideoFileURL;
- (BOOL)hasWidth;
- (BOOL)hasXPosition;
- (BOOL)hasYPosition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)backgroundImage;
- (NSString)endCard;
- (NSString)videoFileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)height;
- (int)width;
- (int)xPosition;
- (int)yPosition;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setEndCard:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHasXPosition:(BOOL)a3;
- (void)setHasYPosition:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setVideoFileURL:(id)a3;
- (void)setWidth:(int)a3;
- (void)setXPosition:(int)a3;
- (void)setYPosition:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBNativeMediaCreativeMetadata

+ (id)options
{
  if (qword_100289A60 != -1) {
    dispatch_once(&qword_100289A60, &stru_100235DE8);
  }
  v2 = (void *)qword_100289A58;

  return v2;
}

- (BOOL)hasVideoFileURL
{
  return self->_videoFileURL != 0;
}

- (void)setWidth:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHeight:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setXPosition:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_xPosition = a3;
}

- (void)setHasXPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasXPosition
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setYPosition:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_yPosition = a3;
}

- (void)setHasYPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasYPosition
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasBackgroundImage
{
  return self->_backgroundImage != 0;
}

- (BOOL)hasEndCard
{
  return self->_endCard != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBNativeMediaCreativeMetadata;
  char v3 = [(APPBNativeMediaCreativeMetadata *)&v7 description];
  v4 = [(APPBNativeMediaCreativeMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  videoFileURL = self->_videoFileURL;
  if (videoFileURL) {
    [v3 setObject:videoFileURL forKey:@"videoFileURL"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = +[NSNumber numberWithInt:self->_width];
    [v4 setObject:v11 forKey:@"width"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v12 = +[NSNumber numberWithInt:self->_height];
  [v4 setObject:v12 forKey:@"height"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  v13 = +[NSNumber numberWithInt:self->_xPosition];
  [v4 setObject:v13 forKey:@"xPosition"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    objc_super v7 = +[NSNumber numberWithInt:self->_yPosition];
    [v4 setObject:v7 forKey:@"yPosition"];
  }
LABEL_8:
  backgroundImage = self->_backgroundImage;
  if (backgroundImage) {
    [v4 setObject:backgroundImage forKey:@"backgroundImage"];
  }
  endCard = self->_endCard;
  if (endCard) {
    [v4 setObject:endCard forKey:@"endCard"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBNativeMediaCreativeMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_videoFileURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_backgroundImage)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_endCard)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_videoFileURL)
  {
    [v4 setVideoFileURL:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_width;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_height;
  *((unsigned char *)v4 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  *((_DWORD *)v4 + 11) = self->_xPosition;
  *((unsigned char *)v4 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 12) = self->_yPosition;
    *((unsigned char *)v4 + 52) |= 8u;
  }
LABEL_8:
  if (self->_backgroundImage)
  {
    [v6 setBackgroundImage:];
    id v4 = v6;
  }
  if (self->_endCard)
  {
    [v6 setEndCard:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_videoFileURL copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_width;
    *((unsigned char *)v5 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_DWORD *)v5 + 11) = self->_xPosition;
      *((unsigned char *)v5 + 52) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_height;
  *((unsigned char *)v5 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 12) = self->_yPosition;
    *((unsigned char *)v5 + 52) |= 8u;
  }
LABEL_6:
  id v9 = [(NSString *)self->_backgroundImage copyWithZone:a3];
  v10 = (void *)v5[1];
  v5[1] = v9;

  id v11 = [(NSString *)self->_endCard copyWithZone:a3];
  v12 = (void *)v5[2];
  v5[2] = v11;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  videoFileURL = self->_videoFileURL;
  if ((unint64_t)videoFileURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](videoFileURL, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_width != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_28:
    unsigned __int8 v8 = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_height != *((_DWORD *)v4 + 6)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_xPosition != *((_DWORD *)v4 + 11)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_yPosition != *((_DWORD *)v4 + 12)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_28;
  }
  backgroundImage = self->_backgroundImage;
  if ((unint64_t)backgroundImage | *((void *)v4 + 1)
    && !-[NSString isEqual:](backgroundImage, "isEqual:"))
  {
    goto LABEL_28;
  }
  endCard = self->_endCard;
  if ((unint64_t)endCard | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[NSString isEqual:](endCard, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_videoFileURL hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_width;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_height;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_xPosition;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_yPosition;
LABEL_10:
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_backgroundImage hash];
  return v8 ^ [(NSString *)self->_endCard hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[APPBNativeMediaCreativeMetadata setVideoFileURL:](self, "setVideoFileURL:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_width = v4[10];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((v4[13] & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_height = v4[6];
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  self->_xPosition = v4[11];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[13] & 8) != 0)
  {
LABEL_7:
    self->_yPosition = v4[12];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
  if (*((void *)v4 + 1))
  {
    -[APPBNativeMediaCreativeMetadata setBackgroundImage:](self, "setBackgroundImage:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[APPBNativeMediaCreativeMetadata setEndCard:](self, "setEndCard:");
    uint64_t v4 = v6;
  }
}

- (NSString)videoFileURL
{
  return self->_videoFileURL;
}

- (void)setVideoFileURL:(id)a3
{
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)xPosition
{
  return self->_xPosition;
}

- (int)yPosition
{
  return self->_yPosition;
}

- (NSString)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (NSString)endCard
{
  return self->_endCard;
}

- (void)setEndCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_storeStrong((id *)&self->_endCard, 0);

  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end