@interface MIPPlaybackInfo
- (BOOL)hasBeatsPerMinute;
- (BOOL)hasBitRate;
- (BOOL)hasCodecSubType;
- (BOOL)hasCodecType;
- (BOOL)hasDataKind;
- (BOOL)hasDataUrl;
- (BOOL)hasDurationInSamples;
- (BOOL)hasEqPreset;
- (BOOL)hasGaplessEncodingDrainCode;
- (BOOL)hasGaplessFrameResyncCode;
- (BOOL)hasGaplessHeuristicCode;
- (BOOL)hasGaplessHeuristicDelayCode;
- (BOOL)hasPlaybackFormat;
- (BOOL)hasProgressionDirection;
- (BOOL)hasRelativeVolume;
- (BOOL)hasSampleRate;
- (BOOL)hasStartTime;
- (BOOL)hasStopTime;
- (BOOL)hasVolumeNormalizationEnergy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)dataUrl;
- (NSString)eqPreset;
- (NSString)playbackFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)beatsPerMinute;
- (int)bitRate;
- (int)codecSubType;
- (int)codecType;
- (int)dataKind;
- (int)progressionDirection;
- (int)relativeVolume;
- (int)sampleRate;
- (int64_t)durationInSamples;
- (int64_t)gaplessEncodingDrainCode;
- (int64_t)gaplessFrameResyncCode;
- (int64_t)gaplessHeuristicCode;
- (int64_t)gaplessHeuristicDelayCode;
- (int64_t)startTime;
- (int64_t)stopTime;
- (int64_t)volumeNormalizationEnergy;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeatsPerMinute:(int)a3;
- (void)setBitRate:(int)a3;
- (void)setCodecSubType:(int)a3;
- (void)setCodecType:(int)a3;
- (void)setDataKind:(int)a3;
- (void)setDataUrl:(id)a3;
- (void)setDurationInSamples:(int64_t)a3;
- (void)setEqPreset:(id)a3;
- (void)setGaplessEncodingDrainCode:(int64_t)a3;
- (void)setGaplessFrameResyncCode:(int64_t)a3;
- (void)setGaplessHeuristicCode:(int64_t)a3;
- (void)setGaplessHeuristicDelayCode:(int64_t)a3;
- (void)setHasBeatsPerMinute:(BOOL)a3;
- (void)setHasBitRate:(BOOL)a3;
- (void)setHasCodecSubType:(BOOL)a3;
- (void)setHasCodecType:(BOOL)a3;
- (void)setHasDataKind:(BOOL)a3;
- (void)setHasDurationInSamples:(BOOL)a3;
- (void)setHasGaplessEncodingDrainCode:(BOOL)a3;
- (void)setHasGaplessFrameResyncCode:(BOOL)a3;
- (void)setHasGaplessHeuristicCode:(BOOL)a3;
- (void)setHasGaplessHeuristicDelayCode:(BOOL)a3;
- (void)setHasProgressionDirection:(BOOL)a3;
- (void)setHasRelativeVolume:(BOOL)a3;
- (void)setHasSampleRate:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasStopTime:(BOOL)a3;
- (void)setHasVolumeNormalizationEnergy:(BOOL)a3;
- (void)setPlaybackFormat:(id)a3;
- (void)setProgressionDirection:(int)a3;
- (void)setRelativeVolume:(int)a3;
- (void)setSampleRate:(int)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setStopTime:(int64_t)a3;
- (void)setVolumeNormalizationEnergy:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPPlaybackInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackFormat, 0);
  objc_storeStrong((id *)&self->_eqPreset, 0);

  objc_storeStrong((id *)&self->_dataUrl, 0);
}

- (int64_t)durationInSamples
{
  return self->_durationInSamples;
}

- (int)progressionDirection
{
  return self->_progressionDirection;
}

- (int)beatsPerMinute
{
  return self->_beatsPerMinute;
}

- (int64_t)volumeNormalizationEnergy
{
  return self->_volumeNormalizationEnergy;
}

