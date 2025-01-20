@interface AWDWifiCallingCallEndReport
- (BOOL)hasCallID;
- (BOOL)hasDlVocoderBitRate;
- (BOOL)hasFrameErasureRateMean;
- (BOOL)hasJitterBufferResidencyTime95Percentile;
- (BOOL)hasJitterBufferResidencyTimeMean;
- (BOOL)hasJitterBufferResidencyTimeMedian;
- (BOOL)hasJitterBufferUnderflowRateMean;
- (BOOL)hasRatType;
- (BOOL)hasRtpPacketLossRateMean;
- (BOOL)hasTimestamp;
- (BOOL)hasUlVocoderBitRate;
- (BOOL)hasVocoderSampleRate;
- (BOOL)hasVocoderType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)callID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)frameErasureRateHistogramsCount;
- (unint64_t)hash;
- (unint64_t)jitterBufferResidencyTimeHistogramsCount;
- (unint64_t)jitterBufferUnderflowRateHistogramsCount;
- (unint64_t)rtpPacketLossRateHistogramsCount;
- (unint64_t)timestamp;
- (unsigned)dlVocoderBitRate;
- (unsigned)frameErasureRateHistogramAtIndex:(unint64_t)a3;
- (unsigned)frameErasureRateHistograms;
- (unsigned)frameErasureRateMean;
- (unsigned)jitterBufferResidencyTime95Percentile;
- (unsigned)jitterBufferResidencyTimeHistogramAtIndex:(unint64_t)a3;
- (unsigned)jitterBufferResidencyTimeHistograms;
- (unsigned)jitterBufferResidencyTimeMean;
- (unsigned)jitterBufferResidencyTimeMedian;
- (unsigned)jitterBufferUnderflowRateHistogramAtIndex:(unint64_t)a3;
- (unsigned)jitterBufferUnderflowRateHistograms;
- (unsigned)jitterBufferUnderflowRateMean;
- (unsigned)ratType;
- (unsigned)rtpPacketLossRateHistogramAtIndex:(unint64_t)a3;
- (unsigned)rtpPacketLossRateHistograms;
- (unsigned)rtpPacketLossRateMean;
- (unsigned)ulVocoderBitRate;
- (unsigned)vocoderSampleRate;
- (unsigned)vocoderType;
- (void)addFrameErasureRateHistogram:(unsigned int)a3;
- (void)addJitterBufferResidencyTimeHistogram:(unsigned int)a3;
- (void)addJitterBufferUnderflowRateHistogram:(unsigned int)a3;
- (void)addRtpPacketLossRateHistogram:(unsigned int)a3;
- (void)clearFrameErasureRateHistograms;
- (void)clearJitterBufferResidencyTimeHistograms;
- (void)clearJitterBufferUnderflowRateHistograms;
- (void)clearRtpPacketLossRateHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCallID:(id)a3;
- (void)setDlVocoderBitRate:(unsigned int)a3;
- (void)setFrameErasureRateHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFrameErasureRateMean:(unsigned int)a3;
- (void)setHasDlVocoderBitRate:(BOOL)a3;
- (void)setHasFrameErasureRateMean:(BOOL)a3;
- (void)setHasJitterBufferResidencyTime95Percentile:(BOOL)a3;
- (void)setHasJitterBufferResidencyTimeMean:(BOOL)a3;
- (void)setHasJitterBufferResidencyTimeMedian:(BOOL)a3;
- (void)setHasJitterBufferUnderflowRateMean:(BOOL)a3;
- (void)setHasRatType:(BOOL)a3;
- (void)setHasRtpPacketLossRateMean:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUlVocoderBitRate:(BOOL)a3;
- (void)setHasVocoderSampleRate:(BOOL)a3;
- (void)setHasVocoderType:(BOOL)a3;
- (void)setJitterBufferResidencyTime95Percentile:(unsigned int)a3;
- (void)setJitterBufferResidencyTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setJitterBufferResidencyTimeMean:(unsigned int)a3;
- (void)setJitterBufferResidencyTimeMedian:(unsigned int)a3;
- (void)setJitterBufferUnderflowRateHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setJitterBufferUnderflowRateMean:(unsigned int)a3;
- (void)setRatType:(unsigned int)a3;
- (void)setRtpPacketLossRateHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRtpPacketLossRateMean:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUlVocoderBitRate:(unsigned int)a3;
- (void)setVocoderSampleRate:(unsigned int)a3;
- (void)setVocoderType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiCallingCallEndReport

- (void)dealloc
{
  [(AWDWifiCallingCallEndReport *)self setCallID:0];
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiCallingCallEndReport;
  [(AWDWifiCallingCallEndReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasCallID
{
  return self->_callID != 0;
}

- (unint64_t)rtpPacketLossRateHistogramsCount
{
  return self->_rtpPacketLossRateHistograms.count;
}

- (unsigned)rtpPacketLossRateHistograms
{
  return self->_rtpPacketLossRateHistograms.list;
}

- (void)clearRtpPacketLossRateHistograms
{
}

- (void)addRtpPacketLossRateHistogram:(unsigned int)a3
{
}

- (unsigned)rtpPacketLossRateHistogramAtIndex:(unint64_t)a3
{
  p_rtpPacketLossRateHistograms = &self->_rtpPacketLossRateHistograms;
  unint64_t count = self->_rtpPacketLossRateHistograms.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_rtpPacketLossRateHistograms->list[a3];
}

- (void)setRtpPacketLossRateHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)jitterBufferUnderflowRateHistogramsCount
{
  return self->_jitterBufferUnderflowRateHistograms.count;
}

- (unsigned)jitterBufferUnderflowRateHistograms
{
  return self->_jitterBufferUnderflowRateHistograms.list;
}

- (void)clearJitterBufferUnderflowRateHistograms
{
}

- (void)addJitterBufferUnderflowRateHistogram:(unsigned int)a3
{
}

- (unsigned)jitterBufferUnderflowRateHistogramAtIndex:(unint64_t)a3
{
  p_jitterBufferUnderflowRateHistograms = &self->_jitterBufferUnderflowRateHistograms;
  unint64_t count = self->_jitterBufferUnderflowRateHistograms.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_jitterBufferUnderflowRateHistograms->list[a3];
}

- (void)setJitterBufferUnderflowRateHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)frameErasureRateHistogramsCount
{
  return self->_frameErasureRateHistograms.count;
}

- (unsigned)frameErasureRateHistograms
{
  return self->_frameErasureRateHistograms.list;
}

- (void)clearFrameErasureRateHistograms
{
}

- (void)addFrameErasureRateHistogram:(unsigned int)a3
{
}

- (unsigned)frameErasureRateHistogramAtIndex:(unint64_t)a3
{
  p_frameErasureRateHistograms = &self->_frameErasureRateHistograms;
  unint64_t count = self->_frameErasureRateHistograms.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_frameErasureRateHistograms->list[a3];
}

- (void)setFrameErasureRateHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)jitterBufferResidencyTimeHistogramsCount
{
  return self->_jitterBufferResidencyTimeHistograms.count;
}

- (unsigned)jitterBufferResidencyTimeHistograms
{
  return self->_jitterBufferResidencyTimeHistograms.list;
}

- (void)clearJitterBufferResidencyTimeHistograms
{
}

- (void)addJitterBufferResidencyTimeHistogram:(unsigned int)a3
{
}

- (unsigned)jitterBufferResidencyTimeHistogramAtIndex:(unint64_t)a3
{
  p_jitterBufferResidencyTimeHistograms = &self->_jitterBufferResidencyTimeHistograms;
  unint64_t count = self->_jitterBufferResidencyTimeHistograms.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_jitterBufferResidencyTimeHistograms->list[a3];
}

- (void)setJitterBufferResidencyTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRtpPacketLossRateMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rtpPacketLossRateMean = a3;
}

- (void)setHasRtpPacketLossRateMean:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRtpPacketLossRateMean
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setJitterBufferUnderflowRateMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_jitterBufferUnderflowRateMean = a3;
}

- (void)setHasJitterBufferUnderflowRateMean:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasJitterBufferUnderflowRateMean
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFrameErasureRateMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_frameErasureRateMean = a3;
}

- (void)setHasFrameErasureRateMean:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFrameErasureRateMean
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setJitterBufferResidencyTimeMean:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_jitterBufferResidencyTimeMean = a3;
}

- (void)setHasJitterBufferResidencyTimeMean:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasJitterBufferResidencyTimeMean
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setJitterBufferResidencyTimeMedian:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_jitterBufferResidencyTimeMedian = a3;
}

- (void)setHasJitterBufferResidencyTimeMedian:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasJitterBufferResidencyTimeMedian
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setJitterBufferResidencyTime95Percentile:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_jitterBufferResidencyTime95Percentile = a3;
}

- (void)setHasJitterBufferResidencyTime95Percentile:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasJitterBufferResidencyTime95Percentile
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRatType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_ratType = a3;
}

