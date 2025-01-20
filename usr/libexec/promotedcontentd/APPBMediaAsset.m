@interface APPBMediaAsset
- (BOOL)hasApiFramework;
- (BOOL)hasBitrate;
- (BOOL)hasCodec;
- (BOOL)hasDeliveryProtocol;
- (BOOL)hasHeight;
- (BOOL)hasIdentifier;
- (BOOL)hasMIMEType;
- (BOOL)hasMaintainAspectRatio;
- (BOOL)hasMaxBitrate;
- (BOOL)hasMinBitrate;
- (BOOL)hasScalable;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)maintainAspectRatio;
- (BOOL)readFrom:(id)a3;
- (BOOL)scalable;
- (NSString)apiFramework;
- (NSString)identifier;
- (NSString)mediaURL;
- (double)bitrate;
- (double)maxBitrate;
- (double)minBitrate;
- (id)codecAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deliveryProtocolAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mIMETypeAsString:(int)a3;
- (int)StringAsCodec:(id)a3;
- (int)StringAsDeliveryProtocol:(id)a3;
- (int)StringAsMIMEType:(id)a3;
- (int)codec;
- (int)deliveryProtocol;
- (int)height;
- (int)mIMEType;
- (int)width;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApiFramework:(id)a3;
- (void)setBitrate:(double)a3;
- (void)setCodec:(int)a3;
- (void)setDeliveryProtocol:(int)a3;
- (void)setHasBitrate:(BOOL)a3;
- (void)setHasCodec:(BOOL)a3;
- (void)setHasDeliveryProtocol:(BOOL)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasMIMEType:(BOOL)a3;
- (void)setHasMaintainAspectRatio:(BOOL)a3;
- (void)setHasMaxBitrate:(BOOL)a3;
- (void)setHasMinBitrate:(BOOL)a3;
- (void)setHasScalable:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setMIMEType:(int)a3;
- (void)setMaintainAspectRatio:(BOOL)a3;
- (void)setMaxBitrate:(double)a3;
- (void)setMediaURL:(id)a3;
- (void)setMinBitrate:(double)a3;
- (void)setScalable:(BOOL)a3;
- (void)setWidth:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBMediaAsset

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)deliveryProtocol
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_deliveryProtocol;
  }
  else {
    return 1;
  }
}

- (void)setDeliveryProtocol:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_deliveryProtocol = a3;
}

- (void)setHasDeliveryProtocol:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDeliveryProtocol
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)deliveryProtocolAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"progressive";
  }
  else if (a3 == 2)
  {
    v4 = @"streaming";
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsDeliveryProtocol:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"progressive"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"streaming"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (int)mIMEType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_mIMEType;
  }
  else {
    return 1;
  }
}

- (void)setMIMEType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mIMEType = a3;
}

- (void)setHasMIMEType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMIMEType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)mIMETypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235270 + a3 - 1);
  }

  return v3;
}

- (int)StringAsMIMEType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"mov"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"mp4"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"m4v"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"threeGP"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)codec
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_codec;
  }
  else {
    return 1;
  }
}

- (void)setCodec:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_codec = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCodec
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)codecAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235290 + a3 - 1);
  }

  return v3;
}

- (int)StringAsCodec:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"H264"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MPEG4"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AACLC"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setWidth:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWidth
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHeight:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHeight
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBitrate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitrate = a3;
}

- (void)setHasBitrate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitrate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMinBitrate:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_minBitrate = a3;
}

- (void)setHasMinBitrate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMinBitrate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxBitrate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_maxBitrate = a3;
}

- (void)setHasMaxBitrate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMaxBitrate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScalable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scalable = a3;
}

- (void)setHasScalable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScalable
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMaintainAspectRatio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_maintainAspectRatio = a3;
}

