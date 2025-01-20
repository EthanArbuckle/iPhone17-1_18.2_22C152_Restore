@interface _MRMRNowPlayingAudioFormatContentInfoProtobuf
- (BOOL)eligibleForSpatialization;
- (BOOL)hasAudioFormat;
- (BOOL)hasAudioSessionID;
- (BOOL)hasBestAvailableContent;
- (BOOL)hasBundleID;
- (BOOL)hasChannelCount;
- (BOOL)hasEligibleForSpatialization;
- (BOOL)hasIntendedSpatialExperience;
- (BOOL)hasPid;
- (BOOL)hasRenderingMode;
- (BOOL)hasResolvedSpatialExperience;
- (BOOL)hasSpatialized;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)spatialized;
- (NSString)bestAvailableContent;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)intendedSpatialExperience;
- (int64_t)renderingMode;
- (int64_t)resolvedSpatialExperience;
- (unint64_t)audioFormat;
- (unint64_t)audioSessionID;
- (unint64_t)channelCount;
- (unint64_t)hash;
- (unint64_t)pid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioFormat:(unint64_t)a3;
- (void)setAudioSessionID:(unint64_t)a3;
- (void)setBestAvailableContent:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setChannelCount:(unint64_t)a3;
- (void)setEligibleForSpatialization:(BOOL)a3;
- (void)setHasAudioFormat:(BOOL)a3;
- (void)setHasAudioSessionID:(BOOL)a3;
- (void)setHasChannelCount:(BOOL)a3;
- (void)setHasEligibleForSpatialization:(BOOL)a3;
- (void)setHasIntendedSpatialExperience:(BOOL)a3;
- (void)setHasPid:(BOOL)a3;
- (void)setHasRenderingMode:(BOOL)a3;
- (void)setHasResolvedSpatialExperience:(BOOL)a3;
- (void)setHasSpatialized:(BOOL)a3;
- (void)setIntendedSpatialExperience:(int64_t)a3;
- (void)setPid:(unint64_t)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setResolvedSpatialExperience:(int64_t)a3;
- (void)setSpatialized:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRMRNowPlayingAudioFormatContentInfoProtobuf

- (BOOL)spatialized
{
  return self->_spatialized;
}

- (int64_t)resolvedSpatialExperience
{
  return self->_resolvedSpatialExperience;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (unint64_t)pid
{
  return self->_pid;
}

- (int64_t)intendedSpatialExperience
{
  return self->_intendedSpatialExperience;
}

- (BOOL)hasChannelCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasAudioSessionID
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasAudioFormat
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)eligibleForSpatialization
{
  return self->_eligibleForSpatialization;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bestAvailableContent
{
  return self->_bestAvailableContent;
}

- (unint64_t)audioSessionID
{
  return self->_audioSessionID;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithUnsignedLongLong:self->_audioSessionID];
    [v4 setObject:v12 forKey:@"audioSessionID"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  v13 = [NSNumber numberWithUnsignedLongLong:self->_audioFormat];
  [v4 setObject:v13 forKey:@"audioFormat"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithUnsignedLongLong:self->_channelCount];
    [v4 setObject:v7 forKey:@"channelCount"];
  }
LABEL_7:
  bestAvailableContent = self->_bestAvailableContent;
  if (bestAvailableContent) {
    [v4 setObject:bestAvailableContent forKey:@"bestAvailableContent"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_eligibleForSpatialization];
    [v4 setObject:v14 forKey:@"eligibleForSpatialization"];

    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x100) == 0)
    {
LABEL_11:
      if ((v9 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  v15 = [NSNumber numberWithBool:self->_spatialized];
  [v4 setObject:v15 forKey:@"spatialized"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_12:
    if ((v9 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  v16 = [NSNumber numberWithLongLong:self->_intendedSpatialExperience];
  [v4 setObject:v16 forKey:@"intendedSpatialExperience"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_13:
    if ((v9 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  v17 = [NSNumber numberWithLongLong:self->_resolvedSpatialExperience];
  [v4 setObject:v17 forKey:@"resolvedSpatialExperience"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) == 0)
  {
LABEL_14:
    if ((v9 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_26:
  v18 = [NSNumber numberWithUnsignedLongLong:self->_pid];
  [v4 setObject:v18 forKey:@"pid"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    v10 = [NSNumber numberWithLongLong:self->_renderingMode];
    [v4 setObject:v10 forKey:@"renderingMode"];
  }
LABEL_16:

  return v4;
}

- (void)setSpatialized:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_spatialized = a3;
}

- (void)setResolvedSpatialExperience:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_resolvedSpatialExperience = a3;
}

- (void)setRenderingMode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_renderingMode = a3;
}

- (void)setPid:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pid = a3;
}

- (void)setIntendedSpatialExperience:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_intendedSpatialExperience = a3;
}

- (void)setEligibleForSpatialization:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_eligibleForSpatialization = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setBestAvailableContent:(id)a3
{
}

- (void)setAudioSessionID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_audioSessionID = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRMRNowPlayingAudioFormatContentInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_bundleID)
  {
    objc_msgSend(v4, "setBundleID:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_audioSessionID;
    *((_WORD *)v4 + 42) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_audioFormat;
  *((_WORD *)v4 + 42) |= 1u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((void *)v4 + 3) = self->_channelCount;
    *((_WORD *)v4 + 42) |= 4u;
  }
LABEL_7:
  if (self->_bestAvailableContent)
  {
    objc_msgSend(v7, "setBestAvailableContent:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_eligibleForSpatialization;
    *((_WORD *)v4 + 42) |= 0x80u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 81) = self->_spatialized;
  *((_WORD *)v4 + 42) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)v4 + 4) = self->_intendedSpatialExperience;
  *((_WORD *)v4 + 42) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)v4 + 7) = self->_resolvedSpatialExperience;
  *((_WORD *)v4 + 42) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_26:
  *((void *)v4 + 5) = self->_pid;
  *((_WORD *)v4 + 42) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    *((void *)v4 + 6) = self->_renderingMode;
    *((_WORD *)v4 + 42) |= 0x20u;
  }
LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_bestAvailableContent, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
LABEL_7:
  if (self->_bestAvailableContent)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_16:
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setHasAudioSessionID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setAudioFormat:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_audioFormat = a3;
}

