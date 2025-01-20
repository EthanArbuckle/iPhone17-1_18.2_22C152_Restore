@interface _MRAudioFormatProtobuf
- (BOOL)hasAudioChannelLayoutDescription;
- (BOOL)hasBitDepth;
- (BOOL)hasBitrate;
- (BOOL)hasChannelLayout;
- (BOOL)hasCodec;
- (BOOL)hasGroupID;
- (BOOL)hasMultiChannel;
- (BOOL)hasRenderingMode;
- (BOOL)hasSampleRate;
- (BOOL)hasSpatialized;
- (BOOL)hasStableVariantID;
- (BOOL)hasTier;
- (BOOL)isEqual:(id)a3;
- (BOOL)multiChannel;
- (BOOL)readFrom:(id)a3;
- (BOOL)spatialized;
- (NSString)audioChannelLayoutDescription;
- (NSString)groupID;
- (NSString)stableVariantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)renderingModeAsString:(int)a3;
- (id)tierAsString:(int)a3;
- (int)StringAsRenderingMode:(id)a3;
- (int)StringAsTier:(id)a3;
- (int)renderingMode;
- (int)tier;
- (int64_t)bitDepth;
- (int64_t)bitrate;
- (int64_t)sampleRate;
- (unint64_t)hash;
- (unsigned)channelLayout;
- (unsigned)codec;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioChannelLayoutDescription:(id)a3;
- (void)setBitDepth:(int64_t)a3;
- (void)setBitrate:(int64_t)a3;
- (void)setChannelLayout:(unsigned int)a3;
- (void)setCodec:(unsigned int)a3;
- (void)setGroupID:(id)a3;
- (void)setHasBitDepth:(BOOL)a3;
- (void)setHasBitrate:(BOOL)a3;
- (void)setHasChannelLayout:(BOOL)a3;
- (void)setHasCodec:(BOOL)a3;
- (void)setHasMultiChannel:(BOOL)a3;
- (void)setHasRenderingMode:(BOOL)a3;
- (void)setHasSampleRate:(BOOL)a3;
- (void)setHasSpatialized:(BOOL)a3;
- (void)setHasTier:(BOOL)a3;
- (void)setMultiChannel:(BOOL)a3;
- (void)setRenderingMode:(int)a3;
- (void)setSampleRate:(int64_t)a3;
- (void)setSpatialized:(BOOL)a3;
- (void)setStableVariantID:(id)a3;
- (void)setTier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAudioFormatProtobuf

- (int)tier
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_tier;
  }
  else {
    return 0;
  }
}

- (void)setTier:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tier = a3;
}

- (void)setHasTier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTier
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)tierAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D3C70[a3];
  }

  return v3;
}

- (int)StringAsTier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LowBandwidthStereo"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HighQualityStereo"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Lossless"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HighResolutionLossless"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Spatial"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setBitrate:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bitrate = a3;
}

- (void)setHasBitrate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBitrate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSampleRate:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sampleRate = a3;
}

- (void)setHasSampleRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSampleRate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBitDepth:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitDepth = a3;
}

- (void)setHasBitDepth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitDepth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCodec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_codec = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCodec
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSpatialized:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_spatialized = a3;
}

- (void)setHasSpatialized:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSpatialized
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMultiChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_multiChannel = a3;
}

- (void)setHasMultiChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMultiChannel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setChannelLayout:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_channelLayout = a3;
}

- (void)setHasChannelLayout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasChannelLayout
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasAudioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription != 0;
}

- (BOOL)hasGroupID
{
  return self->_groupID != 0;
}

- (BOOL)hasStableVariantID
{
  return self->_stableVariantID != 0;
}

- (int)renderingMode
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_renderingMode;
  }
  else {
    return 0;
  }
}

- (void)setRenderingMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_renderingMode = a3;
}

- (void)setHasRenderingMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRenderingMode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)renderingModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D3C98[a3];
  }

  return v3;
}