- (void)setHasMaintainAspectRatio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMaintainAspectRatio
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasApiFramework
{
  return self->_apiFramework != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBMediaAsset;
  __int16 v3 = [(APPBMediaAsset *)&v7 description];
  int v4 = [(APPBMediaAsset *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  mediaURL = self->_mediaURL;
  if (mediaURL) {
    [v3 setObject:mediaURL forKey:@"mediaURL"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    int deliveryProtocol = self->_deliveryProtocol;
    if (deliveryProtocol == 1)
    {
      v9 = @"progressive";
    }
    else if (deliveryProtocol == 2)
    {
      v9 = @"streaming";
    }
    else
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deliveryProtocol];
    }
    [v4 setObject:v9 forKey:@"deliveryProtocol"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  int v10 = self->_mIMEType - 1;
  if (v10 >= 4)
  {
    v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mIMEType];
  }
  else
  {
    v11 = *(&off_100235270 + v10);
  }
  [v4 setObject:v11 forKey:@"MIMEType"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
LABEL_19:
    int v12 = self->_codec - 1;
    if (v12 >= 3)
    {
      v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_codec];
    }
    else
    {
      v13 = *(&off_100235290 + v12);
    }
    [v4 setObject:v13 forKey:@"codec"];

    __int16 has = (__int16)self->_has;
  }
LABEL_23:
  if ((has & 0x80) != 0)
  {
    v17 = +[NSNumber numberWithInt:self->_width];
    [v4 setObject:v17 forKey:@"width"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_25:
      if ((has & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_38;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_25;
  }
  v18 = +[NSNumber numberWithInt:self->_height];
  [v4 setObject:v18 forKey:@"height"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_26:
    if ((has & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  v19 = +[NSNumber numberWithDouble:self->_bitrate];
  [v4 setObject:v19 forKey:@"bitrate"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_27:
    if ((has & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_39:
  v20 = +[NSNumber numberWithDouble:self->_minBitrate];
  [v4 setObject:v20 forKey:@"minBitrate"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_28:
    if ((has & 0x200) == 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  v21 = +[NSNumber numberWithDouble:self->_maxBitrate];
  [v4 setObject:v21 forKey:@"maxBitrate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_29:
    if ((has & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_41:
  v22 = +[NSNumber numberWithBool:self->_scalable];
  [v4 setObject:v22 forKey:@"scalable"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_30:
    v14 = +[NSNumber numberWithBool:self->_maintainAspectRatio];
    [v4 setObject:v14 forKey:@"maintainAspectRatio"];
  }
LABEL_31:
  apiFramework = self->_apiFramework;
  if (apiFramework) {
    [v4 setObject:apiFramework forKey:@"apiFramework"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMediaAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_mediaURL) {
    sub_10019A5D4();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  v6 = v7;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  v6 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  v6 = v7;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
LABEL_16:
  if (self->_apiFramework)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [v6 setMediaURL:self->_mediaURL];
  if (self->_identifier) {
    [v6 setIdentifier:];
  }
  __int16 has = (__int16)self->_has;
  v5 = v6;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_deliveryProtocol;
    *((_WORD *)v6 + 44) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 16) = self->_mIMEType;
  *((_WORD *)v6 + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v6 + 10) = self->_codec;
  *((_WORD *)v6 + 44) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v6 + 20) = self->_width;
  *((_WORD *)v6 + 44) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v6 + 12) = self->_height;
  *((_WORD *)v6 + 44) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)v6 + 1) = *(void *)&self->_bitrate;
  *((_WORD *)v6 + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)v6 + 3) = *(void *)&self->_minBitrate;
  *((_WORD *)v6 + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)v6 + 2) = *(void *)&self->_maxBitrate;
  *((_WORD *)v6 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((unsigned char *)v6 + 85) = self->_scalable;
  *((_WORD *)v6 + 44) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    *((unsigned char *)v6 + 84) = self->_maintainAspectRatio;
    *((_WORD *)v6 + 44) |= 0x100u;
  }
LABEL_14:
  if (self->_apiFramework)
  {
    [v6 setApiFramework:];
    v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_mediaURL copyWithZone:a3];
  id v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_deliveryProtocol;
    *((_WORD *)v5 + 44) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 16) = self->_mIMEType;
  *((_WORD *)v5 + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 10) = self->_codec;
  *((_WORD *)v5 + 44) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 20) = self->_width;
  *((_WORD *)v5 + 44) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 12) = self->_height;
  *((_WORD *)v5 + 44) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v5[1] = *(void *)&self->_bitrate;
  *((_WORD *)v5 + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  v5[3] = *(void *)&self->_minBitrate;
  *((_WORD *)v5 + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    *((unsigned char *)v5 + 85) = self->_scalable;
    *((_WORD *)v5 + 44) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  v5[2] = *(void *)&self->_maxBitrate;
  *((_WORD *)v5 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x100) != 0)
  {
LABEL_11:
    *((unsigned char *)v5 + 84) = self->_maintainAspectRatio;
    *((_WORD *)v5 + 44) |= 0x100u;
  }
LABEL_12:
  id v11 = [(NSString *)self->_apiFramework copyWithZone:a3];
  int v12 = (void *)v5[4];
  v5[4] = v11;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  mediaURL = self->_mediaURL;
  if ((unint64_t)mediaURL | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](mediaURL, "isEqual:")) {
      goto LABEL_58;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_58;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 44);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_deliveryProtocol != *((_DWORD *)v4 + 11)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_mIMEType != *((_DWORD *)v4 + 16)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_codec != *((_DWORD *)v4 + 10)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_width != *((_DWORD *)v4 + 20)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_height != *((_DWORD *)v4 + 12)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_bitrate != *((double *)v4 + 1)) {
      goto LABEL_58;
    }
  }
  else if (v8)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_minBitrate != *((double *)v4 + 3)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_maxBitrate != *((double *)v4 + 2)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) == 0) {
      goto LABEL_58;
    }
    if (self->_scalable)
    {
      if (!*((unsigned char *)v4 + 85)) {
        goto LABEL_58;
      }
    }
    else if (*((unsigned char *)v4 + 85))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0) {
      goto LABEL_64;
    }
LABEL_58:
    unsigned __int8 v9 = 0;
    goto LABEL_59;
  }
  if ((*((_WORD *)v4 + 44) & 0x100) == 0) {
    goto LABEL_58;
  }
  if (!self->_maintainAspectRatio)
  {
    if (!*((unsigned char *)v4 + 84)) {
      goto LABEL_64;
    }
    goto LABEL_58;
  }
  if (!*((unsigned char *)v4 + 84)) {
    goto LABEL_58;
  }
LABEL_64:
  apiFramework = self->_apiFramework;
  if ((unint64_t)apiFramework | *((void *)v4 + 4)) {
    unsigned __int8 v9 = -[NSString isEqual:](apiFramework, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_59:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v29 = [(NSString *)self->_mediaURL hash];
  NSUInteger v28 = [(NSString *)self->_identifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_deliveryProtocol;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_mIMEType;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_codec;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_width;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v8 = 0;
    if (has) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_height;
  if ((has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double bitrate = self->_bitrate;
  double v10 = -bitrate;
  if (bitrate >= 0.0) {
    double v10 = self->_bitrate;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 4) != 0)
  {
    double minBitrate = self->_minBitrate;
    double v16 = -minBitrate;
    if (minBitrate >= 0.0) {
      double v16 = self->_minBitrate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    double maxBitrate = self->_maxBitrate;
    double v21 = -maxBitrate;
    if (maxBitrate >= 0.0) {
      double v21 = self->_maxBitrate;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x200) != 0)
  {
    uint64_t v24 = 2654435761 * self->_scalable;
    if ((has & 0x100) != 0) {
      goto LABEL_37;
    }
LABEL_39:
    uint64_t v25 = 0;
    goto LABEL_40;
  }
  uint64_t v24 = 0;
  if ((has & 0x100) == 0) {
    goto LABEL_39;
  }
LABEL_37:
  uint64_t v25 = 2654435761 * self->_maintainAspectRatio;
LABEL_40:
  NSUInteger v26 = v28 ^ v29;
  return v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v19 ^ v24 ^ v25 ^ [(NSString *)self->_apiFramework hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 9))
  {
    -[APPBMediaAsset setMediaURL:](self, "setMediaURL:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[APPBMediaAsset setIdentifier:](self, "setIdentifier:");
    id v4 = v6;
  }
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_int deliveryProtocol = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_mIMEType = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_codec = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_width = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_height = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double bitrate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double minBitrate = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double maxBitrate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_29:
  self->_scalable = *((unsigned char *)v4 + 85);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
LABEL_15:
    self->_maintainAspectRatio = *((unsigned char *)v4 + 84);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_16:
  if (*((void *)v4 + 4))
  {
    -[APPBMediaAsset setApiFramework:](self, "setApiFramework:");
    id v4 = v6;
  }
}

- (NSString)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (double)bitrate
{
  return self->_bitrate;
}

- (double)minBitrate
{
  return self->_minBitrate;
}

- (double)maxBitrate
{
  return self->_maxBitrate;
}

- (BOOL)scalable
{
  return self->_scalable;
}

- (BOOL)maintainAspectRatio
{
  return self->_maintainAspectRatio;
}

- (NSString)apiFramework
{
  return self->_apiFramework;
}

- (void)setApiFramework:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_apiFramework, 0);
}

@end