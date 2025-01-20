@interface MXAudioMetadata
- (BOOL)enableServerEndpoint;
- (BOOL)hasAudioSource;
- (BOOL)hasClientModelVersion;
- (BOOL)hasCodec;
- (BOOL)hasEnableServerEndpoint;
- (BOOL)hasIsFarField;
- (BOOL)hasVoiceTriggerInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFarField;
- (BOOL)readFrom:(id)a3;
- (MXVoiceTriggerInfo)voiceTriggerInfo;
- (NSString)clientModelVersion;
- (id)audioSourceAsString:(int)a3;
- (id)codecAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAudioSource:(id)a3;
- (int)StringAsCodec:(id)a3;
- (int)audioSource;
- (int)codec;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioSource:(int)a3;
- (void)setClientModelVersion:(id)a3;
- (void)setCodec:(int)a3;
- (void)setEnableServerEndpoint:(BOOL)a3;
- (void)setHasAudioSource:(BOOL)a3;
- (void)setHasCodec:(BOOL)a3;
- (void)setHasEnableServerEndpoint:(BOOL)a3;
- (void)setHasIsFarField:(BOOL)a3;
- (void)setIsFarField:(BOOL)a3;
- (void)setVoiceTriggerInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXAudioMetadata

- (int)codec
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_codec;
  }
  else {
    return 0;
  }
}

- (void)setCodec:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_codec = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCodec
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)codecAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420C88[a3];
  }

  return v3;
}

- (int)StringAsCodec:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CODEC_UNDEF"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SPXWB"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPXNB"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PCM_8K"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PCM_16K"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OPUS_8K"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OPUS_16K"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ULAW_8K"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)audioSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_audioSource;
  }
  else {
    return 0;
  }
}

- (void)setAudioSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_audioSource = a3;
}

- (void)setHasAudioSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)audioSourceAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_265420CC8[a3];
  }

  return v3;
}

- (int)StringAsAudioSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BuiltInMic"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LineIn"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WiredHeadsetMic"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BluetoothHandsFreeDeviceSource"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UsbAudioSource"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CarAudioSource"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BluetoothDoAPDevice"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CarJarvisDevice"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsFarField:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isFarField = a3;
}

- (void)setHasIsFarField:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFarField
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasVoiceTriggerInfo
{
  return self->_voiceTriggerInfo != 0;
}

- (void)setEnableServerEndpoint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_enableServerEndpoint = a3;
}

- (void)setHasEnableServerEndpoint:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnableServerEndpoint
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasClientModelVersion
{
  return self->_clientModelVersion != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXAudioMetadata;
  int v4 = [(MXAudioMetadata *)&v8 description];
  v5 = [(MXAudioMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t codec = self->_codec;
    if (codec >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_codec);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_265420C88[codec];
    }
    [v3 setObject:v6 forKey:@"codec"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t audioSource = self->_audioSource;
    if (audioSource >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_audioSource);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_265420CC8[audioSource];
    }
    [v3 setObject:v8 forKey:@"audio_source"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isFarField];
    [v3 setObject:v9 forKey:@"is_far_field"];
  }
  voiceTriggerInfo = self->_voiceTriggerInfo;
  if (voiceTriggerInfo)
  {
    v11 = [(MXVoiceTriggerInfo *)voiceTriggerInfo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"voice_trigger_info"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_enableServerEndpoint];
    [v3 setObject:v12 forKey:@"enable_server_endpoint"];
  }
  clientModelVersion = self->_clientModelVersion;
  if (clientModelVersion) {
    [v3 setObject:clientModelVersion forKey:@"client_model_version"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXAudioMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_voiceTriggerInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_clientModelVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_codec;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_audioSource;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 41) = self->_isFarField;
    *((unsigned char *)v4 + 44) |= 8u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_voiceTriggerInfo)
  {
    objc_msgSend(v4, "setVoiceTriggerInfo:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_enableServerEndpoint;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  if (self->_clientModelVersion)
  {
    objc_msgSend(v6, "setClientModelVersion:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_codec;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_audioSource;
  *(unsigned char *)(v5 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 41) = self->_isFarField;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
LABEL_5:
  id v8 = [(MXVoiceTriggerInfo *)self->_voiceTriggerInfo copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_enableServerEndpoint;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_clientModelVersion copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_codec != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_audioSource != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_isFarField)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_27;
  }
  voiceTriggerInfo = self->_voiceTriggerInfo;
  if ((unint64_t)voiceTriggerInfo | *((void *)v4 + 4))
  {
    if (!-[MXVoiceTriggerInfo isEqual:](voiceTriggerInfo, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0) {
      goto LABEL_33;
    }
LABEL_27:
    char v7 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 44) & 4) == 0) {
    goto LABEL_27;
  }
  if (!self->_enableServerEndpoint)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  if (!*((unsigned char *)v4 + 40)) {
    goto LABEL_27;
  }
LABEL_33:
  clientModelVersion = self->_clientModelVersion;
  if ((unint64_t)clientModelVersion | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](clientModelVersion, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_codec;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_audioSource;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_isFarField;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = [(MXVoiceTriggerInfo *)self->_voiceTriggerInfo hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_enableServerEndpoint;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ [(NSString *)self->_clientModelVersion hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t codec = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 44);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t audioSource = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
LABEL_4:
    self->_isFarField = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_5:
  voiceTriggerInfo = self->_voiceTriggerInfo;
  uint64_t v8 = *((void *)v5 + 4);
  id v9 = v5;
  if (voiceTriggerInfo)
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[MXVoiceTriggerInfo mergeFrom:](voiceTriggerInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[MXAudioMetadata setVoiceTriggerInfo:](self, "setVoiceTriggerInfo:");
  }
  id v5 = v9;
LABEL_14:
  if ((*((unsigned char *)v5 + 44) & 4) != 0)
  {
    self->_enableServerEndpoint = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 2)) {
    -[MXAudioMetadata setClientModelVersion:](self, "setClientModelVersion:");
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)isFarField
{
  return self->_isFarField;
}

- (MXVoiceTriggerInfo)voiceTriggerInfo
{
  return self->_voiceTriggerInfo;
}

- (void)setVoiceTriggerInfo:(id)a3
{
}

- (BOOL)enableServerEndpoint
{
  return self->_enableServerEndpoint;
}

- (NSString)clientModelVersion
{
  return self->_clientModelVersion;
}

- (void)setClientModelVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerInfo, 0);

  objc_storeStrong((id *)&self->_clientModelVersion, 0);
}

@end