- (void)setHasAudioFormat:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setChannelCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_channelCount = a3;
}

- (void)setHasChannelCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBestAvailableContent
{
  return self->_bestAvailableContent != 0;
}

- (void)setHasEligibleForSpatialization:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEligibleForSpatialization
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasSpatialized:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSpatialized
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIntendedSpatialExperience:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIntendedSpatialExperience
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasResolvedSpatialExperience:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResolvedSpatialExperience
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasPid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPid
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRenderingMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRenderingMode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRMRNowPlayingAudioFormatContentInfoProtobuf;
  id v4 = [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)&v8 description];
  v5 = [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  id v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_audioSessionID;
    *(_WORD *)(v5 + 84) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_audioFormat;
  *(_WORD *)(v5 + 84) |= 1u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_channelCount;
    *(_WORD *)(v5 + 84) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_bestAvailableContent copyWithZone:a3];
  v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_eligibleForSpatialization;
    *(_WORD *)(v5 + 84) |= 0x80u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x100) == 0)
    {
LABEL_7:
      if ((v11 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 81) = self->_spatialized;
  *(_WORD *)(v5 + 84) |= 0x100u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_8:
    if ((v11 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(void *)(v5 + 32) = self->_intendedSpatialExperience;
  *(_WORD *)(v5 + 84) |= 8u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_9:
    if ((v11 & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    *(void *)(v5 + 40) = self->_pid;
    *(_WORD *)(v5 + 84) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
LABEL_19:
  *(void *)(v5 + 56) = self->_resolvedSpatialExperience;
  *(_WORD *)(v5 + 84) |= 0x40u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v11 & 0x20) != 0)
  {
LABEL_11:
    *(void *)(v5 + 48) = self->_renderingMode;
    *(_WORD *)(v5 + 84) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_58;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 42);
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_audioSessionID != *((void *)v4 + 2)) {
      goto LABEL_58;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_58;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_audioFormat != *((void *)v4 + 1)) {
      goto LABEL_58;
    }
  }
  else if (v7)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_channelCount != *((void *)v4 + 3)) {
      goto LABEL_58;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_58;
  }
  bestAvailableContent = self->_bestAvailableContent;
  if ((unint64_t)bestAvailableContent | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](bestAvailableContent, "isEqual:")) {
      goto LABEL_58;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)v4 + 42);
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_58;
    }
    if (self->_eligibleForSpatialization)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_58;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_58;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) != 0)
    {
      if (self->_spatialized)
      {
        if (!*((unsigned char *)v4 + 81)) {
          goto LABEL_58;
        }
        goto LABEL_38;
      }
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_38;
      }
    }
LABEL_58:
    BOOL v10 = 0;
    goto LABEL_59;
  }
  if ((*((_WORD *)v4 + 42) & 0x100) != 0) {
    goto LABEL_58;
  }
LABEL_38:
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_intendedSpatialExperience != *((void *)v4 + 4)) {
      goto LABEL_58;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_resolvedSpatialExperience != *((void *)v4 + 7)) {
      goto LABEL_58;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_pid != *((void *)v4 + 5)) {
      goto LABEL_58;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_renderingMode != *((void *)v4 + 6)) {
      goto LABEL_58;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v9 & 0x20) == 0;
  }
LABEL_59:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
    unint64_t v5 = 0;
    if (has) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v6 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v5 = 2654435761u * self->_audioSessionID;
  if ((has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_audioFormat;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v7 = 2654435761u * self->_channelCount;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v7 = 0;
LABEL_8:
  NSUInteger v8 = [(NSString *)self->_bestAvailableContent hash];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    uint64_t v10 = 2654435761 * self->_eligibleForSpatialization;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_10:
      uint64_t v11 = 2654435761 * self->_spatialized;
      if ((v9 & 8) != 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v11 = 0;
  if ((v9 & 8) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_intendedSpatialExperience;
    if ((v9 & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v12 = 0;
  if ((v9 & 0x40) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_resolvedSpatialExperience;
    if ((v9 & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_19:
    unint64_t v14 = 0;
    if ((v9 & 0x20) != 0) {
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_18:
  uint64_t v13 = 0;
  if ((v9 & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_pid;
  if ((v9 & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_renderingMode;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 9))
  {
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setBundleID:](self, "setBundleID:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 42);
  if ((v5 & 2) != 0)
  {
    self->_audioSessionID = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 42);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_audioFormat = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
LABEL_6:
    self->_channelCount = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((void *)v4 + 8))
  {
    -[_MRMRNowPlayingAudioFormatContentInfoProtobuf setBestAvailableContent:](self, "setBestAvailableContent:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x80) != 0)
  {
    self->_eligibleForSpatialization = *((unsigned char *)v4 + 80);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v6 = *((_WORD *)v4 + 42);
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x100) == 0)
  {
    goto LABEL_11;
  }
  self->_spatialized = *((unsigned char *)v4 + 81);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_intendedSpatialExperience = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_resolvedSpatialExperience = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_26:
  self->_pid = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 42) & 0x20) != 0)
  {
LABEL_15:
    self->_renderingMode = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_16:
}

- (unint64_t)audioFormat
{
  return self->_audioFormat;
}

- (unint64_t)channelCount
{
  return self->_channelCount;
}

@end