- (int)StringAsRenderingMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MonoStereo"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Surround"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SpatialAudio"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DolbyAudio"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DolbyAtmos"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAudioFormatProtobuf;
  int v4 = [(_MRAudioFormatProtobuf *)&v8 description];
  v5 = [(_MRAudioFormatProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t tier = self->_tier;
    if (tier >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tier);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E57D3C70[tier];
    }
    [v3 setObject:v6 forKey:@"tier"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_bitrate];
    [v3 setObject:v13 forKey:@"bitrate"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_8;
  }
  v14 = [NSNumber numberWithLongLong:self->_sampleRate];
  [v3 setObject:v14 forKey:@"sampleRate"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = [NSNumber numberWithLongLong:self->_bitDepth];
  [v3 setObject:v15 forKey:@"bitDepth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = [NSNumber numberWithUnsignedInt:self->_codec];
  [v3 setObject:v16 forKey:@"codec"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v17 = [NSNumber numberWithBool:self->_spatialized];
  [v3 setObject:v17 forKey:@"spatialized"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  v18 = [NSNumber numberWithBool:self->_multiChannel];
  [v3 setObject:v18 forKey:@"multiChannel"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    v7 = [NSNumber numberWithUnsignedInt:self->_channelLayout];
    [v3 setObject:v7 forKey:@"channelLayout"];
  }
LABEL_14:
  audioChannelLayoutDescription = self->_audioChannelLayoutDescription;
  if (audioChannelLayoutDescription) {
    [v3 setObject:audioChannelLayoutDescription forKey:@"audioChannelLayoutDescription"];
  }
  groupID = self->_groupID;
  if (groupID) {
    [v3 setObject:groupID forKey:@"groupID"];
  }
  stableVariantID = self->_stableVariantID;
  if (stableVariantID) {
    [v3 setObject:stableVariantID forKey:@"stableVariantID"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    uint64_t renderingMode = self->_renderingMode;
    if (renderingMode >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_renderingMode);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E57D3C98[renderingMode];
    }
    [v3 setObject:v12 forKey:@"renderingMode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioFormatProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_audioChannelLayoutDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupID) {
    PBDataWriterWriteStringField();
  }
  if (self->_stableVariantID) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[18] = self->_tier;
    *((_WORD *)v4 + 40) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 2) = self->_bitrate;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)v4 + 3) = self->_sampleRate;
  *((_WORD *)v4 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)v4 + 1) = self->_bitDepth;
  *((_WORD *)v4 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[11] = self->_codec;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)v4 + 77) = self->_spatialized;
  *((_WORD *)v4 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_27:
  *((unsigned char *)v4 + 76) = self->_multiChannel;
  *((_WORD *)v4 + 40) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    v4[10] = self->_channelLayout;
    *((_WORD *)v4 + 40) |= 8u;
  }
LABEL_10:
  v6 = v4;
  if (self->_audioChannelLayoutDescription)
  {
    objc_msgSend(v4, "setAudioChannelLayoutDescription:");
    int v4 = v6;
  }
  if (self->_groupID)
  {
    objc_msgSend(v6, "setGroupID:");
    int v4 = v6;
  }
  if (self->_stableVariantID)
  {
    objc_msgSend(v6, "setStableVariantID:");
    int v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v4[14] = self->_renderingMode;
    *((_WORD *)v4 + 40) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_tier;
    *(_WORD *)(v5 + 80) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_bitrate;
  *(_WORD *)(v5 + 80) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(void *)(v5 + 24) = self->_sampleRate;
  *(_WORD *)(v5 + 80) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(void *)(v5 + 8) = self->_bitDepth;
  *(_WORD *)(v5 + 80) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_codec;
  *(_WORD *)(v5 + 80) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(unsigned char *)(v5 + 77) = self->_spatialized;
  *(_WORD *)(v5 + 80) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *(unsigned char *)(v5 + 76) = self->_multiChannel;
  *(_WORD *)(v5 + 80) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 40) = self->_channelLayout;
    *(_WORD *)(v5 + 80) |= 8u;
  }
