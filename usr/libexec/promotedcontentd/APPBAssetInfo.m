@interface APPBAssetInfo
- (BOOL)autoloop;
- (BOOL)hasAutoloop;
- (BOOL)hasBitrate;
- (BOOL)hasContentType;
- (BOOL)hasHeight;
- (BOOL)hasLength;
- (BOOL)hasUrl;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)url;
- (double)bitrate;
- (float)length;
- (id)contentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContentType:(id)a3;
- (int)contentType;
- (int)height;
- (int)width;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutoloop:(BOOL)a3;
- (void)setBitrate:(double)a3;
- (void)setContentType:(int)a3;
- (void)setHasAutoloop:(BOOL)a3;
- (void)setHasBitrate:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setLength:(float)a3;
- (void)setUrl:(id)a3;
- (void)setWidth:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAssetInfo

- (int)contentType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_contentType;
  }
  else {
    return 30000;
  }
}

- (void)setContentType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if ((a3 - 30000) >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100235DD0 + a3 - 30000);
  }

  return v3;
}

- (int)StringAsContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IMAGE"])
  {
    int v4 = 30000;
  }
  else if ([v3 isEqualToString:@"VIDEO"])
  {
    int v4 = 30001;
  }
  else if ([v3 isEqualToString:@"AUDIO"])
  {
    int v4 = 30002;
  }
  else
  {
    int v4 = 30000;
  }

  return v4;
}

- (void)setWidth:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHeight:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeight
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setLength:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLength
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBitrate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bitrate = a3;
}

- (void)setHasBitrate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBitrate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAutoloop:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_autoloop = a3;
}

- (void)setHasAutoloop:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAutoloop
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAssetInfo;
  char v3 = [(APPBAssetInfo *)&v7 description];
  int v4 = [(APPBAssetInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v6 = self->_contentType - 30000;
    if (v6 >= 3)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contentType];
    }
    else
    {
      objc_super v7 = *(&off_100235DD0 + v6);
    }
    [v3 setObject:v7 forKey:@"contentType"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v8 = +[NSNumber numberWithInt:self->_width];
    [v3 setObject:v8 forKey:@"width"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_height];
    [v3 setObject:v9 forKey:@"height"];
  }
  url = self->_url;
  if (url) {
    [v3 setObject:url forKey:@"url"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    *(float *)&double v4 = self->_length;
    v14 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v14 forKey:@"length"];

    char v11 = (char)self->_has;
    if ((v11 & 1) == 0)
    {
LABEL_14:
      if ((v11 & 0x20) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_14;
  }
  v15 = +[NSNumber numberWithDouble:self->_bitrate];
  [v3 setObject:v15 forKey:@"bitrate"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    v12 = +[NSNumber numberWithBool:self->_autoloop];
    [v3 setObject:v12 forKey:@"autoloop"];
  }
LABEL_16:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAssetInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char v5 = (char)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_contentType;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_width;
  *((unsigned char *)v4 + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[5] = self->_height;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_5:
  if (self->_url)
  {
    objc_super v7 = v4;
    [v4 setUrl:];
    double v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[6] = LODWORD(self->_length);
    *((unsigned char *)v4 + 48) |= 8u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 1) = *(void *)&self->_bitrate;
  *((unsigned char *)v4 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 44) = self->_autoloop;
    *((unsigned char *)v4 + 48) |= 0x20u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[4] = self->_contentType;
    *((unsigned char *)v5 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[10] = self->_width;
  *((unsigned char *)v5 + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5[5] = self->_height;
    *((unsigned char *)v5 + 48) |= 4u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_url copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  char v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    v6[1] = *(void *)&self->_bitrate;
    *((unsigned char *)v6 + 48) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v6;
    }
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 6) = LODWORD(self->_length);
  *((unsigned char *)v6 + 48) |= 8u;
  char v10 = (char)self->_has;
  if (v10) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v10 & 0x20) != 0)
  {
LABEL_8:
    *((unsigned char *)v6 + 44) = self->_autoloop;
    *((unsigned char *)v6 + 48) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_contentType != *((_DWORD *)v4 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_width != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_height != *((_DWORD *)v4 + 5)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_32;
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_length != *((float *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_32;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_bitrate != *((double *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_32;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
    {
      if (self->_autoloop)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 44))
      {
        goto LABEL_32;
      }
      BOOL v7 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v7 = 0;
  }
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_contentType;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_width;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_height;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_url hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float length = self->_length;
    float v10 = -length;
    if (length >= 0.0) {
      float v10 = self->_length;
    }
    float v11 = floorf(v10 + 0.5);
    float v12 = (float)(v10 - v11) * 1.8447e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabsf(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (has)
  {
    double bitrate = self->_bitrate;
    double v15 = -bitrate;
    if (bitrate >= 0.0) {
      double v15 = self->_bitrate;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 0x20) != 0) {
    uint64_t v18 = 2654435761 * self->_autoloop;
  }
  else {
    uint64_t v18 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v8 ^ v13 ^ v18 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_contentType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_width = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_height = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 4))
  {
    id v7 = v4;
    -[APPBAssetInfo setUrl:](self, "setUrl:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_float length = *((float *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_double bitrate = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
  {
LABEL_10:
    self->_autoloop = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_11:
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (float)length
{
  return self->_length;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (BOOL)autoloop
{
  return self->_autoloop;
}

- (void).cxx_destruct
{
}

@end