- (int64_t)stopTime
{
  return self->_stopTime;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (int)relativeVolume
{
  return self->_relativeVolume;
}

- (int64_t)gaplessFrameResyncCode
{
  return self->_gaplessFrameResyncCode;
}

- (int64_t)gaplessEncodingDrainCode
{
  return self->_gaplessEncodingDrainCode;
}

- (int64_t)gaplessHeuristicDelayCode
{
  return self->_gaplessHeuristicDelayCode;
}

- (int64_t)gaplessHeuristicCode
{
  return self->_gaplessHeuristicCode;
}

- (void)setPlaybackFormat:(id)a3
{
}

- (NSString)playbackFormat
{
  return self->_playbackFormat;
}

- (void)setEqPreset:(id)a3
{
}

- (NSString)eqPreset
{
  return self->_eqPreset;
}

- (void)setDataUrl:(id)a3
{
}

- (NSString)dataUrl
{
  return self->_dataUrl;
}

- (int)dataKind
{
  return self->_dataKind;
}

- (int)codecSubType
{
  return self->_codecSubType;
}

- (int)codecType
{
  return self->_codecType;
}

- (int)bitRate
{
  return self->_bitRate;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 66);
  if ((v5 & 0x200) != 0)
  {
    self->_bitRate = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 66);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_codecType = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 66);
  if ((v5 & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  self->_codecSubType = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 66) & 0x1000) != 0)
  {
LABEL_5:
    self->_dataKind = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_6:
  id v7 = v4;
  if (*((void *)v4 + 12))
  {
    -[MIPPlaybackInfo setDataUrl:](self, "setDataUrl:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[MIPPlaybackInfo setEqPreset:](self, "setEqPreset:");
    id v4 = v7;
  }
  if (*((void *)v4 + 14))
  {
    -[MIPPlaybackInfo setPlaybackFormat:](self, "setPlaybackFormat:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 8) != 0)
  {
    self->_gaplessHeuristicCode = *((void *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 66);
    if ((v6 & 0x10) == 0)
    {
LABEL_14:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  self->_gaplessHeuristicDelayCode = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_gaplessEncodingDrainCode = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_gaplessFrameResyncCode = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_relativeVolume = *((_DWORD *)v4 + 31);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_sampleRate = *((_DWORD *)v4 + 32);
  *(_WORD *)&self->_has |= 0x8000u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_startTime = *((void *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_stopTime = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x80) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_volumeNormalizationEnergy = *((void *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x100) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_beatsPerMinute = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((v6 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_42:
  self->_progressionDirection = *((_DWORD *)v4 + 30);
  *(_WORD *)&self->_has |= 0x2000u;
  if (*((_WORD *)v4 + 66))
  {
LABEL_24:
    self->_durationInSamples = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_25:
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v3 = 2654435761 * self->_bitRate;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_codecType;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_codecSubType;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_dataKind;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  NSUInteger v7 = [(NSString *)self->_dataUrl hash];
  NSUInteger v8 = [(NSString *)self->_eqPreset hash];
  NSUInteger v9 = [(NSString *)self->_playbackFormat hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_gaplessHeuristicCode;
    if ((has & 0x10) != 0)
    {
LABEL_12:
      uint64_t v12 = 2654435761 * self->_gaplessHeuristicDelayCode;
      if ((has & 2) != 0) {
        goto LABEL_13;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v12 = 0;
  if ((has & 2) != 0)
  {
LABEL_13:
    uint64_t v13 = 2654435761 * self->_gaplessEncodingDrainCode;
    if ((has & 4) != 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((has & 4) != 0)
  {
LABEL_14:
    uint64_t v14 = 2654435761 * self->_gaplessFrameResyncCode;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_15:
    uint64_t v15 = 2654435761 * self->_relativeVolume;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_16:
    uint64_t v16 = 2654435761 * self->_sampleRate;
    if ((has & 0x20) != 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v16 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_17:
    uint64_t v17 = 2654435761 * self->_startTime;
    if ((has & 0x40) != 0) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v17 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_18:
    uint64_t v18 = 2654435761 * self->_stopTime;
    if ((has & 0x80) != 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v18 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_19:
    uint64_t v19 = 2654435761 * self->_volumeNormalizationEnergy;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    uint64_t v20 = 2654435761 * self->_beatsPerMinute;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_21;
    }
LABEL_33:
    uint64_t v21 = 0;
    if (has) {
      goto LABEL_22;
    }
LABEL_34:
    uint64_t v22 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_32:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_33;
  }
LABEL_21:
  uint64_t v21 = 2654435761 * self->_progressionDirection;
  if ((has & 1) == 0) {
    goto LABEL_34;
  }
LABEL_22:
  uint64_t v22 = 2654435761 * self->_durationInSamples;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0 || self->_bitRate != *((_DWORD *)v4 + 19)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x800) == 0 || self->_codecType != *((_DWORD *)v4 + 21)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x800) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x400) == 0 || self->_codecSubType != *((_DWORD *)v4 + 20)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x1000) == 0 || self->_dataKind != *((_DWORD *)v4 + 22)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x1000) != 0)
  {
    goto LABEL_88;
  }
  dataUrl = self->_dataUrl;
  if ((unint64_t)dataUrl | *((void *)v4 + 12) && !-[NSString isEqual:](dataUrl, "isEqual:")) {
    goto LABEL_88;
  }
  eqPreset = self->_eqPreset;
  if ((unint64_t)eqPreset | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](eqPreset, "isEqual:")) {
      goto LABEL_88;
    }
  }
  playbackFormat = self->_playbackFormat;
  if ((unint64_t)playbackFormat | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](playbackFormat, "isEqual:")) {
      goto LABEL_88;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 66);
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_gaplessHeuristicCode != *((void *)v4 + 4)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_gaplessHeuristicDelayCode != *((void *)v4 + 5)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_gaplessEncodingDrainCode != *((void *)v4 + 2)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_gaplessFrameResyncCode != *((void *)v4 + 3)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x4000) == 0 || self->_relativeVolume != *((_DWORD *)v4 + 31)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x4000) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x8000) == 0 || self->_sampleRate != *((_DWORD *)v4 + 32)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x8000) != 0)
  {
LABEL_88:
    BOOL v10 = 0;
    goto LABEL_89;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_startTime != *((void *)v4 + 6)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_stopTime != *((void *)v4 + 7)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_volumeNormalizationEnergy != *((void *)v4 + 8)) {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0 || self->_beatsPerMinute != *((_DWORD *)v4 + 18)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x2000) == 0 || self->_progressionDirection != *((_DWORD *)v4 + 30)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x2000) != 0)
  {
    goto LABEL_88;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_durationInSamples != *((void *)v4 + 1)) {
      goto LABEL_88;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v9 & 1) == 0;
  }
LABEL_89:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_bitRate;
    *(_WORD *)(v5 + 132) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 84) = self->_codecType;
  *(_WORD *)(v5 + 132) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  *(_DWORD *)(v5 + 80) = self->_codecSubType;
  *(_WORD *)(v5 + 132) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 88) = self->_dataKind;
    *(_WORD *)(v5 + 132) |= 0x1000u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_dataUrl copyWithZone:a3];
  __int16 v9 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v8;

  uint64_t v10 = [(NSString *)self->_eqPreset copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v10;

  uint64_t v12 = [(NSString *)self->_playbackFormat copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v12;

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_gaplessHeuristicCode;
    *(_WORD *)(v6 + 132) |= 8u;
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_8:
      if ((v14 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_26;
    }
  }
  else if ((v14 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  *(void *)(v6 + 40) = self->_gaplessHeuristicDelayCode;
  *(_WORD *)(v6 + 132) |= 0x10u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 2) == 0)
  {
LABEL_9:
    if ((v14 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(void *)(v6 + 16) = self->_gaplessEncodingDrainCode;
  *(_WORD *)(v6 + 132) |= 2u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) == 0)
  {
LABEL_10:
    if ((v14 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(void *)(v6 + 24) = self->_gaplessFrameResyncCode;
  *(_WORD *)(v6 + 132) |= 4u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x4000) == 0)
  {
LABEL_11:
    if ((v14 & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 124) = self->_relativeVolume;
  *(_WORD *)(v6 + 132) |= 0x4000u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x8000) == 0)
  {
LABEL_12:
    if ((v14 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 128) = self->_sampleRate;
  *(_WORD *)(v6 + 132) |= 0x8000u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_13:
    if ((v14 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(void *)(v6 + 48) = self->_startTime;
  *(_WORD *)(v6 + 132) |= 0x20u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x40) == 0)
  {
LABEL_14:
    if ((v14 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v6 + 56) = self->_stopTime;
  *(_WORD *)(v6 + 132) |= 0x40u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_15:
    if ((v14 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v6 + 64) = self->_volumeNormalizationEnergy;
  *(_WORD *)(v6 + 132) |= 0x80u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x100) == 0)
  {
LABEL_16:
    if ((v14 & 0x2000) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    *(_DWORD *)(v6 + 120) = self->_progressionDirection;
    *(_WORD *)(v6 + 132) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_18;
  }
LABEL_33:
  *(_DWORD *)(v6 + 72) = self->_beatsPerMinute;
  *(_WORD *)(v6 + 132) |= 0x100u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x2000) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if (v14)
  {
LABEL_18:
    *(void *)(v6 + 8) = self->_durationInSamples;
    *(_WORD *)(v6 + 132) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[19] = self->_bitRate;
    *((_WORD *)v4 + 66) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[21] = self->_codecType;
  *((_WORD *)v4 + 66) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  v4[20] = self->_codecSubType;
  *((_WORD *)v4 + 66) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    v4[22] = self->_dataKind;
    *((_WORD *)v4 + 66) |= 0x1000u;
  }
LABEL_6:
  NSUInteger v7 = v4;
  if (self->_dataUrl)
  {
    objc_msgSend(v4, "setDataUrl:");
    id v4 = v7;
  }
  if (self->_eqPreset)
  {
    objc_msgSend(v7, "setEqPreset:");
    id v4 = v7;
  }
  if (self->_playbackFormat)
  {
    objc_msgSend(v7, "setPlaybackFormat:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((void *)v4 + 4) = self->_gaplessHeuristicCode;
    *((_WORD *)v4 + 66) |= 8u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_14:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  *((void *)v4 + 5) = self->_gaplessHeuristicDelayCode;
  *((_WORD *)v4 + 66) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 2) = self->_gaplessEncodingDrainCode;
  *((_WORD *)v4 + 66) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 3) = self->_gaplessFrameResyncCode;
  *((_WORD *)v4 + 66) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[31] = self->_relativeVolume;
  *((_WORD *)v4 + 66) |= 0x4000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[32] = self->_sampleRate;
  *((_WORD *)v4 + 66) |= 0x8000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)v4 + 6) = self->_startTime;
  *((_WORD *)v4 + 66) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)v4 + 7) = self->_stopTime;
  *((_WORD *)v4 + 66) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v4 + 8) = self->_volumeNormalizationEnergy;
  *((_WORD *)v4 + 66) |= 0x80u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_42;
  }
LABEL_41:
  v4[18] = self->_beatsPerMinute;
  *((_WORD *)v4 + 66) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((v6 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_42:
  v4[30] = self->_progressionDirection;
  *((_WORD *)v4 + 66) |= 0x2000u;
  if (*(_WORD *)&self->_has)
  {
LABEL_24:
    *((void *)v4 + 1) = self->_durationInSamples;
    *((_WORD *)v4 + 66) |= 1u;
  }
LABEL_25:
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_dataUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_eqPreset) {
    PBDataWriterWriteStringField();
  }
  if (self->_playbackFormat) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x10) == 0)
    {
LABEL_14:
      if ((v5 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteInt64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_19:
    if ((v5 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_20:
    if ((v5 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x80) == 0)
  {
LABEL_21:
    if ((v5 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x2000) == 0)
  {
LABEL_23:
    if ((v5 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  if (*(_WORD *)&self->_has) {
LABEL_24:
  }
    PBDataWriterWriteInt64Field();
LABEL_25:
}

- (BOOL)readFrom:(id)a3
{
  return MIPPlaybackInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v12 = [NSNumber numberWithInt:self->_bitRate];
    [v3 setObject:v12 forKey:@"bitRate"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v13 = [NSNumber numberWithInt:self->_codecType];
  [v3 setObject:v13 forKey:@"codecType"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_30:
  __int16 v14 = [NSNumber numberWithInt:self->_codecSubType];
  [v3 setObject:v14 forKey:@"codecSubType"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_5:
    __int16 v5 = [NSNumber numberWithInt:self->_dataKind];
    [v3 setObject:v5 forKey:@"dataKind"];
  }
LABEL_6:
  dataUrl = self->_dataUrl;
  if (dataUrl) {
    [v3 setObject:dataUrl forKey:@"dataUrl"];
  }
  eqPreset = self->_eqPreset;
  if (eqPreset) {
    [v3 setObject:eqPreset forKey:@"eqPreset"];
  }
  playbackFormat = self->_playbackFormat;
  if (playbackFormat) {
    [v3 setObject:playbackFormat forKey:@"playbackFormat"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    uint64_t v15 = [NSNumber numberWithLongLong:self->_gaplessHeuristicCode];
    [v3 setObject:v15 forKey:@"gaplessHeuristicCode"];

    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x10) == 0)
    {
LABEL_14:
      if ((v9 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  uint64_t v16 = [NSNumber numberWithLongLong:self->_gaplessHeuristicDelayCode];
  [v3 setObject:v16 forKey:@"gaplessHeuristicDelayCode"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 2) == 0)
  {
LABEL_15:
    if ((v9 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v17 = [NSNumber numberWithLongLong:self->_gaplessEncodingDrainCode];
  [v3 setObject:v17 forKey:@"gaplessEncodingDrainCode"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v18 = [NSNumber numberWithLongLong:self->_gaplessFrameResyncCode];
  [v3 setObject:v18 forKey:@"gaplessFrameResyncCode"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v19 = [NSNumber numberWithInt:self->_relativeVolume];
  [v3 setObject:v19 forKey:@"relativeVolume"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x8000) == 0)
  {
LABEL_18:
    if ((v9 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v20 = [NSNumber numberWithInt:self->_sampleRate];
  [v3 setObject:v20 forKey:@"sampleRate"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x20) == 0)
  {
LABEL_19:
    if ((v9 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v21 = [NSNumber numberWithLongLong:self->_startTime];
  [v3 setObject:v21 forKey:@"startTime"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_20:
    if ((v9 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v22 = [NSNumber numberWithLongLong:self->_stopTime];
  [v3 setObject:v22 forKey:@"stopTime"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_21:
    if ((v9 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = [NSNumber numberWithLongLong:self->_volumeNormalizationEnergy];
  [v3 setObject:v23 forKey:@"volumeNormalizationEnergy"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_22:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_42;
  }
LABEL_41:
  v24 = [NSNumber numberWithInt:self->_beatsPerMinute];
  [v3 setObject:v24 forKey:@"beatsPerMinute"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x2000) == 0)
  {
LABEL_23:
    if ((v9 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_42:
  v25 = [NSNumber numberWithInt:self->_progressionDirection];
  [v3 setObject:v25 forKey:@"progressionDirection"];

  if (*(_WORD *)&self->_has)
  {
LABEL_24:
    uint64_t v10 = [NSNumber numberWithLongLong:self->_durationInSamples];
    [v3 setObject:v10 forKey:@"durationInSamples"];
  }
LABEL_25:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPPlaybackInfo;
  id v4 = [(MIPPlaybackInfo *)&v8 description];
  __int16 v5 = [(MIPPlaybackInfo *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDurationInSamples
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasDurationInSamples:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setDurationInSamples:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_durationInSamples = a3;
}

- (BOOL)hasProgressionDirection
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasProgressionDirection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setProgressionDirection:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_progressionDirection = a3;
}

- (BOOL)hasBeatsPerMinute
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasBeatsPerMinute:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setBeatsPerMinute:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_beatsPerMinute = a3;
}

- (BOOL)hasVolumeNormalizationEnergy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasVolumeNormalizationEnergy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setVolumeNormalizationEnergy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_volumeNormalizationEnergy = a3;
}

- (BOOL)hasStopTime
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasStopTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setStopTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_stopTime = a3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_startTime = a3;
}

- (BOOL)hasSampleRate
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasSampleRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (void)setSampleRate:(int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_sampleRate = a3;
}

- (BOOL)hasRelativeVolume
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasRelativeVolume:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)setRelativeVolume:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_relativeVolume = a3;
}

- (BOOL)hasGaplessFrameResyncCode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasGaplessFrameResyncCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setGaplessFrameResyncCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_gaplessFrameResyncCode = a3;
}

- (BOOL)hasGaplessEncodingDrainCode
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasGaplessEncodingDrainCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setGaplessEncodingDrainCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_gaplessEncodingDrainCode = a3;
}

- (BOOL)hasGaplessHeuristicDelayCode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasGaplessHeuristicDelayCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setGaplessHeuristicDelayCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gaplessHeuristicDelayCode = a3;
}

- (BOOL)hasGaplessHeuristicCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasGaplessHeuristicCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setGaplessHeuristicCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_gaplessHeuristicCode = a3;
}

- (BOOL)hasPlaybackFormat
{
  return self->_playbackFormat != 0;
}

- (BOOL)hasEqPreset
{
  return self->_eqPreset != 0;
}

- (BOOL)hasDataUrl
{
  return self->_dataUrl != 0;
}

- (BOOL)hasDataKind
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasDataKind:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setDataKind:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_dataKind = a3;
}

- (BOOL)hasCodecSubType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasCodecSubType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setCodecSubType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_codecSubType = a3;
}

- (BOOL)hasCodecType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasCodecType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setCodecType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_codecType = a3;
}

- (BOOL)hasBitRate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasBitRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setBitRate:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_bitRate = a3;
}

@end