- (void)setHasRatType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRatType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setVocoderType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_vocoderType = a3;
}

- (void)setHasVocoderType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVocoderType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setVocoderSampleRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_vocoderSampleRate = a3;
}

- (void)setHasVocoderSampleRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVocoderSampleRate
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setUlVocoderBitRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ulVocoderBitRate = a3;
}

- (void)setHasUlVocoderBitRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUlVocoderBitRate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDlVocoderBitRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dlVocoderBitRate = a3;
}

- (void)setHasDlVocoderBitRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDlVocoderBitRate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiCallingCallEndReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiCallingCallEndReport description](&v3, sel_description), -[AWDWifiCallingCallEndReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(_WORD *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  callID = self->_callID;
  if (callID) {
    [v3 setObject:callID forKey:@"callID"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"rtpPacketLossRateHistogram"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"jitterBufferUnderflowRateHistogram"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"frameErasureRateHistogram"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"jitterBufferResidencyTimeHistogram"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rtpPacketLossRateMean] forKey:@"rtpPacketLossRateMean"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_jitterBufferUnderflowRateMean] forKey:@"jitterBufferUnderflowRateMean"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_frameErasureRateMean] forKey:@"frameErasureRateMean"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_jitterBufferResidencyTimeMean] forKey:@"jitterBufferResidencyTimeMean"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_jitterBufferResidencyTimeMedian] forKey:@"jitterBufferResidencyTimeMedian"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_jitterBufferResidencyTime95Percentile] forKey:@"jitterBufferResidencyTime95Percentile"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ratType] forKey:@"ratType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_vocoderType] forKey:@"vocoderType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0) {
      goto LABEL_15;
    }
LABEL_27:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ulVocoderBitRate] forKey:@"ulVocoderBitRate"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_16;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_vocoderSampleRate] forKey:@"vocoderSampleRate"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_27;
  }