LABEL_10:
  uint64_t v8 = [(NSString *)self->_audioChannelLayoutDescription copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_groupID copyWithZone:a3];
  v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_stableVariantID copyWithZone:a3];
  v13 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v12;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_renderingMode;
    *(_WORD *)(v6 + 80) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_tier != *((_DWORD *)v4 + 18)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bitrate != *((void *)v4 + 2)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sampleRate != *((void *)v4 + 3)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_59;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_bitDepth != *((void *)v4 + 1)) {
      goto LABEL_59;
    }
  }
  else if (v6)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_codec != *((_DWORD *)v4 + 11)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0) {
      goto LABEL_59;
    }
    if (self->_spatialized)
    {
      if (!*((unsigned char *)v4 + 77)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 77))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_multiChannel)
      {
        if (!*((unsigned char *)v4 + 76)) {
          goto LABEL_59;
        }
        goto LABEL_43;
      }
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_43;
      }
    }
LABEL_59:
    BOOL v11 = 0;
    goto LABEL_60;
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_59;
  }
LABEL_43:
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_channelLayout != *((_DWORD *)v4 + 10)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_59;
  }
  audioChannelLayoutDescription = self->_audioChannelLayoutDescription;
  if ((unint64_t)audioChannelLayoutDescription | *((void *)v4 + 4)
    && !-[NSString isEqual:](audioChannelLayoutDescription, "isEqual:"))
  {
    goto LABEL_59;
  }
  groupID = self->_groupID;
  if ((unint64_t)groupID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](groupID, "isEqual:")) {
      goto LABEL_59;
    }
  }
  stableVariantID = self->_stableVariantID;
  if ((unint64_t)stableVariantID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](stableVariantID, "isEqual:")) {
      goto LABEL_59;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 40);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_renderingMode != *((_DWORD *)v4 + 14)) {
      goto LABEL_59;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x20) == 0;
  }
LABEL_60:

  return v11;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v16 = 2654435761 * self->_tier;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_bitrate;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v14 = 2654435761 * self->_sampleRate;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v14 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_bitDepth;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_codec;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_spatialized;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v7 = 0;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_multiChannel;
  if ((has & 8) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_channelLayout;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
LABEL_18:
  NSUInteger v9 = [(NSString *)self->_audioChannelLayoutDescription hash];
  NSUInteger v10 = [(NSString *)self->_groupID hash];
  NSUInteger v11 = [(NSString *)self->_stableVariantID hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v12 = 2654435761 * self->_renderingMode;
  }
  else {
    uint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) != 0)
  {
    self->_uint64_t tier = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bitrate = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_sampleRate = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_bitDepth = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_codec = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_spatialized = *((unsigned char *)v4 + 77);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_27:
  self->_multiChannel = *((unsigned char *)v4 + 76);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 40) & 8) != 0)
  {
LABEL_9:
    self->_channelLayout = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_10:
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    [(_MRAudioFormatProtobuf *)self setAudioChannelLayoutDescription:"setAudioChannelLayoutDescription:"];
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[_MRAudioFormatProtobuf setGroupID:](self, "setGroupID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[_MRAudioFormatProtobuf setStableVariantID:](self, "setStableVariantID:");
    id v4 = v6;
  }
  if ((*((_WORD *)v4 + 40) & 0x20) != 0)
  {
    self->_uint64_t renderingMode = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x20u;
  }
}

- (int64_t)bitrate
{
  return self->_bitrate;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (unsigned)codec
{
  return self->_codec;
}

- (BOOL)spatialized
{
  return self->_spatialized;
}

- (BOOL)multiChannel
{
  return self->_multiChannel;
}

- (unsigned)channelLayout
{
  return self->_channelLayout;
}

- (NSString)audioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (void)setAudioChannelLayoutDescription:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)stableVariantID
{
  return self->_stableVariantID;
}

- (void)setStableVariantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableVariantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, 0);
}

@end