LABEL_15:
  if ((has & 2) != 0) {
LABEL_16:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dlVocoderBitRate] forKey:@"dlVocoderBitRate"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiCallingCallEndReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_callID) {
    PBDataWriterWriteStringField();
  }
  if (self->_rtpPacketLossRateHistograms.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_rtpPacketLossRateHistograms.count);
  }
  if (self->_jitterBufferUnderflowRateHistograms.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_jitterBufferUnderflowRateHistograms.count);
  }
  if (self->_frameErasureRateHistograms.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_frameErasureRateHistograms.count);
  }
  if (self->_jitterBufferResidencyTimeHistograms.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_jitterBufferResidencyTimeHistograms.count);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_19:
      if ((has & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_31;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_20:
    if ((has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_21:
    if ((has & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_23:
    if ((has & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_24:
    if ((has & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_25:
    if ((has & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_26:
    if ((has & 0x200) == 0) {
      goto LABEL_27;
    }
LABEL_38:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_39;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_38;
  }
LABEL_27:
  if ((has & 2) == 0) {
    return;
  }
LABEL_39:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(_WORD *)&self->_has)
  {
    *((void *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 82) |= 1u;
  }
  if (self->_callID) {
    [a3 setCallID:];
  }
  if ([(AWDWifiCallingCallEndReport *)self rtpPacketLossRateHistogramsCount])
  {
    [a3 clearRtpPacketLossRateHistograms];
    unint64_t v5 = [(AWDWifiCallingCallEndReport *)self rtpPacketLossRateHistogramsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRtpPacketLossRateHistogram:-[AWDWifiCallingCallEndReport rtpPacketLossRateHistogramAtIndex:](self, "rtpPacketLossRateHistogramAtIndex:", i)];
    }
  }
  if ([(AWDWifiCallingCallEndReport *)self jitterBufferUnderflowRateHistogramsCount])
  {
    [a3 clearJitterBufferUnderflowRateHistograms];
    unint64_t v8 = [(AWDWifiCallingCallEndReport *)self jitterBufferUnderflowRateHistogramsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addJitterBufferUnderflowRateHistogram:-[AWDWifiCallingCallEndReport jitterBufferUnderflowRateHistogramAtIndex:](self, "jitterBufferUnderflowRateHistogramAtIndex:", j)];
    }
  }
  if ([(AWDWifiCallingCallEndReport *)self frameErasureRateHistogramsCount])
  {
    [a3 clearFrameErasureRateHistograms];
    unint64_t v11 = [(AWDWifiCallingCallEndReport *)self frameErasureRateHistogramsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addFrameErasureRateHistogram:-[AWDWifiCallingCallEndReport frameErasureRateHistogramAtIndex:](self, "frameErasureRateHistogramAtIndex:", k)];
    }
  }
  if ([(AWDWifiCallingCallEndReport *)self jitterBufferResidencyTimeHistogramsCount])
  {
    [a3 clearJitterBufferResidencyTimeHistograms];
    unint64_t v14 = [(AWDWifiCallingCallEndReport *)self jitterBufferResidencyTimeHistogramsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addJitterBufferResidencyTimeHistogram:-[AWDWifiCallingCallEndReport jitterBufferResidencyTimeHistogramAtIndex:](self, "jitterBufferResidencyTimeHistogramAtIndex:", m)];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 37) = self->_rtpPacketLossRateMean;
    *((_WORD *)a3 + 82) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)a3 + 35) = self->_jitterBufferUnderflowRateMean;
  *((_WORD *)a3 + 82) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_24:
    if ((has & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 31) = self->_frameErasureRateMean;
  *((_WORD *)a3 + 82) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_25:
    if ((has & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 33) = self->_jitterBufferResidencyTimeMean;
  *((_WORD *)a3 + 82) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_26:
    if ((has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 34) = self->_jitterBufferResidencyTimeMedian;
  *((_WORD *)a3 + 82) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 32) = self->_jitterBufferResidencyTime95Percentile;
  *((_WORD *)a3 + 82) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_28:
    if ((has & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 36) = self->_ratType;
  *((_WORD *)a3 + 82) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_29:
    if ((has & 0x400) == 0) {
      goto LABEL_30;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 40) = self->_vocoderType;
  *((_WORD *)a3 + 82) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 39) = self->_vocoderSampleRate;
  *((_WORD *)a3 + 82) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 2) == 0) {
      return;
    }
    goto LABEL_32;
  }
LABEL_43:
  *((_DWORD *)a3 + 38) = self->_ulVocoderBitRate;
  *((_WORD *)a3 + 82) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return;
  }
LABEL_32:
  *((_DWORD *)a3 + 30) = self->_dlVocoderBitRate;
  *((_WORD *)a3 + 82) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 104) = self->_timestamp;
    *(_WORD *)(v5 + 164) |= 1u;
  }

  *(void *)(v6 + 112) = [(NSString *)self->_callID copyWithZone:a3];
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 148) = self->_rtpPacketLossRateMean;
    *(_WORD *)(v6 + 164) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 140) = self->_jitterBufferUnderflowRateMean;
  *(_WORD *)(v6 + 164) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v6 + 124) = self->_frameErasureRateMean;
  *(_WORD *)(v6 + 164) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 132) = self->_jitterBufferResidencyTimeMean;
  *(_WORD *)(v6 + 164) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 136) = self->_jitterBufferResidencyTimeMedian;
  *(_WORD *)(v6 + 164) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 128) = self->_jitterBufferResidencyTime95Percentile;
  *(_WORD *)(v6 + 164) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 144) = self->_ratType;
  *(_WORD *)(v6 + 164) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v6 + 160) = self->_vocoderType;
  *(_WORD *)(v6 + 164) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
LABEL_25:
    *(_DWORD *)(v6 + 152) = self->_ulVocoderBitRate;
    *(_WORD *)(v6 + 164) |= 0x200u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_14;
  }
LABEL_24:
  *(_DWORD *)(v6 + 156) = self->_vocoderSampleRate;
  *(_WORD *)(v6 + 164) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_25;
  }
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 120) = self->_dlVocoderBitRate;
    *(_WORD *)(v6 + 164) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    __int16 v6 = *((_WORD *)a3 + 82);
    if (*(_WORD *)&self->_has)
    {
      if ((v6 & 1) == 0 || self->_timestamp != *((void *)a3 + 13)) {
        goto LABEL_67;
      }
    }
    else if (v6)
    {
LABEL_67:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    callID = self->_callID;
    if (!((unint64_t)callID | *((void *)a3 + 14)) || (int IsEqual = -[NSString isEqual:](callID, "isEqual:")) != 0)
    {
      int IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        int IsEqual = PBRepeatedUInt32IsEqual();
        if (IsEqual)
        {
          int IsEqual = PBRepeatedUInt32IsEqual();
          if (IsEqual)
          {
            int IsEqual = PBRepeatedUInt32IsEqual();
            if (IsEqual)
            {
              __int16 has = (__int16)self->_has;
              __int16 v9 = *((_WORD *)a3 + 82);
              if ((has & 0x100) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x100) == 0 || self->_rtpPacketLossRateMean != *((_DWORD *)a3 + 37)) {
                  goto LABEL_67;
                }
              }
              else if ((*((_WORD *)a3 + 82) & 0x100) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x40) != 0)
              {
                if ((v9 & 0x40) == 0 || self->_jitterBufferUnderflowRateMean != *((_DWORD *)a3 + 35)) {
                  goto LABEL_67;
                }
              }
              else if ((v9 & 0x40) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 4) != 0)
              {
                if ((v9 & 4) == 0 || self->_frameErasureRateMean != *((_DWORD *)a3 + 31)) {
                  goto LABEL_67;
                }
              }
              else if ((v9 & 4) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x10) != 0)
              {
                if ((v9 & 0x10) == 0 || self->_jitterBufferResidencyTimeMean != *((_DWORD *)a3 + 33)) {
                  goto LABEL_67;
                }
              }
              else if ((v9 & 0x10) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x20) != 0)
              {
                if ((v9 & 0x20) == 0 || self->_jitterBufferResidencyTimeMedian != *((_DWORD *)a3 + 34)) {
                  goto LABEL_67;
                }
              }
              else if ((v9 & 0x20) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 8) != 0)
              {
                if ((v9 & 8) == 0 || self->_jitterBufferResidencyTime95Percentile != *((_DWORD *)a3 + 32)) {
                  goto LABEL_67;
                }
              }
              else if ((v9 & 8) != 0)
              {
                goto LABEL_67;
              }
              if ((has & 0x80) != 0)
              {
                if ((v9 & 0x80) == 0 || self->_ratType != *((_DWORD *)a3 + 36)) {
                  goto LABEL_67;
                }
              }
              else if ((v9 & 0x80) != 0)
              {
                goto LABEL_67;
              }
              if ((*(_WORD *)&self->_has & 0x800) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x800) == 0 || self->_vocoderType != *((_DWORD *)a3 + 40)) {
                  goto LABEL_67;
                }
              }
              else if ((*((_WORD *)a3 + 82) & 0x800) != 0)
              {
                goto LABEL_67;
              }
              if ((*(_WORD *)&self->_has & 0x400) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x400) == 0 || self->_vocoderSampleRate != *((_DWORD *)a3 + 39)) {
                  goto LABEL_67;
                }
              }
              else if ((*((_WORD *)a3 + 82) & 0x400) != 0)
              {
                goto LABEL_67;
              }
              if ((*(_WORD *)&self->_has & 0x200) != 0)
              {
                if ((*((_WORD *)a3 + 82) & 0x200) == 0 || self->_ulVocoderBitRate != *((_DWORD *)a3 + 38)) {
                  goto LABEL_67;
                }
              }
              else if ((*((_WORD *)a3 + 82) & 0x200) != 0)
              {
                goto LABEL_67;
              }
              LOBYTE(IsEqual) = (v9 & 2) == 0;
              if ((has & 2) != 0)
              {
                if ((v9 & 2) == 0 || self->_dlVocoderBitRate != *((_DWORD *)a3 + 30)) {
                  goto LABEL_67;
                }
                LOBYTE(IsEqual) = 1;
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_callID hash];
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = PBRepeatedUInt32Hash();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v10 = 2654435761 * self->_rtpPacketLossRateMean;
    if ((has & 0x40) != 0)
    {
LABEL_6:
      uint64_t v11 = 2654435761 * self->_jitterBufferUnderflowRateMean;
      if ((has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v12 = 2654435761 * self->_frameErasureRateMean;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v13 = 2654435761 * self->_jitterBufferResidencyTimeMean;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v14 = 2654435761 * self->_jitterBufferResidencyTimeMedian;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    uint64_t v15 = 2654435761 * self->_jitterBufferResidencyTime95Percentile;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v15 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v16 = 2654435761 * self->_ratType;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    uint64_t v17 = 2654435761 * self->_vocoderType;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    uint64_t v18 = 2654435761 * self->_vocoderSampleRate;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_14;
    }
LABEL_25:
    uint64_t v19 = 0;
    if ((has & 2) != 0) {
      goto LABEL_15;
    }
LABEL_26:
    uint64_t v20 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_24:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_25;
  }
LABEL_14:
  uint64_t v19 = 2654435761 * self->_ulVocoderBitRate;
  if ((has & 2) == 0) {
    goto LABEL_26;
  }
LABEL_15:
  uint64_t v20 = 2654435761 * self->_dlVocoderBitRate;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  if (*((_WORD *)a3 + 82))
  {
    self->_timestamp = *((void *)a3 + 13);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 14)) {
    -[AWDWifiCallingCallEndReport setCallID:](self, "setCallID:");
  }
  uint64_t v5 = [a3 rtpPacketLossRateHistogramsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWifiCallingCallEndReport addRtpPacketLossRateHistogram:](self, "addRtpPacketLossRateHistogram:", [a3 rtpPacketLossRateHistogramAtIndex:i]);
  }
  uint64_t v8 = [a3 jitterBufferUnderflowRateHistogramsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWifiCallingCallEndReport addJitterBufferUnderflowRateHistogram:](self, "addJitterBufferUnderflowRateHistogram:", [a3 jitterBufferUnderflowRateHistogramAtIndex:j]);
  }
  uint64_t v11 = [a3 frameErasureRateHistogramsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDWifiCallingCallEndReport addFrameErasureRateHistogram:](self, "addFrameErasureRateHistogram:", [a3 frameErasureRateHistogramAtIndex:k]);
  }
  uint64_t v14 = [a3 jitterBufferResidencyTimeHistogramsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDWifiCallingCallEndReport addJitterBufferResidencyTimeHistogram:](self, "addJitterBufferResidencyTimeHistogram:", [a3 jitterBufferResidencyTimeHistogramAtIndex:m]);
  }
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x100) != 0)
  {
    self->_rtpPacketLossRateMean = *((_DWORD *)a3 + 37);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v17 = *((_WORD *)a3 + 82);
    if ((v17 & 0x40) == 0)
    {
LABEL_19:
      if ((v17 & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  self->_jitterBufferUnderflowRateMean = *((_DWORD *)a3 + 35);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 4) == 0)
  {
LABEL_20:
    if ((v17 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_frameErasureRateMean = *((_DWORD *)a3 + 31);
  *(_WORD *)&self->_has |= 4u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x10) == 0)
  {
LABEL_21:
    if ((v17 & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_jitterBufferResidencyTimeMean = *((_DWORD *)a3 + 33);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x20) == 0)
  {
LABEL_22:
    if ((v17 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_jitterBufferResidencyTimeMedian = *((_DWORD *)a3 + 34);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 8) == 0)
  {
LABEL_23:
    if ((v17 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_jitterBufferResidencyTime95Percentile = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 8u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x80) == 0)
  {
LABEL_24:
    if ((v17 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_ratType = *((_DWORD *)a3 + 36);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x800) == 0)
  {
LABEL_25:
    if ((v17 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_vocoderType = *((_DWORD *)a3 + 40);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x400) == 0)
  {
LABEL_26:
    if ((v17 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_vocoderSampleRate = *((_DWORD *)a3 + 39);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v17 = *((_WORD *)a3 + 82);
  if ((v17 & 0x200) == 0)
  {
LABEL_27:
    if ((v17 & 2) == 0) {
      return;
    }
    goto LABEL_28;
  }
LABEL_39:
  self->_ulVocoderBitRate = *((_DWORD *)a3 + 38);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 82) & 2) == 0) {
    return;
  }
LABEL_28:
  self->_dlVocoderBitRate = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callID
{
  return self->_callID;
}

- (void)setCallID:(id)a3
{
}

- (unsigned)rtpPacketLossRateMean
{
  return self->_rtpPacketLossRateMean;
}

- (unsigned)jitterBufferUnderflowRateMean
{
  return self->_jitterBufferUnderflowRateMean;
}

- (unsigned)frameErasureRateMean
{
  return self->_frameErasureRateMean;
}

- (unsigned)jitterBufferResidencyTimeMean
{
  return self->_jitterBufferResidencyTimeMean;
}

- (unsigned)jitterBufferResidencyTimeMedian
{
  return self->_jitterBufferResidencyTimeMedian;
}

- (unsigned)jitterBufferResidencyTime95Percentile
{
  return self->_jitterBufferResidencyTime95Percentile;
}

- (unsigned)ratType
{
  return self->_ratType;
}

- (unsigned)vocoderType
{
  return self->_vocoderType;
}

- (unsigned)vocoderSampleRate
{
  return self->_vocoderSampleRate;
}

- (unsigned)ulVocoderBitRate
{
  return self->_ulVocoderBitRate;
}

- (unsigned)dlVocoderBitRate
{
  return self->_dlVocoderBitRate;
}

@end